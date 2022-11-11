Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 234EFC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 09:12:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHnDkNl55GJdDYg7NWvLtChj7kkv0k58tqyh4wiGxb0=; b=YkHY+Cp/9Au9aV
	1zFIZNnwIHBoR9XHaCAUc267n+RAMTHrANLjHgujrCMBoUCTcAkiyomaprrSegqyEpWDrx+weMFn+
	D872qIpx424w1TPpYJMgc2NU39hguYKKlcHFS+1hJvpJTJQjvikKTQyunNUN/T8RBLOl7j3x3GpCk
	PKrq0SyoqvbkAzvkC2qPolWf8BAKzadfyjOS8r1Ito2vkuh4/d/JAVCoDjhZ4wBoXLghGbtTo9DOc
	sy0NvV3vo5hw0F7LwatZ4CzXxIUEiIGZgQYhnwlNkHR/gHwcUyCWid6oBo93sur61h4KlruZc/Nvs
	jdxCBUKOYWcNLIo6dJJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQ59-00EWfG-VY; Fri, 11 Nov 2022 09:12:16 +0000
Received: from mail-oa1-x34.google.com ([2001:4860:4864:20::34])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otQ51-00EWcO-Vh
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 09:12:14 +0000
Received: by mail-oa1-x34.google.com with SMTP id 586e51a60fabf-13b6c1c89bdso4795526fac.13
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 01:12:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=atishpatra.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vlih8RFbnHXx7AILkzt3j13ZvQSzFx2XhVjOkNx57z0=;
        b=eYLa64h5HyHDiCEXtz/OKLFglQQG5rA6wjDjUaQzcfgVSZtwYTxhbwtGAXSb54juup
         uoZ9U7QDcW3Mz8OR6uNYqfSjR8qRJYuM7YO8cKX2ybI/D7BC2KHWHO7WorKOxXj//gC3
         aBM+WH0/F6PIgjONbYHcO26svzY5u6fAhQs6U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vlih8RFbnHXx7AILkzt3j13ZvQSzFx2XhVjOkNx57z0=;
        b=vtJYNuTCWabGf9BnNZhYsYP4b94dkNRtema02Khg22JgdBnmHWUbAci7jxdXjn9J/1
         p2vsIzci63YMf2zNv4mFN5g+r5mKtrJFw9vLFBhCuYZQG2AZheSkux4Wm14hLA502ZZq
         fAu6hEPitNhVPdC8lQNaZtir3IvImIi6LreQVf1Q0nY5cgLSKXvIus2o7McZl3vXrley
         6xhvig/mogKgtE3UjJXXgJj8L9MPjsw/AvC6juVRetLODvjzTFYaHPEzgrC12wSTr6hK
         HCevVO1qQNfDkCZ0wQpnAbKRcVjAiAFhW8F+tVos3kmMckHBxQ4jZ4hhRCfUHaqWX9I8
         MADQ==
X-Gm-Message-State: ANoB5pnDP6NO+mD6GnXd/sNUB7ms53LcQnhnRVh8KUDGI8qx3bc2d2Ps
	LeJ45Tu3f20Hm0kFKpxGbDG6S/lNhIyjb8OLpFIZ
X-Google-Smtp-Source: AA0mqf4XmEjmLR1lvCloq1g19L2SEaUgxFJgOfPVGxSOQn31XqXG1cl3IUfyCQjHdiMtCSSUcUZOC2C2owFB3+pmN9E=
X-Received: by 2002:a05:6870:518:b0:13b:be90:a68a with SMTP id
 j24-20020a056870051800b0013bbe90a68amr362618oao.181.1668157922329; Fri, 11
 Nov 2022 01:12:02 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com> <20221111044207.1478350-5-apatel@ventanamicro.com>
In-Reply-To: <20221111044207.1478350-5-apatel@ventanamicro.com>
From: Atish Patra <atishp@atishpatra.org>
Date: Fri, 11 Nov 2022 01:11:51 -0800
Message-ID: <CAOnJCU+95nLqkfrx_ACH7qt_++K-w5Mh+a-_4axjPLkeR3iyKA@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_011208_640787_B7AAE9A7 
X-CRM114-Status: GOOD (  28.12  )
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

On Thu, Nov 10, 2022 at 8:43 PM Anup Patel <apatel@ventanamicro.com> wrote:
>
> We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
> defined by the RISC-V advanced interrupt architecture (AIA) specification.
>
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
>  1 file changed, 174 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
>
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> new file mode 100644
> index 000000000000..05106eb1955e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> @@ -0,0 +1,174 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Incoming MSI Controller (IMSIC)
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description:
> +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> +
> +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> +  for each privilege level (machine or supervisor). The configuration of
> +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
> +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> +  fixed number of interrupt identities (to distinguish MSIs from devices)
> +  which is same for given privilege level across CPUs (or HARTs).
> +
> +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
> +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
> +  privilege level (machine or supervisor) encodes group index, HART index,
> +  and guest index (shown below).
> +
> +  XLEN-1           >=24                                 12    0
> +  |                  |                                  |     |
> +  -------------------------------------------------------------
> +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> +  -------------------------------------------------------------
> +
> +  The device tree of a RISC-V platform will have one IMSIC device tree node
> +  for each privilege level (machine or supervisor) which collectively describe
> +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - vendor,chip-imsics
> +      - const: riscv,imsics
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 128
> +    description:
> +      Base address of each IMSIC group.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  msi-controller: true
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 32768
> +    description:
> +      This property represents the set of CPUs (or HARTs) for which given
> +      device tree node describes the IMSIC interrupt files. Each node pointed
> +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> +      HART) as parent.
> +
> +  riscv,num-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Specifies how many interrupt identities are supported by IMSIC interrupt
> +      file.
> +
> +  riscv,num-guest-ids:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 63
> +    maximum: 2047
> +    description:
> +      Specifies how many interrupt identities are supported by IMSIC guest
> +      interrupt file. When not specified the number of interrupt identities
> +      supported by IMSIC guest file is assumed to be same as specified by
> +      the riscv,num-ids property.
> +
> +  riscv,slow-ipi:
> +    type: boolean
> +    description:
> +      The presence of this property implies that software interrupts (i.e.
> +      IPIs) using IMSIC software injected MSIs is slower compared to other
> +      software interrupt mechanisms (such as SBI IPI) on the underlying
> +      RISC-V platform.
> +
> +  riscv,guest-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Specifies number of guest index bits in the MSI target address. When
> +      not specified it is assumed to be 0.
> +
> +  riscv,hart-index-bits:
> +    minimum: 0
> +    maximum: 15
> +    description:
> +      Specifies number of HART index bits in the MSI target address. When
> +      not specified it is estimated based on the interrupts-extended property.
> +
> +  riscv,group-index-bits:
> +    minimum: 0
> +    maximum: 7
> +    description:
> +      Specifies number of group index bits in the MSI target address. When
> +      not specified it is assumed to be 0.
> +
> +  riscv,group-index-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 24
> +    maximum: 55
> +    description:
> +      Specifies the least significant bit of the group index bits in the
> +      MSI target address. When not specified it is assumed to be 24.
> +
> +additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - msi-controller
> +  - interrupts-extended
> +  - riscv,num-ids
> +
> +examples:
> +  - |
> +    // Example 1 (Machine-level IMSIC files with just one group):
> +
> +    imsic_mlevel: interrupt-controller@24000000 {
> +      compatible = "vendor,chip-imsics", "riscv,imsics";
> +      interrupts-extended = <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg = <0x28000000 0x4000>;

nit: /s/0x28000000/24000000

> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +      msi-controller;
> +      riscv,num-ids = <127>;
> +    };
> +
> +  - |
> +    // Example 2 (Supervisor-level IMSIC files with two groups):
> +
> +    imsic_slevel: interrupt-controller@28000000 {
> +      compatible = "vendor,chip-imsics", "riscv,imsics";
> +      interrupts-extended = <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>,
> +                            <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
> +            <0x29000000 0x2000>; /* Group1 IMSICs */
> +      interrupt-controller;
> +      #interrupt-cells = <0>;
> +      msi-controller;
> +      riscv,num-ids = <127>;
> +      riscv,group-index-bits = <1>;
> +      riscv,group-index-shift = <24>;
> +    };
> +...
> --
> 2.34.1
>


-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
