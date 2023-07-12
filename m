Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DEA8EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 18:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XhQFadjSfWLGawHgh40RA+WbujOw7038pE9DjLNqjBY=; b=VVP7X7DlVcqUA8
	sCMUjfdWnkLaTlNi44paQ7Dh23VKIdGEtmiP7NnXrWy+pKxec8ms+mXPOruC07Cow1J6Lkjf5a+YW
	wFRKkJbHIEUMUL8HD16OBp0FHx1oT00H35kDfv9v4WnBOEtGM2MMA5Q1wGYgmBaWoc/T/DRbyDtde
	2xnUyZjkCLJRzZ45FKIWGxh8sEIl+YNoA4222H1DmKaw6f5Sfg3qia8kYkJ6lXuqtGwA052eAfTJo
	skrm4O4l5sLnVdeBEn2czmMUUKDTRyv4/X4FIdLY+qAZkOPRsIDu629fC2pGkD9dggYBWTnTSc3k3
	Ka++vnkfiMXlRyJ9VMqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeJq-000rdg-0H;
	Wed, 12 Jul 2023 18:12:06 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJeJo-000rd6-04
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 18:12:05 +0000
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 571B63F189
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 18:12:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689185520;
	bh=IiTbBlj0ewF8G4BUt91YuXI1v1SQzafoivmnBlClh7o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=TYvSAOUO0+9BvIh1z++Yvxwg1/EiJ2/MsySwB82fZTrYsKc+9loodKQEQX9eT06Cf
	 lVGPK6a25QBqXO0q8dbd0V1EPgJLotch43koN0d8k8+WAKEmb+YVpHhO5/NAH5Vko7
	 l5M/EZKgR+PlbGNAD0eL855iuMSG08FM01/ocRqnFqU0TBz7CtIlo3zZg3LQPGJWY/
	 t4l+qVcIRUZz1iuWFV9deqQjqka+j0EL8om0plV74j4a7Lz0q8kEX7vkESV3rM16Ks
	 qL+wvr365wwp+IWhuWSZn/EU3s/YHiKUS/rgeWQBsf6uAWG3O3hwy9qyKTrxec6W6F
	 XnYEzjUKRU8cg==
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-403ae7d56baso42844211cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 11:12:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689185519; x=1691777519;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiTbBlj0ewF8G4BUt91YuXI1v1SQzafoivmnBlClh7o=;
        b=Eu6rinVF+9OiBYjmJHfAyURqRzbQtiJe7uSFia/xxIW/mtmuEAU15zo16Ugt+gUB3F
         igshWUwwH2PTEwOXQKPEM8B2iem6ylLNs8Km0cTPq+9jK4EYPH9sDD0hprRYVsekwXiD
         /MypOQuqla1acshAAtwTfy4CQJQ2ZweXUgoWOdpUfC10xRV+fWq+Mz2p+iEThqKAkJAp
         g0fJ63aBJT7D7FZv+Cxi52IjWi9PfEbvbYUxyuJFHE/edABYW1cg0nUus/jbtK5/Vebu
         wICnL8w5TOUU+tARNyaK8iP2rsGauY68EtoEYnTj6lmk4Cl5lNVOxnI/jaPmZmyFBUR+
         /xoQ==
X-Gm-Message-State: ABy/qLaaF0+7DYpjhQKOodmLanQLU0ZrSKS0MfTBk/PSawKUKAYyItz9
	IP0zjwl+Oysq0p4Y5RFjXq2ZW17Ubh1Ymy3tqhAcY6WQc7TOOXd1GViJy8cGtJwRB4bpgdlu0E7
	YsgpdEshDFpzXa2Ejq34KaAQ+iMkSjQVoN93ybW4ZQ/Va9kU8ZueGf6RBh1teCQ==
X-Received: by 2002:a05:622a:607:b0:400:9896:b0fa with SMTP id z7-20020a05622a060700b004009896b0famr23054537qta.64.1689185519443;
        Wed, 12 Jul 2023 11:11:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF+yH6SEzFMjdi9+xn1WCS08DTxJsK51NR6l1TztLgLNuwI2JQDigR3T+OItHZ2i/n2iFxsrYmTXZ+OTvDP/m4=
X-Received: by 2002:a05:622a:607:b0:400:9896:b0fa with SMTP id
 z7-20020a05622a060700b004009896b0famr23054520qta.64.1689185519221; Wed, 12
 Jul 2023 11:11:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-10-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-10-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 20:11:42 +0200
Message-ID: <CAJM55Z_1btuZ3ewLTMgxya8bwZ-HZRVRTHEwscmhv6DcAJFKfg@mail.gmail.com>
Subject: Re: [PATCH v7 9/9] riscv: dts: starfive: jh7110: Add
 STGCRG/ISPCRG/VOUTCRG nodes
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_111204_204690_6F70FD60 
X-CRM114-Status: GOOD (  17.45  )
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

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add STGCRG/ISPCRG/VOUTCRG new node to support JH7110
> System-Top-Group, Image-Signal-Process and Video-Output
> clock and reset drivers for the JH7110 RISC-V SoC.
>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110.dtsi | 55 ++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e9c1e4ad71a2..0005fa163a78 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -6,6 +6,7 @@
>
>  /dts-v1/;
>  #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +#include <dt-bindings/power/starfive,jh7110-pmu.h>
>  #include <dt-bindings/reset/starfive,jh7110-crg.h>
>
>  / {
> @@ -398,6 +399,25 @@ i2c2: i2c@10050000 {
>                         status = "disabled";
>                 };
>
> +               stgcrg: clock-controller@10230000 {
> +                       compatible = "starfive,jh7110-stgcrg";
> +                       reg = <0x0 0x10230000 0x0 0x10000>;
> +                       clocks = <&osc>,
> +                                <&syscrg JH7110_SYSCLK_HIFI4_CORE>,
> +                                <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
> +                                <&syscrg JH7110_SYSCLK_USB_125M>,
> +                                <&syscrg JH7110_SYSCLK_CPU_BUS>,
> +                                <&syscrg JH7110_SYSCLK_HIFI4_AXI>,
> +                                <&syscrg JH7110_SYSCLK_NOCSTG_BUS>,
> +                                <&syscrg JH7110_SYSCLK_APB_BUS>;
> +                       clock-names = "osc", "hifi4_core",
> +                                     "stg_axiahb", "usb_125m",
> +                                     "cpu_bus", "hifi4_axi",
> +                                     "nocstg_bus", "apb_bus";
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +               };
> +
>                 uart3: serial@12000000 {
>                         compatible = "snps,dw-apb-uart";
>                         reg = <0x0 0x12000000 0x0 0x10000>;
> @@ -558,5 +578,40 @@ pwrc: power-controller@17030000 {
>                         interrupts = <111>;
>                         #power-domain-cells = <1>;
>                 };
> +
> +               ispcrg: clock-controller@19810000 {
> +                       compatible = "starfive,jh7110-ispcrg";
> +                       reg = <0x0 0x19810000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> +                                <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>,
> +                                <&syscrg JH7110_SYSCLK_NOC_BUS_ISP_AXI>,
> +                                <&dvp_clk>;
> +                       clock-names = "isp_top_core", "isp_top_axi",
> +                                     "noc_bus_isp_axi", "dvp_clk";
> +                       resets = <&syscrg JH7110_SYSRST_ISP_TOP>,
> +                                <&syscrg JH7110_SYSRST_ISP_TOP_AXI>,
> +                                <&syscrg JH7110_SYSRST_NOC_BUS_ISP_AXI>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       power-domains = <&pwrc JH7110_PD_ISP>;
> +               };
> +
> +               voutcrg: clock-controller@295c0000 {
> +                       compatible = "starfive,jh7110-voutcrg";
> +                       reg = <0x0 0x295c0000 0x0 0x10000>;
> +                       clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
> +                                <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
> +                                <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
> +                                <&hdmitx0_pixelclk>;
> +                       clock-names = "vout_src", "vout_top_ahb",
> +                                     "vout_top_axi", "vout_top_hdmitx0_mclk",
> +                                     "i2stx0_bclk", "hdmitx0_pixelclk";
> +                       resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
> +                       #clock-cells = <1>;
> +                       #reset-cells = <1>;
> +                       power-domains = <&pwrc JH7110_PD_VOUT>;
> +               };
>         };
>  };
> --
> 2.25.1
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
