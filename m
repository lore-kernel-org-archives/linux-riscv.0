Return-Path: <SRS0=c5hJ=CL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16748C433E2
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2020 07:13:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D74E62087D
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Sep 2020 07:13:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="VMmWtJPj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D74E62087D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=C25jwbpahOb1gOoR5b2WSyda5l7qNFJ/W4jDqLVMVFo=; b=VMmWtJPjjIy2pk7vR4tmfTkXL
	m+eucRZzuHoTUOibm/IhZc/VvBfR1eI+jzOPC3HgK6lnS6YBhun0GU1IdEJeck6fsk3ooul/+XQKE
	IFlPGA0ehL64pmXtBlZzhydwAk9PmdsAVhqzshqCex06Q1Y7E+6HOAsqElIkVFbuFs4yhZMRl8nsv
	G/nJODZHUcei+zMraB5OO7ReAVBc540CbZcAockcWt8XEvfZlBOzOqMQwGewVkc0gX1DCnPDN6rUo
	4HREu16UiiHCvknfK54E2r0g/WQ+piGPwx8zKG0jrNFrs7GAheY3IAVKav5QHJ+vz044bcm06dSIN
	+PJ/TmyEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kDMwx-0006ZN-B1; Wed, 02 Sep 2020 07:12:55 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kDMwu-0006Y3-8e
 for linux-riscv@lists.infradead.org; Wed, 02 Sep 2020 07:12:53 +0000
Received: from pty.hi.pengutronix.de ([2001:67c:670:100:1d::c5])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1kDMwf-0003Xt-QX; Wed, 02 Sep 2020 09:12:37 +0200
Received: from ukl by pty.hi.pengutronix.de with local (Exim 4.89)
 (envelope-from <ukl@pengutronix.de>)
 id 1kDMwY-0007zI-Bc; Wed, 02 Sep 2020 09:12:30 +0200
Date: Wed, 2 Sep 2020 09:12:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Subject: Re: [PATCH 1/6] pwm: bcm2835: Simplify with dev_err_probe()
Message-ID: <20200902071230.6qfjiwt2fodlpe4a@pengutronix.de>
References: <20200826144747.9436-1-krzk@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20200826144747.9436-1-krzk@kernel.org>
X-SA-Exim-Connect-IP: 2001:67c:670:100:1d::c5
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200902_031252_399503_E2E1F0EB 
X-CRM114-Status: GOOD (  13.09  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Heiko Stuebner <heiko@sntech.de>, Paul Cercueil <paul@crapouillou.net>,
 Thierry Reding <thierry.reding@gmail.com>, linux-riscv@lists.infradead.org,
 Lee Jones <lee.jones@linaro.org>, Florian Fainelli <f.fainelli@gmail.com>,
 Chunyan Zhang <zhang.lyra@gmail.com>, linux-rockchip@lists.infradead.org,
 Chen-Yu Tsai <wens@csie.org>, bcm-kernel-feedback-list@broadcom.com,
 Orson Zhai <orsonzhai@gmail.com>, linux-pwm@vger.kernel.org,
 Ray Jui <rjui@broadcom.com>, Maxime Ripard <mripard@kernel.org>,
 linux-rpi-kernel@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 linux-arm-kernel@lists.infradead.org, Scott Branden <sbranden@broadcom.com>,
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Baolin Wang <baolin.wang7@gmail.com>,
 Nicolas Saenz Julienne <nsaenzjulienne@suse.de>
Content-Type: multipart/mixed; boundary="===============1477082987935872997=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1477082987935872997==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="psu4zpohrt2wcrrk"
Content-Disposition: inline


--psu4zpohrt2wcrrk
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 26, 2020 at 04:47:42PM +0200, Krzysztof Kozlowski wrote:
> Common pattern of handling deferred probe can be simplified with
> dev_err_probe().  Less code and also it prints the error value.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Thanks
Uwe

--psu4zpohrt2wcrrk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAl9PRdsACgkQwfwUeK3K
7AkPsAgAiyyLPB/J+8+YDWXP+vSRdR1hRrNf7uDQqdZXlgJw6KwronTBpl1icHjy
JSnUWDvqfNunOY+gmKH7uzk3J3dDIEfgP+KV4ywjIqezdv2FN2rzk7p8aFNCpDLu
xkpzC+wkjYTE3TmtO/WxNLB+3awRKdhRV+TTFA6ou5JdtPHPUyr+NfEhfV8Mj0tq
mmBBPugtfFPv3+R9Rjz296rxeCZSUYwMXPCI+743154sja+NaoOusmLxd1qOmkeE
bZ/0Zq1tEjH+6mezwI5QBQDRmjkHQ3XhFbPOWvBhUabUtW2sCS5AQm9iUCuMO00j
yoadlHq9HwLTEVjT+1zfaJa3KF2q3g==
=y6tG
-----END PGP SIGNATURE-----

--psu4zpohrt2wcrrk--


--===============1477082987935872997==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1477082987935872997==--

