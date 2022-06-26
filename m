Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F52AC43334
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Jun 2022 00:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4pkNQPJLzbLg75+fnxR63hD7xYJszm8w2B8QdGqEbrU=; b=5FPFaKcOQ6lUi8
	wZiCyoQN/FlqpnNzQTZUKvWc6DV/v2dKtkrm7r4ycmDwpGbsFZxsWUaQ9UxD6lhO5QhA1bGIyfv+i
	5ppdntU+I8GzlGl+R3mVOyIRXu7wmEsRbxtN/Dw8t21jcrlMbMSCQ9mzomied3TKJQ/9beCxVtyOW
	qhq8evWdR3HirYIVGUZCokahWq9u9ButOLQuOpb73GmknO4MiD4rIsXY8xfpNiH5tWTqxt6ogBIqz
	oQJeXwuNKlkNfJPVTUpaW3sTV99hMWa3xWB6yDXyUVg0NiIZ76GERjA+zulFTBOsRfmfEIivlN4f4
	Id5MpQ+3LdoVC7mVZduA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GCH-008gWJ-EL; Sun, 26 Jun 2022 00:32:17 +0000
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o5GCE-008gVO-O1
	for linux-riscv@lists.infradead.org; Sun, 26 Jun 2022 00:32:16 +0000
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-317741c86fdso55800917b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 25 Jun 2022 17:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=x9dPmWk2Vcw5sGKQ49PZ7QnGrzXJQOQ3Dx2Y9NtzjQg=;
        b=lLgAYtOYAcDJV6WG8taYMcRcJgrDX7mnUZxRRfVfw77nR1dpFb1rHbU3r9osill1Bw
         QZfsMAesvlQKGf8xzF4RnWgzV2nWei44Sa/MAG7YB3JFIfMfGLt+VIgu8PnLefwAtYBH
         a0ZdOLnqBVC2s6eQDWdGWyIRbOW3EsbLv3sZpUe8nVE58C73f+ykIXZNdgu2DYR9y/NG
         R18lMh9D7EOLS2gN0FREe7NKB6QrRvhgQPCWqy+9EcnvIU5sFL2bTkMELFuTMqk4tiHA
         vkWYYbJNxiudH9k2hILeN2pUffbjC03qSthLw/LdqLgFK8vCDoO9KtsU/4rV3i17fRsh
         6Diw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=x9dPmWk2Vcw5sGKQ49PZ7QnGrzXJQOQ3Dx2Y9NtzjQg=;
        b=kGxRjMaZaQ8+W/QiPIjT40i9A3LwRkkaKnM3HkO29Hk4C42F+bQcnyo4/1PMs06YjY
         mpKQS20ZuH5ekrhIS6FCpJ2ROR1O3MF9QDmAo0Q9C2nAnyAABIe0NQqSWXV0bHmJoVla
         WkUkYoTDHS7eQF48I9pvn9lw4UU1BG8Ss6i9Ur/YlMXSUyOdV0+7ADtQ98JiOHVYTU20
         /hcvMRXVfVp1FyYPVmTczsQXQUpzPfryQzw6itlgOpswO0cVbNbLjrPyX7xuzM2z6rDu
         xa14Z725ha5xRYiiMI534EYHYekNgNtBOlxHBY8Bj4mSKcwsAdbk8AwLngGqpX1Y7BaY
         VX8A==
X-Gm-Message-State: AJIora+UmuJ7JY6hrXRmiMhPgLnpUkZzJmQy3sjUZMfykEpb1bmHjzAx
	l6B4A2e2I95tG6YHgDbJBeOpyHP/pDfNxQAU7dE=
X-Google-Smtp-Source: AGRyM1s9Z6oCZdo0CcI/aqlgYtTw/kdgWgE65i+E+vrZEo2FOOR0vzAoiCRXPiSQh0BSSpjHOnpAUis1/lMql2BJa+0=
X-Received: by 2002:a81:989:0:b0:318:38c3:ade0 with SMTP id
 131-20020a810989000000b0031838c3ade0mr7367936ywj.292.1656203532980; Sat, 25
 Jun 2022 17:32:12 -0700 (PDT)
MIME-Version: 1.0
References: <20220624180311.3007-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220624180311.3007-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <59c043a4-dd40-1f6b-69d2-bc32b970e874@linaro.org>
In-Reply-To: <59c043a4-dd40-1f6b-69d2-bc32b970e874@linaro.org>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Sun, 26 Jun 2022 01:31:46 +0100
Message-ID: <CA+V-a8s3oD+n+o5KGXW4p5FJZspo8DpZhDypLYSoN5OPJgt4tQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: interrupt-controller: sifive,plic:
 Document Renesas RZ/Five SoC
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Sagar Kadam <sagar.kadam@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	linux-riscv <linux-riscv@lists.infradead.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220625_173214_844523_B5F16A74 
X-CRM114-Status: GOOD (  23.09  )
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

Hi Krzysztof,

Thank you for the review.

On Sat, Jun 25, 2022 at 9:01 PM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:
>
> On 24/06/2022 20:03, Lad Prabhakar wrote:
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > RFC->v1:
> > * Fixed Review comments pointed by Geert and Rob
> > ---
> >  .../sifive,plic-1.0.0.yaml                    | 40 +++++++++++++++++--
> >  1 file changed, 36 insertions(+), 4 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > index 27092c6a86c4..5eebe0b01b4d 100644
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
> > +      - const: renesas,r9a07g043-plic
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
> > @@ -91,7 +94,36 @@ required:
> >    - interrupts-extended
> >    - riscv,ndev
> >
> > -additionalProperties: false
> > +if:
>
> Make it inside allOf. Avoids further indentation change on next variant.
>
Agreed.

> > +  properties:
> > +    compatible:
> > +      contains:
> > +        const: renesas,r9a07g043-plic
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
> > +unevaluatedProperties: false
>
>
> This does not look correct, why changing additional->unevaluated here?
>
Agreed will drop this.

Cheers,
Prabhakar

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
