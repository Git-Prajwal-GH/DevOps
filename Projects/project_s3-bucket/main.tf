provider "aws"{
      region="us-east-1"
      access_key="*****"
      secret_key="******"
}

resource "aws_vpc" "myvpc" {
    bucket = "microdegree-bucket-march"     

}
