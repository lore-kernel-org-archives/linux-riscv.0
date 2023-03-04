Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF15C678D5
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Mar 2023 22:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qy33PCFevNnZ6eELPX16IZ5m/ItxIuGrX5ykyLnRXuU=; b=cgCkjZ1DMC0K5c
	sQaFuiV9tftw7KkqHZ6VBfTUxjIqWBMWYGyY7edvHPH7YwNkwk9c3BBig5rqpx9rTCi8E7pjgE2rC
	NVk9puJTwXqzeOfNEuX+jnqyd6Usz0H3DJnHYumPt90ExRkwnTFxuwsCT/n77rsflTXxDk+VO0Y5D
	oTSz/R4pgJnVC/DlDLT7JWtRxfAnq8CoP/Um1vFaKvAGCf/WiVelwtDJ5GUKEjSWo5z4NWGPqAGRi
	M2SSF8tJFyfA+eReQz4DU7zz3tFhORBgyCxKe+TBDl3vhdALYWJYOd8rxB6aQ2n/fRfVEm+OpUJbf
	FO7O+TDSHf0xDZ1x2CmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYap5-009dbR-8l; Sat, 04 Mar 2023 22:57:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pYaox-009dak-EW
	for linux-riscv@lists.infradead.org; Sat, 04 Mar 2023 22:57:49 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 2673C412FE
	for <linux-riscv@lists.infradead.org>; Sat,  4 Mar 2023 22:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677970657;
	bh=Vju82LMq7Hb3dulxwnm87osrgbRmnYPvBM1vXLn4dUA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=knN3wI6skCEfg3CF7eUoR9HNFZNppEtEiqFb6UwVugeio6mxUPA2R3mI+BbFsOA/M
	 UjvKm/bIhaPP//TiA/kOeGtfKbMQtlBwjMo0+RzE1E40J9MO1A0KvmpLdzDXDvSSUY
	 5YHaiH/4hjXZeAb3gUohIwr769VUAPBjvpDuHAEcsYf6JLhZMYWIX/ZELjw3DBhCwi
	 X8bLtvEOYrCSvjc7UqAVeE4bp1jSSgaTnq0Xfi6RHL/OtF+U2WJ3H5jN1B3Br4kYCB
	 igb9WnNV2c8NNXkVqHT7PE0r2jLPCZXMd/g3x9Hbarr8z592LFDB0MfpDhl4b0tPw0
	 bfKIVl7B9xzHQ==
Received: by mail-qt1-f200.google.com with SMTP id i24-20020ac84f58000000b003bfe3358691so3367514qtw.21
        for <linux-riscv@lists.infradead.org>; Sat, 04 Mar 2023 14:57:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677970655;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vju82LMq7Hb3dulxwnm87osrgbRmnYPvBM1vXLn4dUA=;
        b=H9N2oaGRBOF6LIDsZAuG9LKE7BEXVQ5JyVH+/mwpShXZ185enNL88OdIyNWoFKhXKh
         Laf44ae1lkV5KDebhML9MOsURrPeWZ3ZCToTR7ZuWnfO8B6tQh1WdpYrFA1AWq+oKJ/m
         hu3hbRxwSEjvvVKKt1PXW0uKiRIzh1YuQvCSjBrWY58Il14/2q5o/5ZNfJ9ieudXC9oL
         I0cgOa3gRHtxwsG03uwZiZ8N5h9KLfqphZnsvehzLFg/zuu0IClYn+/QJmnivQO61l2b
         VSf6l/FmLp0xLpL365MsEaxN4FmnrU/tYObiC0rMguHv/tca7M9i37vnP6KbyrajriLR
         502Q==
X-Gm-Message-State: AO0yUKUIFbCVIyCcvYvDcweBa7kMj06tzs1DNUPF70irqw+BS2WmPv0Y
	h/OPDOVjiqNTk/8QNIsOGrhTdWBe2ZQH3hM0EUFB/kTKEE8kHb24Fb8IPCK1Hbjs5rdNbIzyKAT
	IcScmJt6fxI9GlOgW/BYzk6hHp3Kw6kFklF/8YLXg08goigN2QHOUqjLUpQdbdw==
X-Received: by 2002:a05:6214:933:b0:571:1409:5ee1 with SMTP id dk19-20020a056214093300b0057114095ee1mr1789539qvb.0.1677970655702;
        Sat, 04 Mar 2023 14:57:35 -0800 (PST)
X-Google-Smtp-Source: AK7set9OCpr8hRBc/QazhmBC/md4LdexEqTNSjYLrirDk7uhU3nwpz+1l8MCPf/QOPXZH2D1Js8bjRxfqR+PGxy3+lk=
X-Received: by 2002:a05:6214:933:b0:571:1409:5ee1 with SMTP id
 dk19-20020a056214093300b0057114095ee1mr1789506qvb.0.1677970654498; Sat, 04
 Mar 2023 14:57:34 -0800 (PST)
MIME-Version: 1.0
References: <20230303085928.4535-1-samin.guo@starfivetech.com> <20230303085928.4535-6-samin.guo@starfivetech.com>
In-Reply-To: <20230303085928.4535-6-samin.guo@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Sat, 4 Mar 2023 23:57:18 +0100
Message-ID: <CAJM55Z_SV3ig56JY9BF5LeWt4M+bKYh_HdxSY02CP+9i7F0vCQ@mail.gmail.com>
Subject: Re: [PATCH v5 05/12] riscv: dts: starfive: jh7110: Add ethernet
 device nodes
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	"David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, 
	Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, 
	Yanhong Wang <yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230304_145743_880567_7EE32796 
X-CRM114-Status: GOOD (  17.61  )
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

On Fri, 3 Mar 2023 at 10:01, Samin Guo <samin.guo@starfivetech.com> wrote:
>
> Add JH7110 ethernet device node to support gmac driver for the JH7110
> RISC-V SoC.
>
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 91 ++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index 09806418ed1b..2ce28292b721 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -233,6 +233,13 @@
>                 #clock-cells = <0>;
>         };
>
> +       stmmac_axi_setup: stmmac-axi-config {
> +               snps,lpi_en;
> +               snps,wr_osr_lmt = <4>;
> +               snps,rd_osr_lmt = <4>;
> +               snps,blen = <256 128 64 32 0 0 0>;
> +       };
> +
>         tdm_ext: tdm-ext-clock {
>                 compatible = "fixed-clock";
>                 clock-output-names = "tdm_ext";
> @@ -518,5 +525,89 @@
>                         gpio-controller;
>                         #gpio-cells = <2>;
>                 };
> +
> +               gmac0: ethernet@16030000 {
> +                       compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +                       reg = <0x0 0x16030000 0x0 0x10000>;
> +                       clocks = <&aoncrg JH7110_AONCLK_GMAC0_AXI>,
> +                                <&aoncrg JH7110_AONCLK_GMAC0_AHB>,
> +                                <&syscrg JH7110_SYSCLK_GMAC0_PTP>,
> +                                <&aoncrg JH7110_AONCLK_GMAC0_TX_INV>,
> +                                <&syscrg JH7110_SYSCLK_GMAC0_GTXC>;
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                     "tx", "gtx";
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
> +                       mdio {
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
> +                                <&syscrg JH7110_SYSCLK_GMAC1_TX_INV>,
> +                                <&syscrg JH7110_SYSCLK_GMAC1_GTXC>;
> +                       clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                                     "tx", "gtx";
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
> +                       mdio {
> +                               #address-cells = <1>;
> +                               #size-cells = <0>;
> +                               compatible = "snps,dwmac-mdio";
> +
> +                               phy1: ethernet-phy@1 {
> +                                       reg = <0>;

I'm getting errors on eth1 unless this is set to <1>. In any case the
number after @ in the node name should match the reg value.

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
