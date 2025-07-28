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


