CREATE DATABASE QLBANHANG;
USE QLBANHANG;

CREATE TABLE KHACHHANG
(
MAKH CHAR(4),
HOTEN VARCHAR(40),
DCHI VARCHAR(50),
SODT VARCHAR(20),
NGSINH SMALLDATETIME,
DOANHSO MONEY,
NGDK SMALLDATETIME
);
----
ALTER TABLE KHACHHANG
ALTER COLUMN MAKH CHAR(4) NOT NULL;
ALTER TABLE KHACHHANG
ADD CONSTRAINT KHACHHANG_PK PRIMARY KEY (MAKH);

ALTER TABLE KHACHHANG
ADD LOAIKH TINYINT;
----
CREATE TABLE NHANVIEN
(
MANV CHAR(4),
HOTEN VARCHAR(40),
NGVL SMALLDATETIME,
SODT VARCHAR(20)
);
--
ALTER TABLE NHANVIEN
ALTER COLUMN MANV CHAR(4) NOT NULL;

ALTER TABLE NHANVIEN
ADD CONSTRAINT NHANVIEN_PK PRIMARY KEY(MANV);
--

CREATE TABLE SANPHAM
(
MASP CHAR(4),
TENSP VARCHAR(40),
DVT VARCHAR(20),
NUOCSX VARCHAR(40),
GIA MONEY
);
----
ALTER TABLE SANPHAM
ALTER COLUMN MASP CHAR(4) NOT NULL;

ALTER TABLE SANPHAM
ADD CONSTRAINT SANPHAM_PK PRIMARY KEY(MASP);
----
CREATE TABLE HOADON
(
SOHD CHAR(4),
NGHD SMALLDATETIME,
MAKH CHAR(4),
MANV CHAR(4),
TRIGIA MONEY
);
----
ALTER TABLE HOADON
ALTER COLUMN SOHD CHAR(4) NOT NULL;

ALTER TABLE HOADON
ADD CONSTRAINT HOADON_PK PRIMARY KEY(SOHD);

ALTER TABLE HOADON ADD CONSTRAINT Fk_HOADON_MAKH
FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH);

ALTER TABLE HOADON ADD CONSTRAINT FK_HOADON_MANV
FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV);
----
CREATE TABLE CTHD
(
SOHD CHAR(4),
MASP CHAR(4),
SL INT
);
----
ALTER TABLE CTHD
ALTER COLUMN SOHD CHAR(4) NOT NULL;
ALTER TABLE CTHD
ALTER COLUMN MASP CHAR(4) NOT NULL;

ALTER TABLE CTHD
ADD CONSTRAINT CTHD_PK PRIMARY KEY (SOHD,MASP);


-----------------------PHAN 1:
----CAU 6:
ALTER TABLE KHACHHANG
ALTER COLUMN LOAIKH VARCHAR(20);

ALTER TABLE KHACHHANG
DROP CONSTRAINT CHECK_LOAIKH;

ALTER TABLE KHACHHANG
ADD CONSTRAINT CHECK_LOAIKH
CHECK(LOAIKH IN('VANGLAI','THUONGXUYEN','VIP'));
----CAU 7:
ALTER TABLE SANPHAM
ADD CONSTRAINT CHECK_DVT
CHECK(DVT IN('CAY','HOP','CAI','QUYEN','CHUC'));
----CAU 8:
ALTER TABLE SANPHAM
ADD CONSTRAINT CHECH_GIA
CHECK(GIA >=500);

-----------------------PHAN 2:
--------------------PHAN 2:
SET DATEFORMAT DMY
----CAU 1:
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV01','NGUYEN NHU NHUT','0927345678','13/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV02','LE THI PHI YEN','0987567390','21/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV03','NGUYEN VAN B','0997047382','27/04/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV04','NGO THANH TUAN','0913758498','24/06/2006')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES ('NV05','NGUYEN THI TRUC THANH','0918590387','20/07/2006')

INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH01','NGUYEN VAN A','731TRAN HUNG DAO,Q5,THHCM','08823451','22/10/1960','22/07/2006','13060000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH02','TRAN NGOC HAN','23/5NGUYEN TRAI,Q5,TPHCM','0908256478','03/04/1974','30/07/2006','280000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH03','TRAN NGOC LINH','45NGUYEN CANH CHAN,Q1,TPHCM','0938776266','10/06/1980','05/05/2006','3860000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH04','TRAN MINH LONG','50/34LE DAI HANH,Q10,TPHCM','0917325476','09/03/1965','02/10/2006','250000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH05','LE NHAT MINH','34TRUONG DINH,Q3,TPHCM','08246108','10/03/1950','28/10/2006','21000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH06','LE HOAI THUONG','227NGUYEN VAN CU,Q5,TPHCM','08631738','31/12/1981','24/11/2006','915000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH07','NGUYEN VAN TAM','32/3 TRAN BINH TRONG,Q5,TPHCM','0916783565','06/06/1971','01/12/2006','12500')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH08','PHAN THI THANH','45/2 AN DUONG VUONG,Q5,TPHCM','0938435756','10/01/1971','13/12/2006','365000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH09','LE HA VINH','837 LE HONG PHONG,Q5,TPHCM','08654763','03/03/1979','14/01/2007','70000')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,NGDK,DOANHSO) VALUES ('KH10','HA DUY LAP','34/34B NGUYEN TRAI,Q5,TPHCM','08768904','02/05/1983','16/01/2007','67500')

INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC01','BUT CHI','CAY','SINGAPORE','3000')
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC02','BUT CHI','CAY','SINGAPORE',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC03','BUT CHI','CAY','VIETNAM',3500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BC04','BUT CHI','HOP','VIETNAM',30000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB01','BUT BI','CAY','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB02','BUT BI','CAY','TRUNGQUOC',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('BB03','BUT BI','HOP','THAILAN',100000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV01','TAP 100 TRANG GIAY MONG','QUYEN','TRUNGQUOC',2500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV02','TAP 200 TRANG GIAY MONG','QUYEN','TRUNGQUOC',4500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV03','TAP 100 TRANG GIAY TOT','QUYEN','VIETNAM',3000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV04','TAP 200 TRANG GIAY TOT','QUYEN','VIETNAM',5500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV05','TAP 100 TRANG ','CHUC','VIETNAM',23000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV06','TAP 200 TRANG ','CHUC','VIETNAM',53000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('TV07','TAP 100 TRANG ','CHUC','TRUNGQUOC',34000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST01','SO TAY 500 TRANG','QUYEN','TRUNGQUOC',40000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST02','SO TAY LOAI 1','QUYEN','VIETNAM',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST03','SO TAY LOAI 2','QUYEN','VIETNAM',51000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST04','SO TAY','QUYEN','THAILAN',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST05','SO TAY MONG','QUYEN','THAILAN',20000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST06','PHAN VIET BANG','HOP','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST07','PHAN KHONG BUI','HOP','VIETNAM',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST08','BONG BAMG','CAI','VIETNAM',1000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST09','BUT LONG','CAY','VIETNAM',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES ('ST10','BUT LONG','CAY','TRUNGQUOC',7000)

INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1001,'27/07/2006','KH01','NV01',320000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1002,'10/08/2006','KH01','NV02',840000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1003,'23/08/2006','KH02','NV01',100000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1004,'01/09/2006','KH02','NV01',180000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1005,'20/10/2006','KH01','NV02',3800000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1006,'16/10/2006','KH01','NV03',2430000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1007,'28/10/2006','KH03','NV03',510000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1008,'28/10/2006','KH01','NV03',440000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1009,'28/10/2006','KH03','NV04',200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1010,'01/11/2006','KH01','NV01',5200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1011,'04/11/2006','KH04','NV03',250000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1012,'30/11/2006','KH05','NV03',21000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1013,'12/12/2006','KH06','NV01',5000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1014,'31/12/2006','KH03','NV02',3150000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1015,'01/01/2007','KH06','NV01',910000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1016,'01/01/2007','KH07','NV02',12500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1017,'02/01/2007','KH08','NV03',35000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1018,'13/01/2007','KH08','NV03',330000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1019,'13/01/2007','KH01','NV03',30000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1020,'14/01/2007','KH09','NV04',70000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1021,'16/01/2007','KH10','NV03',67500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1022,'16/01/2007',NULL,'NV03',7000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES (1023,'17/01/2007',NULL,'NV01',330000)

INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'ST01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'BC01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'BC02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1001,'ST08',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BC04',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BB01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1002,'BB02',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1003,'BB03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1004,'TV04',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1005,'TV05',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1005,'TV06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'TV07',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'ST01',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1006,'ST02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1007,'ST03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1008,'ST04',8)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1009,'ST05',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'TV07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST08',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'ST04',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1010,'TV03',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1011,'ST06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1012,'ST07',3)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1013,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BC02',80)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BB02',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BC04',60)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1014,'BB01',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1015,'BB02',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1015,'BB03',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1016,'TV01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV02',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV03',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1017,'TV04',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1018,'ST04',6)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1019,'ST05',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1019,'ST06',2)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1020,'ST07',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'TV01',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1021,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1022,'ST07',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES (1023,'ST04',6)

----CAU 2:
SELECT *INTO KHACHHANG1 FROM KHACHHANG
SELECT *INTO SANPHAM1 FROM SANPHAM

----CAU 3:
UPDATE SANPHAM1 
SET GIA=GIA*1.05
WHERE NUOCSX='THAILAN';

----cau 4:
UPDATE SANPHAM1
SET GIA=GIA-0.05*GIA
WHERE NUOCSX='TRUNGQUOC'AND GIA <=10000;
----cau 5:
UPDATE KHACHHANG1
SET LOAIKH='VIP'
WHERE (NGDK<1/1/2007 AND DOANHSO>10000000) OR (NGDK>1/1/2007 AND DOANHSO>2000000);

-----------------------PHAN 3:
--CAU 1:
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC';
--CAU 2:
SELECT MASP,TENSP,DVT
FROM SANPHAM
WHERE DVT='CAY' OR DVT='QUYEN';
----CAU 3:
SELECT MASP,TENSP
FROM SANPHAM
WHERE MASP like 'B%01';
----CAU 4:
SELECT MASP,TENSP, GIA
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC' and GIA between 30000 and 40000;
----CAU 5:
SELECT MASP,TENSP,GIA
FROM SANPHAM
WHERE (NUOCSX='TRUNGQUOC' OR NUOCSX='THAILAN') AND (GIA BETWEEN 30000 AND 40000);
----CAU 6:
SELECT SOHD,TRIGIA
FROM HOADON
WHERE YEAR(NGHD)=2007 AND MONTH(NGHD)=1 AND (DAY(NGHD)=1 OR DAY(NGHD)=2);
----CAU 7:
SELECT SOHD,TRIGIA
FROM HOADON
WHERE MONTH(NGHD)=1 AND YEAR(NGHD)=2007 
ORDER BY NGHD ASC,TRIGIA DESC;
----CAU 8:
SELECT KH.MAKH,HOTEN
FROM KHACHHANG KH,HOADON HD
WHERE YEAR(NGHD)=2007 AND MONTH(NGHD)=1 AND DAY(NGHD)=1 AND KH.MAKH=HD.MAKH;
----cau 9:
SELECT SOHD, TRIGIA
FROM HOADON,NHANVIEN
WHERE NHANVIEN.HOTEN='NGUYEN VAN B' 
	AND YEAR(NGHD)=2006 AND MONTH(NGHD)=10 AND DAY(NGHD)=28 
	AND HOADON.MANV=NHANVIEN.MANV;
----CAU 10:
SELECT SP.MASP,TENSP
FROM SANPHAM SP,HOADON HD, KHACHHANG KH, CTHD CT
WHERE KH.MAKH=HD.MAKH AND SP.MASP=CT.MASP AND HD.SOHD=CT.SOHD
AND KH.HOTEN='NGUYEN VAN A'
AND YEAR(NGHD)=2006 AND MONTH(NGHD)=10;
--cau 11:
SELECT SOHD,MASP
FROM CTHD
WHERE MASP ='BB01' OR MASP='BB02';
--CAU 12:
SELECT SOHD, MASP,SL
FROM CTHD
WHERE MASP IN ('BB01' ,'BB02') and SL BETWEEN 10 AND 20;
--CAU 13:
--CACH 1:
SELECT SOHD
FROM CTHD WHERE MASP='BB01' AND SL BETWEEN 10 AND 20 AND SOHD IN
	(SELECT SOHD
	FROM CTHD
	WHERE MASP='BB02' AND SL BETWEEN 10 AND 20);
--CACH 2:
(SELECT SOHD
FROM CTHD WHERE MASP='BB01' AND SL BETWEEN 10 AND 20)
INTERSECT
(SELECT SOHD
FROM CTHD WHERE MASP='BB02' AND SL BETWEEN 10 AND 20);
--CAU 14:
SELECT MASP,TENSP
FROM SANPHAM
WHERE NUOCSX='TRUNGQUOC'UNION
(
SELECT CT.MASP,TENSP
FROM SANPHAM SP,HOADON HD,CTHD CT
WHERE SP.MASP=CT.MASP
AND CT.SOHD=HD.SOHD
AND YEAR(NGHD)=2007 AND MONTH(NGHD)=1 AND DAY(NGHD)=1);
--CAU 15:
SELECT MASP,TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT MASP FROM CTHD)
--CAU 16:
SELECT MASP,TENSP
FROM SANPHAM
WHERE MASP NOT IN (SELECT SP.MASP FROM SANPHAM SP, HOADON HD, CTHD CT
					WHERE SP.MASP=CT.MASP AND HD.SOHD=CT.SOHD 
					AND YEAR(HD.NGHD)='2006');

--CACH 2:
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NOT EXISTS (
	SELECT * FROM CTHD CT
	JOIN  HOADON HD ON HD.SOHD=CT.SOHD
	WHERE CT.MASP=SP.MASP
	AND YEAR(HD.NGHD)=2006);
--CAU 17:
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NUOCSX='TRUNGQUOC'
--
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE NUOCSX='TRUNGQUOC' AND NOT EXISTS (SELECT HD.NGHD
											FROM HOADON HD, SANPHAM SP, CTHD CT
											WHERE SP.MASP =CT.MASP AND HD.SOHD=CT.SOHD
											AND YEAR(HD.NGHD)=2006);

----CAU 17:
SELECT SP.MASP,SP.TENSP
FROM SANPHAM SP
WHERE NOT EXISTS(
	SELECT * FROM CTHD CT
	JOIN HOADON HD ON HD.SOHD=CT.SOHD
	WHERE SP.NUOCSX='TRUNGQUOC'
	AND YEAR(HD.NGHD)=2006);
--CAU 18:
SELECT DISTINCT A.SOHD
FROM CTHD A
WHERE NOT EXISTS (
	SELECT * FROM SANPHAM B
	WHERE NUOCSX='SINGAPORE'
		AND NOT EXISTS (
			SELECT * FROM CTHD C
			WHERE C.MASP=B.MASP AND C.SOHD=A.SOHD))
