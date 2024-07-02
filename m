Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CB96C3064D
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jul 2024 15:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nGUWbELrpGMlkgOptrcpSaSlYUvEAlrgNrycRbnicNQ=; b=ZaDZEVFt0UgZlkxINfeLO8itxz
	I+3c6nTXXrQ1Gcl3PTkSUP8IBYN41Eq2/D1lEjRdkaPY5/4pd+glz5kJSCtAyPfI/FBBkXpVL7yd0
	mUpJTLV8O/AltdfChLO5+WgGNNqpOXjT1u+uZO9dHspcwL7wTEjiXxPyspkvZkxERTH3wn0OBZfaZ
	iZkMuJWKyHwLywo+rghywnBDGLkzCbNv53LYmQkGQJWf8IKBDTNy7g4gVRBQlya/HwiewTugzf74K
	zsVePK8hot8BfrbzfCN+Qut/Nv1QzcgPaDDYWH4YJ0mj3BzeryxQtTvYuEojoQ+dkqvGEty7ljy62
	Rmy1/Ymw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOf00-000000077Uk-1ZDT;
	Tue, 02 Jul 2024 15:00:52 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOezx-000000077Sz-2T2g
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jul 2024 15:00:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DD360CE1098;
	Tue,  2 Jul 2024 15:00:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B42BCC2BD10;
	Tue,  2 Jul 2024 15:00:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719932447;
	bh=HAu5MXagusH8Y8IO8gLkVN9AN4GtavJDI9q++gRfbt0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fIh4HYNRke/G3/IhSdtY+p9k6djkA5WRhd4A/8lWN7WdJviYJ/8AHiNQmPKyOp2/Z
	 828nx8bmngWCeIyy26cq5e4t8t7KFiZefldBLDhl2m0xC4glpbJCl5j+DaZtjoLGy8
	 2WSkzNRGz2z/Y3VAoaMXTuenYUqLOIFovdF5cUgA2s/Z2ejNXTQH/Ju2XNLK6WNfrF
	 RGgmtfLy0U7LF9V4ImaFlSOrvPNOk/5p1TJvD8ANGV7aTjdMO3MM2MdcYnE4DMm7lB
	 thioDrLH+PourfWA4Gmzz4b0UBXEDqB/NHtaFi11pbcupF2Q+mbu3AALOCRbrK7zdM
	 qH0luSwjxEx/Q==
Date: Tue, 2 Jul 2024 16:00:41 +0100
From: Conor Dooley <conor@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: thermal: sophgo,cv1800-thermal: Add
 Sophgo CV1800 thermal
Message-ID: <20240702-aptitude-overripe-8ac9aa3c6b90@spud>
References: <SEYPR01MB42213F3A032C60C6AF5EB677D7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB42217228213F5F2C739088DED7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
In-Reply-To: <SEYPR01MB42217228213F5F2C739088DED7DC2@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240702_080050_015125_522B5B8E 
X-CRM114-Status: GOOD (  19.37  )
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
Content-Type: multipart/mixed; boundary="===============7125236194998671489=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7125236194998671489==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Cj+2FTDLsk6UdrLf"
Content-Disposition: inline


--Cj+2FTDLsk6UdrLf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Rob/Krzysztof, Haylen,

On Tue, Jul 02, 2024 at 09:30:24AM +0000, Haylen Chu wrote:
> Add devicetree binding documentation for thermal sensors integrated in
> Sophgo CV180X SoCs.
>=20
> Signed-off-by: Haylen Chu <heylenay@outlook.com>
> ---
>  .../thermal/sophgo,cv1800-thermal.yaml        | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/thermal/sophgo,cv18=
00-thermal.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/sophgo,cv1800-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.=
yaml
> new file mode 100644
> index 000000000000..016299822c16
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/thermal/sophgo,cv1800-thermal.yaml
> @@ -0,0 +1,74 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/thermal/sophgo,cv1800-thermal.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV1800 on-SoC Thermal Sensor
> +
> +maintainers:
> +  - Haylen Chu <heylenay@outlook.com>
> +
> +description: Binding for Sophgo CV1800 on-SoC thermal sensor
> +
> +properties:
> +  compatible:
> +    enum:
> +      - sophgo,cv1800-thermal
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: The thermal sensor clock
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  accumulation-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: Accumulation period for a sample
> +    enum:
> +      - 512
> +      - 1024
> +      - 2048
> +      - 4096
> +    default: 2048
> +
> +  chop-period:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: ADC chop period
> +    enum:
> +      - 128
> +      - 256
> +      - 512
> +      - 1024
> +    default: 1024
> +
> +  sample-cycle-us:

the more common term btw would be "sample-rate" rather than
"sample-cycle".

> +    description: Period between samples. Should be greater than 524us.

The constraint here should be "minimum: 524". What's the upper limit?

> +    default: 1000000

Rob/Krzysztof, could you comment on the suitability of the three custom
properties here? I know if this was an IIO device, these kinds of things
would be controllable from userspace, and not in the binding. I
mentioned this on the previous version, but I'm not really sure if
thermal devices are somehow different:
https://lore.kernel.org/all/SEYPR01MB4221A739D0645EF0255336EBD7CE2@SEYPR01M=
B4221.apcprd01.prod.exchangelabs.com/

Cheers,
Conor.

> +
> +  '#thermal-sensor-cells':
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        #include <dt-bindings/clock/sophgo,cv1800.h>
> +        #include <dt-bindings/interrupt-controller/irq.h>
> +        thermal-sensor@30e0000 {
> +            compatible =3D "sophgo,cv1800-thermal";
> +            reg =3D <0x30e0000 0x100>;
> +            clocks =3D <&clk CLK_TEMPSEN>;
> +            interrupts =3D <16 IRQ_TYPE_LEVEL_HIGH>;
> +            #thermal-sensor-cells =3D <0>;
> +        };
> +...
> --=20
> 2.45.2
>=20

--Cj+2FTDLsk6UdrLf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoQWGQAKCRB4tDGHoIJi
0uEgAP47Q2cX9PmFKJkFJalVe/Rw7yugRnC+FfIH24aHmHktbgEA+/MGeF1RqXj6
om07QLglXEVagK/oyR9xgJNcjokVnwA=
=zVtS
-----END PGP SIGNATURE-----

--Cj+2FTDLsk6UdrLf--


--===============7125236194998671489==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7125236194998671489==--

