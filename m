Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 463B9ECAAA1
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 13:12:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K5kI46zfzlvrZpnzDPXUBlWar/BLWsTqZg9QOVY5z1k=; b=MjyM2XU1Qgbc9O
	g3LAjsNsKTRtFaZ0k7OKG6xReI/WVWjoELR326NjXfGKk6tk4Sh7ZWIbDdwN0HeJkyi6IN8h8M5AP
	NeIKH2wt2o7ZQhah9Z6m+FUBMv8jVscIIR2IFGV01FYAHGS0m0dBNQctkIcAYMMZ4SK98CFGWHr7S
	PIJgl4UfQM+7QPISkUo/5Q9wHoMaF4OmaSKamf6LJrDC4uayvce8DIZ8tsMA0jM2PyNRSbsWmtCAz
	tctUwTBLyLaSuv+FeBJgWt+HJ6vKmh5t4DSxmLIUYi7QQuThbVfkHvmJY+qv46yFAgpk4rtAFvEYn
	l51s69NfjuiH2Epz/5Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYNA-00DeIj-C4; Tue, 06 Sep 2022 13:12:12 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVYN6-00DeBz-VL
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 13:12:10 +0000
Received: by mail-lj1-x22b.google.com with SMTP id r27so11816127ljn.0
        for <linux-riscv@lists.infradead.org>; Tue, 06 Sep 2022 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=yOWqU/noN30I+JdUCdYobc9an3E9kR1qqO/vRiBd6KA=;
        b=SwNWX/omCq1NtZCynmzSPeNoENmgdnIUCCC67r37VRQDfChD4AVnn0JPWMJsF+GmEv
         Fyn4e/WPu7WtRzpE1hiU7B27R98P1JvlR1MHN2MVSZY3+cDzTKgHiqpx2raCKm3Rl8g2
         FBnn6C60IOuEnWIacb9lLLbLSTcea+vvJb5MaaJfvScu0NKRZtNNUeDSzhGu2tY/QmcR
         pNlfjJsNz+MybwL1VLAnyWmBGV7JNquC+QdzaBkNnVKssnK+ATLSYzVFx8LhHwFohEOG
         xWjCN/+d8Aw0uelzEJTAtvJiuHCn4zpd87LqelXGQX3hg+Qcpt+ovEXEPbPG6TtMGTDK
         oBQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=yOWqU/noN30I+JdUCdYobc9an3E9kR1qqO/vRiBd6KA=;
        b=vvBees8P2jsq5wNM5jKmi9bD/twJ02BmpGlzTpxO3ivY9ehOXJzY4zHT8qh5U1sBGD
         s5q5/igb9YAS2c9GnxYvFkDvlyR/hi5e8o4pXw57h/QW7W7OEcCNobU7VE3PHX81CdWU
         ys9eOsrtzaUE0SZcVSNw/2W2yPi47w5K3gvRTBiRyeNIhJutj09IKoHKDLHo+chI8Awh
         yOse8LL40jHXoVoX5GqIonhP8VvZbXk5838byeL9Uzg/5g323J76tqi9q6NC9JPPxdeH
         9MgCsPPstP4ev37FY9vq4gdBm7jnzOTXZ0Sxhl1QnC6oBaKA/QMJpLDVxZlomwOHxqxl
         32Cw==
X-Gm-Message-State: ACgBeo2dreSkhC6PKVwz/IEkHm+ldVOeaUi7LY4Fcr4iq0gxPTsNENC+
	trxTtZcW+cm9aaIXjW5rMXJERHkCRwS9IQ==
X-Google-Smtp-Source: AA6agR4jzQemR2LrR1WAzy6iJ5n0+xbpOl8/JFVbFCBlif7gfwSIxEQ3iWY81gAdF3TctAFAz7VNYQ==
X-Received: by 2002:a2e:80c8:0:b0:269:6aef:b94d with SMTP id r8-20020a2e80c8000000b002696aefb94dmr4352716ljg.57.1662469918707;
        Tue, 06 Sep 2022 06:11:58 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id q27-20020a05651232bb00b0049110ba325asm1719363lfe.158.2022.09.06.06.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Sep 2022 06:11:57 -0700 (PDT)
Message-ID: <71dad0f0-db66-e79e-5e01-d5fc66b0cb3e@linaro.org>
Date: Tue, 6 Sep 2022 15:11:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v1 3/3] riscv: dts: microchip: add a devicetree for the
 Aldec TySoM
Content-Language: en-US
To: Conor Dooley <conor.dooley@microchip.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Daire McNamara <daire.mcnamara@microchip.com>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20220906121525.3212705-1-conor.dooley@microchip.com>
 <20220906121525.3212705-4-conor.dooley@microchip.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220906121525.3212705-4-conor.dooley@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_061209_106196_CEC01B31 
X-CRM114-Status: GOOD (  20.93  )
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

On 06/09/2022 14:15, Conor Dooley wrote:
> The TySOM-M-MPFS250 is a compact SoC prototyping board featuring
> a Microchip PolarFire SoC MPFS250T-FCG1152. Features include:
> - 16 GB FPGA DDR4
> - 16 GB MSS DDR4 with ECC
> - eMMC
> - SPI flash memory
> - 2x Ethernet 10/100/1000
> - USB 2.0
> - PCIe x4 Gen2
> - HDMI OUT
> - 2x FMC connector (HPC and LPC)
> 
> Link: https://www.aldec.com/en/products/emulation/tysom_boards/polarfire_microchip/tysom_m_mpfs250
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  arch/riscv/boot/dts/microchip/Makefile        |   1 +
>  .../dts/microchip/mpfs-tysom-m-fabric.dtsi    |  47 +++++
>  .../riscv/boot/dts/microchip/mpfs-tysom-m.dts | 168 ++++++++++++++++++
>  3 files changed, 216 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
>  create mode 100644 arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> 
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> index 7427a20934f3..c54922a325fd 100644
> --- a/arch/riscv/boot/dts/microchip/Makefile
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -3,4 +3,5 @@ dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
>  dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-m100pfsevp.dtb
>  dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
>  dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-sev-kit.dtb
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-tysom-m.dtb
>  obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> new file mode 100644
> index 000000000000..51d0c5176b9e
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m-fabric.dtsi
> @@ -0,0 +1,47 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2022 Microchip Technology Inc */
> +
> +// #include "dt-bindings/mailbox/miv-ihc.h"
> +
> +/ {
> +	fabric_clk3: fabric-clk3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <62500000>;
> +	};
> +
> +	fabric_clk1: fabric-clk1 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	pcie: pcie@2000000000 {
> +		compatible = "microchip,pcie-host-1.0";
> +		#address-cells = <0x3>;
> +		#interrupt-cells = <0x1>;
> +		#size-cells = <0x2>;
> +		device_type = "pci";
> +		reg = <0x20 0x0 0x0 0x8000000>, <0x0 0x43000000 0x0 0x10000>;
> +		reg-names = "cfg", "apb";
> +		bus-range = <0x0 0x7f>;
> +		interrupt-parent = <&plic>;
> +		interrupts = <119>;
> +		interrupt-map = <0 0 0 1 &pcie_intc 0>,
> +				<0 0 0 2 &pcie_intc 1>,
> +				<0 0 0 3 &pcie_intc 2>,
> +				<0 0 0 4 &pcie_intc 3>;
> +		interrupt-map-mask = <0 0 0 7>;
> +		clocks = <&fabric_clk1>, <&fabric_clk1>, <&fabric_clk3>;
> +		clock-names = "fic0", "fic1", "fic3";
> +		ranges = <0x3000000 0x0 0x8000000 0x20 0x8000000 0x0 0x80000000>;
> +		msi-parent = <&pcie>;
> +		msi-controller;
> +		status = "disabled";
> +		pcie_intc: interrupt-controller {
> +			#address-cells = <0>;
> +			#interrupt-cells = <1>;
> +			interrupt-controller;
> +		};
> +	};
> +};
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> new file mode 100644
> index 000000000000..5ad2fbd1b7ae
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> @@ -0,0 +1,168 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Original all-in-one devicetree:
> + * Copyright (C) 2020-2022 - Aldec
> + * Rewritten to use includes:
> + * Copyright (C) 2022 - Conor Dooley <conor.dooley@microchip.com>
> + */
> +
> +/dts-v1/;
> +
> +#include "mpfs.dtsi"
> +#include "mpfs-tysom-m-fabric.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define MTIMER_FREQ		1000000
> +
> +/ {
> +	model = "Aldec TySOM-M-MPFS250T";
> +	compatible = "aldec,tysom-m-mpfs250t", "microchip,mpfs";
> +
> +	aliases {
> +		ethernet0 = &mac0;
> +		ethernet1 = &mac1;
> +		serial0 = &mmuart0;
> +		serial1 = &mmuart1;
> +		serial2 = &mmuart2;
> +		serial3 = &mmuart3;
> +		serial4 = &mmuart4;
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial1:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency = <MTIMER_FREQ>;
> +	};
> +
> +	ddrc_cache_lo: memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x0 0x40000000>;
> +		status = "okay";
> +	};
> +
> +	ddrc_cache_hi: memory@1000000000 {
> +		device_type = "memory";
> +		reg = <0x10 0x00000000 0x0 0x40000000>;
> +		status = "okay";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		status = "okay";
> +
> +		led0 {

Typically this is led-0

> +			gpios = <&gpio1 23 1>;

Does '1' stand for some GPIO flag?

> +			default-state = "on";
> +			linux,default-trigger = "heartbeat";
> +		};
> +	};
> +};
> +
> +&i2c0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +	hwmon: hwmon@45 {
> +		status = "okay";

No need for status.

> +		compatible = "ti,ina219";
> +		reg = <0x45>;
> +		shunt-resistor = <2000>;
> +	};
> +};
> +
> +&gpio1 {
> +	interrupts = <27>, <28>, <29>, <30>,
> +		     <31>, <32>, <33>, <47>,
> +		     <35>, <36>, <37>, <38>,
> +		     <39>, <40>, <41>, <42>,
> +		     <43>, <44>, <45>, <46>,
> +		     <47>, <48>, <49>, <50>;
> +	status = "okay";
> +};
> +
> +&mac0 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy0>;
> +
> +};
> +
> +&mac1 {
> +	status = "okay";
> +	phy-mode = "gmii";
> +	phy-handle = <&phy1>;
> +	phy1: ethernet-phy@1 {
> +		reg = <1>;
> +	};
> +	phy0: ethernet-phy@0 {
> +		reg = <0>;
> +	};
> +};
> +
> +&mbox {
> +	status = "okay";
> +};
> +
> +&mmc {
> +	max-frequency = <200000000>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&mmuart1 {
> +	status = "okay";
> +};
> +
> +&mmuart2 {
> +	status = "okay";
> +};
> +
> +&mmuart3 {
> +	status = "okay";
> +};
> +
> +&mmuart4 {
> +	status = "okay";
> +};
> +
> +&refclk {
> +	clock-frequency = <125000000>;
> +};
> +
> +&rtc {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi1 {
> +	status = "okay";
> +	flash@0 {
> +		#address-cells = <1>;
> +		#size-cells = <1>;

Are these needed? Does it pass dtbs_check?

> +		compatible = "micron,n25q128a11", "jedec,spi-nor";
> +		status = "okay";

No need for status.

Best regards,
Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
