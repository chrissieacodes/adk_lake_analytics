view: waterchem {
  sql_table_name: `@{DATASET_NAME}.waterchem` ;;

  dimension: pk {
    primary_key: yes
    type: string
    sql: CONCAT(CAST(${TABLE}.permanent_id AS STRING), '_', CAST(${TABLE}.date AS STRING)) ;;
  }

  dimension: permanent_id {
    type: number
    sql: ${TABLE}.permanent_id ;;
  }

  dimension: lake_name {
    type: string
    sql: ${TABLE}.lake_name ;;
  }

  dimension_group: sample {
    type: time
    timeframes: [raw, date, month, quarter, year]
    convert_tz: no
    datatype: date
    sql: ${TABLE}.date ;;
  }

  dimension: year {
    type: number
    sql: ${TABLE}.year ;;
  }

  dimension: month {
    type: number
    sql: ${TABLE}.month ;;
  }

  dimension: so4_minus2 {
    type: number
    sql: SAFE_CAST(${TABLE}.so4_minus2 AS FLOAT64) ;;
  }

  dimension: no3_minus {
    type: number
    sql: SAFE_CAST(${TABLE}.no3_minus AS FLOAT64) ;;
  }

  dimension: cl {
    type: number
    sql: SAFE_CAST(${TABLE}.cl AS FLOAT64) ;;
  }

  dimension: fluor {
    type: number
    sql: SAFE_CAST(${TABLE}.fluor AS FLOAT64) ;;
  }

  dimension: anc_ueq_l {
    type: number
    sql: ${TABLE}.anc_ueq_l ;;
  }

  dimension: dic {
    type: number
    sql: SAFE_CAST(${TABLE}.dic AS FLOAT64) ;;
  }

  dimension: doc {
    type: number
    sql: ${TABLE}.doc ;;
  }

  dimension: sio2 {
    type: number
    sql: SAFE_CAST(${TABLE}.sio2 AS FLOAT64) ;;
  }

  dimension: calcium {
    type: number
    sql: ${TABLE}.calcium ;;
  }

  dimension: mg {
    type: number
    sql: ${TABLE}.mg ;;
  }

  dimension: sodium {
    type: number
    sql: ${TABLE}.sodium ;;
  }

  dimension: potassium {
    type: number
    sql: ${TABLE}.potassium ;;
  }

  dimension: nh4_plus {
    type: number
    sql: SAFE_CAST(${TABLE}.nh4_plus AS FLOAT64) ;;
  }

  dimension: al_td_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.al_td_ug_l AS FLOAT64) ;;
  }

  dimension: al_tm_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.al_tm_ug_l AS FLOAT64) ;;
  }

  dimension: al_om_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.al_om_ug_l AS FLOAT64) ;;
  }

  dimension: al_im_ug_l {
    type: number
    sql: SAFE_CAST(${TABLE}.al_im_ug_l AS FLOAT64) ;;
  }

  dimension: ph {
    type: number
    sql: ${TABLE}.ph ;;
  }

  dimension: color_ptco {
    type: number
    sql: ${TABLE}.color_ptco ;;
  }

  dimension: conduct_us_cm {
    type: number
    sql: ${TABLE}.conduct_us_cm ;;
  }
}
