FROM public.ecr.aws/lambda/python:3.9
WORKDIR /app
COPY ./ /app
RUN pip3 install -r requirements.txt
ENTRYPOINT ["./entrypoint.sh"]
