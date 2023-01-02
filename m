Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10A6EC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 17:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MEkGxxo6bUcazWteCBP3Grbf0YpjOebpCCvND5I4XIw=; b=b5508vQr9OxaXm
	HS3HY4qQD9a/GnmB0sfeTieUVKKmC1TeZ3RoK0g0ryaxJ0ezi5lphrILfN1GFAmloLMQ7dvb7EAJc
	zo/ofWNfyimcmIWsk1a+mMm8rA57fFg7H336F9WoLseSVxBRP5+aJRXOK+IBCsKcG4zcAlRv/kiNl
	SCzhk3kFBokOgwHZhAVd5GPlY6dsCjB4szVuuaVsQensyZPzoAhEHu35E2m8SpQlYe648Rx7aTIhb
	2WOtgLKX6GSDku3HOtBUBAAeGMrFrgzO2sNZI2xOUap5voANMDzzVcJ9xMVjaeVy8ALNXsKJh+uUp
	OxhG+AL44a0kbWzf07+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCOTt-00D3M7-Nw; Mon, 02 Jan 2023 17:20:13 +0000
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCOSG-00D2pU-3W
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 17:18:48 +0000
Received: by mail-ej1-x630.google.com with SMTP id x22so67901946ejs.11
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 09:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1TMZ0x9PqurByAgv4IaQ4yW9+aLQK0OBu3LDtfMFSsg=;
        b=w3fJ2NVy3ybW4J12RYpo6AuPi5mn32czSWBXEVbNXs4w0q0iNt+QeXpZXeH1RX5KN1
         97nFkdOdU/by3MN81JgOvnuFZBRo326LiQfllIyefyoQydINXQPAL5+iTwIfrolvjNIu
         bZ2dbpXEwv6ChVXyBaoR4i+GELUUECfx3doT+0x/mLuoZIbPmNdlZdTkttkxBiIjGipN
         JG2gaPfcDIF6skQIuqUw1gk7t5P4uNN0yNyBAs4/rhpz4nrKcPB7ekxakNtWaX9FMI+d
         Dqlutmz3tpNsemkxJ1rtyZHweIiffIiMxZJjc+Le7P7+a+Hf6nmnOogR0Ej2QlBsFntS
         bGJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TMZ0x9PqurByAgv4IaQ4yW9+aLQK0OBu3LDtfMFSsg=;
        b=R6G/A9WQjB0vAxJRMpWzgjRCGmbFCqeBhi3yb2yRGvkXhyad8JuTx71taqJckUwj4t
         w95NU+RrD5Phkqoy2Kvq8VPOI7DKQSFZQ7hjUmJhpWyga03WpsBjbWcb8l9HyoWEj/Zj
         2cPfKi6uZ9vC3OWv7t3YcBgU/fXOOBmFiXDIedXkH9YDTV9Dg0jxg03I4sso89wTNlYJ
         ZZOoMGJIRKw9CdnXy2U5273+TTHnQY6nxZOzdSazLsuQHeIdGcUj6p2n7wvCuZVPg6cp
         llFPQrtNVCATdLFrNLcm3c0kbE6FqjSwrUiPu8Eo4tVhGbIbKkM293O5t5OiAUej/04E
         USaA==
X-Gm-Message-State: AFqh2kqxYcy1WcPZzDOF9UEr0rGz8uB7s9CmjJsXLdJpA1iawRBaa5nt
	Wfai5ZKsF1utbsGKEhmjWSFuYPIygpGzoAIGIEshUQ==
X-Google-Smtp-Source: AMrXdXutiBd/Xq4LFn6w0DCoNgQtytv0Gx4gzk/hzQo1b3LTpVg/ZK5UuclH+SgA0jMzpAnnUSNinCG1Ma6lBJE607E=
X-Received: by 2002:a17:907:76f4:b0:7c0:c836:e586 with SMTP id
 kg20-20020a17090776f400b007c0c836e586mr3093627ejc.750.1672679907904; Mon, 02
 Jan 2023 09:18:27 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com> <20221116192759.GA743769-robh@kernel.org>
In-Reply-To: <20221116192759.GA743769-robh@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Jan 2023 22:48:16 +0530
Message-ID: <CAAhSdy20DgoNLRtPw2TgTJSupxuco1NWWOWMN-97tpsnx9DLqg@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
To: Rob Herring <robh@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Atish Patra <atishp@atishpatra.org>, Alistair Francis <Alistair.Francis@wdc.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_091832_698006_EB502DFB 
X-CRM114-Status: GOOD (  31.74  )
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

On Thu, Nov 17, 2022 at 12:57 AM Rob Herring <robh@kernel.org> wrote:
>
> On Fri, Nov 11, 2022 at 10:12:04AM +0530, Anup Patel wrote:
> > We add DT bindings document for RISC-V advanced platform level interrupt
> > controller (APLIC) defined by the RISC-V advanced interrupt architecture
> > (AIA) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../interrupt-controller/riscv,aplic.yaml     | 136 ++++++++++++++++++
> >  1 file changed, 136 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> > new file mode 100644
> > index 000000000000..0aa48571f3bc
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,aplic.yaml
> > @@ -0,0 +1,136 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,aplic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Advancded Platform Level Interrupt Controller (APLIC)
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description:
> > +  The RISC-V advanced interrupt architecture (AIA) defines advanced platform
> > +  level interrupt controller (APLIC) for handling wired interrupts in a
> > +  RISC-V platform. The RISC-V AIA specification can be found at
> > +  https://github.com/riscv/riscv-aia.
> > +
> > +  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
> > +  interrupt sources connect to the root domain which can further delegate
> > +  interrupts to child domains. We have one device tree node for each APLIC
> > +  domain.
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - vendor,chip-aplic
> > +      - const: riscv,aplic
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 2
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 16384
> > +    description:
> > +      The presence of this property implies that given APLIC domain directly
> > +      injects external interrupts to a set of RISC-V HARTS (or CPUs). Each
> > +      node pointed to should be a riscv,cpu-intc node, which has a riscv node
> > +      (i.e. RISC-V HART) as parent.
> > +
> > +  msi-parent:
> > +    description:
> > +      The presence of this property implies that given APLIC domain forwards
> > +      wired interrupts as MSIs to a AIA incoming message signaled interrupt
> > +      controller (IMSIC). This property should be considered only when the
> > +      interrupts-extended property is absent.
> > +
> > +  riscv,num-sources:
> > +    $ref: "/schemas/types.yaml#/definitions/uint32"
> > +    minimum: 1
> > +    maximum: 1023
> > +    description:
> > +      Specifies how many wired interrupts are supported by this APLIC domain.
> > +
> > +  riscv,children:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +    minItems: 1
> > +    maxItems: 1024
>
> As each entry is a single phandle:
>
>        items:
>          maxItems: 1

Okay, I will update.

>
> > +    description:
> > +      This property represents a list of child APLIC domains for the given
> > +      APLIC domain. Each child APLIC domain is assigned child index in
> > +      increasing order with the first child APLIC domain assigned child
> > +      index 0. The APLIC domain child index is used by firmware to delegate
> > +      interrupts from the given APLIC domain to a particular child APLIC
> > +      domain.
> > +
> > +  riscv,delegate:
> > +    $ref: '/schemas/types.yaml#/definitions/phandle-array'
> > +    minItems: 1
> > +    maxItems: 1024
>
>        items:
>          items:
>            - description: child APLIC domain phandle
>            - description: ...
>            - description: ...

Okay, I will update.

>
> > +    description:
> > +      This property represents a interrupt delegation list where each entry
> > +      is a triple consisting of child APLIC domain phandle, first interrupt
> > +      number, and last interrupt number. The firmware will configure interrupt
> > +      delegation registers based on interrupt delegation list.
>
> First and last are inclusive?

Yes, first and last are inclusive. I will clarify this in the description.

>
> Couldn't riscv,children and riscv,delegate be combined? How would they
> be different? If some children don't have any delegated interrupts, you
> could use -1 for the cells for example.

The "riscv,children" describes the hierarchy of APLIC domains in HW
whereas "riscv,delegate" describes the system choices of delegating
interrupts from a parent APLIC domain to one of its children. I feel
it's not natural to combine these two properties.

>
> An example showing the need would be nice.
>
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - "#interrupt-cells"
> > +  - riscv,num-sources
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (APIC domain directly injecting interrupt to HARTs):
>
> Is than an x86 APIC or a typo?
>
> > +
> > +    aplic0: interrupt-controller@c000000 {
> > +      compatible = "vendor,chip-aplic", "riscv,aplic";
> > +      interrupts-extended = <&cpu1_intc 11>,
> > +                            <&cpu2_intc 11>,
> > +                            <&cpu3_intc 11>,
> > +                            <&cpu4_intc 11>;
> > +      reg = <0xc000000 0x4080>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +      riscv,num-sources = <63>;
> > +      riscv,children = <&aplic1>;
> > +      riscv,delegate = <&aplic1 1 63>;
> > +    };
> > +
> > +    aplic1: interrupt-controller@d000000 {
> > +      compatible = "vendor,chip-aplic", "riscv,aplic";
> > +      interrupts-extended = <&cpu1_intc 9>,
> > +                            <&cpu2_intc 9>,
> > +                            <&cpu3_intc 9>,
> > +                            <&cpu4_intc 9>;
> > +      reg = <0xd000000 0x4080>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +      riscv,num-sources = <63>;
> > +    };
> > +
> > +  - |
> > +    // Example 2 (APIC domain forwarding interrupts as MSIs):
> > +
> > +    interrupt-controller@d000000 {
> > +      compatible = "vendor,chip-aplic", "riscv,aplic";
> > +      msi-parent = <&imsics>;
> > +      reg = <0xd000000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <2>;
> > +      riscv,num-sources = <63>;
> > +    };
> > +...
> > --
> > 2.34.1
> >
> >

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
