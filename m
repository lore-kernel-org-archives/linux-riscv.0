Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5455C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:01:57 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7322F60E74
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:01:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7322F60E74
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CeJR1H7crHUHhTcDzq/Wzbg4T4LilMqDPyeZAA49P+c=; b=CgeqyZLTuwLv2W
	hETY3wZPGK166YEvuH7bQndgZg7Vg/fxy5gdt1yrhwX3pp4ggQuFr5/giS2BBa6ODXC5jvf3tc0Eb
	8EQ9Sy/PVbFJisAvmf7VOdOoBLci444Y5zKOXF2wB0OvpfclxFkz0VbObCV4XX4PVA/f3IcE0u1QR
	jRwPqCCle8VjdnktCBUm21BvT11qzk/fqsPA50yZxQq4af4OUtmrkLhSiWcJK8PnyOYbJBJ4m3+Pk
	5fsODk/vmd69EVc68nATyhCttZBSL1bMJksfk0XQIlU1RJEJkn/BwGFF6LP/RED8C64k3bKcGSTre
	VFhRMhkBIu5IKjN3/8Aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meZNw-00Dp01-Ki; Sun, 24 Oct 2021 09:01:44 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meZNt-00Doyu-7r
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 09:01:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9B1DC6101B
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 09:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635066100;
 bh=Q0VYQA2JvqZt+JhQWrv84zpC9usCOBda9SPMR0yD3sM=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=kthwDYUzOYXbfcLswBUxZUYLLbflQ6Bto4C3zpEKkQiLsfukoK0UAOEyC79dwrL2h
 vKa5m5RYFkFZe/slMwEzuksuCFMYJqu2K93ZYMeoYIhdroynkC5sHjJYMnrbGD1jR5
 3AWg/Nzx6JoHlWToUjz3fXLstCGBnnXt0S2PcuEG+W4uD1SRpquRc3Nx1QSGVkUOdL
 BUE1ErnQpyIQLfzVWdnicDz03HjzBYb7T1q2ut1oVXNOIvpewi2WtjGEfVJHSbHwvD
 lACjJiNC+RSrK0WdHHXQPeXnSqaePNgfJ5EBvbv1Hx32Xo9rXnmlAYWExG8W+X24+b
 63lNOlqSw2BCg==
Received: by mail-ua1-f47.google.com with SMTP id h4so16180273uaw.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 02:01:40 -0700 (PDT)
X-Gm-Message-State: AOAM5301eaiuJKRT+6ATpj9DyoMBpgJkXu+QRtII8c54sMH3Me305xp/
 G7eU/KHp7J/ufC1SV/63EyLlga+1vu5ac4FqxkI=
X-Google-Smtp-Source: ABdhPJwNFi8ldbIWIfgnw9DyrcJJh9mCHghrGexwLOyoqkF6ln85i546lFSABhn2q511h7JwOjKduhcm1QbCuQ78kR4=
X-Received: by 2002:a05:6102:c4d:: with SMTP id
 y13mr9744916vss.33.1635066099683; 
 Sun, 24 Oct 2021 02:01:39 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-3-guoren@kernel.org>
 <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
In-Reply-To: <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Oct 2021 17:01:28 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
Message-ID: <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: update riscv plic compatible string
To: Anup Patel <anup@brainfault.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_020141_387032_D44772EF 
X-CRM114-Status: GOOD (  24.91  )
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

On Sun, Oct 24, 2021 at 3:35 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, Oct 24, 2021 at 7:03 AM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > Add the compatible string "thead,c900-plic" to the riscv plic
> > bindings to support allwinner d1 SOC which contains c906 core.
> >
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Heiko Stuebner <heiko@sntech.de>
> > Cc: Rob Herring <robh@kernel.org>
> > Cc: Rob Herring <robh+dt@kernel.org>
> > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> >
> > ---
> >
> > Changes since V5:
> >  - Add DT list
> >  - Fixup compatible string
> >  - Remove allwinner-d1 compatible
> >  - make dt_binding_check
> >
> > Changes since V4:
> >  - Update description in errata style
> >  - Update enum suggested by Anup, Heiko, Samuel
> >
> > Changes since V3:
> >  - Rename "c9xx" to "c900"
> >  - Add thead,c900-plic in the description section
> > ---
> >  .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
> >  1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > index 08d5a57ce00f..18b97bfd7954 100644
> > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > @@ -35,6 +35,10 @@ description:
> >    contains a specific memory layout, which is documented in chapter 8 of the
> >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> >
> > +  The thead,c900-plic couldn't complete masked irq source which has been disabled in
> > +  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
> > +  problem by unmask/mask wrapper.
> > +
>
> This is an incomplete description about how T-HEAD PLIC is different from
> RISC-V PLIC.
>
> I would suggest the following:
>
> The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC specification
> which will mask current IRQ upon read to CLAIM register and will unmask the IRQ
> upon write to CLAIM register. The thead,c900-plic compatible string
> represents the
> custom T-HEAD PLIC specification.
The patch fixup the problem that when "thead,c900-plic" couldn't
complete masked irq source which has been disabled.

This patch is different from the last one in that there is no
relationship with the auto-mask feature.

>
> Regards,
> Anup
>
> >  maintainers:
> >    - Sagar Kadam <sagar.kadam@sifive.com>
> >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > @@ -42,11 +46,16 @@ maintainers:
> >
> >  properties:
> >    compatible:
> > -    items:
> > +   oneOf:
> > +    - items:
> >        - enum:
> > -          - sifive,fu540-c000-plic
> > -          - canaan,k210-plic
> > +        - sifive,fu540-c000-plic
> > +        - canaan,k210-plic
> >        - const: sifive,plic-1.0.0
> > +    - items:
> > +      - enum:
> > +        - allwinner,sun20i-d1-plic
> > +      - const: thead,c900-plic
> >
> >    reg:
> >      maxItems: 1
> > --
> > 2.25.1
> >



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
