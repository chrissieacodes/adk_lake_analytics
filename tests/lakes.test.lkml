test: test_lake_count_matches {
  explore_source: lakes {
    column: total_lakes {
      field: lake_characteristics.lake_count
    }
  }
  assert: lakes_monitored_is_28 {
    expression: ${total_lakes} = 28 ;;
  }
}

test: test_waterchem_has_valid_ph_range {
  explore_source: water_chemistry {
    column: avg_ph {
      field: waterchem.average_ph
    }
  }
  assert: ph_within_realistic_bounds {
    expression: ${avg_ph} >= 4.0 AND ${avg_ph} <= 8.5 ;;
  }
}
