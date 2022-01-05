# zootle
Zootle generates download links for Zotero groups containing more than 100 entries. 
These links can be used to sync bibliographies with Overleaf.

Check out the app @ [https://zootle.me/](https://zootle.me/), or with the provided `Dockerfile`. 
Note that this uses the AWS Lambda Python image, which is larger than necessary. 
To reduce the image size, change `ll1` of the `Dockerfile` to another python image (`3.9-slim-buster`, `3.9-alpine`)
