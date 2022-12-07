Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77CCFC352A1
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Dec 2022 13:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xPu/DFNd9jFCmAn6kaftCLm7dyE2rVWJwx6W+GEnydQ=; b=TEn69oxpoRiS+m
	FzGA+Oaom1RVarKA9LHkXsmvuSa5XgrfYiL0O/VmXNuBZCPHknjmqpCNYqLVgFsMX42eR6GJgLGuH
	x23Ha8/yymeH/2avZY8Vc55ZujXmrXONv06v4vbk5esglNXqkKZf2D9eTcUCwpOI4dcf1rgvPv23b
	t145/fEOCuN2EKyQH8Rv8hjJwZh2Agx+Nch1HlCeLY0ltablDxzVd0Z+NPEnuK1McIbDbAzloccnm
	FAYNYmJGJ7Tm4zXq2+09bAXVLrOzY0iNBq3q11B2LbEEqHgLuHdKVec442Gb4uVmKvj4g7OlIsD4p
	xqQC1+RtyGNdjgdXazgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uMb-003N2K-BU; Wed, 07 Dec 2022 13:21:29 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2uMY-003MsW-9s
	for linux-riscv@lists.infradead.org; Wed, 07 Dec 2022 13:21:28 +0000
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com [209.85.219.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id E824144340
	for <linux-riscv@lists.infradead.org>; Wed,  7 Dec 2022 13:21:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1670419284;
	bh=5Fy8+G52z4/CaDFZeawpURrDotSj/z5PeZad0B3CFd8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=csbmeW6huO65I/umQ1ALJDxqezkD3o0CtQO8EwaNV+PndRptasDwvi7QLWIvtQXzF
	 ulj+3Dc1JD8BVVcrS7NcJhzAmKB6xOJ+AGYigQXlQAVegTCNcLn3XCT9WKb89R6RGh
	 QZoTOT73HDBupo12pBJR8QkvbSk4lqr9xtDQ6CSPdcxUZoRoDJ0vDNrC/Qk5ZWfr1W
	 ULLoJZd5Npi0tGAayf5K+kbmKeLDwKD/JPGHb7PX8Pdl+jO+lqHI/3Fqk37np9YGZ/
	 HTOibadUCMiLf+keLRA2KpJAzu8TyiTi4CdZ2N2pz88mpEzlzTK7ZrWj6UBzmRGDpk
	 hmsNn325LDdqQ==
Received: by mail-yb1-f197.google.com with SMTP id k7-20020a256f07000000b006cbcc030bc8so19049535ybc.18
        for <linux-riscv@lists.infradead.org>; Wed, 07 Dec 2022 05:21:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5Fy8+G52z4/CaDFZeawpURrDotSj/z5PeZad0B3CFd8=;
        b=4cdU8M372TnjrzTzRpKBuwrbywBewLU9DkJV62302T0PuaOjbgRNE821JN74NPZVRP
         nLebIikm/0396Ny8doBY9QNz96fBJ4PnTpELdIEZSi92BDk2lQS2qJ736XUcdnwJFr5o
         aH7UTz4mXAcg6iu0OYwksfPmeE1TairJAOSnwbCps/BUqAQckmrg0sJckcQhtdIAZVut
         9vWrwLwrGwzpcxaHpSeY2PyA0xp/Pair7K4ZGsVEy06bpOM6HsJf8Nd7B0mi/o1LMsz/
         /7rQTWyU3dmkeMP2u9zAmI9I0gIAUedjrh4pyB4TLeSbaXK+1XysHxd5k80OQpHjXL8g
         9Z7g==
X-Gm-Message-State: ANoB5plmYkeO55yBj5CIkpeOVy2uRTT89AOWOMPS16Ds26GdRDFWm6Cv
	kbTbUH483f0qqEIwM/oX2CmCvRMhlfmyrid49FWFmKcxeZqTBFa+hvWiF67OHjPztqkIwa0rFdO
	RPHAkAt9ULMgrTLAGlcGBFQIrBMVMgXLDh6BulCPMzrtsHWZbeqf5CgCQEqyalQ==
X-Received: by 2002:a05:690c:851:b0:378:5e3a:8fad with SMTP id bz17-20020a05690c085100b003785e3a8fadmr3504070ywb.78.1670419283343;
        Wed, 07 Dec 2022 05:21:23 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4dEsAOszSDho0u8YfNbcHyL/Cu47ytTETp59tYZGKkZJLswpRhnp6pWtRXOnnDD2vLgF89Nbs4i2sLQZ086ds=
X-Received: by 2002:a05:690c:851:b0:378:5e3a:8fad with SMTP id
 bz17-20020a05690c085100b003785e3a8fadmr3504041ywb.78.1670419283074; Wed, 07
 Dec 2022 05:21:23 -0800 (PST)
MIME-Version: 1.0
References: <20221118011108.70715-1-hal.feng@starfivetech.com>
 <20221118011108.70715-4-hal.feng@starfivetech.com> <7f78e57a-d9be-b1e9-d161-40b1f66e3804@linaro.org>
 <05ade4a9-6ae2-6e3a-5223-270b24e6ea24@starfivetech.com>
In-Reply-To: <05ade4a9-6ae2-6e3a-5223-270b24e6ea24@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 7 Dec 2022 14:21:06 +0100
Message-ID: <CAJM55Z_Cr1ynK0oZ+p6EaLtc1OiZQTTbgx3N6SrM6eOt5rYrGw@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] dt-bindings: pinctrl: Add StarFive JH7110 aon pinctrl
To: Jianlong Huang <jianlong.huang@starfivetech.com>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, Conor Dooley <conor@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221207_052126_512745_4A1136A5 
X-CRM114-Status: GOOD (  27.02  )
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

On Mon, 28 Nov 2022 at 02:15, Jianlong Huang
<jianlong.huang@starfivetech.com> wrote:
>
> On Mon, 21 Nov 2022 09:44:00 +0100, Krzysztof Kozlowski wrote:
> > On 18/11/2022 02:11, Hal Feng wrote:
> >> From: Jianlong Huang <jianlong.huang@starfivetech.com>
> >>
> >> Add pinctrl bindings for StarFive JH7110 SoC aon pinctrl controller.
> >>
> >> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> >> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> >> ---
> >>  .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 134 ++++++++++++++++++
> >>  1 file changed, 134 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >>
> >> diff --git a/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >> new file mode 100644
> >> index 000000000000..1dd000e1f614
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
> >> @@ -0,0 +1,134 @@
> >> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/pinctrl/starfive,jh7110-aon-pinctrl.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: StarFive JH7110 Aon Pin Controller
> >> +
> >> +description: |
> >> +  Bindings for the JH7110 RISC-V SoC from StarFive Technology Ltd.
> >> +
> >> +  Out of the SoC's many pins only the ones named PAD_GPIO0 to PAD_GPIO4
> >> +  can be multiplexed and have configurable bias, drive strength,
> >> +  schmitt trigger etc.
> >> +  Some peripherals have their I/O go through the 4 "GPIOs". This also
> >> +  includes PWM.
> >> +
> >> +maintainers:
> >> +  - Jianlong Huang <jianlong.huang@starfivetech.com>
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: starfive,jh7110-aon-pinctrl
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  reg-names:
> >> +    items:
> >> +      - const: control

Again this doesn't seem necessary when you only have 1 memory range.

> >> +
> >> +  clocks:
> >> +    maxItems: 1
> >> +
> >> +  resets:
> >> +    maxItems: 1
> >> +
> >> +  gpio-controller: true
> >> +
> >> +  "#gpio-cells":
> >> +    const: 2
> >> +
> >> +  interrupts:
> >> +    maxItems: 1
> >> +    description: The GPIO parent interrupt.
> >
> > Same comments apply plus one more.
>
> Will fix, drop this description.
>
> >
> >> +
> >> +  interrupt-controller: true
> >> +
> >> +  "#interrupt-cells":
> >> +    const: 2
> >> +
> >> +required:
> >> +  - compatible
> >> +  - reg
> >> +  - reg-names
> >> +  - gpio-controller
> >> +  - "#gpio-cells"
> >> +  - interrupts
> >> +  - interrupt-controller
> >> +  - "#interrupt-cells"
> >
> > "required:" goes after patternProperties.
>
> Will fix.
>
> >
> >> +
> >> +patternProperties:
> >> +  '-[0-9]+$':
> >
> > Same comment.
>
> Will fix.
> Keep consistent quotes, use '
>
> >
> >> +    type: object
> >> +    patternProperties:
> >> +      '-pins$':
> >> +        type: object
> >> +        description: |
> >> +          A pinctrl node should contain at least one subnode representing the
> >> +          pinctrl groups available on the machine. Each subnode will list the
> >> +          pins it needs, and how they should be configured, with regard to
> >> +          muxer configuration, system signal configuration, pin groups for
> >> +          vin/vout module, pin voltage, mux functions for output, mux functions
> >> +          for output enable, mux functions for input.
> >> +
> >> +        properties:
> >> +          pinmux:
> >> +            description: |
> >> +              The list of GPIOs and their mux settings that properties in the
> >> +              node apply to. This should be set using the GPIOMUX macro.
> >> +            $ref: "/schemas/pinctrl/pinmux-node.yaml#/properties/pinmux"
> >> +
> >> +          bias-disable: true
> >> +
> >> +          bias-pull-up:
> >> +            type: boolean
> >> +
> >> +          bias-pull-down:
> >> +            type: boolean
> >> +
> >> +          drive-strength:
> >> +            enum: [ 2, 4, 8, 12 ]
> >> +
> >> +          input-enable: true
> >> +
> >> +          input-disable: true
> >> +
> >> +          input-schmitt-enable: true
> >> +
> >> +          input-schmitt-disable: true
> >> +
> >> +          slew-rate:
> >> +            maximum: 1
> >> +
> >> +        additionalProperties: false
> >> +
> >> +    additionalProperties: false
> >> +
> >> +additionalProperties: false
> >> +
> >> +examples:
> >> +  - |
> >> +    #include <dt-bindings/clock/starfive-jh7110.h>
> >> +    #include <dt-bindings/reset/starfive-jh7110.h>
> >> +    #include <dt-bindings/pinctrl/pinctrl-starfive-jh7110.h>
> >> +
> >> +        soc {
> >> +                #address-cells = <2>;
> >> +                #size-cells = <2>;

Again these two lines can be dropped..

> >
> > Same comment.
>
> Will fix.
> Use 4 spaces for example indentation.
>
> >
> >> +
> >> +                gpioa: gpio@17020000 {
> >> +                        compatible = "starfive,jh7110-aon-pinctrl";
> >> +                        reg = <0x0 0x17020000 0x0 0x10000>;

..if you just change this to
reg = <0x17020000 0x10000>;

> >> +                        reg-names = "control";
> >> +                        resets = <&aoncrg_rst JH7110_AONRST_AON_IOMUX>;
> >> +                        interrupts = <85>;
> >> +                        interrupt-controller;
> >> +                        #interrupt-cells = <2>;
> >> +                        #gpio-cells = <2>;
> >> +                        gpio-controller;
> >> +                };
> >> +        };
> >> +
> >> +...
> >
>
> Best regards,
> Jianlong Huang
>
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
