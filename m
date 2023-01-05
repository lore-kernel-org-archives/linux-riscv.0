Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 360C5C3DA7A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jan 2023 20:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MotHeiXe88f+Un/xjKXZ6LMSYeTXTVKlDxFJZyQ00LI=; b=Twf1FBTzPyBsml7CA2UGHm0HlZ
	fG5a2R6H90hxvh6+cOivH74wZHYUMxiA5SiYbLEF4aROT/MC25chA5LppMIGjuZz6ddMZZZGpQ9n/
	Ul3SvfeMcgO6UyzFImLnATnl5e4NFRtUAlcZp9G6/vFMiTvYj7SHNDxSqJTbx0mRshkOwCz5nLfk+
	CQbIuxn4kraQ5Eogr1nNOXCnZcx1I6bEmr+7L/MDcycjqtWM/mwO1yyv9gat2y4w09nOEFlPUdnFQ
	ACYzN8KCkShiBDODxm6Iu3SGOu11DC2NpbnhDQADOegdGTEv/L0EDsDOOToIRBWi291fkUgbJXd71
	/TKaVX/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDWU3-00EMWt-RK; Thu, 05 Jan 2023 20:05:03 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pDN0V-00A511-LG; Thu, 05 Jan 2023 09:57:57 +0000
Received: (Authenticated sender: paul.kocialkowski@bootlin.com)
	by mail.gandi.net (Postfix) with ESMTPSA id 28043240006;
	Thu,  5 Jan 2023 09:57:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1672912664;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Fvlr13b/Y1zYrl0g6v6iiZSrz3z4wdfH46B86FopFgY=;
	b=bGFNyQgMOLa121tXbFw3UGtXKhyimGOJTGqPtIn0Zpza2B9v6CVZOisJhs8fU8PtN97H1T
	EIONvHQRx0RhFpaZDcb6AM0N8vJASsRY56gCTPuit6GdyRUOhHsVRg02icK01TiDovfS/U
	osrUkvFffeNLYng5Qw68nej0PExTc1rTeK90WbUQkq79joH0Riu90L/iFHx/aSrDmYEgsx
	cDfkQOLik+dGzV0DsgrrWRmV//5X94+WvFJ1TFXG+PNAA2v3i0FnxtkCBxnPFs9pyt/+ty
	faZl0Dsnd7Xxq6ZvnuRmzMAhbFkjclPT5BT27vM1rjKWYwGIcY6wpELw9ejRHw==
Date: Thu, 5 Jan 2023 10:57:27 +0100
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
Subject: Re: [PATCH 2/4] media: dt-bindings: cedrus: Make allwinner,sram
 optional
Message-ID: <Y7afB98vPc56bDhm@aptenodytes>
References: <20221231164628.19688-1-samuel@sholland.org>
 <20221231164628.19688-3-samuel@sholland.org>
MIME-Version: 1.0
In-Reply-To: <20221231164628.19688-3-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230105_015755_995553_E33CA2D3 
X-CRM114-Status: GOOD (  18.42  )
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
Content-Type: multipart/mixed; boundary="===============2218966926497052001=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2218966926497052001==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jljho90DVYkk8si4"
Content-Disposition: inline


--jljho90DVYkk8si4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Samuel,

On Sat 31 Dec 22, 10:46, Samuel Holland wrote:
> Allwinner SoCs can remap some bits of peripheral SRAM to a contiguous
> range of addresses for use by early boot software. Usually the video
> engine's SRAM is used for this purpose, so its mapping must be switched
> back before the hardware can be used.
>=20
> However, the D1 and related SoCs use the DSP SRAM for this purpose. As a
> result, the video engine SRAM is not switchable, and there is no need
> for an allwinner,sram reference in the devicetree.
>=20
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>

Cheers,

Paul

> ---
>=20
>  .../bindings/media/allwinner,sun4i-a10-video-engine.yaml         | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-=
video-engine.yaml b/Documentation/devicetree/bindings/media/allwinner,sun4i=
-a10-video-engine.yaml
> index d5be7f604e8c..74363b242fff 100644
> --- a/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> +++ b/Documentation/devicetree/bindings/media/allwinner,sun4i-a10-video-e=
ngine.yaml
> @@ -73,7 +73,6 @@ required:
>    - clocks
>    - clock-names
>    - resets
> -  - allwinner,sram
> =20
>  additionalProperties: false
> =20
> --=20
> 2.37.4
>=20

--=20
Paul Kocialkowski, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

--jljho90DVYkk8si4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEEJZpWjZeIetVBefti3cLmz3+fv9EFAmO2nwcACgkQ3cLmz3+f
v9Ggugf9HSS2KhNLgkevts5teZksFM4RMyoOoDlpVlPoHJ9dDgeTfdMcoN7vPA9r
YRKtDEyWUVX96YV/RmzVDWGazmbd46/khL5p8HhGHUjphTNVKm6/Ou5V91xBzgmN
lDL7m8hE2LE/LPIa6EOiIAdOwmI0UVcvp2ltKhZibVKZ3gDtovUQmEftYuQmNAF6
Z+iMSZEu2b0N+p1llPTxPwjHjruZknkYhRy3GEZcQEFTPUMIb5u39WjqA8TY1C7o
54aAxAgd0v/T/iELJYHlal4LodbLczu4/OJdHIj1bludFs/cZQwHV+51prwnTlCD
dHwTRJ6b3eLdlvq+km+n8zehF1FLTw==
=4H5j
-----END PGP SIGNATURE-----

--jljho90DVYkk8si4--


--===============2218966926497052001==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2218966926497052001==--

