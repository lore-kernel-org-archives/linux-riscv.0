Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADA5C001E0
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Jul 2023 07:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rk3r1ifScIGpDA57wTcoJeOEoZIuQtP7eF+fvtI/rCs=; b=ytRGIiRQi/9GheJOM16AeCxq8i
	97usUU66vDaKCAUbKKsMOjujloSHKcsTAxOjiTX4Y6cJ/hQDl1GCR0VjhO1uc5rW4HU75yDf2xwsv
	hKWoEqvNnZWLixfsLhlJ8d1vcJ7NNj8SB5G2ZRisx80hrhooc9rOHIMAD1rm332TnaYr0JokdjAVM
	yAg2D1Bptb9kUxAB5rfiFchgW/HRMPEVKEaV1n5ZBMOJLQyNePuRHMftV/vjhZcpYGB10WKiSr3e4
	+nMrleWBpZmfKlNgXLe6vIi28uDozgOM8KGZW9WFlDCcGaqnbln3VPwWb5OSEHu93X+EZvAMJJygV
	uT3bJ7vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIGT-003Gdp-1G;
	Mon, 17 Jul 2023 07:03:25 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLIGP-003Gcw-1z
	for linux-riscv@lists.infradead.org;
	Mon, 17 Jul 2023 07:03:23 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qLIGE-0000T3-Cf; Mon, 17 Jul 2023 09:03:10 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 08B4F1F305E;
	Mon, 17 Jul 2023 07:03:07 +0000 (UTC)
Date: Mon, 17 Jul 2023 09:03:06 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: John Watts <contact@jookia.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-can@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Fabien Poussin <fabien.poussin@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Chen-Yu Tsai <wens@csie.org>
Subject: Re: [PATCH 3/4] can: sun4i_can: Add send support for the Allwinner D1
Message-ID: <20230717-aluminum-driven-a008473620ca-mkl@pengutronix.de>
References: <20230715112523.2533742-1-contact@jookia.org>
 <20230715112523.2533742-4-contact@jookia.org>
 <f3b1240a-4be0-4c02-0a63-561499ad6d0d@kernel.org>
 <ZLQgQAigmhk9uYYd@titan>
 <eb2d6e5a-595f-85f2-fe36-8acbb76d3987@kernel.org>
MIME-Version: 1.0
In-Reply-To: <eb2d6e5a-595f-85f2-fe36-8acbb76d3987@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230717_000321_656356_32CF1AD2 
X-CRM114-Status: GOOD (  21.59  )
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
Content-Type: multipart/mixed; boundary="===============3718137664614208171=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3718137664614208171==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="j7xfjmlq2qs7lfx4"
Content-Disposition: inline


--j7xfjmlq2qs7lfx4
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 17.07.2023 08:41:07, Krzysztof Kozlowski wrote:
> On 16/07/2023 18:52, John Watts wrote:
> > Hello,
> >=20
> > On Sun, Jul 16, 2023 at 06:36:03PM +0200, Krzysztof Kozlowski wrote:
> >>> +static const struct sun4ican_quirks sun4ican_quirks_d1 =3D {
> >>> +	.has_reset =3D true,
> >>> +};
> >>
> >> Isn't this the same as previous?
> >=20
> > Yes, but I wanted to split up the new quirk in to its own patch.
>=20
> I don't understand why you need this new, duplicated entry. Aren't
> devices compatible?

According to patch 4/4 the devices are not compatible.

> I also do not understand what 'own patch' has anything to do with it.

Patch 4/4 adds a new quirk to the new device.

Jookia, please let the patches build on each other so that the resulting
kernel is consistent. The kernel at the state 3/4 will build and load
the driver on the D1, but it will not work, as the new quirk is missing.
Please exchange patches 3/4 and 4/4 (add the sun4ican_quirks_d1 in patch
4/4 only).

> > Is
> > there a better way of doing that?
>=20
> Devices are compatible, right? So express it in the bindings and DTS.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--j7xfjmlq2qs7lfx4
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS056cACgkQvlAcSiqK
BOgTZgf+I68G1vUzidxsQq9n5fAC7r0kF1tOoX+Bdb/J+hxId7T1pN+ip8l6XrXY
IaKMtl8z7JVcPJbcieeUFWxbhFjpKmpY16iQnukesYWseAggktWdtdFdv2gaa5XM
XWQDvGB846jMQUv4yYC6NQfC4FNY8BZRYEJCMuggpntAx3CrLWR/b8sIC111cRb7
0cS6k4VznFomJCrZB5XEuS5tD7PbIyuk4DiA6DHxBmfIbJVsFFrlGW9GsINKBtbC
/mERFA1TB1VALhEnvlP809s/eLhMRrXV1wVVnAQpfp9i0bDQaAdJNmzuVe+5Aw7f
H8y0DguEiwAG7bb4eTGkEi8uLKp31w==
=v8dE
-----END PGP SIGNATURE-----

--j7xfjmlq2qs7lfx4--


--===============3718137664614208171==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3718137664614208171==--

