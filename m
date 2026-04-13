Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5CD0EBFD17
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ZKQ/h3QxMOuZIwBtSg0lfcoZzDbhiYmZs0BHHiEuhI=; b=URsB+I0fUdVhoLdb/h+VGrDJgW
	EFi+E8KuZGPu/D0/h5/rYA8RoZIwuyigdalkzKJ6iEiRm/LyfERHCJHfWI3nVIuLfDVteCD832hSm
	Kc3V+nFp9m4aqF1CG9Y59v/9n4uAheyjPskdr3mtszEYFsWjlNJsXz9J5VR5ZdkAQJQ1nyr32tP5D
	vMlKMcRidhE5DO+BU3HcJkLK82SCGyyZhHzlsxvvoWilMl2XOPiVIaaA6XfYxFuXbnOrmVC8FLr2w
	pRblgIfXY62+NlIrXOs0GZuSSCmHay+diOtt44eiNyWX9B3eXGbBpVD0DThCO+hOdfTSfVfifF5Hj
	U7LPonig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoI-0000000FHlU-3o6J;
	Mon, 13 Apr 2026 08:38:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCoH-0000000FHkI-1RnF
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:38:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CB7B643AAD;
	Mon, 13 Apr 2026 08:38:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33D0EC116C6;
	Mon, 13 Apr 2026 08:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776069499;
	bh=hQC+dWReMp0AEvFExU9znjcR15PjYZSh4RYLGIYnIT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XYmPI9j44m063hu9ojAHSM/uXN31tgSlskZ69wTFDkbrEwjYWOArAXuc6DVj1A2GI
	 eSp5DXm8GGpsNEFvYi6G6m0/kstL271ISUk3owDGB7ZQAAp9lQGzhN/e4qhpkqDant
	 6thMApG5MHf/MsrUG9tp7UisfLUl7QCj0KV+R6cb7bZhAP2Z+zUG/2yNQDtwXtLN/3
	 o5bheZjmDL55JXtbCX17VkUx12GojOI5UigX6Dgi5OkaV5efLNpaabs2SMmpPumJEK
	 ZUYvlpG48AppzoBtRj7S2SnbjUj7emwCwLykrKEF4lOfDKwIN5ORV9x0ZpTh04QX1v
	 vTTjv+vu63PzA==
Date: Mon, 13 Apr 2026 10:38:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Duje =?utf-8?Q?Mihanovi=C4=87?= <duje@dujemihanovic.xyz>, linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] pwm: pxa: Add optional bus clock
Message-ID: <adyq-Uckwwe9uACA@monoceros>
References: <20260409-03-k3-pwm-drv-v1-0-1307a06fba38@kernel.org>
 <20260409-03-k3-pwm-drv-v1-2-1307a06fba38@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20260409-03-k3-pwm-drv-v1-2-1307a06fba38@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_013821_432523_1F6CA2A2 
X-CRM114-Status: GOOD (  19.51  )
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
Content-Type: multipart/mixed; boundary="===============0936450611224752210=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0936450611224752210==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="763z7lvugsdeouil"
Content-Disposition: inline


--763z7lvugsdeouil
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] pwm: pxa: Add optional bus clock
MIME-Version: 1.0

Hello,

On Thu, Apr 09, 2026 at 12:45:12AM +0000, Yixun Lan wrote:
> Add one secondary optional bus clock for the PWM PXA driver, also keep it
> compatible with old single clock.
>=20
> The SpacemiT K3 SoC require one bus clock for PWM controller, acquire

s/one/a/ ?

> and enable it during probe phase.
>=20
> Signed-off-by: Yixun Lan <dlan@kernel.org>
> ---
>  drivers/pwm/pwm-pxa.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-pxa.c b/drivers/pwm/pwm-pxa.c
> index 0f5bdb0e395e..2ace31405c2d 100644
> --- a/drivers/pwm/pwm-pxa.c
> +++ b/drivers/pwm/pwm-pxa.c
> @@ -53,6 +53,7 @@ struct pxa_pwm_chip {
>  	struct device	*dev;
> =20
>  	struct clk	*clk;
> +	struct clk	*bus_clk;
>  	void __iomem	*mmio_base;
>  };
> =20
> @@ -177,7 +178,12 @@ static int pwm_probe(struct platform_device *pdev)
>  		return PTR_ERR(chip);
>  	pc =3D to_pxa_pwm_chip(chip);
> =20
> -	pc->clk =3D devm_clk_get(dev, NULL);
> +	pc->bus_clk =3D devm_clk_get_optional_enabled(dev, "bus");
> +	if (IS_ERR(pc->bus_clk))
> +		return dev_err_probe(dev, PTR_ERR(pc->bus_clk), "Failed to get bus clo=
ck\n");
> +
> +	/* Get named func clk if bus clock is valid */
> +	pc->clk =3D devm_clk_get(dev, pc->bus_clk ? "func" : NULL);

A local variable for bus_clk would be sufficient.

I'm not sure, but I think passing "func" unconditionally to
devm_clk_get() would also work fine.

Best regards
Uwe

--763z7lvugsdeouil
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmncq3UACgkQj4D7WH0S
/k7W3QgAoubMFAiRzq6hszjmm/xb9Gcgmkb//pXKEp2aWMTJOS8NxIwApQLcWVSK
TER943wXO4h2gddLqDhxGqoClG/XTO5sQoTDI1E1iEgtqEhH+ubHu+wcTXTH7/VJ
ukekULO5bPkCh5Ncgr6yIsL/YwSyBtAYm4PkxW5n+rKR7YHtmCX1T43b8GG4bkux
u64sL5qYxGV98Mes56lCOu9v7k9fDKuGCrzIr9AL0zU20AVmF2kxVu/vmCJcl2Rt
Yk7B8O0pYbZmRuGjn1YyulXnvBwo0GTWC6SHzoDC6fZVOMSBuQJJGz4CdpQGkXeE
huqDvYA/yh/qxaNx8deyGc8oe1RB9Q==
=xEV+
-----END PGP SIGNATURE-----

--763z7lvugsdeouil--


--===============0936450611224752210==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0936450611224752210==--

