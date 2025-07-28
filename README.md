# Zero-Downtime Node.js App with PM2 in Docker

This setup ensures that a Node.js application runs with **PM2 inside Docker**, and continues serving requests **without failure**, even when code changes are made on the fly.

---

## 🧱 Project Structure
<img width="221" height="279" alt="image" src="https://github.com/user-attachments/assets/26641146-4fa7-41d0-99fa-93d693d87540" />

---


---

## 🐳 Step-by-Step Setup

### 1. **Build the Docker Image**

```bash
 docker-compose up --build -d
```

### 2. **ChecK pm2 is running**


<img width="1129" height="185" alt="image" src="https://github.com/user-attachments/assets/ea7c2635-c8fe-41e7-8ef7-8f4336c6989e" />


#### In docker container app is online
<img width="1301" height="232" alt="image" src="https://github.com/user-attachments/assets/016d6b41-c3b9-4e8b-8a68-d6dae98c7ec4" />

### 3. Continuos request 
#### in another terminal , continuos request are being made
``` bash
while ($true) { curl http://localhost:3000; Start-Sleep -Seconds 1; Clear-Host }
```

<img width="1170" height="316" alt="image" src="https://github.com/user-attachments/assets/bb5af90c-46d7-461d-b5b2-d3ba56333910" />


### 4.  Making Live Code Changes
#### Edit the app live



<img width="1309" height="472" alt="image" src="https://github.com/user-attachments/assets/c48f7313-c25d-463d-8a6f-379c40a19e41" />


### 5. Reloading the app

<img width="642" height="73" alt="image" src="https://github.com/user-attachments/assets/e2b0b9cd-2b34-4049-80c1-ca7f732035f2" />

### 6. Then , in continuous requests, the content got updated without disruption 


<img width="1150" height="391" alt="image" src="https://github.com/user-attachments/assets/e2b38de5-49f9-405d-88ab-10b286e1fdca" />

<img width="896" height="237" alt="image" src="https://github.com/user-attachments/assets/90234c15-422c-459e-b1f1-0d8af9ab44f3" />


### NGINX Will Do
#### Sends requests to localhost:3000 ( to Node app inside Docker)

##### With NGINX:
```nginx


User ──(HTTPS on port 443)──> NGINX ──> Docker:3000


```

### ✅ Step 1: User sends a request
Example: The user visits http://localhost:3000/

This hits port 443, which is the standard port for HTTPS

The user doesn't know what server, port, or technology is behind it

### ✅ Step 2: NGINX receives the request
NGINX is listening on port 443 for HTTPS (and  80 for HTTP)

It terminates the SSL/TLS: This means it decrypts the HTTPS request so it can forward the actual HTTP request

NGINX acts like a gateway

### ✅ Step 3: NGINX forwards request to Docker
NGINX is configured as a reverse proxy

It takes the decrypted request and sends it to:

Here, localhost:3000 is the port where your Node.js app (inside Docker) is running

NGINX doesn't care what’s behind it — it could be Node, Python, or even a static file server

### ✅ Step 4: Docker container (Node app) handles the request
The app receives it like a normal request

It processes and responds (HTML, JSON, etc.)

### ✅ Step 5: NGINX returns response to the user
The Node app sends back the response to NGINX

NGINX encrypts it again (for HTTPS) and returns it to the user’s browser

### 🔒  Port 443?
Port 443 is the standard for HTTPS

Without NGINX, users have to expose 3000 publicly — which is not secure or user-friendly

With NGINX, users just use your domain securely, no matter where the app runs internally

### 📦 Why Docker:3000?
That’s the internal port our Node app listens on inside the container

Docker exposes it, but only NGINX knows about it

To the outside world, it’s hidden — better for security


### NGINX acts as a secure front gate: It accepts encrypted traffic on port 443 and safely passes it to your Node app running inside Docker on port 3000.
