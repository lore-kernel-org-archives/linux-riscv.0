Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5786E7E349
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 08:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2K5c8ldJSMA49SIaRIdKQMkFhuc+WapGrqmun0StIBI=; b=BIh5rNgjXnRWavy15jt4im7FCN
	iQy/y6MOuvDe2KMk5HFQXWaQPjJ1fxG9Ds/wzCt23pSLmAaxPdopiSO26ZM3gDnR4qeWeHeSsmL47
	do3Pcav6++UNupSYPj36s4kYEQZs0TDqcdYotlJQzd7hbe9ujZ54b2bDZTqDdAM6nr0hVpd5vxnvg
	+iRU8WXerBBkRNWe6z9zx5KNSMi8ss24RizbvCx3Vk5rcXDGsY+qZwVLCXGMCdT3nxNGNd40EaONI
	c1/D4cIwKGcyDeLJ0i5H2o2uACodcoNXM1DhVAXQ7TBuYbQ3w8HxZ/kB/VTSNVADx1N1O9EDmcZGu
	T4jJoxaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aDw-00000001kJb-3luK;
	Fri, 03 Apr 2026 08:49:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8aDv-00000001kJP-2bXO
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 08:49:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BAEF260008;
	Fri,  3 Apr 2026 08:49:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5999DC4CEF7;
	Fri,  3 Apr 2026 08:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775206190;
	bh=9jC53zh6UygCTEqGephW3awhcb1IaIKFF0682qBsSTQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pK7lNUzqto0zd4bKtvihnOeaXM2GmhmDe3RQ9NsD3S+6JOEVn3XqQzyisxF+rwn7O
	 3tJ5YOgIQTRuqSA3ThkLRBUY36A5/SLgPmXZyJ8nIPRedD1kO9Spg31jz0cug9gHxB
	 8szf9AwloyMQe+tDmDeQb/sCiqbRqcrPHdeVJSFluv1O8+omalALtJAGG1MCXb1MX7
	 T5H5MJszpvfELqlLR+3skkpXpwkckYhDwWSbPMTm3ZeT3fDgqG2+Un4sbk5+9NNI9Z
	 e1u6o0RZ2urNI8DCTI8d1Zn9Npqrwt311cMZ9EQ1xuzSG0967ezeFgG2k2VETflATn
	 uvve4i00IVO3Q==
Date: Fri, 3 Apr 2026 09:49:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Emil Renner Berthing <kernel@esmil.dk>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Drew Fustini <dfustini@oss.tenstorrent.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Rob Herring <robh@kernel.org>, Alexandre Ghiti <alex@ghiti.fr>,
	Anup Patel <anup@brainfault.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Guodong Xu <guodong@riscstar.com>, Yixun Lan <dlan@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>, E Shattow <e@freeshell.de>,
	Leyfoon Tan <leyfoon.tan@starfivetech.com>,
	Junhui Liu <junhui.liu@pigmoral.tech>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Michal Simek <michal.simek@amd.com>, Paul Walmsley <pjw@kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Thomas Gleixner <tglx@kernel.org>,
	JiSheng Teoh <jisheng.teoh@starfivetech.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH v1 5/5] riscv: dts: starfive: jhb100: Add JHB100 base DT
Message-ID: <20260403-pristine-slam-71d8e0093b6f@spud>
References: <20260402084019.440708-1-changhuang.liang@starfivetech.com>
 <20260402084019.440708-6-changhuang.liang@starfivetech.com>
 <20260402-shakable-hefty-0164a042b748@spud>
 <ZQ4PR01MB1202CB8B853CA7E03531914BF25E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202CB8B853CA7E03531914BF25E2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============0086425484564064177=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0086425484564064177==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="RDIrdRSDWwJQ2NvY"
Content-Disposition: inline


--RDIrdRSDWwJQ2NvY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 03, 2026 at 03:06:23AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> > On Thu, Apr 02, 2026 at 01:40:19AM -0700, Changhuang Liang wrote:
> > > From: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > >
> > > Add JHB100 base dtsi and dts. Consist of 4 Dubhe-70 cores, CLINT,
> > > PLIC, PMU, UART and 1GB DDR.
> > >
> > > Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  MAINTAINERS                                   |   6 +
> > >  arch/riscv/boot/dts/starfive/Makefile         |   2 +
> > >  .../boot/dts/starfive/jhb100-evb1-eth.dts     |   6 +
> > >  arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi |  32 ++
> > >  arch/riscv/boot/dts/starfive/jhb100.dtsi      | 326
> > ++++++++++++++++++
> > >  5 files changed, 372 insertions(+)
> > >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100-evb1.dtsi
> > >  create mode 100644 arch/riscv/boot/dts/starfive/jhb100.dtsi
> > >
> > > diff --git a/MAINTAINERS b/MAINTAINERS index
> > > 7d10988cbc62..b1892a480c31 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -25306,6 +25306,12 @@ S:	Supported
> > >  F:
> > 	Documentation/devicetree/bindings/interrupt-controller/starfive,jh8100
> > -intc.yaml
> > >  F:	drivers/irqchip/irq-starfive-jh8100-intc.c
> > >
> > > +STARFIVE JHB100 DEVICETREES
> > > +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> > > +L:	linux-riscv@lists.infradead.org
> > > +S:	Maintained
> >=20
> > Supported, no?
> >=20
> > > +F:	arch/riscv/boot/dts/starfive/jhb100*
> > > +
> > >  STATIC BRANCH/CALL
> > >  M:	Peter Zijlstra <peterz@infradead.org>
> > >  M:	Josh Poimboeuf <jpoimboe@kernel.org>
> > > diff --git a/arch/riscv/boot/dts/starfive/Makefile
> > > b/arch/riscv/boot/dts/starfive/Makefile
> > > index 3dd1f05283f7..7cdb75788053 100644
> > > --- a/arch/riscv/boot/dts/starfive/Makefile
> > > +++ b/arch/riscv/boot/dts/starfive/Makefile
> > > @@ -18,3 +18,5 @@ dtb-$(CONFIG_ARCH_STARFIVE) +=3D
> > > jh7110-starfive-visionfive-2-lite.dtb
> > >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D
> > > jh7110-starfive-visionfive-2-lite-emmc.dtb
> > >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.2a.=
dtb
> > >  dtb-$(CONFIG_ARCH_STARFIVE) +=3D jh7110-starfive-visionfive-2-v1.3b.=
dtb
> > > +
> > > +dtb-$(CONFIG_ARCH_STARFIVE) +=3D jhb100-evb1-eth.dtb
> > > diff --git a/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > > b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > > new file mode 100644
> > > index 000000000000..62cd046e1224
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/starfive/jhb100-evb1-eth.dts
> > > @@ -0,0 +1,6 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (c) 2024-2026 StarFive Technology Co., Ltd.
> > > + */
> > > +
> > > +#include "jhb100-evb1.dtsi"
> >=20
> > What is the point of this file? Is this the base-board?
> > Shouldn't it have a specific compatible?
> >=20
> > Can the SoM be used without a base board? I've got no info about this b=
oard
> > appearing on google, do you even have pictures of it or any documentati=
on?
> > I see this
> > https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D22
> > and
> > https://www.starfivetech.com/en/index.php?s=3Dhardware&c=3Dshow&id=3D23
> > but the former doesn't look like it needs a base-board and the latter i=
s called
> > "evb3", so is not what's here?
>=20
> The former is the base board of the EVB1. Currently, we are only carrying=
 out=20
> upstream work based on the EVB1. The EVB1 base board has reserved slots=
=20

Except when I look at the first link, the picture doesn't show something
that is a SoM + base-board, it's just a regular board. If that's the
case, the breakdown of files doesn't make sense, with jhb100-evb1.dtsi
sounding like it should be a dts. Usually we talk about base-boards in
relation to a SoM, like what the mars-cm needs to function.



> that can accommodate expansion boards to verify more advanced features.=
=20
> At present, the jhb100-evb1.dtsi file corresponds to the configuration of=
 the=20
> EVB1 base board. In the future, we will add dtsi files for the expansion =
boards.=20
> The jhb100-evb1-eth.dts file will then be used to combine these dtsi file=
s to=20
> generate the final version of the device tree source.

Sounds like here the evb1 is a complete board and jhb100-evb1-eth.dts
represents some kind of expansion card added to that board?=20
I think this not correct, since the base-board needs to be usable in
isolation. Take a look at what rockchip do for rk3588-rock-5b-pcie-ep
in arch/arm64/boot/dts/rockchip/Makefile/, where these expansion type
things are dealt with using overlays.

--RDIrdRSDWwJQ2NvY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCac9/JgAKCRB4tDGHoIJi
0ktcAP9BpkEyrR1n1Wov0YpiTqgbSKS7e8erqIhAJyOOje5XHQD/djuBtwwMJ45C
xt1SwYjgxAkvlzj3RWeF0wCI9Z22bgc=
=kSV4
-----END PGP SIGNATURE-----

--RDIrdRSDWwJQ2NvY--


--===============0086425484564064177==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0086425484564064177==--

