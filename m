Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6CFE7C46467
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jan 2023 09:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xG4fpg/GsPnD8V3JM4s87xWZVc76ZKvm7j5o5+7YJtM=; b=szfAbdudoFTZCPHIWDJzH7CPab
	N0LQU4dpLUVs1sqpKvGWwpgcQNC2fcN7TyvYTZ+FKeokmHEA4TLlaHKzf2TZUVFeecB+34jv0sOhr
	lx+koLkaZuO9AL2Qxv72J14WkhsFQ/3pHjc2KCVgXI7xSJ4wPpsBr6E4uP5cRaY/+k4no3eyutoI8
	zJi0jpnadpnl/YWUg9xHEExE1Q0NpinIdAqpqSmTkmJLaL7OLY9JLH50Sis7w2JN5ST5blqt5MbLw
	nW6YFF0HC+GiaplyTaLJzBXdlUmxiDx7DiYfjhs7elLrjOAAAjIb2SxO7KILX1ltzBTEzCDkCqrg+
	FJlxZbew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXD5-00AVIm-2P; Wed, 11 Jan 2023 09:15:51 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pFXD2-00AVI4-6x
	for linux-riscv@lists.infradead.org; Wed, 11 Jan 2023 09:15:49 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFXCj-0003bM-QK; Wed, 11 Jan 2023 10:15:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFXCi-005GgP-TK; Wed, 11 Jan 2023 10:15:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1pFXCi-00BveW-8A; Wed, 11 Jan 2023 10:15:28 +0100
Date: Wed, 11 Jan 2023 10:15:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v13 1/2] pwm: add microchip soft ip corePWM driver
Message-ID: <20230111091528.dh4nlk4xlpgn6paw@pengutronix.de>
References: <20221221112912.147210-1-conor@kernel.org>
 <20221221112912.147210-2-conor@kernel.org>
 <20230110224805.3pqxd3yv4wyci2zj@pengutronix.de>
 <Y73/oUwuOwQFR0NZ@spud>
 <20230111070250.w7egzcufa4waxg2n@pengutronix.de>
 <Y75ss+aSCjx7E9SZ@wendy>
MIME-Version: 1.0
In-Reply-To: <Y75ss+aSCjx7E9SZ@wendy>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230111_011548_268234_35224421 
X-CRM114-Status: GOOD (  15.70  )
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
Content-Type: multipart/mixed; boundary="===============1158853228108985186=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1158853228108985186==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="6gsm32m6fyt25ymx"
Content-Disposition: inline


--6gsm32m6fyt25ymx
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Wed, Jan 11, 2023 at 08:00:51AM +0000, Conor Dooley wrote:
> > > [...]
> > > Perhaps I need to watch a lecture on how to write a PWM driver since I
> > > am clearly no good at it, given the 15 revisions. Do you know of any?
> >=20
> > I'm not aware of such a lecture.
>=20
> I thought you were doing one at FOSDEM!

Oh that knowledge already spread? Anyhow that doesn't help you today
:-)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--6gsm32m6fyt25ymx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmO+fi0ACgkQwfwUeK3K
7AklXAf/WNPDNf10f5a7E1fnSiX74OV7ET+g8/DfocYVDgMGuXcplwCLnXNk6a05
iD98QEPw3H4wH5bMGsEMhJ8gFWvvmbF+T0U62n0EpKIo9OlB30ICh8lSOnbTsrJw
KLbfjnk0pLWMnkA5QD3RHOli7WIP5d8RIUNDuufetrwEJCPuu2p7vvpkEBgSlvbX
S5SswsoTW5v82AeDhudq3lQkahbqOOVXG2IQoU+QozB+8gFaKZi6UL7ZpZ1+RUB8
f9UuLZZAVt2sOWEh9K6SxOhqxl28FXVUQuLvN/r8TPEoPPWM0BBYs7vhM6znP3I3
qfYSJ89UqAR4MbjXsrETyVbThuRvkQ==
=HCWT
-----END PGP SIGNATURE-----

--6gsm32m6fyt25ymx--


--===============1158853228108985186==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1158853228108985186==--

