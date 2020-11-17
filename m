Return-Path: <SRS0=V/Dh=EX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B5C1C388F9
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 02:15:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C72B421D7E
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Nov 2020 02:15:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="2y23PSqO";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UFbVT97+"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C72B421D7E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=EckvQ6A9SvB2NzAofANaTxO/Id9TNidlS5ZgpBu9vAc=; b=2y23PSqO/EjK1vR482IG+xYjl
	S3Q1yFYTXArmen7Pwj7JqkGHzLlwY59N8agNR2lDBDmx8/YTY0gDis27a+/B8tQ+SGhkxP+Uq0bcG
	84d61ofAtbpreph+5INfjkCV6hnp5Ym0LGWAsMEAdD7YWysv0Qrn+/xTefLsLYzcu2uIuimcfxZrG
	kO2TQfSWcmhuwYIcnPAlEM2OA54O3e7fFDf5fMhwm8hoTKU4f2husqvnK2bhavp6feKei2ZTB9S52
	1Z1TBcyHnXwpXplr80PxBE1/HQUSjbefcmZEgF5o5t9Qvs28n7cjybWeI/CTMPMmh8MV/M5BiPs+1
	2W6rKacIA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1keqWD-0000uw-Kr; Tue, 17 Nov 2020 02:14:53 +0000
Received: from mail-yb1-xb43.google.com ([2607:f8b0:4864:20::b43])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1keqWA-0000ub-GO
 for linux-riscv@lists.infradead.org; Tue, 17 Nov 2020 02:14:51 +0000
Received: by mail-yb1-xb43.google.com with SMTP id g15so17540565ybq.6
 for <linux-riscv@lists.infradead.org>; Mon, 16 Nov 2020 18:14:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=chz7LpCjfCN6//fHKa5Bo3DO0Id02C8McMJe/zRj2LI=;
 b=UFbVT97+wMEoBsKWG0lfDTgz0dPrNB0jQCMHLW6i8b5Nvn58NldDQqTUJMrxZiprsM
 ne1nW+e4gj1RnuLuEwS89gCXXsJ4ddmATcjsjjKOC5PaR1nqqoNtar0hyJM7UHZRRFVx
 qKHNfGvs4xDql0ZL//l72jXk/LtpNY7DYjNgdv5PKCov4TejEQq4qr7Aw3uuQYm94ixO
 K0Iap1f2Q+zisJKOw4qlbJX8G6KNJnzRbfWPGfgESxo/ZvXGxPaS2VknJqyddBlIsymM
 SLMjVAivAUwXYFlvpPWZLQAVlHpnpkiU8eU1N61l4lQJkI/xsJclcpib85gsR8DjeSxB
 1drQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=chz7LpCjfCN6//fHKa5Bo3DO0Id02C8McMJe/zRj2LI=;
 b=hPEFljK4oWl2hBmsEZJ3WDeQpE4v+cteq8D9Q7tQPBI8zXmK8obKlU2aiG2CjnbXgW
 DyP756/yP5vT0953wQCftsf1LewlT3Xt0n/qrWs80ocnhbmVlHjx+o0C1fgRO2DkwGs5
 RyPzPFnLo3RXvpM22hviTf0IBtvCKjLGsk1QFJAFgcD2ufBqHGiAj3v8EoNS5dCa4rnX
 kK2Ob/1KlYJkoSy5yojNVHSz6FyzkKaRBI8p97+qpfTNK9WAbm/Tp9AY1BVATUww7yzW
 M6bhh/C3ndgiPalvzuP+D8AvnsRzZpK6K13oaz7iedXI9g5BqJOHqSUEKY7G73BeGW6D
 C1qA==
X-Gm-Message-State: AOAM5311Qx7tU0nHd1qvRonoRKXNYpXJhiaFUX233g2x3mP/db19a9Eb
 YPeiIdlkr6HwwH+g+03n+VocqhdrjgmOA6JNcvE=
X-Google-Smtp-Source: ABdhPJz8+HwkHwE4FWvQpEJiK9BZKwdbXP9kSmFXvdXQjDdwSH0XqegGULtsOJlM8+udaOqdczxR0xJB620zry7vmuQ=
X-Received: by 2002:a25:bc91:: with SMTP id e17mr10996983ybk.332.1605579286972; 
 Mon, 16 Nov 2020 18:14:46 -0800 (PST)
MIME-Version: 1.0
References: <20201113202550.3693323-1-atish.patra@wdc.com>
 <20201113202550.3693323-4-atish.patra@wdc.com>
In-Reply-To: <20201113202550.3693323-4-atish.patra@wdc.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 17 Nov 2020 10:14:14 +0800
Message-ID: <CAEUhbmVq=O29MLGraHD_1AvV+UH0q0gh0JAu1ZJ5n7qk4Gb-tQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 3/4] RISC-V: Initial DTS for Microchip ICICLE board
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201116_211450_603114_0B80B8F1 
X-CRM114-Status: GOOD (  16.15  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree <devicetree@vger.kernel.org>, Conor.Dooley@microchip.com,
 Albert Ou <aou@eecs.berkeley.edu>, Cyril.Jean@microchip.com,
 Daire McNamara <daire.mcnamara@microchip.com>, Anup Patel <anup.patel@wdc.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Ivan.Griffin@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 14, 2020 at 4:29 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> Add initial DTS for Microchip ICICLE board having only
> essential devcies (clocks, sdhci, ethernet, serial, etc).

typo: devices

> The device tree is based on the U-Boot patch.
>
> https://patchwork.ozlabs.org/project/uboot/patch/20201110103414.10142-6-padmarao.begari@microchip.com/
>
> Signed-off-by: Atish Patra <atish.patra@wdc.com>
> ---
>  arch/riscv/boot/dts/Makefile                  |   1 +
>  arch/riscv/boot/dts/microchip/Makefile        |   2 +
>  .../microchip/microchip-mpfs-icicle-kit.dts   |  54 +++
>  .../boot/dts/microchip/microchip-mpfs.dtsi    | 342 ++++++++++++++++++
>  4 files changed, 399 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/microchip/Makefile
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
>  create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
>
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index ca1f8cbd78c0..3ea94ea0a18a 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  subdir-y += sifive
>  subdir-y += kendryte
> +subdir-y += microchip
>
>  obj-$(CONFIG_BUILTIN_DTB) := $(addsuffix /, $(subdir-y))
> diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
> new file mode 100644
> index 000000000000..622b12771fd3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += microchip-mpfs-icicle-kit.dtb
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> new file mode 100644
> index 000000000000..9a382ab0a799
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -0,0 +1,54 @@
> +// SPDX-License-Identifier: GPL-2.0+

Please make this dual-licensed, GPL or MIT.
See https://github.com/polarfire-soc/meta-polarfire-soc-yocto-bsp/blob/master/recipes-kernel/linux/files/icicle-kit-es/icicle-kit-es-a000-microchip.dts

> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +#include "microchip-mpfs.dtsi"
> +
> +/* Clock frequency (in Hz) of the rtcclk */
> +#define RTCCLK_FREQ            1000000
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC Icicle Kit";
> +       compatible = "microchip,mpfs-icicle-kit", "microchip,polarfire-soc";
> +
> +       chosen {
> +               stdout-path = &serial0;
> +       };
> +
> +       cpus {
> +               timebase-frequency = <RTCCLK_FREQ>;
> +       };
> +
> +       memory@80000000 {
> +               device_type = "memory";
> +               reg = <0x0 0x80000000 0x0 0x40000000>;
> +               clocks = <&clkcfg 26>;
> +       };
> +
> +       soc {
> +       };
> +};
> +
> +&serial0 {
> +       status = "okay";
> +};
> +
> +&serial1 {
> +       status = "okay";
> +};
> +
> +&serial2 {
> +       status = "okay";
> +};
> +
> +&serial3 {
> +       status = "okay";
> +};
> +
> +&sdcard {
> +       status = "okay";
> +};
> +
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> new file mode 100644
> index 000000000000..63ac60f345d8
> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> @@ -0,0 +1,342 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/* Copyright (c) 2020 Microchip Technology Inc */
> +
> +/dts-v1/;
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       model = "Microchip PolarFire-SoC";
> +       compatible = "microchip,polarfire-soc";
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +
> +               cpu@0 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       reg = <0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "disabled";
> +
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@1 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <1>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@2 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <2>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@3 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <3>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +
> +               cpu@4 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,rocket0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <32>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <64>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <32>;
> +                       mmu-type = "riscv,sv39";
> +                       reg = <4>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       status = "okay";
> +                       cpu4_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;
> +               compatible = "simple-bus";
> +               ranges;
> +
> +               cache-controller@2010000 {
> +                       compatible = "sifive,fu540-c000-ccache", "cache";
> +                       cache-block-size = <64>;
> +                       cache-level = <2>;
> +                       cache-sets = <1024>;
> +                       cache-size = <2097152>;
> +                       cache-unified;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <1 2 3>;
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +               };
> +
> +               clint@2000000 {
> +                       compatible = "riscv,clint0";
> +                       reg = <0x0 0x2000000 0x0 0xC000>;
> +                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> +                                               &cpu1_intc 3 &cpu1_intc 7
> +                                               &cpu2_intc 3 &cpu2_intc 7
> +                                               &cpu3_intc 3 &cpu3_intc 7
> +                                               &cpu4_intc 3 &cpu4_intc 7>;
> +               };
> +
> +               plic: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       compatible = "sifive,plic-1.0.0";
> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       riscv,ndev = <53>;
> +                       interrupt-controller;
> +                       interrupts-extended = <&cpu0_intc 11
> +                                       &cpu1_intc 11 &cpu1_intc 9
> +                                       &cpu2_intc 11 &cpu2_intc 9
> +                                       &cpu3_intc 11 &cpu3_intc 9
> +                                       &cpu4_intc 11 &cpu4_intc 9>;
> +               };
> +
> +               dma@3000000 {
> +                       compatible = "sifive,fu540-c000-pdma";
> +                       reg = <0x0 0x3000000 0x0 0x8000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       #dma-cells = <1>;
> +               };
> +
> +               refclk: refclk {
> +                       compatible = "fixed-clock";
> +                       #clock-cells = <0>;
> +                       clock-frequency = <600000000>;
> +                       clock-output-names = "msspllclk";
> +               };
> +
> +               clkcfg: clkcfg@20002000 {
> +                       compatible = "microchip,pfsoc-clkcfg";
> +                       reg = <0x0 0x20002000 0x0 0x1000>;
> +                       reg-names = "mss_sysreg";
> +                       clocks = <&refclk>;
> +                       #clock-cells = <1>;
> +                       clock-output-names = "cpuclk", "axiclk", "ahbclk", "ENVMclk",   /* 0-3   */
> +                                "MAC0clk", "MAC1clk", "MMCclk", "TIMERclk",            /* 4-7   */
> +                               "MMUART0clk", "MMUART1clk", "MMUART2clk", "MMUART3clk", /* 8-11  */
> +                               "MMUART4clk", "SPI0clk", "SPI1clk", "I2C0clk",          /* 12-15 */
> +                               "I2C1clk", "CAN0clk", "CAN1clk", "USBclk",              /* 16-19 */
> +                               "RESERVED", "RTCclk", "QSPIclk", "GPIO0clk",            /* 20-23 */
> +                               "GPIO1clk", "GPIO2clk", "DDRCclk", "FIC0clk",           /* 24-27 */
> +                               "FIC1clk", "FIC2clk", "FIC3clk", "ATHENAclk", "CFMclk"; /* 28-32 */

Should all these names be lower case?

> +               };
> +
> +               serial0: serial@20000000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20000000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <90>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 8>;
> +                       status = "disabled";
> +               };
> +
> +               serial1: serial@20100000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20100000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <91>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 9>;
> +                       status = "disabled";
> +               };
> +
> +               serial2: serial@20102000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20102000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <92>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 10>;
> +                       status = "disabled";
> +               };
> +
> +               serial3: serial@20104000 {
> +                       compatible = "ns16550a";
> +                       reg = <0x0 0x20104000 0x0 0x400>;
> +                       reg-io-width = <4>;
> +                       reg-shift = <2>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <93>;
> +                       current-speed = <115200>;
> +                       clocks = <&clkcfg 11>;
> +                       status = "disabled";
> +               };
> +
> +               emmc: mmc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88 89>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       cap-mmc-highspeed;
> +                       mmc-ddr-3_3v;
> +                       max-frequency = <200000000>;
> +                       non-removable;
> +                       no-sd;
> +                       no-sdio;
> +                       voltage-ranges = <3300 3300>;
> +                       status = "disabled";
> +               };
> +
> +               sdcard: sdhc@20008000 {
> +                       compatible = "cdns,sd4hc";
> +                       reg = <0x0 0x20008000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <88>;
> +                       pinctrl-names = "default";
> +                       clocks = <&clkcfg 6>;
> +                       bus-width = <4>;
> +                       disable-wp;
> +                       no-1-8-v;
> +                       cap-mmc-highspeed;
> +                       cap-sd-highspeed;
> +                       card-detect-delay = <200>;
> +                       sd-uhs-sdr12;
> +                       sd-uhs-sdr25;
> +                       sd-uhs-sdr50;
> +                       sd-uhs-sdr104;
> +                       max-frequency = <200000000>;
> +                       status = "disabled";
> +               };
> +
> +               emac0: ethernet@20110000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <64 65 66 67>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       phy-mode = "sgmii";
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       clock-names = "pclk", "hclk";
> +                       status = "disabled";
> +
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       phy-handle = <&phy0>;
> +                       phy0: ethernet-phy@8 {
> +                               reg = <8>;
> +                               ti,fifo-depth = <0x01>;
> +                       };
> +               };
> +
> +               emac1: ethernet@20112000 {
> +                       compatible = "cdns,macb";
> +                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <70 71 72 73>;
> +                       mac-address = [00 00 00 00 00 00];
> +                       phy-mode = "sgmii";
> +                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       clock-names = "pclk", "hclk";
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       phy1: ethernet-phy@9 {
> +                               reg = <9>;
> +                               ti,fifo-depth = <0x01>;
> +                       };
> +               };
> +
> +       };
> +};

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
