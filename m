Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7944EC05027
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 14:22:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YS6uY6ure2jAzlOOAUkPYtx3Dpyn+r7TfU7sCq7T7EI=; b=rIZ9T6ArVp2Az/
	hvExrJEMLlPgrt4kU0fnmu1UTnNnWkwUhXUDPpW5m6C6ey6DEYDNGw3RbmKYkTiX4y+rEUjO4Y1l9
	fgmHFIIBdHMdb5CFvp8mcvQzMZmVJsDdiIzYWfarhAZJCNqHQAGUd31AruvYAST7t8ZU9RIwAs28A
	W/qY6RkobdsethjPFXLZydOV6Sigpth9XS9kDrK8xB7yXXg//D3MzNb/SyCpMVa9dqgtA++K0HMUr
	ovgsF9xfqc4+W8t0seODljCxlw0gROvD72zZX/zb5GJbcvZA0THW/hXap7qcUcX6GWG84f/pd0MQA
	eDP6S1tBCd25gZKpOhCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU73z-004JBE-Oq; Mon, 20 Feb 2023 14:22:43 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pU73w-004J99-4z
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 14:22:42 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id CC7C23F4BB
	for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 14:22:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1676902955;
	bh=15KdzNFX7MaKLfDAFP/yezApxH/xR6DxYD9Z1QEyvxM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HMLpCYk0SQNNa3oT0tLRoUkGCf4eh+JeCU3VTsyBgcsP6FaT4uySMlKsY3sKH++JO
	 WDKqYaflv2XO8fCpBhnA6OJuOOLiWjPX2C1FuA/U+uGr7xAKIRpAUp8VepKgVwhlIr
	 8V0YCr2JO7k/rkINzQwWV2svA9xEs5JMhMwc3AnAiHWpz36lgrv7g79bnLbsCWWmi/
	 ij3eUALn0E4FYxdy0WEHK1/8Zv9oer4YE90chVq4I+ncOCedEZ+rACcuN/daeQF3Ym
	 zbzwxluCoHYqgL0KK0EnWj5NGrOP2U3TNs65DxleSUJLBg2EiKNZHyj9kKyZgjgBTh
	 EbuHC1TWdNkng==
Received: by mail-qk1-f198.google.com with SMTP id 8-20020a370508000000b00724fd33cb3eso17099qkf.14
        for <linux-riscv@lists.infradead.org>; Mon, 20 Feb 2023 06:22:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=15KdzNFX7MaKLfDAFP/yezApxH/xR6DxYD9Z1QEyvxM=;
        b=t4Cxz1ecJK2sGWKywI2nxq0EhysUTyYCoyuJMRSfGiIU5tmE6UYkOyIdclP7kU98IV
         wtqBheM+Q3C2s6WwCP5glwAV2L301DU8DEZ5hXLMs3yNJG8fjSfOh+LgyJXhKHFgAjLV
         QxlGn01vjhU8bGbHbQyY6Co+a/srdp2w5Lg0ZOS18eQPB3LKJqMU0IFWDcH+3Nhfef0O
         muNfsH+H2O+W5ltJEwhScA5xkalvdcQG/eqMOWwYS3dTwNhsX4sgf3M05ZeJW3CGhenl
         5v2rx1tCScn2Jag+zqVsKXc3cp00VB8kjItpP3zpVQr6aevcHJSWC/s+/BXAan4nkaK4
         0+2Q==
X-Gm-Message-State: AO0yUKXyveT+e4nIeeRIZr/e4/l4tOp53fptAMqN6vwyibnN5CZBZ0JC
	tgdV5Ya2VJIxa90S8J6RA6ZwQxUO/wG0lBSZUQnw8aS5JHrToVnupX4rWo7JCoJTGb3KZil+1VV
	qvHAklOYIEPNUSXOBp2nkW3JXGuX5jKMuvuIWVtjdolrduKhvsWEcBxuEVk4SEQ==
X-Received: by 2002:ac8:701b:0:b0:3b7:fda5:1cbc with SMTP id x27-20020ac8701b000000b003b7fda51cbcmr213077qtm.5.1676902954918;
        Mon, 20 Feb 2023 06:22:34 -0800 (PST)
X-Google-Smtp-Source: AK7set+dV6jlM0TuskfDPI955wHdR3MIsyp4aZm7ZGrdR5YGZR5IqoJRIZac7YadjSfeXQ/9C9c1FhXN+okz8gNXcw4=
X-Received: by 2002:ac8:701b:0:b0:3b7:fda5:1cbc with SMTP id
 x27-20020ac8701b000000b003b7fda51cbcmr213061qtm.5.1676902954624; Mon, 20 Feb
 2023 06:22:34 -0800 (PST)
MIME-Version: 1.0
References: <20230118061701.30047-1-yanhong.wang@starfivetech.com> <20230118061701.30047-7-yanhong.wang@starfivetech.com>
In-Reply-To: <20230118061701.30047-7-yanhong.wang@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Mon, 20 Feb 2023 15:22:18 +0100
Message-ID: <CAJM55Z9=wXxHXLHhLK1H2H2PnLv4Z+FiQPVd_+gtPss+P01MRg@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20230220_062240_560082_3835BBFC 
X-CRM114-Status: GOOD (  21.82  )
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

On Wed, 18 Jan 2023 at 07:19, Yanhong Wang
<yanhong.wang@starfivetech.com> wrote:
> Add JH7110 ethernet device node to support gmac driver for the JH7110
> RISC-V SoC.
>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 93 ++++++++++++++++++++++++
>  1 file changed, 93 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index c22e8f1d2640..c6de6e3b1a25 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -433,5 +433,98 @@
>                         reg-shift = <2>;
>                         status = "disabled";
>                 };
> +
> +               stmmac_axi_setup: stmmac-axi-config {
> +                       snps,lpi_en;
> +                       snps,wr_osr_lmt = <4>;
> +                       snps,rd_osr_lmt = <4>;
> +                       snps,blen = <256 128 64 32 0 0 0>;
> +               };
> +
> +               gmac0: ethernet@16030000 {
> +                       compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +                       reg = <0x0 0x16030000 0x0 0x10000>;
> +                       clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
> +                                <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
> +                                <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
> +                                <&aoncrg JH7110_AONCLK_GMAC0_TX>,

The gmac0_tx clock is a mux that takes either the gmac0_gtxclk or
rmii_rtx as parent. However it is then followed by an inverter that
optionally inverts the clock, gmac0_tx_inv. I'm guessing this
optionally inverted signal is what is actually used (otherwise why
would the inverter exist), so I think this clock is what should be
claimed here. Eg.
    <&aoncrg JH7110_AONCLK_GMAC0_TX_INV>,

Right now it works only because the inverted signal can't be gated
(turned off) even when it's not claimed by any driver.

> +                                <&syscrg JH7110_SYSCLK_GMAC0_GTXC>,
> +                                <&syscrg JH7110_SYSCLK_GMAC0_GTXCLK>;

Here the gmac0_gtxclk clock is the parent of the gmac0_gtxc, so
claiming the gmac0_gtxc should be enough. Since the gmac0_gtxc is just
a gate it should have the CLK_SET_RATE_PARENT flag set, so the driver
can just change the rate of the child and it should propagate to the
parent. In short I think claiming only the gmac0_gtxc clock should be
enough here.

> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                               "tx", "gtxc", "gtx";
> +                       resets = <&aoncrg JH7110_AONRST_GMAC0_AXI>,
> +                                <&aoncrg JH7110_AONRST_GMAC0_AHB>;
> +                       reset-names = "stmmaceth", "ahb";
> +                       interrupts = <7>, <6>, <5>;
> +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +                       phy-mode = "rgmii-id";
> +                       snps,multicast-filter-bins = <64>;
> +                       snps,perfect-filter-entries = <8>;
> +                       rx-fifo-depth = <2048>;
> +                       tx-fifo-depth = <2048>;
> +                       snps,fixed-burst;
> +                       snps,no-pbl-x8;
> +                       snps,force_thresh_dma_mode;
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,tso;
> +                       snps,en-tx-lpi-clockgating;
> +                       snps,txpbl = <16>;
> +                       snps,rxpbl = <16>;
> +                       status = "disabled";
> +                       phy-handle = <&phy0>;
> +
> +                       mdio0: mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "snps,dwmac-mdio";
> +
> +                               phy0: ethernet-phy@0 {
> +                                       reg = <0>;
> +                               };
> +                       };
> +               };
> +
> +               gmac1: ethernet@16040000 {
> +                       compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +                       reg = <0x0 0x16040000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_GMAC1_AXI>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_AHB>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_PTP>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_TX>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_GTXC>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_GTXCLK>;
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                       "tx", "gtxc", "gtx";
> +                       resets = <&syscrg JH7110_SYSRST_GMAC1_AXI>,
> +                                <&syscrg JH7110_SYSRST_GMAC1_AHB>;
> +                       reset-names = "stmmaceth", "ahb";
> +                       interrupts = <78>, <77>, <76>;
> +                       interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +                       phy-mode = "rgmii-id";
> +                       snps,multicast-filter-bins = <64>;
> +                       snps,perfect-filter-entries = <8>;
> +                       rx-fifo-depth = <2048>;
> +                       tx-fifo-depth = <2048>;
> +                       snps,fixed-burst;
> +                       snps,no-pbl-x8;
> +                       snps,force_thresh_dma_mode;
> +                       snps,axi-config = <&stmmac_axi_setup>;
> +                       snps,tso;
> +                       snps,en-tx-lpi-clockgating;
> +                       snps,txpbl = <16>;
> +                       snps,rxpbl = <16>;
> +                       status = "disabled";
> +                       phy-handle = <&phy1>;
> +
> +                       mdio1: mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "snps,dwmac-mdio";
> +
> +                               phy1: ethernet-phy@1 {
> +                                       reg = <1>;
> +                               };
> +                       };
> +               };
>         };
>  };
> --
> 2.17.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
