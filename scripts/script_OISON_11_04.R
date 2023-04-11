
# Lecture data ----

OISON <- sf::read_sf ("raw_data/oison/oison_geometry.gpkg")


# sauvegarder le fichier en format Rdata


save(OISON,
     file="processed_data/OISON_geom.RData")


# charger le ficher en format Rdata


load(file="processed_data/OISON_geom.RData")


# visualisation carto de la donnée
mapview::mapview(OISON)

#Manipulation oison_taxon

OISON_taxon <- sf::read_sf ("raw_data/oison/oison_taxon.csv")

save(OISON_taxon,
                   file="processed_data/OISON_taxon.RData")
load(file="processed_data/OISON_taxon.RData")

#selectionner 4 colonnes

OISON_taxon %>% 
dplyr::select(nom_vernaculaire,
               nom_scientifique,
               date,
               nom)
#selectionner une plage

OISON_taxon %>% 
  dplyr::select(observation_id:date)

#exclure les colonnes

OISON_taxon %>% 
  dplyr::select(observation_id:date)
  dplyr::select(-heure)
  
  # exclure une plage de colonnes
  
OISON_taxon %>% 
  dplyr::select(!(observation_id:date))

# exclure certaines colonnes et garder toutes les autres

OISON_taxon %>% 
  dplyr::select(!c(nom_vernaculaire,nom_scientifique))


#fonction starts_with()

OISON_taxon %>% 
  dplyr::select(starts_with("nom"))

#fonction contains

OISON_taxon %>% 
  dplyr::select(contains("recherche")|contains("obs"))


#fonction  any_of() permet de selezctionner si c'est present

vecteur_nom_colonnes <- c("non_vernaculaire","nom_PMCC","date")

OISON_taxon %>% 
  dplyr::select(any_of(vecteur_nom_colonnes))


#sélectionner tt ce qui est numéric

OISON_taxon %>% 
  dplyr::select(where(is.numeric))

                