Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60A65C47073
	for <linux-riscv@archiver.kernel.org>; Thu,  4 Jan 2024 22:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vg2EyxfWi98vbMi/h0C+hv+6ozoXtaXVzj5mdWTVAi8=; b=R2hUKDbPRDJtvGdiFLUrvmDxEc
	9EB2TxlsbLRC6In4IHz5m0awHel2H9MoFFSDSTKZRsRs6P3V3jxixseULuReTwF6dmj98IYSH1Eoi
	ZwP2165eE8l9zFstjuP3FF64uX2FW/XbGFDYbAT8Rpso4xG20W3KuTbU/ymgBtBjIT6NpXgeZMfj0
	nTe4eg1J5OFxaMBR99J2BKdO8B5pBZhu08tNiJglOWgY52owOk4onjpNYiuLTM6wZ7qf26ygftSlc
	8yPcyo8Phrw52hLGLuPg3G1h5MotmcLN1dj3hy2Uq3r4U5gnnrrFuUIy2Hc5OGRw+3qc0Xg1R16Jt
	gg/wli5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWTx-00FNRi-1M;
	Thu, 04 Jan 2024 22:46:33 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rLWTv-00FNQb-0n
	for linux-riscv@lists.infradead.org;
	Thu, 04 Jan 2024 22:46:32 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWTt-0003LX-RS; Thu, 04 Jan 2024 23:46:29 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWTs-000SXg-6R; Thu, 04 Jan 2024 23:46:28 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <ukl@pengutronix.de>)
	id 1rLWTs-003ePm-0J;
	Thu, 04 Jan 2024 23:46:28 +0100
Date: Thu, 4 Jan 2024 23:46:27 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Subject: Re: [PATCH v10 3/4] riscv: dts: starfive: jh7100: Add PWM node and
 pins configuration
Message-ID: <xd2ryic6mr6d6cbljjbhmr56mfpchfzkmc3lnznhmoiwyzip2a@6bhbho267e7c>
References: <20231222094548.54103-1-william.qiu@starfivetech.com>
 <20231222094548.54103-4-william.qiu@starfivetech.com>
 <CAJM55Z9tyrR7emEBrY0+Fnc_LUFQHkqYHLQ4ptL=XQMy52qtVw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJM55Z9tyrR7emEBrY0+Fnc_LUFQHkqYHLQ4ptL=XQMy52qtVw@mail.gmail.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240104_144631_281365_19D6DD83 
X-CRM114-Status: GOOD (  13.46  )
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
Content-Type: multipart/mixed; boundary="===============2328339100124153117=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2328339100124153117==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="t6vmolgghsdowiew"
Content-Disposition: inline


--t6vmolgghsdowiew
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Emil,

On Sun, Dec 24, 2023 at 02:49:34AM -0800, Emil Renner Berthing wrote:
> William Qiu wrote:
> > Add OpenCores PWM controller node and add PWM pins configuration
> > on VisionFive 1 board.
> >
> > Signed-off-by: William Qiu <william.qiu@starfivetech.com>
>=20
> Sorry, I thought I already sent my review. This looks good.
>=20
> Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Is this also an implicit Ack to take this patch via the pwm tree once
the earlier patches are ready? Or do you want to take it via your tree?
(Maybe already now together with the binding? If so, you can assume my
Reviewed-by to be an implicit Ack for that.)

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--t6vmolgghsdowiew
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmWXNUMACgkQj4D7WH0S
/k5yJwf8DhWKIA7w5Efn+CTxdLq+56oqG3ETi+SoNHAw6aIw5EMpC/VJwzn87CjW
rFbc+3JtR/MZvQtlQeEaKu8+IuYRUW0iOFQ2FjVJXI2219g9PsTgMdx9fQmlZFqp
iFg3DTWerqhqGu258walJUgojVdC6plX2sjlVWvf9UIIaYv9yR4IYMffeFWw0MM/
dThWdIdYfx4BtxMJWxkiw3QQr7s1tpJ55weroLPO5CAMqXrjiC6YGmcelTF8mRCJ
6pFloQ1MTC6kT5gERkxBlnO1V+WocrNXPamPFavh5UtGL0PmsZqQzUT49MWwb2si
sXuOgYjeLG8VgEj8X0+2I+x7k90eDg==
=xoqr
-----END PGP SIGNATURE-----

--t6vmolgghsdowiew--


--===============2328339100124153117==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2328339100124153117==--

