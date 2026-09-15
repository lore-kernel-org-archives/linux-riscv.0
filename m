Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0A62C88E75
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Sep 2026 17:23:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I60ENqSXzApy2Dqkw+z9qE9shynQRgwIePFLnHTUFEk=; b=HhmM9RfsxC5BH0yKuP4YG59kCI
	FeeUxzA232XWkfCeGHThmSKUf1h503jd+TJuA+gSWO+b2hV28n/PBHa6aeWkUF8bqeoBsQQHoie7S
	xSFm8zpH/FQgcfDOsHHqyJ2uVfyysd0zdLvjkP2bv8cnEAcsZTqkgeWqBiNZwN3TMOjb2tL57kQa0
	vL5VnRZkgzDe1NzKamDeTZRpQBVdXIR3eR73oMDLd0wWqsFAbWQHinv0LMUY5fHXSmoWXH8W/sVSb
	Y/02JvdldbYnJNNfp6EigAfn50fmhfY6JJiVWLuWNVSWxtEcBoan2K7moJReEfoTdDG5utpuaGzkA
	4xal+21g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wsd-00000007Zo7-0ve0;
	Tue, 15 Sep 2026 17:23:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6Wsc-00000007Zno-0COT
	for linux-riscv@lists.infradead.org;
	Tue, 15 Sep 2026 17:23:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 37937600CB;
	Tue, 15 Sep 2026 17:23:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B17D1F000FF;
	Tue, 15 Sep 2026 17:23:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789493016;
	bh=O0F3EBbV6mf8kreRhQaVdo77prPO4C4vUbkal0XuR7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W+sbdMlEPGJglNEnvBPnrpHiBXoZA1O17nzC+ZauAem572eHajZPDXDEjsLb/sHCW
	 2zK8wpzuD4WLTUNpryW1Uz1IT+F0zUkEOVmsB/jpsLPTax2aQ4sDrpk/d7dk5gCq9P
	 OdhRhsoIbgn6iwXWHLQGxivuuWv07SNCGa3uyxzYEpjgCQ7p6pSVS6QWF5C1iOddqw
	 9j4GI4jf7GX9SFZix3NAn8iAFJRNrdQNy2/jKxSI/jliLmCM+Kf+eec/p27YKpOZCS
	 2uNsgC/jsB20qmZVJKjLa4WNGg0s2s9mWa6ChyLLKP6I71XYHVrWI/XruSvd1/QJEF
	 bqpi4DTiYiQ0A==
Date: Tue, 15 Sep 2026 18:23:31 +0100
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
Subject: Re: [PATCH 1/9] dt-bindings: vendor-prefixes: Add GlobalFoundries,
 Inc.
Message-ID: <20260915-engulf-backpedal-fef3a5fc2607@spud>
References: <20260914-p8700-dts-v1-0-3267f14ebce1@htecgroup.com>
 <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>
MIME-Version: 1.0
In-Reply-To: <20260914-p8700-dts-v1-1-3267f14ebce1@htecgroup.com>
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
Content-Type: multipart/mixed; boundary="===============3147585258400109946=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============3147585258400109946==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OIxQvOJuL0fdlQhU"
Content-Disposition: inline

--OIxQvOJuL0fdlQhU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 14, 2026 at 03:55:49PM +0200, Aleksa Paunovic via B4 Relay wrot=
e:
> From: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
>=20
> GlobalFoundries acquired MIPS. All MIPS RISC-V
> compatibles should be labeled with the 'gf' prefix in the future.
>=20
> Signed-off-by: Aleksa Paunovic <aleksa.paunovic@htecgroup.com>
> ---
>  Documentation/devicetree/bindings/vendor-prefixes.yaml | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Doc=
umentation/devicetree/bindings/vendor-prefixes.yaml
> index ba2002969373433b1f48118872c46cf7bcfff276..b699935f60b96b3cfbb9c6e8c=
e802fcbedc52c1b 100644
> --- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
> +++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
> @@ -668,6 +668,8 @@ patternProperties:
>      description: Genexis BV/AB
>    "^geniatech,.*":
>      description: Geniatech, Inc.
> +  "^gf,.*":
> +    description: GlobalFoundries, Inc.
>    "^giantec,.*":
>      description: Giantec Semiconductor, Inc.
>    "^giantplus,.*":
> @@ -1104,7 +1106,7 @@ patternProperties:
>    "^minix,.*":
>      description: MINIX Technology Ltd.
>    "^mips,.*":
> -    description: MIPS Technology (deprecated, use 'mti' or 'img')
> +    description: MIPS Technology (deprecated, use 'mti', 'img', or 'gf')

This is starting to look a bit hilarious.
Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

>      deprecated: true
>    "^miramems,.*":
>      description: MiraMEMS Sensing Technology Co., Ltd.
>=20
> --=20
> 2.43.0
>=20
>=20

--OIxQvOJuL0fdlQhU
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaql/EwAKCRB4tDGHoIJi
0uLiAP4w9YFBQwqsXenGORWEzWckxSlmzMH52DXC7nY0nMSu2AEA6cQ4ooT1FQ67
O0sRxFvEgJyM/f/0nBSK6BjjMiewLQY=
=nmOM
-----END PGP SIGNATURE-----

--OIxQvOJuL0fdlQhU--


--===============3147585258400109946==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3147585258400109946==--

