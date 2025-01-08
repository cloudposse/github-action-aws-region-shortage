FROM public.ecr.aws/docker/library/alpine:3.21.2

RUN apk add bash

ENV GEODESIC_VERSION=1.3.6

ADD https://raw.githubusercontent.com/cloudposse/geodesic/${GEODESIC_VERSION}/rootfs/usr/local/bin/aws-region /usr/local/bin/aws-region

RUN chmod +x /usr/local/bin/aws-region

ENTRYPOINT ["/bin/bash"]

COPY entrypoint.sh /usr/local/bin/entrypoint
CMD [ "-c", "entrypoint" ]
