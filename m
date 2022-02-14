Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A883C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Feb 2022 18:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=37dwc2aNvpQSaA8sudBNT08H9yIkwFKPrvI8oBAnzWI=; b=u4Fte92yEvEiRmHbZ7zUxXavvB
	YSJ9jYJuSj6nDuqXKOsulXFYkHkC/Jqxjm1llkZ9xSbRHwrRmoxd1Vm+k9FFPDC4Uh1LVdXdID9dn
	mS2rE2hN6XEp/V72Vag/XyEmWzzNtmoVFERu+5T9IIGzlyNRHgyVpXAe79mgq8XxYo2oZ+UI5LNWq
	Xq+nhPWbeX7ULxzxeXL9B2CoitTm+B3D3HDqMeSC9OklNe2pdgmQp692avR97q/bleF1ihjdHkR4j
	aDwLW3H1ARqFVI5RETcprtrvhFrP5v6WIyasiWCi8BlONIn3cJZU+51m1Jdgqx1ys5SO15X06SQQ5
	jKG479/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJg6E-00GWaq-Bo; Mon, 14 Feb 2022 18:29:22 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJg61-00GWVY-MS
 for linux-riscv@lists.infradead.org; Mon, 14 Feb 2022 18:29:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg5V-0006ak-2B; Mon, 14 Feb 2022 19:28:37 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg5N-00GbE8-Cu; Mon, 14 Feb 2022 19:28:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJg5L-003BE4-Vq; Mon, 14 Feb 2022 19:28:27 +0100
Date: Mon, 14 Feb 2022 19:28:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Lee Jones <lee.jones@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 bcm-kernel-feedback-list@broadcom.com, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Heiko Stuebner <heiko@sntech.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
 Philipp Zabel <p.zabel@pengutronix.de>, Anson Huang <anson.huang@nxp.com>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>,
 Jeff LaBundy <jeff@labundy.com>, Yash Shah <yash.shah@sifive.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH 11/15] dt-bindings: pwm: intel, keembay: do not require
 pwm-cells
Message-ID: <20220214182824.gevtqbtv4qrddjqb@pengutronix.de>
References: <20220214081605.161394-1-krzysztof.kozlowski@canonical.com>
 <20220214081605.161394-11-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220214081605.161394-11-krzysztof.kozlowski@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_102909_756231_8B1748F2 
X-CRM114-Status: GOOD (  11.68  )
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
Content-Type: multipart/mixed; boundary="===============6598877370201630763=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6598877370201630763==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lqbpgpqedfoirane"
Content-Disposition: inline


--lqbpgpqedfoirane
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Krzysztof,

when I read the subject line I thought the patch intention to be wrong.
Maybe make that:

	dt-bindings: intel,keembay-pwm: Don't require #pwm-cells twice

?

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lqbpgpqedfoirane
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIKn0UACgkQwfwUeK3K
7AmoPQgAnQ94Se1jdIRfuPxmJ8SI3oyoR5qYibmzoO6pwZLs9AEr0sb5Vgbt0bkU
gQmoGNX0ivMunGQ1xXrSm0KXvUUM7nxRaxIHK/rmpYLvAiv1x1oZIKgV7QG7lBOx
Ua+jxme5GKpJD8jNMWXOU/c2vvMb3D0f1FViJeMXitnnooA8RlMRwQeHO+Xz60Gs
YokHBwlm1DtKPndRHVUcnoKpOIUnBvcDaFCVNPuqLfGRBsckM/5qqMH6duDEiZn7
9EUVHIPADGIjR2kSt1jkf+sXnJ9qMguzKcxcouDXAkwqlqFS0xbk8s32UO+3BFM2
rZo1vmmZ555NPDPiZmLPGN0ec+HiXQ==
=7yzT
-----END PGP SIGNATURE-----

--lqbpgpqedfoirane--


--===============6598877370201630763==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6598877370201630763==--

