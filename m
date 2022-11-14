Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 877BDC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:29:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XXQtZrpEt1s54FqP5PJ68zYd78xwrG1wkplP612m9Qs=; b=JQ/o53v1QNW7G2
	JL1JJrngxXOo4bHz8E8XbOF1jGmKBFiBmSQGihO2kLnDLZsy/eQIfdFmiOjjKiR30FD6UehCh9yKW
	zt6XNLs7kjYqIh60XxppJz7/FjKAK4rdYqo+MsidemAO9kNtnxafk0M00qwOZazR+y+z1K2Y5VhJs
	87VM9H5riCzJrIFctRsR4kvV/DMlqhoGo7TuvUBCpQWa6EoWNHIjFZ+cdi7csznnhEZ/lj+HpjD5M
	t9iLahWB9HzAi71F9QnFot7ZhEVvZdo2+cVhgE6BQFgIlYr5d7sBF4TMgh0AEBkYFBSaRyI97GYmU
	VP56YadQTATaoGhDTcFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYaS-000oPf-T6; Mon, 14 Nov 2022 12:29:16 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYaO-000oOM-QJ
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:29:14 +0000
Received: by mail-ot1-x32d.google.com with SMTP id l42-20020a9d1b2d000000b0066c6366fbc3so6547440otl.3
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 04:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=UBYAgk/8XQPB5WMV9514943bZAhbCeR6TpxGksmgvQw=;
        b=IeHkTMEko2YpCueQyCJhLIgos/8B9AzexLBkQ3eslu8qVkYY0G2NSPTXch4PObCaof
         v4AKwL8CmP2/6ks6MY6r0BlerBNZOSAHiLwjuEmrklgKAuPHpbultboz6DkbHd+yCyV6
         UP2mKBZ9nPs9c6H3aZG01CIMOmHwJkPaXx50uMQoHTuU+fp+h1FJ8VWLDyTH886zEf3B
         Htuu9eMIpbk/h5dFeVfAhR781kI0+4xdsYozkhRi9FbycnllKPH/9tvabkk4HVQDI5YF
         bTNZfRaB7CuW9Zn046WXYi3EebzCxxZKORBT1bjtyYl9/yktRITzNntk0wH6+aM3ELBU
         XwLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UBYAgk/8XQPB5WMV9514943bZAhbCeR6TpxGksmgvQw=;
        b=EaWzciZ1AfRs65ZKutUNgCSu6t/7HXpIom19kM3WWAokwwPWbSeZlmslKyTGJp0lec
         ijs/hAMEsUwle+v4e1iYUT6Hmo8pQGSIsC8/Is1rIgbEaAdlrIEA9TzhZiUJIDGy2pdD
         ZqQDBB9PnjGZ/AUzri4z5QFc8ioUFqjf3cklHzR1JsVPx/0wMfu73m9CH0X56YQkDt/5
         F8G1XWc9yLwUMrgTONQjUlak6xVGDTYZ8v7yT3jnBv4UIip4oEGQQmGYXc5Otgm8UNlv
         epVvbP4Lk0x9WXWAAWe8PDxK1kfnBKn80Q910ulfz2KZksk9/siJOjma6iz+X/7gubgF
         Lcdw==
X-Gm-Message-State: ANoB5pm1zF1H3ntkqIg5pQJAaIzbmCIKM1SUjKWVz2YloLWyVV6eH9MY
	EiZtJAEdF1RhNOnvaotXHgz5l95mryxWhgAHLN0ZaQ==
X-Google-Smtp-Source: AA0mqf4+mW6bbk6LR0Ggm2JGpzfrwwzBpZ6JzdyWi1Qw2SWqbMQ3blTzBVBnV2CPqQwCJ4AElEe5iJNWpGW5HZM9cTs=
X-Received: by 2002:a9d:7345:0:b0:66c:5310:7745 with SMTP id
 l5-20020a9d7345000000b0066c53107745mr6491458otk.48.1668428951558; Mon, 14 Nov
 2022 04:29:11 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <Y3EDuaW0zQSSfiQ/@spud>
In-Reply-To: <Y3EDuaW0zQSSfiQ/@spud>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 14 Nov 2022 17:59:00 +0530
Message-ID: <CAK9=C2WDQCnVnxKR6SFspdwope2KffyASLJDF_Ygo_417ekJ5w@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_042912_881196_F36FF356 
X-CRM114-Status: GOOD (  43.73  )
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

On Sun, Nov 13, 2022 at 8:18 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup,
>
> On Fri, Nov 11, 2022 at 10:12:02AM +0530, Anup Patel wrote:
> > dt-bindings: Add RISC-V incoming MSI controller bindings
>
> nit: it looks like the usual prefix here is "dt-bindings:
> interrupt-controller".

Okay, I will update.

>
> > We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
> > defined by the RISC-V advanced interrupt architecture (AIA) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
> >  1 file changed, 174 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > new file mode 100644
> > index 000000000000..05106eb1955e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> > @@ -0,0 +1,174 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Incoming MSI Controller (IMSIC)
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description:
>
> Is this one of the situations where we want to have a | after
> "description:" to preserve formatting?

Okay, I will update.

>
> > +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> > +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> > +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> > +
> > +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> > +  for each privilege level (machine or supervisor). The configuration of
> > +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
> > +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> > +  fixed number of interrupt identities (to distinguish MSIs from devices)
> > +  which is same for given privilege level across CPUs (or HARTs).
> > +
> > +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> > +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
> > +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> > +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> > +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
> > +  privilege level (machine or supervisor) encodes group index, HART index,
> > +  and guest index (shown below).
> > +
> > +  XLEN-1           >=24                                 12    0
> > +  |                  |                                  |     |
> > +  -------------------------------------------------------------
> > +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> > +  -------------------------------------------------------------
> > +
> > +  The device tree of a RISC-V platform will have one IMSIC device tree node
> > +  for each privilege level (machine or supervisor) which collectively describe
> > +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> > +
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - vendor,chip-imsics
>
> Is it valid to have a dummy here? I did a bit of grepping & could not
> see a single other yaml binding which used a placeholder like this -
> other than the example schema itself. I assume you're trying to get
> across the point that using the bare riscv,imsics is not okay and a
> vendor should create a custom string for their implementation?

Yes, this dummy is a placeholder to mandate two compatible strings.
The dummy can eventually be replaced by some actual implementation
compatible string.

>
> Also, the file name says "riscv,imsic", the description says "IMSIC" but
> you've used "imsics" in the compatible. Is this a typo, or a plural?

Yes, the file name should be consistent. I will update the file name.

>
> Thanks,
> Conor.
>
> > +      - const: riscv,imsics
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 128
> > +    description:
> > +      Base address of each IMSIC group.
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 0
> > +
> > +  msi-controller: true
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 32768
> > +    description:
> > +      This property represents the set of CPUs (or HARTs) for which given
> > +      device tree node describes the IMSIC interrupt files. Each node pointed
> > +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> > +      HART) as parent.
> > +
> > +  riscv,num-ids:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 63
> > +    maximum: 2047
> > +    description:
> > +      Specifies how many interrupt identities are supported by IMSIC interrupt
> > +      file.
> > +
> > +  riscv,num-guest-ids:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 63
> > +    maximum: 2047
> > +    description:
> > +      Specifies how many interrupt identities are supported by IMSIC guest
> > +      interrupt file. When not specified the number of interrupt identities
> > +      supported by IMSIC guest file is assumed to be same as specified by
> > +      the riscv,num-ids property.
> > +
> > +  riscv,slow-ipi:
> > +    type: boolean
> > +    description:
> > +      The presence of this property implies that software interrupts (i.e.
> > +      IPIs) using IMSIC software injected MSIs is slower compared to other
> > +      software interrupt mechanisms (such as SBI IPI) on the underlying
> > +      RISC-V platform.
> > +
> > +  riscv,guest-index-bits:
> > +    minimum: 0
> > +    maximum: 7
> > +    description:
> > +      Specifies number of guest index bits in the MSI target address. When
> > +      not specified it is assumed to be 0.
> > +
> > +  riscv,hart-index-bits:
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Specifies number of HART index bits in the MSI target address. When
> > +      not specified it is estimated based on the interrupts-extended property.
> > +
> > +  riscv,group-index-bits:
> > +    minimum: 0
> > +    maximum: 7
> > +    description:
> > +      Specifies number of group index bits in the MSI target address. When
> > +      not specified it is assumed to be 0.
> > +
> > +  riscv,group-index-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 24
> > +    maximum: 55
> > +    description:
> > +      Specifies the least significant bit of the group index bits in the
> > +      MSI target address. When not specified it is assumed to be 24.
> > +
> > +additionalProperties: false
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - msi-controller
> > +  - interrupts-extended
> > +  - riscv,num-ids
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (Machine-level IMSIC files with just one group):
> > +
> > +    imsic_mlevel: interrupt-controller@24000000 {
> > +      compatible = "vendor,chip-imsics", "riscv,imsics";
> > +      interrupts-extended = <&cpu1_intc 11>,
> > +                            <&cpu2_intc 11>,
> > +                            <&cpu3_intc 11>,
> > +                            <&cpu4_intc 11>;
> > +      reg = <0x28000000 0x4000>;
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +      msi-controller;
> > +      riscv,num-ids = <127>;
> > +    };
> > +
> > +  - |
> > +    // Example 2 (Supervisor-level IMSIC files with two groups):
> > +
> > +    imsic_slevel: interrupt-controller@28000000 {
> > +      compatible = "vendor,chip-imsics", "riscv,imsics";
> > +      interrupts-extended = <&cpu1_intc 9>,
> > +                            <&cpu2_intc 9>,
> > +                            <&cpu3_intc 9>,
> > +                            <&cpu4_intc 9>;
> > +      reg = <0x28000000 0x2000>, /* Group0 IMSICs */
> > +            <0x29000000 0x2000>; /* Group1 IMSICs */
> > +      interrupt-controller;
> > +      #interrupt-cells = <0>;
> > +      msi-controller;
> > +      riscv,num-ids = <127>;
> > +      riscv,group-index-bits = <1>;
> > +      riscv,group-index-shift = <24>;
> > +    };
> > +...
> > --
> > 2.34.1
> >
> >
> > _______________________________________________
> > linux-riscv mailing list
> > linux-riscv@lists.infradead.org
> > http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
