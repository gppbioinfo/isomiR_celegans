#############
# Written for isomiR project by Ganesh Panzade
# The code is used to perform enrichment analysis for isomiR/miR target gene list
# Usage: Rscript weggestalt-ORAenrichment.R target_list output_folder type(biological_process, cellular_component, molecular_function, kegg_pathway)
#############

require(WebGestaltR)

args <- commandArgs(trailingOnly = TRUE)

#outfile=paste(args, ".png", sep="")

cType=args[3]

#WebGestaltR(enrichMethod = "ORA" , organism = "celegans", enrichDatabase = cType, enrichDatabaseFile = NULL, enrichDatabaseType = "genesymbol", enrichDatabaseDescriptionFile = NULL, interestGeneFile = args[1], interestGene = NULL, interestGeneType = "genesymbol", referenceGeneType = "genesymbol", referenceSet = "genome", minNum = 5, sigMethod = "fdr", fdrMethod = "BH", fdrThr = 0.05, isOutput = TRUE, outputDirectory = getwd(), projectName = args[2], hostName = "http://www.webgestalt.org/")


WebGestaltR(enrichMethod = "ORA" , organism = "celegans", enrichDatabase = cType, enrichDatabaseFile = NULL, enrichDatabaseType = "ensembl_gene_id", enrichDatabaseDescriptionFile = NULL, interestGeneFile = args[1], interestGene = NULL, interestGeneType = "ensembl_gene_id", referenceGeneType = "ensembl_gene_id", referenceSet = "genome", minNum = 1, sigMethod = "fdr", fdrMethod = "BH", fdrThr = 0.01, isOutput = TRUE, outputDirectory = getwd(), projectName = args[2], hostName = "http://www.webgestalt.org/")

