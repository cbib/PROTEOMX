FROM nikolaik/python-nodejs:python3.8-nodejs13
WORKDIR /app
ENV PATH /app/node_modules/.bin:$PATH
COPY requirements.txt /backend/requirements.txt
RUN pip install -r /backend/requirements.txt
COPY frontend/package.json /app/package.json
RUN npm install
RUN npm install -g @angular/cli@7.3.9
COPY frontend/angular.json /app/angular.json
COPY frontend/tsconfig.spec.json /app/tsconfig.spec.json
COPY frontend/tsconfig.app.json /app/tsconfig.app.json
COPY frontend/src/ /app/src
COPY scripts/serve_dev.sh /scripts/serve_dev.sh
COPY scripts/serve_prod.sh /scripts/serve_prod.sh
ENV PYTHONPATH "${PYTHONPATH}:/backend"
CMD ["/scripts/serve_dev.sh"]
