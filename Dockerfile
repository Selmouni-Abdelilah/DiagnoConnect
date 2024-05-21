FROM python:3.10-slim-bullseye

WORKDIR /
WORKDIR /code

COPY requirements.txt .

RUN apt-get update && \
    apt-get install -y libgl1-mesa-glx libglib2.0-0 libsm6 libxrender1 libxext6 libgl1
RUN pip3 install -r requirements.txt --default-timeout=5000

COPY . .

EXPOSE 50505

ENTRYPOINT ["gunicorn", "app:app"]