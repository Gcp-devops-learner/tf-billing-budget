/******************************************
  Billing budget to create if amount is set
 *****************************************/
module "budget" {
  source        = "./modules/"
  create_budget = var.budget_amount != null

  projects                         = var.project_id
  billing_account                  = var.billing_account
  amount                           = var.budget_amount
  alert_spent_percents             = var.budget_alert_spent_percents
  alert_spend_basis                = var.budget_alert_spend_basis
  alert_pubsub_topic               = var.budget_alert_pubsub_topic
  monitoring_notification_channels = var.budget_monitoring_notification_channels
  display_name                     = var.budget_display_name != null ? var.budget_display_name : null
  labels                           = var.budget_labels
  calendar_period                 = var.calendar_period
  custom_period_start_date         = var.budget_custom_period_start_date
  custom_period_end_date           = var.budget_custom_period_end_date
}
