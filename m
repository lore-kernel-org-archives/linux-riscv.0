Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 257F2CCF2C9
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 21:45:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=61FyqxCvApEq2fv7WAQEzrX6anO9MlopB4SajkJjaoE=; b=3aiFQzolqtUukL
	SY52qQiJcdoP/e+79+xxzH2u2Gj97hKJJo0fh2vTZ2zIFEBJdUzsvaXAMEBLs+wIe/ztxZQFvMLUg
	HB2wTU9NQG35J3sleC3eQwXNspsKJkXAMGC4EIAGQmNhcTiBrXs4YfcNxXq6r08Vbl0pb/ygZUkc3
	cdwjpNuO51gh98ALnWh63emwgCqW/kIh11+Zt7gZrTloGP/HxkH2Du7T+1Oon2UYZa68xnWFvFN9N
	sN2/z5Fwe09mavGw7bQajm7oljO3pzzEW+KRYLRf5tyJBDlLHsHDUW3VNdTh2bEDmG86Y0CxryDIn
	0tfMOW7UlpZuy9eWUcXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xICCs-00000005HPI-012N;
	Sat, 17 Oct 2026 21:44:46 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xICCo-00000005HOu-3qDF
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 21:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=freeshell.de;
	s=s2025; t=1792273465;
	bh=s/wVudeSgmsXY2dWTplVbFIoFXGODJ+yqwF0jxDKHAY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kX2llkKe9MgLXAdyhC9lLGNE+erxsxxUEptOuqk0TgMVOnIgZhdVGj79al1WTnP8/
	 3jQJd7rIZRPisbeEEFuYhcPOOhT9YHOrN0KvkGUVTkNs/B+3cgwllQq6ZiH0i3phep
	 67f8HNft2EId89VNoObXetLvw4zSNopHOuE9WN70tWJHtAG0OYx4y0+qoGTU4qOWBw
	 pDdGvWULdomVacVEUCDTALtXbIrFEZhBOG0M7jvdc99gvDCz8eT9dGTXsydObzfZe0
	 26Z9dKdx8iHD0/1j4IlYajz9+lTs6PBVP8t9nyiQMl+Y6X3pScP4eq5esnANBZmOo6
	 NWTbff2PDEA0w==
Received: from [IPV6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc] (unknown [IPv6:2605:59ca:364f:d400:1b91:6b30:22c2:fffc])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 59401B2202DA;
	Sat, 17 Oct 2026 23:44:23 +0200 (CEST)
Message-ID: <13d6926f-f085-4214-8051-7bf7b5d92b67@freeshell.de>
Date: Sat, 17 Oct 2026 14:44:21 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>, Yixun Lan <dlan@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
 <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20261017180141.3477743-3-alan.tseng.cs@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_144443_425894_59DADF41 
X-CRM114-Status: GOOD (  21.17  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Hung-Chun,

On 10/17/26 11:01, Hung-Chun Tseng wrote:
> On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
> the board, and before DRAM training it programs the P1 PMIC (0x41 on
> i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
> need the flash on QSPI.

I think this statement is too much a description of software. It is not
interesting what the user-provided SPL does of some other software
project here for the hardware description in Linux device tree.

If the BootROM does this EEPROM configuration, then we could reasonably
extend bootph-pre-ram tags with the understanding that any SPL will need
those same interfaces. Does BootROM configure the EEPROM peripheral for
access? If not, I think the justification is weak here to include this.

Ask vendor-employed developer(s) to give us a flow chart of the BootROM
boot flows and list of configured peripherals in each boot flow. At a
minimum we should have those peripherals configured and refer to that
correspondance for justification. Additional to this we should identify
what is not configured by the BootROM.

> 
> Mark these board peripherals bootph-pre-ram on the boards that have
> them, together with i2c2 where the EEPROM sits. i2c8 is tagged in
> k1.dtsi, as every K1 board connects the PMIC there.
> 
> Assisted-by: claude-opus-5-5 dtbs_check
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 6 ++++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 4 ++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 5 +++++
>  6 files changed, 35 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> index 81c40df2a..acb8fa2e6 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> @@ -64,6 +64,7 @@ &pdma {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	status = "okay";
> @@ -71,6 +72,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>;
>  		pagesize = <16>;
>  		read-only;
> @@ -100,6 +102,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -113,6 +116,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -127,6 +131,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -155,6 +160,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 58035d886..b91db3204 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -187,6 +187,7 @@ &qspi {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> @@ -194,6 +195,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
>  		pagesize = <16>;
>  		read-only;
> @@ -223,6 +225,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -236,6 +239,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1_0v9: buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -250,6 +254,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -278,6 +283,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 635e95aad..d2a39cf55 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -201,6 +201,7 @@ &pdma {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> @@ -208,6 +209,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c04";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC18 */
>  		pagesize = <16>;
>  		read-only;
> @@ -230,6 +232,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -243,6 +246,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1_0v9: buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -257,6 +261,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -285,6 +290,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> @@ -386,6 +392,7 @@ &qspi {
>  	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		spi-max-frequency = <26500000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 23f32a8a3..a3d0e38ac 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -160,6 +160,7 @@ &pdma {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	pinctrl-names = "default";
>  	status = "okay";
> @@ -167,6 +168,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>; /* EEPROM_VCC1V8 */
>  		pagesize = <8>;
>  		read-only;
> @@ -199,6 +201,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -212,6 +215,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1_0v9: buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -226,6 +230,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -254,6 +259,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> @@ -353,6 +359,7 @@ &qspi {
>  	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		spi-max-frequency = <26500000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index eb77aae9d..5e2fde8be 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -187,6 +187,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&vcc4v0>;
>  		vin2-supply = <&vcc4v0>;
> @@ -200,6 +201,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1_0v9: buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -214,6 +216,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -242,6 +245,7 @@ buck6 {
>  			};
>  
>  			aldo1_3v3: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 790234f35..d4adfc5b7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -214,6 +214,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&vcc4v0>;
>  		vin2-supply = <&vcc4v0>;
> @@ -227,6 +228,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1_0v9: buck1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -241,6 +243,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -269,6 +272,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;
> @@ -366,6 +370,7 @@ &qspi {
>  	flash@0 {
>  		compatible = "jedec,spi-nor";
>  		reg = <0>;
> +		bootph-pre-ram;
>  		spi-max-frequency = <26500000>;
>  		spi-rx-bus-width = <4>;
>  		spi-tx-bus-width = <4>;

I do not agree with the "trust me, bro, I need this to boot" approach to
device tree upstream if it is at all avoidable. However it is difficult
to know without a listing of the BootROM.

With that, and having no visibility into the workings of BootROM myself,
the shape of this appears good. I'd like to see that discussion happen
about what BootROM is doing and more specifically what it is not doing
that we are amending for the benefit of software in this description of
hardware.

Reviewed-by: E Shattow <e@freeshell.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
