# Adirondack (ADK) Lakes Long-Term Limnology LookML Project

An enterprise LookML project built using the **Looker Architect** standards, modeling decades of limnological, water chemistry, nutrient, and plankton community data across 28 Adirondack lakes.

## Dataset Reference
* **Origin**: [Winslow & Leach (2018), *ADK Long-term data and code compilation*](https://figshare.com/articles/dataset/ADK_Long-term_data_and_code_compilation/5686987/2?file=10505638)
* **BigQuery Project & Dataset**: `cloud-looker-devrel-demos.adk_limnology`
* **Region**: `us-central1`

## Project Structure
```
├── manifest.lkml                     # Centralized connection & dataset constants + drill configs
├── adk_lake_analytics.model.lkml     # Model configuration, caching datagroups, and includes
├── views/
│   ├── raw/                          # 1:1 database mappings with primary keys (no measures)
│   │   ├── lake_characteristics.view.lkml
│   │   ├── waterchem.view.lkml
│   │   ├── nutrients.view.lkml
│   │   ├── secchi.view.lkml
│   │   ├── temp_do_profiles.view.lkml
│   │   ├── crustacean.view.lkml
│   │   ├── rotifer.view.lkml
│   │   └── phyto.view.lkml
│   └── refined/                      # Refinements with business metrics, formatting, and drill links
│       ├── lake_characteristics_rfn.view.lkml
│       ├── waterchem_rfn.view.lkml
│       ├── nutrients_rfn.view.lkml
│       ├── secchi_rfn.view.lkml
│       ├── temp_do_profiles_rfn.view.lkml
│       ├── crustacean_rfn.view.lkml
│       ├── rotifer_rfn.view.lkml
│       └── phyto_rfn.view.lkml
├── explores/                         # Modular Explores with join pruning
│   ├── lakes.explore.lkml            # Unified lake overview explore
│   ├── water_chemistry.explore.lkml  # Water chemistry & acidification recovery explore
│   └── plankton_ecology.explore.lkml # Plankton community & biomass explore
├── tests/                            # Automated LookML assertions
│   └── lakes.test.lkml               # Primary key and boundary assertions
└── dashboards/                       # Native tabbed LookML dashboards
    └── adk_limnology_overview.dashboard.lookml
```

## Key Ecological Metrics & Dimensions
* **Acidification Recovery**:
  * `average_ph`: Average lake water pH (acidity).
  * `average_anc`: Acid Neutralizing Capacity in $\mu\text{eq/L}$.
  * `average_sulfate`: Sulfate $\text{SO}_4^{2-}$ concentration in mg/L (tracing historical acid deposition).
  * `acidic_sample_percent`: Percentage of samples with $\text{pH} < 6.0$.
* **Trophic Status & Clarity**:
  * `average_secchi_depth`: Water transparency in meters.
  * `average_chlorophyll_a`: Algal biomass in $\mu\text{g/L}$.
  * `trophic_state`: Oligotrophic ($< 2.5\,\mu\text{g/L}$), Mesotrophic ($2.5 - 8.0\,\mu\text{g/L}$), Eutrophic ($> 8.0\,\mu\text{g/L}$).
* **Biological Communities**:
  * `average_density_org_l`: Zooplankton density per liter.
  * `average_biomass_mg_l`: Wet-weight biomass in mg/L.
  * `species_count`: Distinct crustacean & rotifer species richness.
