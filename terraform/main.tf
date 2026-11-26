resource "opentelekomcloud_fgs_function_v2" "myfunction" {

  name = "bug-encrypted-user-data"
  app  = "default"

  handler = "index.handler"

  runtime = "Python3.10"

  initializer_handler = null
  initializer_timeout = null

  code_type     = "inline"
  func_code     = filebase64(format("${path.module}/code.py"))
  code_filename = "index.py"

  description      = "Test function"
  memory_size      = 128
  timeout          = 3
  max_instance_num = 1

  user_data = jsonencode({
    "NOT_ENCRYPTED" : "Hello World",
    
  })

  encrypted_user_data = jsonencode({
    "ENCRYPTED" : "Hello World",
  })


}