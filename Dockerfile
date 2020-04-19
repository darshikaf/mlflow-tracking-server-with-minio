FROM python:3.7

RUN pip install mlflow==1.7.2 && \
    pip install boto3==1.9.240

ENV PORT 5500

COPY run.sh /

ENTRYPOINT ["/run.sh"]