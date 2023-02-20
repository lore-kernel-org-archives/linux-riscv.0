Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 065E3C636CC
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 15:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ecOnYbRE/2yB7ywuhStYWPrZMCxLaqNhDZSgac2vHss=; b=NjkaTNVHHZ8Rb5
	HVWRZ+BMVULfceYXcYk24BDsZ+wBhBMGn+5N96iHJX+EWOPWUgbUbjYxnVnkvwwVss8SEVQwdl+Ju
	8RpnvUMm2bnW4LkxFId3O+TXEwhgfhkGdShg8O4DlgFglluIW9pN6EDjD3eMD41XuNva254cxs2cN
	gUhlg4tM7jBme7Y2qPWQYgouq6Tyt8ba3WaAgTZSpBG7Q/fsb1txaPdK6FQKnd1lx3wx4gRVB1uGx
	J2p5K3W3lAFaYhxqC0DTVoeC6AqhaBsIuxrt4cZUL+AGI3qMYWeYFqBRl0MUJ31di/gcqcUIli1+l
	b4edwxyNG+kegUUQ4/Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fQ-004NDf-8Y; Mon, 20 Feb 2023 15:01:24 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU7fM-004NBy-RI
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 15:01:23 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 54D1C3F582
	for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 15:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676905274;
	bh=FT9bNaBG4upzki3OCtwoWOzdZmQXAWEHWUJEPV0NZh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=PICAWkZSgZqAUQrzCzwD9jxs5vOGYUH9n5fBtJwM27a78x68smh1Tn6EWRBgsVOUj
	 OzJ0bF45x9i1V8whEMoDZfbS3jFtlZTwVWsytmOFmkVym7a9/nhl5Em4sA5awVXthU
	 zjNJs6W1HYS67qpRFgVOBo9OgaJ1YtUnMgO47oIPvhdlcyG78zmCSRfzndavgZE193
	 5eYR/wUNQMbzmtyu4udpfVokiY8V+i0aPbd22zGYq5ewXPhGe/qBTnLhDmYbiW+Pu6
	 Zpddxhng0Bnj7/Y83H8sqo3qS4HCiYUp+VG6hP/gdmBs7/G6qjhK7hTdGL6zLlqF5b
	 jr7+9LwN358CA==
Received: by mail-qt1-f198.google.com with SMTP id n22-20020ac86756000000b003be57054a3bso851796qtp.1
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 07:01:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FT9bNaBG4upzki3OCtwoWOzdZmQXAWEHWUJEPV0NZh4=;
        b=CVh0KWr5L8iFrkHI8CFRwPlb+DXPvD+RUJKS5SL3AK+NgVKZALFXbd5QwIGfyI9F53
         5Kt4a/NuvOLaVQ60wrxOgQ28MqoaPWaGd72jgqxO6GaP3TIGJvJDepcHzP6UTqM/KOlb
         lExSzA9xPIluo76lnL54DkHh9imgxSVEaWapk95lUYR4QZidQH0o684HzWdw7M2LesmB
         HZ6FUncYuONukUWQFXo4rn7Su3P3JKlzixdQpPEhbvYKcuHDtRLr4Ea7KeHuZ6XETNsa
         +akqQGQpeRs4oOMMB3noMqYeP9wVjW9IObtDQd7b2kN17Z2+ZTSdFWyyzn8cP12IIwnv
         TqjQ==
X-Gm-Message-State: AO0yUKWiuwqCJuC5MvMUUVEPeD76WojUGuudkBBnoOkKyE51iDxvhDqZ
	3Dd9AaLpie7MWCOc6R+aaYNC75uLL288VLlr9uUpf3cli5IbZ5/u61wfNQC4b8/bp0JMLSxZja6
	x8oCu7zfkj1d59M3izoP9KwQj9KkfgJRWufMMwTqM5x6QGY88f+8o9lddXZ/UFA==
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id y16-20020a0cd990000000b00570fc874f2cmr314945qvj.83.1676905273199;
        Mon, 20 Feb 2023 07:01:13 -0800 (PST)
X-Google-Smtp-Source: AK7set/ki7cw9SdzzVoTwUxjlP1pm1QijDiLAHbAwflTeRbXjJrLDJeGCNKMi/5l97KZWeWCaRZi6y7UTcBie4q0g1E=
X-Received: by 2002:a0c:d990:0:b0:570:fc87:4f2c with SMTP id
 y16-20020a0cd990000000b00570fc874f2cmr314932qvj.83.1676905272886; Mon, 20 Feb
 2023 07:01:12 -0800 (PST)
MIME-Version: 1.0
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com>
 <20230118061701.30047-7-yanhong.wang@starfivetech.com> <CAJM55Z9=wXxHXLHhLK1H2H2PnLv4Z+FiQPVd_+gtPss+P01MRg@mail.gmail.com>
In-Reply-To: <CAJM55Z9=wXxHXLHhLK1H2H2PnLv4Z+FiQPVd_+gtPss+P01MRg@mail.gmail.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 20 Feb 2023 16:00:57 +0100
Message-ID: <CAJM55Z91Z277FB8O_P9VSEqjcPykvhrPOcvx6k05X5veNOo3Lw@mail.gmail.com>
Subject: Re: [PATCH v4 6/7] riscv: dts: starfive: jh7110: Add ethernet device node
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230220_070121_283018_E18173E9 
X-CRM114-Status: GOOD (  26.14  )
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

On Mon, 20 Feb 2023 at 15:22, Emil Renner Berthing
<emil.renner.berthing@canonical.com> wrote:
> On Wed, 18 Jan 2023 at 07:19, Yanhong Wang
> <yanhong.wang@starfivetech.com> wrote:
> > Add JH7110 ethernet device node to support gmac driver for the JH7110
> > RISC-V SoC.
> >
> > Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> > ---
> >  arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
> >  1 file changed, 93 insertions(+)
> >
> > diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > index c22e8f1d2640..c6de6e3b1a25 100644
> > --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> > @@ -433,5 +433,98 @@
> >                         reg-shift = <2>;
> >                         status = "disabled";
> >                 };
> > +
> > +               stmmac_axi_setup: stmmac-axi-config {
> > +                       snps,lpi_en;
> > +                       snps,wr_osr_lmt = <4>;
> > +                       snps,rd_osr_lmt = <4>;
> > +                       snps,blen = <256 128 64 32 0 0 0>;
> > +               };
> > +
> > +               gmac0: ethernet@16030000 {
> > +                       compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> > +                       reg = <0x0 0x16030000 0x0 0x10000>;
> > +                       clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
> > +                                <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
> > +                                <&aoncrg JH7110_AONCLK_GMAC0_TX>,
>
> The gmac0_tx clock is a mux that takes either the gmac0_gtxclk or
> rmii_rtx as parent. However it is then followed by an inverter that
> optionally inverts the clock, gmac0_tx_inv. I'm guessing this
> optionally inverted signal is what is actually used (otherwise why
> would the inverter exist), so I think this clock is what should be
> claimed here. Eg.
>     <&aoncrg JH7110_AONCLK_GMAC0_TX_INV>,
>
> Right now it works only because the inverted signal can't be gated
> (turned off) even when it's not claimed by any driver.
>
> > +                                <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;
>
> Here the gmac0_gtxclk clock is the parent of the gmac0_gtxc, so
> claiming the gmac0_gtxc should be enough. Since the gmac0_gtxc is just
> a gate it should have the CLK_SET_RATE_PARENT flag set, so the driver
> can just change the rate of the child and it should propagate to the
> parent. In short I think claiming only the gmac0_gtxc clock should be
> enough here.

Oh and just for completeness. This also goes for gmac1 below, and
don't forget to update the yaml binding doc accordingly.

> > +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> > +                                               "tx", "gtxc", "gtx";
> > +                       resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
> > +                                <&aoncrg JH7110_AONRST_GMAC0_AHB>;
> > +                       reset-names = "stmmaceth", "ahb";
> > +                       interrupts = <7>, <6>, <5>;
> > +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> > +                       phy-mode = "rgmii-id";
> > +                       snps,multicast-filter-bins = <64>;
> > +                       snps,perfect-filter-entries = <8>;
> > +                       rx-fifo-depth = <2048>;
> > +                       tx-fifo-depth = <2048>;
> > +                       snps,fixed-burst;
> > +                       snps,no-pbl-x8;
> > +                       snps,force_thresh_dma_mode;
> > +                       snps,axi-config = <&stmmac_axi_setup>;
> > +                       snps,tso;
> > +                       snps,en-tx-lpi-clockgating;
> > +                       snps,txpbl = <16>;
> > +                       snps,rxpbl = <16>;
> > +                       status = "disabled";
> > +                       phy-handle = <&phy0>;
> > +
> > +                       mdio0: mdio {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                               compatible = "snps,dwmac-mdio";
> > +
> > +                               phy0: ethernet-phy@0 {
> > +                                       reg = <0>;
> > +                               };
> > +                       };
> > +               };
> > +
> > +               gmac1: ethernet@16040000 {
> > +                       compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> > +                       reg = <0x0 0x16040000 0x0 0x10000>;
> > +                       clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC1_TX>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
> > +                                <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
> > +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> > +                                       "tx", "gtxc", "gtx";
> > +                       resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
> > +                                <&syscrg JH7110_SYSRST_GMAC1_AHB>;
> > +                       reset-names = "stmmaceth", "ahb";
> > +                       interrupts = <78>, <77>, <76>;
> > +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> > +                       phy-mode = "rgmii-id";
> > +                       snps,multicast-filter-bins = <64>;
> > +                       snps,perfect-filter-entries = <8>;
> > +                       rx-fifo-depth = <2048>;
> > +                       tx-fifo-depth = <2048>;
> > +                       snps,fixed-burst;
> > +                       snps,no-pbl-x8;
> > +                       snps,force_thresh_dma_mode;
> > +                       snps,axi-config = <&stmmac_axi_setup>;
> > +                       snps,tso;
> > +                       snps,en-tx-lpi-clockgating;
> > +                       snps,txpbl = <16>;
> > +                       snps,rxpbl = <16>;
> > +                       status = "disabled";
> > +                       phy-handle = <&phy1>;
> > +
> > +                       mdio1: mdio {
> > +                               #address-cells = <1>;
> > +                               #size-cells = <0>;
> > +                               compatible = "snps,dwmac-mdio";
> > +
> > +                               phy1: ethernet-phy@1 {
> > +                                       reg = <1>;
> > +                               };
> > +                       };
> > +               };
> >         };
> >  };
> > --
> > 2.17.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
