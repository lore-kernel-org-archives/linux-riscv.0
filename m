Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01135C4345F
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Apr 2024 15:06:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pWAbjBU38A4EkqafnAF9wCvIydqUYzSGV2JWnTr6nFk=; b=jZVBPzz3kNzWxqczLComZTJmpp
	RTzE/s64tZF2XSJqdVvpiljiI9KEqV4csCuTw/cx6AtiMaxngm1K70ch+dP7G91NODf8ijqCYPqH2
	sPOO7dOXNt+aant0TRzTHmhqb7k12MH/Xg6HAsSkHyFUIyVuqJ447zaz9PJHgB2Zp0WGYa76KlY7t
	BwXqszDczKZ6BBz+YJfdJQQsL8spaoo2sUZMghWc0I5nCSVtmt6DaB6gRItjw8qOLtKMyp/kbm9QB
	WCXRV1pb1ISa1FWZWq1WuD5sRnsUymQF8O6+tIqplrpGITgy2GDniFIM30KL+kD2MuGoDMX0uTWpD
	FbEDcA8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6s1-0000000GUsF-35rw;
	Wed, 17 Apr 2024 15:06:45 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rx6ru-0000000GUpC-3fu1
	for linux-riscv@lists.infradead.org;
	Wed, 17 Apr 2024 15:06:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E3D29CE12F4;
	Wed, 17 Apr 2024 15:06:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67620C072AA;
	Wed, 17 Apr 2024 15:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713366393;
	bh=csO/QBIY5zA9U55g4bmdwzHQOXGd09d6ZZbozBhSl4k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WWbx16CozNaA6xrWLXzFjR3qfMbBP2psA8necDIweTlfJOzHkeCWSIs0UfQstgqxm
	 D6B572ou01naWEDwbo/TJYW8VJxw53oDsAyBv9/DptJ42ri4yEhUBEwvStUXt7B+Tu
	 01QoTScXr7YvGckqHEYzfm5QjLeY3eVV/KA6Ozp1spGnZvUWWoscoNYb8L1BRbWVVJ
	 cHgsrGg7ei51FkYVIoToGWyBGkyTEyy/aeMEgffHXaaEnpYkjBlF6sUd+D+8IJVd4L
	 +sx92YX9tvwz4ucnxrqCRjUm86f0rEmA7+WYBNH/YS+yAW07xfeHxJqgpO6h6GUO6i
	 YTgnKq+fwcOcA==
Date: Wed, 17 Apr 2024 16:06:29 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: michael.opdenacker@bootlin.com, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/2] riscv: dts: sophgo: add initial Milk-V Duo S
 board support
Message-ID: <20240417-guts-overture-b04cd1b8565a@spud>
References: <20240417065311.3881023-1-michael.opdenacker@bootlin.com>
 <20240417065311.3881023-3-michael.opdenacker@bootlin.com>
 <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
In-Reply-To: <IA1PR20MB49539A380E44459ACE19DEB6BB0F2@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240417_080639_301748_D20E25B7 
X-CRM114-Status: GOOD (  22.15  )
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
Content-Type: multipart/mixed; boundary="===============1775879472550353430=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1775879472550353430==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="lXrJLg2sMSILQKj3"
Content-Disposition: inline


--lXrJLg2sMSILQKj3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 17, 2024 at 05:34:44PM +0800, Inochi Amaoto wrote:
> On Wed, Apr 17, 2024 at 08:53:11AM GMT, michael.opdenacker@bootlin.com wr=
ote:
> > From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> >=20
> > This adds initial support for the Milk-V Duo S board
> > (https://milkv.io/duo-s), enabling the serial port,
> > making it possible to boot Linux to the command line.
> >=20
> > Link: https://lore.kernel.org/linux-riscv/171266958507.1032617.94607491=
36730849811.robh@kernel.org/T/#t
> >=20
> > Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
> > ---
> >  arch/riscv/boot/dts/sophgo/Makefile           |  1 +
> >  .../boot/dts/sophgo/sg2000-milkv-duos.dts     | 34 +++++++++++++++++++
> >  2 files changed, 35 insertions(+)
> >  create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
> >=20
> > diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/=
sophgo/Makefile
> > index 57ad82a61ea6..e008acb5240f 100644
> > --- a/arch/riscv/boot/dts/sophgo/Makefile
> > +++ b/arch/riscv/boot/dts/sophgo/Makefile
> > @@ -1,4 +1,5 @@
> >  # SPDX-License-Identifier: GPL-2.0
> >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1800b-milkv-duo.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D cv1812h-huashan-pi.dtb
> > +dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2000-milkv-duos.dtb
> >  dtb-$(CONFIG_ARCH_SOPHGO) +=3D sg2042-milkv-pioneer.dtb
> > diff --git a/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts b/arch/ri=
scv/boot/dts/sophgo/sg2000-milkv-duos.dts
> > new file mode 100644
> > index 000000000000..c1ecf97d5e93
> > --- /dev/null
> > +++ b/arch/riscv/boot/dts/sophgo/sg2000-milkv-duos.dts
> > @@ -0,0 +1,34 @@
> > +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> > +/*
> > + * Copyright (C) 2024 Michael Opdenacker <michael.opdenacker@bootlin.c=
om>
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "cv1812h.dtsi"
> > +
> > +/ {
> > +	model =3D "Milk-V Duo S";
> > +	compatible =3D "milkv,duos", "sophgo,cv1812h";
> > +
> > +	aliases {
> > +		serial0 =3D &uart0;
> > +	};
> > +
> > +	chosen {
> > +		stdout-path =3D "serial0:115200n8";
> > +	};
> > +
> > +	memory@80000000 {
> > +		device_type =3D "memory";
> > +		reg =3D <0x80000000 0x20000000>;
> > +	};
>=20
> Add a cpu specific file, and move this to it.

I take it that the memory is integrated into the package then?

--lXrJLg2sMSILQKj3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZh/ldQAKCRB4tDGHoIJi
0iovAQCARQaWa7RNYeDT5gcMiHGFrrlUp4jfG1PWfDEvDUPcHQEA0kweLkHMyqlV
Z8fNVOz8ExbRPorZsQGP0jhPfhdVRwg=
=xsp0
-----END PGP SIGNATURE-----

--lXrJLg2sMSILQKj3--


--===============1775879472550353430==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1775879472550353430==--

