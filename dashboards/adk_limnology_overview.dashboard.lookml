- dashboard: adk_limnology_overview
  title: "Adirondack Lakes - Long-Term Limnology & Recovery"
  layout: newspaper
  preferred_viewer: dashboards-next
  description: "Long-term monitoring of 28 Adirondack lakes tracking recovery from acidification."

  tabs:
    - name: overview_tab
      label: "Lake Overview & Acidification Trends"
    - name: water_chemistry_tab
      label: "Chemistry & Nutrients"
    - name: plankton_tab
      label: "Biological Communities"

  elements:
    # ------------------------------------------------------------------------
    # TAB 1: Overview & Acidification Trends
    # ------------------------------------------------------------------------
    - title: "Total Lakes Monitored"
      name: total_lakes
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: lakes
      type: single_value
      fields: [lake_characteristics.lake_count]
      row: 0
      col: 0
      width: 6
      height: 4

    - title: "Average Monitored Lake Elevation"
      name: avg_elevation
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: lakes
      type: single_value
      fields: [lake_characteristics.average_elevation]
      row: 0
      col: 6
      width: 6
      height: 4

    - title: "Long-Term Average pH"
      name: avg_ph
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: single_value
      fields: [waterchem.average_ph]
      row: 0
      col: 12
      width: 6
      height: 4

    - title: "Acid Neutralizing Capacity (ANC)"
      name: avg_anc
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: single_value
      fields: [waterchem.average_anc]
      row: 0
      col: 18
      width: 6
      height: 4

    - title: "Long-Term pH Recovery Trend"
      name: ph_recovery_trend
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: looker_line
      fields: [waterchem.sample_year, waterchem.average_ph]
      sorts: [waterchem.sample_year asc]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      show_y_axis_labels: true
      show_y_axis_ticks: true
      y_axis_tick_density: default
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Sulfate (SO4) Decline Over Decades"
      name: sulfate_decline_trend
      tab_name: overview_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: looker_line
      fields: [waterchem.sample_year, waterchem.average_sulfate]
      sorts: [waterchem.sample_year asc]
      x_axis_gridlines: false
      y_axis_gridlines: true
      show_view_names: false
      row: 4
      col: 12
      width: 12
      height: 8

    # ------------------------------------------------------------------------
    # TAB 2: Water Chemistry & Nutrients (Coordinates reset to row: 0, col: 0)
    # ------------------------------------------------------------------------
    - title: "Average Secchi Transparency Depth"
      name: avg_secchi_depth
      tab_name: water_chemistry_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: single_value
      fields: [secchi.average_secchi_depth]
      row: 0
      col: 0
      width: 8
      height: 4

    - title: "Average Chlorophyll-a Biomass"
      name: avg_chl_a
      tab_name: water_chemistry_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: single_value
      fields: [nutrients.average_chlorophyll_a]
      row: 0
      col: 8
      width: 8
      height: 4

    - title: "Average Base Cation Calcium"
      name: avg_calcium
      tab_name: water_chemistry_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: single_value
      fields: [waterchem.average_calcium]
      row: 0
      col: 16
      width: 8
      height: 4

    - title: "Acidity Status Distribution Across Lakes"
      name: acidity_status_distribution
      tab_name: water_chemistry_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: looker_pie
      fields: [waterchem.acidity_status, waterchem.waterchem_sample_count]
      sorts: [waterchem.waterchem_sample_count desc]
      row: 4
      col: 0
      width: 12
      height: 8

    - title: "Water Clarity (Secchi Depth) by Lake"
      name: secchi_by_lake
      tab_name: water_chemistry_tab
      model: adk_lake_analytics
      explore: water_chemistry
      type: looker_column
      fields: [waterchem.lake_name, secchi.average_secchi_depth]
      sorts: [secchi.average_secchi_depth desc]
      row: 4
      col: 12
      width: 12
      height: 8

    # ------------------------------------------------------------------------
    # TAB 3: Biological Communities (Coordinates reset to row: 0, col: 0)
    # ------------------------------------------------------------------------
    - title: "Total Distinct Crustacean Species"
      name: total_crustacean_species
      tab_name: plankton_tab
      model: adk_lake_analytics
      explore: plankton_ecology
      type: single_value
      fields: [crustacean.species_count]
      row: 0
      col: 0
      width: 12
      height: 4

    - title: "Average Plankton Biomass by Lake"
      name: biomass_by_lake
      tab_name: plankton_tab
      model: adk_lake_analytics
      explore: plankton_ecology
      type: looker_column
      fields: [crustacean.lake_name, crustacean.average_biomass_mg_l]
      sorts: [crustacean.average_biomass_mg_l desc]
      row: 4
      col: 0
      width: 24
      height: 8
