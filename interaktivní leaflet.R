library(RCzechia)
library(dplyr)

obyvatele_obci <- czso::czso_get_table("SLDB-VYBER") %>% # výsledky Sčítání lidu 2010
  filter(uzcis == "43") %>% # hodnoty za obce / chybí obce vzniklé po roce 2010, to je OK
  select(KOD_OBEC = uzkod, obyvatel = vse1111) %>% # vse1111 = celkový počet obyvatel
  mutate(obyvatel = as.numeric(obyvatel)) 

obce <- obce_polygony() %>% 
  left_join(obyvatele_obci, by = "KOD_OBEC") %>% 
  mutate(hustota = obyvatel / (st_area(.) %>% units::set_units(km^2) %>% units::drop_units())) %>% 
  mutate(label = paste(NAZ_OBEC, "– hustota", round(hustota), "obyvatel na km2")) %>% 
  # mapshaper: není povinný, ale leaflet objekt je pak menší a svižnější
  rmapshaper::ms_simplify(keep = 1/10,
                          keep_shapes = T)

library(leaflet)

# paleta- od zelené (= málo) přes žlutou k červené (= moc)
pal <- colorNumeric(
  palette = "RdYlGn",
  domain = log(obce$hustota),
  reverse = T)

# vlastní leaflet
listek <- leaflet(obce) %>% 
  addProviderTiles("Stamen.Toner") %>% # basemap / černobílá nepoutá pozornost
  addPolygons(stroke = F,
              fillOpacity = 4/5,
              color = ~pal(log(hustota)),
              popup =  ~label)

# 1) do RStudio Viewer pane
print(listek)

# 2) na disk / nepovinně :)
htmlwidgets::saveWidget(listek, "listek.html")