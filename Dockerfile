FROM debian:stable

LABEL org.label-schema.name="autotag" \
      org.label-schema.url="https://github.com/ataiko/autotag" \
      org.label-schema.vcs-url="https://github.com/ataiko/autotag.git"

RUN apt-get update && \
    apt-get install -y curl git

RUN curl -L https://github.com/pantheon-systems/autotag/releases/download/1.1.1/Linux \
    --output /bin/autotag

RUN chmod +x /bin/autotag

ENTRYPOINT ["/bin/autotag"]
