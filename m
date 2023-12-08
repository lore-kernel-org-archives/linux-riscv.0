Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3313BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 09:53:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wcTaRVFK8SwqgTKxd50Jd4kZAbH6M5Yb9EmraxPPJzc=; b=j4TL3dGkIY+ma8KkQq6ZsCBQTH
	TnbrxDBNb5WuqseGywJKlVkHzvSSqQdiy0AoUG7A3EfWk+DxbPewyFgKc7dL0yJ0HkhD4O8JQmO8F
	OxslJkQnuJYLGGVEq30MGuPSUIg8JwJm6yhlvomwJBw0wLVuUYh6ycPmRzYqQtqWmOSyzsIGiTU+i
	YlBgFBrlf2RP51Y4KZtZR3ni0NAwgseYKV9FMkmbWOWn27EazTqeBDY379jghoc4F2PnypAIIuHH+
	cDPYOPkcBaVR2GaDRA+kvJgItaSmpCA24jjxLcVBPxCjTrYiLNo9dyD6E69PpDI7aeN3OML1rpoCn
	TqvWE9YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXXZ-00FAeV-2I;
	Fri, 08 Dec 2023 09:53:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBXXW-00FAeA-2p
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 09:53:00 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBXXR-0007Uw-Mo; Fri, 08 Dec 2023 10:52:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBXXR-00EO3e-3h; Fri, 08 Dec 2023 10:52:53 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rBXXQ-00GLek-Qe; Fri, 08 Dec 2023 10:52:52 +0100
Date: Fri, 8 Dec 2023 10:52:52 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Thierry Reding <thierry.reding@gmail.com>, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: Re: [PATCH v4 089/115] pwm: sifive: Make use of devm_pwmchip_alloc()
 function
Message-ID: <20231208095252.w5n33rf5s2uzycqm@pengutronix.de>
References: <cover.1701860672.git.u.kleine-koenig@pengutronix.de>
 <500a4f39531bd5fc61eb8ac0092e34d4b1ae2cc0.1701860672.git.u.kleine-koenig@pengutronix.de>
 <CAJM55Z9sUTNKR5EGmPOio8Uh_1+wfs0-aiKcsngUKF24JcO-QA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9sUTNKR5EGmPOio8Uh_1+wfs0-aiKcsngUKF24JcO-QA@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_015258_931408_6D4D47BE 
X-CRM114-Status: GOOD (  22.16  )
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
Content-Type: multipart/mixed; boundary="===============6189135391809693402=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6189135391809693402==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dl7xnlpl5ldocfua"
Content-Disposition: inline


--dl7xnlpl5ldocfua
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Emil,

On Fri, Dec 08, 2023 at 04:30:41AM -0500, Emil Renner Berthing wrote:
> Uwe Kleine-K=F6nig wrote:
> > This prepares the pwm-sifive driver to further changes of the pwm core
> > outlined in the commit introducing devm_pwmchip_alloc(). There is no
> > intended semantical change and the driver should behave as before.
> >
> > Signed-off-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> > ---
> >  drivers/pwm/pwm-sifive.c | 28 ++++++++++++++--------------
> >  1 file changed, 14 insertions(+), 14 deletions(-)
> >
> > diff --git a/drivers/pwm/pwm-sifive.c b/drivers/pwm/pwm-sifive.c
> > index c1b412905d9e..cf3fcffe7b3a 100644
> > --- a/drivers/pwm/pwm-sifive.c
> > +++ b/drivers/pwm/pwm-sifive.c
> > @@ -41,7 +41,7 @@
> >  #define PWM_SIFIVE_DEFAULT_PERIOD	10000000
> >
> >  struct pwm_sifive_ddata {
> > -	struct pwm_chip	chip;
> > +	struct pwm_chip *chip;
>=20
> In patch 43 you do ddata =3D (void *)chip + sizeof(*chip). Shouldn't we
> be able to get
> the chip pointer from ddata using chip =3D (void *)ddata - sizeof(*chip)?

That would work, but I don't want to use that implementation detail in
lowlevel drivers. Also it's a bit obscure because not all drivers use
the driver data located after the pwmchip. Another difficulty is that
starting with patch #111 the memory layout changes and you can only
determine the chip from the driver data if you know the value of npwm.
(So you need information from the chip to get access to the chip. huch)

> >  	struct mutex lock; /* lock to protect user_count and approx_period */
> >  	struct notifier_block notifier;
> >  	struct clk *clk;

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dl7xnlpl5ldocfua
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVy53MACgkQj4D7WH0S
/k7wtgf/T6U1DOHuTPZ21jax2RKDCBQPjT0s9bekl8Zh1NrD/LEgdS9CKzNmUUWi
QUvnm6PQq21U+reg+hUXb8trHtjNz8EsoOiztng46a/kuHyXzWnsI0AlVaDd/PsD
QR8lMph4TkEkI+3Fz1gq4InsxpUL0c0PvwmKAoHLBEJiabQ18layuBqVspEpbvhz
P85JsW9FkwmY37WlSHELFulQlwUa6jcpzl3vUvwKiAuTyfhPAEu40c7GdwihUlWw
amh/JHmsiZSgARsXArh5JvAUQSqTTnrt2ltNmEyRTFOV3pw10erhfzFic7DxU3HL
ZoorcHgtGSrxnus5TGnPE1cXBj8K1A==
=OhXX
-----END PGP SIGNATURE-----

--dl7xnlpl5ldocfua--


--===============6189135391809693402==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6189135391809693402==--

