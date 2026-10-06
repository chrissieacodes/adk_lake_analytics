include: "/views/refined/waterchem_rfn.view.lkml"
include: "/views/refined/lake_characteristics_rfn.view.lkml"
include: "/views/refined/nutrients_rfn.view.lkml"
include: "/views/refined/secchi_rfn.view.lkml"

explore: water_chemistry {
  view_name: waterchem
  label: "Lake Water Chemistry & Acidification"
  description: "In-depth analysis of lake water chemistry, pH recovery, acid neutralizing capacity (ANC), sulfate, and nitrate trends."

  join: lake_characteristics {
    type: left_outer
    relationship: many_to_one
    sql_on: ${waterchem.permanent_id} = ${lake_characteristics.permanent_id} ;;
  }

  join: secchi {
    type: left_outer
    relationship: many_to_one
    sql_on: ${waterchem.permanent_id} = ${secchi.permanent_id} AND ${waterchem.sample_date} = ${secchi.sample_date} ;;
  }

  join: nutrients {
    type: left_outer
    relationship: many_to_one
    sql_on: ${waterchem.permanent_id} = ${nutrients.permanent_id} AND ${waterchem.sample_date} = ${nutrients.sample_date} ;;
  }
}
