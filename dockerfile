# Stage 1: Builder
FROM rust:1.75 as builder

WORKDIR /usr/src/kt2

# Copy Cargo.toml and Cargo.lock
COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock

# Create an empty src directory and add a placeholder main.rs to build dependencies
RUN mkdir src && \
    echo "fn main() {println!(\"If you see this, something messed up.\");}" > src/main.rs

RUN cargo build --release

# Remove the placeholder and copy the actual source files
RUN rm -rf ./src ./target/release/deps/kt2*

COPY ./src ./src
COPY ./migrations ./migrations

RUN cargo build --release

# Stage 2: Final
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libssl3 ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /kt2

# Copy the built binary and migrations from the builder stage
COPY --from=builder /usr/src/kt2/target/release/kt2 .
COPY --from=builder /usr/src/kt2/migrations ./migrations

# Make the binary executable
RUN chmod +x kt2

# Start the application
CMD ["./kt2"]
