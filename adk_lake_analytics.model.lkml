connection: "@{CONNECTION_NAME}"

# Include refined views (which layer business logic and include raw views)
include: "/views/refined/*.view.lkml"

# Include modular explores and tests
include: "/explores/*.explore.lkml"
include: "/tests/*.test.lkml"
include: "/dashboards/*.dashboard.lookml"

# --------------------------------------------------------------------------
# Centralized Caching (Datagroups)
# --------------------------------------------------------------------------

datagroup: adk_default_datagroup {
  sql_trigger: SELECT MAX(date) FROM `@{DATASET_NAME}.waterchem` ;;
  max_cache_age: "24 hours"
}

persist_with: adk_default_datagroup
