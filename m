Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C402CEB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 07:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MGdOvuzqpRpUlAIX8+3vun962QcR5VlaJgbr+Q1WtlI=; b=nZ+gZ1oTjR0jusIDBvbAxXf0RY
	tWzfkWnGRcJK0XojDBnnW8fWoTTpAmCPVX4RZbLXnZRgRC5STC3vhs8hyFhvd7mUrGGrSv2S7yhIu
	pLLWp8/G3u9/K+S9Utr22L2z+dDORmLOWsIpVPrailp9pMY9PiCg1idJyE48rxT9dQmJQ5bII7gtZ
	rKn0PWUcHps9RTWFn6cNeAiv4me5saf2VWaObzCOLCKykynOzNQ+enXK+/zzeguR+gQzJEDeUZvHB
	LbysFhb3I2MH0aN0PNyfU0GNzC2/WETDySjWnEfXCbVU2Hzr2fY6DxeVmPp8gV75e1AhW8v+MV2Ry
	Ix8R+nzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuSD-00GLGK-1x;
	Mon, 07 Aug 2023 07:15:01 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSuS9-00GLDd-0E
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 07:15:00 +0000
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1qSuRu-000883-Pg; Mon, 07 Aug 2023 09:14:42 +0200
Received: from pengutronix.de (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 1A506205885;
	Mon,  7 Aug 2023 07:14:39 +0000 (UTC)
Date: Mon, 7 Aug 2023 09:14:38 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Jernej =?utf-8?Q?=C5=A0krabec?= <jernej.skrabec@gmail.com>
Subject: Re: [PATCH] riscv: dts: allwinner: d1: Specify default CAN pins
Message-ID: <20230807-leverage-manatee-687c46db39f8-mkl@pengutronix.de>
References: <20230731023701.2581713-1-contact@jookia.org>
 <3248110.44csPzL39Z@jernej-laptop>
 <ZMyZ5kZSiiJHtdeS@titan>
 <5696365.DvuYhMxLoT@jernej-laptop>
MIME-Version: 1.0
In-Reply-To: <5696365.DvuYhMxLoT@jernej-laptop>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:b01:1d::7b
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_001457_112264_5C44C1E8 
X-CRM114-Status: GOOD (  21.89  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, John Watts <contact@jookia.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Maksim Kiselev <bigunclemax@gmail.com>, linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: multipart/mixed; boundary="===============0886567918276716620=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0886567918276716620==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xgydx3hdd5gawx7l"
Content-Disposition: inline


--xgydx3hdd5gawx7l
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 04.08.2023 16:39:41, Jernej =C5=A0krabec wrote:
> Dne petek, 04. avgust 2023 ob 08:25:42 CEST je John Watts napisal(a):
> > On Thu, Aug 03, 2023 at 10:59:30PM +0200, Jernej =C5=A0krabec wrote:
> > > pinctrl-names and pinctrl-0 are usually at the top. However, since th=
ere
> > > is no hard rule (I've seen it mixed), I'm fine with it.
> >=20
> > Happy to change if needed.
>=20
> If you don't mind, please do.
>=20
> >=20
> > > Since original DT node entry goes through netdev tree, this should be
> > > picked there or it can be dropped there and I pick both patches or I =
can
> > > pick patch for later kernel version.
> >=20
> > Do I have to do something based on this, like resend my patch?
>=20
> Nothing on your side.
>=20
> Marc, since you took original patch through netdev tree, what is your dec=
ision=20
> here?

I'll take the DT patches though linux-can-next to net-next.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--xgydx3hdd5gawx7l
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEDs2BvajyNKlf9TJQvlAcSiqKBOgFAmTQmdoACgkQvlAcSiqK
BOgNigf/WQ0j4jhWfbYXaY/33E7hWV8x/a7lA0uFjqImrlzx6N9e9haXbCDz8Prm
wlqXv10RoPcam5UnDHoDmeg7RASAIkLBKAFiuTpWZnOEiV77CB8H7sHELLiT8hOg
W1R26KjIU0a3TFrBy3vfRZc+lRL3Jxcu7X/eh+dMUM9N+bMf0x7h+MW5Wx4CbC6k
SR0j4D5Cxgi5EcXjGl8SJxatOmfGxBkjlKgJmiw0vUI5ISgluQrZF3m9adflXAza
IoPSI+WPU7uMHIvMvRv0Ed4MvNhZabRATEAjOTvJsmq0grjT4rk9xYv4ZGEET/Rm
xSbfq22jvd65w0kOt5NvtJs/NzZxVQ==
=MX/Y
-----END PGP SIGNATURE-----

--xgydx3hdd5gawx7l--


--===============0886567918276716620==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0886567918276716620==--

