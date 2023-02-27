Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 701C9C64ED6
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 18:12:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZTI7SG84rqKRCMUJOF6AUHsQHdHAZn9VMA5/NqfI1So=; b=SvbaiW+hXXjTQM5FLFbzlxMYfD
	xlcM4KaltYuQt/XIKF8ZlKCUsJ8UtzwOAqAY14qsTLw/ubfjPFhwTa19+2qMWQ4xac0uMeSZZEcLy
	cf7vMZolec7rpeWlAfac1Icn4U+cjGvgchJUyhIj9pNmteC+rTIydmb5z1Sfg8/+beCgEwPihroEd
	VwMbcGg+WPn4BswIkFXS9MXwXvj6GGbrsYp63PsGoJlqVx6O/7Uh5gZfCssY8uJTNkL90y2/KtVqC
	W9+NlQ2nOjYduMpzG2tBvnN5ZrolxIQvyRAfGl54Dt2aJGoggXcKtcwKsKoD2XlfC/O2Df9QzIzUI
	QlOtdgBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhzP-00AfQ3-A4; Mon, 27 Feb 2023 18:12:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWhzN-00AfPS-87
	for linux-riscv@lists.infradead.org; Mon, 27 Feb 2023 18:12:42 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6C9E860EA4;
	Mon, 27 Feb 2023 18:12:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D79C433D2;
	Mon, 27 Feb 2023 18:12:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1677521559;
	bh=zMhMn8aAWF1yij6h/z2ZQ66w5ISBOOImdqMr7vAIcJ0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UByeI1j6YFGybIKdXAkZNElk4G3cms0EW3kzf4qqXkGQHebKNAbLiygzTKQH9WdA/
	 ROmOZ9Vx2kidAqUwx/OK7IB2t3jEVKLDFHk2zxx0BymR3xCsTRgbaJD+qUW6wX2a7z
	 zCcEzcw8idFMHhowAGyfWHFPt8JZ8+IUTR7JEQLZFRTDKPp6tVDi8du4Mnk7Rjal5D
	 pQD01wOZb07LIWDU4Ji6t9RKZ/0oSxUxgQQtD6jwbUlin5OiCi9G/kz/hPebpRXWNq
	 7JzTw8ofrp9V+lgBkwP1F+DgKofx5TeyV1oYwz5J2U++r0WgDdjqd5LtCHaLzFO60i
	 1ZjN6FQyN9oCg==
Date: Mon, 27 Feb 2023 18:12:33 +0000
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
Message-ID: <Y/zykfydb+bJ7G2l@spud>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-20-hal.feng@starfivetech.com>
 <CAJM55Z_QMtzKeRFN1iGf498z4+vga6RBgwybCQi6aOUYCr_P-Q@mail.gmail.com>
 <2af3f84b-2c2b-dc79-c76c-9411fcbcf7ca@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <2af3f84b-2c2b-dc79-c76c-9411fcbcf7ca@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_101241_385633_CC9FA83F 
X-CRM114-Status: GOOD (  26.69  )
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
Content-Type: multipart/mixed; boundary="===============7011325922800060913=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7011325922800060913==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qQDklUlJ7jtziWjT"
Content-Disposition: inline


--qQDklUlJ7jtziWjT
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 23, 2023 at 04:50:20PM +0800, Hal Feng wrote:
> On Tue, 21 Feb 2023 16:03:08 +0100, Emil Renner Berthing wrote:
> > On Tue, 21 Feb 2023 at 03:47, Hal Feng <hal.feng@starfivetech.com> wrot=
e:
> >> From: Emil Renner Berthing <kernel@esmil.dk>
> >>
> >> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> >> which has version A and version B. Support booting and basic
> >> clock/reset/pinctrl/uart drivers.
> >>
> >> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> >> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> >> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  arch/riscv/boot/dts/starfive/Makefile         |   6 +-
> >>  .../jh7110-starfive-visionfive-2-v1.2a.dts    |  13 ++
> >>  .../jh7110-starfive-visionfive-2-v1.3b.dts    |  13 ++
> >>  .../jh7110-starfive-visionfive-2.dtsi         | 215 ++++++++++++++++++
> >>  4 files changed, 246 insertions(+), 1 deletion(-)
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visio=
nfive-2-v1.2a.dts
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visio=
nfive-2-v1.3b.dts
> >>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visio=
nfive-2.dtsi
> >>
> >> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/d=
ts/starfive/Makefile
> >> index 039c143cba33..cd73519b907b 100644
> >> --- a/arch/riscv/boot/dts/starfive/Makefile
> >> +++ b/arch/riscv/boot/dts/starfive/Makefile
> >> @@ -1,2 +1,6 @@
> >>  # SPDX-License-Identifier: GPL-2.0
> >> -dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb jh7100-s=
tarfive-visionfive-v1.dtb
> >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb
> >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-starfive-visionfive-v1.dtb
> >> +
> >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.dtb
> >> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.dtb

If you could rebase on top of v6.3-rc1 for the next version & use ARCH_
not SOC_ here that'd be great.

> >> +/ {
> >> +       aliases {
> >> +               serial0 =3D &uart0;
> >> +               i2c0 =3D &i2c0;
> >> +               i2c2 =3D &i2c2;
> >> +               i2c5 =3D &i2c5;
> >> +               i2c6 =3D &i2c6;
> >=20
> > Let's keep these sorted alphabetically.
>=20
> OK, will fix it.
>=20

> > It would be great to have some sort of order to this file so it's
> > obvious where to add new nodes. I suggest we do
> > - root node
> > - external clocks
> > - other node references in alphabetical order
> >=20
> > You're almost there with this patch except the uart0 node is out of pla=
ce.
>=20
> Will fix accordingly. Thanks for your suggestions.

With Emil's suggestions implemented:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.


--qQDklUlJ7jtziWjT
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY/zykQAKCRB4tDGHoIJi
0rQPAPkBDZJoRNk6lCcj0ANg8faGvHfRWGdaYyYaWI+YfboLwAD+PN28woxpivfc
IvPNVwHix48qqNSe6XV1YTMwD50HggM=
=0cCt
-----END PGP SIGNATURE-----

--qQDklUlJ7jtziWjT--


--===============7011325922800060913==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7011325922800060913==--

