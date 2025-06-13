Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5FF5C71148
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 15:28:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=02SBFMe6zlEJYMBkkldxv6Skf+U0blNBI4yexSWJVWw=; b=GMfrFcLg4EGX0WSp7oNJ3cSmPI
	lxQ5jQ1Z0nVCWqxyRIczv/ZCK7lUPGwwlaxQj4qq5wd/F7T6Cq99WgcLuM/0tUnm52b28193IEN9z
	tATDV+rQMcE0flLYL25pTY9CcEDQLT3TmKphFhFSNOeExwcBmSW5mI1o/IKspQ3VG/LMR3YlPRmLG
	zvJXRm4qz7/AM854n5BqkvpZDu74/ECqm+DuFHUi8yLWXGFqY5RjKy49xNwXRgMKq6+ZSHMMU8KGO
	Rn9TNAUoWHh7c7A0ftaaBwL6nMbGzfscwh4CCJWbcUfhzyL8RhlwS0EyhBOuOpoIWd13nd5gOQPxN
	Q/a+PTyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ6KB-0000000GsfW-2hni;
	Fri, 13 Jun 2025 15:28:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uQ5Jd-0000000GgU8-2uOa
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 14:23:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 06EBE5C6B45;
	Fri, 13 Jun 2025 14:21:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC32FC4CEE3;
	Fri, 13 Jun 2025 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749824612;
	bh=vxVIQ13yTdvjtGU/5yGrhhgARcgPO6VY5Sff0Jaw0AA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=juHLjt3nRr8oondGj4pY5/C2UefEp94SEciT/Co+IndchJyEsxYd8pnyrrhc8Q8qz
	 0D/8YgFOdoG848c81CppPAXVZQ06Vkv6CMhj1fhwQDmqyhdBj76+ij+V8w8qS2RoSH
	 TjV4DlRnlbWKjLnAQqygDrAjbkqpVhzr3pQfwiiuASq/n8Xz1M3Zw7Zu/RQgQJlHve
	 65fyrM8OSUvjR/AC3SfiQPWEYqmff6AEK5lcUdCgF660Fn0Ljf/QIkwec+3j5rzMeY
	 vFRxEcSZZhTI27tX5N7e32pxrL4ccHMBq7Uj1rPUULDoE9BeYpRTLy/0Qzw//mxFeQ
	 m00VhbMb81E1g==
Date: Fri, 13 Jun 2025 15:23:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Yixun Lan <dlan@gentoo.org>,
	Ze Huang <huangze@whut.edu.cn>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH RFC 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20250613-paving-reimburse-fa5ed8c40c7f@spud>
References: <20250611082452.1218817-1-inochiama@gmail.com>
 <20250611082452.1218817-2-inochiama@gmail.com>
 <20250612-culpable-roman-295df1360198@spud>
 <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
MIME-Version: 1.0
In-Reply-To: <y6dkhbc4x5qvd3z2yyh3ba7zkq7gphcnrc5757fxlmpz3zh2nb@tk65ldng6oyl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_072333_822027_DF37F49C 
X-CRM114-Status: GOOD (  27.71  )
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
Content-Type: multipart/mixed; boundary="===============0538841966096053062=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0538841966096053062==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="1vrTP4wZOtNtnkC0"
Content-Disposition: inline


--1vrTP4wZOtNtnkC0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 13, 2025 at 06:09:47AM +0800, Inochi Amaoto wrote:
> On Thu, Jun 12, 2025 at 05:04:46PM +0100, Conor Dooley wrote:
> > On Wed, Jun 11, 2025 at 04:24:49PM +0800, Inochi Amaoto wrote:
> > > The Sophgo CV1800/SG2000 SoC top misc system controller provides regi=
ster
> > > access to configure related modules. It includes a usb2 phy and a dma
> > > multiplexer.
> > >=20
> > > Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> > > ---
> > >  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 57 +++++++++++++++++=
++
> > >  1 file changed, 57 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/soph=
go,cv1800b-top-syscon.yaml
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv18=
00b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
> > > new file mode 100644
> > > index 000000000000..e8093a558c4e
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top=
-syscon.yaml
> > > @@ -0,0 +1,57 @@
> > > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Sophgo CV18XX/SG200X SoC top system controller
> > > +
> > > +maintainers:
> > > +  - Inochi Amaoto <inochiama@outlook.com>
> > > +
> > > +description:
> > > +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> > > +  register access to configure related modules.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - items:
> > > +          - const: sophgo,cv1800b-top-syscon
> > > +          - const: syscon
> > > +          - const: simple-mfd
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  "#address-cells":
> > > +    const: 1
> > > +
> > > +  "#size-cells":
> > > +    const: 1
> > > +
> > > +patternProperties:
> > > +  "dma-router@[0-9a-f]+$":
> > > +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> >=20
> > I think you're supposed to add "unevaluatedProperties: false" to each of
> > these nodes.
> >=20
>=20
> This is is OK for me.
>=20
> > > +
> > > +  "phy@[0-9a-f]+$":
> > > +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> >=20
> > Why are these permitting random addresses? Are they not at fixed
> > addreses given that you only support one platform (modulo the rebrand)?
> >=20
>=20
> IIRC, they are fixed address. I use random addresses as I see many one
> in binding do the same. Should I switch to the fixed one?

If things are actually possible to have at variable addresses, then sure
use pattern properties and a regex. It may be like that if a new device
is released that reuses the dmamux or phy but locates it differently or
on a platform with multiple phys etc. If not, then then just restrict the
address to the only permitted one.

--1vrTP4wZOtNtnkC0
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaEw0XgAKCRB4tDGHoIJi
0mHVAP422bpYToyFRvNyvsMl7fHIbXsrtZOXXtSEguWI7y2XFwD+PpGmlMC+kvE5
QMlHPcjkFIyMBbeYtx/lKcoXkBMK5As=
=EHFn
-----END PGP SIGNATURE-----

--1vrTP4wZOtNtnkC0--


--===============0538841966096053062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0538841966096053062==--

