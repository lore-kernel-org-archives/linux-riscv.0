Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43BD3C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 15:05:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=icwzvAlrXx7D//kIYqzmIeEebWT+AuAHXz8s9iYfUeg=; b=OCgXyPGLyFudkO
	8s2IZKpJE68F4MPf2NIyHFpAyXC0adlOo17pHklOJdETQtUfFZesp5fMoZcNIA9Yqak3YrJbx7qJQ
	9hz0sGl4DfDKT6jHNyOAkUzo+f84Gd8bR9sEnF4nWYEJdP3t8+Pe25Ot4o/6DvtSgcPDzMJIvey2m
	mfnoxY0e5LP7nPwNp+Wb+Z4csk5OZy6qzpb6gb2Su4cWlUDv0VNmlGMhzRJnrBV20dDzUcv3D54Wi
	RuhYOLsRYGupCbeQwdbskYb3YK8GhbwhdIIa+fGFNq/KLm+a4MfNf2KRoPHx06Ap1tuPvDqwQyp11
	3f/VOXOGtcc/OWmdzzgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oub1D-0025mK-N7; Mon, 14 Nov 2022 15:05:03 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oub19-0025k7-NH
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 15:05:02 +0000
Received: by mail-oi1-x232.google.com with SMTP id n205so11667945oib.1
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 07:04:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ulAOjA75cdUjCrwoFzB3GNTnqeppGrkDtJATlYQPSco=;
        b=lExNvcXwOiM309Kvig8jF70BuGGKOzlvekHmZScMYXQKI7kPvOCEcfLoIYpp/iFazb
         ui2bUu0jH0Dgfe8kOLHBFR75CD+FDLj6ESAkjM9vwnu5jxHSxPhxvVMFm3xuGm6wcgCv
         CFnki7JmgwOUm+PjLEGd4iZ8OF7tVSha7AvVZrPmJ8Dd+inAPiGNIgdJ+rTGKDnaEZbj
         qXhtssXM5xgXjhuB8sr9rq/yoFi+saYHqXDZmHRGJOpjtiSkro31bi4j3GMHPvpC/KUf
         L+SmaHRoJcbmLg6o1K0d7o5AgpcWZ4P4DEsxoUqYHsDjz4bi9im40fFEK50Ti98i60QM
         EyfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ulAOjA75cdUjCrwoFzB3GNTnqeppGrkDtJATlYQPSco=;
        b=OjsgTkLaG9q5QdYsBy4cHKBxCiVp4eQUnZsH+W8cL6XGpLM2lAOoM6vN6pCP2fvXCF
         C/5DeLEYBBk4SMzmdzVGCQeT9kn5hvu2nHJGzWvlJS8cIWQBBGEGzofbjDRGSWevs3BN
         8VfpMINeBcSCOqrAH8mJtqhSRisI2AE1nrQz+D0UvreTShXxA7cl9uWBVl3JM1g/dIIv
         gWN7T5gfBrT/fbonYdht3Pw6LqWaPe0gjiqgdxJMzfci2+dxGBZXbdqtkz0G34zvavrx
         YATuxtyZI44LzS+AFDACC8ubDWpqouaguc7ZqgWmTAz/SaZgN+BpOI53Glb4DRm7gcIf
         qAPQ==
X-Gm-Message-State: ANoB5pk63rWjFGYkpJGjupQcwT1bemURBv7+ZU66TY5wUDswBeJiicFj
	6Yv6msOZF3bLUsFJByLWh9wySM9bL1rfrYuCZesyAgELjYlHTg==
X-Google-Smtp-Source: AA0mqf6lT+kmg+JHdDm1daVMkl8lf3NcqyT8MzhszZniZ5XHEK8j9CkyFUgWxddEZpdnZ/vL0Rv1tENw2T9e86OzUbs=
X-Received: by 2002:a05:6808:20a3:b0:359:c377:6f7 with SMTP id
 s35-20020a05680820a300b00359c37706f7mr6006527oiw.271.1668438297561; Mon, 14
 Nov 2022 07:04:57 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
 <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com> <3f469c79-fc4e-9c29-9c47-6dd8e28484a5@linaro.org>
In-Reply-To: <3f469c79-fc4e-9c29-9c47-6dd8e28484a5@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 14 Nov 2022 20:34:45 +0530
Message-ID: <CAK9=C2VEZhxgqEDxxKRyvs7NdeRvPzVH=Yy_c_t-tLWhCt3wqA@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_070459_814876_89798745 
X-CRM114-Status: GOOD (  60.57  )
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

On Mon, Nov 14, 2022 at 5:52 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 14/11/2022 13:06, Anup Patel wrote:
> > On Mon, Nov 14, 2022 at 3:19 PM Krzysztof Kozlowski
> > <krzysztof.kozlowski@linaro.org> wrote:
> >>
> >> On 11/11/2022 05:42, Anup Patel wrote:
> >>> We add DT bindings document for RISC-V incoming MSI controller (IMSIC)
> >>> defined by the RISC-V advanced interrupt architecture (AIA) specification.
> >>>
> >>> Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> >>> ---
> >>>  .../interrupt-controller/riscv,imsic.yaml     | 174 ++++++++++++++++++
> >>>  1 file changed, 174 insertions(+)
> >>>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> >>>
> >>> diff --git a/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> >>> new file mode 100644
> >>> index 000000000000..05106eb1955e
> >>> --- /dev/null
> >>> +++ b/Documentation/devicetree/bindings/interrupt-controller/riscv,imsic.yaml
> >>> @@ -0,0 +1,174 @@
> >>> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >>> +%YAML 1.2
> >>> +---
> >>> +$id: http://devicetree.org/schemas/interrupt-controller/riscv,imsic.yaml#
> >>> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >>> +
> >>> +title: RISC-V Incoming MSI Controller (IMSIC)
> >>> +
> >>> +maintainers:
> >>> +  - Anup Patel <anup@brainfault.org>
> >>> +
> >>> +description:
> >>> +  The RISC-V advanced interrupt architecture (AIA) defines a per-CPU incoming
> >>> +  MSI controller (IMSIC) for handling MSIs in a RISC-V platform. The RISC-V
> >>> +  AIA specification can be found at https://github.com/riscv/riscv-aia.
> >>> +
> >>> +  The IMSIC is a per-CPU (or per-HART) device with separate interrupt file
> >>> +  for each privilege level (machine or supervisor). The configuration of
> >>> +  a IMSIC interrupt file is done using AIA CSRs and it also has a 4KB MMIO
> >>> +  space to receive MSIs from devices. Each IMSIC interrupt file supports a
> >>> +  fixed number of interrupt identities (to distinguish MSIs from devices)
> >>> +  which is same for given privilege level across CPUs (or HARTs).
> >>> +
> >>> +  The arrangement of IMSIC interrupt files in MMIO space of a RISC-V platform
> >>> +  follows a particular scheme defined by the RISC-V AIA specification. A IMSIC
> >>> +  group is a set of IMSIC interrupt files co-located in MMIO space and we can
> >>> +  have multiple IMSIC groups (i.e. clusters, sockets, chiplets, etc) in a
> >>> +  RISC-V platform. The MSI target address of a IMSIC interrupt file at given
> >>> +  privilege level (machine or supervisor) encodes group index, HART index,
> >>> +  and guest index (shown below).
> >>> +
> >>> +  XLEN-1           >=24                                 12    0
> >>> +  |                  |                                  |     |
> >>> +  -------------------------------------------------------------
> >>> +  |xxxxxx|Group Index|xxxxxxxxxxx|HART Index|Guest Index|  0  |
> >>> +  -------------------------------------------------------------
> >>> +
> >>> +  The device tree of a RISC-V platform will have one IMSIC device tree node
> >>> +  for each privilege level (machine or supervisor) which collectively describe
> >>> +  IMSIC interrupt files at that privilege level across CPUs (or HARTs).
> >>> +
> >>> +allOf:
> >>> +  - $ref: /schemas/interrupt-controller.yaml#
> >>> +
> >>> +properties:
> >>> +  compatible:
> >>> +    items:
> >>> +      - enum:
> >>> +          - vendor,chip-imsics
> >>
> >> There is no such vendor... As Conor pointed out, this does not look
> >> correct. Compatibles must be real and specific.
> >
> > Previously, Rob had suggest to:
> > 1) Mandate two compatible strings: one for implementation and
> >     and second for specification
> > 2) Since this is new specification with QEMU being the only
> >     implementation, we add "vendor,chip-imsics" as dummy
> >     implementation specific string for DT schema checkers
> >     to pass the examples. Once we have an actual implementation,
> >    we will replace this dummy string.
> >
> > Refer, https://www.spinics.net/lists/devicetree/msg442720.html
>
> And Rob did not propose vendor as vendor and chip-imsics as device. Read
> his message again.

Okay

>
> >
> >>
> >>> +      - const: riscv,imsics
> >>> +
> >>> +  reg:
> >>> +    minItems: 1
> >>> +    maxItems: 128
> >>
> >> Is there a DTS with 128 reg items?
> >
> > Not at the moment since this is a new specification.
> >
> > The value "128" is because maximum number of
> > IMSIC groups on an system with both IMSIC and
> > APLIC is 128 where each IMSIC group has a
> > separate base address. This is not a hard limit so
> > I am willing to drop it as well.
>
> Is "separate base address" really a separate different range or just
> spaced by few registers?

Yes, "separate base address" of an IMSIC group
means a separate different range.

We can think of an IMSIC group as a CPU cluster or
chiplet or die. The IMSIC files within a group are
located next to each other whereas the groups can
be far away from each other.

>
> >
> >>
> >>> +    description:
> >>> +      Base address of each IMSIC group.
> >>> +
> >>> +  interrupt-controller: true
> >>> +
> >>> +  "#interrupt-cells":
> >>> +    const: 0
> >>> +
> >>> +  msi-controller: true
> >>
> >> You want then msi-controller.yaml schema and you can drop properties
> >> described there.
> >
> > Okay, I will include msi-controller.yaml in the next revision.
> >
> >>
> >>> +
> >>> +  interrupts-extended:
> >>> +    minItems: 1
> >>> +    maxItems: 32768
> >>
> >> I just wonder if you are not putting some random stuff here... just like
> >> this "vendor" company.
> >>
> >> 32768 inputs it is quite a big chip. Are you sure you have so many pins
> >> or internal connections?
> >
> > The interrupts-extended property describes the association of IMSIC
> > interrupt files with the HARTs. If there are N HARTs then we will have
> > N entries in the interrupts-extended (just like the existing PLIC DT bindings).
> >
> > For example, if the first entry points to HART1 and the second entry points
> > to HART0 then the first interrupt file is associated with HART1 and the
> > second interrupt file is associated with HART0.
> >
> > Currently, the "maxItems" limit reflects the max IMSICs which an APLIC
> > domain can target on a system with both IMSIC and APLIC.
> >
> > Actually, there is a typo here. The "maxItems" should be 16384 as-per
> > the frozen AIA specification. I will update "maxItems" accordingly in
> > next patch revision.
> >
> >>
> >>> +    description:
> >>> +      This property represents the set of CPUs (or HARTs) for which given
> >>> +      device tree node describes the IMSIC interrupt files. Each node pointed
> >>> +      to should be a riscv,cpu-intc node, which has a riscv node (i.e. RISC-V
> >>> +      HART) as parent.
> >>> +
> >>> +  riscv,num-ids:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 63
> >>> +    maximum: 2047
> >>> +    description:
> >>> +      Specifies how many interrupt identities are supported by IMSIC interrupt
> >>> +      file.
> >>> +
> >>> +  riscv,num-guest-ids:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 63
> >>> +    maximum: 2047
> >>> +    description:
> >>> +      Specifies how many interrupt identities are supported by IMSIC guest
> >>> +      interrupt file. When not specified the number of interrupt identities
> >>> +      supported by IMSIC guest file is assumed to be same as specified by
> >>> +      the riscv,num-ids property.
> >>> +
> >>> +  riscv,slow-ipi:
> >>> +    type: boolean
> >>> +    description:
> >>> +      The presence of this property implies that software interrupts (i.e.
> >>> +      IPIs) using IMSIC software injected MSIs is slower compared to other
> >>> +      software interrupt mechanisms (such as SBI IPI) on the underlying
> >>> +      RISC-V platform.
> >>
> >> Is this a property of software or hardware?
> >
> > This is a property of hardware (or implementation) because IPIs
> > in IMSIC are software injected MSIs so if IMSIC is trap-n-emulated
> > by a hypervisor then all writes to MSI register will trap to hypervisor
> > in which case IPI injection via IMSIC is slow.
> >
> > The presence of "riscv,slow-ipi" DT property provides a hint to
> > driver that using IPIs through IMSIC is slow on this platform so
> > if there are other IPI mechanisms (such as SBI IPI calls) then
> > OS should prefer those mechanisms.
>
> If this is specific to implementation, why it is not included already in
> the compatible?
>
> The name is anyway too vague. What is "slow"? Describe real
> characteristics of hardware, e.g. trapped via hypervisor.

Okay, how about renaming it to "riscv,trap-n-emulated" ?

Alternately, we can add "riscv,soft-imsics" as an implementation
specific compatible string which hypervisors can use to describe
trap-n-emulated IMSICs. This "riscv,soft-imsics" can also replace
"vendor,chip-imsics" dummy string ?


> >
> >>
> >>> +
> >>> +  riscv,guest-index-bits:
> >>> +    minimum: 0
> >>> +    maximum: 7
> >>> +    description:
> >>> +      Specifies number of guest index bits in the MSI target address. When
> >>> +      not specified it is assumed to be 0.
> >>> +
> >>> +  riscv,hart-index-bits:
> >>> +    minimum: 0
> >>> +    maximum: 15
> >>> +    description:
> >>> +      Specifies number of HART index bits in the MSI target address. When
> >>> +      not specified it is estimated based on the interrupts-extended property.
> >>> +
> >>> +  riscv,group-index-bits:
> >>> +    minimum: 0
> >>> +    maximum: 7
> >>> +    description:
> >>> +      Specifies number of group index bits in the MSI target address. When
> >>> +      not specified it is assumed to be 0.
> >>
> >> Then default: 0.
> >
> > Okay, I will update.
> >
> >>
> >>> +
> >>> +  riscv,group-index-shift:
> >>> +    $ref: /schemas/types.yaml#/definitions/uint32
> >>> +    minimum: 24
> >>> +    maximum: 55
> >>> +    description:
> >>> +      Specifies the least significant bit of the group index bits in the
> >>
> >> Please drop everywhere "Specifies the" and instead just describe the
> >> hardware.
> >
> > Okay, I will update.
> >
> >>
> >>> +      MSI target address. When not specified it is assumed to be 24.
> >>> +
> >>> +additionalProperties: false
> >>
> >> unevaluatedProperties: false and drop all properties already described
> >> by other schemas.
> >
> > Okay, I will update.
> >
> >>
> >>> +
> >>> +required:
> >>> +  - compatible
> >>> +  - reg
> >>> +  - interrupt-controller
> >>> +  - msi-controller
> >>> +  - interrupts-extended
> >>> +  - riscv,num-ids
> >>> +
> >>> +examples:
> >>> +  - |
> >>> +    // Example 1 (Machine-level IMSIC files with just one group):
> >>> +
> >>> +    imsic_mlevel: interrupt-controller@24000000 {
> >>> +      compatible = "vendor,chip-imsics", "riscv,imsics";
> >>> +      interrupts-extended = <&cpu1_intc 11>,
> >>> +                            <&cpu2_intc 11>,
> >>> +                            <&cpu3_intc 11>,
> >>> +                            <&cpu4_intc 11>;
> >>> +      reg = <0x28000000 0x4000>;
> >>> +      interrupt-controller;
> >>> +      #interrupt-cells = <0>;
> >>> +      msi-controller;
> >>> +      riscv,num-ids = <127>;
> >>> +    };
> >>> +
> >>> +  - |
> >>> +    // Example 2 (Supervisor-level IMSIC files with two groups):
> >>> +
> >>> +    imsic_slevel: interrupt-controller@28000000 {
> >>> +      compatible = "vendor,chip-imsics", "riscv,imsics";
> >>
> >> Please run scripts/checkpatch.pl and fix reported warnings.
> >
> > I did not see any warnings with ./scripts/checkpatch.pl.
> >
> > Is there any parameter of checkpatch.pl which I should try ?
>
> You should see here or with your DTS warnings about undocumented vendor
> prefix.

Okay, I will check.

>
> Best regards,
> Krzysztof
>

Best Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
