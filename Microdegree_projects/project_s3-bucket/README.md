# THIS IS IMAGE

```
S3 BUCKET SCRIPT

provider "aws"{
      region="us-east-1"
      access_key="*****"
      secret_key="******"
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"

        tags = {
            Name = "test-vpc"
        }
}
```
