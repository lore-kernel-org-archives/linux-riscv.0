Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F16B6C7619A
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gJQJLSDUPvrqZ6kNvbEJo5qjGe39u4iiEmuKs95op0U=; b=PVQLD6HyM5CJe9bZS0oI5Ug/Qo
	CquD4HBbLrc0q+WaN+GX6k3QzhaUf44XwB/2rb++gV8+F9jn3YvQKYzEzQEjXiHdC0ORGqfjcXfoL
	DAYQH0DqdFEaUxjhXeooyya86M6+1H7ZR6SYFkqHCxbozCj6TMxm0aJSNqL/FbC4VjM+5fh+bTZcn
	O6oyNxYYGv2xt3so7PRjUTZqZ0RsZZxoAVw2MW/tomjnAcrWaW//TJKLvB+XPs9NXsb1i9HHoK6RJ
	n4R+H1Ini2pdM1qnYamXmwzRyteupBTC3eaoBKM32eYOMA3HvHDn+E0OgHC7NmAhlKCJyhGoEnzph
	D0FsyAQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmA4X-00GzwS-2C;
	Tue, 11 Apr 2023 09:13:53 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmA4U-00GzvV-1c
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 09:13:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681204430; x=1712740430;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=jqwQxom5IR5Ep7ajLiRjlvWzVlD1fmsVr0UZ+TZ7eTA=;
  b=lHKPVYE2KhcmiLjMyP8ZlstX22/OsjkKcb+MBX7OTVjF7djna38AySWo
   ejheIYphn5wwOCN5dnUCjz2ACXNgjUhXazlKbw1EhXbKzV6C+C5shuRm6
   cm5h81fOKJSjxGtwHKvCN71N7D+oxDEF4f+3doKk9V0/ujwEoVHXqkuMM
   IJHZghodxspqqJAzNatAS6CZC6sF0JJr+5kzW6kuxCCEk2b6UUNo02S+v
   B5VRhPjsW+1jZI+gZXvZfjRMnBv3K6hkqW0RgSmmG0gdGeoX4kO6j9leV
   inhlHXwzTrJ9WtqzDydhb4Pp+uU13sVOozhmUgloH+0xxUCHaYpEjw/A1
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="asc'?scan'208";a="146440571"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 02:13:43 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 02:13:42 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 02:13:40 -0700
Date: Tue, 11 Apr 2023 10:13:24 +0100
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
Subject: Re: [PATCH v1 1/3] riscv: dts: starfive: Enable axp15060 pmic for
 cpufreq
Message-ID: <20230411-chimp-unvarying-142394732ff5@wendy>
References: <20230411083257.16155-1-mason.huo@starfivetech.com>
 <20230411083257.16155-2-mason.huo@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411083257.16155-2-mason.huo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_021350_601906_884655A4 
X-CRM114-Status: GOOD (  14.17  )
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
Content-Type: multipart/mixed; boundary="===============2164308092819108372=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2164308092819108372==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4LuYI8HlWhg/F6SG"
Content-Disposition: inline

--4LuYI8HlWhg/F6SG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 11, 2023 at 04:32:55PM +0800, Mason Huo wrote:
> The VisionFive 2 board has an embedded pmic axp15060,
> which supports the cpu DVFS through the dcdc2 regulator.
> This patch enables axp15060 pmic and configs the dcdc2.
>=20
> Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
> ---
>  .../starfive/jh7110-starfive-visionfive-2.dtsi    | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 2a6d81609284..df582bddae4b 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -114,6 +114,21 @@ &i2c5 {
>  	pinctrl-names =3D "default";
>  	pinctrl-0 =3D <&i2c5_pins>;
>  	status =3D "okay";
> +
> +	pmic: axp15060_reg@36 {

No underscores in node names please & "pmic" is the generic node name
for pmics.

Cheers,
Conor.

> +		compatible =3D "x-powers,axp15060";
> +		reg =3D <0x36>;
> +
> +		regulators {
> +			reg_dcdc2: dcdc2 {
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-min-microvolt =3D <500000>;
> +				regulator-max-microvolt =3D <1540000>;
> +				regulator-name =3D "vdd-cpu";
> +			};
> +		};
> +	};
>  };
> =20
>  &i2c6 {
> --=20
> 2.39.2
>=20

--4LuYI8HlWhg/F6SG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDUktAAKCRB4tDGHoIJi
0ptHAQCDKGI3XyRxsVsoA9ciou5bbpoELojUFMtGujWP5aLzMgD/fvEH3XsXgs4X
IK9tDzpwxqp7DnaE/yiMSrJHFzcauw0=
=QUPe
-----END PGP SIGNATURE-----

--4LuYI8HlWhg/F6SG--


--===============2164308092819108372==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2164308092819108372==--

