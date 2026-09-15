Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A2FC88E7D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 17:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G/+u/QrU6zi8IWoXGMKbF/rV6r/clK8qhp08KUo9EXg=; b=R8n5QcyifR56wh0J7u/4w6GxH6
	No6boKcCmAlSNmrlZp6sRq+tBbt3j1orZsSr7nhKJMuK533jzTiXM3cOEODTuAgoABc+o3fDdSVEK
	EGXKag1Frq0Nu7jBjQXnBx+Tdg+mlqkPAlL35u4LF8+qgL/ZIcQRtAdXywtI67tH9k7VbgdOQL16a
	5lhzmDCUXRMPy6LrxsdL9YNQXLRvKqqSUQASpeo/kSxXH/KmYWHxasMjKE5Dechlv9lXNTcaNqA7L
	3ZFwf0HVFoF5jMWd8XV1afJsjJB6NICQ3FuF91dA0ceiycQNlWMRU9xlbAgBF3EWooMHoX1VFBtFL
	sQIrXJMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XQb-00000007g4K-2Iso;
	Tue, 15 Sep 2026 17:58:45 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6XQa-00000007g3f-0Zhn
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 17:58:44 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A11F740983;
	Tue, 15 Sep 2026 17:58:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 317361F000FF;
	Tue, 15 Sep 2026 17:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789495123;
	bh=oUHffrv3GQ6o5rtKOOsay9s8TNC5DB5ASbnygHPwxHI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hodTFs9UAZ3ejFEuLYh469ysVLIHxRPQ+cG4KEjNf6o2JW4dSFbA5Fj2L4nFgUvLu
	 kaoEF0o5Bjfi2G+UmU5e0KNUT0eDxtM+dGE1FpdRQXtn+unZRUmB3QPYV+Kp6vdU6e
	 STCdRLkVqaUKqzEqvVH/gWAbgXeScfDBD+PR9/6MOIXUe7+XySbbHZq/Dqn1YRB6Gp
	 oEOpzVtZ98XqSJXj2zBZoz65cw07rpJjZWGVrcdTFa8dD6DCeAVIrrZ90z8xBt+XVH
	 ugHYt8oPFGCh9ubLAN8IWx2/xA6dCCyLiRETpMr6ci/OeaUyLA3DLce7vA1MCYkzwH
	 svOoup5dc3V7w==
Date: Tue, 15 Sep 2026 18:58:38 +0100
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
Subject: Re: [PATCH 3/9] dt-bindings: riscv: Add MIPS Boston board compatible
Message-ID: <20260915-woof-ducktail-5e2f52bc5762@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20260914-p8700-dts-v1-3-3267f14ebce1@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============5450498332156299353=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5450498332156299353==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rKfDYnTgx/BZV2g0"
Content-Disposition: inline

--rKfDYnTgx/BZV2g0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:51PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> Document the MIPS Boston board compatible with a P8700 bitfile.
>=20
> Co-developed-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Djordje Todorovic <djordje.todorovic@htecgroup.com>
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/riscv/gf.yaml | 27 +++++++++++++++++++=
++++++
>  1 file changed, 27 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/gf.yaml b/Documentat=
ion/devicetree/bindings/riscv/gf.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..060910c9b04f482aee6f08f8f=
72232acbad118bb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/gf.yaml
> @@ -0,0 +1,27 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/gf.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: GlobalFoundries MIPS SoC-based boards
> +
> +maintainers:
> +  - Djordje Todorovic <djordje.todorovic@htecgroup.com>
> +  - Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> +
> +description:
> +  GlobalFoundries MIPS SoC-based boards
> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - description: Boston FPGA development board with a MIPS P8700 bit=
file

I'm not convinced that this is specific enough at all.
I have absolutely no idea from this description if there's even a
specific FPGA involved here - this could mean a bitstream used on an Altera
platform or a Xilinx one, with totally different contents.
I'm only happy with FPGA bitstream content being supported if it is
versioned strictly and matches with some clear and obvious releases from
the vendor. I cannot even find this board by googling it, let alone find
clear information about what this could correspond to.

> +        items:
> +          - const: gf,mips-p8700-boston

"items: - const" is the same as just having "const". SoC-specific
fallback is also missing, although in this case it'll be tricky to have
a meaningful one.

pw-bot: changes-requested

Thanks,
Conor.

> +
> +additionalProperties: true
> +
> +...
>=20
> --=20
> 2.43.0
>=20
>=20

--rKfDYnTgx/BZV2g0
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqmHTgAKCRB4tDGHoIJi
0rgaAP9woGMlHghSEluZoJhl8LSYpU0BtwuQg/FGHRDSTJjk7wD9G5ghtcCqBeW2
I2QpH3waoJuqaWWujuvwJuXMKlMSyAE=
=lJT6
-----END PGP SIGNATURE-----

--rKfDYnTgx/BZV2g0--


--===============5450498332156299353==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5450498332156299353==--

