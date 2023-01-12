Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D973C61DB3
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Jan 2023 21:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V+dfV6FUj9OD4e8Igu12JxACh/5oUd3cIa3PLP4UdRc=; b=c4HCejtz+F4NZz
	GXle8aKYLMxupfckqnDZtJv2LvKTtBBKDOPZ2YBWEHbrksuHBo4TX98pOZ+ltgDA/X91eA5DtVWlc
	UG9T7BmuwpulZYmtKjLz/tcyT6maBBraNe01R6D8Ppj6KpxneT8ww5tW7amheALNrFZ4IHHFj+dRP
	SzLkNIYTNWr0RAmBDhlGYsOO8/oisV/vRXZdkjp2Wfnhj3tMyoylPwVxSdu+/nYdY25cat5INIOkp
	qaPGGOCZxf/BgKtE2Ys80rVR0IzJQk2qYS5DxSai4Cf3PW2vZcKkHqTqqnFeMtHW5eGf+UOO1bFTs
	Es8MH293JOV4jnGgR2mg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4id-00H4ZJ-Il; Thu, 12 Jan 2023 21:02:39 +0000
Received: from mail-oo1-f44.google.com ([209.85.161.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pG4ia-00H4Xh-9d
	for linux-riscv@lists.infradead.org; Thu, 12 Jan 2023 21:02:38 +0000
Received: by mail-oo1-f44.google.com with SMTP id b10-20020a4a9fca000000b004e6f734c6b4so5123809oom.9
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jan 2023 13:02:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RfY+++CNANdJFoCSPyaMORoeKsaEA9plzaHJ+dY2V7w=;
        b=YR2ePInP7PvmgLayeK5GgusjvHDg9YcM2UwQUSCkcN4HIzClSvC4CXfjSQ8/m1InC1
         dp+e1hjCeCKm4O6axf1NRktZ6hzk42hGWHT3RNa2twqf8MJEpS3aLNfUvNLY77KXZ5NU
         2dIcIwqiD3RuZjvKxiqDpOvTum6GO7tk//Wmg9XK9skP0CH18l8kQSjnF2JIuuq0rlnR
         vwAo4vdOUNrrykCoKjlymRZZ7ucUmVwrtQ8Nq5jJj7PhV6umux3kYLgZV0fyhihTqlQA
         +bCP1+GUGBZbMs8Yq0ML506ruMf3JRHBXKCLFCdE9SD4KNiALvLzdGXCZLbuWn5V63Af
         M9lw==
X-Gm-Message-State: AFqh2kpT/OPeitEb/4KZ0yBOai19b4ISPV2dtJYYQr2xofTHWSepepXT
	WD2Dx/b5A2KBmuvdCIl+DQ==
X-Google-Smtp-Source: AMrXdXsGfWxNDyM3OTM69PkQpKWlf+Q8e8sFq+wBdINdSP4ZSEaFhr/b8wKUQ/02qYgehItNwZvGIw==
X-Received: by 2002:a4a:e2da:0:b0:49f:8814:e387 with SMTP id l26-20020a4ae2da000000b0049f8814e387mr37093371oot.9.1673557353873;
        Thu, 12 Jan 2023 13:02:33 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id m11-20020a056820034b00b004f219b998eesm3486486ooe.43.2023.01.12.13.02.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jan 2023 13:02:33 -0800 (PST)
Received: (nullmailer pid 228721 invoked by uid 1000);
	Thu, 12 Jan 2023 21:02:31 -0000
Date: Thu, 12 Jan 2023 15:02:31 -0600
From: Rob Herring <robh@kernel.org>
To: Anup Patel <apatel@ventanamicro.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 6/9] dt-bindings: interrupt-controller: Add RISC-V
 advanced PLIC
Message-ID: <20230112210231.GA214515-robh@kernel.org>
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-7-apatel@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230103141409.772298-7-apatel@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230112_130236_413742_5C0369C8 
X-CRM114-Status: GOOD (  25.06  )
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

On Tue, Jan 03, 2023 at 07:44:06PM +0530, Anup Patel wrote:
> We add DT bindings document for RISC-V advanced platform level
> interrupt controller (APLIC) defined by the RISC-V advanced
> interrupt architecture (AIA) specification.
> 
> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> ---
>  .../interrupt-controller/riscv,aplic.yaml     | 159 ++++++++++++++++++
>  1 file changed, 159 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> new file mode 100644
> index 000000000000..b7f20aad72c2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> @@ -0,0 +1,159 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aplic.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: RISC-V Advanced Platform Level Interrupt Controller (APLIC)
> +
> +maintainers:
> +  - Anup Patel <anup@brainfault.org>
> +
> +description:
> +  The RISC-V advanced interrupt architecture (AIA) defines an advanced
> +  platform level interrupt controller (APLIC) for handling wired interrupts
> +  in a RISC-V platform. The RISC-V AIA specification can be found at
> +  https://github.com/riscv/riscv-aia.
> +
> +  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
> +  interrupt sources connect to the root domain which can further delegate
> +  interrupts to child domains. There is one device tree node for each APLIC
> +  domain.
> +
> +allOf:
> +  - $ref: /schemas/interrupt-controller.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - riscv,qemu-aplic

Make 'qemu' the vendor.

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
> +      Given APLIC domain directly injects external interrupts to a set of
> +      RISC-V HARTS (or CPUs). Each node pointed to should be a riscv,cpu-intc
> +      node, which has a riscv node (i.e. RISC-V HART) as parent.
> +
> +  msi-parent:
> +    description:
> +      Given APLIC domain forwards wired interrupts as MSIs to a AIA incoming
> +      message signaled interrupt controller (IMSIC). This property should be
> +      considered only when the interrupts-extended property is absent.
> +
> +  riscv,num-sources:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 1023
> +    description:
> +      Specifies how many wired interrupts are supported by this APLIC domain.

We don't normally need to how many interrupts, why here?

> +
> +  riscv,children:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024
> +    items:
> +      maxItems: 1
> +    description:
> +      A list of child APLIC domains for the given APLIC domain. Each child
> +      APLIC domain is assigned child index in increasing order with the
> +      first child APLIC domain assigned child index 0. The APLIC domain
> +      child index is used by firmware to delegate interrupts from the
> +      given APLIC domain to a particular child APLIC domain.
> +
> +  riscv,delegate:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    minItems: 1
> +    maxItems: 1024
> +    items:
> +      items:
> +        - description: child APLIC domain phandle
> +        - description: first interrupt number (inclusive)
> +        - description: last interrupt number (inclusive)
> +    description:
> +      A interrupt delegation list where each entry is a triple consisting
> +      of child APLIC domain phandle, first interrupt number, and last
> +      interrupt number. The firmware will configure interrupt delegation
> +      registers based on interrupt delegation list.

The node's domain it delegating its interrupts to the child domain or 
the other way around? The interrupt numbers here are this domain's or 
the child's?

> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupt-controller
> +  - "#interrupt-cells"
> +  - riscv,num-sources
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    // Example 1 (APLIC domains directly injecting interrupt to HARTs):
> +
> +    aplic0: interrupt-controller@c000000 {
> +      compatible = "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended = <&cpu1_intc 11>,
> +                            <&cpu2_intc 11>,
> +                            <&cpu3_intc 11>,
> +                            <&cpu4_intc 11>;
> +      reg = <0xc000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +      riscv,children = <&aplic1>, <&aplic2>;
> +      riscv,delegate = <&aplic1 1 63>;
> +    };
> +
> +    aplic1: interrupt-controller@d000000 {
> +      compatible = "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended = <&cpu1_intc 9>,
> +                            <&cpu2_intc 9>;
> +      reg = <0xd000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +    };
> +
> +    aplic2: interrupt-controller@e000000 {
> +      compatible = "riscv,qemu-aplic", "riscv,aplic";
> +      interrupts-extended = <&cpu3_intc 9>,
> +                            <&cpu4_intc 9>;
> +      reg = <0xe000000 0x4080>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +    };
> +
> +  - |
> +    // Example 2 (APLIC domains forwarding interrupts as MSIs):
> +
> +    aplic3: interrupt-controller@c000000 {
> +      compatible = "riscv,qemu-aplic", "riscv,aplic";
> +      msi-parent = <&imsic_mlevel>;
> +      reg = <0xc000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +      riscv,children = <&aplic4>;
> +      riscv,delegate = <&aplic4 1 63>;
> +    };
> +
> +    aplic4: interrupt-controller@d000000 {
> +      compatible = "riscv,qemu-aplic", "riscv,aplic";
> +      msi-parent = <&imsic_slevel>;
> +      reg = <0xd000000 0x4000>;
> +      interrupt-controller;
> +      #interrupt-cells = <2>;
> +      riscv,num-sources = <63>;
> +    };
> +...
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
