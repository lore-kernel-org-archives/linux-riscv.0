Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA708D3B7E2
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Dec 2025 18:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/W8LsC1M6GYH1gvZ3LMdzA8XbyK8VwxhnrDM97pWjt0=; b=1XK85nCzDpk+/3SVB8h5BP1QR1
	iX4usJLs6SNViTxuBmdaxKpIbqIb5bu0VPtOpfq4nTOX8In97q/DxkmJlVI997NV0fFh6iginOK8Y
	zbsPnut02c6rEM7sUf93OxKoW1KWkef+rl7PvlW2fzqtNVihrMe9qvihn1lTFwnrLjXjHfIYKK3fC
	LDt2uMmK81AgYEeIkZdA+gll18kl0ICWq/ad6bq/SVJv5V3E8B7C4b5kThbhz3NVDuXFubGH/Qdzp
	VjgBqmHBrNqSvZ8als48U07BK31Z0NN/yLgvmrX8Wxp2u1h0EEoZSbSndNUhkhd4QEOcRqLvmjmnZ
	Av3Ewxcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfZW-0000000DPV9-1Ot2;
	Mon, 08 Dec 2025 18:02:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSfZV-0000000DPV0-1cRN
	for linux-riscv@lists.infradead.org;
	Mon, 08 Dec 2025 18:02:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 82AF960133;
	Mon,  8 Dec 2025 18:02:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DDFA0C4CEF1;
	Mon,  8 Dec 2025 18:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765216972;
	bh=7q6s7jx4rNURD2mNarlLSt82SNn58lTyP8BfcayLfG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hfy4FPNK9p+GuCosrgIElaGczapNltTYDZOAtYAY//Avlm4hGayWMCiLl/T6vi6wD
	 xeMwgX/ayl8GJkvQGaPiR1Owrr+TX3kG6lVUqyRqOg2isAVEq7DtY8Tyr+OisgEefH
	 KNRRNjz1PgXtI6tQQdc68bZKfPljiWplTyrYmM3EwvE8pFplSxwLKiZUmbic7hJ2ND
	 ACO5IEcTWDXtVkk4Ta/D1MYE9G2FIsKkfOCCjpgAkuih+Kmv+vrrUHKdB3d7WxTxdI
	 nEXDkNphrd5uzsZ+I1ou6PN+enwz3qbcx89F+g5gK4yPfKX4Nbt6oFXm4D0EsDXedk
	 9UQtOR+aHrAbg==
Date: Mon, 8 Dec 2025 18:02:47 +0000
From: Conor Dooley <conor@kernel.org>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
Message-ID: <20251208-flatten-devious-56abcfecd510@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
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
Content-Type: multipart/mixed; boundary="===============5608505257143552075=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5608505257143552075==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="SZ4voAMfwUKL6i6u"
Content-Disposition: inline


--SZ4voAMfwUKL6i6u
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
>=20
>=20
> On 11/21/25 15:44, Conor Dooley wrote:
> > From: Conor Dooley <conor.dooley@microchip.com>
> >=20
> > This driver is used by non-polarfire devices now, and the ARCH_MICROCHIP
> > symbol has been defined for some time on RISCV so drop it without any
> > functional change.
> >=20
> > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > ---
> >  drivers/clk/microchip/Kconfig | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/Kcon=
fig
> > index cab9a909893b..a0ef14310417 100644
> > --- a/drivers/clk/microchip/Kconfig
> > +++ b/drivers/clk/microchip/Kconfig
> > @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
> > =20
> >  config MCHP_CLK_MPFS
> >  	bool "Clk driver for PolarFire SoC"
> > -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> > -	default ARCH_MICROCHIP_POLARFIRE
> > +	depends on ARCH_MICROCHIP || COMPILE_TEST
> > +	default y
> >  	depends on MFD_SYSCON
> >  	select AUXILIARY_BUS
> >  	select COMMON_CLK_DIVIDER_REGMAP
>=20
> OK, I found v2 in my inbox. Same symptom here. It doesn't apply on top of
> the current at91-next either.

I think this should sort itself out after -rc1, but I'll resend if it
doesn't.

--SZ4voAMfwUKL6i6u
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaTcSxwAKCRB4tDGHoIJi
0gVcAQDoPZftNez0ce9Cr5hdYrZWaD7QcZQW5iseNvgVStkiYgEAtL73tR0IcFyP
78nHFeNdr2XPy6pfdAdtCgcSvw7Ojg0=
=t3LO
-----END PGP SIGNATURE-----

--SZ4voAMfwUKL6i6u--


--===============5608505257143552075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5608505257143552075==--

