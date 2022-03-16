Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DA7DC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Mar 2022 06:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LYh6h9ueSIuKWQf/wV1Gw+LxP/I503EBDTVQAsZ+f+M=; b=0gEVTCosxbFLQ8MUxl8f+SQZrN
	1J8IpWhcxXc+6ZugTheKRwWCvUMYzsgf4hvUU72LU7BG7jDlEDjNS6AO+BHyyC+VllMjlFcM18goY
	H8HOhqVQxmSzQso0leKj9PM17eEoZ/fn8klAwRjXJ3SXdpb15R/vCqXj5fFB2OJPKN2orI3av9Ie1
	Sf7OwgD6+vRV5WZZ+DECW04QF9g2eP1xMyTB+3sakHEvKpoVmcJDfbhr1GQ7t8rCKHzp8brNuSKnu
	Ep8RUhkjhCihzO3kUtLh7O8XUGICKlUVYebCm+QKXLPpg1YS/PJVDUnhSyvQe33iWGojPSjOVfDYn
	4LpD1ojA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nUNWV-00BjEG-S9; Wed, 16 Mar 2022 06:52:43 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nUNWS-00BjCn-C7
 for linux-riscv@lists.infradead.org; Wed, 16 Mar 2022 06:52:41 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nUNVs-0006dA-FP; Wed, 16 Mar 2022 07:52:04 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nUNVo-000zbf-Sq; Wed, 16 Mar 2022 07:51:59 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nUNVm-009UG4-Qs; Wed, 16 Mar 2022 07:51:58 +0100
Date: Wed, 16 Mar 2022 07:51:55 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: mail@conchuod.ie, sboyd@kernel.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 Atish Patra <atishp@rivosinc.com>, conor.dooley@microchip.com,
 linus.walleij@linaro.org, brgl@bgdev.pl, robh+dt@kernel.org,
 jassisinghbrar@gmail.com, thierry.reding@gmail.com,
 lee.jones@linaro.org, a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, krzysztof.kozlowski@canonical.com,
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
 linux-rtc@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 00/11] Update the Icicle Kit device tree
Message-ID: <20220316065155.tuuq2k4d5dczwtq2@pengutronix.de>
References: <c94f9c0a-6dbe-c1f4-daff-e4d29f3ace02@conchuod.ie>
 <mhng-bb42ad9f-5772-4749-97e1-9f6c511654f6@palmer-mbp2014>
MIME-Version: 1.0
In-Reply-To: <mhng-bb42ad9f-5772-4749-97e1-9f6c511654f6@palmer-mbp2014>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220315_235240_420079_A10B3937 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Type: multipart/mixed; boundary="===============4274268937096273485=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4274268937096273485==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bkpwvtdvshkxkizn"
Content-Disposition: inline


--bkpwvtdvshkxkizn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 09, 2022 at 11:07:03PM -0800, Palmer Dabbelt wrote:
> On Wed, 23 Feb 2022 12:48:16 PST (-0800), mail@conchuod.ie wrote:
> > dt-bindings should be set now, so if you're still happy to take the
> > series via riscv, that'd be great. i2c, spi & usb patches ended going
> > via the sub-system trees (and have been dropped from the series), in
> > case those generate warnings for you.
>=20
> Something went off the rails in email land and #0 and #2 didn't end up in=
 my
> patch queue but the rest did.  Luckily enough made it through that it did=
n't
> get lost, and lore's pretty great so this sort of thing isn't that big of=
 a
> deal these days.  That said, email is a bit of a black box so figured I'd
> give you a heads up.

One of the patches in next now is
df77f7735786ece2fcd8875b036a511ffcadfab6. It would be great if you could
fix your patch application setup to not mangle names. Here it's

	Acked-by: Uwe Kleine-K=3DF6nig <u.kleine-koenig@pengutronix.de>

where my =F6 was recorded as =3DF6. :-\

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bkpwvtdvshkxkizn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIxiQgACgkQwfwUeK3K
7AnaOAf+KYzjoQhzMwQBCvuk5Nuy19InDXSbXr3hGJaP1HavbuLPFGVesC/ny0hy
pYoeu3A8RpcK8VCbPnl3E8baLLrWlzzPEjbPzb0hrbGvu79Bkiire4nM9GmnCBKa
uYWdxrbt8s4NRrvHmeqf3IAaXe3N2T98KWSjklHsqD10/S/QEBNphY6G9mcXi0Aj
28imRZDsWhU2uTpe4UpbEXAq+GP3MzII3K3+gEtJmsRADPmkVcZlHVPzeABY9PWh
TIEcWRwydEsaMDxUpl4tEv+lWTt3DpRp65cMC6ElJk7lWVIpIAQYLUYjhoQSIYsP
XP549wvifCmIMBHY/C7IBeHUgwjl6w==
=t8CP
-----END PGP SIGNATURE-----

--bkpwvtdvshkxkizn--


--===============4274268937096273485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4274268937096273485==--

