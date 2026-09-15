Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D46C88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 18:15:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cS9lZjwmh3EywNbFIRvTC6H+JK+RGUTho0X8WdpLB7Q=; b=yUTLxDzklqJ1LNNH4L+21rlZE8
	KN4RHEn2x4MkmpGF8cskrWpcXPKELaQBBLPlat99OznzP11wUlxBIHPMbDucoXgc2DydxgbvW4x2a
	I2yO79Jc+EiTadbNLxHnqveLvLStQl3nxsGBgThWqAnLhAVRmhtqoi8rKPiqoBVXpC62n6Ieb2tbF
	lrobPgYllfU14u5ahqmNUPBXTqTwr2aw9FZVuJuAqvTYoDOW5LJHq+PfYdVVi5tSpm7zlsH8UYis0
	52ZZEbU7nhj1TEyA8HdemkXaQSCBc9Ygp55PCJ4ccScSVd0wH0+J/fwOa7BVMNUcg9rC77RmFXrsL
	bWHWOYQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Xgd-00000007iVc-1ICC;
	Tue, 15 Sep 2026 18:15:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Xgb-00000007iVJ-2wBn
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 18:15:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CD148600E2;
	Tue, 15 Sep 2026 18:15:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BE1B1F000FF;
	Tue, 15 Sep 2026 18:15:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789496116;
	bh=7LiOkyrowLZMQRdqSCIsEJGg81/bVY8TIcgKnfMHAbo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=e2T6COoJIwXhLdc88EMq5egMTWOwIlUxkshvuA1DuwLyw7PK9zVkqIxTG54UH1Li3
	 BUckYTkq+pl+Mss161jfp/e64drrbEmYyzBulS0tGOgyEhy/XbU7oLKR6itfrsEIh6
	 Lmjlt1PT+KaukJipjze6oFE0MigUZL9k+2p9e14CzHpNiFBY1ed2Jg9ksS/kAPI3sK
	 Tw2QJTPQPE5H2Vl7/NtshaugLZVOyM2d1dXun9iF8sz2yobhx4IMqGHlnD6CcfZjKF
	 M1uE9sk2NeD6iUlrPGtDOt8zMuM6xyDdlROMaU2UL3sbYrbjnZvfhOJOKIXDvwbTw3
	 rJm5ebCYyGE7w==
Date: Tue, 15 Sep 2026 19:15:09 +0100
From: Conor Dooley <conor@kernel.org>
To: aleksa.paunovic@htecgroup.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Djordje Todorovic <djordje.todorovic@htecgroup.com>,
	Anup Patel <anup@brainfault.org>, Thomas Gleixner <tglx@kernel.org>,
	Radu Rendec <radu@rendec.net>,
	Inochi Amaoto <inochiama@outlook.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Subject: Re: [PATCH 5/9] dt-bindings: interrupt-controller: Add MIPS P8700
 ACLINT MSWI
Message-ID: <20260915-pasty-ungodly-f034f7a3b9db@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-5-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20260914-p8700-dts-v1-5-3267f14ebce1@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============3782531913642075500=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3782531913642075500==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1Nq4GOJ/lsqTXyBw"
Content-Disposition: inline

--1Nq4GOJ/lsqTXyBw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:53PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the aclint mswi compatible for the MIPS P8700 and
> introduce the 'riscv,hart-indexes' property,
> used to address the sparse MIPS P8700 harts.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  .../thead,c900-aclint-mswi.yaml                    | 34 ++++++++++++++++=
++++++
>  1 file changed, 34 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead=
,c900-aclint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-contro=
ller/thead,c900-aclint-mswi.yaml
> index 62fd220e126e650e3800d8eee2a749fdbbde6108..47c04943eb0c793467aaa5570=
776605cae0eadfd 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-a=
clint-mswi.yaml
> @@ -17,6 +17,8 @@ properties:
>                - sophgo,sg2042-aclint-mswi
>                - sophgo,sg2044-aclint-mswi
>            - const: thead,c900-aclint-mswi
> +      - items:
> +          - const: gf,mips-p8700-aclint-mswi
>        - items:
>            - enum:
>                - anlogic,dr1v90-aclint-mswi
> @@ -29,6 +31,14 @@ properties:
>      minItems: 1
>      maxItems: 4095
> =20
> +  riscv,hart-indexes:

Nothing in this binding is a ratified extension, despite how prevalent
the use has become, so I object to using riscv as a prefix for something
the other devices don't use.

I'm not very familiar with this spec, why do you need this and the
existing devices don't?
Why can the information not be looked up using the existing phandle?

> +    $ref: /schemas/types.yaml#/definitions/uint32-array
> +    minItems: 1
> +    maxItems: 4095
> +    description:
> +      A list of hart indexes that the MSWI device uses to address each h=
art
> +      that is mentioned in the "interrupts-extended"
> +
>  additionalProperties: false
> =20
>  required:
> @@ -36,6 +46,19 @@ required:
>    - reg
>    - interrupts-extended
> =20
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: gf,mips-p8700-aclint-mswi
> +    then:
> +      required:
> +        - riscv,hart-indexes
> +    else:
> +      properties:
> +        riscv,hart-indexes: false
> +
>  examples:
>    - |
>      interrupt-controller@94000000 {
> @@ -46,4 +69,15 @@ examples:
>                              <&cpu4intc 3>;
>        reg =3D <0x94000000 0x00010000>;
>      };
> +
> +  - |
> +    mswi@16150000 {
> +      compatible =3D "gf,mips-p8700-aclint-mswi";
> +      reg =3D <0x16150000 0x4000>;
> +      interrupts-extended =3D <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>,
> +                            <&cpu4intc 3>;
> +      riscv,hart-indexes =3D <0x0 0x1 0x10 0x11>;
> +    };
>  ...
>=20
> --=20
> 2.43.0
>=20
>=20

--1Nq4GOJ/lsqTXyBw
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmLLQAKCRB4tDGHoIJi
0tm0AP9CkOP0qXH2XHICRv6dxNwP1h+cSG4OySeRYwlbYz1PbQEA8EfxNDmhmVND
grQrbSmDitjuWP6Ge1OD1o9EN0rhjgQ=
=5qav
-----END PGP SIGNATURE-----

--1Nq4GOJ/lsqTXyBw--


--===============3782531913642075500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3782531913642075500==--

