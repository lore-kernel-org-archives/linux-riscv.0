Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A952CC00140
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Aug 2022 07:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSK4qlv2Tw154A6XXK5FJbL1Z/LaBg8Ya/vwn8HrYEg=; b=pxqorrYM9t1DlYFYUzMAr9hQnC
	fOcedeMQLV/XN7lYRKeJwtWytpVwoh1yNGAQGfb1ACmDtkEaaoWGM9F6kIWbBlmIQI9IVM0N69Sva
	4U52GiwaYs/JUgRKW3ChZ9V1XWnFrDiG4C1gApR4Wvkz68RFQ4JJ7GPHeR/RI/YVeEsL6WomoEwjI
	/C2E89LZfRGol+uDBh1EIMVTLhmbgWJMvyTxQP7UIX1AHrIy6G5fHAjjnhVsbQqYXlXRX3SI0kIir
	Snrp6/J+ORb1zIGC1upjJL/bYXt4T9id2BT6pIziJm9AxPmh/s4sFlAYe6dePudA1b9WnEeG3fI9I
	WkSzuxDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImZE-00BSrr-ED; Tue, 02 Aug 2022 07:43:52 +0000
Received: from metis.ext.pengutronix.de ([2001:67c:670:201:290:27ff:fe1d:cc33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oImZ9-00BSmh-L6
	for linux-riscv@lists.infradead.org; Tue, 02 Aug 2022 07:43:50 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.ext.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImYu-0008Am-Fx; Tue, 02 Aug 2022 09:43:32 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtp (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImYt-001Gyn-88; Tue, 02 Aug 2022 09:43:31 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1oImYs-0095Aa-FZ; Tue, 02 Aug 2022 09:43:30 +0200
Date: Tue, 2 Aug 2022 09:43:30 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Conor Dooley <mail@conchuod.ie>
Cc: conor.dooley@microchip.com, daire.mcnamara@microchip.com,
	devicetree@vger.kernel.org, krzysztof.kozlowski+dt@linaro.org,
	lee.jones@linaro.org, linux-kernel@vger.kernel.org,
	linux-pwm@vger.kernel.org, linux-riscv@lists.infradead.org,
	robh+dt@kernel.org, thierry.reding@gmail.com
Subject: Re: [PATCH v7 2/4] riscv: dts: fix the icicle's #pwm-cells
Message-ID: <20220802074330.7t2hts2notnkqi4z@pengutronix.de>
References: <20220721172109.941900-1-mail@conchuod.ie>
 <20220721172109.941900-3-mail@conchuod.ie>
MIME-Version: 1.0
In-Reply-To: <20220721172109.941900-3-mail@conchuod.ie>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.ext.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220802_004347_718728_87CC3EE2 
X-CRM114-Status: GOOD (  17.08  )
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
Content-Type: multipart/mixed; boundary="===============5084067151402488845=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5084067151402488845==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="dvf6lqbfzzk3r6w5"
Content-Disposition: inline


--dvf6lqbfzzk3r6w5
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 21, 2022 at 06:21:08PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> \#pwm-cells for the Icicle kit's fabric PWM was incorrectly set to 2 &
> blindly overridden by the (out of tree) driver anyway. The core can
> support inverted operation, so update the entry to correctly report its
> capabilities.
>=20
> Fixes: 72560c6559b8 ("riscv: dts: microchip: add fpga fabric section to i=
cicle kit")
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi b/=
arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> index 0d28858b83f2..e09a13aef268 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit-fabric.dtsi
> @@ -8,7 +8,7 @@ core_pwm0: pwm@41000000 {
>  		compatible =3D "microchip,corepwm-rtl-v4";
>  		reg =3D <0x0 0x41000000 0x0 0xF0>;
>  		microchip,sync-update-mask =3D /bits/ 32 <0>;
> -		#pwm-cells =3D <2>;
> +		#pwm-cells =3D <3>;
>  		clocks =3D <&fabric_clk3>;
>  		status =3D "disabled";
>  	};

I checked there are no consumers that need adaption, so:

Reviewed-by: Uwe Kleine-K=F6nig <u.kleine-koenig@pengutronix.de>

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--dvf6lqbfzzk3r6w5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEfnIqFpAYrP8+dKQLwfwUeK3K7AkFAmLo1Z8ACgkQwfwUeK3K
7AlEFgf/Sta+4b8FYlEd9Z70dBteRo7hbecxnz0Be/nwzu84/H/hxb9OvVTPuLxp
w8HY3d6715d/tLRSUWz7LSYoOR0qY5UpagUXmeM+6rEo4upkTXGUiv9OKPgRexWm
9EOER7LyfpkxKlrwTTAxnm++/0T4i0/jLR8Zhw4bUIAMF1c5G+L47djtfNnM0wR4
XsWYg8w8CdtJAW5aAovncWsqjvErxvnKsvevxlLXcQHix3qnkN6M9nXI7v69xTjF
588x80wMV2cuwIRiikUmT8V56REcfd7z9V6yq5jWUvleSUquiqBRBSpGJOLZvPxV
Kw8T9sirrkNvHV1M5IDNWX4NpOS3xQ==
=6r+x
-----END PGP SIGNATURE-----

--dvf6lqbfzzk3r6w5--


--===============5084067151402488845==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5084067151402488845==--

