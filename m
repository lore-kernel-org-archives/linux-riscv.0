Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A491C3601E
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Apr 2025 17:53:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rp5ky7l5Ysvaw9QglbYJJ1u9lotfvovGP7VYe4D9Xq8=; b=IjhEJNkgTr8cP2
	IPWcZ+JKPcQ7/mHbo9sNxUUDPO116gLQL1Ndz68Va+PsMTdPjp3k2wO1LoJVnOAL+FhmNXzPHTYxx
	V0E2UiYujNeH3KCfMaoQPivGlQ+lwxh8+K4de/viLJfWxex1Nrg9Gkgs1mFLH7pTzVzMc9zBEOp1y
	ye9acWcF/078vSDbdC8ztHwt1cEZXbuZBlIj9xGlzYCT474KeaJj06q62E3MtSmpuVC7TwdjeX0h4
	xvAxzA857T/0xCI8aQ0VtrczIwDZs+RgR6jIYJ39aPiJgJ2S4fnBS4sDIjyxu6DkFuw2qefd/w0xd
	kFcK/8GPk0Q8knnihrfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2w5H-0000000BS61-2s6y;
	Thu, 10 Apr 2025 17:53:03 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2vBA-0000000BHI3-13AS
	for linux-riscv@lists.infradead.org;
	Thu, 10 Apr 2025 16:55:06 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 4E37B25DC2;
	Thu, 10 Apr 2025 18:54:59 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AYPDpyDU1__h; Thu, 10 Apr 2025 18:54:58 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744304098; bh=6ILYwxPk1uunko0MaW2WhQjFVnHa2NU28ADIkv7zU0I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Yo8ar9evgyQErWgB1u5lLqMaQwD2Tvr49FX66uZuDCTl8NPdVDfVFghZ4W9R6Gaxm
	 Mz8mOJ0fGzWLWCUY0rhuPrixJ/IrZKiluPQB2r8KYQGfrYo1YJ68jTB+42CH+QqzR5
	 wL9VTnl1vk+oIEavqYHofGrzOerTvx699vl53+cHVL4KxLG+5QFds2oDzwlVbfbhgV
	 X+sSce8U4eEU7g0rugNQjHKUJ7eE5xg6N5FPXz8OFAsjly+tCL9Wuca8uD/jK9bTA0
	 cMRYSw+X+jr4d3UZMHOdQNkBTF+GHaiTzy8HTUuzI6GYBzdUOcd5sLvYbX32itR7TF
	 1sFQCOSmXIc2A==
Date: Thu, 10 Apr 2025 16:54:42 +0000
From: Yao Zi <ziyao@disroot.org>
To: Icenowy Zheng <uwu@icenowy.me>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Jisheng Zhang <jszhang@kernel.org>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: starfive: add DT for Orange Pi RV
Message-ID: <Z_f30vAuATR1DCWk@pie>
References: <20250409091801.855083-1-uwu@icenowy.me>
 <20250409091801.855083-2-uwu@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250409091801.855083-2-uwu@icenowy.me>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_095504_848668_AA3158B5 
X-CRM114-Status: GOOD (  19.64  )
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

On Wed, Apr 09, 2025 at 05:18:01PM +0800, Icenowy Zheng wrote:
> Orange Pi RV is a newly released SBC with JH7110 SoC, single GbE port
> (connected to JH7110 GMAC0 via a YT8531 PHY), 4 USB ports (via a VL805
> PCIe USB controller connected to JH7110 PCIE0), a M.2 M-key slot
> (connected to JH7110 PCIE1), a HDMI video output, a 3.5mm audio output
> and a microSD slot.
> 
> Onboard peripherals contain a SPI NOR (which contains the U-Boot
> firmware) and an Ampak AP6256 SDIO Wi-Fi module.
> 
> As the schematics isn't available yet, the SDIO Wi-Fi is left disabled
> yet.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |  1 +
>  .../boot/dts/starfive/jh7110-orangepi-rv.dts  | 73 +++++++++++++++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> 
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
> index b3bb12f78e7d5..24f1a44828350 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -10,6 +10,7 @@ dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
>  
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
> +dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-orangepi-rv.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
>  dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.3b.dtb
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> new file mode 100644
> index 0000000000000..bde01f117e0b2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-orangepi-rv.dts
> @@ -0,0 +1,73 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + */
> +
> +/dts-v1/;
> +#include "jh7110-common.dtsi"
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "Xunlong Orange Pi RV";
> +	compatible = "xunlong,orangepi-rv", "starfive,jh7110";
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-ack {
> +			gpios = <&aongpio 3 GPIO_ACTIVE_HIGH>;
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_HEARTBEAT;
> +			linux,default-trigger = "heartbeat";
> +			label = "ack";

Should we sort the properties in alphabet order? i.e. color, function,
gpios, label then linux,default-trigger. See dts-coding-style.rst,

> The following order of properties in device nodes is preferred:
>
> 1. "compatible"
> 2. "reg"
> 3. "ranges"
> 4. Standard/common properties (defined by common bindings, e.g. without
> vendor-prefixes)
> 5. Vendor-specific properties
> 6. "status" (if applicable)
> 7. Child nodes, where each node is preceded with a blank line

> +		};
> +	};
> +};
> +
> +&gmac0 {
> +	starfive,tx-use-rgmii-clk;
> +	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
> +	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	status = "okay";

Vendor property starfive,tx-use-rgmii-clk should go after the common
ones.

> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	/* TODO: Ampak AP6256 Wi-Fi module attached here */
> +	status = "disabled";
> +};
> +
> +&mmc1 {
> +	/delete-property/ cd-gpios;
> +	broken-cd;
> +};
> +
> +&pcie0 {
> +	status = "okay";
> +};
> +
> +&pcie1 {
> +	status = "okay";
> +};
> +
> +&phy0 {
> +	motorcomm,tx-clk-adj-enabled;
> +	motorcomm,tx-clk-10-inverted;
> +	motorcomm,tx-clk-100-inverted;
> +	motorcomm,tx-clk-1000-inverted;
> +	motorcomm,rx-clk-drv-microamp = <3970>;
> +	motorcomm,rx-data-drv-microamp = <2910>;
> +	rx-internal-delay-ps = <1500>;
> +	tx-internal-delay-ps = <1500>;
> +};

Ditto, move the vendor properties below the common ones.

> +&pwmdac {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> -- 
> 2.49.0
> 

Best regards,
Yao Zi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
