drop table if exists faa.otp_cc5;
CREATE TABLE faa.otp_cc5  (like otp_r)
WITH (appendonly=true, orientation=column, COMPRESSTYPE=ZLIB, COMPRESSLEVEL=5) ;
