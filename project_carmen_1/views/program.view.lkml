# The name of this view in Looker is "Program"
view: program {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `talent_management_sg.program` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    description: "Unique identifier of program table. Auto increment number."
    sql: ${TABLE}.id ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Assessments" in Explore.

  dimension: assessments {
    type: string
    description: "A JSON object indicates to assessments or evaluations associated with the program, including questionnaire id and framework. Ref: psychology.questionnaire."
    sql: ${TABLE}.assessments ;;
  }

  dimension: company_id {
    type: number
    description: "Foreign key ID of identity.company table, indicates the program is belongs to which company."
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

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_created_by {
    type: sum
    sql: ${created_by} ;;  }
  measure: average_created_by {
    type: average
    sql: ${created_by} ;;  }

  dimension: culture_fit_framework_id {
    type: string
    description: "(DEPRECATED)."
    sql: ${TABLE}.culture_fit_framework_id ;;
  }

  dimension: culture_fit_recipe_id {
    type: string
    description: "The unique identifier of the culture fit recipe associated with the program. Ref: talent_analytics.recipe."
    sql: ${TABLE}.culture_fit_recipe_id ;;
  }

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: framework_alias {
    type: string
    description: "An alias or shorter name for the programs framework. Max 50 characters. Ref: psychology.questionnaire."
    sql: ${TABLE}.framework_alias ;;
  }

  dimension: framework_id {
    type: number
    description: "(DEPRECATED)."
    sql: ${TABLE}.framework_id ;;
  }

  dimension: is_deleted {
    type: yesno
    description: "Indicates the record is marked as deleted."
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: name {
    type: string
    description: "The name or title of the program. Max 1000 characters."
    sql: ${TABLE}.name ;;
  }

  dimension: role_fit_framework_id {
    type: string
    description: "(DEPRECATED)."
    sql: ${TABLE}.role_fit_framework_id ;;
  }

  dimension: role_fit_recipe_id {
    type: string
    description: "The unique identifier of the role fit recipe associated with the program. Ref: talent_analytics.recipe."
    sql: ${TABLE}.role_fit_recipe_id ;;
  }

  dimension_group: row_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.row_created_date ;;
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
  measure: count {
    type: count
    drill_fields: [id, name, participant.count]
  }
}
