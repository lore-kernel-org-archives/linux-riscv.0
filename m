Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61A7CCA47F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Jul 2022 18:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VcQkkbC9INKNKx3ARjOvNykQLTGzqdR81BmZKH6zI8M=; b=oy3d4BwoLdtmoM
	yRhfy9DhKx3FCfF3uBOlfsS9hGxvaVyhQKpkHlzqLRBkoofc0AB6RsBTL+7U7Lt/5Bdy29rNo0RC7
	zMaVVotQ/8BFYPlkdI3QSOmf4EAFrLc1gVe16sMWCIFitz2HcpT9pHTPMK7zOsPJLreMlH5HZMAe9
	+rtfM7tce0rsOkM5xTj7HkI8Oq4tyNfBJzyvI+ccYQpRRI3FpVwQ3giE3D1lFi+UqNiR5Y2mXjscJ
	87koXoi05YMJ+RCfaQkWlDvyhusw1ZMnetuVWizi24dbv5z4/gDHJcXSqi+aw/cXESL1B37qxWfjG
	0Ip+nOAVKWwtgnJs7tIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBKTm-00Dgsg-9Z; Tue, 12 Jul 2022 18:19:26 +0000
Received: from mail-io1-f41.google.com ([209.85.166.41])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBKTi-00Dgqk-H7
	for linux-riscv@lists.infradead.org; Tue, 12 Jul 2022 18:19:24 +0000
Received: by mail-io1-f41.google.com with SMTP id h200so8662108iof.9
        for <linux-riscv@lists.infradead.org>; Tue, 12 Jul 2022 11:19:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Wcp64K5PVliSn3UzjvTNUpS1fkGlfk4O82lLCf8rw9U=;
        b=Bx0JaM8twR9piTadvUJLMV02XJJj4TxzAurYRLNRoUy52fA1LxZCf4T5i0vFr/rJvh
         /wj00tHWa5fOmo/3IASf02lSpmrosI4TU0uwyuT67bjU71uIq5fjMPvUhuLgDmBs5WaB
         T5dNEQZMA3YI/JPGHJoCrM1ff4jew9hcRABzG+YsdEppbXZLazkkzA9kvZkwDYw61+0A
         6px5jRlK8Hc4iRnUwjmeAPZWV2iHm/tuP2gR5VkbF8OrKlV73S57t47IHoU0HkUKopHP
         dl/10YOkUMrhLXkpVKC+Wi0BTtU39lqjLfj6gL0gPjuYirl/XD+VtzWA1HWIqLmWLqjb
         Ip0Q==
X-Gm-Message-State: AJIora9sMGsmZb1GrHiF3QNyHzLRmKtw0RpqIqkeOn2H/NUO7shOS8yR
	FrXHAOvw/ZYjB57pqCg/sA==
X-Google-Smtp-Source: AGRyM1ueRBOx0x21LlqhraF76MncQ1Zco5/yhr5wSySTaOk3txyA4FFBNJfRj9DjZGKcWXykYk4BUw==
X-Received: by 2002:a05:6638:349e:b0:33f:4322:d9cd with SMTP id t30-20020a056638349e00b0033f4322d9cdmr10073664jal.296.1657649958940;
        Tue, 12 Jul 2022 11:19:18 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n8-20020a02a188000000b0033f51b3b0d9sm3098773jah.138.2022.07.12.11.19.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Jul 2022 11:19:18 -0700 (PDT)
Received: (nullmailer pid 2130848 invoked by uid 1000);
	Tue, 12 Jul 2022 18:19:16 -0000
Date: Tue, 12 Jul 2022 12:19:16 -0600
From: Rob Herring <robh@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>, Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
Message-ID: <20220712181916.GI1823936-robh@kernel.org>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220605142333.GA3439339-robh@kernel.org>
 <CA+V-a8smk8TqyWpm1KXo-3dKnCAodKsiYsaqnK_3ubfXE9YauQ@mail.gmail.com>
 <20220706215827.GA572635-robh@kernel.org>
 <87a69lmesa.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <87a69lmesa.wl-maz@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220712_111922_590923_2DC96FA6 
X-CRM114-Status: GOOD (  39.59  )
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

On Thu, Jul 07, 2022 at 10:51:33AM +0100, Marc Zyngier wrote:
> On Wed, 06 Jul 2022 22:58:27 +0100,
> Rob Herring <robh@kernel.org> wrote:
> > 
> > On Fri, Jun 24, 2022 at 10:59:40AM +0100, Lad, Prabhakar wrote:
> > > Hi Rob,
> > > 
> > > Thank you for the review.
> > > 
> > > On Sun, Jun 5, 2022 at 3:23 PM Rob Herring <robh@kernel.org> wrote:
> > > >
> > > > On Tue, May 24, 2022 at 06:22:13PM +0100, Lad Prabhakar wrote:
> > > > > Document Renesas RZ/Five (R9A07G043) SoC.
> > > > >
> > > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > > > ---
> > > > >  .../sifive,plic-1.0.0.yaml                    | 38 +++++++++++++++++--
> > > > >  1 file changed, 35 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > index 27092c6a86c4..78ff31cb63e5 100644
> > > > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > @@ -28,7 +28,10 @@ description:
> > > > >
> > > > >    While the PLIC supports both edge-triggered and level-triggered interrupts,
> > > > >    interrupt handlers are oblivious to this distinction and therefore it is not
> > > > > -  specified in the PLIC device-tree binding.
> > > > > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> > > > > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> > > > > +  to specify the interrupt type as the flow for EDGE interrupts is different
> > > > > +  compared to LEVEL interrupts.
> > > > >
> > > > >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> > > > >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > > > > @@ -57,6 +60,7 @@ properties:
> > > > >            - enum:
> > > > >                - allwinner,sun20i-d1-plic
> > > > >            - const: thead,c900-plic
> > > > > +      - const: renesas-r9a07g043-plic
> > 
> > Also, this should be 'renesas,r9...'
> > 
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > > @@ -64,8 +68,7 @@ properties:
> > > > >    '#address-cells':
> > > > >      const: 0
> > > > >
> > > > > -  '#interrupt-cells':
> > > > > -    const: 1
> > > > > +  '#interrupt-cells': true
> > > > >
> > > > >    interrupt-controller: true
> > > > >
> > > > > @@ -91,6 +94,35 @@ required:
> > > > >    - interrupts-extended
> > > > >    - riscv,ndev
> > > > >
> > > > > +if:
> > > > > +  properties:
> > > > > +    compatible:
> > > > > +      contains:
> > > > > +        const: renesas-r9a07g043-plic
> > > > > +then:
> > > > > +  properties:
> > > > > +    clocks:
> > > > > +      maxItems: 1
> > > > > +
> > > > > +    resets:
> > > > > +      maxItems: 1
> > > > > +
> > > > > +    power-domains:
> > > > > +      maxItems: 1
> > > >
> > > > Did you test this? The above properties won't be allowed because of
> > > > additionalProperties below. You need to change it to
> > > > 'unevaluatedProperties' or move these to the top level.
> > > >
> > > Yes I have run the dt_binding check.
> > > 
> > > So with the below diff it does complain about the missing properties.
> > > 
> > > prasmi@prasmi:~/work/renasas/renesas-drivers$ git diff
> > > Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > index 20ded037d444..bb14a4b1ec0a 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > @@ -130,7 +130,7 @@ examples:
> > >      plic: interrupt-controller@c000000 {
> > >        #address-cells = <0>;
> > >        #interrupt-cells = <1>;
> > > -      compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> > > +      compatible = "renesas-r9a07g043-plic";
> > >        interrupt-controller;
> > >        interrupts-extended = <&cpu0_intc 11>,
> > >                              <&cpu1_intc 11>, <&cpu1_intc 9>,
> > > prasmi@prasmi:~/work/renasas/renesas-drivers$ make ARCH=riscv
> > > CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check
> > >   LINT    Documentation/devicetree/bindings
> > >   CHKDT   Documentation/devicetree/bindings/processed-schema.json
> > >   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
> > >   DTEX    Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dts
> > >   DTC     Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
> > >   CHECK   Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> > > interrupt-controller@c000000: #interrupt-cells:0:0: 2 was expected
> > >     From schema:
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> > > interrupt-controller@c000000: 'clocks' is a required property
> > >     From schema:
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> > > interrupt-controller@c000000: 'resets' is a required property
> > >     From schema:
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> > > interrupt-controller@c000000: 'power-domains' is a required property
> > >     From schema:
> > > /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > prasmi@prasmi:~/work/renasas/renesas-drivers$
> > > prasmi@prasmi:~/work/renasas/renesas-drivers$
> > > 
> > > Is there something I'm missing here?
> > 
> > You've said these properties are required, but you didn't add them.
> > 
> > If you don't have the above 3 properties, then it's not going to 
> > complain that they are present. But it will when you do add them for the 
> > reason I gave.
> 
> Can you please have a look at the latest instance[1][2] of this
> series, as posted by Samuel? I've provisionally queued it, but only on
> the provision that you would eventually ack these patches.

I did already[1]. They passed checks, were already in linux-next, and I 
didn't see anything major needing comments, so I marked it N/A (meaning 
someone else applies it) without comment.

Rob

[1] https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20220630100241.35233-2-samuel@sholland.org/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
