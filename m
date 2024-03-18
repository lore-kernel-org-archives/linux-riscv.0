Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 124E6C54E5D
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Mar 2024 18:17:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOIU2b5stdM/e3fslgxxnMb98vsaUzj9C55H3iYJ4EU=; b=k9jhZ6WrQ5qXX5hj6IgLmE55Sv
	qatijY6iYdmmE4oBSKTo0rrwH68RP0CCjLA2VZXS9rPfOAdVa32L5y8uewX4n9ybQb3Z1iUSTWAMc
	NTMbyb0uP0VLSY/NtMAn1CD2ZXkrnChVv/VXw4P/FsSbG+xE0B3IJirJTpPZ07SLj7AHbS3AuSIU6
	N6fvhj65JsO9Zjqr89Lo8+oK1RSZ+fRG2M8K15RBvObCh4NPvIdbKgeldzA81tJIKLA56/oZYu9zZ
	gqKEnoCpli8+iDX+n16oMSFkT1vwbis8D5WbvtADsw/HEpZksWshzhY2nG/kkV6b2tnDcOadgdR4Y
	wtRVzqaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHYD-00000009dQY-2tsp;
	Mon, 18 Mar 2024 18:17:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHY9-00000009dNJ-2dhW
	for linux-riscv@lists.infradead.org;
	Mon, 18 Mar 2024 18:17:31 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHY8-0000eM-7a; Mon, 18 Mar 2024 19:17:28 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHY7-0077xN-Pn; Mon, 18 Mar 2024 19:17:27 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rmHY7-00873f-2G;
	Mon, 18 Mar 2024 19:17:27 +0100
Date: Mon, 18 Mar 2024 19:17:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org, conor@kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com, paul.walmsley@sifive.com, 
	aou@eecs.berkeley.edu, thierry.reding@gmail.com, vincent.chen@sifive.com, 
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v9 3/3] pwm: sifive: Fix the error in the idempotent test
 within the pwm_apply_state_debug function
Message-ID: <jvwgsszvs4jtcytcphsdjulzgqfqzdp4sisu236ddwsqgmvriw@ngi4ljgh5b74>
References: <20240222081231.213406-1-nylon.chen@sifive.com>
 <20240222081231.213406-4-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240222081231.213406-4-nylon.chen@sifive.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_111729_809893_5D1F8911 
X-CRM114-Status: GOOD (  20.20  )
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
Content-Type: multipart/mixed; boundary="===============8098790662435289461=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8098790662435289461==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x44go5u7hgleqhj7"
Content-Disposition: inline


--x44go5u7hgleqhj7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Feb 22, 2024 at 04:12:31PM +0800, Nylon Chen wrote:
> Round the result to the nearest whole number. This ensures that
> real_period is always a reasonable integer that is not lower than the
> actual value.
>=20
> e.g.
> $ echo 110 > /sys/devices/platform/led-controller-1/leds/d12/brightness
> $ .apply is not idempotent (ena=3D1 pol=3D0 1739692/4032985) -> (ena=3D1 =
pol=3D0 1739630/4032985)
>=20
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  drivers/pwm/pwm-sifive.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> index a586cfe4191b..bebcbebacccd 100644
> --- a/drivers/pwm/pwm-sifive.c
> +++ b/drivers/pwm/pwm-sifive.c
> @@ -101,7 +101,7 @@ static void pwm_sifive_update_clock(struct pwm_sifive=
_ddata *ddata,
> =20
>  	/* As scale <=3D 15 the shift operation cannot overflow. */
>  	num =3D (unsigned long long)NSEC_PER_SEC << (PWM_SIFIVE_CMPWIDTH + scal=
e);
> -	ddata->real_period =3D div64_ul(num, rate);
> +	ddata->real_period =3D DIV_ROUND_UP_ULL(num, rate);
>  	dev_dbg(ddata->chip.dev,
>  		"New real_period =3D %u ns\n", ddata->real_period);
>  }

pwm_sifive_apply has a DIV64_U64_ROUND_CLOSEST(). I wonder if that needs
adaption, too?!

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--x44go5u7hgleqhj7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmX4hTYACgkQj4D7WH0S
/k6K9QgAlQOk5zs1qZjx50SM5kcMxMw+J3ccF0gM0gezDCINIsFANkmsKs+qY3m9
b6NUelYUChHyY1+/zWpqLNGByQmGMm3yMBO4yZ3/jn/QPG1CxgejF6t60XVthOtr
9YjvOnCh9SSM5XkoPajFJ/n7qlk7T/xRA9+MBjSpwcVOicRZGE4FtFJ+AiToc5Yc
uebQi/SfgQ9uTUmYgOZzUJo140Q3XnoGasCf+V9C3SUVOPCPunEmhBH8aq5H6wk7
D9fIOAVfxEK/YIHNIzv+KjrkJ6t/b5/yeYC3zQgMzvDZYW47aRhLNioG0hQcvdPO
2ED/sw3W2E6eBAm8IBCDIyN9LWdNRw==
=tmD5
-----END PGP SIGNATURE-----

--x44go5u7hgleqhj7--


--===============8098790662435289461==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8098790662435289461==--

