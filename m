Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03F9C433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 20:45:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t2EhVDNya+EoZWM+T+i25ByZe6Ii0Vz8WeA/oIHHUxM=; b=4d7vSawDfcNZyDsrKfvDAmGZVY
	3H4aptnfDkEdgEDotbK81wmXrlPVx+JGa6qxzK5yo0BXDjU4MZpCpncR4LQNmHmn2qDlo06xVjiy0
	PIPoH3nSEolw5bjqlR7U0GxQi0skUJjXwirXXP2yfVivedf44uj6X4CSCubIKfq7eLy5DnnFNlPKA
	SbAPLJY/lwyQi8Vmb7V9cHOcoar2vacacrTv4UcyBLAzLzl60w42SdeKdOsEZs71M+QjKxLq1QpoJ
	mlHoJLboUd0DyoIQpybbo86H3u4gYfjP81p1GlkyFkf0ni4xXrH12adIrl61UlAa4hhZOMNr6DPkT
	cpPrKOZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEd3I-00CFff-Il; Thu, 21 Jul 2022 20:45:44 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEd3F-00CFdc-R9
	for linux-riscv@lists.infradead.org; Thu, 21 Jul 2022 20:45:43 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEd36-0007cE-VT; Thu, 21 Jul 2022 22:45:33 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEd35-002NmU-4Y; Thu, 21 Jul 2022 22:45:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oEd34-006etl-Bn; Thu, 21 Jul 2022 22:45:30 +0200
Date: Thu, 21 Jul 2022 22:45:22 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Thierry Reding <thierry.reding@gmail.com>
Cc: linux-pwm@vger.kernel.org, Wan Jiabing <wanjiabing@vivo.com>,
	"Wesley W. Terpstra" <wesley@sifive.com>,
	Atish Patra <atishp@atishpatra.org>,
	Palmer Dabbelt <palmer@dabbelt.com>, kernel@pengutronix.de,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 6/7] pwm: sifive: Ensure the clk is enabled exactly one
 per running PWM
Message-ID: <20220721204522.rxmah6k66e5qe2kb@pengutronix.de>
References: <20220721103129.304697-1-u.kleine-koenig@pengutronix.de>
 <20220721103129.304697-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
In-Reply-To: <20220721103129.304697-6-u.kleine-koenig@pengutronix.de>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_134541_899583_741DCEC0 
X-CRM114-Status: GOOD (  10.02  )
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
Content-Type: multipart/mixed; boundary="===============7349191528810965615=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============7349191528810965615==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tw4bbsb5rcnz5y6s"
Content-Disposition: inline


--tw4bbsb5rcnz5y6s
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

[dropped Yash Shah from Cc, their email address bounces]

While browsing the list of open patches in patchwork, I noticed a typo:

$Subject ~=3D s/one/once/

@Thierry: Assuming you are otherwise happy with this patch, should I
resend for this typo, or do you fixup while applying it?

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--tw4bbsb5rcnz5y6s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLZutkACgkQwfwUeK3K
7Ak4jwf7B0aaBqdXkpF3FQrZPsipc/Vqc1BgGFhde6css7wDonrIajzx0QcrTjVw
l9BeiCddSj2WbeLz+gkxy/G6bZYA3NhlxdkALfaia93EVFRsI1SAAZPZWKt1sF3K
xjMe3i/33frybUvRoOekahbo5QJxKDibu859WrV0vsoMQ1SpWzihDSlUw0Uqaczs
KXKHC24OURPEkdtsvxYHEUZMEKCQ3kY8S1Gwyfc9c/PUfiNR1GDbfaEQPB0aEcg4
i7dySHXZ/WpVf18e0KIdk2GayszXcdoiuAUa8rn1shVw0yeJK9UTEU8z/hLnfqLZ
tZ6T80mq9WUnAft0aNWN3pO4G52Oag==
=iSjr
-----END PGP SIGNATURE-----

--tw4bbsb5rcnz5y6s--


--===============7349191528810965615==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7349191528810965615==--

