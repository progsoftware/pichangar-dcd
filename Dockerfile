ARG DCD_BASE_IMAGE=ghcr.io/progsoftware/dcd:v0.1.3

FROM $DCD_BASE_IMAGE AS dcd

FROM ghcr.io/opentofu/opentofu:1.6.2

COPY --from=dcd /dcd /dcd

RUN apk add -U --no-cache docker-cli

ENTRYPOINT [ "/dcd/entrypoint.sh" ]

