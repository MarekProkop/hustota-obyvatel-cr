library(tidyverse)
library(readxl)
library(RCzechia)
library(sf)

# Načti data obcí z Excelu od ČSÚ
# Excel od ČSÚ má prasácké nadpisy okresů v prvním sloupci a v dalších
# sloupcích je pak NA. Vyhoď je!

obyvatele <-
  read_excel(
    "data/1300722003.xlsx",
    skip = 6,
    col_names = c(
      "kod_okresu",
      "kod_obce",
      "nazev_obce",
      "pocet_obyvatel",
      "pocet_muzu",
      "pocet_zen",
      "vek",
      "vek_muzu",
      "vek_zen"
    )
  ) %>%
  filter(!is.na(kod_obce))

# Nenašel jsem plochy obcí, ale balíček RCzechia má polygony obcí, ze kterých
# jsou plochy spočítat. Výpočet plochy dělá funkce st_area z balíčku sf, která
# vrací m2 i s jednotkou, takže to převádím na km2 jako numeric.

rozlohy <- obce_polygony() %>%
  transmute(
    kod_obce = KOD_OBEC,
    rozloha = as.numeric(units::set_units(st_area(GeneralizovaneHranice), km^2))
  )

# Spoj obce od ČSÚ a rozlohy

hustota <- obyvatele %>%
  left_join(rozlohy) %>%
  select(-GeneralizovaneHranice) %>%
  mutate(hustota = pocet_obyvatel / rozloha)
