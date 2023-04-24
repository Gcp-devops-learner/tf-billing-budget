
variable "org_id" {
  description = "The organization ID."
  type        = string
}

variable "domain" {
  description = "The domain name (optional)."
  type        = string
  default     = ""
}

variable "name" {
  description = "The name for the project"
  type        = string
}

variable "project_id" {
  description = "The ID to give the project. If not provided, the `name` will be used."
  type        = list(string)
}


variable "billing_account" {
  description = "The ID of the billing account to associate this project with"
  type        = string
}


variable "budget_amount" {
  description = "The amount to use for a budget alert"
  type        = number
  default     = null
}

variable "budget_display_name" {
  description = "The display name of the budget. If not set defaults to `Budget For <projects[0]|All Projects>` "
  type        = string
  default     = null
}


variable "budget_alert_pubsub_topic" {
  description = "The name of the Cloud Pub/Sub topic where budget related messages will be published, in the form of `projects/{project_id}/topics/{topic_id}`"
  type        = string
  default     = null
}

variable "budget_monitoring_notification_channels" {
  description = "A list of monitoring notification channels in the form `[projects/{project_id}/notificationChannels/{channel_id}]`. A maximum of 5 channels are allowed."
  type        = list(string)
  default     = []
}

variable "budget_alert_spent_percents" {
  description = "A list of percentages of the budget to alert on when threshold is exceeded"
  type        = list(number)
  default     = [0.5, 0.7, 1.0]
}

variable "budget_alert_spend_basis" {
  description = "The type of basis used to determine if spend has passed the threshold"
  type        = string
  default     = "CURRENT_SPEND"
}

variable "budget_labels" {
  description = "A single label and value pair specifying that usage from only this set of labeled resources should be included in the budget."
  type        = map(string)
  default     = {}
  validation {
    condition     = length(var.budget_labels) <= 1
    error_message = "Only 0 or 1 labels may be supplied for the budget filter."
  }
}

variable "calendar_period" {
  description = "Specifies the calendar period for the budget. Possible values are MONTH, QUARTER, YEAR, CALENDAR_PERIOD_UNSPECIFIED, CUSTOM. custom_period_start_date and custom_period_end_date must be set if CUSTOM"
  type        = string
  default     = null
}

variable "budget_custom_period_start_date" {
  description = "Specifies the start date (DD-MM-YYYY) for the calendar_period CUSTOM"
  type        = string
  default     = null
}

variable "budget_custom_period_end_date" {
  description = "Specifies the end date (DD-MM-YYYY) for the calendar_period CUSTOM"
  type        = string
  default     = null
}
