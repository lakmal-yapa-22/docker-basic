## 📄 Related Documents

- 🔗 https://docs.google.com/document/d/1pQfs7XD-F9b9N-wNjIIchcnRQsuthi2ze2_Ko3emkfA/edit?usp=sharing


# Docker & Port Management Guide 🐳

A comprehensive guide covering port management and Docker containerization for software development.


### How to Stop Applications Running on Specific Ports

#### 1. Find Process Bound to Port

**Linux / macOS:**
```bash
lsof -i :<port-number>
```
Example:
```bash
lsof -i :8080
```

**Windows CMD:**
```cmd
netstat -ano | findstr :<port-number>
```
Example:
```cmd
netstat -ano | findstr :8080
```

➡️ This will return a PID (Process ID)

#### 2. Kill the Process

**Linux / macOS:**
```bash
kill -9 <PID>
```

**Windows CMD:**
```cmd
taskkill /PID <PID> /F
```
Example:
```cmd
taskkill /PID 12345 /F
```

#### For Docker Containers:
```bash
docker ps                    # Check container ID/port
docker stop <container_id>   # Stop the container
```

## 🐳 Docker Introduction

Docker is an open-source platform used in software development to simplify building, testing, deploying, and running applications through containerization.

### What is Docker?

Docker is a containerization platform that allows software to run in "containers" - lightweight, standalone environments that include:

- The application itself
- Required libraries and dependencies
- Configuration files
- Runtime environment
- Environment variables

### What is a Container?

A container is a lightweight, standalone environment that packages your app with everything it needs to run. This means you can "package it once" and run it on any computer without errors.

### Docker Image vs Container

- **Docker Image**: A read-only template/blueprint used to build containers
- **Docker Container**: A living/running instance created from an image

## 🔧 Docker Components

| Component | Description |
|-----------|-------------|
| **Dockerfile** | File containing rules to build an app as a container |
| **Image** | Read-only blueprint created from Dockerfile |
| **Container** | Running version of an image |
| **Docker Hub** | Online registry to store and share Docker images |

## ⚙️ Docker Engine

Docker Engine creates, runs, and stops containers using Linux kernel features (Namespaces, Cgroups) for lightweight virtualization.

## 🌐 Port Mapping

Map host machine ports to container ports:

```bash
docker run -p host-port:container-port image-name
```

Example:
```bash
docker run -p 8080:8080 my-app
```

## 📄 Dockerfile

A Dockerfile contains instructions to build a container:

- Base image (e.g., Java, Python)
- Application code
- Dependency installation commands
- Build/run instructions

**Build an image:**
```bash
docker build -t image-name .
```

## 🐳 Docker Commands

### Image Management
```bash
# List all images
docker images

# Remove an image
docker rmi image-name

# Build an image
docker build -t image-name .
```

### Running Containers
```bash
# Run in normal mode
docker run -p 8080:8080 image-name

# Run in detached mode (background)
docker run -d -p 8080:8080 image-name
```

### Container Management
```bash
# List running containers only
docker ps

# List all containers (running + stopped)
docker ps -a

# Stop a container
docker stop [container-id]

# Remove a container
docker rm [container-id]
```

### Docker Hub Operations

#### Login
```bash
docker login
```

#### Push Image
```bash
# Tag the image
docker tag image-name username/image-name

# Push to Docker Hub
docker push username/image-name
```

#### Pull Image
```bash
# Pull latest version
docker pull username/image-name

# Pull specific tag
docker pull username/image-name:tag
```

#### Run Pulled Image
```bash
docker run -d -p 8090:8080 username/image-name:latest
```

## 🚀 Docker Workflow - Complete Process

1. **🔨 Build Application**
   - Develop your application code

2. **📝 Write Dockerfile**
   - Create Dockerfile with build instructions

3. **🏗️ Build Docker Image**
   ```bash
   docker build -t my-app .
   ```

4. **☁️ Push to Docker Hub**
   ```bash
   docker tag my-app username/my-app
   docker push username/my-app
   ```

5. **📥 Pull Image (on target server)**
   ```bash
   docker pull username/my-app
   ```

6. **🚀 Run as Container**
   ```bash
   docker run -d -p 8080:8080 username/my-app
   ```

## 💡 Benefits of Using Docker

✅ **Platform Independent** - Eliminates "It works on my machine" problems

🐳 **Fast Deployment** - Containers start quickly

🧪 **Easy Testing & Debugging** - Separate environments for development, testing, and production

💾 **Efficient Resource Usage** - Much lighter than traditional virtual machines

## 📚 Tags and Versioning

Docker supports various tags for version management:
- `latest` - Most recent version
- `v1.0`, `v2.0` - Specific version numbers
- `production`, `staging` - Environment-specific tags

Example:
```bash
docker pull username/my-app:v1.0
docker run -d -p 8080:8080 username/my-app:production
```

---

## 🤝 Contributing

Feel free to contribute to this guide by submitting pull requests or opening issues for improvements.
