Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06D40C433EF
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 06:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3OvcQPA08AEa4vOs7jMUcDb2Mo8jXkxxK2Y02h1FnkE=; b=wjdAOImxck3gvVRAGBj+5D4hjE
	vmzaGUNWQR/trAErxEsuDZbNDOR+sTzhS3oDIsihT2RMbcMC5HflpZ5FVqXSdOuHqmknms5VVn38s
	ZPJoJZov7NcP7s9ixLUJNtCQVz2Z6ufFlzTNvDjpWUjGhen2fAgMUEsPny7t9/h4Akv4kQn5HeetD
	HOIHSubnK4MxLZNdxePLmodqcWHfPhDAdquDfeN6uFcHnSpgkd4ASz12Tv99PBCaYH/kW6eyGKRdU
	8YWP9IRJNSakApQ7nDt5PkKlXYeHQH2HSp31/joH2hCecY6A7M8g13RcKnNjOJt2wFCWdpyL1iu51
	awMhXZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMl1G-00Cx4L-0x; Wed, 23 Feb 2022 06:20:58 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMl0z-00CwyX-V2
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 06:20:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl0k-0005Jx-7B; Wed, 23 Feb 2022 07:20:26 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl0h-000lGz-8Y; Wed, 23 Feb 2022 07:20:22 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMl0f-004xzq-GS; Wed, 23 Feb 2022 07:20:21 +0100
Date: Wed, 23 Feb 2022 07:20:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: conor.dooley@microchip.com
Cc: linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 lee.jones@linaro.org, a.zummo@towertech.it,
 alexandre.belloni@bootlin.com, paul.walmsley@sifive.com,
 palmer@dabbelt.com, aou@eecs.berkeley.edu, geert@linux-m68k.org,
 krzysztof.kozlowski@canonical.com, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <20220223062018.nbgidqxgh2soz625@pengutronix.de>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20220214135840.168236-6-conor.dooley@microchip.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220222_222042_008529_F7B4E591 
X-CRM114-Status: GOOD (  10.89  )
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
Content-Type: multipart/mixed; boundary="===============2540078847052370129=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2540078847052370129==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gwgvgz5a7qk4akyl"
Content-Disposition: inline


--gwgvgz5a7qk4akyl
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 14, 2022 at 01:58:35PM +0000, conor.dooley@microchip.com wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> controller.
>=20
> Reviewed-by: Rob Herring <robh@kernel.org>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

I like it:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

nitpick: Put your S-o-b last in the commit log. (This doesn't justify a
resend IMHO)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--gwgvgz5a7qk4akyl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIV0h8ACgkQwfwUeK3K
7AlVlggAjc/UORg1M305xP+mcUpcTjcvnX3xdiGHTYLbwN+fXq35yTpsJLWANloZ
BC8MUWdeNvNbTXVlp04KLBbY+jRq9oMMptjH4OP5U8xa68BuWVLqWnUFuAVtneDn
KjaMJV2rqc8wsNKyrU5oItCjuwU5bNTkH3JsicKDhVNRReoR2p6vmDGouStUlQyP
68BNzKwNIcxR+T6jDbX21FJxc1YYOfYqu7Eabs1cf/You2yJs/fLfAMnS96znVp0
mjAAS0RhwJfZaqy7//zM1ss/C4LfqTwkmlNG4A2OjzQ0EOfHKtN+oWYM96WdWqPk
36F8R0cjTJKJfdpbtB31qmYxhPf+SA==
=OU4n
-----END PGP SIGNATURE-----

--gwgvgz5a7qk4akyl--


--===============2540078847052370129==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2540078847052370129==--

