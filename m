Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B142BC76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 09:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qoihqxNNxGcgkU8+btYySlKZm9km1o+04JIXQivexYg=; b=fDUrCB5l+zUdMM3Mjsh8z32u1O
	GMP7RYwWHZ2RwRfRbAajaIsHCmJhk69zQjhGhfgUuY+bJZkTYS0hUPrpyo1nQZjtrheC31T1BP9Wv
	nUnr9sp90xl+UPvFmNO+L5xTpKCb3yG3OA3lRSmYRyR/OKSYy4BamfF7lxc71DC9fZEDrKuqKoA3Q
	WaJjWLhxGvr1KjTkQVaqOF/nZXY96nRIFf0KR50XDgU5fq1z78zAVV1PjZq5PwIrP8UbuKho7z1it
	gHHRcHaMhoP5wOE8hXjrkX2m7jSwWRQFTw3sry3QAlhyxh4bfzpl2tEyf0q7qNQlc1nOGOz9kRw6D
	1bKmp9Fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9xT-00Gz5t-2W;
	Tue, 11 Apr 2023 09:06:35 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9xR-00Gz5Y-0Q
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 09:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681203992; x=1712739992;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=vEZy6BehLxjne3ptGrDQ5tuFpZWO8/3pHXdX7Cm/X0w=;
  b=S55NNKPpyYS/0SVDJd224n0Eu5HoXNywaFCUfDdTgtGQfn9MD53ZFm0l
   PBzo/a+XQQ+tjtUQwMuDDocj8dCvX+MaA7DZEnVB2F76a2s4yIhPd8vK2
   U7oRt3fcpSWO1j3Y2M98xgWVGQnO8Ci2mZZdWvsVSqwaLQXVocRJlcsQ2
   Y0o+kaxdITy9j+APOaxzVmNzwD6Z2ErDmnNL5qnD8sPRq5IqZgiGZhH3i
   N7ezvajCKHaHiBECF2+XPMcbitlukCr1p/RD6fP6JWqFeCvADWNO8v/fh
   6aruuHhh3ylS2gKr9SoCKL5tW1xuf22YGwOzXQjufIcs8DCpbEsbKU/Oj
   A==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="146439286"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 02:06:31 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 02:06:24 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 02:06:22 -0700
Date: Tue, 11 Apr 2023 10:06:06 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Mason Huo <mason.huo@starfivetech.com>
CC: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Shengyu Qu <wiagn233@outlook.com>,
	<linux-pm@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH v1 3/3] riscv: dts: starfive: Add cpu scaling for JH7110
 SoC
Message-ID: <20230411-darling-chump-faaf8dec29ef@wendy>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-4-mason.huo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411083257.16155-4-mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_020633_248631_D8B3C038 
X-CRM114-Status: GOOD (  14.63  )
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
Content-Type: multipart/mixed; boundary="===============5270017568605061388=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============5270017568605061388==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="9RmMYoUwAG4qQ11d"
Content-Disposition: inline

--9RmMYoUwAG4qQ11d
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Mason,

On Tue, Apr 11, 2023 at 04:32:57PM +0800, Mason Huo wrote:
> Add the operating-points-v2 to support cpu scaling
> on StarFive JH7110 SoC.

(btw, there's no need to wrap commit messages at 52 columns, you have
72 to work with)

> It supports up to 4 cpu frequency loads.
>=20
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 25 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 25 +++++++++++++++++++
>  2 files changed, 50 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index df582bddae4b..ae446b268e78 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -228,3 +228,28 @@ &uart0 {
>  	pinctrl-0 =3D <&uart0_pins>;
>  	status =3D "okay";
>  };
> +
> +&U74_1 {
> +	clocks =3D  <&syscrg JH7110_SYSCLK_CPU_CORE>;
> +	clock-names =3D "cpu";
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&U74_2 {
> +	clocks =3D  <&syscrg JH7110_SYSCLK_CPU_CORE>;
> +	clock-names =3D "cpu";
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&U74_3 {
> +	clocks =3D  <&syscrg JH7110_SYSCLK_CPU_CORE>;
> +	clock-names =3D "cpu";
> +	cpu-supply =3D <&reg_dcdc2>;
> +};
> +
> +&U74_4 {
> +	clocks =3D  <&syscrg JH7110_SYSCLK_CPU_CORE>;
                ^^
There's a double space in each of these.

> +	clock-names =3D "cpu";
> +	cpu-supply =3D <&reg_dcdc2>;
> +};

How come these two clock properties are being added in <board>.dtsi?
Should they not be in <soc>.dtsi?

Thanks,
Conor.

--9RmMYoUwAG4qQ11d
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDUi/gAKCRB4tDGHoIJi
0nEZAP9rj/CuBXvNfE91n2hagQY3313ZTlg0J0xHWjSonAhoBwD/cwrCXvzzmaqL
aVdM9JA8ul3lc3HBxlANw2iL7G3eWAI=
=Ix5Y
-----END PGP SIGNATURE-----

--9RmMYoUwAG4qQ11d--


--===============5270017568605061388==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5270017568605061388==--

