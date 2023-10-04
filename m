Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E70BE7B61D
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 14:03:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tvdyn5B5/q+7d/JkQ6MeGSQEYWDJf6d5OYGrtys2xPc=; b=bkuNW9h4J36UMbsROWmxjCez0e
	nAGa4gslGju8555h1lUuPqdffvibra1r9wLpq48eZnQG9OdGkluogmlA7fHCXDYDh8rNkgFR3TOYm
	UvYIL5A5SS1lL93FKAUnYkMwI78VKarSfKsPkj63HiMSyPHUhzb+2u3wh6AWf/eFus2n91yxYeHl/
	1yMJ18eqcUNugOqAL6R/9hF21FaL8Gi8S/XeU2v3lFMKX/jxXztosx5DzyoQVlZdrAoL7o8+mHShN
	zRFJKeJvnjsZ+/W1eG9ZrczisCOMwTd+e3mjNlefQAcIZM5HKwqi3csvFCxSfBmJxo4cAGGIEuKpA
	ILFStExg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2Sx-000B1n-1x;
	Wed, 04 Oct 2023 14:03:07 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo2Sv-000B1L-0k
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 14:03:06 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo2Si-0007mV-CC; Wed, 04 Oct 2023 16:02:52 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo2Sh-00B3H0-R7; Wed, 04 Oct 2023 16:02:51 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qo2Sh-0090zY-Hq; Wed, 04 Oct 2023 16:02:51 +0200
Date: Wed, 4 Oct 2023 16:02:51 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Thierry Reding <thierry.reding@gmail.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/2] dt-bindings: pwm: Add T-HEAD PWM controller
Message-ID: <20231004140251.smwazlizo5nmpz2a@pengutronix.de>
References: <20231004092731.1362-1-jszhang@kernel.org>
 <20231004092731.1362-2-jszhang@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20231004092731.1362-2-jszhang@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_070305_265910_46139558 
X-CRM114-Status: GOOD (  10.95  )
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
Content-Type: multipart/mixed; boundary="===============6760856634210669301=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6760856634210669301==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="yyfa3baivxpuqfl7"
Content-Disposition: inline


--yyfa3baivxpuqfl7
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Wed, Oct 04, 2023 at 05:27:30PM +0800, Jisheng Zhang wrote:
> +  "#pwm-cells":
> +    const: 2

Please make this a 3.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--yyfa3baivxpuqfl7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUdcIUACgkQj4D7WH0S
/k4h8Qf+Ia6dnze4AFsN9pYFc9wi8+dnrkfW8vPHngsUX7UMRjp24RuetCeLpPNf
zdAp8DHO10gQMncXwM/JXMlLg+OC7PJ3YhdFLq6HZbLrvwO0sOITHr5q087tpaRN
h27NkHMGILH3rYFSqni0nRxNCH+gwbrZ8OpAyCO1XjwtCYWTBpp/E+V+VZAxQUyd
Q8j2aoCE9p4+vJvCYoUomWm9S3b0UT/6Odw/mAbrghFXaTx+8YUDznQPuQx+pBQB
H4ZFpmHmkTJ42/cU6Q2yGxwmjkmhWyPfusUesmbOpV9QKj7aGuFXBE5N6PZ2Uu3I
KaxuEG8+CwEWzxuQDssUrTrXf8JGpQ==
=2coh
-----END PGP SIGNATURE-----

--yyfa3baivxpuqfl7--


--===============6760856634210669301==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6760856634210669301==--

