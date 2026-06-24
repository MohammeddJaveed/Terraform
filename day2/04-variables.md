# 04 - Variables (Input & Output)

## Why Use Variables?

Imagine you hardcode `"t2.micro"` in 10 different places. If you want to change the instance type, you'd have to update it in 10 places — and risk missing one.

**Variables** solve this. You define a value once, and reuse it everywhere.

> Variables make your Terraform code **flexible**, **reusable**, and **easy to change**.

---

## Input Variables

Input variables let you **pass values into** your Terraform config from outside — like arguments to a function.

### How to Define an Input Variable

```hcl
variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}
```

**What each part means:**
- `variable "instance_type"` — name of the variable
- `description` — explains what it's for (good documentation habit)
- `type` — the data type (`string`, `number`, `bool`, `list`, `map`)
- `default` — value to use if none is provided (optional)

### How to Use an Input Variable

Reference it with `var.<name>`:

```hcl
resource "aws_instance" "my_server" {
  ami           = "ami-0123456789abcdef0"
  instance_type = var.instance_type   # ← uses the variable
}
```

### How to Pass a Value at Runtime

```bash
# Option 1: Command line flag
terraform apply -var="instance_type=t3.medium"

# Option 2: A .tfvars file (recommended)
# Create a file: terraform.tfvars
instance_type = "t3.medium"
```

---

## Output Variables

Output variables let you **display or export values** after Terraform runs — like the IP address of a newly created server.

### How to Define an Output Variable

```hcl
output "server_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.my_server.public_ip
}
```

**What each part means:**
- `output "server_public_ip"` — name of the output
- `description` — explains what it shows
- `value` — the actual value to display (usually a resource attribute)

After running `terraform apply`, Terraform prints:

```
Outputs:

server_public_ip = "52.23.45.123"
```

### Sharing Outputs Between Modules

If you have a module called `networking`, you can access its outputs like this:

```hcl
output "vpc_id_from_root" {
  value = module.networking.vpc_id
}
```

---

## Variable Types Quick Reference

| Type | Example |
|------|---------|
| `string` | `"t2.micro"` |
| `number` | `3` |
| `bool` | `true` |
| `list(string)` | `["us-east-1a", "us-east-1b"]` |
| `map(string)` | `{ env = "prod", team = "devops" }` |
