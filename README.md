# Neuroaculturación Embera — Maestría Uniandes

Proyecto de investigación de maestría sobre el desempeño neuropsicológico y el proceso de aculturación en la comunidad indígena **Embera Chamí** (Colombia). Este repositorio contiene los datos procesados, scripts de análisis en R, figuras, y documentos del manuscrito final.

---

## Descripción del estudio

- **Población**: Comunidad indígena Embera Chamí, resguardo Honduras Chamí (Colombia)
- **Muestra**: n = 88 participantes (tras exclusión de 11 participantes del piloto)
- **Objetivo**: Examinar la relación entre el nivel de aculturación y el rendimiento en una batería neuropsicológica, considerando variables sociodemográficas y calidad de vida

### Instrumentos aplicados

| Dominio | Instrumento |
|---|---|
| Screening cognitivo | MMSE |
| Salud mental | PHQ-9, Escala de Barthel |
| Memoria verbal | HVLT-R |
| Memoria visoespacial | Figura de Rey |
| Atención | BTA, Stroop |
| Función ejecutiva | M-WCST, TMT |
| Velocidad de procesamiento | SDMT |
| Fluencia verbal | Fluencia fonológica y semántica |
| Aculturación | Cuestionario de aculturación (16 ítems) |
| Calidad de vida | SF-36 |
| Competencia lingüística | Cuestionario de competencia lingüística |

---

## Estructura del repositorio

```
Maestria_Uniandes/
│
├── 01_Articulo1/               # Artículo principal
│   ├── data/                   # Base de datos original
│   │   └── Database_indígenas_colombia_ORIGIN.xlsx
│   ├── scripts/                # Scripts de análisis
│   │   ├── 00_preparacion_datos.Rmd   # Limpieza, puntajes y exportación
│   │   └── 00_preparacion_datos.html  # Salida renderizada
│   ├── outputs/                # Bases de datos procesadas y tablas
│   │   ├── database_limpia.csv
│   │   ├── embera_chami_codebook.csv
│   │   ├── embera_chami_neuropsych_data_osf.csv
│   │   ├── Table1_SampleCharacteristics.docx
│   │   └── Table2_NeuropsychScores.docx
│   └── figures/                # Figuras generadas
│       ├── correlation_matrix-1.png
│       ├── distribution_plots-1.png
│       ├── figure_acculturation_effects-1.png
│       ├── figure_education_effects-1.png
│       ├── influence_diagnostics-1.png
│       ├── missing_data-1.png
│       └── qq_plots-1.png
│
├── Collaboration Zapata/       # Materiales de colaboración y análisis exploratorios
│   ├── Articles/               # Biblioteca de referencias (PDFs)
│   ├── Datos/                  # Procesamiento inicial de datos
│   │   ├── Data r/             # Scripts y datos preliminares en R
│   │   ├── Datos2/             # Proyecto RStudio secundario
│   │   └── z_score/            # Normas y puntuaciones Z (Colombia)
│   └── Protocolo/              # Instrumentos y documentos del protocolo
│       ├── Documentos/         # Ética y documentos administrativos
│       ├── Piloto/             # Datos del estudio piloto
│       └── Tamizaje/           # Instrumentos de tamizaje
│
├── PG2/                        # Trabajo de Grado II — manuscrito final
│   └── PG2/
│       ├── Manuscript_zapata_17_01_2021.docx
│       ├── Manuscript_zapata_17_01_2021.pdf
│       └── ...                 # Versiones previas y tablas
│
└── outputs/                    # Salidas raíz del proyecto
    ├── database_limpia.csv
    ├── database_con_puntajes.csv
    └── ac_scores.csv
```

---

## Flujo de análisis

```
Database_indígenas_colombia_ORIGIN.xlsx
        ↓
00_preparacion_datos.Rmd
  (limpieza, puntuación, exclusiones)
        ↓
database_limpia.csv  +  figuras  +  tablas
        ↓
Manuscrito final (PG2/)
```

---

## Requisitos

- R ≥ 4.0
- Paquetes principales: `tidyverse`, `psych`, `knitr`, `rmarkdown`, `flextable`

---

## Autor

**Carlos Zapata** — Maestría en Epidemiología Clínica, Universidad de los Andes  
Contacto: caenzabo@gmail.com
