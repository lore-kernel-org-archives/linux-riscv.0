Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BDD3CDB47E
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 22:33:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddcBJO7+uXIzOGYN3rcxF+b+jhNwv3SLE7RBHkeLf28=; b=tbfzR4mMXu1sBEMmPkZxb/kOvE
	2hxQslnAFCHV47z8Aa7KpraD+ZhluYmL2MH9qJALXld/Pqxw6LtVbWpDVx+hggegqZ3wNemCoG3LH
	KrqHiuBkDml1BcZCxBIuZTH2X9m0NZnW0o9FC4TS7y+wTI6i+JvGYi4tpmdDP7giN3kVD9QaUI/iW
	jiVmGNY9ffnY9NjnBk++18z8mkA+A3NhiQWlnuCGBPJHLI2CSfXcPOMFpmvGO8K5/sR2g+gVDuB+L
	n9NG4dGpHEOEGsFJi9KEfErJM10cwzVxI96YD5E5xWYyz/k19Lw3fEbI4rgg2EWG4qdUTIyzfPyjo
	+SQrK1Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqhlK-00GqQu-2I;
	Wed, 11 Oct 2023 22:33:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqhlF-00GqQ7-38
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 22:33:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 87DC4CE225D;
	Wed, 11 Oct 2023 22:32:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A44AC433C8;
	Wed, 11 Oct 2023 22:32:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697063577;
	bh=rpGzTzUpWKI2zCDFka+c0ioQo+a/DBJfsLAIdNdjuUI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RgwE80uZx2VHum1n+jjrNufkljdEkPAzsOYFFi+djv3OMoGLKpDxSBPfAW8Iz+66t
	 JgNRtiZkstmB9no/WSGc+A8UwwXixljCo/LJWVK8NCebMQNO6+wGE7g3yb/Zidwa1y
	 1IjkVODjChMSlJ4msCiB6+durrgMsOIa+9mTc38l1pwWR76cHiCf5v+6CAwdBgMDmW
	 n6KhjJdiVlC1/lf9YGqNK6/7h7s81gnwjggY6twtMfKzs/74qa/uZH1MSHvo1duNk6
	 SAp+6mMP4irqnVrUeG5i0ClRLctYrcBOTpGT4xd7MPub4/O8hGlHPVA2gH/dCxNRON
	 F5c0It7UtqBCA==
Date: Wed, 11 Oct 2023 23:32:52 +0100
From: Conor Dooley <conor@kernel.org>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Nam Cao <namcao@linuxtronix.de>, kernel@esmil.dk, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	william.qiu@starfivetech.com, linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: visionfive 2: correct spi's ss pin
Message-ID: <20231011-bush-much-2b2b47a96c30@spud>
References: <20231011161414.L6wXZVDb@linutronix.de>
 <CAJM55Z-YoJnZi4CrwD66v1TaJoYz1jbX+QOFXUDjhm5C9tST0w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z-YoJnZi4CrwD66v1TaJoYz1jbX+QOFXUDjhm5C9tST0w@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_153302_202714_A5185983 
X-CRM114-Status: GOOD (  18.41  )
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
Content-Type: multipart/mixed; boundary="===============4612197579581506724=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4612197579581506724==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+sLEwCn/NiZhi8Lq"
Content-Disposition: inline


--+sLEwCn/NiZhi8Lq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Oct 11, 2023 at 12:29:44PM -0700, Emil Renner Berthing wrote:
> Nam Cao wrote:
> > The ss pin of spi0 is the same as sck pin. According to the
> > visionfive 2 documentation, it should be pin 49 instead of 48.
>=20
> Thanks! As far as I can tell this should make the 40pin header match the
> Raspberry Pi layout, so
>=20
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

The lists (linux-riscv at least) never got this patch & I cannot find it
in my inbox either. Can you send it "properly" please?

Thanks,
Conor.

>=20
> >
> > Fixes: 74fb20c8f05d ("riscv: dts: starfive: Add spi node and pins confi=
guration")
> > Signed-off-by: Nam Cao <namcao@linuxtronix.de>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.=
dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > index 12ebe9792356..2c02358abd71 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > @@ -431,7 +431,7 @@ GPOEN_ENABLE,
> >  		};
> >
> >  		ss-pins {
> > -			pinmux =3D <GPIOMUX(48, GPOUT_SYS_SPI0_FSS,
> > +			pinmux =3D <GPIOMUX(49, GPOUT_SYS_SPI0_FSS,
> >  					      GPOEN_ENABLE,
> >  					      GPI_SYS_SPI0_FSS)>;
> >  			bias-disable;
> > --
> > 2.39.2
> >
>=20

--+sLEwCn/NiZhi8Lq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZScilAAKCRB4tDGHoIJi
0sywAP9Nrr1MHNLliPKjgEMuuMbqOMxreV5oWYOWnFVGNv2mygD/ZJYhrrFSnILM
0G4VObLptqfC2y/vAVmYzmxrdDK7+wc=
=zhxe
-----END PGP SIGNATURE-----

--+sLEwCn/NiZhi8Lq--


--===============4612197579581506724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4612197579581506724==--

