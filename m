Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A172EE49A3
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Aug 2023 02:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TzHt3VBacpWgWekZyISBy2jhZV0AodfSCP6PUf6YWLw=; b=Oi36UlqmfxkPS/
	vBTxPy+UkudozFKQhZoGivzLQnd1l/iNLXdSFW//tbuIODqhfBOWZNjuaAHV9ZAocSQRg6L+FGI+4
	QlI7K+9ZIzBhVIFOqV4ijsw02g4pOMA8HnOyDkDoLdWijeuz9A4XCVleffGv71AmZfDBPJYpgWQGW
	xxwEF5iiZVwH6/fEMAj5bSZXrb+4BBQ6mNFPdkcJgM3fzD1Qp94ZurEIT78QLS+pdmW3tJo+a81ko
	r3Wt5dU4cHqOp3RaXTXwkgVvh/w/QFOabSapz9oFwBG4huG+CE/VFxN1L/uCchdtdSLdhfy3jF8gX
	JKJFg3xx0mt+/BNUbtdw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdph-00H5xQ-1E;
	Wed, 23 Aug 2023 02:42:57 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYdpc-00H5uJ-1x
	for linux-riscv@lists.infradead.org;
	Wed, 23 Aug 2023 02:42:56 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id BB07824E2EE;
	Wed, 23 Aug 2023 10:42:01 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:42:01 +0800
Received: from [192.168.125.113] (113.72.145.205) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 23 Aug
 2023 10:42:00 +0800
Message-ID: <65292b7f-0e9d-65c1-4ca5-b23d301e02cd@starfivetech.com>
Date: Wed, 23 Aug 2023 10:42:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2 5/5] riscv: dts: starfive: Add the nodes and pins of
 I2Srx/I2Stx0/I2Stx1
To: Xingyu Wu <xingyu.wu@starfivetech.com>, Liam Girdwood
	<lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Claudiu Beznea
	<Claudiu.Beznea@microchip.com>, Jaroslav Kysela <perex@perex.cz>, "Takashi
 Iwai" <tiwai@suse.com>, Maxim Kochetkov <fido_max@inbox.ru>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: Jose Abreu <joabreu@synopsys.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <alsa-devel@alsa-project.org>,
	<linux-riscv@lists.infradead.org>
References: <20230821144151.207339-1-xingyu.wu@starfivetech.com>
 <20230821144151.207339-6-xingyu.wu@starfivetech.com>
Content-Language: en-US
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230821144151.207339-6-xingyu.wu@starfivetech.com>
X-Originating-IP: [113.72.145.205]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_194252_958369_E1055062 
X-CRM114-Status: GOOD (  11.58  )
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


On 2023/8/21 22:41, Xingyu Wu wrote:
> Add I2Srx/I2Stx0/I2Stx1 nodes and pins configuration for the
> StarFive JH7110 SoC.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 58 +++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      | 65 +++++++++++++++++++
>  2 files changed, 123 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index d79f94432b27..7179f1a31cf2 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -203,6 +203,24 @@ &i2c6 {
>  	status = "okay";
>  };
>  
> +&i2srx {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2srx_pins>;
> +	status = "okay";
> +};
> +
> +&i2stx0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&mclk_ext_pins>;
> +	status = "okay";
> +};
> +
> +&i2stx1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2stx1_pins>;
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	max-frequency = <100000000>;
>  	bus-width = <8>;
> @@ -337,6 +355,46 @@ GPOEN_SYS_I2C6_DATA,
>  		};
>  	};
>  
> +	i2srx_pins: i2srx-0 {
> +		clk-sd-pins {
> +			pinmux = <GPIOMUX(38, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_BCLK)>,
> +				 <GPIOMUX(63, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_LRCK)>,
> +				 <GPIOMUX(38, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2STX1_BCLK)>,
> +				 <GPIOMUX(63, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2STX1_LRCK)>,
> +				 <GPIOMUX(61, GPOUT_LOW,
> +					      GPOEN_DISABLE,
> +					      GPI_SYS_I2SRX_SDIN0)>;
> +			input-enable;
> +		};
> +	};
> +
> +	i2stx1_pins: i2stx1-0 {
> +		sd-pins {
> +			pinmux = <GPIOMUX(44, GPOUT_SYS_I2STX1_SDO0,
> +					      GPOEN_ENABLE,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			input-disable;
> +		};
> +	};
> +
> +	mclk_ext_pins: mclk-ext-0 {
> +		mclk-ext-pins {
> +			pinmux = <GPIOMUX(4, GPOUT_LOW,
> +					     GPOEN_DISABLE,
> +					     GPI_SYS_MCLK_EXT)>;
> +			input-enable;
> +		};
> +	};
> +
>  	mmc0_pins: mmc0-0 {
>  		 rst-pins {
>  			pinmux = <GPIOMUX(62, GPOUT_SYS_SDIO0_RST,
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e85464c328d0..621b68c02ea8 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -512,6 +512,30 @@ tdm: tdm@10090000 {
>  			status = "disabled";
>  		};
>  
> +		i2srx: i2s@100e0000 {
> +			compatible = "starfive,jh7110-i2srx";
> +			reg = <0x0 0x100e0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2SRX_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_BCLK>,
> +				 <&syscrg JH7110_SYSCLK_I2SRX_LRCK>,
> +				 <&i2srx_bclk_ext>,
> +				 <&i2srx_lrck_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner", "mclk_ext", "bclk",
> +				      "lrck", "bclk_ext", "lrck_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2SRX_APB>,
> +				 <&syscrg JH7110_SYSRST_I2SRX_BCLK>;
> +			dmas = <0>, <&dma 24>;
> +			dma-names = "tx", "rx";
> +			starfive,syscon = <&sys_syscon 0x18 0x2>;
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		usb0: usb@10100000 {
>  			compatible = "starfive,jh7110-usb";
>  			ranges = <0x0 0x0 0x10100000 0x100000>;
> @@ -736,6 +760,47 @@ spi6: spi@120a0000 {
>  			status = "disabled";
>  		};
>  
> +		i2stx0: i2s@120b0000 {
> +			compatible = "starfive,jh7110-i2stx0";
> +			reg = <0x0 0x120b0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2STX0_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2STX0_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner","mclk_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2STX0_APB>,
> +				 <&syscrg JH7110_SYSRST_I2STX0_BCLK>;
> +			dmas = <&dma 47>;
> +			dma-names = "tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		i2stx1: i2s@120c0000 {
> +			compatible = "starfive,jh7110-i2stx1";
> +			reg = <0x0 0x120c0000 0x0 0x1000>;
> +			clocks = <&syscrg JH7110_SYSCLK_I2STX1_BCLK_MST>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_APB>,
> +				 <&syscrg JH7110_SYSCLK_MCLK>,
> +				 <&syscrg JH7110_SYSCLK_MCLK_INNER>,
> +				 <&mclk_ext>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_BCLK>,
> +				 <&syscrg JH7110_SYSCLK_I2STX1_LRCK>,
> +				 <&i2stx_bclk_ext>,
> +				 <&i2stx_lrck_ext>;
> +			clock-names = "i2sclk", "apb", "mclk",
> +				      "mclk_inner", "mclk_ext", "bclk",
> +				      "lrck", "bclk_ext", "lrck_ext";
> +			resets = <&syscrg JH7110_SYSRST_I2STX1_APB>,
> +				 <&syscrg JH7110_SYSRST_I2STX1_BCLK>;
> +			dmas = <&dma 48>;
> +			dma-names = "tx";
> +			#sound-dai-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		sfctemp: temperature-sensor@120e0000 {
>  			compatible = "starfive,jh7110-temp";
>  			reg = <0x0 0x120e0000 0x0 0x10000>;

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
