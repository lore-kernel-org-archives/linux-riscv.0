Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5A9AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 07:41:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D++ruyrY3BiVZRuTx7MdR/Hruc3Edb8Ym4RTRaLVdKU=; b=sqG7+OToNbT34d8/+01h94goBS
	gnaM6udLzWu3Kmaqse0BsT3QE2FeaFCF0KR7fTVaXJ1GCkETcrnkhjY3e/+8knOHXO7CG3MtJjaC+
	NThIvBYnkVdguKwGFmjyocqwT/hzC87H1XEZ5dcpNXdslk9qt4eH5SUnwVBVTwd76AkOaKDV7WGvR
	cdyu9WkvgkFssSzMzZBDaxB7h6kpmjyH2KfMua0r90B0YwCIDmM0vHG+jJfyOptWeQNE6x3gzgh3l
	awyRTkTQeL6rDZrMHCEeiIEhnLfhks6Brlbhv/ht/Zk9CVrUbpH2J6jVyxthqZqMKI+3ryFTRS0cL
	PVi66Ulw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nJsSh-001Iya-Vx; Tue, 15 Feb 2022 07:41:24 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJsSX-001IuU-F2
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 07:41:15 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJsS0-0006FP-9s; Tue, 15 Feb 2022 08:40:40 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJsRu-00GhwB-EV; Tue, 15 Feb 2022 08:40:33 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nJsRt-003I1A-4j; Tue, 15 Feb 2022 08:40:33 +0100
Date: Tue, 15 Feb 2022 08:40:30 +0100
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
 Philipp Zabel <p.zabel@pengutronix.de>,
 Vijayakannan Ayyathurai <vijayakannan.ayyathurai@intel.com>,
 Rahul Tanwar <rtanwar@maxlinear.com>, Jeff LaBundy <jeff@labundy.com>,
 Sagar Kadam <sagar.kadam@sifive.com>, Vignesh R <vigneshr@ti.com>,
 Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 00/15] pwm: dt-bindings: Include generic pwm schema
Message-ID: <20220215074030.3nugwproxjh3lwhl@pengutronix.de>
References: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
MIME-Version: 1.0
In-Reply-To: <20220214212154.8853-1-krzysztof.kozlowski@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220214_234113_512231_A13FD4AB 
X-CRM114-Status: GOOD (  14.44  )
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
Content-Type: multipart/mixed; boundary="===============0458271070197852637=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0458271070197852637==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="75mhjvzsa3tznmbu"
Content-Disposition: inline


--75mhjvzsa3tznmbu
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[dropped Anson Huang and Yash Shah from Cc: which were not reachable for
my last mail]

On Mon, Feb 14, 2022 at 10:21:39PM +0100, Krzysztof Kozlowski wrote:
> Hi,
>=20
> Changes since v1:
> 1. Add tags.
> 2. Adjust subject (Uwe).

However you only took a part of my suggestion ...

> Krzysztof Kozlowski (15):
>   dt-bindings: pwm: allwinner,sun4i-a10: Include generic pwm schema
>   dt-bindings: pwm: imx: Include generic pwm schema
>   dt-bindings: pwm: intel,lgm: Include generic pwm schema
>   dt-bindings: pwm: iqs620a: Include generic pwm schema
>   dt-bindings: pwm: mxs: Include generic pwm schema
>   dt-bindings: pwm: rockchip: Include generic pwm schema
>   dt-bindings: pwm: sifive: Include generic pwm schema
>   dt-bindings: pwm: renesas,pwm: Include generic pwm schema
>   dt-bindings: pwm: toshiba,visconti: Include generic pwm schema
>   dt-bindings: pwm: brcm,bcm7038: Do not require pwm-cells twice
>   dt-bindings: pwm: intel,keembay: Do not require pwm-cells twice

=2E.. The actual patch has a space after the comma, I like this variant
without comma better as this is a compatible string. Also a # before
pwm-cells would be nice.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--75mhjvzsa3tznmbu
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmILWOsACgkQwfwUeK3K
7An9UAf/fphlT382o9/FKqwTAw/JDCNvTPyXDeOLfHI7s5jElS2X/z6Ev+qvlRbO
c69X0dIeX0m3ZG2Aqq9zXkzrEjLiv5BUPTnaA/EsPCkU8TWyTQa/cd+y7kAnqVxx
63Vj1JFt9TxNaAR/+EebmDui9nLX3D/hUYNaJn+JbAZlLGGdzcmbovc5YmB1lw/M
qByp61tL/ib3x+KV8tA4Rccvu1uxZTmU7VUf15xsHOdY1LXDeu/ZCbWIWOy0AeNa
dlLq2yiogwbckiquxxHnHm3yVPt1ncclAYeUT3VY9VeHvU6OQkNvJgtdmsGkEFfn
ZVt42/xmkq2p4d6tMsSkQzJGnR6DRA==
=6jay
-----END PGP SIGNATURE-----

--75mhjvzsa3tznmbu--


--===============0458271070197852637==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0458271070197852637==--

