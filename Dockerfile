FROM nginx:latest

COPY index.html /usr/share/nginx/html/

EXPOSE 90

CMD ["nginx", "-g", "daemon off;"]