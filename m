Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA63FC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 14 Nov 2023 17:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pvDh8l+ywH2Nq6Oo1qi5xDtBhXfql8r6SrdjRjho51E=; b=2JoztP4d56f/3nvOd9fkHMhyPw
	THgpK21Ys/nG1V/VRf2t1xoNHWD8lWnWuIT94pSefgY8341UD+EHbJ0BaDI4lcWMKvXYpfywe723x
	LYopJJ8U48HB7LisxmXp2iCj98AgA4ZXCV7kHAOXlHWU29jUIIxPVZ6/9CRKRLVdAtPXjz0TuYZcL
	UBu3VHiOMhohD/J89rj7kLLQcqtg7g/aKfNoHj6t3XLjtvzZ5LYhJMAZzXvg1BCiyq/0ikG1/wp0q
	xNDvrQMoUVA6NM+qSEX/u/3XyJcbvT4Y6ZKWTqzzEZ1oUmxBwFUYAjjUWC9D/pADx5xjmqyIA6ZXz
	O4VCzG0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xOn-00GWVd-2k;
	Tue, 14 Nov 2023 17:40:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2xOk-00GWV0-2S
	for linux-riscv@lists.infradead.org;
	Tue, 14 Nov 2023 17:40:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id EF315CE1AA4;
	Tue, 14 Nov 2023 17:40:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8121AC433C8;
	Tue, 14 Nov 2023 17:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699983624;
	bh=z9PwBTSGVM1q27ATk+TMybFpQRzzSFtVdprhH4R8Ytk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YPq+NIIdBj7YLws2oaM2krjeCUtZ8V97BQueGz5nDfeAhkmKi1uaZYlzsRhy5NHZi
	 7bqwW0XHxgaJpVaRgO6JMzf9dKNS2PupqbmwnOHIEPs5MMedPu1wGSSO2w1e4fWRQ8
	 tPQLX3t8fs2p+Te3m95wj0suqTypCdHLGWW4/x8ftNwXylBPvc/zXsmwF3vXFvA8Uy
	 4BGyuCgWCPfUYDTk1TJ/e2eu+rjkZqcNFcdlILrzE/nWc3b2Ozrs2m75OG51ZbBapX
	 5j7bpSe/UuErrJ7VwU+PfylJT8w2bJhqMbHbEJR1g8nbyUiH+rzjjiupwRF79scyVe
	 jHCZj+Y4QXARQ==
Date: Tue, 14 Nov 2023 17:40:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen Wang <unicornxw@gmail.com>
Cc: aou@eecs.berkeley.edu, chao.wei@sophgo.com,
	krzysztof.kozlowski+dt@linaro.org, mturquette@baylibre.com,
	palmer@dabbelt.com, paul.walmsley@sifive.com,
	richardcochran@gmail.com, robh+dt@kernel.org, sboyd@kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com, xiaoguang.xing@sophgo.com,
	Chen Wang <unicorn_wang@outlook.com>
Subject: Re: [PATCH 2/5] dt-bindings: soc: sophgo: Add Sophgo syscon module
Message-ID: <20231114-timid-habitat-a06e52e59c9c@squawk>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
 <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
In-Reply-To: <3c286171af30101b88f0aaf645fb0a7d5880ac0a.1699879741.git.unicorn_wang@outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231114_094027_139656_F9C83C62 
X-CRM114-Status: GOOD (  17.64  )
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
Content-Type: multipart/mixed; boundary="===============5509394424248200594=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5509394424248200594==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7x2SPF0LZcIrRSv8"
Content-Disposition: inline


--7x2SPF0LZcIrRSv8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 13, 2023 at 09:19:02PM +0800, Chen Wang wrote:
> From: Chen Wang <unicorn_wang@outlook.com>
>=20
> Add documentation to describe Sophgo System Controller Registers for
> SG2042.
>=20
> Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
> ---
>  .../soc/sophgo/sophgo,sg2042-syscon.yaml      | 38 +++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,s=
g2042-syscon.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-s=
yscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-sys=
con.yaml
> new file mode 100644
> index 000000000000..829abede4fd5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,sg2042-syscon.y=
aml
> @@ -0,0 +1,38 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/sophgo/sophgo,sg2042-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Sophgo SG2042 SoC system controller
> +
> +maintainers:
> +  - Chen Wang <unicorn_wang@outlook.com>
> +
> +description:
> +  The Sophgo SG2042 SoC system controller provides register information =
such
> +  as offset, mask and shift to configure related modules.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - sophgo,sg2042-syscon
> +          - const: syscon

THere's only one option here, so the oneOf should be removed. Similarly,
since there's only one SoC, and it sounds like the next large sophgo
system is going to be using an entirely different core provider, I think
should just simplify this to a pair of "const:" entries.

> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    syscon@30010000 {
> +        compatible =3D "sophgo,sg2042-syscon", "syscon";
> +        reg =3D <0x30010000 0x1000>;
> +    };

Per my comments elsewhere, I think the clock controller should be a
child of this node, rather than an unrelated node, linked by a phandle.

Cheers,
Conor.

--7x2SPF0LZcIrRSv8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZVOxAAAKCRB4tDGHoIJi
0iTVAP4xqsqRPb18xDpU2gdHBpqavoQRucplJdovfCUwjpJR5gD/cxDZbzW9yvV+
GQOC1Uef/4CbdqURfao9Zf5pzfrisgo=
=lwGH
-----END PGP SIGNATURE-----

--7x2SPF0LZcIrRSv8--


--===============5509394424248200594==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5509394424248200594==--

