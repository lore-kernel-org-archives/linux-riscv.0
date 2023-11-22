Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B921FC27C40
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 22:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8MkkzupdPzGlOeErT9c5gibk2wIrzWntAKOb40tE/Ig=; b=u1PBkSKmaH9byBJduxPDq0r0Lj
	Pvv5NqG+RnGSRZhqOZNSenSl0tvzlCsDLiPt6pGThi7Kh3TdY5nop3N2lOfyRU7wgll4E4MMzlewX
	wM6ORUODxTgbL/O0KIVTeApU82cL8NtJIR727Xbe+4if8gOJJz5J1cuEy1VXAItEgK41wGSkx4akh
	0wzuX/GR3Bb9yEZsBpvzxCB8dD1rtW5aEQK2kH5kgm67qQIuKnU9yqP3c8avvvkAnm+Leq8v22j1z
	x5xRVhWAVL8YItDEMFHOXUf0cRS+XdSEQZgWWqVLhy8QEK3tLK9IYNXDOXiQAjAotp+F/KFL8kNiL
	Pxf48f/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5w1R-003F0h-2Z;
	Wed, 22 Nov 2023 22:48:41 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5w1O-003EzI-00
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 22:48:40 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5w1B-0000B4-U8; Wed, 22 Nov 2023 23:48:25 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5w1B-00AuMP-54; Wed, 22 Nov 2023 23:48:25 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1r5w1A-0064oh-Ru; Wed, 22 Nov 2023 23:48:24 +0100
Date: Wed, 22 Nov 2023 23:48:24 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor@kernel.org>
Cc: linux-pwm@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Thierry Reding <thierry.reding@gmail.com>, kernel@pengutronix.de,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 070/108] pwm: microchip-core: Make use of
 devm_pwmchip_alloc() function
Message-ID: <20231122224824.ar7p5avoahcc737c@pengutronix.de>
References: <20231121134901.208535-1-u.kleine-koenig@pengutronix.de>
 <20231121134901.208535-71-u.kleine-koenig@pengutronix.de>
 <20231122-endanger-extenuate-97ef77b117da@spud>
MIME-Version: 1.0
In-Reply-To: <20231122-endanger-extenuate-97ef77b117da@spud>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_144838_035513_DDB412B1 
X-CRM114-Status: GOOD (  15.40  )
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
Content-Type: multipart/mixed; boundary="===============4677978158853747789=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4677978158853747789==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aozsxgemqxos4exo"
Content-Disposition: inline


--aozsxgemqxos4exo
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Wed, Nov 22, 2023 at 11:14:21AM +0000, Conor Dooley wrote:
> On Tue, Nov 21, 2023 at 02:50:12PM +0100, Uwe Kleine-K=F6nig wrote:
> > @@ -65,7 +64,7 @@ struct mchp_core_pwm_chip {
> > =20
> >  static inline struct mchp_core_pwm_chip *to_mchp_core_pwm(struct pwm_c=
hip *chip)
> >  {
> > -	return container_of(chip, struct mchp_core_pwm_chip, chip);
> > +	return pwmchip_priv(chip);
> >  }
>=20
> I know this is likely a coccinelle job, but can we now delete things
> like to_mchp_core_pwm() if there's a standard helper for this now?

An upside of keeping this helper is that it yields the right type.
pwmchip_priv() returns a void *.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--aozsxgemqxos4exo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmVehTcACgkQj4D7WH0S
/k4sEQgAloBPZuZff4mYKJMDwBWh2FfgW5dNxrj6ZWelh56IRMsWWtWUJSrq7E56
OY6aW3qI/2vlbrsZ/nlCoX93nb+wyKAYN/m5MqRipjDcZr6RXEhAQhEFQu4JaG07
ksZPvzkCBgO0XdLx5g4KAYx7Y88Ip3P4NrmzOeJu1GnJx898sH4iFmsIwMl87cz6
ORqsyVOk4fJInd6I+pm9Y2pk5KtHfuVJkZlu/ElNso2wOLK3ca+pX1kW5DwI59IP
K7gmPTEIWzH38SXpjdhrjVMUoxeFWOPqKNjgBKJqt5gSsQjeZzFLAJF+jYfWUNTS
PLBeRZqgKIha/qSHqMPcbrCOUU2Rlw==
=eq0a
-----END PGP SIGNATURE-----

--aozsxgemqxos4exo--


--===============4677978158853747789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4677978158853747789==--

