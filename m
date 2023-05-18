Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69DFFC77B7A
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:15:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BOri/60aa9cBR9e4MYw/nnpJLjdjNyAGAXsTdK9Jfvs=; b=SUbOF0Vme/rA4e65tBS9Cw/6wW
	PH4xuWurxfOCd5G0ZqbKfVX0gJYSVT6FIkvZM4HUcZnKZd16LlZ6zpPtiFpCqG+7qTgpI6UCiQRR2
	mkE8kGynH39J6cXVR1+6iRoHdXROY8m/SMVuVlG85rw1wg8VakmJIBdnMlk0dmd1/oTzzk7kKop3r
	8DHSDlRtNajww1hjD39sQSpPWKTbjyXuzGw1PvNYbzG/h2x4mV50u6LZtr8Uh7ju3NSaOBSc4w6iP
	u6aARdR76BInPD+smTEsKBO5d+D9T9TAdlXwjFQ+VGSNG2cpYzeevgMksHLbzJdAUoJAakkg1+ivv
	E9MMCp7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfLg-00DHpi-0C;
	Thu, 18 May 2023 15:15:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfLe-00DHoy-0h
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:15:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfLK-0007MS-P5; Thu, 18 May 2023 17:15:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfLK-00172X-2o; Thu, 18 May 2023 17:15:02 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pzfLJ-005gn6-BF; Thu, 18 May 2023 17:15:01 +0200
Date: Thu, 18 May 2023 17:15:01 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v18 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <20230518151501.axcvsv6ll4tfab6e@pengutronix.de>
References: <20230518-reactive-nursing-23b7fe093048@wendy>
 <20230518-headrest-puppet-d6cf2e11e340@wendy>
MIME-Version: 1.0
In-Reply-To: <20230518-headrest-puppet-d6cf2e11e340@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_081522_257735_52E9D7DE 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: multipart/mixed; boundary="===============7811372004950868958=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7811372004950868958==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tcwogrdt3dklavo2"
Content-Disposition: inline


--tcwogrdt3dklavo2
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Thu, May 18, 2023 at 01:29:21PM +0100, Conor Dooley wrote:
> Add the newly introduced pwm driver to the existing PolarFire SoC entry.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tcwogrdt3dklavo2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmRmQPQACgkQj4D7WH0S
/k5AlAgAjlaA+EtbFPPHn/tWfErr2QMPiIRDBQXamI2qTWzBt3YeJC2X2h+czojY
QEJhdmbo+HL5E5/ybhvNUC9Gj9X6i0/8Qj5/UxFVugAoOTv5B+oQLMoytnsYBilF
YfLm+4y3/UyyoiHpJd/MJRudBePC3i4UTT7FXzc4Qoy+NArdbFazOpWyUJHOOtFi
C4utb2rWPHGXiqj/3YCSJqDCAPpiZu+W3fZ92NnpIJ+o8HkXtiL9+madBsH/fknY
TIZrict64V7S1zyT4nAKJLYLuS5LuGZXC9M5XfIzbwn6E74u3MDV6uNYAMjav2+V
rDPwy/8fIJH0Sk1cfmoXh6cpoNJ81Q==
=4UxA
-----END PGP SIGNATURE-----

--tcwogrdt3dklavo2--


--===============7811372004950868958==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7811372004950868958==--

