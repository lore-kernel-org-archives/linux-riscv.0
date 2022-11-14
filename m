Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 184A3C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 09:52:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2K8ARygTKyf+p5XJsRjOxVGygrldNRySisa/GwTkRDI=; b=GQ3NCw0yb+up80
	Jjdaw8bGsz5Z32OUsJx5o2r493fyCKpb46SbhyuXAo48U1mqbfAGZdumQJnpPulrpodWOxu36huG+
	bGGzWDu5pu4K5TCKKIaMr2VOgTZQ4xudL6iRA72CEtYlNM7E+LX81SIxOQeFU0iXPLtTXg3zBuDEM
	8pguNTgwHK7LqCZMejkJjr58SlOcml8mxG8xBCniivE9zoLcZ3TfenIYjmzy2O82TXwK+YoAdOlqF
	r/4fdCPu44ey7AI+Xq7hvD1yHeZoDWIp9knQSHhpRXZqk1PWEdQtyYohVrg/pzngiXFlg4FrBf6PG
	j3oo/0ma1xzNH0INx/Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouW86-00HKC1-VR; Mon, 14 Nov 2022 09:51:51 +0000
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouW83-00HJwQ-EP
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 09:51:49 +0000
Received: by mail-lj1-x22d.google.com with SMTP id u2so12421621ljl.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 01:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DT7Lqj5itHPkRsi+26ax9bJ9oaClt2yyUwZVkdk8a+4=;
        b=rkmer+mc57x3Fd3FqVO0WATgmXDiXwPeIlaRDjJQ0OCnzV3u5OmWJw/DBKO3LzuyuB
         dSXHkxMnA9yPkSRiOn9RfSAWnZxOYgiuu+spiyqVnS115DZz4d2Ub1l2pmRJI3tQndsn
         8Y+YvXBeOsiWeHFI/yWuJ2vu3Ki0BiRnxvMjufznRHyz6sYlGYLP0xFaGxqHU0EYri62
         EoIOETOzAXWkGlSt/eAw2v8xglrMtUUKF98qhpyWmhLZDEINfqxsgrDXoWsjtQhoVd14
         eU8Af/IbQ46rHG/OUaED1O9AdJPoX+jkg4ZnFLuig0E4qN0CAQ496arCJlsUTEsh8LrZ
         Zz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DT7Lqj5itHPkRsi+26ax9bJ9oaClt2yyUwZVkdk8a+4=;
        b=nXWTk9HeS5Ajy4pdteajgwgtHlPCMwD9XED62C1ZfH5IU/AlUdTOLQKG8NgNYMsPKB
         HjZIWcSfNEOjGpjR/7Dkh81RWFQBFw+9XSoJRIU7OArOzD3Ww53RW/qwQkPEQECOIjb2
         tjU6RL/YytDWKmPfkkqW/pFbc5mGpEN+K9quz7GfloBhHh0FmbfSur8YBAMlHEsWSLp8
         qbZH1QtpB/vEt2+O6P+atvjv5/vE6LIxl9wqhejEo6zYPOH3qkrF3Tt3hbuJQLC4TxoP
         V7t4ZP2Jdf14lfQ5x/FQ2hT6gmlykmq15CdR1SMYxlFMxC832JqGnN3ucJC41T0SVnRI
         uVFA==
X-Gm-Message-State: ANoB5pnSw88inzPVL+dspAFeL8+N+V7RFa+85ngPIKRE96NDrzMJpd+v
	s+ckwY874O/UBD0/GUq3wTmmLw==
X-Google-Smtp-Source: AA0mqf7dzDqUeVCvtLWO7fBd1nQJvIEpv9wABDCV5cLCP95ikI/GSEWJu/NmFg/E68D5VS4GkjLNRg==
X-Received: by 2002:a2e:b706:0:b0:277:d75:f1de with SMTP id j6-20020a2eb706000000b002770d75f1demr4173250ljo.272.1668419506902;
        Mon, 14 Nov 2022 01:51:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id f2-20020a056512360200b004ae24559388sm1754456lfs.111.2022.11.14.01.51.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Nov 2022 01:51:46 -0800 (PST)
Message-ID: <6da76cb0-428e-d35a-3b11-81c7efa22460@linaro.org>
Date: Mon, 14 Nov 2022 10:51:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
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
 <20221111044207.1478350-7-apatel@ventanamicro.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221111044207.1478350-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_015147_521072_EB922AEA 
X-CRM114-Status: GOOD (  24.14  )
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
> We add DT bindings document for RISC-V advanced platform level interrupt
> controller (APLIC) defined by the RISC-V advanced interrupt architecture
> (AIA) specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,aplic.yaml     | 136 ++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> new file mode 100644
> index 000000000000..0aa48571f3bc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> @@ -0,0 +1,136 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aplic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advancded Platform Level Interrupt Controller (APLIC)
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description:
> +  The RISC-V advanced interrupt architecture (AIA) defines advanced platform
> +  level interrupt controller (APLIC) for handling wired interrupts in a
> +  RISC-V platform. The RISC-V AIA specification can be found at
> +  https://github.com/riscv/riscv-aia.
> +
> +  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
> +  interrupt sources connect to the root domain which can further delegate
> +  interrupts to child domains. We have one device tree node for each APLIC
> +  domain.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - vendor,chip-aplic
> +      - const: riscv,aplic
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  "#interrupt-cells":
> +    const: 2
> +
> +  interrupts-extended:
> +    minItems: 1
> +    maxItems: 16384
> +    description:
> +      The presence of this property implies that given APLIC domain directly
> +      injects external interrupts to a set of RISC-V HARTS (or CPUs). Each
> +      node pointed to should be a riscv,cpu-intc node, which has a riscv node
> +      (i.e. RISC-V HART) as parent.
> +
> +  msi-parent:
> +    description:
> +      The presence of this property implies that given APLIC domain forwards

Drop "The presence of this property" and make it a proper sentence
describing hardware.

> +      wired interrupts as MSIs to a AIA incoming message signaled interrupt
> +      controller (IMSIC). This property should be considered only when the
> +      interrupts-extended property is absent.
> +
> +  riscv,num-sources:
> +    $ref: "/schemas/types.yaml#/definitions/uint32"

Drop quotes.

> +    minimum: 1
> +    maximum: 1023
> +    description:
> +      Specifies how many wired interrupts are supported by this APLIC domain.
> +
> +  riscv,children:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    minItems: 1
> +    maxItems: 1024
> +    description:
> +      This property represents a list of child APLIC domains for the given
> +      APLIC domain. Each child APLIC domain is assigned child index in
> +      increasing order with the first child APLIC domain assigned child
> +      index 0. The APLIC domain child index is used by firmware to delegate
> +      interrupts from the given APLIC domain to a particular child APLIC
> +      domain.
> +
> +  riscv,delegate:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> +    minItems: 1
> +    maxItems: 1024
> +    description:
> +      This property represents a interrupt delegation list where each entry

Drop "This property represents".

> +      is a triple consisting of child APLIC domain phandle, first interrupt
> +      number, and last interrupt number. The firmware will configure interrupt
> +      delegation registers based on interrupt delegation list.
> +
> +additionalProperties: false

Same comments as in previous patch,

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - riscv,num-sources
> +
> +examples:
> +  - |
> +    // Example 1 (APIC domain directly injecting interrupt to HARTs):
> +
> +    aplic0: interrupt-controller@c000000 {
> +      compatible = "vendor,chip-aplic", "riscv,aplic";
> +      interrupts-extended = <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg = <0xc000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +      riscv,children = <&aplic1>;
> +      riscv,delegate = <&aplic1 1 63>;
> +    };
> +
> +    aplic1: interrupt-controller@d000000 {
> +      compatible = "vendor,chip-aplic", "riscv,aplic";
> +      interrupts-extended = <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>,
> +                            <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg = <0xd000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +    };
> +
> +  - |
> +    // Example 2 (APIC domain forwarding interrupts as MSIs):
> +
> +    interrupt-controller@d000000 {
> +      compatible = "vendor,chip-aplic", "riscv,aplic";
> +      msi-parent = <&imsics>;
> +      reg = <0xd000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;

It's almost the same as previous... don't add unnecessary examples
(difference in one property usually does not mean you need new example).

> +    };
> +...

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
