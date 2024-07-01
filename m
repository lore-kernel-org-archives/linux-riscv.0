Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A50C2BD09
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Jul 2024 12:37:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QjUWKuTaOospk69Rf5t3XBW8J7mr0DcGfzGE51dVemo=; b=q7KIoogMtMTDMUMCr5G9AFnd81
	rsdyEtZbn4WKxdiWFkaMHIlhpxcqyAp6NTEYVNdDHwLs9uz8YXMBK6SAS3CG2MOMc5TzC4SaskHDk
	/gDFnYnnxM/tcxaLF46ZuK9RAClgtZTLxyB15KtZvy4d7VadeTtxxCWwarZl4xijfdV4fIrQ3D99V
	HIvZMav/HHNaqm83iZ9I6715GNB3SZlKFOvsi/88WeRLQAonBdhOm3xlHtvk148J47M8S/WPTH3I5
	+h7pjri+RU69fc8t5HlChqfw7b9lj/YJ0JD2K2GhvKwNViXsKcB1klFASZAy7PDW75ZY1j8hgJ1ag
	sYxjZEug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOGHe-00000003GuI-1wKh;
	Mon, 01 Jul 2024 12:37:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sOG57-00000003AOL-1PTT
	for linux-riscv@lists.infradead.org;
	Mon, 01 Jul 2024 12:24:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7420ACE01B7;
	Mon,  1 Jul 2024 12:24:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B969C116B1;
	Mon,  1 Jul 2024 12:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1719836666;
	bh=7Gs9Q7JZEYXal3PZNj/A/6mBzMzEEW3iLGgskmEVdN4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gWEFcQdDR4hftb+ry0Tgx1mGlhZFYsNKzqKUFT9A9QyVM9/qAGMMvgQJD2941bVGv
	 Vj7qlgbYNOAoDu5SCWg02dEz0J6Qsjp8GHByQR7HK/0aayKb3OX0RPTZfrOLnT3jqH
	 t4NLEnjyQJllrhIfP942niZV1US2XWcD5CkCVfbboazshZawudVAd7eFE0yTUse3p9
	 q2LZsfzTu4N4lz5VGpfzODy9KXJ5j8/uAcy2JR6eB8jMY2ibv/9Pmur373UNK0NNtS
	 ZDh9V6JvkQSXxTh4R1cHPBcnicJlHVdVYhWVG68Mwvo8qElcmJmJea/VcacR/wCtMC
	 5C9+pY2Fx2PJQ==
Date: Mon, 1 Jul 2024 13:24:20 +0100
From: Conor Dooley <conor@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@sifive.com>, linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>,
	Meng Zhang <zhangmeng.kevin@spacemit.com>,
	Yangyu Chen <cyy@cyyself.name>
Subject: Re: [PATCH v2 03/10] dt-bindings: riscv: add SpacemiT K1 bindings
Message-ID: <20240701-undercook-flatterer-7f18f7420a6d@spud>
References: <20240627-k1-01-basic-dt-v2-0-cc06c7555f07@gentoo.org>
 <20240627-k1-01-basic-dt-v2-3-cc06c7555f07@gentoo.org>
MIME-Version: 1.0
In-Reply-To: <20240627-k1-01-basic-dt-v2-3-cc06c7555f07@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240701_052429_758922_A9C155EB 
X-CRM114-Status: GOOD (  15.69  )
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
Content-Type: multipart/mixed; boundary="===============2228269202758898318=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2228269202758898318==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zGw7lplsaqNbmjY2"
Content-Disposition: inline


--zGw7lplsaqNbmjY2
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 27, 2024 at 03:31:17PM +0000, Yixun Lan wrote:
> From: Yangyu Chen <cyy@cyyself.name>
>=20
> Add DT binding documentation for the SpacemiT K1 Soc[1] and the Banana
> Pi BPi-F3 board[2] which used it.
>=20
> [1] https://www.spacemit.com/en/spacemit-key-stone-2/
> [2] https://docs.banana-pi.org/en/BPI-F3/BananaPi_BPI-F3
>=20

Please make these link tags when you resend, like

Link: https://foo [1]

and don't leave blank lines between them and the signoff.

> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/riscv/spacemit.yaml        | 24 ++++++++++++++++=
++++++
>  1 file changed, 24 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/spacemit.yaml b/Docu=
mentation/devicetree/bindings/riscv/spacemit.yaml
> new file mode 100644
> index 0000000000000..3b151fd02473e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/riscv/spacemit.yaml
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/riscv/spacemit.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT SoC-based boards
> +
> +description:
> +  SpacemiT SoC-based boards

Please work out who is gonna maintain these SoCs and add that here to
resolve the bot's report.

Thanls,
Conor.

> +
> +properties:
> +  $nodename:
> +    const: '/'
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - bananapi,bpi-f3
> +          - const: spacemit,k1
> +
> +additionalProperties: true
> +
> +...
>=20
> --=20
> 2.45.2
>=20

--zGw7lplsaqNbmjY2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZoKf9AAKCRB4tDGHoIJi
0saUAP9HO8UZAlDq+B2KUs5Nm5I8paGb5pgWiWUGC4za85sbzgD+JyyFMlmU7Ro0
5EhR2LrpaRqLEwpuHlgevpF+NWOgugU=
=+Mjf
-----END PGP SIGNATURE-----

--zGw7lplsaqNbmjY2--


--===============2228269202758898318==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2228269202758898318==--

