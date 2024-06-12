Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEC1C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ffyHvwoeiXV+1cm8Tg0hTsvrPcuu/1CT/NpY0heQ/KE=; b=cIzGD0VpMwy+8mi/ytiVlU8xu1
	VIZocEACO0HsDFbxS/jy6VdQBG0rt/pvCYfsQvIIEuVZH0trH8oR5M8qagDACf+ydE59C15b4FHqG
	ArUm6J2b9JWNzm3sAtGo7grD/I9+gI8WCaeNvBM/zAGiuoNXYtHTAgG65nSqQWc0E0ybT9MnOipek
	pYUmByvCirm0BCKMemYDimYgjfIjttPdsj5LN6naDH2ge0/m/m99E1Q/xYbQ3W2EghP0WXmjanKSk
	SVNTP2uR5Vdw03x63MEwU6lRkLEy04u/eoWvz3a4jHGwHa/LVFF0P4m2V5zQqPLdVxxjJcGcRa6d2
	QhuBpIrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQgG-0000000DLlH-1iQH;
	Wed, 12 Jun 2024 16:18:36 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHQgA-0000000DLk8-32KJ
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 16:18:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0279F614D3;
	Wed, 12 Jun 2024 16:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CB0CC116B1;
	Wed, 12 Jun 2024 16:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718209109;
	bh=mrAtLefxv0thjdim3MyV19oF1GLyA84RC7ijpbytDEw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=onwfcia5tZxlbotmy2KGSRsYmaPaB7lrhHe+mlX83R7AZ8ZDeoHmgVs63qFed1Sjl
	 KEfDFE4XdpGBK7lTX/MHY/xTO7NOYNfyGOJsHFjGkba34hEPoLfxAG8DSd+qYvjL2c
	 Hv2EyXyFqPB6u87YvJOx6gy6cIPCyaY4RegWn+R9mqybpoSIZ8eSvjWnfRxOA40V2e
	 yoEx/aUjfpNt040SOAtEz/wYrFdkij/Kobq3T0Qjlly1cr7RwuMCUYg25GWxeGY3+L
	 kTPoI1OY2+XhHXfRAajpY/jjFu1lAnooRtLmBKbY0Axtir/afPn8jAUTIKSBMx6yMi
	 gU5eMWR9gSq/g==
Date: Wed, 12 Jun 2024 17:18:25 +0100
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: kernel@esmil.dk, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	aou@eecs.berkeley.edu, william.qiu@starfivetech.com,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	stable@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: starfive: Set EMMC vqmmc maximum voltage
 to 3.3V on JH7110 boards
Message-ID: <20240612-various-verbose-8c1a5db7d25a@spud>
References: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB261189B5D946BDE69398EE3A98C02@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_091830_833033_EC029F55 
X-CRM114-Status: GOOD (  17.60  )
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
Content-Type: multipart/mixed; boundary="===============1019649084412939257=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1019649084412939257==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xi1bAWiRrsUVmPLp"
Content-Disposition: inline


--Xi1bAWiRrsUVmPLp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 12, 2024 at 06:33:31PM +0800, Shengyu Qu wrote:
> Currently, for JH7110 boards with EMMC slot, vqmmc voltage for EMMC is
> fixed to 1.8V, while the spec needs it to be 3.3V on low speed mode and
> should support switching to 1.8V when using higher speed mode. Since
> there are no other peripherals using the same voltage source of EMMC's
> vqmmc(ALDO4) on every board currently supported by mainline kernel,

I should've asked last time around, does the star64 also support 3.3
volts?

> regulator-max-microvolt of ALDO4 should be set to 3.3V.
>=20
> Cc: stable@vger.kernel.org
> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> Fixes: 7dafcfa79cc9 ("riscv: dts: starfive: enable DCDC1&ALDO4 node in ax=
p15060")
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 37b4c294ffcc..c7a549ec7452 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -244,7 +244,7 @@ emmc_vdd: aldo4 {
>  				regulator-boot-on;
>  				regulator-always-on;
>  				regulator-min-microvolt =3D <1800000>;
> -				regulator-max-microvolt =3D <1800000>;
> +				regulator-max-microvolt =3D <3300000>;
>  				regulator-name =3D "emmc_vdd";
>  			};
>  		};
> --=20
> 2.39.2
>=20

--Xi1bAWiRrsUVmPLp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZmnKUQAKCRB4tDGHoIJi
0qGWAP9hFPT8FJ7ViNXuiJzrGnuM6DWyDGEUokl7LP4eNgEE0QD+IX8bMeyax6R+
t7D7uPpBVm1HKna+WWxbTfeoycsirwA=
=VCME
-----END PGP SIGNATURE-----

--Xi1bAWiRrsUVmPLp--


--===============1019649084412939257==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1019649084412939257==--

