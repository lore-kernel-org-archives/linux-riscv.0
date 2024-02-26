Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC32C5478C
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Feb 2024 08:12:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89BogIz2BI4pN/HiwWBgR6i2HEEoSWE7qfXY1bIjCoY=; b=YiJZKKbjnU0P319JpIoJykphZo
	+bh/peolcbYH3K6YXfxHvMLVJyxJcqlL7UJvwxYVcYJbJw9AqTp3iF/R6ZBM8DMYjNbPUdaR9IrqB
	LboL7J2bFKBEbTXvD/fsVifMD8TnvDr9ygvY5IRMsQyHNnjjn+0+4ls3+maFCcqayy8TUXjL4MU3Q
	WfKgG/i0L9QZcZijADHyqfTWo2WSTXs0zPwLJDvbG/Qa76GSCzE5w2xVKBqI6TxcQXwlWVjUU34ir
	Kbqw6dFAScSkWEVojT6NG/WBAQyZciYxIQiDIZG8UOQE7FXKRsW+TAXK+lRokdJCMFfJDz6OzyBuh
	iB/5omAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reW5i-0000000GwFI-3Zkj;
	Mon, 26 Feb 2024 08:12:02 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1reW5f-0000000GwB6-0Qw3
	for linux-riscv@lists.infradead.org;
	Mon, 26 Feb 2024 08:12:01 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1reW59-0007kh-6J; Mon, 26 Feb 2024 09:11:27 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1reW55-002xHu-LS; Mon, 26 Feb 2024 09:11:23 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1reW55-00BVKV-1q;
	Mon, 26 Feb 2024 09:11:23 +0100
Date: Mon, 26 Feb 2024 09:11:23 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, 
	Conor Dooley <conor+dt@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	William Qiu <william.qiu@starfivetech.com>, Ley Foon Tan <leyfoon.tan@starfivetech.com>, 
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH] dt-bindings: pwm: opencores: Add compatible for StarFive
 JH8100
Message-ID: <opzxowacxsagwgw3l33p6y7omzjokus2bi3ol5wizfwjwi2s44@3p5frb4ysji7>
References: <20240226033945.816974-1-jisheng.teoh@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20240226033945.816974-1-jisheng.teoh@starfivetech.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240226_001159_188362_3B5D771F 
X-CRM114-Status: GOOD (  13.66  )
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
Content-Type: multipart/mixed; boundary="===============4464631810088978062=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4464631810088978062==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rca4flnr32kuc7cm"
Content-Disposition: inline


--rca4flnr32kuc7cm
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Feb 26, 2024 at 11:39:45AM +0800, Ji Sheng Teoh wrote:
> StarFive JH8100 uses the same OpenCores PWM controller as JH7110.
> Mark JH8100 as compatible to the OpenCores PWM controller.
>=20
> Signed-off-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Signed-off-by: Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
>=20
> ---
>=20
> This patch depends on patch [1] ("dt-bindings: pwm: Add bindings for
> OpenCores PWM Controller") in Conor's riscv-dt-for-next branch.
> [1] https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/commi=
t/?h=3Driscv-dt-for-next&id=3D2529085831b01fcd02ff58ab4e2596d3b31bcf80

I recommend to make use of git format-patch's --base parameter to
additionally(!) make this information available to the build bots.

Looks fine to me.

Acked-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Coner: If you're happy with this patch, please apply it in the same way
as the initial OpenCores PWM Controller binding patch.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--rca4flnr32kuc7cm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmXcR6oACgkQj4D7WH0S
/k7wTQgAsgA+AFOOP3+++k2BuC4anQCkeyI3AcDzpTBTk5QyC+DV7CR82aNjU5Sr
zdmvrqgBqdnBfCed75PotH8o0HeH7omhQ7kOys5qBs3G0fhi7jxQTr/gHd9twA4R
LlOdBlm9CSakAKEv9jbag0k//CYif0aGsf0cTNpF2RX6+gkoj5iOFbRkVd3gtizu
fbuLkbQ/2M3K4NZN5Tf8cAjU9FKEza5KU9xO+PhOIUGiis9F7ccSkv40PVj1rz7m
fbP85x6bvFBU+2bReKeA+GFCksHyItrMNLDktayQYjr9ktyxIZdARrB/astRo55s
LcZaVDOA+uw0EMm4M/y+U8HI8xdvww==
=8D5M
-----END PGP SIGNATURE-----

--rca4flnr32kuc7cm--


--===============4464631810088978062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4464631810088978062==--

