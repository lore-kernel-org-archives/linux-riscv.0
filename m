Return-Path: <SRS0=OElg=P4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45948C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:20:48 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C0DF061175
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Nov 2021 09:20:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C0DF061175
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KX2rn5GL3huZnNtjEUJFPWZDB+cHDRsUPGvnvdg3qek=; b=c/yYgL9rn3RGFO
	79LYCL/XUZFr0uCF6PsuCh5WS5AOQc1c0CoNnkoSfHqIz2ick3IDL42rsUK5CAo7ogBMcCT6iy5V7
	ELH+ChBIWuInWfr7O2BnvLzKVAx9rvLfMWvIDDGxLorjLdMlPeiSNHGG+dLSz8eXEkK43h8wJ5BJ8
	UYWfy+blNbvLB6NdBOLBuJK5mlabz+Jg9SyE4PbnlVzAlVEKgW8P7Vc6dig0Oaz8wm2BQQ4W+VOHK
	n08CfqJysNXWQALJOOqkOvtZJBWUQfPv7cXXZmUPoUVS4r1xtNdMnpnuZAMKYzdN5qhj71PEsGGDG
	umdaDN91CeYu/nKUCSLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mkNIu-001C2J-55; Tue, 09 Nov 2021 09:20:32 +0000
Received: from mail-oo1-f48.google.com ([209.85.161.48])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mkNAM-0018yI-Na
 for linux-riscv@lists.infradead.org; Tue, 09 Nov 2021 09:11:44 +0000
Received: by mail-oo1-f48.google.com with SMTP id
 q39-20020a4a962a000000b002b8bb100791so6788414ooi.0
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:11:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DlQKg1S95wm9Dg4YX5cgg1S1wN6XXJ3v2NlE44jQYRE=;
 b=Q5DgmBI0FULnR7a/9/6TvEsqvBLLdRqEtfRlbgia0SLMumjkRAY550IltYgThER1zv
 ICxn6rfDwmnv7q4yDbw1VHOh8ybiM/eMNqydv01judQZPI/gnusUmD9yWh+JoaWi4Au5
 HWqEjBsN01S0QUciIFGmiRqeahdNk3BBP8hNvM6bXRMQ3rxHC2x1rzoiPdSSKTJ/qaV0
 mQO0ruLsC7DdoF5mjpavCHEiu2OFUOZSG5qwrjiwO6f5ZVqHlPFDHaJvN8iIs/xiezwl
 +PZd5KSx8dgCoz/qW1mToJvTOCXUY9U5uVQGb0F3ua/vbkXndCcrPNw2GMsLIG7FuoxQ
 qjgQ==
X-Gm-Message-State: AOAM530AKCyXrXECNTxyruGXqtriJVS1RBQ6CNqvBQbUQYpqetPWfDGr
 K94x9/5E8FQVdWyFdHEjMTl7/tkFDrnRVeI3
X-Google-Smtp-Source: ABdhPJx1ObmHzU2+jjNiEVAmd6xPg4N/KJSXiNy7uH+PPKcEOPBtGif+QkYbvJWha8Ko1FmoKMuXXA==
X-Received: by 2002:a4a:e544:: with SMTP id s4mr3012441oot.0.1636449101048;
 Tue, 09 Nov 2021 01:11:41 -0800 (PST)
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com.
 [209.85.210.44])
 by smtp.gmail.com with ESMTPSA id bh12sm3763943oib.25.2021.11.09.01.11.40
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 09 Nov 2021 01:11:40 -0800 (PST)
Received: by mail-ot1-f44.google.com with SMTP id
 w6-20020a9d77c6000000b0055e804fa524so1534128otl.3
 for <linux-riscv@lists.infradead.org>; Tue, 09 Nov 2021 01:11:40 -0800 (PST)
X-Received: by 2002:ab0:5552:: with SMTP id u18mr7818542uaa.78.1636448702466; 
 Tue, 09 Nov 2021 01:05:02 -0800 (PST)
MIME-Version: 1.0
References: <20211108150554.4457-1-conor.dooley@microchip.com>
 <20211108150554.4457-13-conor.dooley@microchip.com>
In-Reply-To: <20211108150554.4457-13-conor.dooley@microchip.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 9 Nov 2021 10:04:51 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
Message-ID: <CAMuHMdWEhJj0Cqt3sgGvgZe7JSFqBmTgtZRkom30NKqEW27NvQ@mail.gmail.com>
Subject: Re: [PATCH 12/13] riscv: icicle-kit: update microchip icicle kit
 device tree
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Rob Herring <robh+dt@kernel.org>, 
 Jassi Brar <jassisinghbrar@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alessandro Zummo <a.zummo@towertech.it>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Mark Brown <broonie@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
 Lewis Hanly <lewis.hanly@microchip.com>, daire.mcnamara@microchip.com, 
 Atish Patra <atish.patra@wdc.com>, ivan.griffin@microchip.com, 
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, 
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux I2C <linux-i2c@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Linux Crypto Mailing List <linux-crypto@vger.kernel.org>,
 linux-rtc@vger.kernel.org, 
 linux-spi <linux-spi@vger.kernel.org>, USB list <linux-usb@vger.kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 Bin Meng <bin.meng@windriver.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211109_011142_822348_570CDE63 
X-CRM114-Status: GOOD (  23.60  )
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

Hi Conor,

On Mon, Nov 8, 2021 at 4:07 PM <conor.dooley@microchip.com> wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> Update the device tree for the icicle kit by splitting it into a third part,
> which contains peripherals in the fpga fabric, add new peripherals
> (spi, qspi, gpio, rtc, pcie, system services, i2c), update parts of the memory
> map which have been changed.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Thanks for your patch!

Please split it into logical separated parts.

> --- /dev/null
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
> +
> +/ {
> +       fpgadma: fpgadma@60020000 {
> +               compatible = "microchip,mpfs-fpga-dma-uio";
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               reg = <0x0 0x60020000 0x0 0x1000>;
> +               interrupt-parent = <&plic>;
> +               interrupts = <PLIC_INT_FABRIC_F2H_2>;
> +               status = "okay";
> +       };
> +
> +       fpgalsram: fpga_lsram@61000000 {
> +               compatible = "generic-uio";
> +               reg = <0x0 0x61000000 0x0 0x0001000
> +                       0x14 0x00000000 0x0 0x00010000>;

Please group by angular brackets, to increase readability, and support
automatic validation:

<0x0 0x61000000 0x0 0x0001000>, <0x14 0x00000000 0x0 0x00010000>

> +               status = "okay";
> +       };

Do we really want UIO nodes in upstream DT?

> +};
> diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> index fc1e5869df1b..4212129fcdf1 100644
> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
> @@ -1,5 +1,5 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/* Copyright (c) 2020 Microchip Technology Inc */
> +/* Copyright (c) 2020-2021 Microchip Technology Inc */
>
>  /dts-v1/;
>
> @@ -13,72 +13,187 @@ / {
>         compatible = "microchip,mpfs-icicle-kit", "microchip,mpfs";
>
>         aliases {
> -               ethernet0 = &emac1;
> -               serial0 = &serial0;
> -               serial1 = &serial1;
> -               serial2 = &serial2;
> -               serial3 = &serial3;
> +               mmuart0 = &mmuart0;
> +               mmuart1 = &mmuart1;
> +               mmuart2 = &mmuart2;
> +               mmuart3 = &mmuart3;
> +               mmuart4 = &mmuart4;

Why? SerialN is the standard alias name.

>         };

>
> -&emac0 {
> +&spi0 {
> +       status = "okay";
> +       spidev@0 {
> +               compatible = "spidev";

Please don't use "spidev", but a proper compatible value describing
what is really connected.  If you want to use it with spidev (which
is software policy, not hardware description), add that compatible
value to drivers/spi/spidev.c:spidev_dt_ids[], or use driver_override
in sysfs at runtime.

> +               reg = <0>; /* CS 0 */
> +               spi-max-frequency = <10000000>;
> +               status = "okay";
> +       };
> +};
> +
> +&spi1 {
> +       status = "okay";

No slave devices specified?

> +};
> +
> +&qspi {
> +       status = "okay";
> +};
> +
> +&i2c0 {
> +       status = "okay";
> +};
> +
> +&i2c1 {
> +       status = "okay";
> +       pac193x: pac193x@10 {

adc@, I guess?

> +               compatible = "microchip,pac1934";
> +               reg = <0x10>;
> +               samp-rate = <64>;
> +               status = "okay";
> +               ch0: channel0 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDREG";
> +                       channel_enabled;
> +               };
> +               ch1: channel1 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDA25";
> +                       channel_enabled;
> +               };
> +               ch2: channel2 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDD25";
> +                       channel_enabled;
> +               };
> +               ch3: channel3 {
> +                       uohms-shunt-res = <10000>;
> +                       rail-name = "VDDA_REG";
> +                       channel_enabled;
> +               };
> +       };
> +};

> +&gpio2 {
> +       interrupts = <PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT
> +               PLIC_INT_GPIO2_NON_DIRECT>;

Why override interrupts in the board .dts file?
Doesn't this belong in the SoC .dtsi file?
Please group using angular brackets.

> --- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi

> @@ -145,49 +149,55 @@ cpu4_intc: interrupt-controller {
>         soc {
>                 #address-cells = <2>;
>                 #size-cells = <2>;
> -               compatible = "simple-bus";
> +               compatible = "microchip,mpfs-soc", "simple-bus";
>                 ranges;
>
> -               cache-controller@2010000 {
> +               cctrllr: cache-controller@2010000 {
>                         compatible = "sifive,fu540-c000-ccache", "cache";
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_L2_METADATA_CORR
> +                               PLIC_INT_L2_METADAT_UNCORR
> +                               PLIC_INT_L2_DATA_CORR>;

Please group using angular brackets.

>                         cache-block-size = <64>;
>                         cache-level = <2>;
>                         cache-sets = <1024>;
>                         cache-size = <2097152>;
>                         cache-unified;
> -                       interrupt-parent = <&plic>;
> -                       interrupts = <1 2 3>;
> -                       reg = <0x0 0x2010000 0x0 0x1000>;
>                 };
>
> -               clint@2000000 {
> +               clint: clint@2000000 {
>                         compatible = "sifive,fu540-c000-clint", "sifive,clint0";
>                         reg = <0x0 0x2000000 0x0 0xC000>;
> -                       interrupts-extended = <&cpu0_intc 3 &cpu0_intc 7
> -                                               &cpu1_intc 3 &cpu1_intc 7
> -                                               &cpu2_intc 3 &cpu2_intc 7
> -                                               &cpu3_intc 3 &cpu3_intc 7
> -                                               &cpu4_intc 3 &cpu4_intc 7>;
> +                       interrupts-extended =
> +                                       <&cpu0_intc HART_INT_M_SOFT &cpu0_intc HART_INT_M_TIMER
> +                                        &cpu1_intc HART_INT_M_SOFT &cpu1_intc HART_INT_M_TIMER
> +                                        &cpu2_intc HART_INT_M_SOFT &cpu2_intc HART_INT_M_TIMER
> +                                        &cpu3_intc HART_INT_M_SOFT &cpu3_intc HART_INT_M_TIMER
> +                                        &cpu4_intc HART_INT_M_SOFT &cpu4_intc HART_INT_M_TIMER>;

Please group using angular brackets.

>                 };
>
>                 plic: interrupt-controller@c000000 {
> -                       #interrupt-cells = <1>;
> -                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> +                       compatible = "sifive,plic-1.0.0";

Why drop the first one again?

>                         reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       #interrupt-cells = <1>;
>                         riscv,ndev = <186>;
>                         interrupt-controller;
> -                       interrupts-extended = <&cpu0_intc 11
> -                                       &cpu1_intc 11 &cpu1_intc 9
> -                                       &cpu2_intc 11 &cpu2_intc 9
> -                                       &cpu3_intc 11 &cpu3_intc 9
> -                                       &cpu4_intc 11 &cpu4_intc 9>;
> +                       interrupts-extended = <&cpu0_intc HART_INT_M_EXT
> +                                       &cpu1_intc HART_INT_M_EXT &cpu1_intc HART_INT_S_EXT
> +                                       &cpu2_intc HART_INT_M_EXT &cpu2_intc HART_INT_S_EXT
> +                                       &cpu3_intc HART_INT_M_EXT &cpu3_intc HART_INT_S_EXT
> +                                       &cpu4_intc HART_INT_M_EXT &cpu4_intc HART_INT_S_EXT>;
>                 };
>
> -               dma@3000000 {
> -                       compatible = "sifive,fu540-c000-pdma";
> +               pdma: pdma@3000000 {
> +                       compatible = "microchip,mpfs-pdma-uio";
>                         reg = <0x0 0x3000000 0x0 0x8000>;
>                         interrupt-parent = <&plic>;
> -                       interrupts = <23 24 25 26 27 28 29 30>;
> +                       interrupts = <PLIC_INT_DMA_CH0_DONE PLIC_INT_DMA_CH0_ERR
> +                               PLIC_INT_DMA_CH1_DONE PLIC_INT_DMA_CH1_ERR
> +                               PLIC_INT_DMA_CH2_DONE PLIC_INT_DMA_CH2_ERR
> +                               PLIC_INT_DMA_CH3_DONE PLIC_INT_DMA_CH3_ERR>;

Please group using angular brackets.

>                         #dma-cells = <1>;
>                 };
>
> @@ -205,7 +215,7 @@ clkcfg: clkcfg@20002000 {
>                         clocks = <&refclk>;
>                         #clock-cells = <1>;
>                         clock-output-names = "cpu", "axi", "ahb", "envm",       /* 0-3   */
> -                                "mac0", "mac1", "mmc", "timer",                /* 4-7   */
> +                               "mac0", "mac1", "mmc", "timer",                 /* 4-7   */
>                                 "mmuart0", "mmuart1", "mmuart2", "mmuart3",     /* 8-11  */
>                                 "mmuart4", "spi0", "spi1", "i2c0",              /* 12-15 */
>                                 "i2c1", "can0", "can1", "usb",                  /* 16-19 */

No need for clock-output-names at all.

>
> -               emac1: ethernet@20112000 {
> +               mac0: ethernet@20110000 {
>                         compatible = "cdns,macb";
> -                       reg = <0x0 0x20112000 0x0 0x2000>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       reg = <0x0 0x20110000 0x0 0x2000>;
> +                       clocks = <&clkcfg CLK_MAC0>, <&clkcfg CLK_AHB>;
> +                       clock-names = "pclk", "hclk";
>                         interrupt-parent = <&plic>;
> -                       interrupts = <70 71 72 73>;
> -                       local-mac-address = [00 00 00 00 00 00];
> -                       clocks = <&clkcfg 5>, <&clkcfg 2>;
> +                       interrupts = <PLIC_INT_MAC0_INT
> +                               PLIC_INT_MAC0_QUEUE1
> +                               PLIC_INT_MAC0_QUEUE2
> +                               PLIC_INT_MAC0_QUEUE3
> +                               PLIC_INT_MAC0_EMAC
> +                               PLIC_INT_MAC0_MMSL>;

Please group using angular brackets.

> +                       mac-address = [56 34 12 00 FC 01];

Please drop this.

>                         status = "disabled";
> +               };
>
> +               rtc: rtc@20124000 {
> +                       compatible = "microchip,mpfs-rtc";
>                         #address-cells = <1>;
>                         #size-cells = <0>;
> +                       reg = <0x0 0x20124000 0x0 0x1000>;
> +                       clocks = <&clkcfg CLK_RTC>;
> +                       clock-names = "rtc";
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_RTC_WAKEUP PLIC_INT_RTC_MATCH>;

Please group using angular brackets.

> +                       status = "disabled";
>                 };
>
> +               usb: usb@20201000 {
> +                       compatible = "microchip,mpfs-usb-host";
> +                       reg = <0x0 0x20201000 0x0 0x1000>;
> +                       reg-names = "mc","control";
> +                       clocks = <&clkcfg CLK_USB>;
> +                       interrupt-parent = <&plic>;
> +                       interrupts = <PLIC_INT_USB_DMA PLIC_INT_USB_MC>;

Please group using angular brackets.

> +                       interrupt-names = "dma","mc";
> +                       dr_mode = "host";
> +                       status = "disabled";
> +               };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
