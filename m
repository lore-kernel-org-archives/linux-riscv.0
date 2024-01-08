Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171F5C47079
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 21:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gde7LGBLQiI0Ogmx7O9ZGQLrKZqad+wPY1vQoeH0Gqg=; b=4xZNL63v0qkzP3rx22+2CggW+l
	kdGXqXNYqjDoZYSbu5lIkV8nBB/wwkKPtjDY37+bCO4AuO/fQv6TioV9zOzGrvMyPk9JKN2fc7YwO
	uk/bJqTN8EHYMjJaBQofADSL1vtetSZJTlVuSbb0Ar564OXAXEZvGH0mDUWt6c432F9Kh+x0oQEwp
	MTUBQExCVYDfE1cD/sC2vXPyDCLY5PDEhIwn7XZsHS2vdg7ZykPdqT4I7eeBR7DyzFNg6nKFyIOzL
	rctkxwdLeRzPyRogHg0ztxfy5BQQpZlKvJOF2ahY3Zscw/kiv/Fkskao+YpcDZLvVlX965+E3BTte
	WOriKgUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwmv-006Ep7-05;
	Mon, 08 Jan 2024 21:04:01 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMwmr-006Eof-0r
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 21:03:59 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rMwmn-0007Sw-0g; Mon, 08 Jan 2024 22:03:53 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rMwmj-001KoV-Ei; Mon, 08 Jan 2024 22:03:49 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rMwmj-005EcE-0e;
	Mon, 08 Jan 2024 22:03:49 +0100
Date: Mon, 8 Jan 2024 22:03:49 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <conor+dt@kernel.org>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 1/4] dt-bindings: pwm: Add bindings for OpenCores PWM
 Controller
Message-ID: <p22vjdwk35yc66mb4pkntnst6kjyhhmnv3eb2n25c3dhi5bdeo@bj7amwepprab>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-2-william.qiu@starfivetech.com>
 <t3w2p765fs633nanqsx5yqres7taqpk6juwyl4iex5v4jpobo2@rqw6r4myjmv3>
MIME-Version: 1.0
In-Reply-To: <t3w2p765fs633nanqsx5yqres7taqpk6juwyl4iex5v4jpobo2@rqw6r4myjmv3>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_130357_326455_5B5E4712 
X-CRM114-Status: GOOD (  14.95  )
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
Content-Type: multipart/mixed; boundary="===============5620494071868407823=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5620494071868407823==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qdsxa55awznoyul6"
Content-Disposition: inline


--qdsxa55awznoyul6
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Conor,

On Thu, Jan 04, 2024 at 11:43:13PM +0100, Uwe Kleine-K=F6nig wrote:
> On Fri, Dec 22, 2023 at 05:45:45PM +0800, William Qiu wrote:
> > Add bindings for OpenCores PWM Controller.
> >=20
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> > Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> > Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
>=20
> Looks fine to me. I'll assume you reiterate the series for patch #2 and
> so I will mark this patch as deferred in patchwork.
>=20
> Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

If you want, pick this patch up that it goes along with the dts changes.

To make this formal:

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--qdsxa55awznoyul6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWcYy8ACgkQj4D7WH0S
/k5Cxgf/QI/V+M0FjuVw/kgYUfVX9XsL67vIUwYey8CNZjcTRYrd1pch6cjV4Uxa
Oq7ZKp7LpMxt6yLwKcI9vZHav86KPKPI+CaZtMpC2OuYqEo4ltygCMOUJrXoJnDU
epVaCEiIS5e3vsOZ35EWGQeOpXUV/xHHNA4VIKfI1F4arIpPvlS6J3t8h/8nICpQ
jk8Fk0X2HRqdy+kX0P6kSaQFBDBIFS/zRYI0ahlgLWEOGPj7dfpYa6Oqj7sXiZZP
Mta2dmEwn4C10rTk7Pa7Y/RtpsYU2EVPiqaaHqgbTKrzpFPIPldMS4+f7CTYiKWD
/s4YD833V/0aPhWZHYCGEQmTv4NlBw==
=5dXp
-----END PGP SIGNATURE-----

--qdsxa55awznoyul6--


--===============5620494071868407823==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5620494071868407823==--

