# 07 - Built-in Functions

## What are Built-in Functions?

Terraform comes with a set of **built-in functions** you can use inside your `.tf` files to manipulate strings, lists, maps, and numbers — without writing any extra code.

You call them inside expressions using `${}` or directly in values.

---

## Commonly Used Functions

### 1. `concat()` — Combine two lists into one

```hcl
variable "list1" {
  type    = list(string)
  default = ["a", "b"]
}

variable "list2" {
  type    = list(string)
  default = ["c", "d"]
}

output "combined" {
  value = concat(var.list1, var.list2)
  # Result: ["a", "b", "c", "d"]
}
```

---

### 2. `element()` — Get a specific item from a list

```hcl
variable "my_list" {
  type    = list(string)
  default = ["apple", "banana", "cherry"]
}

output "second_item" {
  value = element(var.my_list, 1)
  # Result: "banana"  (index starts at 0)
}
```

---

### 3. `length()` — Count items in a list or characters in a string

```hcl
variable "my_list" {
  type    = list(string)
  default = ["apple", "banana", "cherry"]
}

output "how_many" {
  value = length(var.my_list)
  # Result: 3
}
```

---

### 4. `lookup()` — Get a value from a map by key

```hcl
variable "instance_sizes" {
  type = map(string)
  default = {
    dev  = "t2.micro"
    prod = "t3.medium"
  }
}

output "prod_size" {
  value = lookup(var.instance_sizes, "prod")
  # Result: "t3.medium"
}
```

---

### 5. `join()` — Combine a list into a single string

```hcl
variable "availability_zones" {
  type    = list(string)
  default = ["us-east-1a", "us-east-1b", "us-east-1c"]
}

output "zones_string" {
  value = join(", ", var.availability_zones)
  # Result: "us-east-1a, us-east-1b, us-east-1c"
}
```

---

### 6. `tostring()` / `tonumber()` — Convert between types

```hcl
output "port_as_string" {
  value = tostring(8080)
  # Result: "8080"
}
```

---

## Quick Reference Table

| Function | What it does | Example |
|----------|-------------|---------|
| `concat(a, b)` | Joins two lists | `["a","b"] + ["c","d"]` → `["a","b","c","d"]` |
| `element(list, i)` | Gets item at index | `element(["x","y"], 0)` → `"x"` |
| `length(list)` | Counts items | `length(["a","b","c"])` → `3` |
| `lookup(map, key)` | Gets map value | `lookup({a="1"}, "a")` → `"1"` |
| `join(sep, list)` | Joins list to string | `join("-", ["a","b"])` → `"a-b"` |
| `upper(str)` | Uppercases a string | `upper("hello")` → `"HELLO"` |
| `lower(str)` | Lowercases a string | `lower("WORLD")` → `"world"` |
| `trimspace(str)` | Removes leading/trailing spaces | `trimspace("  hi  ")` → `"hi"` |

---

> 📖 Full list of functions: [Terraform Docs - Functions](https://developer.hashicorp.com/terraform/language/functions)
