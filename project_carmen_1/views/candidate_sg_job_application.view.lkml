# The name of this view in Looker is "Candidate Sg Job Application"
view: candidate_sg_job_application {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: `candidate_sg.job_application` ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: string
    description: "Unique identifier of Job Application. Random UUID."
    sql: ${TABLE}.id ;;
  }
  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "App Notification" in Explore.

  dimension: app_notification {
    type: string
    description: "A JSON object indicates the in app notifications for the candidate, the timestamp when the candidate read the notification, including completed_resume_upload_at, completed_assessment_seen_at, completed_screening_seen_at. The value is null if there is no notification or candidate not yet read the notification."
    sql: ${TABLE}.app_notification ;;
  }

  dimension: company_data {
    type: string
    description: "A JSON object indicates the company data, inclduing the id, name and slug of the company."
    sql: ${TABLE}.company_data ;;
  }

  dimension: company_id {
    type: number
    description: "Foreign key ID of identity.company table, indicates the job application is belongs to which company."
    # hidden: yes
    sql: ${TABLE}.company_id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: completed {
    type: time
    description: "The timestamp when candidate is completed the assessment."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.completed_at ;;
  }

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

  dimension_group: event_timestamp {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.event_timestamp ;;
  }

  dimension: ext_reference_id {
    type: string
    description: "The 3rd party integration system reference id. This value is SAP Application ID. Max 50 characters."
    sql: ${TABLE}.ext_reference_id ;;
  }

  dimension: feedback_response_id {
    type: string
    description: "A JSON object indicates the in app notifications for the candidate, the timestamp when the candidate read the notification, including completed_resume_upload_at, completed_assessment_seen_at, completed_screening_seen_at. The value is null if there is no notification or candidate not yet read the notification."
    sql: ${TABLE}.feedback_response_id ;;
  }

  dimension: first_name {
    type: string
    description: "The first name of candidate. Default as \"Profile\" in anonymous integration mode (eg. SAP). Max 255 characters."
    sql: ${TABLE}.first_name ;;
  }

  dimension: identity_provider {
    type: string
    description: "The candidate's identity provider. Possible values: \"ats\", \"sap\", \"auth0\", \"aws_cognito\". Max 255 characters."
    sql: ${TABLE}.identity_provider ;;
  }

  dimension: identity_value {
    type: string
    description: "The email address used by the candidate to sign up for an account when applying for the job. The value could be user email or SAP Candidate ID in anonymous integration mode. Max 255 characters."
    sql: ${TABLE}.identity_value ;;
  }

  dimension: invitation_code {
    type: string
    description: "(DEPRECATED)."
    sql: ${TABLE}.invitation_code ;;
  }

  dimension_group: invitation_expired {
    type: time
    description: "(DEPRECATED)."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.invitation_expired_at ;;
  }

  dimension: invitation_id {
    type: number
    description: "(DEPRECATED)."
    # hidden: yes
    sql: ${TABLE}.invitation_id ;;
  }

  dimension: is_anonymous {
    type: yesno
    description: "The integration mode. If \"true\" - meaning anonymous, don't capture PII data, \"false\" - default value is false, treat is as normal behaviour."
    sql: ${TABLE}.is_anonymous ;;
  }

  dimension: is_deleted {
    type: yesno
    description: "Indicates the record is marked as deleted."
    sql: ${TABLE}.is_deleted ;;
  }

  dimension: is_partner_application {
    type: yesno
    description: "The integration mode. If \"true\" - meaning anonymous, don't capture PII data, \"false\" - default value is false, treat is as normal behaviour."
    sql: ${TABLE}.is_partner_application ;;
  }

  dimension: is_questionnaires_required {
    type: yesno
    description: "This value is to determine if the questionnaire is required to complete by the candidate. If \"true\" - candidate is required to complete the assessment, \"false\" - candidate is not required to complete the assessment."
    sql: ${TABLE}.is_questionnaires_required ;;
  }

  dimension: is_video_required {
    type: yesno
    description: "This value is to determine if the candidate is required to perform video interview."
    sql: ${TABLE}.is_video_required ;;
  }

  dimension: job_data {
    type: string
    description: "A JSON object indicates the job data, including the id, title, requisition code and status of the job."
    sql: ${TABLE}.job_data ;;
  }

  dimension: job_id {
    type: string
    description: "Foreign key ID of talent_acquisition.job table, is belongs to the job application is belongs to which job."
    # hidden: yes
    sql: ${TABLE}.job_id ;;
  }

  dimension_group: last_assessment_invited {
    type: time
    description: "The timestamp where the most recent assessment invitation sent to the candidate for the job application."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.last_assessment_invited_at ;;
  }

  dimension: last_name {
    type: string
    description: "The last name of candidate. Default as SAP Application ID in anonymous integration mode (eg. SAP). Max 255 characters."
    sql: ${TABLE}.last_name ;;
  }

  dimension: nationality {
    type: string
    description: "The nationality of candidate. Max 255 characters."
    sql: ${TABLE}.nationality ;;
  }

  dimension: phone_code {
    type: string
    description: "The phone code of candidate. Max 50 characters."
    sql: ${TABLE}.phone_code ;;
  }

  dimension: phone_number {
    type: string
    description: "The phone number of candidate. Max 100 characters."
    sql: ${TABLE}.phone_number ;;
  }

  dimension: place_formatted_address {
    type: string
    description: "The location address of candidate, fully formatted for human to read. Provided by Google Places API. Max 255 characters."
    sql: ${TABLE}.place_formatted_address ;;
  }

  dimension: place_result {
    type: string
    description: "A JSON object that record the place data of the job location, which include place_id, display_address, vicinity, street_number, street_name, postal_code, locality, sublocality, state, country, and geolocation data (latitude and longitude) provided by Google Places API."
    sql: ${TABLE}.place_result ;;
  }

  dimension: professional_summary {
    type: string
    description: "The professional summary of candidate."
    sql: ${TABLE}.professional_summary ;;
  }

  dimension: profile_id {
    type: string
    description: "Foreign key ID of candidate.profile table, indicates the job application is belongs to which candidate profile."
    # hidden: yes
    sql: ${TABLE}.profile_id ;;
  }

  dimension: resume {
    type: string
    description: "A JSON object indicates the candidate's resume file meta, including file_name, file_path, file_type, content_path."
    sql: ${TABLE}.resume ;;
  }

  dimension: resume_content_file_id {
    type: number
    description: "Foreign key ID of candidate.job_application_file table, indicates the resume content in json format is belongs to which job application file."
    sql: ${TABLE}.resume_content_file_id ;;
  }

  dimension: resume_file_id {
    type: number
    description: "Foreign key ID of candidate.job_application_file table, indicates the resume uploaded by candidate is belongs to which job application file."
    sql: ${TABLE}.resume_file_id ;;
  }

  dimension_group: row_created {
    type: time
    timeframes: [raw, date, week, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.row_created_date ;;
  }

  dimension: skills {
    type: string
    description: "The skills of the candidate, extracted from candidate's resume (resume skills will be extracted by Daxtra and OpenAI) or manual input by candidate when applying for the job, including the name, source and proficiency of the skills."
    sql: ${TABLE}.skills ;;
  }

  dimension: source {
    type: string
    description: "The source where candidate found the job. The value is null if the candidate did not select the source. (eg. \"company_careers_page\", \"linked_in\", \"sap\", \"online_ad_search_engine\", \"career_fair_event\")."
    sql: ${TABLE}.source ;;
  }

  dimension: status {
    type: string
    description: "The status of the candidate job application. Possible values: \"pending\" - the job application is in draft, has not been submitted by the candidate, \"in_progress\" - the candidate has submitted the job application, \"completed\" - the candidate has completed the assessment after applying for the job, \"expired\" - the job is expired and cannot be apply anymore, \"withdrawn\" - candidate has withdrawn the job application."
    sql: ${TABLE}.status ;;
  }

  dimension_group: submitted {
    type: time
    description: "The timestamp when candidate is submitted job application."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.submitted_at ;;
  }

  dimension: total_questionnaires {
    type: number
    description: "The total questionnaires need to be completed by candidate."
    sql: ${TABLE}.total_questionnaires ;;
  }

  dimension: total_questionnaires_completed {
    type: number
    description: "The total questionnaires completed by candidate."
    sql: ${TABLE}.total_questionnaires_completed ;;
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

  dimension_group: withdrawn {
    type: time
    description: "The timestamp when candidate withdrawn the job application."
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.withdrawn_at ;;
  }

  dimension: withdrawn_reason {
    type: string
    description: "The reason of candidate withdrawn the job application. Max 255 characters."
    sql: ${TABLE}.withdrawn_reason ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
      id,
      first_name,
      last_name,
      invitation.id,
      company.name,
      company.id,
      profile.id,
      job.ext_video_job_id,
      invitation.count,
      candidate_sg_job_application_activity.count,
      candidate_sg_job_application_career.count,
      candidate_sg_job_application_file.count,
      interview_rating.count,
      candidate_sg_job_application_action_history.count,
      candidate_sg_job_application_education.count,
      candidate_sg_job_application_questionnaire.count,
      candidate_sg_job_application_screening_answer.count,
      talent_acquisition_sg_job_application_activity.count,
      job_application_comment.count,
      job_application_contact.count,
      talent_acquisition_sg_job_application_career.count,
      talent_acquisition_sg_job_application_action_history.count,
      talent_acquisition_sg_job_application_education.count,
      job_application_attachment.count,
      talent_acquisition_sg_job_application_file.count,
      job_application_label.count,
      job_application_resume.count,
      talent_acquisition_sg_job_application_questionnaire.count,
      job_application_share.count,
      job_application_score.count,
      talent_acquisition_sg_job_application_screening_answer.count,
      job_recommendation_profile.count
    ]
  }

}
