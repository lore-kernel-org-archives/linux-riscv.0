Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC9FC5B552
	for <linux-riscv@archiver.kernel.org>; Fri, 30 May 2025 08:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4blP2ZycZ2k7Xt7Nx7yk+ashhNLJe/If4LYUuWCJDi0=; b=YamSyScd0Qp6b8r5p0veJJP543
	7WlUt16/5iYrqp9JnaG2Gy0ELNFvTmogJPQIsQGNo5BWaVo5JnjGPPfWM58dl8YwKWgg79FT1h82D
	K5VKHNkcFBaZavFHbKraX0Naz4GCUJ5Bi2N4v5m4IreSjiZl9BJr3qQg5so5mSDGxOVRkUvzKoVCq
	lYX7oUI3jk2aVYMym4173TBV/GvRLo+mY6Lqp49LIF/3dBzRpZk2YwCKyUuPl0w2IZpiUpqtTlG3c
	DcVcRv6252vSPr+JlylTc4aEkNYAARbIrd7Ta9KCPngWvExBjIbf1Zh0bSNhcOH5CoCBXZ2AZMiXr
	V4AhExdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuuV-0000000HZwt-327u;
	Fri, 30 May 2025 08:16:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKuVZ-0000000HVjT-0Nas
	for linux-riscv@lists.infradead.org;
	Fri, 30 May 2025 07:50:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 665184A15F;
	Fri, 30 May 2025 07:50:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADBCBC4CEE9;
	Fri, 30 May 2025 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748591428;
	bh=R/xRZCH14sMPQAqiO3CcAxy1OeVARVf6uPlM2WeOh40=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XtVKjHMvVjeZipMH2I69ghfgUOEMm0PtMSWpQ1BlDghOBjTmu6w5V/KDYw4wKb8fA
	 eMm4pGiksMyCd+Bzxnkbv/TZRxD0NMPQWUDbH9V4ihh3EtbbPRtKJQiziMFSFL9vZO
	 JjMpX7ob2hTwv1htsjnoWhFd9G3GNEWxPpuku9BnCZXP7vZbcWSsdobvKMB4CeFkOy
	 pkZF8hOgXadFTwF1XFfdcS3oTFBXAQ1pjTpiKh+bIgSwj5Mw/tGf3HvEBqv99dm8Af
	 YpJcPU68lNkyt9dqmwhYSP9MVZkz+E5QrbLC0NK6AEftuFamYhZlydWTUyKxCbQdNb
	 V87xroUjne0dg==
Date: Fri, 30 May 2025 09:50:25 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Longbin Li <looong.bin@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto <inochiama@gmail.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-pwm@vger.kernel.org, 
	devicetree@vger.kernel.org, sophgo@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
Message-ID: <azf5lzfkegr6wt3mratxra2mlfah45dc3comtkjbrbdzf4x5xc@tlzxp7oqtcfl>
References: <20250528101139.28702-1-looong.bin@gmail.com>
 <20250528101139.28702-4-looong.bin@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20250528101139.28702-4-looong.bin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_005029_172559_7C3873F8 
X-CRM114-Status: GOOD (  17.63  )
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
Content-Type: multipart/mixed; boundary="===============7964164944594617731=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7964164944594617731==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ekb2tmeniacut2mz"
Content-Disposition: inline


--ekb2tmeniacut2mz
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v5 3/3] pwm: sophgo: add driver for SG2044
MIME-Version: 1.0

Hello,

On Wed, May 28, 2025 at 06:11:38PM +0800, Longbin Li wrote:
> Add PWM controller for SG2044 on base of SG2042.
>=20
> Signed-off-by: Longbin Li <looong.bin@gmail.com>
> Reviewed-by: Chen Wang <unicorn_wang@outlook.com>
> Tested-by: Chen Wang <unicorn_wang@outlook.com>

Nitpick: Make your S-o-b line the last line. This way you document that
it was you who added the tags for Chen Wang.

> [...]
> +static int pwm_sg2044_apply(struct pwm_chip *chip, struct pwm_device *pw=
m,
> +			    const struct pwm_state *state)
> +{
> +	struct sg2042_pwm_ddata *ddata =3D pwmchip_get_drvdata(chip);
> +
> +	pwm_sg2044_set_polarity(ddata, pwm, state);
> +
> +	pwm_sg2042_set_dutycycle(chip, pwm, state);
> +
> +	/*
> +	 * re-enable PWMSTART to refresh the register period
> +	 */
> +	 pwm_sg2044_set_outputen(ddata, pwm, false);

I'm astonished that checkpatch doesn't spot the wrong indention here.

> +
> +	if (!state->enabled)
> +		return 0;
> +
> +	pwm_sg2044_set_outputdir(ddata, pwm, true);
> +	pwm_sg2044_set_outputen(ddata, pwm, true);
> +
> +	return 0;
> +}
> +
>  static const struct sg2042_chip_data sg2042_chip_data =3D {
>  	.ops =3D {
>  		.apply =3D pwm_sg2042_apply,
> @@ -142,11 +215,22 @@ static const struct sg2042_chip_data sg2042_chip_da=
ta =3D {
>  	}
>  };
>=20
> +static const struct sg2042_chip_data sg2044_chip_data =3D {
> +	.ops =3D {
> +		.apply =3D pwm_sg2044_apply,
> +		.get_state =3D pwm_sg2042_get_state,
> +	}

Missing , after }.

If you're ok, I'll pick up this version and fixup the two code changes
and the order of the tags in the commit log.

Best regards
Uwe

--ekb2tmeniacut2mz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmg5Yz4ACgkQj4D7WH0S
/k6d8gf9EA6hIB2KVuUHwQKu4wMvhPhW35TEI1CVTR9L04YSgFP6CudQ407fy/Aa
IYUnsov4TI+hKOpz0/Tb05+czeAgWU6wBoi2OSBEAB3nszVZ2xQq1PcYd2l/xtHg
ifvgWm9LWghQRH4lwb9VvHyxowfKejMZpVTeysRB6B4mcTKOUt4VFLX6mktCdHFc
pUedFaagWDocC+OuToPxA1f9havIw9hu56PBVJUFmq3RZ9m02QBjRs2PkOTVcMJQ
ydtu4p+MtY+s7qYAsxBqEZlrM/CCrrRFeoBmRF22OhWOOzzNOIqcJZ19BC1uowum
YglxYBkxgm8pY8XGGJkIkAVa3rktDw==
=oO4S
-----END PGP SIGNATURE-----

--ekb2tmeniacut2mz--


--===============7964164944594617731==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7964164944594617731==--

