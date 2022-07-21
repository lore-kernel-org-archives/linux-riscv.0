Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B4F4C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 14:23:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HA1MlLrrEEbmkF4gVzOoeo5ucO8G5AqE+rL4idxzc58=; b=S7Y9YkPjbEzIMV8TiWGqDMnbgF
	QhfpeuPmoxCLBRj1uFh0vZenkYdxweKpKZ3zZbxUx2iZUsOd4SLRfsVo1ymRzFryBVGIFnEP2GRGM
	rhIwmuRBkDHp2C7f+59yOOxIKY9Ojg8ubmlbzg8akGAUm36zQjQ6l3hC+eXOvJ3QH/bXFV2b/Mnut
	YKqKqqKjCvv1ji0vIEsIdqh/Hgk7EFzb8gYbQN+6wBHduQiiZoNK7b6G1/Bx59k5EV4hTJWg6ojJt
	gURMNRW5XkzcgxX/1hSXsS7/2NPa57BdhIqGZKOmxDboPKF5f2zC+VBY5r9plgtWS3DRkr9OYnyFG
	9k6XLSPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEX5B-007pML-Ha; Thu, 21 Jul 2022 14:23:17 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEX3F-007mTR-7A
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 14:21:20 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEX2p-0008Lg-Er; Thu, 21 Jul 2022 16:20:51 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEX2o-002Kis-3x; Thu, 21 Jul 2022 16:20:50 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEX2m-006bNr-RQ; Thu, 21 Jul 2022 16:20:48 +0200
Date: Thu, 21 Jul 2022 16:20:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor.Dooley@microchip.com
Cc: thierry.reding@gmail.com, lee.jones@linaro.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, Daire.McNamara@microchip.com,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v6 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <20220721142030.yh7x3ebr2b4fcunc@pengutronix.de>
References: <20220712142557.1773075-1-conor.dooley@microchip.com>
 <20220712142557.1773075-4-conor.dooley@microchip.com>
 <c49776c2-4807-91c1-010a-a33bd98b68b7@microchip.com>
 <ee05749f-c33f-3505-4309-f4d036de92a1@microchip.com>
MIME-Version: 1.0
In-Reply-To: <ee05749f-c33f-3505-4309-f4d036de92a1@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_072117_304855_2905648E 
X-CRM114-Status: GOOD (  13.59  )
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
Content-Type: multipart/mixed; boundary="===============5920765025289163918=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5920765025289163918==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4suvbrt6oxi7xwmi"
Content-Disposition: inline


--4suvbrt6oxi7xwmi
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 21, 2022 at 11:05:54AM +0000, Conor.Dooley@microchip.com wrote:
> Should I resubmit now with the warnings fixed?
> It is a pair of unused-result on the mutexes & a unused-variable so
> they should not have much of an impact on any review you would give
> for this version.

Don't wait for me to find the time to look. If you have some pending
changes I prefer not to look at the series with known drawbacks.

So fire at will.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--4suvbrt6oxi7xwmi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLZYKUACgkQwfwUeK3K
7AkxQQf8CGigHoaGeRlvc6ke1AQFqpgAqUiMm4kG+jUXB8lI6Y445+UNkGE+UGgB
Vzg1MpwRfqXPyOgCpA4BKA1iQRL9D1qk/nwtzb0slAUS0nBscMOSLb5Qd78JQvuJ
x/8JKAQ0ivFmPk9CxGK4RkFqczhCZtP5zfHNd6HEA6DNSEebfDnnUTuO0yj5vfnF
UTjccjTv3ziVf2k6d0oyv9gpgtAzFEanFoUTSI3dV26+C+8xubZKKfAqVPuXny+8
eA712nmjtz5f5RPyxSsPHeytpE+kRNVG4InAI5m8FcOGkMhoM4mHGWQNxfn7O4mR
g4YP+IGhny0+Panxk5OvAZ69xSHUGw==
=7gkN
-----END PGP SIGNATURE-----

--4suvbrt6oxi7xwmi--


--===============5920765025289163918==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5920765025289163918==--

