Return-Path: <SRS0=F85b=GA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52CC7C433E0
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:04:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 16E7D20739
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Dec 2020 12:04:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 16E7D20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JFz1P0V+haoZUaffhp3EZArG7uPXBGxUB3m4eZOalYs=; b=TdW1J9scw81vXEqDFeXBZJ8qD
	I7XAd/KxvS5fBwKxjVZDD0HUMznyFiNcsgemL/w3EbmyGGDH6kkAbO14d9mW9FEFrCz9Db9/4UMEf
	J2dwlVsQGHBjicrdmVBrI4tOuOXXMeBM9sKv57A4pwiGeyNNAorGtavty86GjdeMdCuBT0KwE/sYP
	t8lM4u8q1CkXV4UMrCcz5Nb9sFRXBpUHsQ03q5ArqM8vm1Rmc+dYSBWEx2E+eBdh4dhNZVDPgeEw/
	KlE381AGlr/w5KWBV0B9O//KOCTA/OFGRqaRgGa6zpuiw4WKNpFxPoyG1uUkyoG8TQmeMn217eGzK
	kHpCN7yEQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1ktrFx-0007Sx-E7; Mon, 28 Dec 2020 12:04:09 +0000
Received: from mail-lf1-x12c.google.com ([2a00:1450:4864:20::12c])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1ktrFv-0007Rs-Df
 for linux-riscv@lists.infradead.org; Mon, 28 Dec 2020 12:04:08 +0000
Received: by mail-lf1-x12c.google.com with SMTP id s26so23364548lfc.8
 for <linux-riscv@lists.infradead.org>; Mon, 28 Dec 2020 04:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
 b=N1BqInflZaVkvS7OFqtKtFNbJwXS2drGzzeilgbCkGVgaiLQmFNXnkD3V63iRuyHKz
 udNkBwZ36/VzHCTQyP5bca9C20HcAso3QK8/CgxbDfL9OgeajAJUeSjw2nfvsjeNC2nK
 MpWHHj0Ja2brGRTMNCGa+srTnvBBf7TjyqD+CG+8WP38Ii9f2Ww72QkibJAOmqsDkcug
 0uj7e0+zoKOdP6t7uYVhJCFNvM7mYGIFyqwUi5GV0xzpTU8WT7Q2IXfwrXzGjuuQAb0T
 8MDzKyjIDVpeLaC5XGDwD1NQrPeq+RcpUnitfgupN5enVgEkOZNiowEEYOGnkRqVzfPg
 og9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZjuT0G8Deh5asm7sfYMBjjSxHyD941dcHmbaN6rf58s=;
 b=jXkx36ZCs4WtIvnuPcsB49WYdEJ8y0L/mwQB1LNT9bm1cSmm5wFGcUEQwRqAXcAntn
 5xvl3wAmkgCb/SFTFficwU7JKmasbgAXS4NEeNGsRZqIzkFYE4j5sZ4S2IEGNwQNXg1F
 xvIbcTtd8gPwyMOdUzPQFQ7vqdOz4uvG6GPgLO/cdP7W2VSXPTu42naiSYLr/WJI2Jk7
 U5tpChTJ09uAY0JiMXiWVUyhDSbzGZc1x2Q0TG1C1rQLypNFubhb1oM2Tc/vdPIgdOtb
 ASO9c9f8/5JrTY3l0+K2cwuKo4Kcwp7vxY4786ai4ZwBc4UiY2b7/qFFa+qPiIKAtBqv
 rkpQ==
X-Gm-Message-State: AOAM5325ZL1dlCbTzfjId7E4SNKg7yY3eDQg4mdXng8yfBnO9VhTibT5
 g1qvZQ0U9JMkm9tGlnnPTMySjEKsOU7r1gfvtyeHrDVX2bX0gvUl
X-Google-Smtp-Source: ABdhPJwYYejAn6DdechGz0yOHYEnzIsJPixk6roStHOZHb1jzFU8Cj9/i9DfQ/AmCZ4lIUR/9bTbJuRcfbZzNPP4pyU=
X-Received: by 2002:a05:651c:22b:: with SMTP id
 z11mr21023290ljn.38.1609157045775; 
 Mon, 28 Dec 2020 04:04:05 -0800 (PST)
MIME-Version: 1.0
References: <20201213135056.24446-1-damien.lemoal@wdc.com>
 <20201213135056.24446-7-damien.lemoal@wdc.com>
In-Reply-To: <20201213135056.24446-7-damien.lemoal@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 28 Dec 2020 17:33:52 +0530
Message-ID: <CAAhSdy1Hud+6m6Pqrj9808G4+j54Y0KK66b2cX=dFBWoJ31X1Q@mail.gmail.com>
Subject: Re: [PATCH v10 06/23] riscv: Fix Canaan Kendryte K210 device tree
To: Damien Le Moal <damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201228_070407_479390_47A9AF9C 
X-CRM114-Status: GOOD (  14.97  )
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
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>, Sean Anderson <seanga2@gmail.com>,
 linux-gpio@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, Dec 13, 2020 at 7:21 PM Damien Le Moal <damien.lemoal@wdc.com> wrote:
>
> Remove the clocks property from the cpu and clint nodes as these are
> ignored. Also remove the clock-frequency property from the cpu nodes as
> riscv relies on the timebase-frequency property.
>
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  arch/riscv/boot/dts/canaan/k210.dtsi | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/canaan/k210.dtsi b/arch/riscv/boot/dts/canaan/k210.dtsi
> index d2d0ff645632..354b263195a3 100644
> --- a/arch/riscv/boot/dts/canaan/k210.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k210.dtsi
> @@ -38,8 +38,6 @@ cpu0: cpu@0 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu0_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -56,8 +54,6 @@ cpu1: cpu@1 {
>                         i-cache-block-size = <64>;
>                         d-cache-size = <0x8000>;
>                         d-cache-block-size = <64>;
> -                       clocks = <&sysctl K210_CLK_CPU>;
> -                       clock-frequency = <390000000>;
>                         cpu1_intc: interrupt-controller {
>                                 #interrupt-cells = <1>;
>                                 interrupt-controller;
> @@ -101,7 +97,6 @@ clint0: clint@2000000 {
>                         reg = <0x2000000 0xC000>;
>                         interrupts-extended =  <&cpu0_intc 3 &cpu0_intc 7
>                                                 &cpu1_intc 3 &cpu1_intc 7>;
> -                       clocks = <&sysctl K210_CLK_ACLK>;
>                 };
>
>                 plic0: interrupt-controller@c000000 {
> --
> 2.29.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Looks good to me.

Reviewed-by: Anup Patel <anup@brainfault.org>

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
