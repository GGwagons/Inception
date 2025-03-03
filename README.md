# **Inception Project**

## **📌 Overview**
The **Inception** project is a **system administration** exercise designed to deepen your understanding of **Docker** and containerization. You will set up a small infrastructure consisting of multiple services running in **Docker containers**, orchestrated using **Docker Compose**.

## **📁 Directory Structure**
```bash
📂 inception/
 ├── 📂 srcs/
 │   ├── 📂 requirements/
 │   │   ├── 📂 mariadb/       # MariaDB Database Container
 │   │   ├── 📂 nginx/         # Nginx Web Server with SSL
 │   │   ├── 📂 wordpress/     # WordPress with PHP-FPM
 │   ├── docker-compose.yml    # Docker Compose File
 │   ├── .env                 # Environment Variables
 ├── Makefile                  # Project Automation
 ├── README.md                 # Project Documentation
```

## **🛠 Services**
- **Nginx** → Serves as the reverse proxy with **TLS encryption** (TLSv1.2/1.3).
- **MariaDB** → The database server, storing WordPress data.
- **WordPress** → A dynamic website running on PHP-FPM.
- **Volumes** → Persistent storage for WordPress files and database data.
- **Custom Network** → Containers communicate over a dedicated Docker network.

## **🚀 Installation & Setup**
### **1️⃣ Install Dependencies**
Ensure your **virtual machine** has **Docker** and **Docker Compose** installed:
```sh
sudo apt update && sudo apt install docker.io docker-compose -y
```

### **2️⃣ Clone the Repository**
```sh
git clone https://github.com/yourusername/inception.git
cd inception
```

### **3️⃣ Configure Environment Variables**
Edit the `.env` file to set up database credentials and domain:
```sh
echo "DOMAIN_NAME=yourlogin.42.fr" >> srcs/.env
echo "MYSQL_DATABASE=wordpress" >> srcs/.env
echo "MYSQL_USER=wp_user" >> srcs/.env
echo "MYSQL_PASSWORD=strongpassword" >> srcs/.env
echo "MYSQL_ROOT_PASSWORD=rootpassword" >> srcs/.env
```

### **4️⃣ Build and Start the Project**
```sh
make up
```
This will **build** and **start** all containers in detached mode.

### **5️⃣ Access Your Website**
- Open **https://yourlogin.42.fr** (or **https://localhost** if testing locally).
- If you see a **certificate warning**, accept the **self-signed SSL certificate**.
- Set up **WordPress** by following the on-screen instructions.

## **🛠 Useful Commands**
| Command | Description |
|---------|-------------|
| `make up` | Builds and starts all containers |
| `make down` | Stops and removes all containers |
| `make re` | Rebuilds everything from scratch |
| `docker ps` | Lists running containers |
| `docker logs nginx` | Shows logs for Nginx |
| `docker exec -it wordpress bash` | Access WordPress container |
