Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5702BC47074
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 22:43:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QYr+hpiV5nEi4KieD/jsag1oLWhNkV/jvRkw6srLuBg=; b=vsUxmveCcN+9IjW+AUHoX1Dx3w
	shDJ+fDV5aKfhF8cnQx2625IkJsDIf+BD0vhSOJKpGN8X6sstJ08xq8aKpxoPCINT9dkowOtPGo2k
	t2hUhoxDbl9jgLxwAiVLLvgpSnowDeo8Q4hE9ODtX3W8V/crC32Q+vIdM6nb3GZyJoqWTIZ65xyEO
	FUiq+nwkw5UQPd9RI37sHVPHSaLmDnKy6ZjuMGh558zWefbdDtGjpXjyQ834RpsHyuVed9fg3w4VF
	2GLSrCdm+zmg/yA0St8ZcqX6GDQ1GxdpJdtoxe9C8wJrqiqOIIvlzHHz5FEhrwGoSKMxogiv+SYy7
	SlIRiYkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWQo-00FN2U-1U;
	Thu, 04 Jan 2024 22:43:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWQm-00FN25-0a
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 22:43:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWQk-0002Z8-Vs; Thu, 04 Jan 2024 23:43:15 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWQj-000SXO-RC; Thu, 04 Jan 2024 23:43:13 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWQj-003ePA-2P;
	Thu, 04 Jan 2024 23:43:13 +0100
Date: Thu, 4 Jan 2024 23:43:13 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: William Qiu <william.qiu@starfivetech.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Message-ID: <t3w2p765fs633nanqsx5yqres7taqpk6juwyl4iex5v4jpobo2@rqw6r4myjmv3>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-2-william.qiu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231222094548.54103-2-william.qiu@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_144316_218467_EBC274FC 
X-CRM114-Status: GOOD (  11.72  )
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
Content-Type: multipart/mixed; boundary="===============3942959041153739944=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3942959041153739944==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozy7ossgve6v4vxl"
Content-Disposition: inline


--ozy7ossgve6v4vxl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello William,

On Fri, Dec 22, 2023 at 05:45:45PM +0800, William Qiu wrote:
> Add bindings for OpenCores PWM Controller.
>=20
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Looks fine to me. I'll assume you reiterate the series for patch #2 and
so I will mark this patch as deferred in patchwork.

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ozy7ossgve6v4vxl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWXNIAACgkQj4D7WH0S
/k5ZPgf/Uwi36x+rx6IOnUKwTak1p+sRkvDa2bcn4nntN72el9/ECt2qm49ySlUp
EnfXsBSfUyOALBrcnXyd+mrSL0ZH6cwYc51vGVOrtB8ns8kxxr19nHespYKBXmql
RWTVYewRVZ6wex1Po0g2l8i938b4C3QDZXGq3kn7nZ4hOTOfpS2Jfw4V3VsaaiS7
UmpJ/LbNP9H8rIHwyupDdIfr+dQQtiB01LnNDizh69hv3zelYLYvgQNPWaSX3Ixt
Isf49G8a6wbruVMH6Wga8wjSjkyRH6UJP90+cv0ysD83gAtH/4ANApWw+iVKXNyq
7BShjR9HClTLRZ2ngBsSnRKijP8pMg==
=pO4P
-----END PGP SIGNATURE-----

--ozy7ossgve6v4vxl--


--===============3942959041153739944==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3942959041153739944==--

