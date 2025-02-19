
using HTTP
using JSON

function binance_websocket_trades(symbol::String)
    url = "wss://stream.binance.com:9443/ws/$symbol@aggTrade"
    println("Připojování k Binance WebSocket: $url")

    HTTP.WebSockets.open(url) do ws
        for msg in ws
            println(msg)
        end
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
binance_websocket_trades("btcusdt")

