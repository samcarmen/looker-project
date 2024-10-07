# Define the database connection to be used for this model.
# connection: "test_connection_carmen"
connection: "test_connection_carmen"

# include all the views
include: "/project_carmen_1/views/**/*.view.lkml"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: project_carmen_1_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: project_carmen_1_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Project Carmen 1"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.

explore: employee {
  required_access_grants: [data_engineering_access]
  # access_filter: {
  #   field: employee.company_id
  #   user_attribute: company_id
  # }
}

explore: program {}

access_grant: data_engineering_access {
  user_attribute: department
  allowed_values: ["data_engineering"]
}
