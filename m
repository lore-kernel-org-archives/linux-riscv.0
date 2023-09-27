Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E1E82CAA
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Sep 2023 16:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Pkg9v+52FhTfTPI3d8Bb6Afhlaz3gioIZzkEEJG9sc=; b=SuxdtTmrwFX18wydkeB6gOsQfl
	m+c9wxtk7YMB3KODnOWkDlXDKyl7Se7payNZmqKrkErRDMjAq4sN7uv6+QyEVksQniEyDToiCughB
	V6tkepIwV0nebEI7w0dWuX5iq3wktwwsh2zS1+Z4S+TdNid5nzWAyDQw2umzgjv7z+tgwOwakbV5E
	dXvM3p+FNYWVwhG/C1qfHMHfIGwYmE5id75e8aErIv3e8Te76etQNcCIeMCWdVEkwbSBZMPfad22s
	9pB0UfTcS74XqrfjMzI2OL+dHn/qbNoURhFYWYYhkbFWxMkDBOtuCKu05BTgTZRE4gm2A+j0XSXdb
	vdENM4Cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWyx-001OHO-1x;
	Wed, 27 Sep 2023 16:01:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlWyv-001OG9-1o
	for linux-riscv@lists.infradead.org;
	Wed, 27 Sep 2023 16:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4AAF86028C;
	Wed, 27 Sep 2023 16:01:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EA1C433C7;
	Wed, 27 Sep 2023 16:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695830503;
	bh=g8hfxPKGJGJl/UIBplcbprhnwEUxPdVtKkry7oymVXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y2TCQcR9P+d+vgsfnLUeeRq2YqxSzOFTiz9l1MERmW8L/tf/7PWXyShXjw+BmSdMw
	 RUK4waPOdM4y0mmBFBqzka/qjOYIT5jA7QvwVjxNATwxzVi5o7leMiCr0XMkei3/z8
	 KCl+ucafyN3Fq2IlwZ+OVTf2Yl3dm/sjfaEak2DVTOsX/lPEQxz4egwdsxg0VHuhSb
	 chw5TBh5pE1WPowTVp4AC67FuLSVIat535SG0voki82vfxs/3uMZ6F+Oyi3mfRPqBO
	 YgTxZzGeTwJ7PChGDuKIQLRIMa2ljc0+dm1fMQ9T7QaOfeqpS3wmtPI7pQTK//yVjX
	 pE3v//Rgs580g==
Date: Wed, 27 Sep 2023 17:01:38 +0100
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com, devicetree@vger.kernel.org,
	guoren@kernel.org, jszhang@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	xiaoguang.xing@sophgo.com, apatel@ventanamicro.com,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <wangchen20@iscas.ac.cn>
Subject: Re: [PATCH v3 07/11] dt-bindings: interrupt-controller: Add Sophgo
 sg2042 CLINT mswi
Message-ID: <20230927-panic-android-a83f1658b44e@spud>
References: <cover.1695804418.git.unicornxw@gmail.com>
 <4dcfca1b0fa736a226bd01c796e4d8986ce49e63.1695804418.git.unicornxw@gmail.com>
MIME-Version: 1.0
In-Reply-To: <4dcfca1b0fa736a226bd01c796e4d8986ce49e63.1695804418.git.unicornxw@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_090145_687635_FC7BA63E 
X-CRM114-Status: GOOD (  16.39  )
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
Content-Type: multipart/mixed; boundary="===============4793906082731950432=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4793906082731950432==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ScPARXmZC2Sxj2yI"
Content-Disposition: inline


--ScPARXmZC2Sxj2yI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 27, 2023 at 05:01:56PM +0800, Chen Wang wrote:
> From: Inochi Amaoto <inochiama@outlook.com>
>=20
> Like the timer of Sophgo sg2042 clint. The machine-level software
> interrupt device (mswi) of sg2042 clint have the same problem when
> dealing with the standard sifive clint.
>=20
> To avoid the same conficts as the timer of sg2042 clint, also add the
> vendor specific compatible string to identify the mswi of sg2042 clint.
>=20
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> Signed-off-by: Chen Wang <wangchen20@iscas.ac.cn>
> Signed-off-by: Chen Wang <unicornxw@gmail.com>

All of the same comments apply here.

Thanks,
Conor.

> ---
>  .../sophgo,sg2042-clint-mswi.yaml             | 42 +++++++++++++++++++
>  1 file changed, 42 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controlle=
r/sophgo,sg2042-clint-mswi.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sophg=
o,sg2042-clint-mswi.yaml b/Documentation/devicetree/bindings/interrupt-cont=
roller/sophgo,sg2042-clint-mswi.yaml
> new file mode 100644
> index 000000000000..a79c4c3db3b3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sophgo,sg204=
2-clint-mswi.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/sophgo,sg2042-cl=
int-mswi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo sg2042 CLINT Machine-level Software Interrupt Device
> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@outlook.com>
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - const: sophgo,sg2042-clint-mswi
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 4095
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts-extended
> +
> +examples:
> +  - |
> +    interrupt-controller@94000000 {
> +      compatible =3D "sophgo,sg2042-clint-mswi";
> +      interrupts-extended =3D <&cpu1intc 3>,
> +                            <&cpu2intc 3>,
> +                            <&cpu3intc 3>,
> +                            <&cpu4intc 3>;
> +      reg =3D <0x94000000 0x00010000>;
> +    };
> +...
> --=20
> 2.25.1
>=20

--ScPARXmZC2Sxj2yI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZRRR4gAKCRB4tDGHoIJi
0oCnAPwKz/8llmG1EA5gxcsPI5pDNveD7l02WfjCJbsJlwMtPgD8CzmKZFaiHa3L
4EbaEkN16XjvjRlN6/E+uYCOJceAbAw=
=crfR
-----END PGP SIGNATURE-----

--ScPARXmZC2Sxj2yI--


--===============4793906082731950432==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4793906082731950432==--

