Return-Path: <SRS0=mXjn=FO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A016AC4361B
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:12 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 32A8F221E2
	for <linux-riscv@archiver.kernel.org>; Thu, 10 Dec 2020 13:35:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 32A8F221E2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=os9tEjM/lmSW5YgasBj2zGAvDSttvb55Qhi/CpTq5yc=; b=EddH1r491LvZ3ZLu6vqjend2p
	FHLGQxwd1EZ9DeJT4MgdjFjUZq4waCHXsGdYDTCk+3PWpDqV/mPhxXcMILhLsDpOsVF1UaxNaEkqE
	nzSyBR/u3WYzZOjkSHpHOrxvLRsaAjBd9O1zAhL1eldCC81WbWxQ9bJ0y09lqiZDqxdjBeYvAliyH
	Mhs6vHu9CiUc2eyrqJmEOCldB44JWjod7wy7Z+HsKRFWmX4dNO+EZLzGjOh4E+L0FVcXcAGOufnNx
	Mbw72fnl4g+wjF1Fkly5Ou+Tyxq3bQuoIC/0VwUi7Dp8EnSsXXCfNLrRimoA9oyNnNSd9EeOj+GVs
	WenrERsOQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1knM64-0001TL-2j; Thu, 10 Dec 2020 13:35:04 +0000
Received: from mail-yb1-xb44.google.com ([2607:f8b0:4864:20::b44])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1knM61-0001Qz-1o
 for linux-riscv@lists.infradead.org; Thu, 10 Dec 2020 13:35:02 +0000
Received: by mail-yb1-xb44.google.com with SMTP id o144so4220387ybc.0
 for <linux-riscv@lists.infradead.org>; Thu, 10 Dec 2020 05:35:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vfSAyzZfUjlWeyeSEewwWw2mhFaO2D8flFMA2vqBuNA=;
 b=Jm8tEDfLMwIXJ2wrtH7X1/A+NaAlnDCauFW5AjRJgM62R64rLa5gsiCbx+txq0lpP8
 6SZaayc+pbJo/qLTgIEf/RkjmcPbtpz26lGK+WR8mgi17UegIYk8o7Gm8Vxfx5d134WS
 FAvE7cFGkO+XUnS83IWARxVZBjI93OTgPeamecAXTz3Kcb6BhPqyTrxr6HDGTtS1pzRD
 g7V5n2re2MmhW6K4FvyEYxSOwsg/BGo6SZVA0hAjEh+mJvu651IV12Uam+pm3mJ25qM4
 CI7B0WAR764SeYThgr+wugAk+K7kumO1Eksoad/lY3KqEHwbmYbj9DIxSWqODo1m95Jg
 1hMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vfSAyzZfUjlWeyeSEewwWw2mhFaO2D8flFMA2vqBuNA=;
 b=tAsnFMPFXgfV5M5LVKybE2A3cTc7bvuLJDd8YNFhpHy7Jg9820wDpd3jzdJwGmYRgJ
 3v4oYgR3CUMkYEopPUA92lBP/pFVgRM6LzqTDjT+YF0/rcvkLzWLU4JUmh/0sk59Ooub
 YXMWu7xqYfi429vukO8bgXDijRAY2RgdyUkXJraFbS75uk0iXNYneFyGIvrWyMftnMUa
 gBa7cxe5yQ8FBTU073sRlk49yxnXMvyI1gDEOUI/QguJdOeEPVl25F0YjYmvT8n+ZZy4
 B+Io8ylLMoRR4uoDQF8LPN21f/e6J8bUhxyGM3gZ1+LB27ay2xJkNI1gPpJuvbITDP6z
 iT5g==
X-Gm-Message-State: AOAM531NMaiMybWOl++aiEb1K+xdDs90i6h5TXD0AIKQak0MEUizqZzq
 h3X5hQqkkerrK7xgRIZI2ppMp2luegntyCU/mFA=
X-Google-Smtp-Source: ABdhPJwXw2P7R5ISv4M6hrhYJ9kts/kEdAW82RV1P+4EI3ZDlat8PHriVJFzNbuowRuRDEPPEw6nCzOJR12j6/QfGb8=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr11138986ybs.122.1607607299236; 
 Thu, 10 Dec 2020 05:34:59 -0800 (PST)
MIME-Version: 1.0
References: <1607403341-57214-1-git-send-email-yash.shah@sifive.com>
 <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
In-Reply-To: <1607403341-57214-8-git-send-email-yash.shah@sifive.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 10 Dec 2020 21:34:47 +0800
Message-ID: <CAEUhbmURfwMYo6FTuL7TP7daSuhBOOpcZX-mfCxCTVS+QiaHqA@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] riscv: dts: add initial support for the SiFive
 FU740-C000 SoC
To: Yash Shah <yash.shah@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201210_083501_201071_92C671B6 
X-CRM114-Status: GOOD (  18.21  )
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
Cc: linux-pwm@vger.kernel.org, Peter Korsgaard <peter@korsgaard.com>,
 Albert Ou <aou@eecs.berkeley.edu>, devicetree <devicetree@vger.kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 linux-kernel <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>,
 linux-spi@vger.kernel.org, andrew@lunn.ch,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>, broonie@kernel.org,
 Thierry Reding <thierry.reding@gmail.com>, linux-i2c@vger.kernel.org,
 linux-serial@vger.kernel.org, u.kleine-koenig@pengutronix.de,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, lee.jones@linaro.org,
 Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, Dec 8, 2020 at 3:06 PM Yash Shah <yash.shah@sifive.com> wrote:
>
> Add initial support for the SiFive FU540-C000 SoC. FU740-C000 is built

FU740-C000 Soc

> around the SiFIve U7 Core Complex and a TileLink interconnect.
>
> This file is expected to grow as more device drivers are added to the
> kernel.
>
> Signed-off-by: Yash Shah <yash.shah@sifive.com>
> ---
>  arch/riscv/boot/dts/sifive/fu740-c000.dtsi | 293 +++++++++++++++++++++++++++++
>  1 file changed, 293 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/sifive/fu740-c000.dtsi
>
> diff --git a/arch/riscv/boot/dts/sifive/fu740-c000.dtsi b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> new file mode 100644
> index 0000000..eeb4f8c3
> --- /dev/null
> +++ b/arch/riscv/boot/dts/sifive/fu740-c000.dtsi
> @@ -0,0 +1,293 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/* Copyright (c) 2020 SiFive, Inc */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/clock/sifive-fu740-prci.h>
> +
> +/ {
> +       #address-cells = <2>;
> +       #size-cells = <2>;
> +       compatible = "sifive,fu740-c000", "sifive,fu740";
> +
> +       aliases {
> +               serial0 = &uart0;
> +               serial1 = &uart1;
> +               ethernet0 = &eth0;
> +       };
> +
> +       chosen {
> +       };
> +
> +       cpus {
> +               #address-cells = <1>;
> +               #size-cells = <0>;
> +               cpu0: cpu@0 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <16384>;
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x0>;
> +                       riscv,isa = "rv64imac";
> +                       status = "disabled";
> +                       cpu0_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu1: cpu@1 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x1>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu1_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu2: cpu@2 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x2>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu2_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu3: cpu@3 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x3>;
> +                       riscv,isa = "rv64imafdc";
> +                       tlb-split;
> +                       cpu3_intc: interrupt-controller {
> +                               #interrupt-cells = <1>;
> +                               compatible = "riscv,cpu-intc";
> +                               interrupt-controller;
> +                       };
> +               };
> +               cpu4: cpu@4 {
> +                       compatible = "sifive,bullet0", "riscv";
> +                       d-cache-block-size = <64>;
> +                       d-cache-sets = <64>;
> +                       d-cache-size = <32768>;
> +                       d-tlb-sets = <1>;
> +                       d-tlb-size = <40>;
> +                       device_type = "cpu";
> +                       i-cache-block-size = <64>;
> +                       i-cache-sets = <128>;
> +                       i-cache-size = <32768>;
> +                       i-tlb-sets = <1>;
> +                       i-tlb-size = <40>;
> +                       mmu-type = "riscv,sv39";
> +                       next-level-cache = <&ccache>;
> +                       reg = <0x4>;
> +                       riscv,isa = "rv64imafdc";
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
> +               compatible = "simple-bus";
> +               ranges;
> +               plic0: interrupt-controller@c000000 {
> +                       #interrupt-cells = <1>;
> +                       #address-cells = <0>;
> +                       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";

I don't see bindings updated for FU740 PLIC, like "sifive,fu740-c000-plic"?

> +                       reg = <0x0 0xc000000 0x0 0x4000000>;
> +                       riscv,ndev = <69>;
> +                       interrupt-controller;
> +                       interrupts-extended = <
> +                               &cpu0_intc 0xffffffff
> +                               &cpu1_intc 0xffffffff &cpu1_intc 9
> +                               &cpu2_intc 0xffffffff &cpu2_intc 9
> +                               &cpu3_intc 0xffffffff &cpu3_intc 9
> +                               &cpu4_intc 0xffffffff &cpu4_intc 9>;
> +               };
> +               prci: clock-controller@10000000 {
> +                       compatible = "sifive,fu740-c000-prci";
> +                       reg = <0x0 0x10000000 0x0 0x1000>;
> +                       clocks = <&hfclk>, <&rtcclk>;
> +                       #clock-cells = <1>;
> +               };
> +               uart0: serial@10010000 {
> +                       compatible = "sifive,fu740-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10010000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <39>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +               uart1: serial@10011000 {
> +                       compatible = "sifive,fu740-c000-uart", "sifive,uart0";
> +                       reg = <0x0 0x10011000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <40>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +               i2c0: i2c@10030000 {
> +                       compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
> +                       reg = <0x0 0x10030000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <52>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       reg-shift = <2>;
> +                       reg-io-width = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               i2c1: i2c@10031000 {
> +                       compatible = "sifive,fu740-c000-i2c", "sifive,i2c0";
> +                       reg = <0x0 0x10031000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <53>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       reg-shift = <2>;
> +                       reg-io-width = <1>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               qspi0: spi@10040000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10040000 0x0 0x1000>,
> +                             <0x0 0x20000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <41>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               qspi1: spi@10041000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10041000 0x0 0x1000>,
> +                             <0x0 0x30000000 0x0 0x10000000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <42>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               spi0: spi@10050000 {
> +                       compatible = "sifive,fu740-c000-spi", "sifive,spi0";
> +                       reg = <0x0 0x10050000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <43>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               eth0: ethernet@10090000 {
> +                       compatible = "sifive,fu540-c000-gem";

"sifive,fu740-c000-gem"?

> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <55>;
> +                       reg = <0x0 0x10090000 0x0 0x2000>,
> +                             <0x0 0x100a0000 0x0 0x1000>;
> +                       local-mac-address = [00 00 00 00 00 00];
> +                       clock-names = "pclk", "hclk";
> +                       clocks = <&prci PRCI_CLK_GEMGXLPLL>,
> +                                <&prci PRCI_CLK_GEMGXLPLL>;
> +                       #address-cells = <1>;
> +                       #size-cells = <0>;
> +                       status = "disabled";
> +               };
> +               pwm0: pwm@10020000 {
> +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> +                       reg = <0x0 0x10020000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <44>, <45>, <46>, <47>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +               pwm1: pwm@10021000 {
> +                       compatible = "sifive,fu740-c000-pwm", "sifive,pwm0";
> +                       reg = <0x0 0x10021000 0x0 0x1000>;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <48>, <49>, <50>, <51>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       #pwm-cells = <3>;
> +                       status = "disabled";
> +               };
> +               ccache: cache-controller@2010000 {
> +                       compatible = "sifive,fu740-c000-ccache", "cache";
> +                       cache-block-size = <64>;
> +                       cache-level = <2>;
> +                       cache-sets = <2048>;
> +                       cache-size = <2097152>;
> +                       cache-unified;
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <19 20 21 22>;
> +                       reg = <0x0 0x2010000 0x0 0x1000>;
> +               };
> +               gpio: gpio@10060000 {
> +                       compatible = "sifive,fu740-c000-gpio", "sifive,gpio0";
> +                       interrupt-parent = <&plic0>;
> +                       interrupts = <23>, <24>, <25>, <26>, <27>, <28>, <29>,
> +                                    <30>, <31>, <32>, <33>, <34>, <35>, <36>,
> +                                    <37>, <38>;
> +                       reg = <0x0 0x10060000 0x0 0x1000>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +                       clocks = <&prci PRCI_CLK_PCLK>;
> +                       status = "disabled";
> +               };
> +       };
> +};

Regards,
Bin

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
