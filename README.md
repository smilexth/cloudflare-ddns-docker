# Cloudflare Dynamic DNS Updater Docker Image
The Dynamic DNS Updater Docker image is an encapsulated environment designed to autonomously keep a Cloudflare DNS record updated with the host's current public IP address. Crafted with portability and ease-of-use in mind, it's perfect for environments with fluctuating IP addresses.


**Self-Contained Environment**: Built atop the lightweight Alpine Linux, this Docker image provides all the necessary tools and dependencies required for the script to run, ensuring consistent behavior regardless of where it's deployed.

**Configuration via settings.json**: Before running the container, users can configure the script by modifying the settings.json file. This file holds crucial data, including Cloudflare credentials and update intervals.



In summary, the Dynamic DNS Updater Docker image offers a turnkey solution for those looking to maintain an updated DNS record on Cloudflare without manual intervention, all within the consistent and isolated environment that Docker provides.

# How to Get Started:

**pull image**

```sudo docker pull smilexth/cloudflare-ddns```

**running**

```sudo docker run -d --name="cloudflare-ddns" --restart=always -v ./settings.json:/app/settings.json smilexth/cloudflare-ddns:latest```


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