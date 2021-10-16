Return-Path: <SRS0=v6lb=PE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8262AC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 12:57:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2EED060C4B
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Oct 2021 12:57:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2EED060C4B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SWx1s7ohkaXK4MihMn2eyNOUnnqHfNTF+V6fE2tazKk=; b=tUTAEMC1qH1Zxv
	qQbnUbVBNS1QQruCJz9GrAEDrS4ePTVSP8TuROkMpJLh4jRnMMqm6nhKAoozo1wXsI4KKEpH9WcjN
	+k9jWGL2gEZQ9dzFWiUCyJyfpkbZp+oR81/QQcOfe61LdpAKgPRkr7JlscTmjGYBlOqaj8jdRUZko
	Rd1aytViMfC8EBMBd2Xu/S7Sd/cmBv+AQO01hRQeDc+eXVe62FanrpghOVUg7O5C21hTK4kx2bkFe
	E1pzPIdQFV9ASEZICotmPqPvKnFsmnXenbjwsU0FHnPwfMYu5c8uVeoiPxDJqBdkiwvM6z+J1ZPUp
	X9pKBlRKsqb5dOLvFy4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbjFK-00AbuJ-PL; Sat, 16 Oct 2021 12:57:06 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbjFH-00Abtq-W9
 for linux-riscv@lists.infradead.org; Sat, 16 Oct 2021 12:57:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3A3BD61101
 for <linux-riscv@lists.infradead.org>; Sat, 16 Oct 2021 12:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1634389023;
 bh=NsinonKH119OjwifjZy82GsiqQzJfczn0ZJZxIQqkGQ=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=XeiaRhr3wF7EzNe4FIC+GtRX7tvl7cBWvk560//gRZqKY4ASIGOng+wRLQ0SOY/6F
 /XV9L6EH5L+f9X+7EzVfjunNkXPMutK+Y/Z/xBGSV2hf5CmTKBc6zkJjD1LpPC8TIo
 a2j6ePFvhAXeLQdtCARYZ3WzXvgvCzRXB6NDR8f2yFtmD/eio3BfOjkO+od390vzhs
 nQw/s0d/OEwD9qe2VDv0ayntCHIB+zUPHZLPJMBkZQ+tXh/3RoFo66NxSIh8t5MRyk
 SrOsbK3XAC3yKdXcHBqe50NjFhKuhnzS9fOBr2Sw6ojGYrluRpC9fOr9Fm0PME8L47
 1nLPeAVCFR32w==
Received: by mail-ua1-f51.google.com with SMTP id e10so1078164uab.3
 for <linux-riscv@lists.infradead.org>; Sat, 16 Oct 2021 05:57:03 -0700 (PDT)
X-Gm-Message-State: AOAM531ffOHgumq6dDVb3U9QBGuzhL/v2AHCe/iUCS1Uiidzxk2bi+dz
 BNMr7B+Txqh/K/HYHfBe2/JejsSx4/I6xwLVOY8=
X-Google-Smtp-Source: ABdhPJyYmy9I1jJUAIFP49csFzkTWJzf9NeB+lBd1HnG0jVFKArnzAC1PQl3HeHqdbMJJMM348S0sICXFBUlMYIkjsk=
X-Received: by 2002:a05:6102:32cd:: with SMTP id
 o13mr19996599vss.50.1634389022294; 
 Sat, 16 Oct 2021 05:57:02 -0700 (PDT)
MIME-Version: 1.0
References: <20211016032200.2869998-1-guoren@kernel.org>
 <20211016032200.2869998-3-guoren@kernel.org>
 <2216787.nSqPeTNalD@phil>
In-Reply-To: <2216787.nSqPeTNalD@phil>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 16 Oct 2021 20:56:51 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQKc1DGcCy_sFjSs8p+VMNGHFrjO2uLZrHnjdD1pZ2RZg@mail.gmail.com>
Message-ID: <CAJF2gTQKc1DGcCy_sFjSs8p+VMNGHFrjO2uLZrHnjdD1pZ2RZg@mail.gmail.com>
Subject: Re: [PATCH V4 2/3] dt-bindings: update riscv plic compatible string
To: Heiko Stuebner <heiko@sntech.de>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Rob Herring <robh@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211016_055704_126261_B07C6F76 
X-CRM114-Status: GOOD (  25.68  )
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

On Sat, Oct 16, 2021 at 6:35 PM Heiko Stuebner <heiko@sntech.de> wrote:
>
> Hi Guo,
>
> Am Samstag, 16. Oktober 2021, 05:21:59 CEST schrieb guoren@kernel.org:
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add the compatible string "thead,c900-plic" to the riscv plic
> > bindings to support allwinner d1 SOC which contains c906 core.
>
> The compatible strings sound good now, but some things below
>
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atish.patra@wdc.com>
> >
> > ---
> >
> > Changes since V4:
> >  - Update description in errata style
> >  - Update enum suggested by Anup, Heiko, Samuel
> >
> > Changes since V3:
> >  - Rename "c9xx" to "c900"
> >  - Add thead,c900-plic in the description section
> > ---
> >  .../interrupt-controller/sifive,plic-1.0.0.yaml       | 11 ++++++++++-
> >  1 file changed, 10 insertions(+), 1 deletion(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > index 08d5a57ce00f..272f29540135 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > @@ -35,6 +35,12 @@ description:
> >    contains a specific memory layout, which is documented in chapter 8 of the
> >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> >
> > +  The C9xx PLIC does not comply with the interrupt claim/completion process defined
> > +  by the RISC-V PLIC specification because C9xx PLIC will mask an IRQ when it is
> > +  claimed by PLIC driver (i.e. readl(claim) and the IRQ will be unmasked upon
> > +  completion by PLIC driver (i.e. writel(claim). This behaviour breaks the handling
> > +  of IRQS_ONESHOT by the generic handle_fasteoi_irq() used in the PLIC driver.
> > +
> >  maintainers:
> >    - Sagar Kadam <sagar.kadam@sifive.com>
> >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > @@ -46,7 +52,10 @@ properties:
> >        - enum:
> >            - sifive,fu540-c000-plic
> >            - canaan,k210-plic
> > -      - const: sifive,plic-1.0.0
> > +      - enmu:
>
>         ^ spelling enum
>
> > +          - sifive,plic-1.0.0
> > +          - thead,c900-plic
> > +          - allwinner,sun20i-d1-plic
>
> but in general I'd think that you want something like
>
>   compatible:
>     oneOf:
>       - items:
>           - enum:
>               - sifive,fu540-c000-plic
>               - canaan,k210-plic
>           - const: sifive,plic-1.0.0
>       - items:
>           - enum:
>               - allwinner,sun20i-d1-plic
>           - const: thead,c900-plic
>
> Having only one item list would allow as valid combinations like
> "sifive,fu540-c000-plic", "thead,c900-plic" when checking the schema.
>
> With the oneOf and separate lists we can make sure that such
> "illegal" combinations get flagged by the dtbs_check
>
> [the enum with the single allwinner entry already leaves
>  room for later addition to the c900-plic variant]
Thx, I'll fix it in the next version.

another question: Is the allwinner_sun20i_d1_plic needed to IRQCHIP_DECLARE?

+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", thead_c900_plic_init);
+IRQCHIP_DECLARE(allwinner_sun20i_d1_plic, "allwinner,sun20i-d1-plic",
thead_c900_plic_init);

>
> Heiko

>
>
>


--
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
