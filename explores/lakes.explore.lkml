include: "/views/refined/lake_characteristics_rfn.view.lkml"
include: "/views/refined/waterchem_rfn.view.lkml"
include: "/views/refined/nutrients_rfn.view.lkml"
include: "/views/refined/secchi_rfn.view.lkml"
include: "/views/refined/temp_do_profiles_rfn.view.lkml"

explore: lakes {
  view_name: lake_characteristics
  label: "Adirondack Lakes Overview"
  description: "Unified explore centered on Adirondack lake physical characteristics, long-term water chemistry, trophic nutrients, and clarity."

  join: waterchem {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lake_characteristics.permanent_id} = ${waterchem.permanent_id} ;;
  }

  join: nutrients {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lake_characteristics.permanent_id} = ${nutrients.permanent_id} ;;
  }

  join: secchi {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lake_characteristics.permanent_id} = ${secchi.permanent_id} ;;
  }

  join: temp_do_profiles {
    type: left_outer
    relationship: one_to_many
    sql_on: ${lake_characteristics.permanent_id} = ${temp_do_profiles.permanent_id} ;;
  }
}
