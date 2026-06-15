Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D03ECD98C5
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LOTRFtdaqUWwn7/FNvSIXkkWdPwx3gTktWBrfdbY2uY=; b=E4peE2RqA+JGtWPs8tH2zjwx6F
	I81ih4qiO7AYrUqhPTloCdJflxdKho0xikIRWqPpz8fFvrjWOAUdj4PZAEAjl/KiBpvNFWX6JszGF
	lbc7xz9X5ZQ0vmSF6CKXkjAvH4eSSvVSGmMLwNY1YovEz72TUcsxX7t8ffafLD24osOUwSSJWuw7/
	DfzGighNiYKacuJ8rML628wEnRSTGb0hZNrAnMDZW619HBA1NjYf94YlgQ8O32KqkkrMhA/qPaNHA
	BGwGXTIx5Eo9sIw0LN3ZHD/hSLr+raIgrkfZvhk8CRO/FLzTy7HNyvPPj4LZvfzYb9SxKVBwMRc/h
	+yimDzwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAHf-0000000EaGn-2Oxn;
	Mon, 15 Jun 2026 16:35:35 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZAHc-0000000EaGT-2vFZ
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 16:35:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C7EC16008A;
	Mon, 15 Jun 2026 16:35:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 632031F000E9;
	Mon, 15 Jun 2026 16:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781541331;
	bh=5znJKXLT2HaHGGTVLs4b+dODpenXWRmBFByF6rqYa/I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NZpKoayIaRFcklMPGhvfhL/+ecK1bfO8I1VOUwtq0vvSBZ/xqBBVXY892HVp9d/se
	 IiFcb4olRef+vz1QHcdLfvVI2GxJME7xlZNRDjPj0p07beYY8FlrJiSBl4tmWvLxs5
	 cgXdOJ/qNsv67TPvAsNNLNLojvEx2bnErG4nzO+lTQEWvJyujKEzX1SWOWW0msQgN5
	 3DOv7e9fL8QJ+0pwBeZXkACWT6P3brFWI6aaLT+dayjq7r5eOZ+DkFfv6t45dhyaRt
	 6VWUuCRL27GDFBJkGgdLA/X4O28zYWEMjYWZI/Nsll3+QvIFq/VdeKB4p8mUdiNMiV
	 mO58vV4PGk9Mg==
Date: Mon, 15 Jun 2026 17:35:26 +0100
From: Conor Dooley <conor@kernel.org>
To: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>,
	Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: Re: [PATCH 6/7] riscv: dts: eswin: add I2C controller support
Message-ID: <20260615-lumpiness-profusely-155422288c31@spud>
References: <20260615122016.1110206-1-pinkesh.vaghela@einfochips.com>
 <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>
MIME-Version: 1.0
In-Reply-To: <20260615122016.1110206-7-pinkesh.vaghela@einfochips.com>
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
Content-Type: multipart/mixed; boundary="===============2944051201917844687=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2944051201917844687==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TWqu2/KO2WnbtTyO"
Content-Disposition: inline


--TWqu2/KO2WnbtTyO
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 05:50:15PM +0530, Pinkesh Vaghela wrote:
> From: Pritesh Patel <pritesh.patel@einfochips.com>
>=20
> Add I2C nodes for EIC7700 SoC.
> Also add nodes for corresponding slave devices in dts file and
> enable them for HiFive Premier P550 board
>=20
> Signed-off-by: Pritesh Patel <pritesh.patel@einfochips.com>
> Signed-off-by: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
> ---
>  .../dts/eswin/eic7700-hifive-premier-p550.dts |  52 ++++++
>  arch/riscv/boot/dts/eswin/eic7700.dtsi        | 156 ++++++++++++++++++
>  2 files changed, 208 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts b/=
arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> index e7bb96e14958..0f0c98474c62 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> +++ b/arch/riscv/boot/dts/eswin/eic7700-hifive-premier-p550.dts
> @@ -130,6 +130,58 @@ &gpio111_pins {
>  	input-disable;
>  };
> =20
> +&aon_i2c0 {
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c02";
> +		reg =3D <0x50>;
> +	};
> +};
> +
> +&aon_i2c1 {
> +	status =3D "okay";
> +
> +	pac1934@10 {

Generic node name here please. adc I think.

> +		compatible =3D "microchip,pac1934";
> +		reg =3D <0x10>;
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel@1 {
> +			reg =3D <0x1>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_SOM";
> +		};
> +
> +		channel@2 {
> +			reg =3D <0x2>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_SOC";
> +		};
> +
> +		channel@3 {
> +			reg =3D <0x3>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_CPU";
> +		};
> +
> +		channel@4 {
> +			reg =3D <0x4>;
> +			shunt-resistor-micro-ohms =3D <1000>;
> +			label =3D "VDD_LPDDR";
> +		};
> +	};
> +
> +	ina226@44 {

And here. power-sensor.

> +		compatible =3D "ti,ina226";
> +		reg =3D <0x44>;
> +		#io-channel-cells =3D <1>;
> +		label =3D "sys_power";
> +		shunt-resistor =3D <1000>;
> +	};
> +};
> +
>  &pinctrl {
>  	vrgmii-supply =3D <&vcc_1v8>;
>  };
> diff --git a/arch/riscv/boot/dts/eswin/eic7700.dtsi b/arch/riscv/boot/dts=
/eswin/eic7700.dtsi
> index f8caf39616b2..28706431b2c0 100644
> --- a/arch/riscv/boot/dts/eswin/eic7700.dtsi
> +++ b/arch/riscv/boot/dts/eswin/eic7700.dtsi
> @@ -315,6 +315,162 @@ uart4: serial@50940000 {
>  			status =3D "disabled";
>  		};
> =20
> +		i2c0: i2c@50950000 {
> +			compatible =3D "snps,designware-i2c";

Missing a soc-specific compatible here for all i2c controllers.


Cheers,
Conor.

--TWqu2/KO2WnbtTyO
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajApzgAKCRB4tDGHoIJi
0ksLAP9MCm8DtOl/v4d+aaZWsWZ+XHfD7sZbR9Qo1ZuClxlm/wD/ZX6U2CqQb1ii
RDdHwM5vMOOKNcN/xi9jYh5691NKdQ8=
=pfvH
-----END PGP SIGNATURE-----

--TWqu2/KO2WnbtTyO--


--===============2944051201917844687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2944051201917844687==--

