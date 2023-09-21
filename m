Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 372CBE7D0AB
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 21:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o7C5ZVb50dplvc7UEkMVNiHiAxKcooNrz3S5CG1OA58=; b=gmJV129XaRv432GYcWqE5qJM55
	yjxS09bI/UAIjJzjzC+jVdwTAvEn9SVU0VgL32Asj3hX7oRyTVpiGywhZEqgIMC9dWU+c5smxGkqs
	/O6cdVPsrlKGFA/C1SMqHiG7XfDFBK6SF8VI6I2IYmO+0p09OxaNH9otvTDMdkWYIVqrA/1PI7w9i
	OcAjM5mskw0CJrzeAQttbVMIw/MPcBbv4JriMiBguXroA5PaR7x4WI4saFdkBXGkN7I0Aqrz+Kz+A
	2rFU14EeU3sYmEwgrDYyFq8okpcHxVKd+RMrlD4uswGwgwvaIot/OevMSTiVtBru0UaEi/LSw4ZQB
	cGXHDqdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRDN-007C8s-1x;
	Thu, 21 Sep 2023 21:28:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjRDK-007C7x-31
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 21:28:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjRD0-0005ek-10; Thu, 21 Sep 2023 23:27:38 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjRCy-00816y-1P; Thu, 21 Sep 2023 23:27:36 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qjRCx-003jNA-Nt; Thu, 21 Sep 2023 23:27:35 +0200
Date: Thu, 21 Sep 2023 23:27:36 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: John Watts <contact@jookia.org>
Subject: Re: [PATCH v6 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <20230921212736.nw6ctlimtrxfksbu@pengutronix.de>
References: <20230824114038.891493-1-privatesub2@gmail.com>
 <ZPfn-0OAL7-3DCmt@titan>
MIME-Version: 1.0
In-Reply-To: <ZPfn-0OAL7-3DCmt@titan>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_142758_969203_395D9289 
X-CRM114-Status: GOOD (  16.67  )
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
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Aleksandr Shubin <privatesub2@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, Samuel Holland <samuel@sholland.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Thierry Reding <thierry.reding@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, Albert Ou <aou@eecs.berkeley.edu>
Content-Type: multipart/mixed; boundary="===============4432720494021528108=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4432720494021528108==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hsej65iwiu4uzzgq"
Content-Disposition: inline


--hsej65iwiu4uzzgq
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi John,

On Wed, Sep 06, 2023 at 12:46:19PM +1000, John Watts wrote:
> On Thu, Aug 24, 2023 at 02:40:24PM +0300, Aleksandr Shubin wrote:
> > This series adds support for PWM controller on new
> > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > provides basic functionality for control PWM channels.
>=20
> I have tested this patch and earlier versions successfully on a Mango Pi =
MQ
> Dual and verified it outputs a PWM signal.

If you want that documented, the usual thing to do is to include a
Tested-by: tag in your reply.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--hsej65iwiu4uzzgq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUMtUcACgkQj4D7WH0S
/k6buwf6A0Hc5i21Amtcab5twrhrw6hQ6A5Ooz+1y2NkTKoC1LfIo7H3TlzWFbE0
9v6vTPc5eeLTrrEvqyuklZj4ZeOfQ59QP8J28sITll556Mexp3qZE2UeEsJ+WWnQ
VhotAXjZk0kIxPwYlYtpNRuFIu77UapAGa1fIAbCE+YkWe1gylM0C9U4BoN5Bwt0
YfeNGDLxtFg4fnkdFryQnnt+XdJyZZoP3zyxek759tHYwlV+zyYGtQnqkFrve8O3
/1ulltb5AMO19uiVuefYGW14yKzs2fQQKHvphjHnLAPd3pvio49reLiFmMIbBVoo
mcSTWHcLZyx4+qyDqk1pKuC4hprirg==
=WRok
-----END PGP SIGNATURE-----

--hsej65iwiu4uzzgq--


--===============4432720494021528108==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4432720494021528108==--

