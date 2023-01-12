FROM python:${{ inputs.python-version }}-buster

RUN apk add build-base

ADD entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
