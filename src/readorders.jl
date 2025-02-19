using HTTP, JSON, Dates, CSV, DataFrames, SHA

# Nahraďte těmito údaji vaše skutečné API klíč a secret
const API_KEY = "D13B7SaDuOT2xDuq2eiEhKU5sIDnml6PhgcZNRbx3uuSf7QMHgekGD6in5RDbk0e"
const API_SECRET = "0uwdWtqUS0n8oMPMbxNhoUk0DnwSD22a8ZUdm7mXmVYDRjDfkaqq8E2HNPxiDexa"

const WEBSOCKET_URL = "wss://stream.binance.com:9443/ws"
const SYMBOL = "BTCUSDT"

function stream_and_save_trades(symbol, filename)
    HTTP.open("GET", WEBSOCKET_URL) do ws

        # Correct subscription message format (JSON string)
        subscribe_message = JSON.json(Dict(
            "method" => "SUBSCRIBE",
            "params" => ["$(symbol)@aggTrades"],
            "id" => 1
        ))

        write(ws, subscribe_message) # Send the subscribe message

        csv_file = open(filename, "w")
        CSV.write(csv_file, DataFrame(columns = ["e", "E", "s", "a", "p", "q", "m", "M"]))
        flush(csv_file)

        for msg in ws
            message_string = String(take!(msg.data))  # Correct way to read from socket
            try
                data = JSON.parse(message_string)
                if haskey(data, "e")
                    df = DataFrame([data])
                    CSV.write(csv_file, df, append=true)
                    flush(csv_file)
                end
            catch e
                println("Error processing message: ", e)
                println("Problematic message: ", message_string) # Print the message for debugging
            end
        end

        close(csv_file) # Close the file inside the 'do' block
    end
end


filename = "margin_trades_$(SYMBOL)_$(Dates.format(now(), "YYYYMMDD_HHMMSS")).csv"
stream_and_save_trades(SYMBOL, filename)
