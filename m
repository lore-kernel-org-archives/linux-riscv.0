Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1599CD4851
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 13:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f+2iKft3RrCYFsEYoLUokjVrvKsvRrUn38WLBuu4K6Y=; b=wlxkqnevMPpUcl+X284ee2Ek6O
	WaWs/bWC5Jh0TYjiayLZnq2VoM3/IS1aKmB+d+3UcTEp/zfSJfuYfSd03Eo2bCmgMgKONXhj3Cqvk
	QwiaZaJc02rbVnNK35MUJUZKCHOTEdQgOpbo5msYIEOxYNecOvS2h3YLZO8b7duP3V4a8aOsF/Wz+
	qi79dHcH5x9cZjE2BIyD8+7X+iqjz9sVgZ3/Nnyv5I7aHjt8jhqhcn29MPzDQ+cmEdmvg4A5EKVj3
	s/G8exEgzh2A/t1opriNqxGwUkzSU5TauqJS9QeyFZwBB4pnEzYJrLIeNgEXI2cVWNVv82aT6rprI
	fd7B4JiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsIY-00000008Pa2-0Xsd;
	Fri, 15 May 2026 13:09:50 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNsIV-00000008PZ8-3mWZ
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 13:09:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F5CF40268;
	Fri, 15 May 2026 13:09:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C660CC2BCB8;
	Fri, 15 May 2026 13:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778850587;
	bh=8HT7U6MbGUnPY3w7ftF7Pj8ZwTCOPc4Nj2sUdScJoM8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uETHaK/6JA4o/qdms2SZj2AD/cCQx5KtgTOIXmNolrOiywgskoZPcQsJ+SUDzsBjU
	 gawiHsCZRUZAFAZWcthszhJ/T6z5/9qpAx/oT5R3ptKpk/fW0k/XARmh4GsOxzjVxK
	 +fu7ZB1nSr9Ryrbvhyjw5jMUnsDFUynEWh8QqXMbqyHQNuwSaFsl2pcE/dfBoyPcHQ
	 xKf8Fmvthhj180RumlOUS43V496ujSK51NeZwOkKMSm5j5qt93epJWPCGFn95dx7iu
	 bYrfYDmjylyrYC3edupfu84JtDVYmIgg9hXozM+a4Mz5g22aJBFpK910YylCuG/Ezq
	 a5vkUB1Na3bdg==
Date: Fri, 15 May 2026 14:09:42 +0100
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Changhuang Liang <changhuang.liang@starfivetech.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v18 2/3] riscv: dts: starfive: Correct pwm nodes
Message-ID: <20260515-dandruff-outpour-7b3b6b5480db@spud>
References: <20260515054723.25024-1-hal.feng@starfivetech.com>
 <20260515054723.25024-3-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260515054723.25024-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_060948_218767_36C7D8F1 
X-CRM114-Status: GOOD (  15.86  )
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
Content-Type: multipart/mixed; boundary="===============9158791276050230717=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============9158791276050230717==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JriUJS52jcgo79we"
Content-Disposition: inline


--JriUJS52jcgo79we
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 01:47:21PM +0800, Hal Feng wrote:
> Each of the StarFive JH7100/JH7110 SoCs has 8 OpenCores PTC IP
> cores. One OpenCores PTC IP core can output one PWM channel.
>=20
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7100-common.dtsi      | 28 ++++++--
>  arch/riscv/boot/dts/starfive/jh7100.dtsi      | 69 ++++++++++++++++++-
>  .../boot/dts/starfive/jh7110-common.dtsi      | 27 ++++++--
>  .../boot/dts/starfive/jh7110-milkv-mars.dts   |  6 +-
>  .../dts/starfive/jh7110-milkv-marscm.dtsi     |  6 +-
>  .../dts/starfive/jh7110-pine64-star64.dts     |  6 +-
>  .../jh7110-starfive-visionfive-2-lite.dtsi    |  6 +-
>  .../jh7110-starfive-visionfive-2.dtsi         |  6 +-
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 69 ++++++++++++++++++-
>  9 files changed, 200 insertions(+), 23 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7100-common.dtsi
> index ae1a6aeb0aea..85106545090e 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -199,13 +199,23 @@ GPO_I2C2_PAD_SDA_OEN,
>  		};
>  	};
> =20
> -	pwm_pins: pwm-0 {
> -		pwm-pins {
> +	pwm0_pins: pwm0-0 {
> +		pwm0-pins {
>  			pinmux =3D <GPIOMUX(7,
>  				  GPO_PWM_PAD_OUT_BIT0,
>  				  GPO_PWM_PAD_OE_N_BIT0,
> -				  GPI_NONE)>,
> -				 <GPIOMUX(5,
> +				  GPI_NONE)>;
> +			bias-disable;
> +			drive-strength =3D <35>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate =3D <0>;
> +		};
> +	};
> +
> +	pwm1_pins: pwm1-0 {
> +		pwm1-pins {
> +			pinmux =3D  <GPIOMUX(5,
>  				  GPO_PWM_PAD_OUT_BIT1,
>  				  GPO_PWM_PAD_OE_N_BIT1,
>  				  GPI_NONE)>;
> @@ -359,9 +369,15 @@ &osc_aud {
>  	clock-frequency =3D <27000000>;
>  };
> =20
> -&pwm {
> +&pwm0 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pwm0_pins>;
> +	status =3D "okay";
> +};
> +
> +&pwm1 {
>  	pinctrl-names =3D "default";
> -	pinctrl-0 =3D <&pwm_pins>;
> +	pinctrl-0 =3D <&pwm1_pins>;
>  	status =3D "okay";
>  };
> =20
> diff --git a/arch/riscv/boot/dts/starfive/jh7100.dtsi b/arch/riscv/boot/d=
ts/starfive/jh7100.dtsi
> index 7de0732b8eab..4629e9747307 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100.dtsi
> @@ -360,9 +360,72 @@ watchdog@12480000 {
>  				 <&rstgen JH7100_RSTN_WDT>;
>  		};
> =20
> -		pwm: pwm@12490000 {
> -			compatible =3D "starfive,jh7100-pwm", "opencores,pwm-v1";
> -			reg =3D <0x0 0x12490000 0x0 0x10000>;
> +		pwm0: pwm@12490000 {
> +			compatible =3D "opencores,pwm-v1";
> +			reg =3D <0x0 0x12490000 0x0 0x10>;

NAK on the compatibles front, but this also looks very suspect, given
the size of the register regions, but I think it is actually correct.
You need to explain why it is correct in the commit message.

--JriUJS52jcgo79we
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCagcbFgAKCRB4tDGHoIJi
0sOZAQCxnM7BwwH632XmI1nkReaAbjpkqxb7gbx/dTUK9rxb9gEA25ebV2QgpQw4
q+nS+323xE/qF1dkL8S3ShWf/tgduwA=
=u+CZ
-----END PGP SIGNATURE-----

--JriUJS52jcgo79we--


--===============9158791276050230717==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============9158791276050230717==--

