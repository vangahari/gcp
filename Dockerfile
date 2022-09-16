FROM python:3.9-alpine
WORKDIR /usr/src/app
COPY requirements.txt .
COPY . .
RUN pip3 install -r ./requirements.txt
EXPOSE 3000 5000
ENTRYPOINT ["python3", "app.py"]
