# easy-nginx-docker
Quick, easy-to-use nginx setup. Put your html/css/js files in the project root to serve them.

## Requirements
You need to have Docker installed

## Usage
```
git clone https://github.com/bkestelman/easy-nginx-docker
```
Copy your website files (index.html, css, js, etc.) into easy-nginx-docker/
```
bash run.sh tag [port] 
```

Modifying your site files in easy-nginx-docker/ will change your site in real time. 

You can multiple containers on different ports using the same tag. 

To run different versions of your site, clone easy-nginx-docker again (rename the first one). 
