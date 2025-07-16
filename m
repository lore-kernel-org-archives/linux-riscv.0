Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC313C83F22
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Jul 2025 15:29:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5EK5sn59onAdQIy2hKGGLfpr054E3FqYwOAOEM1vfA=; b=LwLAqotceSt1bgpNk5XeduXie+
	RFkE+GPkUlqySLxU/x/eQBZLyz5Z8vihinjLOOaQcAT3Nd6SQfTKJWQCPHE5BiyF4zgx/8XzqE5Vr
	8dmKYkD9T48kqnY5xCBHwYFS03NlmKzYZ39NpnHFn9ZyHW9darAsVWydwb9XWWY20S2Ly3rOwQiQ5
	LEYisP34ernDvckN6NLQC9trLatY1UULIuUq4xS21y7KWm5yFElM0t4xmPFUETBhI9V6rvsAzBzxq
	7oT63u8OZ3SdMoPdQC1DiRjV7zb9VfIYCioAkH+flijkSjnBOPbNv4fTTMkIZqLg9pa+g8t/tHHcV
	F6u/C42w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc449-0000000842D-1v1R;
	Wed, 16 Jul 2025 15:29:05 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc43z-000000083wj-17qk
	for linux-riscv@lists.infradead.org;
	Wed, 16 Jul 2025 15:28:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 68D45614A6;
	Wed, 16 Jul 2025 15:28:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87112C4CEFB;
	Wed, 16 Jul 2025 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752679734;
	bh=W7/nF4nRS7uBsdUOXm4KZyyGIpg2xdza86j5sSDU6u0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rARbwgUsAjng6lF/GLnPocNjSAEvIWzWDIlaoMOY6lk5eRuu1mRyksLfb8amzCXCC
	 2jVKGrVrLbjQoTnVkFhoIi8ZyevF6y6IukM6eTFtRZ7upaonmHbpc9upomkegDv4gO
	 zgn8wnHKjohTTblrvSBkoUBUgAaUKy0U83Vupbr/EZInnuwS8e+/sl08b93bC5vzBe
	 fO2SSUbZJMsps7xJcqjgG4uT2WP9NRZXf9jTMLnTqNZf8hs+9lPUnHoQIw6HzuFTOp
	 d9/k5WqPzS1hNOlVpf7uznqt+0qvVyiTi9yHBvuRm/kTkqg0pH8eVWNbAq/f5piROT
	 JalxIHcAwjfZg==
Date: Wed, 16 Jul 2025 16:28:48 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: add status power
 led node
Message-ID: <20250716-wind-slum-99dd6ea87f63@spud>
References: <20250716040500.178287-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250716040500.178287-1-e@freeshell.de>
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
Content-Type: multipart/mixed; boundary="===============5002073146214008532=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5002073146214008532==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="gJsZFKFkJNRPOfmS"
Content-Disposition: inline


--gJsZFKFkJNRPOfmS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 15, 2025 at 09:04:54PM -0700, E Shattow wrote:
> Add status power led node for StarFive VisionFive2 and variant boards.
>=20
> Signed-off-by: E Shattow <e@freeshell.de>

Again, I'll grab this too but it may be too late for 6.17.

> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 9 +++++++++
>  1 file changed, 9 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 4baeb981d4df..2eaf01775ef5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -8,6 +8,7 @@
>  #include "jh7110.dtsi"
>  #include "jh7110-pinfunc.h"
>  #include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/starfive,jh7110-pinctrl.h>
> =20
>  / {
> @@ -38,6 +39,14 @@ gpio-restart {
>  		priority =3D <224>;
>  	};
> =20
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led_status_power: led-0 {
> +			gpios =3D <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
>  	pwmdac_codec: audio-codec {
>  		compatible =3D "linux,spdif-dit";
>  		#sound-dai-cells =3D <0>;
>=20
> base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
> --=20
> 2.50.0
>=20

--gJsZFKFkJNRPOfmS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaHfFMAAKCRB4tDGHoIJi
0nHrAQCuSUXdyXMzRbJ71XIKKoxszblhLou5bzCekA/VDn3EpgEAsM5AyvNBusEW
YY48xUFjRW0+f7RaTuMdbz+UgJdk5w4=
=cCou
-----END PGP SIGNATURE-----

--gJsZFKFkJNRPOfmS--


--===============5002073146214008532==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5002073146214008532==--

