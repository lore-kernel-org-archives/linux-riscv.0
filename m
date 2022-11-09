Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46274C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Nov 2022 09:36:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qg6WnGP+kk2g61vSKzF9lJYyXXhrqC7ViCTGU5UVEQ0=; b=vZJiFPh3mM+oL3jk0bEwfXtWF8
	Z2h/CvLSB4CNS+2haWZzIq7u/u0+d9iVVmCtra/wkN3sZQ78MPrCOwzRTK0UrjkzLu52gBKU3oFtK
	Fj5mxFWIPwwW8WwXZ7ZSjhTQJJh+b8VRj4Z/AA9wYelgcVW/pXFT0U1oY3VeLFOqjVWjY2IDVeMox
	2dFUbanqsc/ig3mmyHFes5+cR0bk+eXoQuzJ3THacXWVvVsJ4m8Pryg0eXxsvtUMGdxEsMPjzRk/p
	rqZEzQyRazxNN+tkaHkXm2s0CeHRk3EY5tFCN8MHySbq5N8MlLp1aHuKFERQMa553Kye1jp1ooJhu
	RaWkhR0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshUr-00CMf0-AM; Wed, 09 Nov 2022 09:35:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oshUo-00CMdd-Mo
	for linux-riscv@lists.infradead.org; Wed, 09 Nov 2022 09:35:48 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oshUV-0006Z1-Ox; Wed, 09 Nov 2022 10:35:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oshUT-003DxS-Ue; Wed, 09 Nov 2022 10:35:26 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oshUU-00FOAE-0O; Wed, 09 Nov 2022 10:35:26 +0100
Date: Wed, 9 Nov 2022 10:35:25 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v11 4/4] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <20221109093525.kx4tyvha7y3sikxw@pengutronix.de>
References: <20221007113512.91501-1-conor.dooley@microchip.com>
 <20221007113512.91501-5-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20221007113512.91501-5-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_013546_757907_B850D91C 
X-CRM114-Status: GOOD (  14.00  )
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
Content-Type: multipart/mixed; boundary="===============2637943935331262381=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2637943935331262381==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j2hqheguodcnpfxl"
Content-Disposition: inline


--j2hqheguodcnpfxl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 07, 2022 at 12:35:13PM +0100, Conor Dooley wrote:
> Add the newly introduced pwm driver to the existing PolarFire SoC entry.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

I assume you will rework the series and resend this one with the driver
patche. Applying patch #4 alone doesn't make sense, so I'm marking this
one as "changes requested", too, in the PWM patchwork instance.

IMHO patches #1 and #2 make sense to be applied already without the
driver given the binding is already there. I assume they will go in via
the riscv tree, so I will mark these two as "handled elsewhere".

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--j2hqheguodcnpfxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmNrdFoACgkQwfwUeK3K
7AnGmQf+K1H9/LKM8GH76W5yD7l8pEgea9lXFSIw38y1pSWhAJemyAAnDrJ/HBSk
8nfOg4/te1A53/p/hQE8h3aWO/dss2KZ5vf34eWW1HxqOkY2f3omiIP9lbga4f0X
D5RcmILzHg7zuaHnKJvxc9UlmYvvR30Ch2LzCKRFelU2TM1mZzy9TZWQzhT6muJD
B2CYuSYctcl0RGpG4vMHXlMoUFXEisnzuNNxRJU8laqbd3j8LGrppoddfBvq1SVU
8A063KezW1wvPpyCx+fRWKhubEvWtwAYSDOcaKtZI4hcHSEi+MAubfEr72PVLh9p
Y/O5HARWBMrgha+PVS42IvYC0RwGRw==
=l2SM
-----END PGP SIGNATURE-----

--j2hqheguodcnpfxl--


--===============2637943935331262381==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2637943935331262381==--

