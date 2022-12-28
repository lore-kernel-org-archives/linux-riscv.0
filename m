Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FD5C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 22:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2yMZg/9uR41OkEksAPbZ6U1IKI3Wdp7g0N3OFSS+deo=; b=W5gsP7d2qFwKkMwsB0H8BpoTD2
	tu7UCsG7ipNMsdGXcQP12XVOzBqPFck7EpbAGnOnu26O0hatwXXtae8ME7C+WUUvvSW57iAKkblUD
	NDynRjU5e3Bfdvp62Y7IqF6uNjiFBoHf3ONeKtzRnvNt8/pHy4ZK+7cOXTVYF4COGUj8Vtv8dtadW
	CtYZ97mpyPduuRP4mCjj3AKTSyILovUBhFTLnQw7jI5TY59z9iKu41ac2ixeuJ5+najVOeBUWFpnM
	k8biWh736Zpa18b/Q7kx4dWaUXSTs8VontHCK7kkSlaGluuhSWEPG49Enifv0BTrp2dOWMAAQMu3/
	LAIEv03Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAfFP-008xst-1d; Wed, 28 Dec 2022 22:50:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAfFK-008xoP-2p
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 22:50:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A17F661631;
	Wed, 28 Dec 2022 22:49:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903F4C433EF;
	Wed, 28 Dec 2022 22:49:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672267798;
	bh=eKpTMGHSO/ZTiq4eGqbwHQljT2nRfrSmDBVcf8nJCYI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ZXpJJnxOYfx1zvBUjyx9GEH+2hTVRek2WMdMyP+RQl8OiGWzkwrq5GdTM82ZFyS6e
	 fzVLwa0jK6yhYivq7y4tsnxPKJ9G3FevsX2ZhoyBgeAXEfmkKA67V0839PmTKAUXHC
	 0AzKeJnExpNBUHdLjcscNXvKSzoSAERPh8vb//oHp3h335yAshQz5+kq3enT1GTTfq
	 aKYlPOOn8EGC8XQ570ilGBn1FVE0KxLoOLPOZN6S7YFtNrPmb4Tnrw4Gnm56qWIVRb
	 NMdTtg07SzUo+xkOWdDthrDKohLeUS7IHPlXnl+ozdVtRAvzm92EIZ2RZkg0ZNEHzo
	 R1viICb+35LbA==
Date: Wed, 28 Dec 2022 22:49:52 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y6zIEMZJUW6CsPNS@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
 <Y6Iob3csmKMl0rB/@spud>
 <94c90f3f-0ca7-7cfb-4d4f-8f90e3300e16@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <94c90f3f-0ca7-7cfb-4d4f-8f90e3300e16@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_145002_267846_9EA05FDD 
X-CRM114-Status: GOOD (  21.83  )
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
Content-Type: multipart/mixed; boundary="===============7640924361661295823=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7640924361661295823==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="0TJGFiimdGLWYNPZ"
Content-Disposition: inline


--0TJGFiimdGLWYNPZ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 23, 2022 at 11:12:34AM +0800, Hal Feng wrote:
> On Tue, 20 Dec 2022 21:26:07 +0000, Conor Dooley wrote:
> > On Tue, Dec 20, 2022 at 09:12:47AM +0800, Hal Feng wrote:
> > > From: Emil Renner Berthing <kernel@esmil.dk>
> > >=20
> > > Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> > > which has version A and version B. Support booting and basic
> > > clock/reset/pinctrl/uart drivers.
> > >=20
> > > Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> > > Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> > > Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> > > Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> > > ---

> > > diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-=
2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > new file mode 100644
> > > index 000000000000..c60280b89c73
> > > --- /dev/null
> > > +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> > > @@ -0,0 +1,111 @@
> > > +// SPDX-License-Identifier: GPL-2.0 OR MIT
> > > +/*
> > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +#include "jh7110.dtsi"
> > > +#include "jh7110-pinfunc.h"
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +
> > > +/ {
> > > +	aliases {
> > > +		serial0 =3D &uart0;
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path =3D "serial0:115200n8";
> > > +	};
> > > +
> > > +	cpus {
> > > +		timebase-frequency =3D <4000000>;
> > > +	};
> > > +
> > > +	memory@40000000 {
> > > +		device_type =3D "memory";
> > > +		reg =3D <0x0 0x40000000 0x1 0x0>;
> >=20
> > Is this a good idea when you have SKUs with 2, 4 & 8 GiB of DDR?
>=20
> The VisionFive 2 board only has 4GB version and 8GB version now. Before
> linux startup, we will change this property in dtb through u-boot to
> make sure the board can boot up with the correct memory size.

Ah I see. Thanks.


--0TJGFiimdGLWYNPZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6zIDwAKCRB4tDGHoIJi
0gMNAQCvOfHtZr3PoXFX2+mCzgr6JsCjRiW7PbUqOVqUw8b9dgD/clvylp+cEFHt
ztVMWXpjCLcWCFgDniZe/S3nBDLNmQA=
=tziJ
-----END PGP SIGNATURE-----

--0TJGFiimdGLWYNPZ--


--===============7640924361661295823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7640924361661295823==--

