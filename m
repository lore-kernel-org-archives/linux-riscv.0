Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A5EEC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Feb 2022 08:20:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=06ftINx5BRQFk/TOn025qyQeq0HX/r6r2l5pGyxZbrI=; b=PKlWa2KrxA8QHKPf9owQvAUcLG
	/KfHwy1FVTVVrvQLUmCitkHLqmG/LRoPhNNgv+X0ql0nzf3eunw1vg5imZtJvkd9GVaiOtiY6TcXy
	b9UT78i+y02b0n3uqSfeFbLjeevxSvUFaECrPCd+E1GDSxVX4/pDQwff5REDyo7jf7HxllPuud1IU
	/QfrLY1pk69GPIztTcyMwc/w5tZiPsqBzuWUFkaYbPv+1mG3q47BGedf2SED3RKoWZY8ny/z2yKaN
	x8U6qAoVRFoll4dfoVYOdhKucx+w3H/bk+hrgNbwvNaIorTbhtAflsJwHY6wL16NE0xBZVdOZS7Gm
	Yr1OcFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nMmt1-00DEdP-M2; Wed, 23 Feb 2022 08:20:35 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nMmsy-00DEcM-Oy
 for linux-riscv@lists.infradead.org; Wed, 23 Feb 2022 08:20:34 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
 by metis.ext.pengutronix.de with esmtps
 (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256) (Exim 4.92)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMmsn-0001hh-Uq; Wed, 23 Feb 2022 09:20:22 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
 by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMmsm-000mFQ-1R; Wed, 23 Feb 2022 09:20:19 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
 (envelope-from <ukl@pengutronix.de>)
 id 1nMmsk-004z5V-Gb; Wed, 23 Feb 2022 09:20:18 +0100
Date: Wed, 23 Feb 2022 09:20:18 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Cc: conor.dooley@microchip.com, linus.walleij@linaro.org, brgl@bgdev.pl,
 robh+dt@kernel.org, jassisinghbrar@gmail.com,
 thierry.reding@gmail.com, lee.jones@linaro.org,
 a.zummo@towertech.it, alexandre.belloni@bootlin.com,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 geert@linux-m68k.org, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-pwm@vger.kernel.org, linux-rtc@vger.kernel.org,
 linux-riscv@lists.infradead.org, lewis.hanly@microchip.com,
 daire.mcnamara@microchip.com, ivan.griffin@microchip.com,
 atishp@rivosinc.com, Rob Herring <robh@kernel.org>,
 Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH v7 05/11] dt-bindings: pwm: add microchip corepwm binding
Message-ID: <20220223082018.degrftmxpk5uc6xn@pengutronix.de>
References: <20220214135840.168236-1-conor.dooley@microchip.com>
 <20220214135840.168236-6-conor.dooley@microchip.com>
 <20220223062018.nbgidqxgh2soz625@pengutronix.de>
 <65edc257-82ec-e100-7a44-5c510aba51ce@canonical.com>
MIME-Version: 1.0
In-Reply-To: <65edc257-82ec-e100-7a44-5c510aba51ce@canonical.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de);
 SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220223_002032_822003_3F97A819 
X-CRM114-Status: GOOD (  19.09  )
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
Content-Type: multipart/mixed; boundary="===============7054499311053861464=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7054499311053861464==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="iwzv2cqxmtoj6ivg"
Content-Disposition: inline


--iwzv2cqxmtoj6ivg
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 23, 2022 at 08:12:49AM +0100, Krzysztof Kozlowski wrote:
> On 23/02/2022 07:20, Uwe Kleine-K=F6nig wrote:
> > On Mon, Feb 14, 2022 at 01:58:35PM +0000, conor.dooley@microchip.com wr=
ote:
> >> From: Conor Dooley <conor.dooley@microchip.com>
> >>
> >> Add device tree bindings for the Microchip fpga fabric based "core" PWM
> >> controller.
> >>
> >> Reviewed-by: Rob Herring <robh@kernel.org>
> >> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> >> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> >=20
> > I like it:
> >=20
> > Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>
> >=20
> > nitpick: Put your S-o-b last in the commit log. (This doesn't justify a
> > resend IMHO)
>=20
> It should be the opposite - the first. First author signs the patch,
> then comes review and finally an ack. Putting SoB at then suggests that
> tags were accumulated before sending patch, out of mailing list.

well, or in an earlier revision of this patch as is the case here. One
of the ideas of S-o-b is that the order shows the flow of the patch
states and if this patch ends in git with:

	Referred-by: Rob Herring <robh@kernel.org>
	Singed-off-by: Conor Dooley <conor.dooley@microchip.com>
	Backed-by: Palmer Dabbelt <palmer@rivosinc.com>
	Singed-off-by: Peter Maintainer <pm@example.com>

I'd expect that Backed-by was added by Peter, not Conor.
(Modified the tags on purpose to not interfere with b4's tag pickup, I
guess you humans still get the point.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--iwzv2cqxmtoj6ivg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmIV7j8ACgkQwfwUeK3K
7Aloogf+O25Xs80EkRbZcoT53Op4Qz+T2M0ldDqTk6fHIxcR3qzb7m74O1AGSR3K
UfR9clLI5oaiJ77rpUJrj755Va3JCOlPiwB14+LakdvvjWlnf+z7h+DC892GcAaj
ML4S91q/Y/ORSl0189iTfICN78MRMs6UWjVJWX3wV/HqeFQi3fSMNXTjQ8IC6LYe
GWMVhC3eYpSFxsdqMDeAaEX6CChb0CwfAwMzWxrOt+6sFPfimaOMz4HgHpJsn1bf
qTj64t9fgifBN41OJNqirl2R2mPxKn/McocqNmDFj+o1DyQ0ikT1sqGFTjnEN3fl
I/W+Pfdxw50SJZHNxfcDTll9wibNTA==
=Be78
-----END PGP SIGNATURE-----

--iwzv2cqxmtoj6ivg--


--===============7054499311053861464==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7054499311053861464==--

