* Encoding: UTF-8.

* Recodificar educacion*

RECODE  Escolaridad (0 thru 12=0) (ELSE=1) INTO EducacionR.
EXECUTE.

*Calculo de Z*

COMPUTE Pred_HOPKINS_Total_ensayos=19.075 +((Edad-58)*-0.122) + (-0.001* ((Edad-58)**2)) + (3.042 * EducacionR) + (-0.801*sexo).
COMPUTE E_HOPKINS_Total_ensayos=HOPKINS_Total_ensayos - Pred_HOPKINS_Total_ensayos.
COMPUTE Z_HOPKINS_Total_ensayos=E_HOPKINS_Total_ensayos/4.230.
COMPUTE Hopkins_recallP=CDF.NORMAL(Z_HOPKINS_Total_ensayos,0,1).
EXECUTE. 

COMPUTE Pred_Hopkins_delayed= 6.203 +((Edad-58)*-0.060) + (-0.001*((Edad-58)**2)) + (1.322 * EducacionR).
COMPUTE E_Hopkins_delayed =Hopkins_delayed - Pred_Hopkins_delayed.
COMPUTE Z_Hopkins_delayed = E_Hopkins_delayed/2.262.
COMPUTE Hopkins_delayedP =CDF.NORMAL(Z_Hopkins_delayed,0,1).
EXECUTE. 

COMPUTE Pred_hopkins_recognition= 10.747 +((Edad-58)*-0.025)+ (-0.001*((Edad-58)**2)) + (0.356 * EducacionR).
COMPUTE E_hopkins_recognition =hopkins_recognition - Pred_hopkins_recognition.
IF (Pred_hopkins_recognition <= 10.279) Z_hopkins_recognition = E_hopkins_recognition/2.140.
IF (Pred_hopkins_recognition <= 10.751 and  Pred_hopkins_recognition >=10.280) Z_hopkins_recognition = E_hopkins_recognition/1.700.
IF (Pred_hopkins_recognition <= 11.108 and  Pred_hopkins_recognition >=10.752) Z_hopkins_recognition = E_hopkins_recognition/1.292.
IF (Pred_hopkins_recognition >= 11.109) Z_hopkins_recognition= E_hopkins_recognition/1.228.
COMPUTE Hopkins_recognitionP =CDF.NORMAL(Z_hopkins_recognition,0,1).
EXECUTE.

COMPUTE Pred_REY_copia  = 28.004 + (-.223 * (Edad-58)) + (-0.003 *((Edad-58)**2)) + (4.013 * EducacionR) + (0.06 * ((Edad-58) * EducacionR)).
COMPUTE E_REY_copia = REY_copia - Pred_REY_copia.
IF (Pred_REY_copia <= 24.064)  Z_REY_copia =  E_REY_copia/8.566.
IF (Pred_REY_copia <= 28.267 and Pred_REY_copia >=24.065) Z_REY_copia = E_REY_copia/7.433.
IF (Pred_REY_copia <= 31.713 and Pred_REY_copia >=28.268) Z_REY_copia = E_REY_copia/6.431.
IF (Pred_REY_copia >=31.714) Z_REY_copia = E_REY_copia/4.255.
COMPUTE REY_copiaP =CDF.NORMAL(Z_REY_copia,0,1).
EXECUTE.

COMPUTE Pred_Rey_Immediate_Recall = 13.085 + ((Edad-58)*-.204) + (4.158 * EducacionR) + (1.768 * sexo).
COMPUTE E_Rey_Immediate_Recall= Rey_Immediate_Recall - Pred_Rey_Immediate_Recall.
IF (Pred_Rey_Immediate_Recall <= 11.012) Z_Rey_Immediate_Recall = E_Rey_Immediate_Recall /5.693.
IF (Pred_Rey_Immediate_Recall <=14.484 and Pred_Rey_Immediate_Recall >=11.013) Z_Rey_Immediate_Recall = E_Rey_Immediate_Recall/6.732.
IF (Pred_Rey_Immediate_Recall <= 18.030 and Pred_Rey_Immediate_Recall >=14.485) Z_Rey_Immediate_Recall = E_Rey_Immediate_Recall/7.314.
IF (Pred_Rey_Immediate_Recall >= 18.031) Z_Rey_Immediate_Recall = E_Rey_Immediate_Recall/6.752.
COMPUTE Rey_Immediate_RecallP =CDF.NORMAL(Z_Rey_Immediate_Recall,0,1).
EXECUTE.

COMPUTE Z_memoria = (Z_HOPKINS_Total_ensayos + Z_Hopkins_delayed +Hopkins_recognitionP + Z_REY_copia+Z_Rey_Immediate_Recall)/ SQRT(5).
EXECUTE   .


**Language**


COMPUTE Pred_M = 10.553 + ((Edad-58)*-0.085) + (-0.001*((Edad-58)**2)) + (4.041 * EducacionR).
COMPUTE E_Fonologica_M = Fonologica_M - Pred_M.
COMPUTE Z_Fonologica_M = E_Fonologica_M/4.065.
COMPUTE Letter_MP = CDF.NORMAL(Z_Fonologica_M,0,1).
EXECUTE.

COMPUTE Z_Fonologica_R = (Fonologica_R- 6.92)/4.18.
COMPUTE Z_Fonologica_P = (Fonologica_P- 8.43)/4.79.
EXECUTE.

COMPUTE Pred_animals = 15.225 + ((Edad-58)*-0.107) + (-0.001*((Edad-58)**2)) + (3.951 * EducacionR).
COMPUTE E_animals = animals - Pred_animals.
COMPUTE Z_animals = E_animals/4.192.
COMPUTE  AnimalsP = CDF.NORMAL(Z_animals,0,1).
EXECUTE. 

COMPUTE Pred_fruits = 13.637 + ((Edad-58)*-.081) + (-.001*(Edad-58)**2) + (2.568 * EducacionR) + (-1.511 * sexo).
COMPUTE E_fruits =  fruits - Pred_fruits.
COMPUTE Z_fruits = E_fruits/3.386.
COMPUTE FruitsP =CDF.NORMAL(Z_fruits,0,1).
EXECUTE. 

COMPUTE   Z_lenguage = (Z_Fonologica_M+Z_Fonologica_R+Z_Fonologica_P+Z_animals+Z_fruits)/ SQRT(5).
EXECUTE   .


**EF**


COMPUTE Pred_Wisconsin_Categories = 3.412 + ((Edad-58)*-.029) + (1.121 * EducacionR).
COMPUTE E_Wisconsin_Categories = WISCONSIN_categories - Pred_Wisconsin_Categories.
IF (Pred_WISCONSIN_categories <=3.008)  Z_WISCONSIN_categories = E_WISCONSIN_categories/1.801.
IF (Pred_WISCONSIN_categories <=3.593 and Pred_WISCONSIN_categories >=3.009) Z_WISCONSIN_categories = E_WISCONSIN_categories/1.717.
IF (Pred_WISCONSIN_categories <=4.304 and Pred_WISCONSIN_categories >=3.594) Z_WISCONSIN_categories = E_WISCONSIN_categories/1.835.
IF (Pred_WISCONSIN_categories >=4.305)  Z_WISCONSIN_categories = E_WISCONSIN_categories/1.434.
EXECUTE.

COMPUTE Pred_Wisconsin_Pers = 8.404 + ((Edad-58)*.086) + (-3.436 * EducacionR).
COMPUTE E_Wisconsin_Pers = MWCSTPerseveraciones - Pred_Wisconsin_Pers.
IF (Pred_Wisconsin_Pers <=5.731)  Z_Wisconsin_Pers = E_Wisconsin_Pers/4.858 *-1.
IF (Pred_Wisconsin_Pers <=7.958) Z_Wisconsin_Pers = E_Wisconsin_Pers/6.396*-1.
IF (Pred_Wisconsin_Pers <=9.671) Z_Wisconsin_Pers = E_Wisconsin_Pers/7.899*-1.
IF (Pred_Wisconsin_Pers >=9.672)  Z_Wisconsin_Pers = E_Wisconsin_Pers/8.811*-1.
EXECUTE.


COMPUTE Pred_Wisconsin_Er = 17.434 + ((Edad-58)*.129) + (-5.74 * EducacionR).
COMPUTE E_Wisconsin_Er = MWCSTErrores - Pred_Wisconsin_Er.
IF (Pred_Wisconsin_Er <=13.083)  Z_Wisconsin_Er = E_Wisconsin_Er/8.369 *-1.
IF (Pred_Wisconsin_Er <=16.763 and Pred_Wisconsin_Er >=13.084) Z_Wisconsin_Er = E_Wisconsin_Er/9.594*-1.
IF (Pred_Wisconsin_Er <=19.339 and Pred_Wisconsin_Er >=16.764) Z_Wisconsin_Er = E_Wisconsin_Er/9.788*-1.
IF (Pred_Wisconsin_Er >=19.340) Z_Wisconsin_Er = E_Wisconsin_Er/9.646*-1.
EXECUTE.

COMPUTE Pred_STROOP_WC = 31.486 + ((Edad-58)*-.411) + (-.004*(Edad-58)**2) + (5.241 * EducacionR) + (1.915 * sexo).
COMPUTE E_STROOP_WC = STROOP_WC - Pred_STROOP_WC.
IF (Pred_STROOP_WC <=25.108) Z_STROOP_WC = E_STROOP_WC/9.677.
IF (Pred_STROOP_WC<=32.343 and Pred_STROOP_WC >=25.109) Z_STROOP_WC = E_STROOP_WC/10.234.
IF (Pred_STROOP_WC<=38.723 and Pred_STROOP_WC >=32.344) Z_STROOP_WC = E_STROOP_WC/12.358.
IF (Pred_STROOP_WC >=38.724) Z_STROOP_WC = E_STROOP_WC/11.844.
EXECUTE. 

COMPUTE Pred_STROOP_I = -1.545 + ((Edad-58)*-.089)  + (2.855 * sexo).
COMPUTE E_STROOP_I = STROOP_I - Pred_STROOP_I.
COMPUTE Z_STROOP_I=E_STROOP_I/8.431.
EXECUTE. 

COMPUTE   Z_EF = (Z_WISCONSIN_categories+Z_Wisconsin_Pers+Z_Wisconsin_Pers+Z_STROOP_WC+Z_STROOP_I)/ SQRT(5).
EXECUTE   .


**Attention and speed procesing**


COMPUTE Pred_Stroop_Word = 78.951 + ((Edad-58)*-0.690) + (-0.011 *((Edad-58)**2)) + (13.413* EducacionR).
COMPUTE E_Stroop_Word= Stroop_Word- Pred_Stroop_Word.
IF (Pred_Stroop_Word <=25.108) Z_Stroop_Word = E_Stroop_Word/9.677.
IF (Pred_Stroop_Word <=32.343 and Pred_Stroop_Word >=25.109) Z_Stroop_Word = E_Stroop_Word/10.234.
IF (Pred_Stroop_Word <=38.723 and Pred_Stroop_Word >=32.344) Z_Stroop_Word = E_Stroop_Word/12.358.
IF (Pred_Stroop_Word >=38.724) Z_Stroop_Word = E_Stroop_Word/11.844.
COMPUTE Stroop_WordP = CDF.NORMAL(Z_Stroop_Word,0,1).
EXECUTE. 

COMPUTE Pred_Stroop_Color = 57.228 + ((Edad-58)*-0.594) + (-0.009*((Edad-58)**2)) + (8.393 * EducacionR).
COMPUTE E_Stroop_Color = Stroop_Color - Pred_Stroop_Color.
COMPUTE Z_Stroop_Color = E_Stroop_Color/15.205.
COMPUTE Stroop_ColorP = CDF.NORMAL(Z_Stroop_Color,0,1).
EXECUTE. 

COMPUTE Pred_TMT_A = 74.158 + ((Edad-58)*0.642) + (0.006*((Edad-58)**2)) + (-18.417 * EducacionR).
COMPUTE E_TMT_A = TMT_A - Pred_TMT_A.
IF (Pred_TMT_A <=60.384) Z_TMT_A = E_TMT_A/17.695*-1.
IF (Pred_TMT_A <=72.774 and Pred_TMT_A >=60.385) Z_TMT_A = E_TMT_A/20.957*-1.
IF (Pred_TMT_A <=84.980 and Pred_TMT_A >=72.775) Z_TMT_A = E_TMT_A/20.195*-1.
IF (Pred_TMT_A  >=84.981) Z_TMT_A = E_TMT_A/15.882*-1.
EXECUTE.

COMPUTE Pred_TMT_B = 184.949 + ((Edad-58)*2.403 ) + (0.009*((Edad-58)**2)) + (-81.197 * EducacionR) + (0.035*(((Edad-58)**2)*(EducacionR))).
COMPUTE E_TMT_B = TMT_B - Pred_TMT_B.
IF (Pred_TMT_B <=122.117) Z_TMT_B = E_TMT_B/37.717*-1.
IF (Pred_TMT_B <=179.732 and Pred_TMT_B >=122.118) Z_TMT_B = E_TMT_B/69.006*-1.
IF (Pred_TMT_B <=222.488 and Pred_TMT_B >=179.733) Z_TMT_B = E_TMT_B/74.558*-1.
IF (Pred_TMT_B >=222.489) Z_TMT_B = E_TMT_B/69.163*-1.
COMPUTE TMT_BP = 1-(CDF.NORMAL(Z_TMT_B,0,1)).
EXECUTE.

COMPUTE Pred_SDMT = 26.256 + ((Edad-58)*-0.399 ) + (0.001*(Edad-58))**2 + (13.549 * EducacionR) + (0.039*((Edad-58)*(EducacionR)))+(0.002*(((Edad-58)**2)*(EducacionR))).
COMPUTE E_SDMT = SDMT - Pred_SDMT.
IF (Pred_SDMT <=20.235) Z_SDMT = E_SDMT/9.970.
IF (Pred_SDMT <=27.097 and Pred_SDMT >=20.236) Z_SDMT = E_SDMT/10.468.
IF (Pred_SDMT <=37.126 and Pred_SDMT >=27.080) Z_SDMT = E_SDMT/11.563.
IF (Pred_SDMT >=37.127) Z_SDMT = E_SDMT/11.120.
COMPUTE SDMTP = CDF.NORMAL(Z_SDMT,0,1).
EXECUTE.

COMPUTE Pred_BTA = 12.857 + ((Edad-58)*-.086) + (0.0002*((Edad-58)**2))+ (2.719 * EducacionR).
COMPUTE E_BTA = BTA - Pred_BTA.
IF (Pred_BTA <=11.157)  Z_BTA = E_BTA/4.003.
IF (Pred_BTA <=13.038 and Pred_BTA >=11.172) Z_BTA = E_BTA/3.951.
IF (Pred_BTA <=13.855 and Pred_BTA >=13.114) Z_BTA = E_BTA/4.060.
IF (Pred_BTA >=13.856)  Z_BTA = E_BTA/3.267.
EXECUTE.

COMPUTE   Z_Attention = (Z_Stroop_Word+Z_Stroop_Color+Z_TMT_A+Z_TMT_B+Z_SDMT+Z_BTA)/ SQRT(6).
EXECUTE   .

COMPUTE P_memoria = CDF.NORMAL(Z_memoria,0,1)*100.
COMPUTE P_lenguage = CDF.NORMAL(Z_lenguage,0,1)*100.
COMPUTE P_fe = CDF.NORMAL(Z_EF,0,1)*100.
COMPUTE P_Atencion = CDF.NORMAL(Z_Attention,0,1)*100.
EXECUTE.

