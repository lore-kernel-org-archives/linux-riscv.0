Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70CDBC3DA59
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Jul 2024 15:49:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y1H/tqM2POAQgUNYXzDRXdUWX+T+6r+9QeJgjz8tY3g=; b=2U3nPWiCSNomghB/AHZpnsBMj9
	EWkHlxK8HXrhc4twRuh3n0Shw/N/jokKxw2uMWm9e8Tmu6KuFj/CMxx9/prqfVuzmFry+lcV+ygej
	ioHr2TEwvm+w979J9MzFQHHB8I0hhBLhYrxN/OzNKyhHHt1C9GiOSsUtfad+k/5YQPko93WV3oebx
	UaVivR9k4Bh7ZkhTT63fI9AHSv1Gbb3S+5ym0KsdOyAl0QFH1SxCE5YbnAg8eGhakTVLyNsg2Np2C
	zf1eNcHfV3nbqioSMF0N5tMHlt6u2KERMbUhbbCnAV6/Ug9PMLXEuzOFEjCB2e77tKb4LwGcOLaIq
	2Agn+lkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkQF-0000000AwqH-36Wz;
	Tue, 16 Jul 2024 15:48:59 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sTkQC-0000000Awpn-2Sc2
	for linux-riscv@lists.infradead.org;
	Tue, 16 Jul 2024 15:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 04BECCE1378;
	Tue, 16 Jul 2024 15:48:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C66EDC116B1;
	Tue, 16 Jul 2024 15:48:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1721144934;
	bh=yiL5E+wPu5Y3x7KMwlKXxy7AiUQK/uEVh2InvXmnZ/4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rLOS9VHucp2wLzSGwVwdHHVS7zo0Req291hcCYJDsqPQaVGdNHmPIAXGiM44ANWH/
	 q8GNQ7/1E3SFJTc90AJz5GZHz57pIB3wlpccOHNI7OAxgtARBTdfwrA8JVr9lhqGYl
	 KcG6G3c+gqQngcMuirgGtSXTn80pNeoWY6DRwmI+EtaWvoO/gsMgM4bTfVyPe+YYGj
	 uEnIYrCv8jHPAd1PZsGxSfGyPEUq2Rnc07DceLdTaVjuv0wbDdt1FHkvueqgf+/Uiv
	 kRpp7DRjl8PmEyloroTZF2QFCuIGhagQ9pSgyCSsaEkZAswG0eom6eSqNCez4CQYnH
	 IZlrpZXyrcRfw==
Date: Tue, 16 Jul 2024 16:48:48 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicorn_wang@outlook.com>
Cc: Haylen Chu <heylenay@outlook.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <20240716-cloning-canopy-a6799dc7f3b9@spud>
References: <SEYPR01MB422158B2766DA03728AD90CBD7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221281561CCE511A5094D28D7A22@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <MA0P287MB2822445DD34485B94D22E7FFFEA22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240716_084856_998552_2F13525E 
X-CRM114-Status: GOOD (  19.88  )
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
Content-Type: multipart/mixed; boundary="===============1240590201663975376=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1240590201663975376==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="sd00rq2NvKriVqOy"
Content-Disposition: inline


--sd00rq2NvKriVqOy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 16, 2024 at 08:43:19PM +0800, Chen Wang wrote:
>=20
> On 2024/7/16 17:42, Haylen Chu wrote:
> > Add devicetree binding documentation for thermal sensors integrated in
> > Sophgo CV180X SoCs.
> >=20
> > Signed-off-by: Haylen Chu <heylenay@outlook.com>
> > ---
> >   .../thermal/sophgo,cv1800-thermal.yaml        | 55 +++++++++++++++++++
>=20
> I see sometimes you call it cv1800, and in patch 3, the file name is
> cv180x_thermal.c, and for dts changes, you changed cv18xx.dtsi. Please un=
ify
> it.
>=20
> I think sg200x is new name for cv181x serias, so if you want to cover
> cv180x/sg200x, is cv18xx better?
>=20
> >   1 file changed, 55 insertions(+)
> >   create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,c=
v1800-thermal.yaml
> >=20
> > diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-th=
ermal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-therma=
l.yaml
> > new file mode 100644
> > index 000000000000..58bd4432cd10
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.y=
aml
> > @@ -0,0 +1,55 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Sophgo CV1800 on-SoC Thermal Sensor
> > +
> > +maintainers:
> > +  - Haylen Chu <heylenay@outlook.com>
> > +
> > +description: Sophgo CV1800 on-SoC thermal sensor
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - sophgo,cv1800-thermal
> cv18xx-thermal ?

Please, no wildcards in compatibles :/

> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    description: The thermal sensor clock
> > +
> > +  interrupts:
> > +    maxItems: 1
> > +
> > +  sample-rate-hz:
> > +    minimum: 1
> > +    maximum: 1908
> > +    default: 1

I still don't think this belongs in the devicetree, but is actually
software policy.

Cheers,
Conor.

> > +
> > +  '#thermal-sensor-cells':
> > +    const: 0
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - interrupts
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +        #include <dt-bindings/clock/sophgo,cv1800.h>
> > +        #include <dt-bindings/interrupt-controller/irq.h>
> > +        thermal-sensor@30e0000 {
> > +            compatible =3D "sophgo,cv1800-thermal";
> > +            reg =3D <0x30e0000 0x100>;
> > +            clocks =3D <&clk CLK_TEMPSEN>;
> > +            interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
> > +            #thermal-sensor-cells =3D <0>;
> > +        };
> > +...

--sd00rq2NvKriVqOy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZpaWYAAKCRB4tDGHoIJi
0mZqAP999xRpJzMXtWpyPBcbx37rhh26FZfxxiKu7D2l5nbsmgEAsTuQYEbczSgm
nYQXCbcQ4qhl/2WwYfp6srrcImU5Awc=
=2jKi
-----END PGP SIGNATURE-----

--sd00rq2NvKriVqOy--


--===============1240590201663975376==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1240590201663975376==--

