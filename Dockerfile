# Use Alpine as the base image due to its small size
FROM alpine:latest

# Set the working directory inside the container
WORKDIR /app

# Install curl
RUN apk add --no-cache curl jq

# Copy the script to run curl periodically
COPY run.sh .
COPY settings.json .

# Make the script executable
RUN chmod +x run.sh

# Command to run the script
CMD ["./run.sh"]
