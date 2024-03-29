provider "aws" {
  access_key = ${{ secrets.ACCESS_KEY }}
  secret_key = ${{ secrets.SECRET_KEY }}
  region     = "us-west-2"
}

resource "kubernetes_ingress" "example_ingress" {
  metadata {
    name = "example-ingress"
  }
  spec {
    backend {
      service_name = "MyApp1"
      service_port = 8080
    }
    rule {
      http {
        path {
          backend {
            service_name = "MyApp1"
            service_port = 8080
          }
          path = "/app1/*"
        }
        path {
          backend {
            service_name = "MyApp2"
            service_port = 8080
          }
          path = "/app2/*"
        }
      }
    }
  }
}
