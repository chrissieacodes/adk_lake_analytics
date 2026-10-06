include: "/views/refined/crustacean_rfn.view.lkml"
include: "/views/refined/rotifer_rfn.view.lkml"
include: "/views/refined/phyto_rfn.view.lkml"
include: "/views/refined/lake_characteristics_rfn.view.lkml"

explore: plankton_ecology {
  view_name: crustacean
  label: "Plankton Communities & Biomass"
  description: "Ecosystem recovery and biological organism observations across Adirondack lakes."

  join: lake_characteristics {
    type: left_outer
    relationship: many_to_one
    sql_on: ${crustacean.permanent_id} = ${lake_characteristics.permanent_id} ;;
  }
}
