Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCAE7C43217
	for <linux-riscv@archiver.kernel.org>; Mon, 14 Nov 2022 12:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DUj9Gdi41sO9I/oHAZJmYA9VKTtm57V5vN5Gv/sPBBU=; b=AMVHmLR+TH/h20
	XAUe8HonjuCzmpcFRzU2RUTNay1gQZS9/Qskuczs3p2WI7mTJGm4b6rkpUI4vOfp8mWGKu9FlvlmY
	ha+5FZ8wK2uIVB7xVFcMizxNzgbAfpIkI6CAnboFC5ec5jQnf2ua8W9O/o/HQRP3yhU02Z5ZR/875
	dKM/R8TYKTIjTJsdJoKyUbUKVfd+ESCS3JwRXLH3t8nlrudfnY9rAeJMOchwpOdmsTC1vOy5Z8N3g
	HF03+hGexsu4RTbQTBz9WWKeB3UWGy42BF7KlFx/QYwfw4CmSv8G3Xm/4JqiPuRAlgPrCAPAnSCGM
	PVU+Fcwm4xMROoQn1lmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYEJ-000gAj-KT; Mon, 14 Nov 2022 12:06:23 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ouYEF-000g9M-4X
	for linux-riscv@lists.infradead.org; Mon, 14 Nov 2022 12:06:21 +0000
Received: by mail-ot1-x32d.google.com with SMTP id p27-20020a056830319b00b0066d7a348e20so2525019ots.8
        for <linux-riscv@lists.infradead.org>; Mon, 14 Nov 2022 04:06:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=og/e2Eou/izMkluwLnwneFuzlkFFZrxoD1Xdyluj2Rs=;
        b=Tu/PZxdw/+mm4ZktRLYKLiA9Hu/M1i4wGQdQXmWbA0tJt8hZ738NT8FZCrC6gr1eo7
         sv7lLnBm2n3LQZIXRbyD92cTeRb5nwxQSNxOZg7ZsQKsb5tw5xhVO1I5gE172uWBcGtc
         tc8rFdKCZx3DBKImVGLaJRBJM/FlQQivAt1H58OtHCGLVWpRqlt/C4STaWRDNE3satZo
         WLGk3ZeOYiFfqdJEryeqa1NRACKFU6WyoSUdinCMPQ7d2mD+DDN/yjrWb2ynabRqa6bx
         Z120CzrN6202NH+V8SxlOcDTp2a0698R4W2/b7JGrE1iRhqLwsYbydBR1aj8D8cAxhXz
         g/Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=og/e2Eou/izMkluwLnwneFuzlkFFZrxoD1Xdyluj2Rs=;
        b=UJ89OXdEyAOZ3nqcMTOFR8bRgFZ5iZzUnaqcZCbYhL2biExb2KYM7QGV+JKgzAIzBk
         DtZUDL6ck/8dzK95u2T/RPIzWaH/96QFfFZDo1clPo3/cCshXdoJkPkNbrzPaP1DUVdK
         LyNYq1o+sFJENPXTKh5n74CD00o1ARycWE1wYoAfuAWEONi0EzqdHpzeze1NhjNj/nGi
         9iEc2uJ0wltB7Qve6RKdLfoGjaDSTP6R+vps3hC1zik0O+B6NpgtnCfsIDoeG3A6/RQV
         NfHPpWkEqAmNCz1ZmzkBs/T2gSSrDS7FnybTl3kE+PnRk5u6WMc65ezdNPKhbF3PPLX1
         sk6Q==
X-Gm-Message-State: ANoB5pn43N7RDH/W0HeX3kGtU7kHVDYAw2rDl2mhxGeo9Qew5OOxrwbn
	W+e9gFdPbsf8tuzNjPAk4gOMF0RI91aRtqIrMGUczVHq+gE=
X-Google-Smtp-Source: AA0mqf6Wb/UyvNxWUkwL6xvvIIn5voMUTLF/yt0R462PqQATpPFm/H5JmUe6V/XFs4zwVzuTIMoP9FEkDHjCpmTJwWA=
X-Received: by 2002:a9d:3e4:0:b0:662:2458:3ef7 with SMTP id
 f91-20020a9d03e4000000b0066224583ef7mr6274414otf.150.1668427577193; Mon, 14
 Nov 2022 04:06:17 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-5-apatel@ventanamicro.com> <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
In-Reply-To: <9be58cb4-4ee8-a6e0-7a0a-f2f581e394d3@linaro.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Mon, 14 Nov 2022 17:36:06 +0530
Message-ID: <CAK9=C2X55CG6tjjiTPrecnnZZiwTOS1BSH3UTPa-fLBm38WdLA@mail.gmail.com>
Subject: Re: [PATCH 4/9] dt-bindings: Add RISC-V incoming MSI controller bindings
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, Anup Patel <anup@brainfault.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221114_040619_272660_43F78BDF 
X-CRM114-Status: GOOD (  47.84  )
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

On Mon, Nov 14, 2022 at 3:19 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 11/11/2022 05:42, Anup Patel wrote:
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
> There is no such vendor... As Conor pointed out, this does not look
> correct. Compatibles must be real and specific.

Previously, Rob had suggest to:
1) Mandate two compatible strings: one for implementation and
    and second for specification
2) Since this is new specification with QEMU being the only
    implementation, we add "vendor,chip-imsics" as dummy
    implementation specific string for DT schema checkers
    to pass the examples. Once we have an actual implementation,
   we will replace this dummy string.

Refer, https://www.spinics.net/lists/devicetree/msg442720.html

>
> > +      - const: riscv,imsics
> > +
> > +  reg:
> > +    minItems: 1
> > +    maxItems: 128
>
> Is there a DTS with 128 reg items?

Not at the moment since this is a new specification.

The value "128" is because maximum number of
IMSIC groups on an system with both IMSIC and
APLIC is 128 where each IMSIC group has a
separate base address. This is not a hard limit so
I am willing to drop it as well.

>
> > +    description:
> > +      Base address of each IMSIC group.
> > +
> > +  interrupt-controller: true
> > +
> > +  "#interrupt-cells":
> > +    const: 0
> > +
> > +  msi-controller: true
>
> You want then msi-controller.yaml schema and you can drop properties
> described there.

Okay, I will include msi-controller.yaml in the next revision.

>
> > +
> > +  interrupts-extended:
> > +    minItems: 1
> > +    maxItems: 32768
>
> I just wonder if you are not putting some random stuff here... just like
> this "vendor" company.
>
> 32768 inputs it is quite a big chip. Are you sure you have so many pins
> or internal connections?

The interrupts-extended property describes the association of IMSIC
interrupt files with the HARTs. If there are N HARTs then we will have
N entries in the interrupts-extended (just like the existing PLIC DT bindings).

For example, if the first entry points to HART1 and the second entry points
to HART0 then the first interrupt file is associated with HART1 and the
second interrupt file is associated with HART0.

Currently, the "maxItems" limit reflects the max IMSICs which an APLIC
domain can target on a system with both IMSIC and APLIC.

Actually, there is a typo here. The "maxItems" should be 16384 as-per
the frozen AIA specification. I will update "maxItems" accordingly in
next patch revision.

>
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
>
> Is this a property of software or hardware?

This is a property of hardware (or implementation) because IPIs
in IMSIC are software injected MSIs so if IMSIC is trap-n-emulated
by a hypervisor then all writes to MSI register will trap to hypervisor
in which case IPI injection via IMSIC is slow.

The presence of "riscv,slow-ipi" DT property provides a hint to
driver that using IPIs through IMSIC is slow on this platform so
if there are other IPI mechanisms (such as SBI IPI calls) then
OS should prefer those mechanisms.

>
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
>
> Then default: 0.

Okay, I will update.

>
> > +
> > +  riscv,group-index-shift:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    minimum: 24
> > +    maximum: 55
> > +    description:
> > +      Specifies the least significant bit of the group index bits in the
>
> Please drop everywhere "Specifies the" and instead just describe the
> hardware.

Okay, I will update.

>
> > +      MSI target address. When not specified it is assumed to be 24.
> > +
> > +additionalProperties: false
>
> unevaluatedProperties: false and drop all properties already described
> by other schemas.

Okay, I will update.

>
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
>
> Please run scripts/checkpatch.pl and fix reported warnings.

I did not see any warnings with ./scripts/checkpatch.pl.

Is there any parameter of checkpatch.pl which I should try ?

Best Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
