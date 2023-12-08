Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6C5BC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=OO/sPeltO1nzuwfvCTb0rQdOXtpPhqyHg0WsBhwWukA=; b=GX2hmXs6XiXgMRiEX4dOPHy8uQ
	UYntSvduCFqr59Bq1s/EdHV9fxLvn2f8CHPHGr9r7nGPwl+eRvtnY3XzhYwvaeZ2pJxzhyCSyfcbD
	wntaGaHjrqQApEbTjWwqYelnnkC/nYJ28T+mvofUAyhhwm1nc5hPGRSHQh6iqLEXAv0f1C8HnTseV
	Z2bPgWv5MWcWw+eiSqHQumSHtQaLaMrd9k3OK7aEl/ksWOSbw16kdScmqHK/yWYaCmTucBUtX5lKg
	IL2LUryttFqJK9QCEPhbkxE9hKRH3PP7sMVq7lBJQdI5ctLH4+HK7Ko36jfkJqQ/hpryRhzcFeQkp
	rsQL3zHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdtE-00G3Su-13;
	Fri, 08 Dec 2023 16:39:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdtB-00G3RQ-0X
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:39:47 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id CD8EE3F5F4
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 16:39:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702053583;
	bh=X3FBlVRSmieKRWm3YZEbOwqJ8jQOpyTa5Fp9gPp0ZWQ=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=g1iw5Vod2pQUgcxfpuHBOUk9O3L6FZrYfGESeePdFHQIkzcLUHJnzqsDIhExsyf77
	 0IpC4IQvtr9dqcv8zYz0ZqinenrOcCLntLNzvOpZ0FHE4e3sTqvrfooQoDgas45EuB
	 ZWC2M3gh0buBm8M2tSY6bKNvGZAtYqCNhRTDS2/rI/iIB1GGNbnEHjThCmV6xfY8RJ
	 YO+Ov8WymLvUwKFUy0EE6sv+VvTv9nm3N76aiP3E1CUdoQqkai6/PIan84QU11rc/2
	 xaa3WWjF5mxf2LUS5RHjamsvC7PoKx/0Biy1KTMzpYa6meAA23wtJdlXKzUsiKeEY2
	 y7U2+1Y/PTxow==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50bf1bbf67aso2011111e87.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:39:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053583; x=1702658383;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X3FBlVRSmieKRWm3YZEbOwqJ8jQOpyTa5Fp9gPp0ZWQ=;
        b=l80+7FxOW90UuKD8wGhqfMC+mLr1Qwm6GBJFHz52+i05IJsLkwkUoIs88ZbPVhjN9i
         s1W0+BOGHPF0L+DRwZWXczEqngZ8K1059MWi1FHv0T88yNydIikn3LRMzb2Nzh+8mdqy
         G9HPjkjFiDnSE2oGaX6x+hY3MH8ZkCLUB6hmFahPB2IZtcC4i0t1lnB1/WTrlHKrBHhm
         PSFflJoSRBIoDmhjJL0yqUKwmfhTcnfX4mgEfn670v+wJxssGmbBmbHsZJs+uAkBGjKG
         Xxzp3/y6rXNa0J6YezXksYkx47n78HPeb3x8mHYXnPJQGK+IvPe5GubsRTV43wh1Knh5
         a8Lg==
X-Gm-Message-State: AOJu0YxgpVLh/rt/APoU3HdY8PfFazEaI8Y0mdMUHp3wLbysjecS5G/x
	L2Z0FrAuTeW5i/Y7Juik1iOLj6TP0KeGG6AGA57IThWYtktCDNerTccJ9sWdd5xalYO7OdgC3dR
	PiuFZWZMFFylHrf3nNjOhOanqqu60NSuie9+EqTGIbrpABueErZAMlrHmUVb0uw==
X-Received: by 2002:a19:3854:0:b0:50b:f147:fb00 with SMTP id d20-20020a193854000000b0050bf147fb00mr102268lfj.119.1702053582625;
        Fri, 08 Dec 2023 08:39:42 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE5bW25400UVBfGIS8i0bPX7zPe2UTxdrapQghi1M5M8RnSU/7Fy414q7DXW9+Wey7luJ/7it5PMhvR02CjeC8=
X-Received: by 2002:a19:3854:0:b0:50b:f147:fb00 with SMTP id
 d20-20020a193854000000b0050bf147fb00mr102246lfj.119.1702053582252; Fri, 08
 Dec 2023 08:39:42 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:39:41 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-17-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:39:41 -0800
Message-ID: <CAJM55Z9bik1QttBeFUCfM3N98HWURge7mgV7ohFBq+AsuvtROg@mail.gmail.com>
Subject: Re: [PATCH v1 16/16] riscv: dts: starfive: jh8100: Add clocks and
 resets nodes
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_083945_367761_D35D3399 
X-CRM114-Status: GOOD (  13.44  )
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

Sia Jee Heng wrote:
> Add SYSCRG/SYSCRG-NE/SYSCRG-NW/SYSCRG-SW/AONCRG clock and reset
> nodes for JH8100 RISC-V SoC.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh8100-clk.dtsi | 180 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh8100.dtsi     | 115 ++++++++++++

Why the split here? I mean why can't the clocks just be in the jh8100.dtsi?

>  2 files changed, 295 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
>
> diff --git a/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> new file mode 100644
> index 000000000000..27ba249f523e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh8100-clk.dtsi
> @@ -0,0 +1,180 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2023 StarFive Technology Co., Ltd.
> + */
> +
> +/ {
> +	clk_osc: clk_osc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	clk_i2srx_bclk_ext: clk_i2srx_bclk_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12288000>;
> +	};
> +
> +	clk_i2srx_lrck_ext: clk_i2srx_lrck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <192000>;
> +	};
> +
> +	clk_mclk_ext: clk_mclk_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <49152000>;
> +	};
> +	/* sys-ne */
> +	clk_usb3_tap_tck_ext: clk_usb3_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_glb_ext_clk: clk_glb_ext_clk {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <30000000>;
> +	};
> +
> +	clk_usb1_tap_tck_ext: clk_usb1_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_usb2_tap_tck_ext: clk_usb2_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_i2s_tscko: clk_i2s_tscko {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12800000>;
> +	};
> +
> +	clk_typec_tap_tck_ext: clk_typec_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_spi_in0_ext: clk_spi_in0_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_spi_in1_ext: clk_spi_in1_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_spi_in2_ext: clk_spi_in2_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_i2stx_bclk_ext: clk_i2stx_bclk_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12288000>;
> +	};
> +
> +	clk_i2stx_lrck_ext: clk_i2stx_lrck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <192000>;
> +	};
> +	/* sys-nw */
> +	clk_dvp_ext: clk_dvp_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <150000000>;
> +	};
> +
> +	clk_isp_dphy_tap_tck_ext: clk_isp_dphy_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_vout_mipi_dphy_tap_tck_ext: clk_vout_mipi_dphy_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_vout_edp_tap_tck_ext: clk_vout_edp_tap_tck_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +	};
> +
> +	clk_rtc: clk_rtc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +	};
> +	/* aon */
> +	clk_gmac0_rmii_func: clk_gmac0_rmii_func {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +
> +	clk_gmac0_rgmii_func: clk_gmac0_rgmii_func {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	clk_aon50: clk_aon50 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +	};
> +
> +	clk_aon125: clk_aon125 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	clk_aon2000: clk_aon2000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <2000000000>;
> +	};
> +
> +	clk_aon200: clk_aon200 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <200000000>;
> +	};
> +
> +	clk_aon667: clk_isp_aon667 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <667000000>;
> +	};
> +
> +	clk_i3c_ext: clk_i3c_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <12500000>;
> +	};
> +
> +	clk_espi_ext: clk_espi_ext {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <60000000>;
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh8100.dtsi b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> index f26aff5c1ddf..9863c61324a0 100644
> --- a/arch/riscv/boot/dts/starfive/jh8100.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh8100.dtsi
> @@ -4,6 +4,9 @@
>   */
>
>  /dts-v1/;
> +#include <dt-bindings/clock/starfive,jh8100-crg.h>
> +#include <dt-bindings/reset/starfive,jh8100-crg.h>
> +#include "jh8100-clk.dtsi"
>
>  / {
>  	compatible = "starfive,jh8100";
> @@ -357,6 +360,104 @@ uart4: serial@121a0000  {
>  			status = "disabled";
>  		};
>
> +		syscrg_ne: syscrg_ne@12320000 {
> +			compatible = "starfive,jh8100-syscrg-ne";
> +			reg = <0x0 0x12320000 0x0 0x10000>;
> +			clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_AXI_400>,
> +				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
> +				 <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_480>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_625>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_240>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_60>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_156P25>,
> +				 <&syscrg SYSCRG_CLK_USB_WRAP_312P5>,
> +				 <&syscrg SYSCRG_CLK_USB_125M>,
> +				 <&syscrg_nw SYSCRG_NW_CLK_GPIO_100>,
> +				 <&syscrg SYSCRG_CLK_PERH_ROOT>, <&syscrg SYSCRG_CLK_MCLK>,
> +				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> +				 <&syscrg SYSCRG_CLK_AHB0>,
> +				 <&syscrg SYSCRG_CLK_APB_BUS_PER1>,
> +				 <&syscrg SYSCRG_CLK_APB_BUS_PER2>,
> +				 <&syscrg SYSCRG_CLK_APB_BUS_PER3>,
> +				 <&syscrg SYSCRG_CLK_APB_BUS_PER5>,
> +				 <&syscrg SYSCRG_CLK_VENC_ROOT>,
> +				 <&syscrg SYSCRG_CLK_SPI_CORE_100>,
> +				 <&clk_glb_ext_clk>, <&clk_usb3_tap_tck_ext>,
> +				 <&clk_usb1_tap_tck_ext>, <&clk_usb2_tap_tck_ext>,
> +				 <&clk_typec_tap_tck_ext>, <&clk_spi_in0_ext>,
> +				 <&clk_spi_in1_ext>, <&clk_i2stx_bclk_ext>, <&clk_i2stx_lrck_ext>;
> +			clock-names = "clk_osc", "sys_clk_axi_400",
> +				      "sys_clk_vout_root0", "sys_clk_vout_root1",
> +				      "sys_clk_usb_wrap_480", "sys_clk_usb_wrap_625",
> +				      "sys_clk_usb_wrap_240", "sys_clk_usb_wrap_60",
> +				      "sys_clk_usb_wrap_156p25", "sys_clk_usb_wrap_312p5",
> +				      "sys_clk_usb_125m", "sys_nw_clk_gpio_100",
> +				      "sys_clk_perh_root", "sys_clk_mclk",
> +				      "sys_clk_perh_root_preosc", "sys_clk_ahb0",
> +				      "sys_clk_apb_bus_per1", "sys_clk_apb_bus_per2",
> +				      "sys_clk_apb_bus_per3", "sys_clk_apb_bus_per5",
> +				      "sys_clk_venc_root", "sys_clk_spi_core_100",
> +				      "clk_glb_ext_clk", "clk_usb3_tap_tck_ext",
> +				      "clk_usb1_tap_tck_ext", "clk_usb2_tap_tck_ext",
> +				      "clk_typec_tap_tck_ext", "clk_spi_in0_ext",
> +				      "clk_spi_in1_ext", "clk_i2stx_bclk_ext",
> +				      "clk_i2stx_lrck_ext";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscrg_nw: syscrg_nw@123c0000 {
> +			compatible = "starfive,jh8100-syscrg-nw";
> +			reg = <0x0 0x123c0000 0x0 0x10000>;
> +			clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
> +				 <&syscrg SYSCRG_CLK_ISP_2X>, <&syscrg SYSCRG_CLK_ISP_AXI>,
> +				 <&syscrg SYSCRG_CLK_VOUT_ROOT0>, <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> +				 <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
> +				 <&syscrg SYSCRG_CLK_VOUT_DC_CORE>, <&syscrg SYSCRG_CLK_VOUT_AXI>,
> +				 <&syscrg SYSCRG_CLK_AXI_400>, <&syscrg SYSCRG_CLK_AXI_200>,
> +				 <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> +				 <&clk_dvp_ext>, <&clk_isp_dphy_tap_tck_ext>,
> +				 <&clk_glb_ext_clk>, <&clk_i2s_tscko>,
> +				 <&clk_vout_mipi_dphy_tap_tck_ext>, <&clk_vout_edp_tap_tck_ext>,
> +				 <&clk_spi_in2_ext>;
> +			clock-names = "clk_osc", "sys_clk_apb_bus",
> +				      "sys_clk_isp_2x", "sys_clk_isp_axi",
> +				      "sys_clk_vout_root0", "sys_clk_vout_root1",
> +				      "sys_clk_vout_scan_ats", "sys_clk_vout_dc_core",
> +				      "sys_clk_vout_axi", "sys_clk_axi_400",
> +				      "sys_clk_axi_200", "sys_clk_perh_root_preosc", "clk_dvp_ext",
> +				      "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
> +				      "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_ext",
> +				      "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscrg: syscrg@126d0000 {
> +			compatible = "starfive,jh8100-syscrg";
> +			reg = <0x0 0x126d0000 0x0 0x10000>;
> +			clocks = <&clk_osc>, <&clk_i2srx_bclk_ext>,
> +				 <&clk_i2srx_lrck_ext>, <&clk_mclk_ext>;
> +			clock-names = "clk_osc", "clk_i2srx_bclk_ext",
> +				      "clk_i2srx_lrck_ext", "clk_mclk_ext";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		syscrg_sw: syscrg_sw@12720000 {
> +			compatible = "starfive,jh8100-syscrg-sw";
> +			reg = <0x0 0x12720000 0x0 0x10000>;
> +			clocks = <&syscrg SYSCRG_CLK_APB_BUS>,
> +				 <&syscrg SYSCRG_CLK_VDEC_ROOT>,
> +				 <&syscrg SYSCRG_CLK_FLEXNOC1>;
> +			clock-names = "sys_clk_apb_bus",
> +				      "sys_clk_vdec_root",
> +				      "sys_clk_flexnoc1";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart5: serial@127d0000  {
>  			compatible = "starfive,jh8100-uart", "cdns,uart-r1p8";
>  			reg = <0x0 0x127d0000 0x0 0x10000>;
> @@ -374,5 +475,19 @@ uart6: serial@127e0000  {
>  			interrupts = <73>;
>  			status = "disabled";
>  		};
> +
> +		aoncrg: aoncrg@1f310000 {
> +			compatible = "starfive,jh8100-aoncrg";
> +			reg = <0x0 0x1f310000 0x0 0x10000>;
> +			clocks = <&clk_osc>, <&clk_gmac0_rmii_func>,
> +				 <&clk_gmac0_rgmii_func>, <&clk_aon125>,
> +				 <&clk_aon2000>, <&clk_aon200>,
> +				 <&clk_aon667>, <&clk_rtc>;
> +			clock-names = "clk_osc", "clk_gmac0_rmii_func", "clk_gmac0_rgmii_func",
> +				      "clk_aon125", "clk_aon2000", "clk_aon200",
> +				      "clk_aon667", "clk_rtc";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
>  	};
>  };
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
