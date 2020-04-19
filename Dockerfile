FROM python:3.7

RUN pip install mlflow==1.7.2 && \
    pip install boto3==1.9.240

ENV PORT 5000
# ENV AWS_BUCKET bucket
# ENV AWS_ACCESS_KEY_ID aws_id
# ENV AWS_SECRET_ACCESS_KEY aws_key

COPY run.sh /

ENTRYPOINT ["/run.sh"]