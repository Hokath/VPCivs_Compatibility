INSERT INTO ArtDefine_LandmarkTypes(Type, LandmarkType, FriendlyName)
SELECT 'ART_DEF_IMPROVEMENT_LS_FLANDERS_COMMUNE', 'Improvement', 'COMMUNE';

INSERT INTO ArtDefine_Landmarks(Era, State, Scale, ImprovementType, LayoutHandler, ResourceType, Model, TerrainContour)
SELECT Era, State, 0.5,'ART_DEF_IMPROVEMENT_LS_FLANDERS_COMMUNE', LayoutHandler, ResourceType, Model, TerrainContour
FROM ArtDefine_Landmarks WHERE (ImprovementType = 'ART_DEF_IMPROVEMENT_CUSTOMS_HOUSE');

INSERT INTO ArtDefine_StrategicView(StrategicViewType, TileType, Asset)
  VALUES ('ART_DEF_IMPROVEMENT_LS_FLANDERS_COMMUNE', 'Improvement', 'FlandersLSUIAtlas256.dds');