Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026A0C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 30 Sep 2022 09:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NaLt3ShN2mojj5ntbJ8cQXwdJglePuaj9lnKWLyn0pQ=; b=BWOJPw4yDNawflfcE2gAEaPlfM
	hYkSHT6EuZWocF/mqyijecjsebaCmiy91nWyp2QVMOMCNhGSoYjD9Oh4LPawWxHifhWXt//agSY5c
	Kwkdga01vIlrzOZUk2HqKoBQMjwP16834i1dndJnsyta3ku3ip7PV1dGp8trn5Ep+NfV2nfnig/nE
	+fh8m9N5vcHf6K9td6ZFDjDrWjVO+ezLPPc5aCZi8i+sVQA6sVEsZXy9X6875/tBfjv5nK5tTGAUs
	eHYRcvlJmVspJ2OOdpkCW1ShOhSjw1SGevto7BH03FijpKQSFYh+gxiJKOZwIBq8Ead0H5Xd3yAP9
	GnRxHg7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeC5N-008I8R-Kd; Fri, 30 Sep 2022 09:13:33 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oeC5K-008I6U-Td
	for linux-riscv@lists.infradead.org; Fri, 30 Sep 2022 09:13:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeC57-000471-U1; Fri, 30 Sep 2022 11:13:17 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeC58-003m3N-E7; Fri, 30 Sep 2022 11:13:16 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oeC56-004YMC-Ar; Fri, 30 Sep 2022 11:13:16 +0200
Date: Fri, 30 Sep 2022 11:13:16 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v10 3/4] pwm: add microchip soft ip corePWM driver
Message-ID: <20220930091316.kdkf4oeu6uvxzqa6@pengutronix.de>
References: <20220824091215.141577-1-conor.dooley@microchip.com>
 <20220824091215.141577-4-conor.dooley@microchip.com>
 <20220915072152.y346csakn7wetpz5@pengutronix.de>
 <YyhmZBmfJvJ9/vBg@wendy>
 <20220919135008.sahwmwbfwvgplji4@pengutronix.de>
 <Yyh8v+MtHuc0LLf0@wendy>
MIME-Version: 1.0
In-Reply-To: <Yyh8v+MtHuc0LLf0@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220930_021330_973689_3A8E5F57 
X-CRM114-Status: GOOD (  20.63  )
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
Content-Type: multipart/mixed; boundary="===============6441379777923780416=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6441379777923780416==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="mc44qmsettlbnrey"
Content-Disposition: inline


--mc44qmsettlbnrey
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 19, 2022 at 03:29:19PM +0100, Conor Dooley wrote:
> Hey Uwe,
>=20
> On Mon, Sep 19, 2022 at 03:50:08PM +0200, Uwe Kleine-K=F6nig wrote:
> > On Mon, Sep 19, 2022 at 01:53:56PM +0100, Conor Dooley wrote:
> > > Because I was running into conflicts between the reporting here and s=
ome
> > > of the checks that I have added to prevent the PWM being put into an
> > > invalid state. On boot both negedge and posedge will be zero & this w=
as
> > > preventing me from setting the period at all.
> >=20
> > I don't understood that.
>=20
> On startup, (negedge =3D=3D posedge) is true as both are zero, but the re=
set
> values for prescale and period are actually 0x8. If on reset I try to
> set a small period, say "echo 1000 > period" apply() returns -EINVAL
> because of a check in the pwm core in pwm_apply_state() as I am
> attempting to set the period to lower than the out-of-reset duty cycle.

You're supposed to keep the period for pwm#1 untouched while configuring
pwm#0 only if pwm#1 already has a consumer. So if pwm#1 isn't requested,
you can change the period for pwm#0.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--mc44qmsettlbnrey
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmM2sygACgkQwfwUeK3K
7AkzvAf5AVpy5bOQaZ0X+uV/8U5PrucuD6BKzlppGG7dlsaBLiSKKjzF+EAc5DKl
3zZ6Tlwuh9y/YEO55J30hnk6wZQmMGnVlStYfWyt3b7TB5EiT2sslvPnrUU50w9G
zCOZwXUH4KLI3ubaIHNHA3RWxCjxtaumas2xmWTNwkRVVTKOA1JE9A2HOxyPd/09
MRzV6dx/nc8u/h0kuf3DekqvhRoHu17rxvd/x+mezVlY+einkpatKaFODCFYHHYo
JxCLRhUEnJdeqqqpUB00FW7A+BAw+lyLXfx7CBAHWW+mc0e7wAH5tBATExeUCcl1
3nutfF6+YqiYarH75WEMvSxrXzz+4A==
=nDLE
-----END PGP SIGNATURE-----

--mc44qmsettlbnrey--


--===============6441379777923780416==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6441379777923780416==--

