CREATE TABLE [tohum_oz] (
	bitki_numarası integer(3) NOT NULL,
	bitki_cinsi varchar(30) NOT NULL,
	bitki_turu varchar(30) NOT NULL,
	bitki_çapı integer(30) NOT NULL,
	bitki_boyu integer(30) NOT NULL,
  CONSTRAINT [PK_TOHUM_OZ] PRIMARY KEY CLUSTERED
  (
  [bitki_numarası] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [yetiştirme] (
	bitki_cinsi varchar(30) NOT NULL,
	bitki_numarası integer(3) NOT NULL,
	beslenme_aralığı varchar(15) NOT NULL,
	yetisme_suresi varchar(15) NOT NULL,
  CONSTRAINT [PK_YETIşTIRME] PRIMARY KEY CLUSTERED
  (
  [bitki_cinsi] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [yerleske] (
	bitki_turu varchar(30) NOT NULL,
	iklim_tipi varchar(15) NOT NULL,
	toprak_tipi varchar(15) NOT NULL,
  CONSTRAINT [PK_YERLESKE] PRIMARY KEY CLUSTERED
  (
  [bitki_turu] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [fiyat_listesi] (
	etiket_no varchar(10) NOT NULL,
	bitki_cinsi varchar(30) NOT NULL,
	stok_no integer(5) NOT NULL,
	birim_fiyat integer(5) NOT NULL,
  CONSTRAINT [PK_FIYAT_LISTESI] PRIMARY KEY CLUSTERED
  (
  [etiket_no] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [bitki_stok] (
	stok_no integer(5) NOT NULL,
	bitki_numarası integer(3) NOT NULL,
	toplam_stok integer(5) NOT NULL,
	ekilecek integer(3) NOT NULL,
	fire_verenler integer(3) NOT NULL,
  CONSTRAINT [PK_BITKI_STOK] PRIMARY KEY CLUSTERED
  (
  [stok_no] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [kullanıcı_kayit] (
	id integer(3) NOT NULL,
	e-mail varchar(20) NOT NULL,
	sifre varchar(16) NOT NULL,
	adi varchar(25) NOT NULL,
	soyadi varchar(25) NOT NULL,
  CONSTRAINT [PK_KULLANıCı_KAYIT] PRIMARY KEY CLUSTERED
  (
  [id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [adres] (
	adres_id integer(3) NOT NULL,
	id integer(3) NOT NULL,
	il_no integer(3) NOT NULL,
	ilce_no integer(3) NOT NULL,
  CONSTRAINT [PK_ADRES] PRIMARY KEY CLUSTERED
  (
  [adres_id] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [iller] (
	il_no integer(3) NOT NULL,
	İl_adi varchar(50) NOT NULL,
  CONSTRAINT [PK_ILLER] PRIMARY KEY CLUSTERED
  (
  [il_no] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
CREATE TABLE [ilceler] (
	ilce_no integer(3) NOT NULL,
	ilce_adi varchar(50) NOT NULL,
  CONSTRAINT [PK_ILCELER] PRIMARY KEY CLUSTERED
  (
  [ilce_no] ASC
  ) WITH (IGNORE_DUP_KEY = OFF)

)
GO
ALTER TABLE [tohum_oz] WITH CHECK ADD CONSTRAINT [tohum_oz_fk0] FOREIGN KEY ([bitki_cinsi]) REFERENCES [yetiştirme]([bitki_cinsi])
ON UPDATE CASCADE
GO
ALTER TABLE [tohum_oz] CHECK CONSTRAINT [tohum_oz_fk0]
GO
ALTER TABLE [tohum_oz] WITH CHECK ADD CONSTRAINT [tohum_oz_fk1] FOREIGN KEY ([bitki_turu]) REFERENCES [yerleske]([bitki_turu])
ON UPDATE CASCADE
GO
ALTER TABLE [tohum_oz] CHECK CONSTRAINT [tohum_oz_fk1]
GO



ALTER TABLE [fiyat_listesi] WITH CHECK ADD CONSTRAINT [fiyat_listesi_fk0] FOREIGN KEY ([stok_no]) REFERENCES [bitki_stok]([stok_no])
ON UPDATE CASCADE
GO
ALTER TABLE [fiyat_listesi] CHECK CONSTRAINT [fiyat_listesi_fk0]
GO

ALTER TABLE [bitki_stok] WITH CHECK ADD CONSTRAINT [bitki_stok_fk0] FOREIGN KEY ([bitki_numarası]) REFERENCES [tohum_oz]([bitki_numarası])
ON UPDATE CASCADE
GO
ALTER TABLE [bitki_stok] CHECK CONSTRAINT [bitki_stok_fk0]
GO


ALTER TABLE [adres] WITH CHECK ADD CONSTRAINT [adres_fk0] FOREIGN KEY ([id]) REFERENCES [kullanıcı_kayit]([id])
ON UPDATE CASCADE
GO
ALTER TABLE [adres] CHECK CONSTRAINT [adres_fk0]
GO
ALTER TABLE [adres] WITH CHECK ADD CONSTRAINT [adres_fk1] FOREIGN KEY ([il_no]) REFERENCES [iller]([il_no])
ON UPDATE CASCADE
GO
ALTER TABLE [adres] CHECK CONSTRAINT [adres_fk1]
GO
ALTER TABLE [adres] WITH CHECK ADD CONSTRAINT [adres_fk2] FOREIGN KEY ([ilce_no]) REFERENCES [ilceler]([ilce_no])
ON UPDATE CASCADE
GO
ALTER TABLE [adres] CHECK CONSTRAINT [adres_fk2]
GO



