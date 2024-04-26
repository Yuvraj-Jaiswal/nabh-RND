FROM python:latest
RUN mkdir /app
ADD . /app
WORKDIR /app
RUN apt update -y
RUN apt install build-essential libpoppler-cpp-dev pkg-config python3-dev -y
RUN pip install -r requirements.txt
#RUN pip install gevent
#CMD exec gunicorn -b 0.0.0.0:8080 -w 4 app:app
#CMD exec gunicorn -b 0.0.0.0:8080 --worker-class eventlet --workers 1 --timeout 0 --threads 8 app:app
#CMD exec python app.py
CMD exec uvicorn FastapiApp:app --host 0.0.0.0 --port 8080
