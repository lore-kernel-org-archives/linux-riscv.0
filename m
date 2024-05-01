Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 783A5C4345F
	for <linux-riscv@archiver.kernel.org>; Wed,  1 May 2024 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i+PoLey+TsEixZKBdNCHh6UGE/eDxVcczSGavi5MinA=; b=tZxmJmtWuuHflMCkr2L99f4hWS
	Obho8578wPLtfBeYGJa2zqf6BecuTB1zfrbwtXlE/ub8BjrbfVzL1GjIgHyN2s/FaZPCwJ3uOjWBc
	MiLzfhTn3GXMRrg81DrDKj8LIplxeQYihSToNqpnwiejodborK2/39ddHXBeQzX8icdTQKPRW+sSJ
	xViQEDPiuMzHkPDoAmsosooGCOj+pLUdijD/iGrbvZufaoJrpjqS9CiZ4Yq4M1iM2/HTYSlNPq7zd
	rfPjMx/NXuy8RrqJWx9M0mLoquNVOa6jC+S7YnfiUNHn83YBRRgqzgkvJmgcVjCocOsrUl7HBzFVG
	vLoSt7ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2C1t-0000000A13m-0kjh;
	Wed, 01 May 2024 15:37:57 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2C1p-0000000A12F-2r77
	for linux-riscv@lists.infradead.org;
	Wed, 01 May 2024 15:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id ED83BCE131B;
	Wed,  1 May 2024 15:37:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D043C072AA;
	Wed,  1 May 2024 15:37:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714577871;
	bh=tOaXeYboyg42eCPqOMwORm62P596gWjbt6g51zfe0Vc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nQRo45x6cv1XiZVauPVHrKv0tMy1MzUFsbyTNl1CZlAdqI42DWLtymOOv4AJvNvsa
	 PnbUiil5j3X15lAmFo/7elGuJcr2ajnhDlrJNvH9fGPavZMnj7yz1uaNbyiJXgzia1
	 B5SVlYxOXbBxyJFW2aoBftzdWN6dppGsVIZ6ffX2+Ymb2g/jrj0pjNHguV0KhvlvBy
	 uZjLYorjD+GfHoa4qBSYq5ZZULSjLrvOhhY98/8tCU+4/y4266k3m5qK3URa3WD8qn
	 2KMw5sn+yaQ3xFoHHMEdC7oNcAocEPYe7X7hyZKeIkjYKCQK4ZVyS7es7gYfjEILsL
	 3a7Bqp4ohEmUA==
Date: Wed, 1 May 2024 16:37:47 +0100
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: microchip: add pac1934 power-monitor to
 icicle
Message-ID: <20240501-throwing-squeegee-7c3697167309@spud>
References: <20240501-spearman-primary-17df3c21c770@spud>
MIME-Version: 1.0
In-Reply-To: <20240501-spearman-primary-17df3c21c770@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240501_083754_106806_DCD29B39 
X-CRM114-Status: GOOD (  18.64  )
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
Content-Type: multipart/mixed; boundary="===============6361946547228467771=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6361946547228467771==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="+MZcxOM3iSq3hzNf"
Content-Disposition: inline


--+MZcxOM3iSq3hzNf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 01, 2024 at 04:36:31PM +0100, Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>=20
> The binding for this landed in v6.9, add the description. In the
> off-chance that there were people carrying local patches for this based
> on the driver shipped on the Microchip website (or vendor kernel) both
> the binding and sysfs filenames changed during upstreaming.
>=20
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> CC: linux-kernel@vger.kernel.org

I thought I send this out last week, but I could not find the patch on
either lore or patchwork when I went to apply it today, so I must not
have...

> ---
>  .../boot/dts/microchip/mpfs-icicle-kit.dts    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/ris=
cv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 222a39d90f85..f80df225f72b 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -100,6 +100,38 @@ &i2c0 {
> =20
>  &i2c1 {
>  	status =3D "okay";
> +
> +	power-monitor@10 {
> +		compatible =3D "microchip,pac1934";
> +		reg =3D <0x10>;
> +
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		channel@1 {
> +			reg =3D <0x1>;
> +			shunt-resistor-micro-ohms =3D <10000>;
> +			label =3D "VDDREG";
> +		};
> +
> +		channel@2 {
> +			reg =3D <0x2>;
> +			shunt-resistor-micro-ohms =3D <10000>;
> +			label =3D "VDDA25";
> +		};
> +
> +		channel@3 {
> +			reg =3D <0x3>;
> +			shunt-resistor-micro-ohms =3D <10000>;
> +			label =3D "VDD25";
> +		};
> +
> +		channel@4 {
> +			reg =3D <0x4>;
> +			shunt-resistor-micro-ohms =3D <10000>;
> +			label =3D "VDDA_REG";
> +		};
> +	};
>  };
> =20
>  &i2c2 {
> --=20
> 2.43.0
>=20

--+MZcxOM3iSq3hzNf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjJhywAKCRB4tDGHoIJi
0vfCAQDUQJl/9kA+o/1f2k4AfVeR23NVv5bpvBhPTJlsCaqglgD/UwU8NzXpVJ/v
GvE592tD3NfALiCT5CbMseoQWp0xugY=
=iZ82
-----END PGP SIGNATURE-----

--+MZcxOM3iSq3hzNf--


--===============6361946547228467771==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6361946547228467771==--

