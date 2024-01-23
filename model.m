function [y_mod] = model(q)
w1 = [ -0.359861402210000	0.104275732050000	-2.46075227430000	 1.66681062270000;
        0.606025016190000	1.48703733750000	-0.323340360740000	 0.449555591460000;
        0.0183073103020000	0.143650617560000	 0.198655100320000	 2.35858807540000;
       -0.180648499080000  -0.00353635806270000	 0.234673978120000	 0.421587963500000;
        0.111058613780000	0.100762900790000	 1.01655197040000	-0.524614607260000;
       -0.00845564785890000	0.00417396073530000	-1.12463185790000	 0.503402771970000;
       -1.04016076330000   -0.498510196730000	-0.351430345730000	 0.720969106580000];
w10 = [-1.153159976300000;0.313830795780000;-1.806812572500000;1.118063661300000;1.754960072600000;0.211887555070000;-0.780039511380000];
w2 = [-0.231207011230000,0.063666669272000,0.041711773102000,0.428340518200000,1.019345733000000,-1.210729867900000,0.068333468782000];
w20 = -1.177458461100000;

y_mod = w20 + w2*tanh(w10+w1*q);
end