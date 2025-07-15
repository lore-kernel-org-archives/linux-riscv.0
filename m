Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2A43C83F1D
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Jul 2025 10:27:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LqMXtmkt05RAhWk9PDFUgtlyybW6u77/NJ8QB7wnF/Q=; b=iYEFoZFcHH/D4u
	/141BLZB8MZYHAMkMCWYTz2aVmsdc2yPSsDZ55gFJfeuRHgkW62LStsjktL+DOLmxCipEYDheaJFj
	hj2sKFnSzHs8W5Ab7P6NpyvnlKezfrNWFawsyTS7sN07ifKr4Bw1+TfN2RDFjlzsuDOkzSgxN8km9
	6tVjitY6rU3qussueoVdM4zV2goKOIAnFYkCCnLjGVcmMR+wdkdSdOP1KCjPO9lcl2vYhve4DV+4M
	H4aTsr2vMAbJIfHUfMS6YPd7Jq8E/qOn1eSs8z3c/21FyJwn9KBLRWTEThxjXM8nRK/EqLtalBh1N
	euMKA3XClgSWOX0oFnQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcsL-00000004pT8-1vO1;
	Tue, 15 Jul 2025 10:27:05 +0000
Received: from dev.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubcqz-00000004pGT-2DUv
	for linux-riscv@lists.infradead.org;
	Tue, 15 Jul 2025 10:25:42 +0000
Received: from localhost (unknown [116.232.48.207])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 2900F340DB0;
	Tue, 15 Jul 2025 10:25:38 +0000 (UTC)
Date: Tue, 15 Jul 2025 18:25:34 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	palmer@dabbelt.com, skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: Add OrangePi RV2 board device
 tree
Message-ID: <20250715102534-GYA542593@gentoo>
References: <20250711183245.256683-1-hendrik.hamerlinck@hammernet.be>
 <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250711183245.256683-3-hendrik.hamerlinck@hammernet.be>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_032541_597398_493B994A 
X-CRM114-Status: GOOD (  19.46  )
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


On 20:32 Fri 11 Jul     , Hendrik Hamerlinck wrote:
> Add initial device tree support for the OrangePi RV2 board [1], which is
> marketed as using the Ky X1 SoC but has been confirmed to be 
> identical to the SpacemiT K1 [2].
> 
> The device tree is adapted from the OrangePi vendor tree [3], and similar
> integration can be found in the Banana Pi kernel tree [4], confirming SoC
> compatibility.
> 
> This minimal device tree enables booting into a serial console with UART
> output and a blinking LED.
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-RV2.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> Link: https://github.com/BPI-SINOVOIP/pi-linux/blob/linux-6.6.63-k1/arch/riscv/boot/dts/spacemit/k1-x_orangepi-rv2.dts [3]
> Link: https://github.com/orangepi-xunlong/linux-orangepi/tree/orange-pi-6.6-ky [4]
> Signed-off-by: Hendrik Hamerlinck <hendrik.hamerlinck@hammernet.be>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 43 +++++++++++++++++++
>  2 files changed, 44 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 92e13ce1c16d..152832644870 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -1,3 +1,4 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> new file mode 100644
> index 000000000000..8313f9589cd2
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -0,0 +1,43 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
..
> +/* Copyright (c) 2023 Ky, Inc */
Copyright should cover current year, which is 2025..
what's "Ky" stand for? Can you give a full description here

> +
> +/dts-v1/;
> +
> +#include "k1.dtsi"
> +#include "k1-pinctrl.dtsi"
> +
> +/ {
> +	model = "OrangePi RV2";
> +	compatible = "xunlong,orangepi-rv2", "spacemit,k1";
> +
..
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x00000000 0x0 0x80000000>;
> +	};
> +
> +	memory@100000000 {
> +		device_type = "memory";
> +		reg = <0x1 0x00000000 0x0 0x80000000>;
> +	};
> +
for the memory nodes, there are 2/4/8GB variants from the Link [1], and
you couldn't cover all of them in one dt

besides, I thought bootloader (u-boot) will populate these info, right?
so the above nodes isn't really necessary

> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led1 {
> +			label = "sys-led";
> +			gpios = <&gpio K1_GPIO(96) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger = "heartbeat";
> +			default-state = "on";
> +		};
> +	};
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_2_cfg>;
> +	status = "okay";
> +};
> -- 
> 2.43.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
