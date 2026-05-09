connection: "appnovation-looker-ai"

include: "/views/*.view.lkml"

explore: employees {
  label: "Employee Analytics"
  description: "Headcount, salary, attrition, tenure and performance across departments and locations."
}
