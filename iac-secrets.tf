provider "aws" {
  access_key = "ASIAZG5Y3JXC5UQKAJ8Y"
  secret_key = "KsOuKcmeGH95O1zIEFP9TOjhy03yfxreF8gDi7+B"
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