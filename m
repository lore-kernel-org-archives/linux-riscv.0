Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D56E9C61DB3
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jan 2023 22:50:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4O+sXJmWL8GD6jPvaoKcdYpjOz/5q0A4GehIDFDS7eM=; b=ck0/AAw2y7+IXxjEuMht6I/LI/
	2KVlbXyklKj7UyBHgryCZBTnRWUZ99dMnDdnIVEQ7RVTc+IeZAmx3+iF6q3cR/6S41s+7wvwwkHwY
	qMm5nkp3rgOetKKW8PRJHoMKrygUMEynnyU1sTM9ujLbRQFR+ZeyYiJ3B4WTdQ45+XpbSQMhLOWe5
	69APzIK0XRQfn0AQnDBAiSbESBBjj2AuFO2FvT851F4GIQ03bmhcgXb5g4QSJh8vVgadUSaeT2WHB
	eC/A4w7uj4RQTWXzPEFcikaSEJzi7Y0vBKIM7pHbd44Z0rBkzb4iAYdHq+6Lj1dgOW37C0tmsAH/v
	B3gZrKSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNS8-008p6L-6f; Tue, 10 Jan 2023 22:50:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFNS5-008p5c-0E
	for linux-riscv@lists.infradead.org; Tue, 10 Jan 2023 22:50:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFNRZ-0000KD-Rw; Tue, 10 Jan 2023 23:50:09 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFNRZ-005Aea-8b; Tue, 10 Jan 2023 23:50:09 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFNRY-00Boql-Jv; Tue, 10 Jan 2023 23:50:08 +0100
Date: Tue, 10 Jan 2023 23:50:05 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Message-ID: <20230110225005.vp5p2i54baxzbugo@pengutronix.de>
References: <20221221112912.147210-1-conor@kernel.org>
 <20221221112912.147210-3-conor@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20221221112912.147210-3-conor@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230110_145041_056796_573353DA 
X-CRM114-Status: GOOD (  12.68  )
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
Content-Type: multipart/mixed; boundary="===============2421665240298433608=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2421665240298433608==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jgnlhwzsheptkes6"
Content-Disposition: inline


--jgnlhwzsheptkes6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Dec 21, 2022 at 11:29:13AM +0000, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> Add the newly introduced pwm driver to the existing PolarFire SoC entry.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

the patch looks fine, but as the first patch has to change, I'm
discarding this one from the PWM patchwork, too.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--jgnlhwzsheptkes6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO965sACgkQwfwUeK3K
7Akyzwf9FErbxg80rAGecoJRpbSZjjtp1+6lfMHtQhNaK7yri+Bcz8P3iQxqmV4Y
wpZFARIPY8fm0gyjiHGMfPolswg0zP9q+dArdCVvHIPoVglhcg27mPNEyZUMou8R
ELXTTNoNgVtbasrIousE6Pz3NBV3Ocfggz/2lIaTpkm9J9Y+dpC8BvC7xX82guH6
uUUsE80eeB8Th9PtU8FKRr6D6me1FmfAgUHZiBRlW/zEiNvCdqyVx5akm2lkHvyP
qydXrBFQGVsg5/kLY83R4z473wQIVoIHAqg6Y3dATXwr4kFGJOh39ivc9/Numpao
Xn4KMI+C0Q60q5d7NjmSxsqdmR0ljg==
=E/A6
-----END PGP SIGNATURE-----

--jgnlhwzsheptkes6--


--===============2421665240298433608==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2421665240298433608==--

