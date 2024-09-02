FROM python:3.8
WORKDIR /code
COPY requirements.txt .
ENV PYTHONUNBUFFERED=1
RUN pip install -r requirements.txt
COPY quotes.py .
CMD [ "python", "./quotes.py" ]