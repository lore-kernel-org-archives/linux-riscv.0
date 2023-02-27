Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80CA3C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 20:00:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h9bW/Kth2Zpcvo7XuV4JGbEX6AsDAkqM7q9XUYB6Yvk=; b=wyD8cmzhyoZagoUvlNrhKBCS24
	5Ar0BaQf7E98upmYitck/ctaV7qY6J/gitUGHEuEQjtE+45iTpaKQ/uQINET6edxRJhwNkwNuZy8h
	Sg+zXgjQial+OacRI79gwXl+U7YvKam4gXsMqJZBNXLdpIMxg7yLk3EvY0BvIoYQch6ByOPQivvP9
	1Bhea6/rRBMsx6xxqHgHARm1ruSAaoxdlIqKcpSD080z+iyG3ca9EwG+uRqJIeyWgbvaTXputdoID
	Of7LJWIOwv1ely3PPf49W/HiKm/XFR3vEiFyuUpxPNYguDQ+i/xdni6IaxUIQaVA1Z5XVLfxPVvP/
	FNN265zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjfy-00B5aA-H8; Mon, 27 Feb 2023 20:00:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWjfu-00B5XW-V2
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 20:00:44 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 338C1B80DB8;
	Mon, 27 Feb 2023 20:00:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47520C433D2;
	Mon, 27 Feb 2023 20:00:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677528039;
	bh=nIYRAsxkz1v+ws6bi8EI0HS1rSe3IrjqOcAGXmBmfvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oRGsMbLuyZPLSAbz4jorliDG0dEsvZIpvrMYkGkNcp2vH/PoICuXPGrt54SV2I/No
	 Ct+MT9H5cbHP5+3Tg4IMSdpVd3sX3qMQ4ZT2sbuSN30P0zvcDjOFPREif7TlgUoukw
	 pSMM+SaYIWy9hEFN7JniyEsj+iQjSVJ4I9TrLU/lxi4mmcOwizJJRrIyzz/qiJjKId
	 s1Gr9MLrz/BGBv1KLz4v1K+2FM6eueSNbuwe3Wu/mOJSth73/paDJBoY4uqWJy0Cnc
	 QBzJZF1KQ9FuBZV1fVpwc/vDr61Tsv0VSpQbHNx5Y5fXI1dpFCjF82PIferw66R1sM
	 K3+3Ac+OtKOOA==
Date: Mon, 27 Feb 2023 20:00:33 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 19/19] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y/0L4SKKtl49C95j@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-20-hal.feng@starfivetech.com>
 <CAJM55Z_QMtzKeRFN1iGf498z4+vga6RBgwybCQi6aOUYCr_P-Q@mail.gmail.com>
 <2af3f84b-2c2b-dc79-c76c-9411fcbcf7ca@starfivetech.com>
 <Y/zykfydb+bJ7G2l@spud>
MIME-Version: 1.0
In-Reply-To: <Y/zykfydb+bJ7G2l@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_120043_326308_2E62641E 
X-CRM114-Status: GOOD (  31.20  )
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
Content-Type: multipart/mixed; boundary="===============0084018462658712271=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0084018462658712271==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="B8EZkuBv+mrJ7yYe"
Content-Disposition: inline


--B8EZkuBv+mrJ7yYe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 27, 2023 at 06:12:40PM +0000, Conor Dooley wrote:
> On Thu, Feb 23, 2023 at 04:50:20PM +0800, Hal Feng wrote:
> > On Tue, 21 Feb 2023 16:03:08 +0100, Emil Renner Berthing wrote:
> > > On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wr=
ote:
> > >> From: Emil Renner Berthing <kernel@esmil.dk>
> > >>
> > >> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> > >> which has version A and version B. Support booting and basic
> > >> clock/reset/pinctrl/uart drivers.
> > >>
> > >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> > >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > >> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > >> ---
> > >>  arch/riscv/boot/dts/starfive/Makefile         |   6 +-
> > >>  .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
> > >>  .../jh7110-starfive-visionfive-2-v1.3b.dts    |  13 ++
> > >>  .../jh7110-starfive-visionfive-2.dtsi         | 215 +++++++++++++++=
+++
> > >>  4 files changed, 246 insertions(+), 1 deletion(-)
> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-vis=
ionfive-2-v1.2a.dts
> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-vis=
ionfive-2-v1.3b.dts
> > >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-vis=
ionfive-2.dtsi
> > >>
> > >> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot=
/dts/starfive/Makefile
> > >> index 039c143cba33..cd73519b907b 100644
> > >> --- a/arch/riscv/boot/dts/starfive/Makefile
> > >> +++ b/arch/riscv/boot/dts/starfive/Makefile
> > >> @@ -1,2 +1,6 @@
> > >>  # SPDX-License-Identifier: GPL-2.0
> > >> -dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb jh7100=
-starfive-visionfive-v1.dtb
> > >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb
> > >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-starfive-visionfive-v1.dtb
> > >> +
> > >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.=
dtb
> > >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.=
dtb
>=20
> If you could rebase on top of v6.3-rc1 for the next version & use ARCH_
> not SOC_ here that'd be great.
>=20
> > >> +/ {
> > >> +       aliases {
> > >> +               serial0 =3D &uart0;
> > >> +               i2c0 =3D &i2c0;
> > >> +               i2c2 =3D &i2c2;
> > >> +               i2c5 =3D &i2c5;
> > >> +               i2c6 =3D &i2c6;
> > >=20
> > > Let's keep these sorted alphabetically.
> >=20
> > OK, will fix it.
> >=20
>=20
> > > It would be great to have some sort of order to this file so it's
> > > obvious where to add new nodes. I suggest we do
> > > - root node
> > > - external clocks
> > > - other node references in alphabetical order
> > >=20
> > > You're almost there with this patch except the uart0 node is out of p=
lace.
> >=20
> > Will fix accordingly. Thanks for your suggestions.
>=20
> With Emil's suggestions implemented:
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Actually, there's one thing that I don't think was (explicitly?) mentioned,
could you sort the external clocks alphanumerically too?

Cheers,
Conor.


--B8EZkuBv+mrJ7yYe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/0L4QAKCRB4tDGHoIJi
0nXJAP4hYlkGws9Z9BDo3Zh/bnJEjDLHBMPp6+W/6GLJrhOJ3wD+ILqazBj8LQ78
52UY1mFT5kiamfu0N2L8qR1Q/5KWPAw=
=EYae
-----END PGP SIGNATURE-----

--B8EZkuBv+mrJ7yYe--


--===============0084018462658712271==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0084018462658712271==--

