Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1295C2BD09
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jul 2024 07:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Dh4Hgzir2OShffYuAeUA/VUl17A/Q7QA+udNQLIouHw=; b=CBAXO5dVrKTM0oEYvk0wpFt8UF
	/4stySAruOjkSZUrVGitkTdTTrbsib3G4a0Ce0lEnSlrCAN7vI04QEAortdAWda/1pI2igXLwVXin
	AlHuofX8pChjvS87l4+GsUY88eDY7Fn6FjLgIiwI6JVBVzyWcjXUhQUkn8NOET0LmpGFHpmozMC9i
	3ElE+i4j8I75b5sPaV0NCKXEjL8RvxIMrD4kndPKBVvI7Q1x+JsLk+TGpCRIcr2cp8lcuExmPOOex
	1U3fc6+e7oVgENIQHMvW9PF1TjmcLdGjy6h/Bf8nt4q10JknlbkiGJcRv9rKCgi16nhE/bY7ELhmH
	3B8UFlHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuQc-00000009Kdn-4Bhx;
	Wed, 03 Jul 2024 07:29:23 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOuQZ-00000009KdO-3uzM
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jul 2024 07:29:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1719991759; x=1751527759;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XH8pzdAoHuWv8DznMXqsk1aeuJ++vg5q3W+27mPM9vo=;
  b=zRck99NiIda5xvBPOF/+9zrjUQJFzOy0LxfNXlhdG9JtghqHJYVch9II
   TXzykS8+2/K5DVpUrX9sAAyPxSdlmlMFjqc/coYy+97ythJhAC2NfbDU9
   nyelyHRBCn29/KURgWJlSbScx8VqTyUMoPJtzZYU0vmrpqb3cZ0Zmftrz
   rcIqXmSidnIrngJoHAYg/h6lf6nNhnJQaYs9SZUzRGeYa0c5AfCtuusky
   Q1Ak7hk74By8bWPa3PkuSVp+tCVfnLDCc3Etu+sG6bSMlN0Y8eiWSbxtn
   el7SDsojEuNf7tm2zasr7YosT2phBwt6xZhLPP+QIQCni4YckRO6EiYaE
   Q==;
X-CSE-ConnectionGUID: feGJv0yDT+igZZ1QI9ykeA==
X-CSE-MsgGUID: ChZ+M0e1TT+Kc9XQeYII1A==
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="asc'?scan'208";a="28765840"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 03 Jul 2024 00:29:16 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Wed, 3 Jul 2024 00:29:00 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex01.mchp-main.com (10.10.85.143)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Wed, 3 Jul 2024 00:28:57 -0700
Date: Wed, 3 Jul 2024 08:28:36 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Serge Semin <fancer.lancer@gmail.com>
CC: Samuel Holland <samuel.holland@sifive.com>, Kanak Shilledar
	<kanakshilledar@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown
	<broonie@kernel.org>, Rob Herring <robh@kernel.org>, Jisheng Zhang
	<jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-spi@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v2 2/3] spi: dw-mmio: update dw_spi_mmio_of_match struct
 with thead
Message-ID: <20240703-garbage-explicit-bd95f8deb716@wendy>
References: <20240701121355.262259-2-kanakshilledar@gmail.com>
 <20240701121355.262259-4-kanakshilledar@gmail.com>
 <f8604c68-8866-447b-a874-562bdad1df79@sifive.com>
 <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs>
MIME-Version: 1.0
In-Reply-To: <23gvjkszxvf6zehiqetjfmtf67nlpnnfmhgx234jnxwrtmbdpr@4yv64sz2kpcs>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240703_002920_120790_758CB5B8 
X-CRM114-Status: GOOD (  31.58  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1853000602594245397=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============1853000602594245397==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="wONVh+6L225rrd86"
Content-Disposition: inline

--wONVh+6L225rrd86
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 01, 2024 at 09:57:20PM +0300, Serge Semin wrote:
> Hi folks
>=20
> On Mon, Jul 01, 2024 at 08:17:29AM -0500, Samuel Holland wrote:
> > Hi Kanak,
> >=20
> > On 2024-07-01 7:13 AM, Kanak Shilledar wrote:
> > > updated the struct of_device_id dw_spi_mmio_of_match to include
> > > the updated compatible value for TH1520 SoC ("thead,th1520-spi")
> > > to initialize with dw_spi_pssi_init().
> > >=20
> > > Signed-off-by: Kanak Shilledar <kanakshilledar@gmail.com>
> > > ---
> > > Changes in v2:
> > > - Separated from a single patch file.
> > > ---
> > >  drivers/spi/spi-dw-mmio.c | 1 +
> > >  1 file changed, 1 insertion(+)
> > >=20
> > > diff --git a/drivers/spi/spi-dw-mmio.c b/drivers/spi/spi-dw-mmio.c
> > > index 819907e332c4..39e3d46ebf5d 100644
> > > --- a/drivers/spi/spi-dw-mmio.c
> > > +++ b/drivers/spi/spi-dw-mmio.c
> > > @@ -419,6 +419,7 @@ static const struct of_device_id dw_spi_mmio_of_m=
atch[] =3D {
> > >  	{ .compatible =3D "microchip,sparx5-spi", dw_spi_mscc_sparx5_init},
> > >  	{ .compatible =3D "canaan,k210-spi", dw_spi_canaan_k210_init},
> > >  	{ .compatible =3D "amd,pensando-elba-spi", .data =3D dw_spi_elba_in=
it},
> > > +	{ .compatible =3D "thead,th1520-spi", .data =3D dw_spi_pssi_init},
> >=20
> > Your binding requires snps,dw-apb-ssi as a fallback compatible string, =
which is
> > already supported by this driver and uses the same match data. So you d=
on't need
> > this patch; its only effect is to make the kernel larger.
>=20
> Agree with Samuel comment. Indeed there is no point in adding the
> vendor-specific device-name supported in the driver if the fallback
> compatible works as-is.

FWIW, Mark picked up the binding alone so I think there's nothing for
Kanak to do here & the driver patch should just be forgotten about :)

> >From that perspective we shouldn't have merged in the patch adding the
> Renesas RZN1 SPI device name support, since the generic fallback
> compatible works for it. On the contrary the Microsemi Ocelot/Jaguar2
> SoC SPI DT-bindings shouldn't have been defined with the generic
> fallback compatible since should the device be bound via the generic
> name it won't work as expected.
>=20
> Although, it's better to hear out what Rob, Conor or Krzysztof think
> about this.

I agree with what you've written. If the fallback works identically, then
the specific compatible shouldn't be added here. And if the fallback
will cause the device to misbehave (or not behave at all), then it
should not have been added.
I'm not sure if the Microsemi stuff is in the "won't work {,properly}"
camp or in the "will work in a limited fashion" camp. The latter would
be suitable for a fallback, the former not.

Cheers,
Conor.


--wONVh+6L225rrd86
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoT9owAKCRB4tDGHoIJi
0jYGAP9sjC9GgGM9qE1ZoqzHHiaERajD3hAFoKB9OYEHsOFtxQEAl1g8BT7QyaMo
nMrjiPXoOmUwVmAt6fFAiWSAim+W7ws=
=Z2Ad
-----END PGP SIGNATURE-----

--wONVh+6L225rrd86--


--===============1853000602594245397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1853000602594245397==--

