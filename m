Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D32CCD183
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Oct 2025 22:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Qgzr6OPQUhQ3kZ5PoevDRBE6lbVaFMj/tf36i2Qp5/4=; b=TDLALB8obomxeP
	eX11JUuFYfXGm/dl9TUP8erP/YoXGQmy1btsRxPOW9yYHWGIn1DLD/7msY1vuUX1uLOwGWOrdwTCY
	FlC9aPv2hst38/iOqBbUJI/6kvnh0Nlj3yrjA156jAajzh/8DAZJ2rQ2ygynq7TlREpRLjT15y30d
	MiEqMWzMyFJ9+/lhYSaLw9iMM4gS4jVw9PCHIlquqrUBUs70G4yGHAd9WjwoDeO+MbItkDtWFAG0x
	NOaDUg3UoH1yW7XB5XYMyAOPxmW80VyeCbjz8HdC+wduTMwfBB9fkHJzg+9l4YuenBtU58+RGq+Rs
	j5jwhaJfJROS/yJtIrMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Wss-000000066Eh-3yhT;
	Thu, 16 Oct 2025 22:55:46 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9Wsp-000000066D0-40WP
	for linux-riscv@lists.infradead.org;
	Thu, 16 Oct 2025 22:55:45 +0000
Received: from [192.168.2.54] (unknown [98.97.26.134])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 0CF13B22042C;
	Fri, 17 Oct 2025 00:55:34 +0200 (CEST)
Message-ID: <7e31b240-2ffa-4946-af85-aaa45fe35199@freeshell.de>
Date: Thu, 16 Oct 2025 15:55:32 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 4/7] riscv: dts: starfive: jh7110-common: Move out some
 nodes to the board dts
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Paul Walmsley <pjw@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20251016080054.12484-1-hal.feng@starfivetech.com>
 <20251016080054.12484-5-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20251016080054.12484-5-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251016_155544_162253_498A00B5 
X-CRM114-Status: GOOD (  16.56  )
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



On 10/16/25 01:00, Hal Feng wrote:
> Some node in this file are not used by the upcoming VisionFive 2 Lite
> board. Move them to the board dts to prepare for adding the new
> VisionFive 2 Lite device tree.
> 
> Reviewed-by: E Shattow <e@freeshell.de>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7110-common.dtsi      | 19 --------
>  .../jh7110-deepcomputing-fml13v01.dts         | 46 +++++++++++++++++++
>  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 46 +++++++++++++++++++
>  .../dts/starfive/jh7110-milkv-marscm-emmc.dts |  9 ++++
>  .../dts/starfive/jh7110-milkv-marscm-lite.dts |  1 +
>  .../dts/starfive/jh7110-milkv-marscm.dtsi     | 32 +++++++++++++
>  .../dts/starfive/jh7110-pine64-star64.dts     | 46 +++++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 43 +++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 -------
>  9 files changed, 223 insertions(+), 35 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 5dc15e48b74b..8cfe8033305d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -281,14 +281,8 @@ &mmc0 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	bootph-pre-ram;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	cap-mmc-hw-reset;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc0_pins>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&emmc_vdd>;
>  	status = "okay";
>  };
>  
> @@ -298,8 +292,6 @@ &mmc1 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	bootph-pre-ram;
> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> -	disable-wp;
>  	cap-sd-highspeed;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins>;
> @@ -444,17 +436,6 @@ GPOEN_SYS_I2C6_DATA,
>  	};
>  
>  	mmc0_pins: mmc0-0 {
> -		 rst-pins {
> -			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> -					      GPOEN_ENABLE,
> -					      GPI_NONE)>;
> -			bias-pull-up;
> -			drive-strength = <12>;
> -			input-disable;
> -			input-schmitt-disable;
> -			slew-rate = <0>;
> -		};
> -
>  		mmc-pins {
>  			pinmux = <PINMUX(PAD_SD0_CLK, 0)>,
>  				 <PINMUX(PAD_SD0_CMD, 0)>,
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> index f2857d021d68..7535d62201f1 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -11,6 +11,52 @@ / {
>  	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
>  };
>  
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
> +	};
> +};
> +
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};
> +
> +&mmc0_pins {
> +	rst-pins {
> +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +		bias-pull-up;
> +		drive-strength = <12>;
> +		input-disable;
> +		input-schmitt-disable;
> +		slew-rate = <0>;
> +	};
> +};
> +
> +&mmc1 {
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +};
> +
>  &pcie1 {
>  	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
>  	phys = <&pciephy1>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index fdaf6b4557da..c2e7a91e460a 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -11,6 +11,25 @@ / {
>  	compatible = "milkv,mars", "starfive,jh7110";
>  };
>  
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
> +	};
> +};
> +
>  &gmac0 {
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
>  	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> @@ -22,6 +41,33 @@ &i2c0 {
>  	status = "okay";
>  };
>  
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};
> +
> +&mmc0_pins {
> +	rst-pins {
> +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +		bias-pull-up;
> +		drive-strength = <12>;
> +		input-disable;
> +		input-schmitt-disable;
> +		slew-rate = <0>;
> +	};
> +};
> +
> +&mmc1 {
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> index e568537af2c4..ce95496263af 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
> @@ -10,3 +10,12 @@ / {
>  	model = "Milk-V Mars CM";
>  	compatible = "milkv,marscm-emmc", "starfive,jh7110";
>  };
> +
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> index 6c40d0ec4011..63aa94d65ab5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
> @@ -14,6 +14,7 @@ / {
>  &mmc0 {
>  	bus-width = <4>;
>  	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
>  };
>  
>  &mmc0_pins {
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> index 25b70af564ee..af01d3abde2f 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi
> @@ -21,6 +21,25 @@ sdio_pwrseq: sdio-pwrseq {
>  	};
>  };
>  
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
> +	};
> +};
> +
>  &gmac0 {
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
>  	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> @@ -40,6 +59,19 @@ &i2c6 {
>  	status = "disabled";
>  };
>  
> +&mmc0_pins {
> +	rst-pins {
> +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +		bias-pull-up;
> +		drive-strength = <12>;
> +		input-disable;
> +		input-schmitt-disable;
> +		slew-rate = <0>;
> +	};
> +};
> +
>  &mmc1 {
>  	#address-cells = <1>;
>  	#size-cells = <0>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index 31e825be2065..6faf3826c5c3 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -14,6 +14,25 @@ aliases {
>  	};
>  };
>  
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
> +	};
> +};
> +
>  &gmac0 {
>  	starfive,tx-use-rgmii-clk;
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> @@ -44,6 +63,33 @@ &i2c0 {
>  	status = "okay";
>  };
>  
> +&mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
> +};
> +
> +&mmc0_pins {
> +	rst-pins {
> +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +		bias-pull-up;
> +		drive-strength = <12>;
> +		input-disable;
> +		input-schmitt-disable;
> +		slew-rate = <0>;
> +	};
> +};
> +
> +&mmc1 {
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +};
> +
>  &pcie1 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 5f14afb2c24d..9cd79fe30d19 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -13,6 +13,25 @@ aliases {
>  	};
>  };
>  
> +&cpu_opp {
> +	opp-375000000 {
> +		opp-hz = /bits/ 64 <375000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-500000000 {
> +		opp-hz = /bits/ 64 <500000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-750000000 {
> +		opp-hz = /bits/ 64 <750000000>;
> +		opp-microvolt = <800000>;
> +	};
> +	opp-1500000000 {
> +		opp-hz = /bits/ 64 <1500000000>;
> +		opp-microvolt = <1040000>;
> +	};
> +};
> +
>  &gmac0 {
>  	status = "okay";
>  };
> @@ -38,9 +57,33 @@ &i2c0 {
>  };
>  
>  &mmc0 {
> +	cap-mmc-highspeed;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&emmc_vdd>;
>  	non-removable;
>  };
>  
> +&mmc0_pins {
> +	rst-pins {
> +		pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> +				      GPOEN_ENABLE,
> +				      GPI_NONE)>;
> +		bias-pull-up;
> +		drive-strength = <12>;
> +		input-disable;
> +		input-schmitt-disable;
> +		slew-rate = <0>;
> +	};
> +};
> +
> +&mmc1 {
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 6e56e9d20bb0..a380d3dabedd 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -205,22 +205,6 @@ core4 {
>  	cpu_opp: opp-table-0 {
>  			compatible = "operating-points-v2";
>  			opp-shared;
> -			opp-375000000 {
> -					opp-hz = /bits/ 64 <375000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-500000000 {
> -					opp-hz = /bits/ 64 <500000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-750000000 {
> -					opp-hz = /bits/ 64 <750000000>;
> -					opp-microvolt = <800000>;
> -			};
> -			opp-1500000000 {
> -					opp-hz = /bits/ 64 <1500000000>;
> -					opp-microvolt = <1040000>;
> -			};
>  	};
>  
>  	thermal-zones {

Emil, for your consideration:

jh711x.dtsi  (formerly jh7110.dtsi)

jh711x-common.dtsi (formerly jh7110-common.dtsi, cut opp table and paste
to jh7110-common.dtsi, cut out mmc definitions pasted elsewhere either
to "mmc{0,1}-card, mmc{0,1}-emmc, mmc{0,1}-sdio" dtsi snippets or
duplicated to board files)

jh7110-common.dtsi (includes jh711x-common.dtsi, adds opp table)

jh7110s-common.dtsi (includes jh711x-common.dtsi, adds opp table)

This makes sense to me having two additional dtsi files of the CPU
operating power points (on what is apparently binned silicon) to
maintain for supporting 8+ boards. The decision to split or not split
out the mmc/sdio configuration into common dtsi snippets is less clear
to me, but we do have examples now of all the uses (card, eMMC, SDIO) on
each of the ports mmc0 mmc1 so it might have some benefit; for sure
keeping these assumptions about mmc0 mmc1 functionality in the one
'-common.dtsi' is an obstacle to adding sdio module configurations.

-E

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
