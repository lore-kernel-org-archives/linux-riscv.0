Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA733C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Sep 2022 16:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFmYMN1FWFoTRvEJhfNr0CP81sXFJ62CX/LS2E8+8RM=; b=thTkuY2BDkSUN+gf7fUMORRnAD
	yqCVYUWFDRfkhi+MokaXnDURGj1EOmIJswqnOpXRmxsC3fkY+5G3haD+XW5ykJJNh2YbXJwVlskm3
	LuDo6UhMpoEYEZk21eZ+LdlpkRSOtGBasuK9uGkJqhU6PwRdF1+mUYAdttnVbrGJj9Tw2ILvPLKUe
	EX/2OaYm+zh+L47Wpz18b6A+krp0n/u/noPgPH1FMTHqaeAow4Ohxw9llybmDsxFwqhy0WCXAKgtv
	AesTrYZnPKdh4XzaPXWXvH4p47NoxjWElXH3QbwHQlTE+kztm5h0MfB/FgkJgJje935Sv9dXIS0C8
	Mxyq/2mQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oagJh-005DCH-Cp; Tue, 20 Sep 2022 16:41:49 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oagJe-005DB8-Dj
	for linux-riscv@lists.infradead.org; Tue, 20 Sep 2022 16:41:47 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oagJY-0005mP-QD; Tue, 20 Sep 2022 18:41:40 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oagJZ-001tcg-8N; Tue, 20 Sep 2022 18:41:39 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oagJX-002H6n-0M; Tue, 20 Sep 2022 18:41:39 +0200
Date: Tue, 20 Sep 2022 18:41:35 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Olof Johansson <olof@lixom.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v2] serial: sifive: enable clocks for UART when probed
Message-ID: <20220920164135.7hjewp2kyi6zp5o7@pengutronix.de>
References: <20220920160017.7315-1-olof@lixom.net>
MIME-Version: 1.0
In-Reply-To: <20220920160017.7315-1-olof@lixom.net>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220920_094146_502488_554177C4 
X-CRM114-Status: GOOD (  13.48  )
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
Content-Type: multipart/mixed; boundary="===============1592760003205320118=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1592760003205320118==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="lrbdrldkip7w62to"
Content-Disposition: inline


--lrbdrldkip7w62to
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Tue, Sep 20, 2022 at 09:00:18AM -0700, Olof Johansson wrote:
> When the PWM driver was changed to disable clocks if no PWMs are enabled,
> it ended up also disabling the shared parent with the UART, since the
> UART doesn't do any clock enablement on its own.
>=20
> To avoid these surprises, switch to clk_get_enabled().
>=20
> Fixes: ace41d7564e655 ("pwm: sifive: Ensure the clk is enabled exactly on=
ce per running PWM")
> Cc: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--lrbdrldkip7w62to
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmMp7T0ACgkQwfwUeK3K
7AknbwgAidqEwlEPF6FyfKvgD30uVgZYJzrAa2GklHNToKfFbYIP/KAmbMUAROdU
DSl4HX/GMirbjcttlXI5mcxCQ9V5M0NDwWnDSfy6iZuTmO08ftRBAumEdq9MaJtU
e2mG5WG8MMHqv8IyoVl//VNEEzijDiq93nslyjtaVI+xvhhefxe0+IGt3noXgH71
aRArAwESn7fATUuZK0XjhlQ/10TId6hjz9Slwkr+7uYU3jGvMdA0ZbQ46BtY7EZj
xy+GMUAe0Nbaq0NAcgn96W5TEs4a957umPqgoyVXDxhHic/LogWcm7rdIEEE8oht
xTL5C7pnyaxn3YGoL5W+GnRRodC6Bw==
=x2AC
-----END PGP SIGNATURE-----

--lrbdrldkip7w62to--


--===============1592760003205320118==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1592760003205320118==--

