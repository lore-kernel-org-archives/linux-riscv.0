Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6944C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Jun 2022 10:00:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KuuwVsRa/hD3VXD/IDF5v4sl04Y4gBNAc4U6glj7L/Q=; b=VZEX23iJuAWOb2
	3prz7zCef2jvU9K/kanaQdomr0pJkiJ+IKrVTky8SW0J92qakUJOeuEE/Grw/EX/4BZLmT9PCB5Nk
	+U7HHdudR1TSxdc42V1WNF7cGI7aQ/i25oskl3kacmEQi8Doar/IhC+R6Am6BEzafbHDZACB74YOE
	BK6SI21bhZ6+9fLJhkyHeltcfTBl+eS5Grv0uGWul+m/t2AXJP3HmzwE+d85ezhD9CICcXJo4X/vD
	ZSpBouvl8sHPWdt/9swNtM6VpWW8oUCMgyXC17rp0kfKPGQDDJ5kiUTSt4fS/suExgrSYrPrqPaWn
	rko9mdIplMl8CwhPvuFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g6o-001acC-0I; Fri, 24 Jun 2022 10:00:14 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o4g6l-001aaz-Ao
	for linux-riscv@lists.infradead.org; Fri, 24 Jun 2022 10:00:12 +0000
Received: by mail-yb1-xb33.google.com with SMTP id i15so3701792ybp.1
        for <linux-riscv@lists.infradead.org>; Fri, 24 Jun 2022 03:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=naacGnwFVI2XIwy985in6Vo6kcKveQxxT4YcXRz3t2g=;
        b=qTLL1e/OmEF57ZzeFNoJTrSXTfcgLGd3V0zVHMQ/Or4PHjrPqyapiSxc0WXfXC8zNo
         Lq4mvf+uMBjmOtK5od+0mnNbQiXeST0s09Xv+9UAhKaztMhjgPWINCG2SqUWviTwb5Rh
         A+lc0OqyWWMVlQ1UbVjhIcL5AeM3BquyK7peuR4G+mMh5eRz1e+U2EVy+1C+TK8Tj8Ml
         F8+LyA+Hgd6mUe00NcpwIFJn2vZL5+H1S61eTXf1/+uSCrA8E0sR6bDWXQsskgWV5V8i
         sma97m3T9VSQ6NFCHscUr7dqR07+UzbAeHzSI9zs0oILWR+QCMt5Q4gBJsweaj7XpCl3
         ovxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=naacGnwFVI2XIwy985in6Vo6kcKveQxxT4YcXRz3t2g=;
        b=rUy5vfd4z83dM41WwPqe5l6/bwgP1ICjfjwaS7z1LQclMNRgeGdroF53mabOLQAmxU
         gJO3HTlyPqdm6U/qCzfnMgwXtAPON5VTgU1l+FtByB6GaLGcLjCVcyT9dquL3XWoPkr/
         ardNdtNnWmnaUj0wHhkhDEs79jre/+qsfdsJxLmDkIwIL4HlyS1rUHX5VrImxISLM8ho
         bvVVcmKtIMOvZWnYMqnwOe3UknA1r2WvpgcU2jN20giqwFygfRH+JljVEvwmfgSX58M+
         i52JJHF08xeHjIpn0Xs+gjQDhPG7PrFS3ocHtw/lcWNk1bC1RqWXPsg0NzA1g/uQQ2ZT
         6Scw==
X-Gm-Message-State: AJIora9kh28YdZDu84wrzN82+MpAs8pYciR6FL7IaCrX4EoTRvj/WFf8
	OY8ke30lg4ckzul/GxUJWDVjcixkSL3qGLrqQLAwRAJ5CbULxw==
X-Google-Smtp-Source: AGRyM1s5rIVdpDbuAlUIVf1/orDfdYSOoUJm6XY19sO/OwVRoYkjjJCQ1uzMT6xuXsG2Uwq7nLXbA/RpZ4sNnhctOSA=
X-Received: by 2002:a05:6902:1407:b0:64a:ecc7:aa2 with SMTP id
 z7-20020a056902140700b0064aecc70aa2mr14513281ybu.645.1656064806840; Fri, 24
 Jun 2022 03:00:06 -0700 (PDT)
MIME-Version: 1.0
References: <20220524172214.5104-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220524172214.5104-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <20220605142333.GA3439339-robh@kernel.org>
In-Reply-To: <20220605142333.GA3439339-robh@kernel.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 24 Jun 2022 10:59:40 +0100
Message-ID: <CA+V-a8smk8TqyWpm1KXo-3dKnCAodKsiYsaqnK_3ubfXE9YauQ@mail.gmail.com>
Subject: Re: [PATCH RFC 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
To: Rob Herring <robh@kernel.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sagar Kadam <sagar.kadam@sifive.com>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, LKML <linux-kernel@vger.kernel.org>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	Phil Edworthy <phil.edworthy@renesas.com>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220624_030011_459557_15C88317 
X-CRM114-Status: GOOD (  26.11  )
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

Hi Rob,

Thank you for the review.

On Sun, Jun 5, 2022 at 3:23 PM Rob Herring <robh@kernel.org> wrote:
>
> On Tue, May 24, 2022 at 06:22:13PM +0100, Lad Prabhakar wrote:
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> >  .../sifive,plic-1.0.0.yaml                    | 38 +++++++++++++++++--
> >  1 file changed, 35 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > index 27092c6a86c4..78ff31cb63e5 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > @@ -28,7 +28,10 @@ description:
> >
> >    While the PLIC supports both edge-triggered and level-triggered interrupts,
> >    interrupt handlers are oblivious to this distinction and therefore it is not
> > -  specified in the PLIC device-tree binding.
> > +  specified in the PLIC device-tree binding for SiFive PLIC (and similar PLIC's),
> > +  but for the Renesas RZ/Five Soc (AX45MP AndesCore) which has NCEPLIC100 we need
> > +  to specify the interrupt type as the flow for EDGE interrupts is different
> > +  compared to LEVEL interrupts.
> >
> >    While the RISC-V ISA doesn't specify a memory layout for the PLIC, the
> >    "sifive,plic-1.0.0" device is a concrete implementation of the PLIC that
> > @@ -57,6 +60,7 @@ properties:
> >            - enum:
> >                - allwinner,sun20i-d1-plic
> >            - const: thead,c900-plic
> > +      - const: renesas-r9a07g043-plic
> >
> >    reg:
> >      maxItems: 1
> > @@ -64,8 +68,7 @@ properties:
> >    '#address-cells':
> >      const: 0
> >
> > -  '#interrupt-cells':
> > -    const: 1
> > +  '#interrupt-cells': true
> >
> >    interrupt-controller: true
> >
> > @@ -91,6 +94,35 @@ required:
> >    - interrupts-extended
> >    - riscv,ndev
> >
> > +if:
> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: renesas-r9a07g043-plic
> > +then:
> > +  properties:
> > +    clocks:
> > +      maxItems: 1
> > +
> > +    resets:
> > +      maxItems: 1
> > +
> > +    power-domains:
> > +      maxItems: 1
>
> Did you test this? The above properties won't be allowed because of
> additionalProperties below. You need to change it to
> 'unevaluatedProperties' or move these to the top level.
>
Yes I have run the dt_binding check.

So with the below diff it does complain about the missing properties.

prasmi@prasmi:~/work/renasas/renesas-drivers$ git diff
Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
index 20ded037d444..bb14a4b1ec0a 100644
--- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
+++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
@@ -130,7 +130,7 @@ examples:
     plic: interrupt-controller@c000000 {
       #address-cells = <0>;
       #interrupt-cells = <1>;
-      compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
+      compatible = "renesas-r9a07g043-plic";
       interrupt-controller;
       interrupts-extended = <&cpu0_intc 11>,
                             <&cpu1_intc 11>, <&cpu1_intc 9>,
prasmi@prasmi:~/work/renasas/renesas-drivers$ make ARCH=riscv
CROSS_COMPILE=riscv64-linux-gnu- dt_binding_check
  LINT    Documentation/devicetree/bindings
  CHKDT   Documentation/devicetree/bindings/processed-schema.json
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  DTEX    Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dts
  DTC     Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
  CHECK   Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
interrupt-controller@c000000: #interrupt-cells:0:0: 2 was expected
    From schema:
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
interrupt-controller@c000000: 'clocks' is a required property
    From schema:
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
interrupt-controller@c000000: 'resets' is a required property
    From schema:
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.example.dtb:
interrupt-controller@c000000: 'power-domains' is a required property
    From schema:
/home/prasmi/work/renasas/renesas-drivers/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
prasmi@prasmi:~/work/renasas/renesas-drivers$
prasmi@prasmi:~/work/renasas/renesas-drivers$

Is there something I'm missing here?

Cheers,
Prabhakar

> > +
> > +    '#interrupt-cells':
> > +      const: 2
> > +
> > +  required:
> > +    - clocks
> > +    - resets
> > +    - power-domains
> > +
> > +else:
> > +  properties:
> > +    '#interrupt-cells':
> > +      const: 1
> > +
> >  additionalProperties: false
> >
> >  examples:
> > --
> > 2.25.1
> >
> >

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
