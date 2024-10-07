view: employee {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `talent_management_sg.employee` ;;
  drill_fields: [manager_employee_id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: manager_employee_id {
    primary_key: yes
    type: string
    description: "The unique identifier of the employee's manager. Ref: talent_management.employee."
    sql: ${TABLE}.manager_employee_id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "App Notification" in Explore.

  dimension: app_notification {
    type: string
    description: "A JSON object indicates the in app notifications or preferences for the employee, including completed_assessment_seen_at, completed_learning_onboarding_seen_at."
    sql: ${TABLE}.app_notification ;;
  }

  dimension: assessment_completed {
    type: number
    description: "The number of assessments completed by the employee."
    sql: ${TABLE}.assessment_completed ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_assessment_completed {
    type: sum
    sql: ${assessment_completed} ;;  }
  measure: average_assessment_completed {
    type: average
    sql: ${assessment_completed} ;;  }

  dimension: assessment_total {
    type: number
    description: "The total number of assessments by the employee."
    sql: ${TABLE}.assessment_total ;;
  }

  dimension: company_id {
    type: number
    description: "Foreign key ID of identity.company table, indicates the employee is belongs to which company."
    sql: ${TABLE}.company_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created_at {
    type: time
    description: "The timestamp when this record is created."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: created_by {
    type: number
    description: "User account id of the user who created this record."
    sql: ${TABLE}.created_by ;;
  }

  dimension: department {
    type: string
    description: "The department or division to which the employee belongs. Max 255 characters."
    sql: ${TABLE}.department ;;
  }

  dimension: department_id {
    type: string
    sql: ${TABLE}.department_id ;;
  }

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: external_employee_id {
    type: string
    description: "An external identifier associated with the employee, which may be used for cross-referencing with external systems or data sources. Max 36 characters."
    sql: ${TABLE}.external_employee_id ;;
  }

  dimension: external_learning_meta {
    type: string
    description: "A JSON object related to the employee's external learning information from external learning provider. Ref: talent_management.learning_provider."
    sql: ${TABLE}.external_learning_meta ;;
  }

  dimension: feedback_response_id {
    type: string
    description: "The identifier associated with the employee feedback responses. Max 50 characters."
    sql: ${TABLE}.feedback_response_id ;;
  }

  dimension: first_name {
    type: string
    description: "The first name of employee. Max 100 characters."
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    description: "The gender of employee. Possible values: \"male\", \"female\". Max 10 characters."
    sql: ${TABLE}.gender ;;
  }

  dimension: id {
    type: string
    description: "Unique identifier of employee table. Random UUID."
    sql: ${TABLE}.id ;;
  }

  dimension: interest_tag {
    type: string
    description: "A JSON object related to the employee's interests or tags that an employee is interested in developing or exploring within the context of their professional growth and learning initiatives."
    sql: ${TABLE}.interest_tag ;;
  }

  dimension: is_deleted {
    type: yesno
    description: "Indicates the record is marked as deleted."
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_learning_enabled {
    type: yesno
    description: "This value indicates whether the employee's learning module is enabled. If \"true\" - employee's learning module is enabled, if \"false\" - employee's learning module is disabled."
    sql: ${TABLE}.is_learning_enabled ;;
  }

  dimension: is_manager {
    type: yesno
    description: "This value indicates whether the employee is a manager. If \"true\" - employee is a manager, if \"false\" - employee is not a manager."
    sql: ${TABLE}.is_manager ;;
  }

  dimension: last_name {
    type: string
    description: "The last name of employee. Max 100 characters."
    sql: ${TABLE}.last_name ;;
  }

  dimension: nationality {
    type: string
    description: "The nationality of employee. Max 80 characters."
    sql: ${TABLE}.nationality ;;
  }

  dimension: phone_number {
    type: string
    description: "The phone number of employee. Max 255 characters."
    sql: ${TABLE}.phone_number ;;
  }

  dimension: position {
    type: string
    description: "The job position of employee. Max 255 characters."
    sql: ${TABLE}.position ;;
  }

  dimension_group: row_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.row_created_date ;;
  }

  dimension: status {
    type: string
    description: "The status of the employee. Possible values: \"active\" - employee has accepted the invitation, \"pending\" - employee not yet accept the invitation, \"disabled\" - employee is removed from the invitation, \"not_invited\" - employee is not being invited."
    sql: ${TABLE}.status ;;
  }

  dimension_group: updated {
    type: time
    description: "The timestamp of the record last update."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.updated_at ;;
  }

  dimension: updated_by {
    type: number
    description: "User account id of the last user who updated this record."
    sql: ${TABLE}.updated_by ;;
  }

  dimension: user_account_id {
    type: number
    description: "Foreign key ID of identity.user_account table, indicates the employee user account id."
    sql: ${TABLE}.user_account_id ;;
  }

  dimension: work_email {
    type: string
    description: "The work email address of employee. Max 255 characters."
    sql: ${TABLE}.work_email ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  manager_employee_id,
  first_name,
  last_name,
  employee_action_history.count,
  employee_score.count,
  employee_course_activity.count,
  employee_questionnaire.count,
  employee_group_member.count,
  employee_task.count,
  learning_goal.count,
  participant.count
  ]
  }

}
