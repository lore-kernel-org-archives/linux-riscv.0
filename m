Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C857C47DDB
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jan 2024 18:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n1UlA0Erp6nd0nCGkxnnhITdtoALjeoc9hHxiBFFadw=; b=i62FEwMf50AxDhsPoi+zeBdjPf
	/hQtoUgG2AUcrKFauML8XGJEFfAKirLzN9ak2HlMAsjzOik0d7LAmAYQZ/GD1095fHUCd/lYcgwHg
	dyiR2gagO6hEMQAhcvYnoUX9ASOLGY2wt0ZxH5az0Nfeza9D3xLB2aXr86RuK+85cZ3Goe4fZ6BCv
	zIEZUU2tWWqyux+JSpMvHf7xxdUPhfgrzUR5apY7I+0z6M1HG+Uqd6f0xlNi9OjaugAFuFdUxeiPu
	ConmzJvZbIfIiLx0lPS/CnTnycktis9ODNHwLalIPMIdYUIaDeSYmTbG3TlxJ84dVoW+ZFYKypNfN
	rwy0hLWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWI7-0000000DvHr-29Cs;
	Mon, 29 Jan 2024 18:23:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUWI4-0000000DvHM-44BU
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jan 2024 18:23:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41ED662392;
	Mon, 29 Jan 2024 18:23:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD826C433F1;
	Mon, 29 Jan 2024 18:23:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706552606;
	bh=uUo/ELYi1fV8xAUVfjuo4eyyTGGvc7vWvgOiqe8dV14=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfG+FvT3q1AsmbYw16QbLQI0fh0TXJ4OnH6FmcVreTiYjM1O+vXf9ZwfIQcq3Nt5p
	 Gew4I+1mmvxxhW9qenu2t6NSosDPmk30SE0TdHfl4ZdZ/hWcIX/JNtcvbuU2fsxIIL
	 OXKVo+NgoXkg4CKPsFrLxSaYTqHOOclsVaU8nXZrZZr2fm96Heq5nIYe1GlwzG1IxL
	 Iye3thIRZuqpu1fuwJEtSLnoGbvchioHZZX1K8k9ss4nKTfrQQV7wKGoij/3w4f4Sr
	 VbI3fh3dvz4+ksbQ6/ReUpH30mgf1Kc5KfqhUr39ufApqg9P3oZ94lykoGD1Ks/BRr
	 QL9M0pB87e2Xw==
Date: Mon, 29 Jan 2024 18:23:21 +0000
From: Conor Dooley <conor@kernel.org>
To: Nylon Chen <nylon.chen@sifive.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org,
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
	thierry.reding@gmail.com, u.kleine-koenig@pengutronix.de,
	vincent.chen@sifive.com, zong.li@sifive.com, nylon7717@gmail.com
Subject: Re: [PATCH v8 1/3] riscv: dts: sifive: unleashed/unmatched: Remove
 PWM controlled LED's active-low properties
Message-ID: <20240129-subsoil-reapprove-a60fedd1caf0@spud>
References: <20240126074045.20159-1-nylon.chen@sifive.com>
 <20240126074045.20159-2-nylon.chen@sifive.com>
MIME-Version: 1.0
In-Reply-To: <20240126074045.20159-2-nylon.chen@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_102329_121450_6A7FCED2 
X-CRM114-Status: GOOD (  14.52  )
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
Content-Type: multipart/mixed; boundary="===============3319541000057318542=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3319541000057318542==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5A9FXQwnSGACEOHc"
Content-Disposition: inline


--5A9FXQwnSGACEOHc
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 26, 2024 at 03:40:43PM +0800, Nylon Chen wrote:
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
> Co-developed-by: Zong Li <zong.li@sifive.com>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Co-developed-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
> Signed-off-by: Nylon Chen <nylon.chen@sifive.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>

Uwe, take this with the driver, if that is ready to be taken.

Thanks,
Conor.

> ---
>  arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts | 12 ++++--------
>  arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dts | 12 ++++--------
>  2 files changed, 8 insertions(+), 16 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/r=
iscv/boot/dts/sifive/hifive-unleashed-a00.dts
> index 900a50526d77..06731b8c7bc3 100644
> --- a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> +++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
> @@ -49,32 +49,28 @@ led-controller {
>  		compatible =3D "pwm-leds";
> =20
>  		led-d1 {
> -			pwms =3D <&pwm0 0 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms =3D <&pwm0 0 7812500 0>;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d1";
>  		};
> =20
>  		led-d2 {
> -			pwms =3D <&pwm0 1 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms =3D <&pwm0 1 7812500 0>;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d2";
>  		};
> =20
>  		led-d3 {
> -			pwms =3D <&pwm0 2 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms =3D <&pwm0 2 7812500 0>;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d3";
>  		};
> =20
>  		led-d4 {
> -			pwms =3D <&pwm0 3 7812500 PWM_POLARITY_INVERTED>;
> -			active-low;
> +			pwms =3D <&pwm0 3 7812500 0>;
>  			color =3D <LED_COLOR_ID_GREEN>;
>  			max-brightness =3D <255>;
>  			label =3D "d4";
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

--5A9FXQwnSGACEOHc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZbftGQAKCRB4tDGHoIJi
0qmQAQDiGfd+UdqYAlnM1Owz93rDgiV//gS7COZORlmIezU51QEAmkFGRrFJVT4J
CbDqiy1NWDk9D2Bs4c4i0NknaV33bw4=
=FahO
-----END PGP SIGNATURE-----

--5A9FXQwnSGACEOHc--


--===============3319541000057318542==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3319541000057318542==--

