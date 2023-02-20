Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB3D4C61DA4
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Feb 2023 03:20:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O5ZRgKoB3EVt5TotZ+/myRbWvJHt8XtVGt0tVceoxLc=; b=mHl9/YXDxgkRno
	ImAX3va/69hOgiDKUoZs8ua6hjs/EljOcUQPXhi9ihv9QxFQNHxDZMgNnDOd2NkxGSPxr2/bm+ML8
	Uwfsq5SpDp7bzGj+Hdkh0vQK63n8cGDQO5jOpBFqO+JcWMNruePvyLgvagmHi5CNhDJScXU/JCaZ5
	MHHwB8h1H22nBHEsFNQaqNW9DwI004I5TPqgf7KRaGNKVIHGTDHiPN7O6Ophfy/KNjOJ+WgvX4OX4
	z5ZW/H1MgQLekzfKZFXlhSECC6ZXrFrRnREjMijv3nRloEb5Clh2Hp0W0CACRkScMV/OtpwACVpEx
	fBSr0o8Ig8PUuNZsaxpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTwjN-002sko-VJ; Mon, 20 Feb 2023 03:20:45 +0000
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pTwjK-002skB-JY
	for linux-riscv@lists.infradead.org; Mon, 20 Feb 2023 03:20:44 +0000
Received: by mail-vk1-xa35.google.com with SMTP id n140so372077vkf.9
        for <linux-riscv@lists.infradead.org>; Sun, 19 Feb 2023 19:20:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IVyxrcqyhvEqcJnk25l7mMKS619HzfCIN9oUYklNXO4=;
        b=Hsi4KSoHUL3ldJNfqVhHQV+jfZ8b9o2ZthQpGd0zRRNjL0A6Vzqx0ApdN/HJvmSMhy
         5w5IDjg1c4DOLkSdQZls7yuioOQQNXo+NdD8JePMwPn2kRYIQ9R53l1Pw5i2FZqqx0Lm
         +IeEU0/qY2liYoj+KEFJNoL5tKJODbK69wSxGD/v9thJzVLTyUvqzWuUaw1rf4wR4OVr
         g4Bm7X+7TOmSqimMmTAneZWc2e3BD/RUoP4153I1N6q5WBFOvmWtg9ejiFqmA+XCW7FA
         1DNeBnV1gDHxaMUHeB4XN1y82uB03KT9JM+4PyhOlX0fR9QTzEVGd63JcI6zCb6LEwjh
         dgww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IVyxrcqyhvEqcJnk25l7mMKS619HzfCIN9oUYklNXO4=;
        b=VE/n1tfKgTT3KhkaEUz5Xp0sxqfJoOifI/U1vcOQJck6iR3MJRMbpYiwj4s0lUGt8b
         Lsx/Uqj68KX4XPs1gdlDRL2qMdQt2n/9Ql8mOMbPo2X9aWghB0aNK31VRwb6lo8Iwes/
         qq37DzzKm0hTCKkGLEizCAMMHzV6XSoQ3boJEDDYFOXdPOnqeP/E/ILmJDEFlTZQM8yL
         YH5hxdHHnqmUr5ZpoU7mnp4h2BrIMY6Q5YIs/7qskwO4Uwi+/dcVXSzMeIgyTR6/uYBm
         O29E6C7bD/XGWz+GNZljK/W6jvYUe+p3V5KW/chg/6xljEMXfc6X7XAwxCgv8Px3frFK
         ZYWg==
X-Gm-Message-State: AO0yUKUOb4GzBab/7nDZJ7oFmWVMQr+lk1LUEFqNTCw6Kg/PSHSbIRVG
	u9QRLRiQ2g6LezU8YVB7vDK2aV4bqkutXwPqECLwcQ==
X-Google-Smtp-Source: AK7set9TV/8v8G4HWGDI+IojD/JqK2y1niqljmzxWt0uXdugO4mMtuM+B5Q8cNWiuLuloviLjFbMKzJYY0kv+HcF9Go=
X-Received: by 2002:a1f:a682:0:b0:3d5:9b32:7ba4 with SMTP id
 p124-20020a1fa682000000b003d59b327ba4mr86677vke.15.1676863240854; Sun, 19 Feb
 2023 19:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20230103141409.772298-1-apatel@ventanamicro.com>
 <20230103141409.772298-5-apatel@ventanamicro.com> <20230112204913.GA126944-robh@kernel.org>
In-Reply-To: <20230112204913.GA126944-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 20 Feb 2023 08:50:29 +0530
Message-ID: <CAK9=C2X+H+cv-eHW2uG4Az9LAJ+C75m7jm=dRLgW0db85E7OZQ@mail.gmail.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: interrupt-controller: Add RISC-V
 incoming MSI controller
To: Rob Herring <robh@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230219_192042_713131_B5C3A707 
X-CRM114-Status: GOOD (  35.24  )
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

On Fri, Jan 13, 2023 at 2:19 AM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, Jan 03, 2023 at 07:44:04PM +0530, Anup Patel wrote:
> > We add DT bindings document for the RISC-V incoming MSI controller
> > (IMSIC) defined by the RISC-V advanced interrupt architecture (AIA)
> > specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../interrupt-controller/riscv,imsics.yaml    | 168 ++++++++++++++++++
> >  1 file changed, 168 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> > new file mode 100644
> > index 000000000000..b9db03b6e95f
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsics.yaml
> > @@ -0,0 +1,168 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsics.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V Incoming MSI Controller (IMSIC)
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |
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
> > +  The device tree of a RISC-V platform will have one IMSIC device tree node
> > +  for each privilege level (machine or supervisor) which collectively describe
> > +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
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
> > +allOf:
> > +  - $ref: /schemas/interrupt-controller.yaml#
> > +  - $ref: /schemas/interrupt-controller/msi-controller.yaml#
> > +
> > +properties:
> > +  compatible:
> > +    items:
> > +      - enum:
> > +          - riscv,qemu-imsics
>
> The implmentation/vendor is qemu, so: qemu,imsics (or qemu,riscv-imsics?)

Okay, I will update.

>
> > +      - const: riscv,imsics
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 16384
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
> > +    maxItems: 16384
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
> > +      Number of interrupt identities supported by IMSIC interrupt file.
> > +
> > +  riscv,num-guest-ids:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 63
> > +    maximum: 2047
> > +    description:
> > +      Number of interrupt identities are supported by IMSIC guest interrupt
> > +      file. When not specified it is assumed to be same as specified by the
> > +      riscv,num-ids property.
> > +
> > +  riscv,guest-index-bits:
> > +    minimum: 0
> > +    maximum: 7
> > +    default: 0
> > +    description:
> > +      Number of guest index bits in the MSI target address. When not
> > +      specified it is assumed to be 0.
>
> No need to repeat what 'default: 0' defines.

Okay, I will update.

>
> > +
> > +  riscv,hart-index-bits:
> > +    minimum: 0
> > +    maximum: 15
> > +    description:
> > +      Number of HART index bits in the MSI target address. When not
> > +      specified it is estimated based on the interrupts-extended property.
>
> If guessing works, why do you need the property? Perhaps
> s/estimated/calculated/?

Okay, I will fix the wording.

We need this property because IMSIC files of two consecutive HARTs
are not required to be contiguous since there could be holes (unused
space) in between.

>
> > +
> > +  riscv,group-index-bits:
> > +    minimum: 0
> > +    maximum: 7
> > +    default: 0
> > +    description:
> > +      Number of group index bits in the MSI target address. When not
> > +      specified it is assumed to be 0.
> > +
> > +  riscv,group-index-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 0
> > +    maximum: 55
> > +    default: 24
> > +    description:
> > +      The least significant bit position of the group index bits in the
> > +      MSI target address. When not specified it is assumed to be 24.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - interrupt-controller
> > +  - msi-controller
>
> #msi-cells should be defined (as 0) and required. Best to be explicit
> #and not rely on the default.

Okay, I will update.

>
> > +  - interrupts-extended
> > +  - riscv,num-ids
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    // Example 1 (Machine-level IMSIC files with just one group):
> > +
> > +    imsic_mlevel: interrupt-controller@24000000 {
>
> Drop unused labels.

Okay, I will update.

>
> > +      compatible = "riscv,qemu-imsics", "riscv,imsics";
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
> > +      compatible = "riscv,qemu-imsics", "riscv,imsics";
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

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
