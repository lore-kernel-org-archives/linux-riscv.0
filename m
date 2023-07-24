Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08FCBC0015E
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 08:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ViyOo98jDEdJQud/+b1gBtcPeGotnBBA/TX5iCtsd3w=; b=cMlF8HZseKv5f2092iht84Z3ww
	G/mOqw725TBhJJReT9WZjJMrUrguGZvyhyuabTnBVa+GOqz0M8qStJboONLPJf5KtDn7wcK1rLjud
	q4lx9HShz0RL3RsfVYZzJhkuTBwgosNMNy4P3wSiNouKIpguVtY+mvA5chnU4Ppn+WX894y9g9r1Q
	ogvIFlF0vMxdSnh70YLkrSsnQR6MLjErOg14onTG5h3IxGbGu26MyPOiDpewmp/cy+fxmKSFkvOlW
	rJzrxE0y8ScSHuBu0MDtfLkVrR1qkzHED64jkvo4IJ+MFqhc1rEGls4z3NN7vsvC4dcUt3kukmrcZ
	HY/b/IAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqvC-003Fk0-0M;
	Mon, 24 Jul 2023 08:28:02 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNqv8-003Fig-38
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 08:28:01 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qNquo-0007RN-JQ; Mon, 24 Jul 2023 10:27:38 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 53E021F8389;
	Mon, 24 Jul 2023 08:27:33 +0000 (UTC)
Date: Mon, 24 Jul 2023 10:27:32 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: John Watts <contact@jookia.org>
Cc: linux-sunxi@lists.linux.dev, Wolfgang Grandegger <wg@grandegger.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-can@vger.kernel.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 0/4] Add support for Allwinner D1 CAN controllers
Message-ID: <20230724-paving-pep-4c3ca2fae261-mkl@pengutronix.de>
References: <20230721221552.1973203-2-contact@jookia.org>
MIME-Version: 1.0
In-Reply-To: <20230721221552.1973203-2-contact@jookia.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_012759_008267_C849F6E9 
X-CRM114-Status: GOOD (  17.05  )
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
Content-Type: multipart/mixed; boundary="===============5535172034981399135=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5535172034981399135==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="bzzg2zjmqpjfr7ls"
Content-Disposition: inline


--bzzg2zjmqpjfr7ls
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 22.07.2023 08:15:49, John Watts wrote:
> This patch series adds support for the Allwinner D1 CAN controllers.
> It requires adding a new device tree compatible and driver support to
> work around some hardware quirks.
>=20
> This has been tested on the Mango Pi MQ Dual running a T113 and a Lichee
> Panel 86 running a D1.

Applied to linux-can-next/testing.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--bzzg2zjmqpjfr7ls
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmS+NfAACgkQvlAcSiqK
BOg8Kgf/eJt24Ndvcmh6L+eNtFLgI9sT0zZeRNAKl9MJzbRclkN9kj5PSwfjjXt9
UyBuvnxjyHDs81oanjq0yLh673plo1Q+PH2S9bx2q0GuWxudK8fIS7K6C3FBO5EI
cvoAK6cyy33+7LUR7X7w0/0cs8jPUS8znJh7iw3fhr+R9fW+uTzoMDxQsDi9duf7
OPTBCOiiAnBajqy16/sxFHIyUFAHWYGs0RCgGEu1g4oW8JyPAr4lznp2wEYAPVeX
oNjCnvJrfNPTqFbIKV9dY8GaYA765qy11toqYmpv/WCxMAOKO52ElS0dko5+nt8S
ykN0k7XY6EzIqvbjvWh8AzhNvO8Gog==
=cUGJ
-----END PGP SIGNATURE-----

--bzzg2zjmqpjfr7ls--


--===============5535172034981399135==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5535172034981399135==--

