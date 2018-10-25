#! /bin/sh -xv
yDATE=`date +%Y`;
wDATE=`date +%V`;
ownDATE=`expr $wDATE + 1`;

Date=`date +%Y-%m-%d`;
ASN=`grep "ASN|" asnb.txt | tr "|" " " | awk '{print $2}'`;
ASN2=`grep "ASNEquity2|" asnb.txt | tr "|" " " | awk '{print $2}'`;
ASN3=`grep "ASNImbang1|" asnb.txt | tr "|" " " | awk '{print $2}'`;
ASGD=`grep "ASNImbang2|" asnb.txt | tr "|" " " | awk '{print $2}'`;
ASGK=`grep "ASNEquity3|" asnb.txt | tr "|" " " | awk '{print $2}'`;
ASGS=`grep "ASNSara1|" asnb.txt | tr "|" " " | awk '{print $2}'`;

echo $ASN $ASN2 $ASN3 $ASGD $ASGK $ASGS $Date;

mysql -u<user> -p<password> share << EOF
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASN', '$ASN', '$Date');
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASNEquity2', '$ASN2', '$Date');
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASNImbang1', '$ASN3', '$Date');
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASNImbang2', '$ASGD', '$Date');
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASNEquity3', '$ASGK', '$Date');
        INSERT INTO asnb(id, share_name, price, date) VALUES (NULL, 'ASNSara1', '$ASGS', '$Date');
EOF
