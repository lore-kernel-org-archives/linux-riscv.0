Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F58AC43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 13:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4YP7X/wzW8zmMb3+iA1qFKVyNYTAOYW+irlSYPkXosQ=; b=oxObkzdiua0qN1/4fRiPx5PXCR
	zUVsKSljHtG5Y29V/V7PVlU7x5e+hi/rXfNsOp5srJsyUR1byZVsTeYkTXUxjjogXWUKuV1nh2aog
	y31ActEWEXCPx7G6XtcJB9DynWpxRfM1tzdjK6CrwkbWgcZcqwFZQJohTv7nZpLm09QBtC9E8xnl2
	P2CEIpGGb9mf74XGWDPlCj5jGMCfxqHq12J1rXHYTkm1XHwxzU/vlAICx8IgaHs+QmEd2Dgs4jhsv
	2JHIesjHmxZpQURKEhvTZLxCV3IoiaNKdvO64YnFQ9gFtcuL0BXkstXt0/bbigPrk4F6ZEGebn4rW
	+99p0bHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2Bja-007mw8-Gb; Fri, 17 Jun 2022 13:09:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2BjW-007muA-4l
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 13:09:57 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1o2BjH-0000yZ-Do; Fri, 17 Jun 2022 15:09:39 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o2BjE-0014JM-Uv; Fri, 17 Jun 2022 15:09:38 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1o2BjF-00Gy7Y-Gd; Fri, 17 Jun 2022 15:09:37 +0200
Date: Fri, 17 Jun 2022 15:09:31 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: thierry.reding@gmail.com, lee.jones@linaro.org,
	Daire.McNamara@microchip.com, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/2] Add support for Microchip's pwm fpga core
Message-ID: <20220617130931.3rdaj4p3d54p4ynz@pengutronix.de>
References: <20220617114442.998357-1-conor.dooley@microchip.com>
 <a2d97203-dd8a-69ea-fdb5-b25f3937163f@microchip.com>
MIME-Version: 1.0
In-Reply-To: <a2d97203-dd8a-69ea-fdb5-b25f3937163f@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_060954_242382_319F91BC 
X-CRM114-Status: GOOD (  21.87  )
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
Content-Type: multipart/mixed; boundary="===============8667126254292304237=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8667126254292304237==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="edflhgjjggubtngp"
Content-Disposition: inline


--edflhgjjggubtngp
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Fri, Jun 17, 2022 at 11:50:13AM +0000, Conor.Dooley@microchip.com wrote:
> On 17/06/2022 12:44, Conor Dooley wrote:
> > Hey Uwe,
> > Got a ~v2~ v3 for you...
> > I added some comments explaining the calculations and a documentation l=
ink
> > so hopefully things are a bit easier to follow.
> >=20
> > Code wise, I went through and sorted out a bunch of issues that cycling
> > through the different periods/duties threw up. Along the way I found
> > some other problems - especially with the longer periods which I have
> > fixed. I also added a write to the sync register in the apply function,
> > which will resolve to a NOP for channels without "shadow registers".
> >=20
> > Other than that, I managed to ditch the mchp_core_pwm_registers struct
> > entirely but had to add a short delay before reading back the registers
> > in order to compute the duty.
> >=20
> > Thanks,
> > Conor.
>=20
> *sigh* yet again I forgot to mention the potential maintainers conflict
> with spi-next..

I'm not a maintainer of a very active subsystem where MAINTAINER
conflicts are normal, but my expectation up to now was that conflicts in
that file are quite usual and trivial to resolve such that mentioning
these isn't very important.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--edflhgjjggubtngp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmKsfPkACgkQwfwUeK3K
7AmwZAf/bWX4n/wcUGqi0wXz0cPwdC7eV7nl4j0QggrsM6in945yGO9U9QC4PJfp
Be5ow4QRp7JFiin3+CaOPTVtYXGT+/TJ4omWpoCG6kCBJh5blOBcsvjscpr830xL
D6a2MAqfS7d1Vf2v2eYPd/UYrdLP0h8kES5oaWZdvfuXaVwgEU9BqpyaS90UPjDk
2YF6HK3fYRTIT5dUGztObqyVmpU35PqmC4daPYBm0o5R2Rm1IANMsB4WxnkytgNf
h0dHtEV36dGKJjZUgRgnoGfWg7fbCaA5PXIbqGj0zSSLcfMm5FmwlTyFhIKaTLIW
0hlJAryHxNoEN0bJWE7RE05omF2Q0Q==
=KrS3
-----END PGP SIGNATURE-----

--edflhgjjggubtngp--


--===============8667126254292304237==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8667126254292304237==--

