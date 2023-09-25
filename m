Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF374CE7A81
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Sep 2023 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4vkXGTkIRdjE2Do2xCsUI+jKJ5jS8V8vERU2De9fCXk=; b=xJFqNEJpkQRr1ylgrydSzQY6U1
	STWOD/ojaaJOkVV7xIRo5lHTBPTynD2FX1PbT433L05MZgGnBTmqAfTPNgj7lboseZFNrx0n8L9Tz
	5o8p+qT+n+U7rNe1+vS9lYTp6QMJrQgsCuFgwN7s8hSOQvtcqMOIS+uR8NeBcfj5nmFiVmgsMMNLA
	Q5OHywYuP/33Bl3T9ZqfQNARY1bIGqx2RrR/1sp/nsbc66WVu3eN0ShAQPZzsKl9J6BWT/EKK3RvE
	jpTITLuAxObrx92/sW3SLydgZm9pp7MQc+8MoxUqufmXZEpY+TPCuO9iKc+6x28v2JTjjgtYUSyeZ
	UUIAx96Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkks0-00EGPA-17;
	Mon, 25 Sep 2023 12:39:24 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkkrx-00EGNa-0O
	for linux-riscv@lists.infradead.org;
	Mon, 25 Sep 2023 12:39:23 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkkrs-0002iA-UL; Mon, 25 Sep 2023 14:39:16 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkkro-008sBk-4H; Mon, 25 Sep 2023 14:39:12 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qkkrn-004fbH-Qd; Mon, 25 Sep 2023 14:39:11 +0200
Date: Mon, 25 Sep 2023 14:39:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-pwm@vger.kernel.org, Emil Renner Berthing <kernel@esmil.dk>,
	Rob Herring <robh+dt@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hal Feng <hal.feng@starfivetech.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v5 2/4] pwm: starfive: Add PWM driver support
Message-ID: <20230925123908.4hohhjarviwattgw@pengutronix.de>
References: <20230922092848.72664-1-william.qiu@starfivetech.com>
 <20230922092848.72664-3-william.qiu@starfivetech.com>
 <CAJM55Z8d368MAQPpnRO8giKmasN5XETP40i3JVdW_0gTF3Ktqg@mail.gmail.com>
 <ade1c061-63d8-8b48-b8e2-69416cd8aa48@starfivetech.com>
 <CAJM55Z83VUkoTNCMbd9GJ7NpwgeQqMjCxPmYonEAXBjr5Tx9Zg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z83VUkoTNCMbd9GJ7NpwgeQqMjCxPmYonEAXBjr5Tx9Zg@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_053921_158391_874BF191 
X-CRM114-Status: GOOD (  18.11  )
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
Content-Type: multipart/mixed; boundary="===============1948020529346606786=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1948020529346606786==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xq7ehyumhkwfir4g"
Content-Disposition: inline


--xq7ehyumhkwfir4g
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Sep 25, 2023 at 10:31:49AM +0000, Emil Renner Berthing wrote:
> William Qiu wrote:
> > The PTC, short for PWM/TIMER/CONUTER, comes from OpenCore's ip, but onl=
y PWM
> > mode is used in the JH7110. So the register still has the word "PTC".
> > s the best way to change all the prefix to STARFIVE?
>=20
> I see. Yeah, since you're only using the P from PTC the PTC name doesn't =
make a
> lot of sense anymore. I'd just call this whole driver
> STARFIVE_PWM_/starfive_pwm_ consistently.

I don't care much how the driver is named iff there is only a single
type of hardware unit on this platform that can be used as a PWM.
However if the hardware manual calls this unit PTC I'd at least mention
that in a comment at the top of the driver.

Thanks
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xq7ehyumhkwfir4g
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmURf2wACgkQj4D7WH0S
/k6D+Af/UurV0zRPp6nHaILWU8arJcTP6K/TCv9XK/rO3ubSZPfvesG/KvvgwhAL
NdrQu6EKqRNNIh8gXlBP7VXgQgDlot+E9fNz10BKinKi7i7VFQvJ/W+rzZ91me1+
Z7uxb+hvVa+GZMdc6VTeosGlnuSjugyggCwjGohFanhF6QqGMxn5hpS1/ZrKlCM+
gUDVk5fLhLnT/Mo8GlsQEcbULJnmyZ9JSnoif+XJLvs5F55GUlQOlua9PxXegP4p
Jsp5Oxx+wuy5BTkgVm+y1dwV3p4XNjjS/K29nn6ggZNPolFqm1Hx169DIUqE8Zqg
YZRA5euMXw7FxnPNLsMic9EoBOzFXw==
=M19j
-----END PGP SIGNATURE-----

--xq7ehyumhkwfir4g--


--===============1948020529346606786==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1948020529346606786==--

