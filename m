Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65EA2C79F9E
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Sep 2026 12:42:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8KoLZ9MUxbqfTvWXIpJDy9yhuY0ZQXotbtQ5wEn7hQc=; b=bO9PCfBSjynTaeWUKNR07keqST
	ac9P77NfZcAII5GIjwIYEpYuFcjhybmMnP/+8FBw6qVat/i17ZEO+/Bb4JGBYmnop3BupKDh09ZCl
	1QQaP4xwLllOCGUM2ocQk7HFszWgcdCkyhHM5NcJ5pVKFTQZbmJyQVBvgz+jl95LM6sAHJLlw9PxQ
	AThCxYoAHghPOCfSM6k5FogtNI8hSBldmFFwfd3y3xJMFYosPToRvlVoXnm1Ru1LZUoi+ROTufJdf
	KfQbpwKnL++qLAcYyatrfo7dtcOLd5gqhoWpt6g4R0RlEp10wcZbzFgzkX1k10AWC0R0NWI7GmfXv
	Tgt+ci/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3v9Z-000000092xI-2lyu;
	Tue, 08 Sep 2026 12:42:21 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3v9X-000000092xB-35JD
	for linux-riscv@lists.infradead.org;
	Tue, 08 Sep 2026 12:42:19 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10429601DB;
	Tue,  8 Sep 2026 12:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 494551F00A3A;
	Tue,  8 Sep 2026 12:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788871338;
	bh=Y6jk5OyEcqFWJOvwO61dpd5Psuv55kAUeibaILfDhBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=QIHh1z2hHalV4r6vxxSmDOnm7gCcgpuCxZ3dHTtdGDsIuCCICO8a/8o4C1mR/Mffi
	 asNh7uYzRNGnVdtkYAp4h+sLNq3LWzFinaEnNpvxBEsr2mwBfi6WLAX6aoCju/uPme
	 HdqvboRN+pgrvpN1DPt+TPS2UdES5zqfzNTrr7MYswp8Bt8BQmwoGlCkW05PNpEwWk
	 PbFqtA1lNSG4CvCPVf4b0yol5nGUjobO8FvQp/xSgia/BEkZFlNEnb7Mfs559vW8YF
	 CQWhVJ4+BJAYcDMhh1bMb9onHhkYqJ7iyJQaepIagshhVG7Q6oIzq+Vk5iUNRLpJOm
	 NWHI7sdZ+rbWA==
Date: Tue, 8 Sep 2026 13:42:15 +0100
From: Conor Dooley <conor@kernel.org>
To: Manush Prajwal <manushprajwal555@gmail.com>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	alexandre.belloni@bootlin.com, linux-rtc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: mpfs: fix unchecked devm_clk_get() error pointer in
 probe()
Message-ID: <20260908-karaoke-chrome-e1746c314d83@spud>
References: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
MIME-Version: 1.0
In-Reply-To: <6a9d4b02.7d74b517.206c4c.75f8@mx.google.com>
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
Content-Type: multipart/mixed; boundary="===============8257883102158495143=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============8257883102158495143==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DyNf6KzfTVv227Ts"
Content-Disposition: inline

--DyNf6KzfTVv227Ts
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Sep 06, 2026 at 04:44:09PM +0530, Manush Prajwal wrote:
> devm_clk_get(&pdev->dev, "rtcref")'s return value was passed straight
> into clk_get_rate() without checking it for an error first, unlike the
> "rtc" clock a few lines above which is correctly checked with
> IS_ERR(). clk_get_rate() only guards against a NULL clk, not an error
> pointer:
>=20
> 	if (!clk)
> 		return 0;
> 	...
> 	rate =3D clk_core_get_rate_recalc(clk->core);
>=20
> so if devm_clk_get() ever returns an error pointer here (for example
> ERR_PTR(-EPROBE_DEFER), which is the normal, expected outcome if the
> clkcfg clock-provider this RTC depends on has not registered its
> clocks yet by the time this driver probes), clk_get_rate() dereferences
> that error pointer instead of returning 0, crashing instead of letting
> probe defer.
>=20
> Capture the clock in the existing 'clk' local and check it with
> IS_ERR() before calling clk_get_rate(), matching the handling already
> used for the "rtc" clock in this same function.
>=20
> Signed-off-by: Manush Prajwal <manushprajwal555@gmail.com>

Fixes: 0b31d703598d ("rtc: Add driver for Microchip PolarFire SoC")
CC: stable@vger.kernel.org
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> ---
>  drivers/rtc/rtc-mpfs.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/rtc/rtc-mpfs.c b/drivers/rtc/rtc-mpfs.c
> index ece6de4a6..60596b0ea 100644
> --- a/drivers/rtc/rtc-mpfs.c
> +++ b/drivers/rtc/rtc-mpfs.c
> @@ -256,8 +256,12 @@ static int mpfs_rtc_probe(struct platform_device *pd=
ev)
>  		return ret;
>  	}
> =20
> +	clk =3D devm_clk_get(&pdev->dev, "rtcref");
> +	if (IS_ERR(clk))
> +		return PTR_ERR(clk);
> +
>  	/* prescaler hardware adds 1 to reg value */
> -	prescaler =3D clk_get_rate(devm_clk_get(&pdev->dev, "rtcref")) - 1;
> +	prescaler =3D clk_get_rate(clk) - 1;
>  	if (prescaler > MAX_PRESCALER_COUNT) {
>  		dev_dbg(&pdev->dev, "invalid prescaler %lu\n", prescaler);
>  		return -EINVAL;
> --=20
> 2.46.2.windows.1
>=20
>=20

--DyNf6KzfTVv227Ts
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaqACowAKCRB4tDGHoIJi
0uBvAQD7XBtH+8ICDp5mTLM2S+LcsHxvXWu9InFUV/5E2ZWWFwEAyXAL081i2Az8
7c4LJDO4iy8sf9eNk/stTxBIE4O64QU=
=hrpV
-----END PGP SIGNATURE-----

--DyNf6KzfTVv227Ts--


--===============8257883102158495143==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8257883102158495143==--

