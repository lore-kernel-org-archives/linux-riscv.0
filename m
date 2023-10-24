Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0133C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KmYncJTXutAhbPmfKHhpkdN8okN//MQU8gb78bcLAWw=; b=n+5Ni91zjuOShFAk+du158FZe7
	/nifwaCWnJFfu4iLoeWhvMHNFzQsDJ8wFsBVYJvskSX5om9HzE03lLHV58n2lTvwMhgMbys9p3xTc
	f8TQss9utnUbz90uSuYu+jAdC8U0D8oMl49sGg9dpjnq/ijgjjSh8Q7W0aFqVwTXljwMlxEYM2gSL
	jJMQRDlwybA/6DHkDGf0oDoDW848nXCbC5R+mzDN/WgoC/l6ufQeEgcCrH7A3tq8mPx1ggxQNa6K6
	wdUJDVHJSQBQDxzl8JWYzio4LBaUDEsLULwsi4VyyzTq2MyhbZAzxSX4igSz94PxbPqu0T7eXcU2z
	zr3JQ5tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIp7-00AB9g-1m;
	Tue, 24 Oct 2023 14:56:01 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvIp4-00AB8h-0F
	for linux-riscv@lists.infradead.org;
	Tue, 24 Oct 2023 14:55:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 93A87B825CE;
	Tue, 24 Oct 2023 14:55:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F191C433C8;
	Tue, 24 Oct 2023 14:55:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698159355;
	bh=vuJgsrEAfHidl/LC9Nby8frF6rGsOt8evp6na8amWoU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pMHpAmKrY5a40YB98zv5cEhynF8IqCDt6qfDAfb4kCtLCcfEYiL9OAmfF0K9kSNT+
	 clGdZ70etIcvNEdH2kzEw5bwQDNFjBHvkvfP9Itq2TQYT8D1QKfiqkEbf1BwkpqLFy
	 P5LPZ3OsWVFSCEQakmvXwsYGP5Mj7Zv31WCg25pWhUrQlVq/DfnKY2rLYSa46lMayq
	 hg9xs5ZcwRpPJGohlI6wyZ+eHzYdY8iF8gKMBVkawAQcJiBeqGyG6GBrBfKCRaR3tx
	 KlG7TKZtCzTF3M8xsU42Gr+snuZpjW8Dz+IZxw+9i9PJXd+Rb3aUFTMCdzDJA0SDCT
	 jRkRP0B0T7wjw==
Date: Tue, 24 Oct 2023 15:55:50 +0100
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-pwm@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, thierry.reding@gmail.com,
	u.kleine-koenig@pengutronix.de, emil.renner.berthing@canonical.com,
	vincent.chen@sifive.com, greentime.hu@sifive.com,
	zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [v5 1/2] riscv: dts: sifive: unleashed/unmatched: Remove PWM
 controlled LED's active-low properties
Message-ID: <20231024-yin-coliseum-11f5e06fec14@spud>
References: <20231024101902.6689-1-nylon.chen@sifive.com>
 <20231024101902.6689-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20231024101902.6689-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_075558_395388_2057CC1F 
X-CRM114-Status: GOOD (  16.91  )
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
Content-Type: multipart/mixed; boundary="===============2484596741960109889=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2484596741960109889==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="H7Zl3g4CczEwNK1s"
Content-Disposition: inline


--H7Zl3g4CczEwNK1s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

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

>=20

This blank line should be removed if there is a follow-up.

> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>

What did Vincent contribute to this patch? Are you missing a
co-developed-by tag, perhaps?

> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

I expect this to go via the pwm tree since this is going to "break" (in
the loosest possible sense) existing systems if merged separately.

Cheers,
Conor.

> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts |  8 ++++----
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
>  2 files changed, 8 insertions(+), 12 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 900a50526d77..11e7ac1c54bb 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -49,7 +49,7 @@ led-controller {
>  		compatible =3D "pwm-leds";
> =20
>  		led-d1 {
> -			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> +			pwms =3D <&pwm0 0 7812500 0>;
>  			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
> @@ -57,7 +57,7 @@ led-d1 {
>  		};
> =20
>  		led-d2 {
> -			pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> +			pwms =3D <&pwm0 1 7812500 0>;
>  			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
> @@ -65,7 +65,7 @@ led-d2 {
>  		};
> =20
>  		led-d3 {
> -			pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> +			pwms =3D <&pwm0 2 7812500 0>;
>  			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
> @@ -73,7 +73,7 @@ led-d3 {
>  		};
> =20
>  		led-d4 {
> -			pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> +			pwms =3D <&pwm0 3 7812500 0>;
>  			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 07387f9c135c..b328ee80693f 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -51,8 +51,7 @@ led-controller-1 {
>  		compatible =3D "pwm-leds";
> =20
>  		led-d12 {
> -			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms =3D <&pwm0 0 7812500 0>;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d12";
> @@ -68,20 +67,17 @@ multi-led {
>  			label =3D "d2";
> =20
>  			led-red {
> -				pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms =3D <&pwm0 2 7812500 0>;
>  				color =3D <LED_COLOR_ID_RED>;
>  			};
> =20
>  			led-green {
> -				pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms =3D <&pwm0 1 7812500 0>;
>  				color =3D <LED_COLOR_ID_GREEN>;
>  			};
> =20
>  			led-blue {
> -				pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
> +				pwms =3D <&pwm0 3 7812500 0>;
>  				color =3D <LED_COLOR_ID_BLUE>;
>  			};
>  		};
> --=20
> 2.42.0
>=20

--H7Zl3g4CczEwNK1s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZTfa9gAKCRB4tDGHoIJi
0uwlAQCAZQx27sPA2UXRQiyGM6Fg+CQ3RWgDqFwXmisNYn/2GwEAqc5VaZVLOB01
ub63XDQoIn8tFuAT1jgi10RRbmKjBw0=
=TgU2
-----END PGP SIGNATURE-----

--H7Zl3g4CczEwNK1s--


--===============2484596741960109889==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2484596741960109889==--

