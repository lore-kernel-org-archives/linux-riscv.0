Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15FDAC6FD18
	for <linux-riscv@archiver.kernel.org>; Tue, 18 Apr 2023 15:18:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/tFwNVNdBXHhzCPmQRoUa2U2TZTzYN7nnQfS2qJFowY=; b=mcwAMHhqTvy2F8lRTNA2gaT+Jc
	a/rVvXSsDhuGuvRsNiHHbJWCsmu9J3x0IQ7F/9rMuTy+CRqFpO3fAwusmaU9Wsz4M5VkJJ+rguCWR
	HHjHrk78APg0GSddTAwWproSD5EN8nXubr7tQP3CNRL4Bj8MsNdZZOHEH3kxXJ6p+agCgJKTgMwXh
	R+7e60au12nOjEiFE7tiCvY3WDWbR7jVlk7oRA/92XeJpFxcfu4NlSaqyTIHHio4RsNQIea59a8W9
	yR24zNvBq2I4ZFbdChMkew+8uDaG0zaSVTnj4Ah9cA9wRgwSLq3LndSrx6lQEG1qEvRekilEERRxe
	ZaQ67nhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pon6K-002YKa-11;
	Tue, 18 Apr 2023 15:18:36 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pon6G-002YJO-2E
	for linux-riscv@lists.infradead.org;
	Tue, 18 Apr 2023 15:18:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pon61-0006Ax-VV; Tue, 18 Apr 2023 17:18:18 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pon5z-00C8YW-SZ; Tue, 18 Apr 2023 17:18:15 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pon5y-00EGkp-PW; Tue, 18 Apr 2023 17:18:14 +0200
Date: Tue, 18 Apr 2023 17:18:14 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v16 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230418151814.xawtejnsoguelrwq@pengutronix.de>
References: <20230411-wizard-cautious-3c048db6b4d2@wendy>
 <20230411-bronzing-crust-d302408a1259@wendy>
 <20230411105547.ypkktubgfx4jfen3@pengutronix.de>
 <20230411-ligament-wagon-6c8cacb966e8@wendy>
 <20230411162554.4tl2z2tcbfg5hb7e@pengutronix.de>
 <20230418-armhole-cartwheel-cee37778a840@wendy>
 <20230418130837.zfueixeuxrallhtc@pengutronix.de>
 <20230418-octagon-epilepsy-4d8516f91145@wendy>
MIME-Version: 1.0
In-Reply-To: <20230418-octagon-epilepsy-4d8516f91145@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230418_081832_729583_55F70E82 
X-CRM114-Status: GOOD (  22.03  )
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
Content-Type: multipart/mixed; boundary="===============6410143709055410724=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6410143709055410724==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eqzeemqexvwxupmj"
Content-Disposition: inline


--eqzeemqexvwxupmj
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Tue, Apr 18, 2023 at 02:27:09PM +0100, Conor Dooley wrote:
> On Tue, Apr 18, 2023 at 03:08:37PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Tue, Apr 18, 2023 at 12:27:33PM +0100, Conor Dooley wrote:
> > > I'm quite obviously missing something that you may think is obvious
> > > here, but is not immediately clear to me.
> >=20
> > That would be an explanation, yes. :-)
>=20
> Right, it makes a lot more sense now. Definitely was not clear to me
> that that was what you were suggesting.

I reread what I wrote and maybe I wouldn't have understood it either :-)

> I'm not sure that disallowing tmp < 255 is something I want to do
> though, as this is mainly used as a "soft" IP core in the FPGA fabric,
> the clock provided to it may not be particularly high.
> Probably not the end of the world though, once added to the limitations.
>=20
> The implemented period is also going to be quite a ways off with this
> method (compared to the method I have been using until now) - although
> it is of course far simpler.

"simpler" is in my eyes a good approach until someone comes who has
stronger needs than can be done with a simple approach. Until this
happens a simple approach is good for everyone.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--eqzeemqexvwxupmj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmQ+tLUACgkQj4D7WH0S
/k63jAgAk7+euErd/rScGYReNxFE09ohTUb0Enh+ADA//kK8jamTQNA7NL2yyIbr
eb2DkTerLJuu+v0Vn6k6QdDRCNqSonxldm3rXpkZ1+9ybODgByztA34nr/aS5VHA
yNqwvDPh0aa0cr/2PKfJ7WpnT6UcplUw8zifqRLDUpwyprlc2Q94bYDb7MfZza0J
H2OHNKmx3ZN/bZSgmG6liYnl07tnv9ZVJ+KE1C1LwNpx1Ds9uFx0PpWYamPCFviP
iGcMLTu815AeXTN+jIKU+v8kx5Da0IpImDwBltP0rEKLIReJNIZpDvPGBQzqqvuE
eGK2DXGsDAN0PQcFNAr4NZVcMJP8Kg==
=5Bvy
-----END PGP SIGNATURE-----

--eqzeemqexvwxupmj--


--===============6410143709055410724==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6410143709055410724==--

