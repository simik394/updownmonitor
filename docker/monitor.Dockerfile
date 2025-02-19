# Use the official Julia base image
FROM julia:1.10
# Or specify the desired Julia version

# Set a working directory inside the container
WORKDIR /app

# Copy your Julia project files (including the .jl file and any other dependencies)
COPY . /app
# Copies everything in the current directory to /app in the container

# Install required Julia packages (if any) - this is crucial!
RUN julia -e 'using Pkg; Pkg.add(["HTTP", "JSON", "Dates", "CSV", "DataFrames", "SHA", "Parquet"])'

# Precompile packages for faster startup
RUN julia -e 'using HTTP, JSON, Dates, CSV, DataFrames, SHA, Parquet'
# CMD ["bash"]
# Set the command to run when the container starts.  This assumes your main file is named binance_margin_trades.jl
CMD ["julia", "src/readbinws.jl"]
# Or the name of your Julia script
