Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72A5DC10F14
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 13:10:27 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 41DC32133D
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 13:10:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="B6sy5H0v";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="dlXQ4DZU"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 41DC32133D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ohlNLWvzixewvXp6lXWwaFBjkwKUOdnYJoRGzTMzdgU=; b=B6sy5H0vw6LzSt
	9YlhJV9LKtiFRVyqEj0BxVPPTfSb2mMBg+/Jaear+RrZj+HXfsEmu1A6vChPuOqpKl9LQ6J5fPaCa
	PqUYdukbt6UhjYkoN55AUqSQyo4DfrynYyuevtnZwrIiQGdMlvSesOM2GeWxOacRvBI656h0UMDW0
	uI47Jh1q1AgOINxaqiQjoplDzzoy0TaD+8jviT/ZWL/hoQt6tU6mtk/xLZ3xaygTM+9rLDhIOhjoJ
	N6gKde+gtZrqawEiu8jByMYXLYn4M0q6JnJLMignLHXcj9Mtv40EkPJGyCBhv3doY/0vWlrS80Uob
	4+PCAlxl+qNIbvnRh4qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEZTD-0006Ha-9v; Thu, 11 Apr 2019 13:10:23 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEZT8-0006Aj-UR
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 13:10:22 +0000
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
 [209.85.222.179])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D364F2184E
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 13:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1554988218;
 bh=Xy35SrYQLMKibKjChobT5LUTLz9B5on71DQVV0dz1hk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=dlXQ4DZUSMtZUNITLbqjP1ruGN8wVt2YDzISshha+pfUE6WyFOrPBc03gWa27GZbQ
 wAxS8L14AsfZxwNSS0srGTIf386y8g9Xcztgsey5ch2VSX7KIXe3StPUea6TAFt/l5
 To6SWUf3laONUW7r2wwgPWn5UH0kBXuWfUMk/1/8=
Received: by mail-qk1-f179.google.com with SMTP id g1so3379638qki.5
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 06:10:17 -0700 (PDT)
X-Gm-Message-State: APjAAAWUOn/RUxNVwN6rFPVjlsLA+nb7l2+XocY3UHrGVrmBR+PvXvAU
 mbeO7P6LSDQKL79bA3XwJdYbO5jpT0AgUlcqDw==
X-Google-Smtp-Source: APXvYqwDT4riN1f0sWGggkDSJUaF5eW8M834SxDXilHv+2dgNAZQGdeXiBiM8HTaoHtlE6atHW481jU3zfNSIDqxT8M=
X-Received: by 2002:a37:6441:: with SMTP id y62mr38007553qkb.158.1554988217026; 
 Thu, 11 Apr 2019 06:10:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
 <20190411084304.5072-5-paul.walmsley@sifive.com>
In-Reply-To: <20190411084304.5072-5-paul.walmsley@sifive.com>
From: Rob Herring <robh+dt@kernel.org>
Date: Thu, 11 Apr 2019 08:10:05 -0500
X-Gmail-Original-Message-ID: <CAL_Jsq+VkYrm3ErGRBsVGbYhfd-UEJmBY9VVGsx9k3Ja_zsYPw@mail.gmail.com>
Message-ID: <CAL_Jsq+VkYrm3ErGRBsVGbYhfd-UEJmBY9VVGsx9k3Ja_zsYPw@mail.gmail.com>
Subject: Re: [PATCH 4/6] riscv: dts: add initial support for the SiFive
 FU540-C000 SoC
To: Paul Walmsley <paul.walmsley@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_061019_370331_3B62A9B4 
X-CRM114-Status: GOOD (  19.73  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Rob Herring <robh+dt@kernel.org>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Apr 11, 2019 at 3:43 AM Paul Walmsley <paul.walmsley@sifive.com> wrote:
>
> Add initial support for the SiFive FU540-C000 SoC.  This is a 28nm SoC
> based around the SiFive U54-MC core complex and a TileLink
> interconnect.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
> Signed-off-by: Paul Walmsley <paul@pwsan.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Palmer Dabbelt <palmer@sifive.com>
> Cc: Albert Ou <aou@eecs.berkeley.edu>
> Cc: devicetree@vger.kernel.org
> Cc: linux-riscv@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> ---
>  arch/riscv/boot/dts/sifive/fu540-c000.dtsi | 207 +++++++++++++++++++++
>  1 file changed, 207 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu540-c000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sifive/fu540-c000.dtsi b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> new file mode 100644
> index 000000000000..dd3b9395cedf
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu540-c000.dtsi
> @@ -0,0 +1,207 @@
> +// SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0+)

You're okay with GPLv9 license?

You're free to license however you want, but most dts files use MIT
for permissive license.

> +/* Copyright (c) 2018-2019 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/sifive-fu540-prci.h>
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       compatible = "sifive,fu540-c000", "sifive,fu540";

No point in this as the board file overrides.

> +
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +       };
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               timebase-frequency = <1000000>;
> +               cpu0: cpu@0 {
> +                       compatible = "sifive,e51", "sifive,rocket0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       reg = <0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "okay";

okay is the default.

It is strange cpu@0 is missing many of the cache properties...

> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu1: cpu@1 {
> +                       compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
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
> +                       status = "okay";
> +                       tlb-split;
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu2: cpu@2 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
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
> +                       status = "okay";
> +                       tlb-split;
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu3: cpu@3 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
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
> +                       status = "okay";
> +                       tlb-split;
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu4: cpu@4 {
> +                       clock-frequency = <0>;
> +                       compatible = "sifive,u54-mc", "sifive,rocket0", "riscv";
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
> +                       status = "okay";
> +                       tlb-split;
> +                       cpu4_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +       };
> +       soc {
> +               #address-cells = <2>;
> +               #size-cells = <2>;

Really need 64-bits of address and size for peripherals?

> +               compatible = "sifive,fu540-c000", "sifive,fu540", "simple-bus";

Just simple-bus here. You can't reuse compatible strings.

> +               ranges;
> +               plic0: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       compatible = "sifive,plic-1.0.0";
> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       interrupt-controller;
> +                       interrupts-extended = <
> +                               &cpu0_intc 11
> +                               &cpu1_intc 11 &cpu1_intc 9
> +                               &cpu2_intc 11 &cpu2_intc 9
> +                               &cpu3_intc 11 &cpu3_intc 9
> +                               &cpu4_intc 11 &cpu4_intc 9>;
> +               };
> +               prci: clock-controller@10000000 {
> +                       compatible = "sifive,fu540-c000-prci";
> +                       reg = <0x0 0x10000000 0x0 0x1000>;
> +                       clocks = <&hfclk>, <&rtcclk>;
> +                       #clock-cells = <1>;
> +               };
> +               uart0: serial@10010000 {
> +                       compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10010000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;

Move all these up to the parent.

> +                       interrupts = <4>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +               };
> +               uart1: serial@10011000 {
> +                       compatible = "sifive,fu540-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10011000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <5>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +               };
> +               qspi0: spi@10040000 {
> +                       compatible = "sifive,fu540-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10040000 0x0 0x1000
> +                              0x0 0x20000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <51>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +               qspi2: spi@10050000 {
> +                       compatible = "sifive,fu540-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10050000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <6>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +               qspi1: spi@10140000 {
> +                       compatible = "sifive,fu540-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10140000 0x0 0x1000
> +                              0x0 0x30000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <52>;
> +                       clocks = <&prci PRCI_CLK_TLCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +               };
> +       };
> +};
> --
> 2.20.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
