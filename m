Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09375CCD1BF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Oct 2025 16:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f1wO/j1km/U0dKlSpQOgQ7w8Z0iFFmv/HG9MKDsEMjs=; b=qQ0oOrgUp8zUX4wQbv9O/KqNMc
	+TNLa4489gzhvhwlP6FFSvQ6dv879nPWgNd20YbFLnuiQZzjVt9RECDYIluCG9maz9JiFsrYzuFYP
	7Wu6m80PnFaTsa8OVPOKpKm673bU/R5aDeul1crzJjRX8UvW2LwpIzMOwhLXhPWM7PvudAsyI0OuO
	0m8hEczLHLz1F0FdWS3W55Hq5QFLeyC9YTgd+QAPNnX1uRwvJ2rcu22PvGKl/mZlgAfZWNh2DzoaA
	rhZInqxtF6FRDC2X1/2te0iFLuXaX6wPMKcreISfgCnfggzEIgaNP8CisREZ/OMhqfUqkMdhWD4gI
	Ss40GDoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvc-0000000A0jw-1Hr2;
	Fri, 24 Oct 2025 16:46:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCKvZ-0000000A0ix-3UE9
	for linux-riscv@lists.infradead.org;
	Fri, 24 Oct 2025 16:46:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3827043846;
	Fri, 24 Oct 2025 16:46:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56CCC4CEF1;
	Fri, 24 Oct 2025 16:46:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761324369;
	bh=oH2uo8kUvZvaWDuaKBK5Ia3tKQOcMF+N8RlJE5fLuNI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NSwD/cs5L6f5qlBmgfQodcXn4hEKJOQyLYx6LmkIVGt9zRcacVOreE4uvk+9JlYxy
	 pI6L5HJGt8wvzSJsvZ+UvEXsT2TFskHEQdHqxw8N/C6uQc5AyusqbRW/xtFuyCMn1R
	 Oj3GqElZImOxVsQIhDCVkwk6yHrcaae6BtwQXWVPR46rxaDM54P09G6/WNGEUSBB7Y
	 skUG3IZ2D38fTg0Jh3ky+KQjIAx/p31peSkUJiuupbYsgq88vJxT2SDqMYr7Ig78xx
	 02Hq7NA1FvUwDT1DXDVmyvxkbwBhuxhALAS0pFa9OAS3BSwB/bKtYGJSw1NTmJk2Jt
	 H+lv1Je1X2+Fw==
Date: Fri, 24 Oct 2025 17:46:03 +0100
From: Conor Dooley <conor@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Yu Yuan <yu.yuan@sjtu.edu.cn>, Ze Huang <huangze@whut.edu.cn>,
	devicetree@vger.kernel.org, sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 1/3] dt-bindings: soc: sophgo: add TOP syscon for
 CV18XX/SG200X series SoC
Message-ID: <20251024-hangout-designing-33e96c0d35fc@spud>
References: <20251024030528.25511-1-looong.bin@gmail.com>
 <20251024030528.25511-2-looong.bin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20251024030528.25511-2-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_094609_931887_67A94933 
X-CRM114-Status: GOOD (  21.35  )
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
Content-Type: multipart/mixed; boundary="===============6472163287880964072=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6472163287880964072==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OpamxSOV8OwCADjJ"
Content-Disposition: inline


--OpamxSOV8OwCADjJ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 24, 2025 at 11:05:14AM +0800, Longbin Li wrote:
> The Sophgo CV1800/SG2000 SoC top misc system controller provides register

Please remind me how it works, sg2000 is just a rebadge and really this
just refers to one device?

> access to configure related modules. It includes a usb2 phy and a dma
> multiplexer.
>=20
> Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> ---
>  .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
>  1 file changed, 81 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,c=
v1800b-top-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-=
top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv180=
0b-top-syscon.yaml
> new file mode 100644
> index 000000000000..d044ca661fa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-sys=
con.yaml
> @@ -0,0 +1,81 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo CV18XX/SG200X SoC top system controller
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +description:
> +  The Sophgo CV18XX/SG200X SoC top misc system controller provides
> +  register access to configure related modules.

Here and in the title you have Xs, are those placeholder or is this
going into cv180x.dtsi and going to be used on multiple devices?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,cv1800b-top-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  ranges: true

Do you actually use ranges?

> +patternProperties:
> +  "dma-router@[0-9a-f]+$":

Do these actually appear at variable addresses, or is it always 48 for
the phy and 53 for the dma router?

> +    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
> +    unevaluatedProperties: false
> +
> +  "phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
> +    unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/sophgo,cv1800.h>
> +
> +    syscon@3000000 {
> +      compatible =3D "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
> +      reg =3D <0x03000000 0x1000>;
> +      #address-cells =3D <1>;
> +      #size-cells =3D <1>;
> +
> +      usbphy: phy@48 {

Drop the labels off of these two, since they're unused in the example.

> +        compatible =3D "sophgo,cv1800b-usb2-phy";
> +        reg =3D <0x48 0x4>;
> +        #phy-cells =3D <0>;
> +        clocks =3D <&clk CLK_USB_125M>,
> +                 <&clk CLK_USB_33K>,
> +                 <&clk CLK_USB_12M>;
> +        clock-names =3D "app", "stb", "lpm";
> +        resets =3D <&rst 58>;
> +      };
> +
> +      dmamux: dma-router@154 {
> +        compatible =3D "sophgo,cv1800b-dmamux";
> +        reg =3D <0x154 0x8>, <0x298 0x4>;
> +        #dma-cells =3D <2>;
> +        dma-masters =3D <&dmac>;
> +      };
> +    };
> +
> +...
> --
> 2.51.0

--OpamxSOV8OwCADjJ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaPutSwAKCRB4tDGHoIJi
0trzAP4nfQ6/Wxgh8wcGJdVXjTM5fYSSjyHVynWRqnuELKsrCQD+NmT3Mi9bgtxf
nLsFD4E3jkFuEsA2OafNMSd9+ubbNw8=
=pezZ
-----END PGP SIGNATURE-----

--OpamxSOV8OwCADjJ--


--===============6472163287880964072==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6472163287880964072==--

