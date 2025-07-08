Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48D6CC83030
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Jul 2025 03:21:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Mime-Version:Message-Id:
	Subject:To:In-Reply-To:Date:From:Cc:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=e4kNbjnsWMhg3Ib85jitYmybCWuCgGAXtbrh3wyxDAk=; b=bVD0t+cNSQZneO
	zccj4wSW67SU9b74/MXDAyS2I44cx4BNvcJoQvY+lVcRIozg7oIVvB6EckaK/jzT5XjHoadMdY4AL
	qfxiJznc3diXbO1XKtXzrBEbBI+mc6fyqhwAaMPqL6XtNyRnDhT3hNVlGVM9MCqC8Tsjzw5+81CyY
	IotSJRlzl2eGFWDF2ngmqzr604gwp0WLSHpsfeHtMAA/u6dL89c2D4ZlQAd9UMR+A7lflPXn9/+fJ
	89vTZKSfvjmduYcghGj9eVjtzl7wcoz7qRAKHOLVgONFXfNxpTvf2BWzwTLal893pNB9sYqmfv9VY
	1ucqCCkBFF62GpOUp1GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYytn-00000004AkS-274b;
	Tue, 08 Jul 2025 03:21:39 +0000
Received: from sg-1-34.ptr.blmpb.com ([118.26.132.34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYytg-00000004Ais-3fk4
	for linux-riscv@lists.infradead.org;
	Tue, 08 Jul 2025 03:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=lanxincomputing-com.20200927.dkim.feishu.cn; t=1751944882;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=zg/YomFgWluXbABhhcO8ioOh4E5v2C7pZz7d5544dM4=;
 b=0XFtq1rI2Q6dFJwemZvO8QeXnbU32xXFv6jDcy/HA7WN8LrPqfRr/5VgvayB9MVCwBTMXU
 VJj6fRqLFra308eGJDZ4M09d20AFxzEtarTuQ7rE51jfY9g5egF8QXeNVtd9U+rxIGL8Fy
 hVVzkmv+4ZArOPqEobdrPgRiLVEF+dyFvzM6+QHDTaXGQG7Cq3sqwQ0VzFu1PUzpEQxUyB
 kk5iFmg/t46oZzorFzJnhG67UFUi3c/W09p6CSvQHbCGEuFQJAW1okA7UfDGUcPPWQNC3Q
 zll79zrgR83ICAtQ6IxXvLBFF2i6PzAgrIkYTGjPQ1hEx7SkNUhwD+d3QX+jOg==
Cc: "Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, "Alexandre Ghiti" <alex@ghiti.fr>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Thomas Bonnefille" <thomas.bonnefille@bootlin.com>, 
	"Guo Ren" <guoren@kernel.org>, "Chao Wei" <chao.wei@sophgo.com>, 
	<linux-riscv@lists.infradead.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>
From: "Nutty Liu" <liujingqi@lanxincomputing.com>
Date: Tue, 8 Jul 2025 11:21:16 +0800
In-Reply-To: <c1b6ccdc69af0c1457fc1486a6bc8a1e83671537.1751700954.git.rabenda.cn@gmail.com>
To: "Han Gao" <rabenda.cn@gmail.com>, <devicetree@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] riscv: dts: sophgo: add Sophgo SG2042_EVB_V2.0 board device tree
Message-Id: <e48c2706-86cf-4e1d-bfad-17f662f5fb75@lanxincomputing.com>
Mime-Version: 1.0
Received: from [127.0.0.1] ([116.237.111.137]) by smtp.feishu.cn with ESMTPS; Tue, 08 Jul 2025 11:21:19 +0800
X-Lms-Return-Path: <lba+2686c8eb0+606e77+lists.infradead.org+liujingqi@lanxincomputing.com>
X-Original-From: Nutty Liu <liujingqi@lanxincomputing.com>
Content-Language: en-US
User-Agent: Mozilla Thunderbird
References: <cover.1751700954.git.rabenda.cn@gmail.com> <c1b6ccdc69af0c1457fc1486a6bc8a1e83671537.1751700954.git.rabenda.cn@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250707_202136_819293_AECB1FD9 
X-CRM114-Status: GOOD (  13.10  )
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

On 7/5/2025 3:39 PM, Han Gao wrote:
> Sophgo SG2042_EVB_V2.0 [1] is a prototype development board based on SG2042
>
> Currently supports serial port, sdcard/emmc, pwm, fan speed control.
>
> Link: https://github.com/sophgo/sophgo-hardware/tree/master/SG2042/SG2042-x4-EVB [1]
>
> Signed-off-by: Han Gao <rabenda.cn@gmail.com>

Reviewed-by: Nutty Liu<liujingqi@lanxincomputing.com>

Thanks,
Nutty

> ---
>   arch/riscv/boot/dts/sophgo/Makefile          |   1 +
>   arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts | 233 +++++++++++++++++++
>   2 files changed, 234 insertions(+)
>   create mode 100644 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
>
> diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
> index 6c9b29681cad..6f65526d4193 100644
> --- a/arch/riscv/boot/dts/sophgo/Makefile
> +++ b/arch/riscv/boot/dts/sophgo/Makefile
> @@ -4,4 +4,5 @@ dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v2.dtb
>   dtb-$(CONFIG_ARCH_SOPHGO) += sg2044-sophgo-srd3-10.dtb
> diff --git a/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> new file mode 100644
> index 000000000000..46980e41b886
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts
> @@ -0,0 +1,233 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Sophgo Technology Inc. All rights reserved.
> + */
> +
> +#include "sg2042.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +
> +/ {
> +	model = "Sophgo SG2042 EVB V2.0";
> +	compatible = "sophgo,sg2042-evb-v2", "sophgo,sg2042";
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	pwmfan: pwm-fan {
> +		compatible = "pwm-fan";
> +		cooling-levels = <103 128 179 230 255>;
> +		pwms = <&pwm 0 40000 0>;
> +		#cooling-cells = <2>;
> +	};
> +
> +	thermal-zones {
> +		soc-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&mcu 0>;
> +
> +			trips {
> +				soc_active1: soc-active1 {
> +					temperature = <30000>;
> +					hysteresis = <8000>;
> +					type = "active";
> +				};
> +
> +				soc_active2: soc-active2 {
> +					temperature = <58000>;
> +					hysteresis = <12000>;
> +					type = "active";
> +				};
> +
> +				soc_active3: soc-active3 {
> +					temperature = <70000>;
> +					hysteresis = <10000>;
> +					type = "active";
> +				};
> +
> +				soc_hot: soc-hot {
> +					temperature = <80000>;
> +					hysteresis = <5000>;
> +					type = "hot";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map0 {
> +					trip = <&soc_active1>;
> +					cooling-device = <&pwmfan 0 1>;
> +				};
> +
> +				map1 {
> +					trip = <&soc_active2>;
> +					cooling-device = <&pwmfan 1 2>;
> +				};
> +
> +				map2 {
> +					trip = <&soc_active3>;
> +					cooling-device = <&pwmfan 2 3>;
> +				};
> +
> +				map3 {
> +					trip = <&soc_hot>;
> +					cooling-device = <&pwmfan 3 4>;
> +				};
> +			};
> +		};
> +
> +		board-thermal {
> +			polling-delay-passive = <1000>;
> +			polling-delay = <1000>;
> +			thermal-sensors = <&mcu 1>;
> +
> +			trips {
> +				board_active: board-active {
> +					temperature = <75000>;
> +					hysteresis = <8000>;
> +					type = "active";
> +				};
> +			};
> +
> +			cooling-maps {
> +				map4 {
> +					trip = <&board_active>;
> +					cooling-device = <&pwmfan 3 4>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&cgi_main {
> +	clock-frequency = <25000000>;
> +};
> +
> +&cgi_dpll0 {
> +	clock-frequency = <25000000>;
> +};
> +
> +&cgi_dpll1 {
> +	clock-frequency = <25000000>;
> +};
> +
> +&emmc {
> +	pinctrl-0 = <&emmc_cfg>;
> +	pinctrl-names = "default";
> +	bus-width = <4>;
> +	no-sdio;
> +	no-sd;
> +	non-removable;
> +	wp-inverted;
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	pinctrl-0 = <&i2c1_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	mcu: syscon@17 {
> +		compatible = "sophgo,sg2042-hwmon-mcu";
> +		reg = <0x17>;
> +		#thermal-sensor-cells = <1>;
> +	};
> +};
> +
> +&gmac0 {
> +	phy-handle = <&phy0>;
> +	phy-mode = "rgmii-id";
> +	status = "okay";
> +
> +	mdio {
> +		phy0: phy@0 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			reg = <0>;
> +			reset-gpios = <&port0a 27 GPIO_ACTIVE_LOW>;
> +			reset-assert-us = <100000>;
> +			reset-deassert-us = <100000>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	emmc_cfg: sdhci-emmc-cfg {
> +		sdhci-emmc-wp-pins {
> +			pinmux = <PINMUX(PIN_EMMC_WP, 0)>;
> +			bias-disable;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-disable;
> +		};
> +
> +		sdhci-emmc-cd-pins {
> +			pinmux = <PINMUX(PIN_EMMC_CD, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +
> +		sdhci-emmc-rst-pwr-pins {
> +			pinmux = <PINMUX(PIN_EMMC_RST, 0)>,
> +				 <PINMUX(PIN_EMMC_PWR_EN, 0)>;
> +			bias-disable;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-disable;
> +		};
> +	};
> +
> +	i2c1_cfg: i2c1-cfg {
> +		i2c1-pins {
> +			pinmux = <PINMUX(PIN_IIC1_SDA, 0)>,
> +				 <PINMUX(PIN_IIC1_SCL, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +
> +	sd_cfg: sdhci-sd-cfg {
> +		sdhci-sd-cd-wp-pins {
> +			pinmux = <PINMUX(PIN_SDIO_CD, 0)>,
> +				 <PINMUX(PIN_SDIO_WP, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +
> +		sdhci-sd-rst-pwr-pins {
> +			pinmux = <PINMUX(PIN_SDIO_RST, 0)>,
> +				 <PINMUX(PIN_SDIO_PWR_EN, 0)>;
> +			bias-disable;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-disable;
> +		};
> +	};
> +
> +	uart0_cfg: uart0-cfg {
> +		uart0-rx-pins {
> +			pinmux = <PINMUX(PIN_UART0_TX, 0)>,
> +				 <PINMUX(PIN_UART0_RX, 0)>;
> +			bias-pull-up;
> +			drive-strength-microamp = <26800>;
> +			input-schmitt-enable;
> +		};
> +	};
> +};
> +
> +&sd {
> +	pinctrl-0 = <&sd_cfg>;
> +	pinctrl-names = "default";
> +	bus-width = <4>;
> +	no-sdio;
> +	no-mmc;
> +	wp-inverted;
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-0 = <&uart0_cfg>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +};

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
