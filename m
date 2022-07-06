Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B145C43334
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Jul 2022 21:58:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bc53bzktA4O8HfPyPePaqjwps7L937kwpbFe45OSw2I=; b=VXFxvJuHv+2imd
	YsRo9yKX4XS0qDqBJNkfJW1TGr19l88XZswWZT27yMg2xCUVfIasw7++357HrofcfhiyfcQ137BU2
	gl7q6hOUQGwRGVfIV1l5BkgqWEg8LdhWxy30xKpORrwvfqrmzpclYCVkYNmynzIg5Eru6owOB0ViM
	69jO580u8CYHNiyIOXgwf3cgVPDkiLGXZLKu6eYEeX3EZSAi0/0mYlCNUzu9weRX9mJuJhF+u1puU
	NtGtnF/pf8y6NKqdelNYXtYq3TON5DO7cIMQ6/GEkWPSQb3ZEFclbbRaC937jhsqsw7rsSFtNahFB
	WdAiOs1kqKrErnVf/mGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9D2b-00CVwF-65; Wed, 06 Jul 2022 21:58:37 +0000
Received: from mail-io1-f42.google.com ([209.85.166.42])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o9D2Y-00CVvf-Br
	for linux-riscv@lists.infradead.org; Wed, 06 Jul 2022 21:58:35 +0000
Received: by mail-io1-f42.google.com with SMTP id r133so15240919iod.3
        for <linux-riscv@lists.infradead.org>; Wed, 06 Jul 2022 14:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=UYaDr7d26s8biv8YaCbEXuacx3Q+wp2527oG6nWNU9E=;
        b=OHkxUJ1xTyEDQ9K4To5Si5nIe+V2RvWnr622IKahvNPOqt2QekNQFpxodfCtZrDR6Z
         OqETyhZhSzm49Hl5v1611odAQOLVBZVnC3iqdAYlDCebqVzj4vmTp+aBCPCTNZzB4joJ
         1Xgd0sX14WFZwdF9byCGtS3Y1qRhqEI3Ihuox8sYPkzl1ProJQMsYh1DoGUdh8gZv0ab
         Hrh9zpZZfABJIC3tNTABKspL8j0OvnybxC1hb5NOzKxl/nvEGpmmh3uxXCm/fy3WEPmZ
         Q8Y1zQ1z9X3yTxNsSN8pDDx9D/fcMAl1Tn5rgobs5Mb7Wdi3rPg+WrSBolSTcWDnul+X
         52KA==
X-Gm-Message-State: AJIora9pr/lSwu7hBB3+VCqCVo4xx2wj8nfgtSR7yWwH0Eak3EDcVSMg
	ga2TO5/wXnGoKkIv5ly54Q==
X-Google-Smtp-Source: AGRyM1vUlh94A8twuxVlm4r5lh9uafeyxCm23L1h08nw+H2f7Mz48dXfQbrhuQSNCUD13+4OWEKeCA==
X-Received: by 2002:a6b:6a07:0:b0:66a:2e5f:2058 with SMTP id x7-20020a6b6a07000000b0066a2e5f2058mr21955569iog.72.1657144712836;
        Wed, 06 Jul 2022 14:58:32 -0700 (PDT)
Received: from robh.at.kernel.org ([172.58.139.118])
        by smtp.gmail.com with ESMTPSA id w6-20020a92d2c6000000b002dc377df3ecsm776355ilg.45.2022.07.06.14.58.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Jul 2022 14:58:32 -0700 (PDT)
Received: (nullmailer pid 607027 invoked by uid 1000);
	Wed, 06 Jul 2022 21:58:27 -0000
Date: Wed, 6 Jul 2022 15:58:27 -0600
From: Rob Herring <robh@kernel.org>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
Message-ID: <20220706215827.GA572635-robh@kernel.org>
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220605142333.GA3439339-robh@kernel.org>
 <CA+V-a8smk8TqyWpm1KXo-3dKnCAodKsiYsaqnK_3ubfXE9YauQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CA+V-a8smk8TqyWpm1KXo-3dKnCAodKsiYsaqnK_3ubfXE9YauQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220706_145834_443732_DE0FF890 
X-CRM114-Status: GOOD (  32.01  )
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

On Fri, Jun 24, 2022 at 10:59:40AM +0100, Lad, Prabhakar wrote:
> Hi Rob,
> 
> Thank you for the review.
> 
> On Sun, Jun 5, 2022 at 3:23 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Tue, May 24, 2022 at 06:22:13PM +0100, Lad Prabhakar wrote:
> > > Document Renesas RZ/Five (R9A07G043) SoC.
> > >
> > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > ---
> > >  .../sifive,plic-1.0.0.yaml                    | 38 +++++++++++++++++--
> > >  1 file changed, 35 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > index 27092c6a86c4..78ff31cb63e5 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > @@ -28,7 +28,10 @@ description:
> > >
> > >    While the PLIC supports both edge-triggered and level-triggered interrupts,
> > >    interrupt handlers are oblivious to this distinction and therefore it is not
> > > -  specified in the PLIC device-tree binding.
> > > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> > > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> > > +  to specify the interrupt type as the flow for EDGE interrupts is different
> > > +  compared to LEVEL interrupts.
> > >
> > >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> > >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > > @@ -57,6 +60,7 @@ properties:
> > >            - enum:
> > >                - allwinner,sun20i-d1-plic
> > >            - const: thead,c900-plic
> > > +      - const: renesas-r9a07g043-plic

Also, this should be 'renesas,r9...'

> > >
> > >    reg:
> > >      maxItems: 1
> > > @@ -64,8 +68,7 @@ properties:
> > >    '#address-cells':
> > >      const: 0
> > >
> > > -  '#interrupt-cells':
> > > -    const: 1
> > > +  '#interrupt-cells': true
> > >
> > >    interrupt-controller: true
> > >
> > > @@ -91,6 +94,35 @@ required:
> > >    - interrupts-extended
> > >    - riscv,ndev
> > >
> > > +if:
> > > +  properties:
> > > +    compatible:
> > > +      contains:
> > > +        const: renesas-r9a07g043-plic
> > > +then:
> > > +  properties:
> > > +    clocks:
> > > +      maxItems: 1
> > > +
> > > +    resets:
> > > +      maxItems: 1
> > > +
> > > +    power-domains:
> > > +      maxItems: 1
> >
> > Did you test this? The above properties won't be allowed because of
> > additionalProperties below. You need to change it to
> > 'unevaluatedProperties' or move these to the top level.
> >
> Yes I have run the dt_binding check.
> 
> So with the below diff it does complain about the missing properties.
> 
> prasmi@prasmi:~/work/renasas/renesas-drivers$ git diff
> Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> index 20ded037d444..bb14a4b1ec0a 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> @@ -130,7 +130,7 @@ examples:
>      plic: interrupt-controller@c000000 {
>        #address-cells = <0>;
>        #interrupt-cells = <1>;
> -      compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
> +      compatible = "renesas-r9a07g043-plic";
>        interrupt-controller;
>        interrupts-extended = <&cpu0_intc 11>,
>                              <&cpu1_intc 11>, <&cpu1_intc 9>,
> prasmi@prasmi:~/work/renasas/renesas-drivers$ make ARCH=riscv
> CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check
>   LINT    Documentation/devicetree/bindings
>   CHKDT   Documentation/devicetree/bindings/processed-schema.json
>   SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>   DTEX    Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dts
>   DTC     Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
>   CHECK   Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> interrupt-controller@c000000: #interrupt-cells:0:0: 2 was expected
>     From schema:
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> interrupt-controller@c000000: 'clocks' is a required property
>     From schema:
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> interrupt-controller@c000000: 'resets' is a required property
>     From schema:
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
> interrupt-controller@c000000: 'power-domains' is a required property
>     From schema:
> /home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> prasmi@prasmi:~/work/renasas/renesas-drivers$
> prasmi@prasmi:~/work/renasas/renesas-drivers$
> 
> Is there something I'm missing here?

You've said these properties are required, but you didn't add them.

If you don't have the above 3 properties, then it's not going to 
complain that they are present. But it will when you do add them for the 
reason I gave.

Rob

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
