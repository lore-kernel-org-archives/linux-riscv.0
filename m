Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EB72C636CC
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Jan 2023 18:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mur5gpcY4Eg0CN9S0SLVpn0oQPrvYqSBUSoUiNESFyI=; b=4obd9tYdRfqJqP3jEvxXQvJ8/D
	Mso2znii7g1TowiTnxfqberTtaI8TTrB8B9ye8uzTcNRuN5FU0pJ/quQAF8GKfr7OYGZ6Wj0TFnCL
	EysQIbnPvKn6vm1v4yY+ELuhEdjCBk/SUDWS0flEPghE3giaI8iPo9J2Sv+FbmolL3IhZP0eSBN7p
	Cz7VcFAlBgWNOG6a1pUWNkYLOV9vf1Cq0ggIoAkQBQcnunOcwlxe1vslKnW04cAkId1YSqF1Rf2c2
	NtkrHyEOBmmFkTTr6KXc6Mldh2CrTeqx1HgW2OeEzdCP0Pv5ConrCgvNaUUWRTkrjR5NCauoZjdYy
	XGziWsbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvQQ-00901D-GM; Tue, 31 Jan 2023 18:32:10 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMvQM-009001-TL
	for linux-riscv@lists.infradead.org; Tue, 31 Jan 2023 18:32:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 6E07761638;
	Tue, 31 Jan 2023 18:32:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E55BC433A0;
	Tue, 31 Jan 2023 18:32:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675189926;
	bh=VHWZ/wBpzz25yASOrx7kkTEU4WZv4A8V9MHXNzW/axE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iZ2CuIIB93ZQkatOQPR8FUia3GQiuqyEXEvLHdvtFYMhZDDoUJaztNrA5pwz5MonL
	 VwlKy8wSLmIEy+MYgXsCJMv1gMUxe+h0uDF9UNsPnxu3D4PT0tkv8RxHH5QOjViiod
	 CAzXrMRb87tGD9HaMbpmhwiNuQfngFOyV3Skqu6bKKRdXIRO4yNL8QFZQu5dZApr1w
	 reY24xd7EYj+yGH/1bIPZ2MV/Vq4xWtGnJm1/ZIqGdWg2CNVGEHhVZqkv6kfPWvIne
	 AJiMoq8Wji/HJw4USdNUKPsq9PUaPOIaUQLobHf+/9M/3czZdHGg4ojAbI2Lp8wE23
	 l1qu8599Pd8DQ==
Date: Tue, 31 Jan 2023 18:31:59 +0000
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: aou@eecs.berkeley.edu, emil.renner.berthing@canonical.com,
	geert+renesas@glider.be, heiko@sntech.de,
	krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
	paul.walmsley@sifive.com, robh+dt@kernel.org,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	devicetree@vger.kernel.org, linux-pwm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	nylon7717@gmail.com, zong.li@sifive.com, greentime.hu@sifive.com,
	vincent.chen@sifive.com
Subject: Re: [PATCH v2 1/2] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
Message-ID: <Y9len4GinXQ101xr@spud>
References: <20230130093229.27489-1-nylon.chen@sifive.com>
 <20230130093229.27489-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20230130093229.27489-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_103207_049120_5E3DEB42 
X-CRM114-Status: GOOD (  15.24  )
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
Content-Type: multipart/mixed; boundary="===============0089284068809894331=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0089284068809894331==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="KT0CNMtZmPOxL+YU"
Content-Disposition: inline


--KT0CNMtZmPOxL+YU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Nylon,

On Mon, Jan 30, 2023 at 05:32:28PM +0800, Nylon Chen wrote:
> This removes the active-low properties of the PWM-controlled LEDs in
> the HiFive Unmatched device tree.
>=20
> The reference is hifive-unleashed-a00.pdf[0] and hifive-unmatched-schemat=
ics-v3.pdf[1].
>=20
> [0]: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453=
f8698_hifive-unleashed-a00-schematics-1.pdf
> [1]: https://sifive.cdn.prismic.io/sifive/6a06d6c0-6e66-49b5-8e9e-e68ce76=
f4192_hifive-unmatched-schematics-v3.pdf

Ideally these would be:
Link: https://sifive.cdn.prismic.io/sifive/c52a8e32-05ce-4aaf-95c8-7bf8453f=
8698_hifive-unleashed-a00-schematics-1.pdf [0]
so that they integrate nice with the git trailers mechanism.
If you resend, please update them to regular link tags.

I checked out the circuits last time around and agreed that they should
not be active-low.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

I expect that both patches will go through the PWM tree together, so:
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Thanks,
Conor.

>=20
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 4 ----
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 4 ----
>  2 files changed, 8 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 900a50526d77..7a9f336a391c 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -50,7 +50,6 @@ led-controller {
> =20
>  		led-d1 {
>  			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d1";
> @@ -58,7 +57,6 @@ led-d1 {
> =20
>  		led-d2 {
>  			pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d2";
> @@ -66,7 +64,6 @@ led-d2 {
> =20
>  		led-d3 {
>  			pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d3";
> @@ -74,7 +71,6 @@ led-d3 {
> =20
>  		led-d4 {
>  			pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d4";
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unmatched-a00.dts
> index 07387f9c135c..11f08a545ee6 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts
> @@ -52,7 +52,6 @@ led-controller-1 {
> =20
>  		led-d12 {
>  			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d12";
> @@ -69,19 +68,16 @@ multi-led {
> =20
>  			led-red {
>  				pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_RED>;
>  			};
> =20
>  			led-green {
>  				pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_GREEN>;
>  			};
> =20
>  			led-blue {
>  				pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -				active-low;
>  				color =3D <LED_COLOR_ID_BLUE>;
>  			};
>  		};
> --=20
> 2.36.1
>=20

--KT0CNMtZmPOxL+YU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY9lenwAKCRB4tDGHoIJi
0kmZAPwOZKVv5DxRGwppcbbAEFp/BZQP4sLaAi21f8bM4+rpcwEA75OgmBTRVxhG
OIy96MY2XY88gRoHLNgYcBDB3nhfZQ0=
=Wddn
-----END PGP SIGNATURE-----

--KT0CNMtZmPOxL+YU--


--===============0089284068809894331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0089284068809894331==--

