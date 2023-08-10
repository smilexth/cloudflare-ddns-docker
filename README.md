# Cloudflare Dynamic DNS Updater Docker Image

The Dynamic DNS Updater Docker image is an encapsulated environment designed to autonomously keep a Cloudflare DNS record updated with the host's current public IP address. Crafted with portability and ease-of-use in mind, it's perfect for environments with fluctuating IP addresses.





# How to Get Started:

**Clone the project**

```shell
git clone https://github.com/smilexth/cloudflare-ddns-docker
```

**Configuration** 
setting up ```settings.json```: Before running the container with neccesary parameters


```JSON
{
"credentials": {
    "zoneid":"xxxxxx",
    "recordid":"xxxxxx",
    "token":"xxxxxxx"
    },
"data": {
    "type":"A",
    "name":"cloud",
    "content":"10.100.10.100",
    "ttl":120,
    "proxied":false
    },
"settings": {
    "debug": false,      
    "interval": 10         
    }
}
```
| Parameter            | Parent       | Description              | Example Value      |
|----------------------|--------------|--------------------------|--------------------|
| zoneid               | credentials  | Zone ID | "xxxxxx"           |
| recordid             | credentials  | Record ID  | "xxxxxx"       |
| token                | credentials  | Token for authentication  | "xxxxxxx"          |
| type                 | data         | DNS record type          | "A"                |
| name                 | data         | Name of the DNS record   | "cloud"            |
| content              | data         | IP address or value of the record  | Leaving for Update |
| ttl                  | data         | Time-to-live in seconds  | 120                |
| proxied              | data         | Whether the DNS query should be proxied or not | false |
| debug                | settings     | Verbose mode (true/false)  | false              |
| interval             | settings     | Update interval in seconds | 10               |


**start**

```sudo docker run -d --name="cloudflare-ddns" --restart=always -v ./settings.json:/app/settings.json smilexth/cloudflare-ddns:latest```

**docker-compose**

```sudo docker-compose up -d```

## Welcome for any issue ticket

### Automation Training

- [Services & Products](http://racksync.com)
- [Automation Course](https://facebook.com/racksync)

### Community

- [Home Automation Thailand](https://www.facebook.com/groups/hathailand)
- [Home Automation Marketplace](https://www.facebook.com/groups/hatmarketplace)
- [Home Automation Thailand Discord](https://discord.gg/Wc5CwnWkp4) 

## [RACKSYNC CO., LTD.](https://racksync.com)

We helps our customers to create life easier across the border of entire technology stack with household and business solutions. We modernize life with Information Technology, Optimize and collect data to make everything possible, secure & trusty
\
\
RACKSYNC COMPANY LIMITED \
Suratthani, Thailand 84100 \
Email : devops@racksync.com \
Tel : +66 85 880 8885 

[![Home Automation Thailand Discord](https://img.shields.io/discord/986181205504438345?style=for-the-badge)](https://discord.gg/Wc5CwnWkp4) [![Github](https://img.shields.io/github/followers/racksync?style=for-the-badge)](https://github.com/racksync) 
[![WebsiteStatus](https://img.shields.io/website?down_color=grey&down_message=Offline&style=for-the-badge&up_color=green&up_message=Online&url=https%3A%2F%2Fracksync.com)](https://racksync.com)