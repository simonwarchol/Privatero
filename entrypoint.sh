#!/bin/sh
gunicorn -w 2 --threads 2 --access-logfile=- -b 0.0.0.0:80 app:app
