
FROM gcc:latest AS builder

WORKDIR /app
COPY docker_message.c .
RUN gcc -o docker_message docker_message.c


FROM debian:bookworm-slim  

WORKDIR /app
COPY --from=builder /app/docker_message /usr/local/bin/docker_message

CMD ["/usr/local/bin/docker_message"]

