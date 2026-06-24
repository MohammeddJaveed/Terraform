# 08 - Debugging & Formatting

## Debugging Terraform

When something goes wrong with your Terraform config, here are the tools and techniques to figure out what happened.

---

### 1. `terraform validate` — Check for syntax errors

Before applying anything, validate your code:

```bash
terraform validate
```

This checks your `.tf` files for syntax errors and typos — without touching any real infrastructure.

**Example output if there's an error:**
```
│ Error: Unsupported argument
│   on main.tf line 8, in resource "aws_instance" "example":
│   8:   instanc_type = "t2.micro"
│ An argument named "instanc_type" is not expected here. Did you mean "instance_type"?
```

---

### 2. `terraform plan` — Preview changes before applying

Always run `terraform plan` before `terraform apply`. It shows exactly what Terraform will create, update, or destroy.

```bash
terraform plan
```

Look for the `+`, `~`, and `-` symbols:
- `+` = will be **created**
- `~` = will be **updated**
- `-` = will be **destroyed**

---

### 3. Enable Debug Logging with `TF_LOG`

If you need detailed logs for troubleshooting, set the `TF_LOG` environment variable:

```bash
# On Linux/Mac
export TF_LOG=DEBUG
terraform apply

# On Windows PowerShell
$env:TF_LOG="DEBUG"
terraform apply
```

**Log levels (from most to least verbose):**
`TRACE` → `DEBUG` → `INFO` → `WARN` → `ERROR`

Save logs to a file:
```bash
export TF_LOG=DEBUG
export TF_LOG_PATH="terraform-debug.log"
terraform apply
```

---

### 4. `terraform console` — Test expressions interactively

Use the console to try out expressions, functions, and variable references without applying anything:

```bash
terraform console
```

Then type expressions:
```
> var.environment
"dev"

> length(["a", "b", "c"])
3

> "Hello, ${var.instance_name}!"
"Hello, my-server!"
```

Press `Ctrl+C` or type `exit` to quit.

---

## Formatting Your Code

### `terraform fmt` — Auto-format your `.tf` files

Terraform has an official formatting standard. Instead of manually fixing indentation and spacing, just run:

```bash
terraform fmt
```

This automatically reformats all `.tf` files in the current directory to the standard style.

**Before `terraform fmt`:**
```hcl
resource "aws_instance" "example" {
ami="ami-0123456789abcdef0"
instance_type   =   "t2.micro"
}
```

**After `terraform fmt`:**
```hcl
resource "aws_instance" "example" {
  ami           = "ami-0123456789abcdef0"
  instance_type = "t2.micro"
}
```

### Why formatting matters

- **Consistent style** across your whole team
- **Easier code reviews** — reviewers focus on logic, not spacing
- **Git diffs are cleaner** — no noisy whitespace changes

> 💡 Pro tip: Add `terraform fmt -check` to your CI/CD pipeline to reject PRs with unformatted code.

---

## Quick Debugging Checklist

| Issue | What to try |
|-------|------------|
| Syntax error | `terraform validate` |
| Not sure what will change | `terraform plan` |
| Deep provider error | `TF_LOG=DEBUG terraform apply` |
| Function not working as expected | `terraform console` |
| Messy code | `terraform fmt` |
