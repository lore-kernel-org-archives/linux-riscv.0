Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E5D3606A32A
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=SvQ74VSV;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=m9SXc34f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=RS0+ZEQO16zs+sE/3adAXxV/nqDAUuWxCBBoFiOmdYw=; b=SvQ74VSViDv/VUqewwjGGjt9M8
	0ZYoVV0rKY2j9QbkW9li6X9I7gT8mfft5FhDl4NK8iEkYjirX6w+gs3ds1rvwBEStQT8nwICvHU2E
	8W1+FpRAg52LnGVHtSuGsuWGron2vrJzU0CB3ZLOLFJQCRZqdjLEkLzwfZlqDzjIxup/CxJQRyeSd
	E7O5eU7gXKaAGv1zi3fdyKCs2FAjZ5WNjwM4DSWU9GzycIcT+a8IJ3k14ocfL3zgChNHyLyIGBzpY
	S/UJ96Wxb01XpzOCkIevbBKyWTAtRb7SdioRHd7ONjLKIdfgY+hVY4U9/lbKh/79XH0D8qZImYcol
	YaC98WKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1YA-00000003bVG-0slh;
	Mon, 16 Nov 2026 18:35:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1Y8-00000003bUa-3uT7;
	Mon, 16 Nov 2026 18:35:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4AD6663143;
	Mon, 16 Nov 2026 18:35:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8970F1F000C4;
	Mon, 16 Nov 2026 18:35:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794854128;
	bh=Q8fWQBgofRqmDIckF8inUm41V68y3ygeKVYMQd0qF0E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=m9SXc34fYM5jcJuE1wTy6zk64bskstE3LtiDgfZxmmOaqHstxKBWeNqSoTlPNJ83z
	 QT5lbfPhNY1vvAmdlzX65ielD8qN5RtpztH54/QmlfCrWFL2x0grSV7yt/TpR4g5/2
	 Q7j4mNfhDrwj/w31plz/G21x+t9/KwKPaG6dOqCcT6pJvBXr8r6zYOVmkzOLUjBRdq
	 B52g+XcrwyWqhU0KG0NpxTVKtNArw4E/DOy8C3vVOT6fJE8KiOeQ6oG7Ad+XAnFijL
	 s5NP99cIJVFtIQG1Jona40lByHZtMTjMEooORNkB532sTG8PzJO8O+FfalgSU1FPDU
	 Gn380UsXQlfzw==
Date: Mon, 16 Nov 2026 18:35:19 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 12/19] dt-bindings: pinctrl: add the Allwinner V861 pin
 controllers
Message-ID: <20261116-friday-follow-4d042ae6a3b7@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-12-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-12-eb71ec3ee523@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============4240779899078937719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============4240779899078937719==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iob+U2BkGYeh1b1b"
Content-Disposition: inline

--iob+U2BkGYeh1b1b
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 14, 2026 at 06:33:38AM +0800, Han Gao via B4 Relay wrote:
> From: Han Gao <gaohan@iscas.ac.cn>
>=20
> The V861 main and always-on pin controllers follow the A523 binding.
> The always-on one has a single interrupt bank, so also allow a single
> debounce value.
>=20
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../pinctrl/allwinner,sun55i-a523-pinctrl.yaml     | 31 ++++++++++++++++=
+++---
>  1 file changed, 28 insertions(+), 3 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a=
523-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun5=
5i-a523-pinctrl.yaml
> index d7d0ba32ced4..3c2924df17b9 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pin=
ctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun55i-a523-pin=
ctrl.yaml
> @@ -4,7 +4,7 @@
>  $id: http://devicetree.org/schemas/pinctrl/allwinner,sun55i-a523-pinctrl=
=2Eyaml#
>  $schema: http://devicetree.org/meta-schemas/core.yaml#
> =20
> -title: Allwinner A523 & A733 Pin Controller
> +title: Allwinner A523, A733 & V861 Pin Controller
> =20
>  maintainers:
>    - Andre Przywara <andre.przywara@arm.com>
> @@ -26,6 +26,8 @@ properties:
> =20
>    compatible:
>      enum:
> +      - allwinner,sun252i-v861-pinctrl
> +      - allwinner,sun252i-v861-r-pinctrl
>        - allwinner,sun55i-a523-pinctrl
>        - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,sun60i-a733-pinctrl
> @@ -35,7 +37,7 @@ properties:
>      maxItems: 1
> =20
>    interrupts:
> -    minItems: 2
> +    minItems: 1
>      maxItems: 11
>      description:
>        One interrupt per external interrupt bank supported on the
> @@ -62,7 +64,7 @@ properties:
>        Debouncing periods in microseconds, one period per interrupt
>        bank found in the controller
>      $ref: /schemas/types.yaml#/definitions/uint32-array
> -    minItems: 2
> +    minItems: 1

You've lowered the constraints here, and while this is harmless that is
not apparent from the diff so please note it in your commit message.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: changes-requested

>      maxItems: 11
> =20
>  patternProperties:
> @@ -149,6 +151,29 @@ allOf:
>            minItems: 2
>            maxItems: 2
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          const: allwinner,sun252i-v861-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 7
> +          maxItems: 7
> +        input-debounce:
> +          maxItems: 7
> +
> +  - if:
> +      properties:
> +        compatible:
> +          const: allwinner,sun252i-v861-r-pinctrl
> +    then:
> +      properties:
> +        interrupts:
> +          maxItems: 1
> +        input-debounce:
> +          maxItems: 1
> +
>  additionalProperties: false
> =20
>  examples:
>=20
> --=20
> 2.55.0
>=20
>=20

--iob+U2BkGYeh1b1b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtM5wAKCRB4tDGHoIJi
0oJfAP4ufaoW9ODoPhwL/60TwgcwPU7zYRBS09Lui2xZHPvT9wEA+DbyCtPMNtgu
WpkHu4Qik6IU6UhTe8QqVvGh8jwnUgc=
=GpLT
-----END PGP SIGNATURE-----

--iob+U2BkGYeh1b1b--


--===============4240779899078937719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4240779899078937719==--

