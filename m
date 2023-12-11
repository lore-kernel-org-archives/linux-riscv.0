Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3335FC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 20:42:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEaXysbHoKEzuCEyZVn7xoLc96q0ETRgbtt1weJSJGo=; b=z8rHYCAiXdvcLzJKVUPXLSRlS2
	PNVzUbkSH0IcLDNuLqIwFlaV7u1CMknlQ3MBb9wsA++SYEugPbjpFjOnGLCZn6tQ9rTg/AeEd8wEz
	PqDPIcPDITyzCgiAQlxBXtdMj91/w1U+YTs79ssiykPGR3j+1U7I6fUKudp/q2wj75maXzPH0gmft
	dJSiIumArSlLEsRrvchvhPoq0FqP2BV5hvX4QwCfg4azraQ37emQBKsrIt0VIzqNgiBxPbh/jLFpY
	ywFSYtdUJxIAh0HbfW2CFX7LI+jq66BCR0UPz0dhTFWOD7UByjh3UPo5NMLV8vEbOEJ1E/ietBPNZ
	R4Uctv3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCn6Y-008CSa-31;
	Mon, 11 Dec 2023 20:42:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCn6U-008CPA-2r
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 20:42:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCn6S-0005UC-35; Mon, 11 Dec 2023 21:42:12 +0100
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCn6Q-00FBGh-SY; Mon, 11 Dec 2023 21:42:10 +0100
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1rCn6Q-0018Fb-Iq; Mon, 11 Dec 2023 21:42:10 +0100
Date: Mon, 11 Dec 2023 21:42:10 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, thierry.reding@gmail.com,
	emil.renner.berthing@canonical.com, vincent.chen@sifive.com,
	greentime.hu@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [v5 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
Message-ID: <20231211204210.ioeyyufiz646ht5j@pengutronix.de>
References: <20231024101902.6689-1-nylon.chen@sifive.com>
 <20231024101902.6689-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231024101902.6689-2-nylon.chen@sifive.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_124214_929466_AD176C88 
X-CRM114-Status: GOOD (  10.61  )
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
Content-Type: multipart/mixed; boundary="===============3982031644708099248=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3982031644708099248==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ii53zkpujb4nxf65"
Content-Disposition: inline


--ii53zkpujb4nxf65
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 24, 2023 at 06:19:01PM +0800, Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.
>=20
> The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schemat=
ics-v3.pdf[1].
>=20
> Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf845=
3f8698_hifive-unleashed-a00-schematics-1.pdf [0]
> Link: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce7=
6f4192_hifive-unmatched-schematics-v3.pdf [1]

IMHO the commit log should mention that the driver got inversion wrong
and so both dts and driver need adaption.

Otherwise looks fine to me.

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--ii53zkpujb4nxf65
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmV3dCEACgkQj4D7WH0S
/k6tVAf7Bj1RKTbaCo6ITu+NYR1r155+J1T19OHpefrybgzQXZ2X+LaixXbycEk/
bkGT88XTQVJSmNlu5Af1zKpOF/Uqs3XZovcEPiipnTGQFW/cuQfys/Yryxr1/9ei
DssK8PavR+upBKmz2n0Amhh5gISU75gAGgExhTDMV4atIrlopAl0zGQUSphCFaLQ
u+HfMiBhG18K6hfk/tsA1KYf8v/bzg2DZ9rArCSycr8/8BqSUO1R6SAWlrSUWRrU
I+JfkIFJNWwP1sXz0i9+tAoOKYCgcLdtqLBbi9QT5vYcKSVig+m5h/3ofeJMu9Tw
B9IcMycyPSaYA56AqG1k79Mv021yUg==
=KPhB
-----END PGP SIGNATURE-----

--ii53zkpujb4nxf65--


--===============3982031644708099248==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3982031644708099248==--

