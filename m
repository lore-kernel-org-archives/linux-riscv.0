Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E45C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LL8nSqkY4gpghkG28lXuyxYvomHGW0sAZnu0UJT7+JU=; b=LlH/aRwLo2jImdmQXFrKYd+NEz
	tP+R17w42SWObC9H20mJzIAyeKVyjhqbqXUy3cAkFNoi8p2bPLjjTelHXtL8xHCGzRk3/bwS9v6dr
	qVu1d9d+aWS1Wg9cOL3Ywri9xzfIA2azuRCMOio1ThOMGbkI/AvoC+0UVfwlY+GYAxHvUkkyQk1t7
	3TsT+f7IGncDtOtGAHV8hhGmTHG7qeoqUEHyr7B0Rm5e0oVN75cfCLc/F8j3MgbOp8N+sOSbMmsvY
	LSVdcVRMbRMGuDkHhYCy+icaZd9ppHgumpzROKHSN/4tB5IhTjWdoeDQ9vlvgDZRPcIy3RlbXx0OX
	V+YXOMiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWkg-00EUoS-BS; Thu, 05 Jan 2023 20:22:14 +0000
Received: from relay11.mail.gandi.net ([2001:4b98:dc4:8::231])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDNiv-00AyDP-NQ; Thu, 05 Jan 2023 10:43:55 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 83AEE100006;
	Thu,  5 Jan 2023 10:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672915424;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+Yr/nUbSQezXweJY6bNFYpcWO7a/X5IplQE9MKPs4FA=;
	b=VV0/JX2BvGgdlR6xh7CnwhWQPLPXUZS7ei0be0XNMWNdFOAVpZSHgxJhNhoQ/IPYSjnxx3
	PyUMV6Vpx1pV3K0VmNuHxaLFxL164X7pyeKKH8BC3JETfM47AywMB3nzzpcDu8yEpq4rUu
	Q7jPb/MhV98WU4WoV7HpYjin0iel2BcZwhRutDK/e4mv5VVIWysy5RIXNLELSheoQBgrUa
	PU7oL2J3HmADqcWdjJvN/MKrd2Bsmfy0/+HLA7mbbaJ8P0okGGNFYyLZ96uK2RT5xkaYjG
	xsb4qYQ4WqN6uibTtsbQ42bTu6y+6FCGW4xckOZpqeMnfIonag3EeY0OioS0Tg==
Date: Thu, 5 Jan 2023 11:43:37 +0100
From: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Maxime Ripard <mripard@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-staging@lists.linux.dev,
	linux-sunxi@lists.linux.dev
Subject: Re: [PATCH 1/4] media: dt-bindings: cedrus: Allow power domain
 references
Message-ID: <Y7ap2dZdCHLNzzHb@aptenodytes>
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-2-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20221231164628.19688-2-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_024354_223969_67BD351B 
X-CRM114-Status: GOOD (  19.63  )
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
Content-Type: multipart/mixed; boundary="===============1474248674188917814=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1474248674188917814==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="nKy3H2Xqe6ArZJHS"
Content-Disposition: inline


--nKy3H2Xqe6ArZJHS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
> The Allwinner D1 SoC contains a separate power domain for its video
> engine, controlled via the "PPU" power controller. Allow the
> power-domains property so this can be represented in the devicetree.

I've been looking around for information regarding the PPU and couldn't find
anything about it. Do you have some reference where it is mentionned?

I do see a power domain driver (apparently for the GPU) on recent allwinner
kernel releases but that seems to be for arm64 chips only.

Cheers,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
>=20
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml       | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
-a10-video-engine.yaml
> index 541325f900a1..d5be7f604e8c 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -63,6 +63,9 @@ properties:
>        CMA pool to use for buffers allocation instead of the default
>        CMA pool.
> =20
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - reg
> --=20
> 2.37.4
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--nKy3H2Xqe6ArZJHS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO2qdkACgkQ3cLmz3+f
v9FJkQgAodwHy0mR+AhNUcLpqjFBfhELdfQ6y6YJnDwkiGJJZDkXxAX7rpsAFGYu
6CAoynkF3ve1u9SlMGMQtM4WNpCEX2sPMeAW1ljuTAdeNWIaalSMQS71fDEATuaZ
MqxyQiO02r/9lqcWDGa9C3gkk3cQbIvfC/zK1tu3Gs2WUYOCFPerJUsmBKoucGdE
Z+NHigkZJmHRQ7XDkhMzmcSoiSvDbKS7/pOC9O8A7icca6kdWudk/diC9MYkUYLD
70Os3PUqUYB7e9llTG+sxpv5CQpSLe7uGvUx6e7cqNR59GZk8Tcy8gqcwitRxQkJ
3bbS8sFAgj+6MhX/J02sf6SCFfnkmQ==
=L1ge
-----END PGP SIGNATURE-----

--nKy3H2Xqe6ArZJHS--


--===============1474248674188917814==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1474248674188917814==--

