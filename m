Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 843B4C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 19:41:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wVhikkQyj59H2xirEMLsiXfcPoeP12lGazIse/j7zxg=; b=lLaQfpc8aUrv7G
	rpFRlQGWsXhCCmiWbJuNsA5pQSL8wYEJXQJ3ZmHaUoKB1p8Yh8aDGszXPvMwEj322w15dIpuB2lYx
	nHTlua4I6kNtKRbkNAKyveQb9Y6kTIw7T5ZCXsAvsryF6YPo6htWbKpXlF9kR2o8vQkcMP4dp8u14
	PGexv6TwFYQbQP/B8Y/0+DlGrDQbEZ7VmNrcMgVF5KbuhoQm76lmkQ+L+HjAulajfx1P9v4EfZiyD
	1kjofGHm+s2fPWQC1OzM6n4YUEXnpzOpNRr6muYKnWrFkLdaBcCZ5mvy02a7x9iraNuNjGdpCTnoH
	Z3JTvdcTDtEgs6L2IbEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfxP-004Biv-9H; Mon, 15 Aug 2022 19:41:03 +0000
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNfxL-004Bcb-OZ
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 19:41:01 +0000
Received: by mail-yw1-x112b.google.com with SMTP id 00721157ae682-31f661b3f89so98258067b3.11
        for <linux-riscv@lists.infradead.org>; Mon, 15 Aug 2022 12:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=kQ/IhR019ljA3X63/yMrUHDq4kWcLp+Cdb8xnxJdIe8=;
        b=JmDiztWPbZq81Psi3DSOmbF4xFuYHM/kwMW4YslCcRI7hsgm2Wu1dLgQfGdUe73420
         DrKRbbc7yoFQUhjiGBB3iKgOrMXp3DYGfdpfWnYmtQOYWru3ni92DgQWwNGtQQoFxkbx
         YXHwjctCq9bAaVbgcy+JMwLfms1rxJbT2ok2IdPBoZl5zlrNoypIv5IoIuuzLzhEUhXR
         LCYt8K9fCi/uyBtdi+kjQxmTzXHL80QtcAkg6pU9wYA7QL8Xq8dmV1MbVT1qLbQrgINb
         CQEuZxTSkgRyMiSKr+FVr0AEG2AD7JPkrmXIMOkaN48EO0xv5Evw0UHp46ZhZtWBRoqG
         HfNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=kQ/IhR019ljA3X63/yMrUHDq4kWcLp+Cdb8xnxJdIe8=;
        b=EVn3OcTcbmsI3kv3k65QI7Nm6eb0LTA1qoNL6ghpgd6/wTkocc0UOmBlPUI5yEGllJ
         JtuLsUK+QQOTDYqZf25HYMb4ILZuU4RyXCKKC7zoj7xAwr4aCwlLYPcsP1HK8Teu0IVE
         cETdAzkqn3gdXdNzWKs8w9Ipl6nsYpALAf1OUUheK8mZ7PF7x/ivxY2yqmv9fnvvQJnl
         Xh4vHdUZsxI389bcfRJ5OzXzbztP7LGdogTY1O0SzDmWQr2Tdp/aT14zJzBr08+nA8MB
         3F1f6IUIQZC97+HrGZk+38yNuUwWGRTciE0S9p6NTgRa7H1jDWsT7BhRC3egbXMBKkl+
         z0uQ==
X-Gm-Message-State: ACgBeo2YIyzK9IQcWdheRIy9hzihczLAtLAs/cBLBT3l75FhEb7QgRr7
	vtFthLjHO69UeHzaIIe/yRhfr3nngtDp+Zpjhis=
X-Google-Smtp-Source: AA6agR4uS+P3maNGKYHw+fLkUXC5gJLnyocxV5/qKNpiP36yndjwPPhByTnKKGwIMes2mnwF9ZlvObWDTZg1BbkpLd4=
X-Received: by 2002:a0d:d60f:0:b0:325:1853:2b with SMTP id y15-20020a0dd60f000000b003251853002bmr14178469ywd.24.1660592457358;
 Mon, 15 Aug 2022 12:40:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220815151451.23293-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20220815151451.23293-4-prabhakar.mahadev-lad.rj@bp.renesas.com> <57e17d1e-e809-065e-831f-cdd3a8602e0a@microchip.com>
In-Reply-To: <57e17d1e-e809-065e-831f-cdd3a8602e0a@microchip.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Mon, 15 Aug 2022 20:40:30 +0100
Message-ID: <CA+V-a8vDP8k9c8VM++68uKjQLGURC=pe571+QrmPb+tBo0j7Jw@mail.gmail.com>
Subject: Re: [PATCH v2 3/8] dt-bindings: soc: renesas: renesas.yaml: Document
 Renesas RZ/Five SoC
To: Conor.Dooley@microchip.com
Cc: "Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Anup Patel <anup@brainfault.org>, Linux-Renesas <linux-renesas-soc@vger.kernel.org>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, linux-riscv <linux-riscv@lists.infradead.org>, 
	LKML <linux-kernel@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_124059_858530_9BCE9556 
X-CRM114-Status: GOOD (  19.89  )
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

Hi Conor,

Thank you for the review.

On Mon, Aug 15, 2022 at 8:14 PM <Conor.Dooley@microchip.com> wrote:
>
> On 15/08/2022 16:14, Lad Prabhakar wrote:
> > dt-bindings: soc: renesas: renesas.yaml: Document Renesas RZ/Five SoC
>
> Hey Lad,
>
> Maybe I am missing something on the arm side, but "soc"?
> Was the intent to move this to Documentation/devicetree/bindings/soc
> but you moved it back to arm by accident?
>
Ouch I sent out the older version of my patch for this. I did actually
send out a patch which moves arm renesas.yaml to the soc folder.

Cheers,
Prabhakar

> Thanks,
> Conor.
>
>
> > EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> >
> > Document Renesas RZ/Five (R9A07G043) SoC.
> >
> > More info about RZ/Five SoC:
> > https://www.renesas.com/us/en/products/microcontrollers-microprocessors/rz-mpus/rzfive-risc-v-general-purpose-microprocessors-risc-v-cpu-core-andes-ax45mp-single-10-ghz-2ch-gigabit-ethernet
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2
> > * New patch
> > ---
> >  Documentation/devicetree/bindings/arm/renesas.yaml | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/arm/renesas.yaml b/Documentation/devicetree/bindings/arm/renesas.yaml
> > index ff80152f092f..233847eb23fd 100644
> > --- a/Documentation/devicetree/bindings/arm/renesas.yaml
> > +++ b/Documentation/devicetree/bindings/arm/renesas.yaml
> > @@ -415,11 +415,12 @@ properties:
> >                - renesas,rzn1d400-db # RZN1D-DB (RZ/N1D Demo Board for the RZ/N1D 400 pins package)
> >            - const: renesas,r9a06g032
> >
> > -      - description: RZ/G2UL (R9A07G043)
> > +      - description: RZ/Five and RZ/G2UL (R9A07G043)
> >          items:
> >            - enum:
> >                - renesas,smarc-evk # SMARC EVK
> >            - enum:
> > +              - renesas,r9a07g043f01 # RZ/Five (RISC-V core)
> >                - renesas,r9a07g043u11 # RZ/G2UL Type-1
> >                - renesas,r9a07g043u12 # RZ/G2UL Type-2
> >            - const: renesas,r9a07g043
> > --
> > 2.25.1
> >
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
