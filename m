Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F30CA0EFA
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Aug 2025 19:13:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7/BSoFkOCoo7VayH8wJdh7uhIY4Fz94EQT7BxKkqifU=; b=t8Ko+JlnG1rikl
	CbejfiJSpfbaZq/ZXdlyEm2VeRiPGwUoTzIbsNnuXm1j/Z3rN+o0yWJsboimlR+ZQwqCgnuwJfAOI
	D/AZgPKUikZWX4cKG60xrRvRPPoOnZcHOmcXoGrgpfaND4zzGdJHxTfEwBcmvOSq64TF39L4wzGty
	Dc5fxMbdKYnkuuBAluFxEcxyE9VnQ+7f/kuIZVRx4J9WLlleQwNA7tX+4juPuuZRXhYuaC1e3ogFV
	2YAS7YDxMz+cKc4BMJnqchGbxILmfKu+C66jM03IqGjrJPH+kU7twv+1xAWOt0N2WLUOaUHhaRTcP
	tPF7GL8QUDub5WTEnVKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upAjQ-00000000Gm7-3Pt2;
	Thu, 21 Aug 2025 19:13:52 +0000
Received: from freeshell.de ([2a01:4f8:231:482b::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up6tc-0000000HJL3-3kCM
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 15:08:10 +0000
Received: from [192.168.2.54] (unknown [98.97.63.12])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id B4381B4E29EB;
	Thu, 21 Aug 2025 17:08:01 +0200 (CEST)
Message-ID: <ec1c2ad0-7483-410e-8026-b09eb5e33ee4@freeshell.de>
Date: Thu, 21 Aug 2025 08:07:59 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 2/3] riscv: dts: starfive: jh7110-common: Move out some
 nodes to the board dts
To: Hal Feng <hal.feng@starfivetech.com>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250821100930.71404-1-hal.feng@starfivetech.com>
 <20250821100930.71404-3-hal.feng@starfivetech.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <20250821100930.71404-3-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_080809_085275_AF04ED87 
X-CRM114-Status: GOOD (  17.47  )
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

On 8/21/25 03:09, Hal Feng wrote:
> Some node in this file are not used by the upcoming VisionFive 2 Lite
> board. Move them to the board dts to prepare for adding the new
> VisionFive 2 Lite device tree.
> 
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../boot/dts/starfive/jh7110-common.dtsi      | 22 ---------
>  .../jh7110-deepcomputing-fml13v01.dts         | 49 +++++++++++++++++++
>  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 49 +++++++++++++++++++
>  .../dts/starfive/jh7110-pine64-star64.dts     | 49 +++++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 46 +++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 16 ------
>  6 files changed, 193 insertions(+), 38 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index 2eaf01775ef5..8332622420ca 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -281,15 +281,9 @@ &mmc0 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <8>;
>  	bootph-pre-ram;
> -	cap-mmc-highspeed;
> -	mmc-ddr-1_8v;
> -	mmc-hs200-1_8v;
> -	cap-mmc-hw-reset;
>  	post-power-on-delay-ms = <200>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc0_pins>;
> -	vmmc-supply = <&vcc_3v3>;
> -	vqmmc-supply = <&emmc_vdd>;
>  	status = "okay";
>  };
>  
> @@ -299,12 +293,7 @@ &mmc1 {
>  	assigned-clock-rates = <50000000>;
>  	bus-width = <4>;
>  	bootph-pre-ram;

> -	no-sdio;

drop no-sdio, it is not there in riscv-dt-for-next branch
ref: https://lore.kernel.org/lkml/20250819-sushi-change-1254c2d2a08d@spud/

> -	no-mmc;

similar, I think we should now drop no-mmc unless you can say there is a
defect which requires it. I have tested with Star64 and Milk-V Mars
CM(/-Lite);  if you can confirm with boards you have access to that
'no-mmc' can be dropped then we should just drop it. The correct reason
for having this 'no-mmc' would only be if the controller has an error
when receiving these commands.

> -	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> -	disable-wp;
>  	cap-sd-highspeed;

> -	post-power-on-delay-ms = <200>;

I would like to know the reason for this delay configuration? Is it
described somewhere in technical documentation or discussion why we have
this?

>  	pinctrl-names = "default";
>  	pinctrl-0 = <&mmc1_pins>;
>  	status = "okay";
> @@ -448,17 +437,6 @@ GPOEN_SYS_I2C6_DATA,
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
> index f2857d021d68..5a2a41a7e8c3 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
> @@ -11,6 +11,55 @@ / {
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
> +	no-sdio;
> +	no-mmc;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	post-power-on-delay-ms = <200>;
> +};
> +
>  &pcie1 {
>  	perst-gpios = <&sysgpio 21 GPIO_ACTIVE_LOW>;
>  	phys = <&pciephy1>;
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index fdaf6b4557da..96f6b2f072d4 100644
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
> @@ -22,6 +41,36 @@ &i2c0 {
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
> +	no-sdio;
> +	no-mmc;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	post-power-on-delay-ms = <200>;
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index 31e825be2065..c9677aef9ff0 100644
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
> @@ -44,6 +63,36 @@ &i2c0 {
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
> +	no-sdio;
> +	no-mmc;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	post-power-on-delay-ms = <200>;
> +};
> +
>  &pcie1 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 5f14afb2c24d..d1e4206f1251 100644
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
> @@ -38,9 +57,36 @@ &i2c0 {
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
> +	no-sdio;
> +	no-mmc;
> +	cd-gpios = <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	disable-wp;
> +	post-power-on-delay-ms = <200>;
> +};
> +
>  &pcie0 {
>  	status = "okay";
>  };
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 0ba74ef04679..d2463399b959 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -200,22 +200,6 @@ core4 {
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

With that,

Reviewed-by: E Shattow <e@freeshell.de>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
