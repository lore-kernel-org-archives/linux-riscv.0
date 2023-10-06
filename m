Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A16FBE81E02
	for <linux-riscv@archiver.kernel.org>; Fri,  6 Oct 2023 14:45:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=//dHbKM129K9oWnBnM+VkK/agMXDD0YgJe0iSJNl1BQ=; b=v+UpGUnZzX9MAqLrvhlSCDHe9A
	wcvlWctBLahmf3abNRZgsIs6eA6ejal4g8QxBRcJessErvNdypPoQS0j+ZXChe8cwB7yqQ2lOqiKv
	G8Yqnx2Q42F879PpM6gn1XSap6/RdwiW3ry8T3Wzh/EqYDlBPqMbAtin09WEs5RskZoqCxvH2VVl/
	q9pQHuj64bGrLs50xd1rcwxnrx18+I2i5jb3L1w1433KZeRib6qRoARqZv75Z2j+ccJaxPWUeIEi1
	NHNGJko91bHIKjLNIdVMTojfg/hrW7bnqbWZSIIqzeWZmq6zZgjUxejZuW/xP0mkXgSgub39ReEpO
	BIYZKZcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qom50-0060UK-1G;
	Fri, 06 Oct 2023 14:45:26 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qom4x-0060TJ-1m
	for linux-riscv@lists.infradead.org;
	Fri, 06 Oct 2023 14:45:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qom4Y-0002UN-Rq; Fri, 06 Oct 2023 16:44:58 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qom4W-00BXaY-Dx; Fri, 06 Oct 2023 16:44:56 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qom4W-00AJrq-4D; Fri, 06 Oct 2023 16:44:56 +0200
Date: Fri, 6 Oct 2023 16:44:56 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org,
	Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Sean Young <sean@mess.org>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Vladimir Zapolskiy <vz@mleia.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	NXP Linux Team <linux-imx@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org, Fabio Estevam <festevam@gmail.com>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] pwm: make it possible to apply pwm changes in atomic
 context
Message-ID: <20231006144456.zybxv2pn4c37fpr3@pengutronix.de>
References: <cover.1696156485.git.sean@mess.org>
 <1bd5241d584ceb4d6b731c4dc3203fb9686ee1d1.1696156485.git.sean@mess.org>
 <20231004095920.ne7yrrthow6tnuvg@pengutronix.de>
 <ZR_hJ05h5O6SpM_D@orome.fritz.box>
MIME-Version: 1.0
In-Reply-To: <ZR_hJ05h5O6SpM_D@orome.fritz.box>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231006_074523_584650_7B829991 
X-CRM114-Status: GOOD (  23.83  )
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
Content-Type: multipart/mixed; boundary="===============3275132997774601398=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3275132997774601398==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="57x2r3oojyooxlif"
Content-Disposition: inline


--57x2r3oojyooxlif
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Thierry,

On Fri, Oct 06, 2023 at 12:27:51PM +0200, Thierry Reding wrote:
> On Wed, Oct 04, 2023 at 11:59:20AM +0200, Uwe Kleine-K=F6nig wrote:
> > On Sun, Oct 01, 2023 at 11:40:29AM +0100, Sean Young wrote:
> > > diff --git a/drivers/pwm/pwm-fsl-ftm.c b/drivers/pwm/pwm-fsl-ftm.c
> > > index b7c6045c5d08..b8b9392844e9 100644
> > > --- a/drivers/pwm/pwm-fsl-ftm.c
> > > +++ b/drivers/pwm/pwm-fsl-ftm.c
> > > @@ -405,6 +405,7 @@ static int fsl_pwm_probe(struct platform_device *=
pdev)
> > > =20
> > >  	fpc->soc =3D of_device_get_match_data(&pdev->dev);
> > >  	fpc->chip.dev =3D &pdev->dev;
> > > +	fpc->chip.can_sleep =3D true;
> >=20
> > As .apply() being callable in non-sleepable context only depends on
> > .apply() I think a better place for this property is in struct pwm_ops.
>=20
> What about drivers for devices that can be either sleeping or not? There
> are things like regmap which can abstract those differences away, so you
> could have a driver that works on both types of devices, so setting this
> in ops wouldn't be correct all the time. I think can_sleep needs to be
> per-chip rather than per-driver.

I would consider that a theoretic possibility. If there is a hardware
that has a (say) i2c and a memory-mapped register variant, I never
encountered such a thing. Hmm, the dwc driver seems to have a pci and a
memory-mapped variant, both would be "fast" though. (Wouldn't they?)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--57x2r3oojyooxlif
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUgHWcACgkQj4D7WH0S
/k7AkAgAuDF4yIt2iIMt7tFGHsc89qpaKIjDUSKxqgB4lz5w3E1CYWmOWOSFjuiU
bZpxAL0kQ59hMs24OJONQb7ZJrN2l1LuYC0rUBEgPh46tZXF9fQhEI8OtmsICxsn
tpEKsJB0Y3gRod2QvYDSu4vcVRFfXqZflcpDXeIA7bsTVV1KN/v6dqFX3zOKRKvu
7Y356VPxQOp6clwewkrvh5Jou1KF4IhKb4LOdPIRnTQlrOF8hx7efoOQmiwYUI9A
WrloVww0jolKUVUs/RnT+bOzfieEFHtSok2o9vMheSxETVtJcw/mfAucMQURNxF+
ykxzRqKEfm+5k6pp5by9MOO8KkmX/A==
=MC1V
-----END PGP SIGNATURE-----

--57x2r3oojyooxlif--


--===============3275132997774601398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3275132997774601398==--

