Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A18A8C433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Oct 2022 08:02:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQeto3tvtIPi03oVSOzSCnLZW4X60jXgz4JypZaUlPE=; b=lnloOD+YUi8aLR
	E3iZ3MzooHxbiAKfYBA2xkdvJS2BiAI8Kf0j54twclMd4WO8YfmalZgJ4uonMN3neRp6VszFb5rFl
	FsZgyMEzk9D8eSpPG2L9U/Vd/APD1mwAWZ47t5rN54yThk7FhPoWWc/Kri+71++NabGY9K+5TAMey
	vCuS3ofOeckS46bLp7Zw2xSXJtdLYWxB0RcZy14FwzeHJqqUFBT/hOtH0VSaQQb22Nhk57OIU4NCW
	5bJl+GA9xbE4eDsNNpakNYpGrRmws1FWe8n5wR59amoTcPcWsg49f4Cu6/zFrDSOodRT8+q5nfyde
	a99eHYYf2hqC/zKV9zaA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiWgx-007Goz-Pl; Wed, 12 Oct 2022 08:02:15 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oiWgp-007GgA-U5
	for linux-riscv@lists.infradead.org; Wed, 12 Oct 2022 08:02:10 +0000
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 41BD73F486
	for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 08:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1665561710;
	bh=pPu9MmXkeNI2LOd8j8J0zuYhlY1BtgVw8LblJb0SHAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=F1mbsIVAKIMQU6KGVDzXmSyy+3BAXNl2VXmZ38UhmBNDt+NbYirACDPfS1PMWXSYh
	 A3MwxtMT9v32nWCx6wwzC+YaBDsdU/x4imJ0qw4/CHCVljQ92jOsM+GENZkwEx7vHu
	 V/ihaM1jw7wsQ/3jD8zsp0I8JLGVMl431QSHsB3OsOmNGF9E8pbKj2kpSNW4xvb7k6
	 pustVKmzvO8kEKSy+oROIXetlY93S975XA1Es9oHxupQDI/Yrkdh7gA//i9DG/6YsW
	 LVQ+hSPPDFUMsVZytiVCWCmjV1S5/KZZhtQnxIokVhx8HgnYlCFV7KQ8NWD4gIci+6
	 cmPrERBpiCmzA==
Received: by mail-qk1-f198.google.com with SMTP id bk21-20020a05620a1a1500b006be9f844c59so13525902qkb.9
        for <linux-riscv@lists.infradead.org>; Wed, 12 Oct 2022 01:01:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPu9MmXkeNI2LOd8j8J0zuYhlY1BtgVw8LblJb0SHAk=;
        b=Ovo/z0+Hd3G8yLm1tbe5FuGhlKgLjX3Z/S4VGE72jX889PJaYM9gfijd2KLDTRllBh
         gnG5VLoY5Jry4kyRLLqAFnH7C2Xtgj4nCYw+vRuvyoLSFsn9f0XxozB1eiN2KqerY7W3
         qMBUr7Yp+meRqZBP5QSZN617y3tpnpTymUI/DtbzZpEHY/rP9XS+tC+8JELtPMgXMI84
         Lki9i41UUQAm1bvbrcD64xlFojhCST5YwEY8ecioiL/OuWmiLe+3Pu9sPLcCNg1D3ye4
         MJP6pi6tZzbGuH3pQfTifIgVClSALUn6JIg1hmzbOFq7YIxYKfu1UANweHjJ0OdsNlqe
         n+Mw==
X-Gm-Message-State: ACrzQf3pyImP9T78I8N2Q0z76UXKFgZuUfQ88BbFEIeuIzyKfDcwCSI+
	MytLTZJsB+SvGLm1//QH1Tcs5hRELi12VT+ROh/InxaxEJbmggZwPVywym5/n+4h+73kdWLS+xN
	wfUhNZQONMm4bafITBWzrpBZakxJ2fonXsxHwA029mdq/kd6qPE8jLArFKkverA==
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id gc1-20020a056214230100b004989f6f028dmr22305182qvb.5.1665561708942;
        Wed, 12 Oct 2022 01:01:48 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4BjVdcXzAwhXOcUXbaOEBSXPtiNTrEjbg/sZEuK9myUumUG1dG5KFTbU9zJywZ/QJNO+Cw30ztSSVCjbByWhU=
X-Received: by 2002:a05:6214:2301:b0:498:9f6f:28d with SMTP id
 gc1-20020a056214230100b004989f6f028dmr22305160qvb.5.1665561708558; Wed, 12
 Oct 2022 01:01:48 -0700 (PDT)
MIME-Version: 1.0
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com> <20220929184349.GA2551443-robh@kernel.org>
 <8BEAFAD2C4CE6E4A+0a00376c-1e3e-f597-bcf6-106ff294859a@linux.starfivetech.com>
In-Reply-To: <8BEAFAD2C4CE6E4A+0a00376c-1e3e-f597-bcf6-106ff294859a@linux.starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Oct 2022 10:01:32 +0200
Message-ID: <CAJM55Z9HwxTmgnPGvFpM_CtaghP0d_kc55bZcrFs3Q0fAEXPng@mail.gmail.com>
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset bindings
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: Rob Herring <robh@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221012_010208_213269_47A0107D 
X-CRM114-Status: GOOD (  40.14  )
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

On Tue, 11 Oct 2022 at 18:21, Hal Feng <hal.feng@linux.starfivetech.com> wrote:
>
> On Thu, 29 Sep 2022 13:43:49 -0500, Rob Herring wrote:
> > On Fri, Sep 30, 2022 at 01:51:47AM +0800, Hal Feng wrote:
> > > Add bindings for the reset controller on the JH7110 RISC-V
> > > SoC by StarFive Technology Ltd.
> > >
> > > Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> > > ---
> > >  .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
> > >  1 file changed, 54 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> > >
> > > diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> > > new file mode 100644
> > > index 000000000000..bb0010c200f9
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> > > @@ -0,0 +1,54 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/reset/starfive,jh7110-reset.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: StarFive JH7110 SoC Reset Controller Device Tree Bindings
> > > +
> > > +maintainers:
> > > +  - Emil Renner Berthing <kernel@esmil.dk>
> > > +  - Hal Feng <hal.feng@linux.starfivetech.com>
> > > +
> > > +properties:
> > > +  compatible:
> > > +    enum:
> > > +      - starfive,jh7110-reset
> >
> > 'reg' needed? Is this a sub-block of something else?
>
> Yes, the reset node is a child node of the syscon node, see patch 27 for detail.
> You might not see the complete patches at that time due to technical issue of
> our smtp email server. Again, I feel so sorry about that.
>
>         syscrg: syscrg@13020000 {
>                 compatible = "syscon", "simple-mfd";
>                 reg = <0x0 0x13020000 0x0 0x10000>;
>
>                 syscrg_clk: clock-controller@13020000 {
>                         compatible = "starfive,jh7110-clkgen-sys";
>                         clocks = <&osc>, <&gmac1_rmii_refin>,
>                                  <&gmac1_rgmii_rxin>,
>                                  <&i2stx_bclk_ext>, <&i2stx_lrck_ext>,
>                                  <&i2srx_bclk_ext>, <&i2srx_lrck_ext>,
>                                  <&tdm_ext>, <&mclk_ext>;
>                         clock-names = "osc", "gmac1_rmii_refin",
>                                 "gmac1_rgmii_rxin",
>                                 "i2stx_bclk_ext", "i2stx_lrck_ext",
>                                 "i2srx_bclk_ext", "i2srx_lrck_ext",
>                                 "tdm_ext", "mclk_ext";
>                         #clock-cells = <1>;
>                 };
>
>                 syscrg_rst: reset-controller@13020000 {
>                         compatible = "starfive,jh7110-reset";
>                         #reset-cells = <1>;
>                         starfive,assert-offset = <0x2F8>;
>                         starfive,status-offset= <0x308>;
>                         starfive,nr-resets = <JH7110_SYSRST_END>;
>                 };
>         };
>
> In this case, we get the memory mapped space through the parent node with syscon
> APIs. You can see patch 13 for detail.
>
> static int reset_starfive_register(struct platform_device *pdev, const u32 *asserted)
> {
>         struct starfive_reset *data;
>         int ret;
>
>         data = devm_kzalloc(&pdev->dev, sizeof(*data), GFP_KERNEL);
>         if (!data)
>                 return -ENOMEM;
>
>         data->regmap = device_node_to_regmap(pdev->dev.of_node);                  //for JH7100
>         if (IS_ERR(data->regmap)) {
>                 data->regmap = syscon_node_to_regmap(pdev->dev.of_node->parent);  //for JH7110
>                 if (IS_ERR(data->regmap)) {
>                         dev_err(&pdev->dev, "failed to get regmap (error %ld)\n",
>                                 PTR_ERR(data->regmap));
>                         return PTR_ERR(data->regmap);
>                 }
>         }
>         ...
> }
>
> We use this method to avoid errors when remapping the same address in two
> different drivers, because clock and reset of StarFive JH7110 share a common
> register address region. For similar implementation, refer to file [1] and [2].
>
> [1] arch/riscv/boot/dts/canaan/k210.dtsi
>
>         sysctl: syscon@50440000 {
>                 compatible = "canaan,k210-sysctl",
>                              "syscon", "simple-mfd";
>                 reg = <0x50440000 0x100>;
>                 clocks = <&sysclk K210_CLK_APB1>;
>                 clock-names = "pclk";
>
>                 sysclk: clock-controller {
>                         #clock-cells = <1>;
>                         compatible = "canaan,k210-clk";
>                         clocks = <&in0>;
>                 };
>
>                 sysrst: reset-controller {
>                         compatible = "canaan,k210-rst";
>                         #reset-cells = <1>;
>                 };
>
>                 reboot: syscon-reboot {
>                         compatible = "syscon-reboot";
>                         regmap = <&sysctl>;
>                         offset = <48>;
>                         mask = <1>;
>                         value = <1>;
>                 };
>         };
>
> [2] drivers/reset/reset-k210.c

Here the syscon makes a little more sense since the same memory area
does at least 3 different things, but on the JH7110 it is a dedicated
"clock and reset generator", CRG. So this is much better modelled with
a single driver taking care of both the clock and resets like the
original driver did. If you do

git grep reset_controller_register drivers/clk

..you can see that there are lots of other drivers for such
peripherals that combine clock and reset.

> >
> > > +
> > > +  "#reset-cells":
> > > +    const: 1
> > > +
> > > +  starfive,assert-offset:
> > > +    description: Offset of the first ASSERT register
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +
> > > +  starfive,status-offset:
> > > +    description: Offset of the first STATUS register
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > These can't be implied from the compatible string?
>
> These two properties are the key differences among different reset controllers.
> There are five memory regions for clock and reset in StarFive JH7110 SoC. They
> are "syscrg", "aoncrg", "stgcrg", "ispcrg" and "voutcrg". Each memory region
> has different reset ASSERT/STATUS register offset and different number of reset
> signals. After storing them in dt, the reset driver can register all reset
> controllers with the same compatible string. All we expect is that all reset
> controllers in a single SoC use the same compatible string for matching and the
> reset driver can be applied to all StarFive SoCs using different compatible strings.
> Just like
>
> arch/riscv/boot/dts/starfive/jh7100.dtsi:
>
>         rstgen: reset-controller@11840000 {
>                 compatible = "starfive,jh7100-reset";
>                 reg = <0x0 0x11840000 0x0 0x10000>;
>                 #reset-cells = <1>;
>                 starfive,assert-offset = <0x0>;
>                 starfive,status-offset= <0x10>;
>                 starfive,nr-resets = <JH7100_RSTN_END>;
>         };
>
> arch/riscv/boot/dts/starfive/jh7110.dtsi:
>
>         syscrg: syscrg@13020000 {
>                 compatible = "syscon", "simple-mfd";
>                 reg = <0x0 0x13020000 0x0 0x10000>;
>
>                 syscrg_clk: clock-controller@13020000 {
>                         compatible = "starfive,jh7110-clkgen-sys";
>                         ...
>                 };
>
>                 syscrg_rst: reset-controller@13020000 {
>                         compatible = "starfive,jh7110-reset";
>                         #reset-cells = <1>;
>                         starfive,assert-offset = <0x2F8>;
>                         starfive,status-offset= <0x308>;
>                         starfive,nr-resets = <JH7110_SYSRST_END>;
>                 };
>         };
>
>         aoncrg: aoncrg@17000000 {
>                 compatible = "syscon", "simple-mfd";
>                 reg = <0x0 0x17000000 0x0 0x10000>;
>
>                 aoncrg_clk: clock-controller@17000000 {
>                         compatible = "starfive,jh7110-clkgen-aon";
>                         ...
>                 };
>
>                 aoncrg_rst: reset-controller@17000000 {
>                         compatible = "starfive,jh7110-reset";
>                         #reset-cells = <1>;
>                         starfive,assert-offset = <0x38>;
>                         starfive,status-offset= <0x3C>;
>                         starfive,nr-resets = <JH7110_AONRST_END>;
>                 };
>         };
>
>         stgcrg: stgcrg@10230000 {       //Not submmited yet
>                 compatible = "syscon", "simple-mfd";
>                 reg = <0x0 0x10230000 0x0 0x10000>;
>
>                 stgcrg_clk: clock-controller@10230000 {
>                         compatible = "starfive,jh7110-clkgen-stg";
>                         ...
>                 };
>
>                 stgcrg_rst: reset-controller@10230000 {
>                         compatible = "starfive,jh7110-reset";
>                         #reset-cells = <1>;
>                         starfive,assert-offset = <0x74>;
>                         starfive,status-offset= <0x78>;
>                         starfive,nr-resets = <JH7110_STGRST_END>;
>                 };
>         };
>         ...
>
> >
> > > +
> > > +  starfive,nr-resets:
> > > +    description: Number of reset signals
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> >
> > Why do you need this? Most bindings don't. If just to validate 'resets'
> > args, then don't.
>
> Can be removed. Instead, the reset driver should includes some related
> binding headers or defines some macros for pointing out the number of
> reset signals of each reset controller.
>
> Best regards,
> Hal
>
> >
> >
> > > +
> > > +required:
> > > +  - compatible
> > > +  - "#reset-cells"
> > > +  - starfive,assert-offset
> > > +  - starfive,status-offset
> > > +  - starfive,nr-resets
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/reset/starfive-jh7110.h>
> > > +
> > > +    syscrg_rst: reset-controller@13020000 {
> > > +        compatible = "starfive,jh7110-reset";
> > > +        #reset-cells = <1>;
> > > +        starfive,assert-offset = <0x2F8>;
> > > +        starfive,status-offset= <0x308>;
> > > +        starfive,nr-resets = <JH7110_SYSRST_END>;
> > > +    };
> > > +
> > > +...
> > > --
> > > 2.17.1
> > >
> > >
> >
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
