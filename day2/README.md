# Day 2 - Terraform Deep Dive

Welcome to Day 2! Today we go deeper into Terraform concepts that make your code **flexible, reusable, and production-ready**.

## What You'll Learn Today

| # | Topic | What it covers |
|---|-------|---------------|
| 01 | [Providers](./01-providers.md) | How Terraform connects to AWS, Azure, GCP etc. |
| 02 | [State File](./02-state.md) | How Terraform tracks what's built |
| 03 | [Required Providers](./03-required-providers.md) | Locking provider versions |
| 04 | [Variables](./04-variables.md) | Making your code dynamic with inputs & outputs |
| 05 | [Variables Implementation](./05-variables-implementation.tf) | Actual `.tf` example of variables |
| 06 | [Conditional Expressions](./06-conditional-expressions.md) | Adding logic (if/else) to your config |
| 07 | [Built-in Functions](./07-builtin-functions.md) | Handy built-in tools for string/list/map operations |
| 08 | [Debugging & Formatting](./08-debugging-formatting.md) | How to debug errors and keep code clean |

## Quick Summary

On Day 1 you learned the basics — providers, resources, and `terraform init/plan/apply`.

On Day 2, you'll learn how to make your Terraform configs smarter:
- Use **variables** so you don't hardcode values
- Use **outputs** to print or share results
- Use **state** to understand how Terraform remembers your infrastructure
- Use **functions** to manipulate data inside your configs
