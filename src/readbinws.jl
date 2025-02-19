
using HTTP
using JSON
using Parquet
using DataFrames
using Dates

function binance_websocket_trades(symbol::String)
    url = "wss://stream.binance.com:9443/ws/$symbol@trade"
    println("Připojování k Binance WebSocket: $url")

    HTTP.WebSockets.open(url) do ws

        # Initialize an empty DataFrame to accumulate data
        df = DataFrame(
            E=Int64[],
            t=Int64[],
            p=Float64[],
            q=Float64[],
            T=Int64[],
            m=Bool[],
            M=Bool[]
        )
        count = 0
        for msg in ws
            if count == 10
                HTTP.WebSockets.close(ws)
                break
            end

            message_string = String(msg)
            try
                data = JSON.parse(message_string)
                # println("data ", data)
                # println(data["p"])
                delete!(data, "e")
                delete!(data, "s")
                p_float = parse(Float64, data["p"])  # The crucial conversion
                data["p"] = p_float
                q_float = parse(Float64, data["q"])  # The crucial conversion
                data["q"] = q_float
                # delete!(data, "M")
                # delete!(data, "")
                # delete!(data, "")
                push!(df, data)
                count += 1
                #println(df)
                # if haskey(data, "e") # Check if it's a trade message
                #     # Append the new data as a row to the DataFrame
                #     push!(df, data)
                # end
            catch e
                println("Error processing message: ", e)
                println("Problematic message: ", message_string)
            end
        end

        filename = "out/trades_$(symbol)_$(Dates.format(now(), "YYYYMMDD_HHMMSS")).parquet"
        # Write the accumulated DataFrame to a Parquet file *after* the loop
        Parquet.write_parquet(filename, df)
        # for msg in ws
        #     println(msg)
        # end
        #     try
        #         while true
        #             msg = readavailable(ws) |> String
        #             data = JSON.parse(msg)
        #
        #             println("Obdrženo: ", data)
        #
        #             # Ukázka přístupu k jednotlivým polím (např. cena a množství obchodu)
        #             price = parse(Float64, data["p"])
        #             quantity = parse(Float64, data["q"])
        #             println("Cena: $price, Množství: $quantity")
        #         end
        #     catch e
        #         println("Chyba: $e")
        #     end
    end
end
# Volání funkce s požadovaným symbolem (např. "btcusdt" pro Bitcoin/USDT)
@time binance_websocket_trades("btcusdt")

