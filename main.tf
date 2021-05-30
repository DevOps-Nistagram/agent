# terraform {
# 	backend "pg" {
# 	}
# 	required_providers {
#     	heroku = {
#       		source  = "heroku/heroku"
#       		version = "~> 4.2.0"
#     	}
# 	}
# }

# variable "servers_app_name" {
#   description = "Unique name of the Servers app"
# }
# resource "heroku_config" "prod" {
#   vars = {
#     STAGE = "PROD"
#   }
# }
# resource "heroku_app" "servers1" {
#   name   = var.servers_app_name
#   region = "eu"
#   stack  = "container"
# }

# resource "heroku_build" "servers1" {
#   app = heroku_app.servers1.id

#   source {
#     path = "servers"
#   }
# }

# resource "heroku_app_config_association" "servers1" {
#   app_id = heroku_app.servers1.id

#   vars = heroku_config.prod.vars
# }

# resource "heroku_addon" "database" {
#   app  = heroku_app.servers1.name
#   plan = "heroku-postgresql:hobby-dev"
# }

# resource "heroku_app" "servers2" {
#   name   = "${var.servers_app_name}-2"
#   region = "eu"
#   stack  = "container"
# }

# resource "heroku_build" "servers2" {
#   app = heroku_app.servers2.id

#   source {
#     path = "servers"
#   }
# }

# resource "heroku_app_config_association" "servers2" {
#   app_id = heroku_app.servers2.id

#   vars = heroku_config.prod.vars
# }

# resource "heroku_addon_attachment" "database" {
#   app_id  = heroku_app.servers2.id
#   addon_id = heroku_addon.database.id
# }


# output "servers1_app_url" {
#   value = "https://${heroku_app.servers1.name}.herokuapp.com"
# }
# output "servers2_app_url" {
#   value = "https://${heroku_app.servers2.name}.herokuapp.com"
# }







terraform {
	backend "pg" {
	}
	required_providers {
    	heroku = {
      		source  = "heroku/heroku"
      		version = "~> 4.2.0"
    	}
	}
}

variable "example_app_name" {
  description = "Name of the Heroku app provisioned as an example"
}

resource "heroku_app" "example" {
  name   = var.example_app_name
  region = "us"
}

# Build code & release to the app
resource "heroku_build" "example" {
  app        = heroku_app.example.name
  buildpacks = [heroku/python]
  source {
    path = "./"
  }
}

# Launch the app's web process by scaling-up
# resource "heroku_formation" "example" {
#   app        = heroku_app.example.name
#   type       = "web"
#   quantity   = 1
#   size       = "Standard-1x"
#   depends_on = [heroku_build.example]
# }

output "example_app_url" {
  value = "https://${heroku_app.example.name}.herokuapp.com"
}