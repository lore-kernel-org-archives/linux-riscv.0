Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9E69D26D9D
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jan 2026 21:32:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=boYjk6KXZpia7ClFrNsES23SgCvK/Q/lrLxTp1mfSUM=; b=zmrnC0KMchtl7rU05K2GJv/dAq
	YFOkovetxJ/VIV0fHM08/SszbuzXBAMdrRK/zMxypKMZ0Oogb0tIKjj+n+HPVj7qRhay0MbREiC+3
	fKLAFxZBTofNQrBqRX8yj8KjRq7UpxUkS51ycthHZwniht9A+huv5H5LXK3dDXOq3XFtCexTtjxdX
	S5rv0FJ04BPTv4M7UcgTVvj2ZxoOZSbeW4f0a7KHXYU7JUgH+/YrYhzcKnJ4i7X5c3e66b95cHFdX
	GHNM25u4GkG/USazlgtyDXoMLitTevltQ8uqEcB9iVqyQRjvZT5VRKhR1H1BJ6ixQx/I346zIndzq
	sZrr2j0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veK5Z-000000032iL-0uZi;
	Fri, 09 Jan 2026 21:32:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veK5X-000000032hn-2KhU
	for linux-riscv@lists.infradead.org;
	Fri, 09 Jan 2026 21:32:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E49F860052;
	Fri,  9 Jan 2026 21:32:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C968C4CEF1;
	Fri,  9 Jan 2026 21:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767994324;
	bh=jmXgesLrf6BlXMJgU46sieiYHnF1uBZSohRg/Opr9CY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nPYFodVYkJKKaNAmB7BJ6Y3jrMXONYgVTwTovhmDd6J/LvLCc34t0iP3QzU7+A2X8
	 1T47XWL06CnA0qDIp4Br08bs4I8RuUwwyVa88KHZXFM4tFT9cAj49jTBGQs/NTwvne
	 7zNBwvEnFwbRWkmzNyrEsWvoL1rCi/hm/n7xWpuOucmW/RWemKwH7y/rwhZMPofeeR
	 rcZS2jisdQoHW+bDNUsN97ID6z9TRKvWsE6U6zUd5txphAICycVtxbB+WcqhPwJAca
	 +tUfw2HwFfX2qoIIc/V+orTsnboD3x55KlRUwkZx+WTDqSh28ys7UBf6BfQ5ztqCqj
	 r5eaZ2BoZKVJg==
Date: Fri, 9 Jan 2026 21:32:00 +0000
From: Conor Dooley <conor@kernel.org>
To: claudiu beznea <claudiu.beznea@tuxon.dev>
Cc: linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: Re: [PATCH v2 1/3] clk: microchip: drop POLARFIRE from
 ARCH_MICROCHIP_POLARFIRE
Message-ID: <20260109-static-sauciness-be0ab0b410d2@spud>
References: <20251121-tartar-drew-ba31c5ec9192@spud>
 <20251121-prude-dilation-79d275fec296@spud>
 <86bd75e7-1191-458d-b71e-c3cecb960700@tuxon.dev>
 <20251208-flatten-devious-56abcfecd510@spud>
 <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>
MIME-Version: 1.0
In-Reply-To: <af02ffd7-4876-4bce-8a79-2b34114d6ccc@tuxon.dev>
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
Content-Type: multipart/mixed; boundary="===============0935704204771389603=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0935704204771389603==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/ujGXdfmic+jHB7W"
Content-Disposition: inline


--/ujGXdfmic+jHB7W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 09, 2026 at 09:22:25AM +0200, claudiu beznea wrote:
>=20
>=20
> On 12/8/25 20:02, Conor Dooley wrote:
> > On Sat, Dec 06, 2025 at 01:18:30PM +0200, Claudiu Beznea wrote:
> > >=20
> > >=20
> > > On 11/21/25 15:44, Conor Dooley wrote:
> > > > From: Conor Dooley <conor.dooley@microchip.com>
> > > >=20
> > > > This driver is used by non-polarfire devices now, and the ARCH_MICR=
OCHIP
> > > > symbol has been defined for some time on RISCV so drop it without a=
ny
> > > > functional change.
> > > >=20
> > > > Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> > > > ---
> > > >   drivers/clk/microchip/Kconfig | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > >=20
> > > > diff --git a/drivers/clk/microchip/Kconfig b/drivers/clk/microchip/=
Kconfig
> > > > index cab9a909893b..a0ef14310417 100644
> > > > --- a/drivers/clk/microchip/Kconfig
> > > > +++ b/drivers/clk/microchip/Kconfig
> > > > @@ -5,8 +5,8 @@ config COMMON_CLK_PIC32
> > > >   config MCHP_CLK_MPFS
> > > >   	bool "Clk driver for PolarFire SoC"
> > > > -	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
> > > > -	default ARCH_MICROCHIP_POLARFIRE
> > > > +	depends on ARCH_MICROCHIP || COMPILE_TEST
> > > > +	default y
> > > >   	depends on MFD_SYSCON
> > > >   	select AUXILIARY_BUS
> > > >   	select COMMON_CLK_DIVIDER_REGMAP
> > >=20
> > > OK, I found v2 in my inbox. Same symptom here. It doesn't apply on to=
p of
> > > the current at91-next either.
> >=20
> > I think this should sort itself out after -rc1, but I'll resend if it
> > doesn't.
>=20
> Still doesn't apply. It conflicts at least with
> commit c6f2dddfa7f9 ("clk: microchip: mpfs: use regmap for clocks")

Right, I'll resend. Thought it was based on the aforementioned patch
tbh!

--/ujGXdfmic+jHB7W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaWFz0AAKCRB4tDGHoIJi
0lDFAP41AelcberGgT4Fh6QhHg746myZBCiXqHa6oCY+lLjliwEAizke4evc/wgP
3w0M939O+a5TZLZwHMXtuSzTsWDDRQg=
=PVZG
-----END PGP SIGNATURE-----

--/ujGXdfmic+jHB7W--


--===============0935704204771389603==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0935704204771389603==--

