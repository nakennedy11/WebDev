server {
  listen 80;
  listen [::]:80;
  
  root /var/www/bach-webdev1.com/hw01;
  
  index index.html;
  server_name bach-webdev1.com hw01.bach-webdev1.com;

  location / {
    try_files $uri $uri/ =404;
  }
}
