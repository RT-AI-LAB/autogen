FROM python:3.11-bullseye

ENV PYTHONUNBUFFERED=1
WORKDIR /usr/src/app

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
    build-essential \
    libffi-dev \
    libssl-dev \
    curl \
    vim \
    && rm -rf /var/lib/apt/lists/*

COPY requirements.txt ./

RUN python3 -m venv env
RUN ./env/bin/pip install --upgrade pip \
    && ./env/bin/pip install --no-cache-dir -r requirements.txt

EXPOSE 8000

COPY . .

CMD ["sh", "-c", "./env/bin/python /app/hello.py && tail -f /dev/null"]


# CMD ["./env/bin/python", "/app/hello.py && tail -f /dev/null"]
# CMD ["./env/bin/python", "/app/hello.py"]