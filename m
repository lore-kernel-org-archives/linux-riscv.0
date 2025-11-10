Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 828AECCF9E3
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Nov 2025 13:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=amM67dzQ74SHGXpqTzO5nCC5lqueS13Oe/ZRVymagmc=; b=32FRBpIq3Asqyy
	m1PgJfBllitH0x2tsmMDKQH87JVv/6O5Gpa1IfVnUcoVux1v45xQWJmqhxs7xB4eYM0y2DvCUD4TQ
	93E0tPhBpHla9/Zo6WyKIPsxznaxQRQzGLpeQRtnnzoP6mHXufLl2FJNTbKnCyAg0nSCTM3PjGuPo
	JNK6ZUQrNxjD9KYN8XEIbPCZTD+L0QEi8ZyR5iSvudMvF7Pw+FqJ41qLWlaFfk8OwyU2vFfyYz58h
	YgNsgd10QQ6IczqKZPdU5JHzW+5AvjPD0rMLDqOGDd9V+xY2JoqvlojMvoG66bMbmmZReu5sxTXB5
	Sdho81wiSZ90XyLtcZjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIS9R-00000005VWy-148y;
	Mon, 10 Nov 2025 13:41:45 +0000
Received: from woodpecker.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIS9P-00000005VWB-0AqM
	for linux-riscv@lists.infradead.org;
	Mon, 10 Nov 2025 13:41:44 +0000
Received: from localhost (unknown [116.232.48.119])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 6D29C340F7B;
	Mon, 10 Nov 2025 13:41:40 +0000 (UTC)
Date: Mon, 10 Nov 2025 21:41:34 +0800
From: Yixun Lan <dlan@gentoo.org>
To: michael.opdenacker@rootcommit.com
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] riscv: dts: spacemit: Add OrangePi R2S board
 device tree
Message-ID: <20251110134134-GYC1651402@gentoo.org>
References: <20251110101110.948198-1-michael.opdenacker@rootcommit.com>
 <20251110101110.948198-3-michael.opdenacker@rootcommit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251110101110.948198-3-michael.opdenacker@rootcommit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_054143_136909_8BA93FF2 
X-CRM114-Status: GOOD (  23.51  )
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

Hi Michael,

On 10:11 Mon 10 Nov     , michael.opdenacker@rootcommit.com wrote:
> From: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> 
> Add initial device tree support for the OrangePi RV2 board [1], which is
> marketed as using the Ky X1 SoC but has been confirmed to be
> identical to the SpacemiT K1 [2].
> 
..
> The device tree is similar to the OrangePi RV2 device tree
> (k1-orangepi-rv2.dts).
Drop above, this info is useless, will even bring more confusion

> 
> This minimal device tree enables:
> 
..
> - booting into a serial console with UART.
 Enable UART0, to boot into a serial console
> 
> - the two RGMII ethernet ports
>   supporting Gigabit Ethernet operation.
> 
>   They have an external Motorcomm YT8531C PHY attached,
>   the PHY uses GPIO for reset pin control. 
..
> Their description
>   was reused from the DTS from the OrangePi RV2 board.
As I commented in v1, please drop above which is not technical related, useless..

Two Gigabit ethernet ports with RGMII interface standard support are enabled,
each port is connected to an external Motorcomm YT8531C PHY chip which uses
the GPIO for reset control. 

(I'm no native english speaker, try to slightly rearrange above text)
> 
> - PDMA for the SpacemiT K1-based SoC.
> 
> - the 8 GB eMMC chip for storage.
..
>   It works fine with the same description as
>   on the BananaPi F3 board DTS.
ditto, useless & drop
> 
> Link: http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-R2S.html [1]
> Link: https://www.spacemit.com/en/key-stone-k1 [2]
> 
ditto, no blank line
> Signed-off-by: Michael Opdenacker <michael.opdenacker@rootcommit.com>
> ---
>  arch/riscv/boot/dts/spacemit/Makefile         |  1 +
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 90 +++++++++++++++++++
>  2 files changed, 91 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> 
> diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
> index 942ecb38bea0..96b3a13a3944 100644
> --- a/arch/riscv/boot/dts/spacemit/Makefile
> +++ b/arch/riscv/boot/dts/spacemit/Makefile
> @@ -3,3 +3,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-bananapi-f3.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
>  dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
> +dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
ditto, please sort
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> new file mode 100644
> index 000000000000..58098c4a2aab
> --- /dev/null
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 Michael Opdenacker <michael.opdenacker@rootcommit.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "k1.dtsi"
> +#include "k1-pinctrl.dtsi"
> +
> +/ {
> +	model = "OrangePi R2S";
> +	compatible = "xunlong,orangepi-r2s", "spacemit,k1";
> +
> +	aliases {
> +		serial0 = &uart0;
> +		ethernet0 = &eth0;
> +		ethernet1 = &eth1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0";
> +	};
> +};
> +
> +&emmc {
> +	bus-width = <8>;
> +	mmc-hs400-1_8v;
> +	mmc-hs400-enhanced-strobe;
> +	non-removable;
> +	no-sd;
> +	no-sdio;
> +	status = "okay";
> +};
> +
> +&eth0 {
> +	phy-handle = <&rgmii0>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac0_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <0>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(110) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii0: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
> +&eth1 {
> +	phy-handle = <&rgmii1>;
> +	phy-mode = "rgmii-id";
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&gmac1_cfg>;
> +	rx-internal-delay-ps = <0>;
> +	tx-internal-delay-ps = <250>;
> +	status = "okay";
> +
> +	mdio-bus {
> +		#address-cells = <0x1>;
> +		#size-cells = <0x0>;
> +
> +		reset-gpios = <&gpio K1_GPIO(115) GPIO_ACTIVE_LOW>;
> +		reset-delay-us = <10000>;
> +		reset-post-delay-us = <100000>;
> +
> +		rgmii1: phy@1 {
> +			reg = <0x1>;
> +		};
> +	};
> +};
> +
> +&pdma {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_2_cfg>;
> +	status = "okay";
> +};

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
