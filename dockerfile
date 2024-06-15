FROM rust:1.75 as builder

WORKDIR /usr/src/kt2

COPY ./Cargo.toml ./Cargo.toml
COPY ./Cargo.lock ./Cargo.lock

RUN mkdir src && \
    echo "fn main() {println!(\"If you see this, something messed up.\");}" > src/main.rs

RUN cargo build --release

RUN rm -rf ./src ./target/release/deps/kt2*

COPY ./src ./src

RUN cargo build --release

FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y libssl3 ca-certificates && rm -rf /var/lib/apt/lists/*

WORKDIR /kt2

COPY --from=builder /usr/src/kt2/target/release/kt2 .

RUN chmod +x kt2

CMD ["./kt2"]
