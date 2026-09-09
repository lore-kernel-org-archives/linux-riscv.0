Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2AB0C79FAD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 10:05:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/6XFKKH1keak4ZadRBMDWKo5dK6G/iUbUPAuuqwGwbA=; b=vyWKYiKo4h4s/bWbeI79WIL4O8
	DYS4hH6y2MmPaJzdSyB1xeSt12jkPKEGLZ9WLtiJ5ZV/btjbt8Bg8agwiFnbylGy7GOtw1qS30M9P
	lV57v3dSL9RptIZ8/3gGGOeBbHYsmqWJLijHkvl/oXcQkm0IdBjyM0Gdnewc1eLxOTQ8st92Ghy6M
	At9kwZ1cKKO8J4Xuy5BaIznIumXBQ6aBzS+HOkwxnyYbA9G9LR74CnksYEwKwX/HYuzXWhu0UeFWB
	3c/s77yivw/rLkiOtLodPXFTxMGxFgU4tnbPKmpUpstuiVBM6YmFVWbAam8eUbY2DQsTMxM7UsTXc
	e7nkZMRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FBK-0000000BNWG-1Qdt;
	Wed, 09 Sep 2026 10:05:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4FBI-0000000BNW1-3mmQ
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 10:05:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B48260238;
	Wed,  9 Sep 2026 10:05:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2585E1F00ADE;
	Wed,  9 Sep 2026 10:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788948327;
	bh=DoOFUTTLq3F8SnEe2BxPjPHx1V1IzLc22vrDVr7s0qE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Da7lqg5DuVdSEz0zDKFb8J9Z+VkDjG93eZuIcAXcREQ2aDFko+cNF2lzOTsJBKjM+
	 VsWLj7ddjbK7pjhXVYPCJff3BKRIduusD8QU4WCR6FEbodMnZpQLYdjdA9Ao3DtyXv
	 IeCV/xXu/IcfAqrgmOYMfbuTim39bcfnhWOHd164kyjKmC5RXI4oHBk8P8qXS46TOn
	 6ftny5crMo+OO8GsD7qhAFEUI/XzXJgL+YiMAGS5SHAKTunwV6pUFaCQRX1dZ8fpUz
	 oyjRPSnFO90qFV4Y4c1XrGl1PUH3HcbH6IkDn3U6YKfrDMjLCPnxuuyU8QD/noEk4n
	 o4Kvp4XZQctyA==
Date: Wed, 9 Sep 2026 11:05:02 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Bartosz Golaszewski <brgl@kernel.org>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	Lianfeng Ouyang <lianfeng.ouyang@starfivetech.com>
Subject: Re: [PATCH v7 03/21] dt-bindings: pinctrl: Add
 starfive,jhb100-sys0-pinctrl
Message-ID: <aqEvTU_-69_PAQf7@squawk>
References: <20260831113514.66382-1-changhuang.liang@starfivetech.com>
 <20260831113514.66382-4-changhuang.liang@starfivetech.com>
 <20260908-annually-catfight-39e3a1543274@spud>
 <ZQ4PR01MB1202F0B2A4BB3D370C82D523F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
MIME-Version: 1.0
In-Reply-To: <ZQ4PR01MB1202F0B2A4BB3D370C82D523F2B02@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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
Content-Type: multipart/mixed; boundary="===============0546901015998185163=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============0546901015998185163==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CzfhbBx3OnI0r5Pd"
Content-Disposition: inline

--CzfhbBx3OnI0r5Pd
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 09, 2026 at 01:43:20AM +0000, Changhuang Liang wrote:
> Hi, Conor
>=20
> Thanks for the review.
>=20
> > On Mon, Aug 31, 2026 at 04:34:56AM -0700, Changhuang Liang wrote:
> > > diff --git a/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > new file mode 100644
> > > index 000000000000..6d8f5516a178
> > > --- /dev/null
> > > +++ b/include/dt-bindings/pinctrl/starfive,jhb100-pinctrl.h
> > > @@ -0,0 +1,17 @@
> > > +/* SPDX-License-Identifier: GPL-2.0 OR MIT */
> > > +/*
> > > + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> > > + *
> > > + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > + */
> > > +
> > > +#ifndef __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +#define __DT_BINDINGS_PINCTRL_STARFIVE_JHB100_H__
> > > +
> > > +/* sys0 pad numbers */
> > > +#define PADNUM_SYS0_GPIO_A0				0
> > > +#define PADNUM_SYS0_GPIO_A1				1
> > > +#define PADNUM_SYS0_GPIO_A2				2
> > > +#define PADNUM_SYS0_GPIO_A3				3
> >=20
> > Krzysztof's point [1] about these still stands. Pad indices aren't bind=
ings.
> > Sure, your driver and your dts both might want to use these but that do=
esn't
> > make them a binding. For that to be the case, they need to effectively =
be
> > made up numbers - like how clocks are often listed with numbers from 0 =
into
> > the dozens or hundreds, when that may or may not correlate with actual =
bits
> > in registers, e.g. indices 0-31 in a clock binding might be in register=
 1 and then
> > 32-63 are in register 2. There's no need for a binding here to assign m=
eanings
> > to numbers, because the meanings are assigned by the hardware itself - =
index
> > 0 for SYS0 *is* A0, because that's how the hardware is designed.
> >=20
> > Were the numbers to run continuously, so that we had
> >=20
> > #define JHB100_PADNUM_A0	0
> > #define JHB100_PADNUM_A1	1
> > #define JHB100_PADNUM_A2	2
> > #define JHB100_PADNUM_A3	3
> > #define JHB100_PADNUM_A4	4
> > and so on down to
> > #define JHB100_PADNUM__D0	1234
> >=20
> > then it would be a binding, because we're assigning a meaning to 1234 t=
hat's
> > not something determined by the hardware.
> >=20
> > FWIW, I'm happy to have the unchanged starfive,jhb100-pinctrl.h sit in
> > arch/riscv/boot/dts/starfive, because the defines are helpful - but as =
things
> > stand I think Krzysztof is right.
>=20
> For the current series, the drivers also use some definitions from the bi=
nding. In=20
> the next version, should the macro definitions be directly placed in thei=
r respective=20
> pinctrl-starfive-jhb100-<domain>.c files?

Only the ones that are actually used, which I think is a limited subset
of the definitions in this header. At least, none of the ones that I
looked up were actually used in the drivers, except for the sys0 ones.

--CzfhbBx3OnI0r5Pd
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqEvTgAKCRB4tDGHoIJi
0tkiAP4ju3bCLww2Qz0ZX7JJ3vLgGAKAjceC7CmVV8I/mNuImAD/SuYzUxILRQFb
FRai3/OvTbB6UApRe77WAcLJupsGww8=
=rHeS
-----END PGP SIGNATURE-----

--CzfhbBx3OnI0r5Pd--


--===============0546901015998185163==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0546901015998185163==--

