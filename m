Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01FD5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:49:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VhnLhJOtbyJgMjtsgpSHRS7Int0ade9eLj9Ng06/k8I=; b=LZhTsTDTx8emBr
	NBLQJWrm6fi9fTJmg3aoQaauvoZZF8t2wF8hNhka1TUezrNxEt9H2Ow3hbcCm1oOHl37sJXRk99d7
	Yh0afI9o/gpMbyIYR1XE+QNm4OLpd7lstnbiZtlsYaRQEcoBYgpbaVP3IgmHGGxBvsYm3lfBDBkmu
	KSxMmdZr8BFUvfWYUtN9YVJCjuPV090zd1Epcuv7GRrjt5Cem+O8kp1uJgZ2/TKFRyOz5o+qVEmQM
	1ZqZl/Shm7NuaV7IoJy301B9I1mB4k7M0LVLKYpYlHxmeAqZ8e3xEFrKqWdOb1bjPTqZ7ejR1v0qK
	+8opCSlcDGN7r4QNg7iQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouW5t-00HJ9j-DU; Mon, 14 Nov 2022 09:49:33 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouW5p-00HJ6k-Qu
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:49:31 +0000
Received: by mail-lj1-x22d.google.com with SMTP id u2so12414274ljl.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ImTXzzSRjgHWFzodYSl0ZMauOmNHYIoqH7O3oNlMHPk=;
        b=NroDRhTgo9wX5eizp2mXtqzT+gIHYAyCHL/etgKCWWm7igL97ZDymZ9wfSlUb43o2P
         yPQldjUy1un1+xybodXFw0wnxgistkdTprOj2oa79UsQ5l8UyArcnhk9Uo1vPPivgMTT
         YN/upmWp1iIq0C+Tj2124iY3zIb9zs4maob0gcKLDoFdCdMjTEPzaaW7ml1XIHCbzJWf
         WlWU5RoVKYpeCD68mcGQNB508m3J6rJtTXO7GER6QcsufmpBH4NoI5CcDuYdZDBgUC93
         QrZ575im0XSTb4hi9rgujHhhoCOlAHwaBjfoqnZSOCMc7a4eSVHea8oHog2loLfvvhrO
         BSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ImTXzzSRjgHWFzodYSl0ZMauOmNHYIoqH7O3oNlMHPk=;
        b=bxyp5dXn4cw1oAKK1DdewNzRZSqI2eSDBgXNkmMk2KNoJ2ht5JBke4EjePLl7SDPtK
         VqgzWlINMhjFA9Ln33SzeYTJ2FPNusO0rmu2lp7WWLqE5ucHAzN4otQI3D4n/HMuGzlS
         Z2QLtZZrlQHNM/CxlCh3bz1U3/+rQQPcGBHAFkQiPw7qhU6gkoWwkIWXq7rWfoX2zpx6
         849MvSbYDiwaCxnq64i7eDaOsI/p2V61i6xBwxDhty1LMvh4QjE1hBprGt0fJF2jND2e
         xLXPBqhdQuBTaxqEQq8kPE+NEwjjvL2jMOrpjWgoz7mxMLMBqNMMnG0KMX9Y20ehXOaX
         yeFQ==
X-Gm-Message-State: ANoB5pl9ZB07cL5nNS1LpDTu40Sbp1SqLUGqS/Is+OAySOj9xecINCaI
	rM2U5b0/fb6bs25dGWrM9OA+Iw==
X-Google-Smtp-Source: AA0mqf6W/2H1XkevKiNWP5a3u3J4ww5Uic6TNPQb8nzLTT3yvz7U7ewCDsZ5Dl09YpvgfAGUpej1oA==
X-Received: by 2002:a2e:a602:0:b0:277:8a07:521c with SMTP id v2-20020a2ea602000000b002778a07521cmr3602767ljp.335.1668419365869;
        Mon, 14 Nov 2022 01:49:25 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id z10-20020a05651c11ca00b002773ac59697sm1954760ljo.0.2022.11.14.01.49.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:49:25 -0800 (PST)
Message-ID: <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
Date: Mon, 14 Nov 2022 10:49:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller
 bindings
Content-Language: en-US
To: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel
 <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111044207.1478350-5-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_014929_908763_31AFBD85 
X-CRM114-Status: GOOD (  32.54  )
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

On 11/11/2022 05:42, Anup Patel wrote:
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

There is no such vendor... As Conor pointed out, this does not look
correct. Compatibles must be real and specific.

> +      - const: riscv,imsics
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 128

Is there a DTS with 128 reg items?

> +    description:
> +      Base address of each IMSIC group.
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 0
> +
> +  msi-controller: true

You want then msi-controller.yaml schema and you can drop properties
described there.

> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 32768

I just wonder if you are not putting some random stuff here... just like
this "vendor" company.

32768 inputs it is quite a big chip. Are you sure you have so many pins
or internal connections?

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

Is this a property of software or hardware?

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

Then default: 0.

> +
> +  riscv,group-index-shift:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 24
> +    maximum: 55
> +    description:
> +      Specifies the least significant bit of the group index bits in the

Please drop everywhere "Specifies the" and instead just describe the
hardware.

> +      MSI target address. When not specified it is assumed to be 24.
> +
> +additionalProperties: false

unevaluatedProperties: false and drop all properties already described
by other schemas.

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

Please run scripts/checkpatch.pl and fix reported warnings.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
