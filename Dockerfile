FROM python:3.12-slim
LABEL AUTHOR="worthy"
WORKDIR /app
RUN pip install flask==3.1.0
COPY . /app
ENV FLASK_APP=app.py
CMD ["flask", "run", "--host=0.0.0.0", "--port=5000"]