Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3192CC3DA7A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Jan 2023 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vcGe3WqwOXzE3VLP3iHOlE5xOkKAcktmqYkQq8wcZsk=; b=XoL6jGan8RldVk
	b3VRc7zxKhVb9ccDz187HmVW8mOI/v8ZtrdsnpBN/eSNsjKw1xZfXtF1G8MYukT+YfzCp7qCDnpLt
	Ul809zHhoq55QgKpKrLiqdwxseewp3p8SK076bh8nyV+n9Jb+4dDkIb07dvntJfbmNAGEAZLYdMHg
	l5LhRDltZ0V+rk38PeivogTkGBJohK2+VdR9Vj18VzVGfMbH41p1LMQOdOOCuKoFWtrqznjfPwDff
	g8cXp4zsNVkbM4QmDqU1peaMOlt+n9PiatmgLDcKNjz6fuASv/5MDVK9A2y/z9ghDkREpg7+zSUF9
	ujwpnUUK2tUPNzGC0LEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCO28-00CsC0-QV; Mon, 02 Jan 2023 16:51:32 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCO1f-00Cs12-IJ
	for linux-riscv@lists.infradead.org; Mon, 02 Jan 2023 16:51:08 +0000
Received: by mail-ej1-x62e.google.com with SMTP id gh17so67809845ejb.6
        for <linux-riscv@lists.infradead.org>; Mon, 02 Jan 2023 08:51:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Fz5XKty1bGWzTgMdRfuqQ/JzAqvCNClq4tW8DRBWnFM=;
        b=geBvjeXV1ZKZXEGQ679wIPmLmr4bJJC3ogIccCGJwmP37nQajWF4xabENZhe1D2qcl
         BtzUgXfcQVGJ3dQwKj1BTT57gdnm8JWrDF/skiXTxllsaqPvhvgBR2Yw5j6D4tAVt4xu
         M7tk5pZ10nHxpZmGprCNJRK4NZBwcC5FiaEjHYWKz0xP/8FpAhEEwO5k/lrMxebTR15z
         CkJdSx7IMMe2fS/PloFI5UR4+3THa8slwkz80jcIDq3FIKrC1g2c4a9FSdioi01TjAyR
         Mdm2thfnBiiZZE6LhMiy71+hluu/xL4XugkSjpxfXy6yxxmK0gZN2L4eiWE05BHQgcjf
         0AhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Fz5XKty1bGWzTgMdRfuqQ/JzAqvCNClq4tW8DRBWnFM=;
        b=Eap8TSS68dkCprNA39rj1I3UWbfjJfevuQG2PcUmGHhyRRkX9Spigk8Q/BiMVnvAyL
         X9RR9g0afBjiCtQeH3GxuLfvfohuZMvexZ9rJ+M366Y88iRp15IriQGuqxpQWaZBUjfd
         0f/ivYGL8m2R1jWmrHSjKSRy5ev8d/soay7ImcZ7ERYEibWPIO83OWTIXi+1oUwGFYcb
         Na77hjoe5S0uAku3NKDy+gXhl8QncB+hQKRR5p9D5k4RXbg+U/aluGYQD8qFvtJXNuhd
         wQdM17tarjXknJinuzkHWpbdyqWMSTTWJk0WXPJTeDnoavWK5sZmpOFS7nLmAVJ+7tnk
         r3Cw==
X-Gm-Message-State: AFqh2krfJ9o1UeD7Rihg8vBMp5alURLvPL/hfMEbzh91nOD76FCZvBD5
	I8gQvYZAnUO5Av1lH+XngrG7k58xB/wWu0OFUyDniw==
X-Google-Smtp-Source: AMrXdXuvrIBtLF2vV2Ytg4fEMIMLSY8mHIn5GlyCPTYTEsGfYkCd2GvolLXDpImkaIk6wKFf7QU0Tpb+cgiVO1eoGHo=
X-Received: by 2002:a17:906:e095:b0:7c0:a880:dc71 with SMTP id
 gh21-20020a170906e09500b007c0a880dc71mr4239097ejb.705.1672678259591; Mon, 02
 Jan 2023 08:50:59 -0800 (PST)
MIME-Version: 1.0
References: <20221111044207.1478350-1-apatel@ventanamicro.com>
 <20221111044207.1478350-7-apatel@ventanamicro.com> <Y3EQ4JU7uGbIMGiW@spud>
In-Reply-To: <Y3EQ4JU7uGbIMGiW@spud>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 2 Jan 2023 22:20:48 +0530
Message-ID: <CAAhSdy2UAMmX+W5Cm3DuTJzZ0jJ3=CW4PhjctQNdfeS+4hqWqg@mail.gmail.com>
Subject: Re: [PATCH 6/9] dt-bindings: Add RISC-V advanced PLIC bindings
To: Conor Dooley <conor@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Atish Patra <atishp@atishpatra.org>, 
	Alistair Francis <Alistair.Francis@wdc.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230102_085103_663130_B624F95F 
X-CRM114-Status: GOOD (  37.53  )
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

On Sun, Nov 13, 2022 at 9:14 PM Conor Dooley <conor@kernel.org> wrote:
>
> Hey Anup,
>
> Ditto the $subject nit here.

Adding "interrupt-controller:" to subject makes it longer than 80 characters.

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
>
> Typo: Advanced

Okay, I will update.

>
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description:
> > +  The RISC-V advanced interrupt architecture (AIA) defines advanced platform
>                                                              ^
> Missing an article here?

Okay, I will update.

>
> > +  level interrupt controller (APLIC) for handling wired interrupts in a
> > +  RISC-V platform. The RISC-V AIA specification can be found at
> > +  https://github.com/riscv/riscv-aia.
> > +
> > +  The RISC-V APLIC is implemented as hierarchical APLIC domains where all
> > +  interrupt sources connect to the root domain which can further delegate
> > +  interrupts to child domains. We have one device tree node for each APLIC
>
> While I am nitpicking, s/We have/There is/ ?

Okay, I will update.

>
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
>
> Same comment here about the validity of this placeholder.

Okay, I will add "riscv,qemu-aplic" as QEMU specific compatible string.

>
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
>                                                    ^
> Missing indefinite article here (and in msi-parent)?
>
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
>
> This mutual exclusion can be represented, can't it?
> IIRC it is some sort of oneOf thing, somewhat like below:
> oneOf:
>   - required:
>       - msi-parent
>   - required:
>       - interrupts-extended
>
> AFAIR from doing the i2c ocores binding, this will force the addition of
> one, but not both, to a node.
>
> Or is this not actually mutually exclusive & the msi-parent property is
> permitted but just left unused if interrupts-extended is present?

If both are present then interrupts-extended is preferred.

>
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
> > +    description:
> > +      This property represents a interrupt delegation list where each entry
> > +      is a triple consisting of child APLIC domain phandle, first interrupt
> > +      number, and last interrupt number. The firmware will configure interrupt
> > +      delegation registers based on interrupt delegation list.
>
> What is the inter dependence of the children and delegate?
> Is it valid to have a delegate property without children?
> Can the firmware delegate interrupts without the delegation list, based
> on the children property alone? Or is it effectively useless without a
> children property?

Both properties convey different information. The "riscv,childen" describes
the association of child indexes with child APLIC domains whereas the
"riscv,delegate" describes the interrupt delegation to few of the child
APLIC domains.


>
> In your examples, the second has msi-parent but neither of these custom
> properties. Do the children/delegate properties have a meaning in the
> msi-parent case?

The "riscv,childern" and "riscv,delegate" are only useful when we have
hierarchy of multiple APLIC domains. The second example only has
one APLIC domain hence these custom properties are absent.

>
> I think the binding should enforce whatever dependency exists there.
> Thanks,
> Conor.
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
