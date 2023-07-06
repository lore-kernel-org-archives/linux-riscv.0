Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB303EB64D9
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jul 2023 20:21:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kAjTc8MHvKNtL3aSssuio14q2HBojQGEhGR0nKobJW4=; b=qBkjdn2rPbrbGD7mRddQWu66Lo
	I0dGoWbqwEVSnGa5I6/ixabK+9VbewnlTU9yJWWRY6HuH06alnu+c3c57DeQPBlAVJRPYDPCcMTk/
	vfPIKiiv0FfJgX81Haug2bS/AFnHokLswJl/UyQgAaw02aj6d7ZCp8gpGSVBiWzHS5izNylONcNJn
	0aKvnYg6fiXeIcZ/HYYlB6toiD3rcQ+8dNAGjbOSsuxe2IvWsW7IS+ee5YXsAGD22CdxowRZser3G
	tGl6pEz/svDyjmInocfqkc5MFE+GSIgAlgBCcp/uA/2bLcZTDDV7p1/GIH0DW447taj7le3OaUgWX
	b6LCiCcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qHVTq-002b08-0K;
	Thu, 06 Jul 2023 20:21:34 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qHVTm-002aye-2g
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jul 2023 20:21:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTK-00079V-RD; Thu, 06 Jul 2023 22:21:02 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTG-00Ca44-Ox; Thu, 06 Jul 2023 22:20:58 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qHVTG-002pmZ-02; Thu, 06 Jul 2023 22:20:58 +0200
Date: Thu, 6 Jul 2023 22:20:57 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: privatesub2@gmail.com, linux-kernel@vger.kernel.org,
	thierry.reding@gmail.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
	p.zabel@pengutronix.de, cristian.ciocaltea@collabora.com,
	Greg KH <gregkh@linuxfoundation.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <20230706202057.k6rfwfhe3msfkrc4@pengutronix.de>
References: <20230627082334.1253020-1-privatesub2@gmail.com>
 <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
MIME-Version: 1.0
In-Reply-To: <mhng-0cca3d46-6031-4e8a-8e8f-2c479a20b95d@palmer-ri-x1c9a>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230706_132130_892672_2D562E2F 
X-CRM114-Status: GOOD (  23.95  )
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
Content-Type: multipart/mixed; boundary="===============0865614365084504932=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0865614365084504932==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bwmf3jgjaq2y6ndf"
Content-Disposition: inline


--bwmf3jgjaq2y6ndf
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Jul 06, 2023 at 10:08:47AM -0700, Palmer Dabbelt wrote:
> On Tue, 27 Jun 2023 01:23:23 PDT (-0700), privatesub2@gmail.com wrote:
> > Hi,
> >=20
> > This series adds support for PWM controller on new
> > Allwinner's SoCs, such as D1, T113s and R329. The implemented driver
> > provides basic functionality for control PWM channels.
> >=20
> > v2:
> >  - fix dt-bindings
> >  - fix a remark in the driver
> >=20
> > v3:
> >  - fix dt-bindings
> >  - fix sunxi-d1s-t113.dtsi
> >=20
> > Aleksandr Shubin (3):
> >   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
> >     controller
> >   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
> >   riscv: dts: allwinner: d1: Add pwm node
> >=20
> >  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  86 +++++
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  11 +
> >  drivers/pwm/Kconfig                           |  10 +
> >  drivers/pwm/Makefile                          |   1 +
> >  drivers/pwm/pwm-sun20i.c                      | 322 ++++++++++++++++++
> >  5 files changed, 430 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun=
20i-pwm.yaml
> >  create mode 100644 drivers/pwm/pwm-sun20i.c
>=20
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>=20
> I'm not sure if this ended up somewhere, but I'm assuming it's not aimed =
at
> my tree.  LMK if you guys want me to pick it up, I'm dropping it from
> patchwork.

At least patch #2 should go via the pwm tree. It's on my list to review.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--bwmf3jgjaq2y6ndf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmSnIigACgkQj4D7WH0S
/k6gIwgArBV+EKUdCW1iBFu0o7FWEVZpy0poxb9iDyJN0csWczfWqJw3UbnGdVrq
l8Nt25eIW8lbOaL7Xl1hK49QCeuWFkt7IRk+ZYzD4coLOcK87MrJNJe43SDBOAXX
LiHvL22jR6y5aNpiAgTiXW6mYnX9qrz6cAUzTKqeOqm/s4bwuWR13jHpTQ6lOt1F
w3LuV9R5h38LqFjfPCbQxgstp5816SdoBIiwitKZfyBfCPt7yYDpAq2zn0OQmp2k
cKkqQEOGqE+IzH046/h0PdsmBc7wPqrG+5/GSvdPt6sa2aUkF2TO5nbjaaK/w+GJ
F+8Bd8vtafCPp+QmG+fV9IcYTEqZ6Q==
=VC6G
-----END PGP SIGNATURE-----

--bwmf3jgjaq2y6ndf--


--===============0865614365084504932==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0865614365084504932==--

