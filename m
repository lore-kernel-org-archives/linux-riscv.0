Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74C4CC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:53:24 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1E39C60EDF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:53:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1E39C60EDF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WdDgGTPqWqE+6tRYAO1Ws7Dl98XJvFjVcatSMnEkhCI=; b=tTjjLb06Wlhi8x
	xA9SUk+P99IUPb6eIl5bmG1sa8cHbz0p2nYqyZ8IGzx9PwenLIksCm41b5MCMbfGNHNN8mZTxu1/w
	xvC3WwGNOLj07X+NKG1U0UnVgKvqZy7SIisuTWMx7diba9M8qwaFe/sbQycnM9RWZuG2NSSsx1HuH
	tFP6gG2gCVgzlayF7SLZbKhTsOm/IUnZ7K6WK3lPfE3UbNZsVLFfK7jX6dSI+N4oqL/J7vhPdkP++
	ceO4s8QednnunyDTpma6w174uvxKZQJKPjYvB7JzLqFGG9EnJxFR0PGKn7LKQYjqz8nG6n68OLvCO
	omxiCyw9axAEAmflF6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meaBi-00Dsya-Eu; Sun, 24 Oct 2021 09:53:10 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meaBe-00Dsxp-Os
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 09:53:08 +0000
Received: by mail-wr1-x42c.google.com with SMTP id d10so2733881wrb.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 02:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nQpfaG9o4fwydQFIzNppD0NQtdsJN/Eps88GAzG6FPw=;
 b=EVhMHB2++I1P/KeQUhPQX78UmV5QQUhowepGg7D0jWyRgLr5mlKzAXPdEPFl4eB9aC
 jonjFpzKtCZjsfCHKS3kXtq1/XruenMquRXSa/Pk2ffjWbLu9czDCAPuvV3JrjURoiWD
 8VJaiB7bLwydhxEqlBoME4axkP5xzcp7yHCTqf+mSOUHlJsGYukCbxzpBNNIQ9eNzWr0
 zYe79zjHzPaVw8T2JtQPNuOAe9qLr/3H7ypXEu0TIVBm9UPxl4Hac+yY+BU8Oo1UcS2L
 0q/9VYXRGckMD8RBBWgzFMddncNunn9cyYaukYMERelDvsTOVRav/17F2rOqzJkAngHF
 wvqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nQpfaG9o4fwydQFIzNppD0NQtdsJN/Eps88GAzG6FPw=;
 b=bKv1KqZMAm2blU5T+o7thmrgC4r5ZJQa3Yh7iSdonzMySeZi2fH+VlRJZgPNT4hI2a
 SaRRnuCUjHa/fFeFrzsR35RYODYoJho//Fc72YYGPzRqpEY3jctwwLcfQzRXRNkfRM8d
 EG8LSIjNJyvI9XnqGIb5kMnsLQ0hdIkcVKgLEw49ryuRBa4X206nPAFfDxtyWDoi2RZ3
 S3LJ/+2AxxXDWlzzTbW2BI/gKhpI1Hw0Kn5GCNvxxtcMc7TCTXzCIUO8Ayee6yL22bVS
 ePfTNHJCs/xNvU7DmDa9ThRrH+ww6PdylAt6X5vupnH5Y2KJwwpf6uwphsiHwVXb88iL
 ti3Q==
X-Gm-Message-State: AOAM531dpB3kOriFyqpyK3czFRfsgR9ffCtBT5cd/Q+0DAxmBdVbil3u
 IaAWZ41xtzOXso05hzRPYq8CJxhUS6+EkU/fp96JFA==
X-Google-Smtp-Source: ABdhPJxyiHEa1Z5v0xjuuXAuvUXBpEWmPHdf8R8Da8sw+hrJr7Dawumy48Thz7fgxAGJfJKDSSHrmOmyOx6+YlgySR8=
X-Received: by 2002:adf:ce09:: with SMTP id p9mr14555779wrn.363.1635069184969; 
 Sun, 24 Oct 2021 02:53:04 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-3-guoren@kernel.org>
 <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
 <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
 <CAAhSdy1FfMGPWBExEVe9Vdh2s_fNP43Rp7jNdEMNmP1nmPZL_Q@mail.gmail.com>
 <CAJF2gTTevdrtqphqtHDx1pmypwjUSG7fZz5Znr-iDNsn1QNu3Q@mail.gmail.com>
In-Reply-To: <CAJF2gTTevdrtqphqtHDx1pmypwjUSG7fZz5Znr-iDNsn1QNu3Q@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Oct 2021 15:22:53 +0530
Message-ID: <CAAhSdy1a8HH=n7obuAeeChfr2dVPDTWuLdCoTUE1d5Lud=vGMA@mail.gmail.com>
Subject: Re: [PATCH V5 2/3] dt-bindings: update riscv plic compatible string
To: Guo Ren <guoren@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Marc Zyngier <maz@kernel.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Palmer Dabbelt <palmer@dabbelt.com>, 
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Rob Herring <robh@kernel.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmerdabbelt@google.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211024_025306_859641_6CDE875F 
X-CRM114-Status: GOOD (  34.67  )
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

On Sun, Oct 24, 2021 at 3:05 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Oct 24, 2021 at 5:18 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sun, Oct 24, 2021 at 2:31 PM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > On Sun, Oct 24, 2021 at 3:35 PM Anup Patel <anup@brainfault.org> wrote:
> > > >
> > > > On Sun, Oct 24, 2021 at 7:03 AM <guoren@kernel.org> wrote:
> > > > >
> > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > >
> > > > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > > > bindings to support allwinner d1 SOC which contains c906 core.
> > > > >
> > > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > > Cc: Anup Patel <anup@brainfault.org>
> > > > > Cc: Atish Patra <atish.patra@wdc.com>
> > > > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > > >
> > > > > ---
> > > > >
> > > > > Changes since V5:
> > > > >  - Add DT list
> > > > >  - Fixup compatible string
> > > > >  - Remove allwinner-d1 compatible
> > > > >  - make dt_binding_check
> > > > >
> > > > > Changes since V4:
> > > > >  - Update description in errata style
> > > > >  - Update enum suggested by Anup, Heiko, Samuel
> > > > >
> > > > > Changes since V3:
> > > > >  - Rename "c9xx" to "c900"
> > > > >  - Add thead,c900-plic in the description section
> > > > > ---
> > > > >  .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
> > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > index 08d5a57ce00f..18b97bfd7954 100644
> > > > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > @@ -35,6 +35,10 @@ description:
> > > > >    contains a specific memory layout, which is documented in chapter 8 of the
> > > > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> > > > >
> > > > > +  The thead,c900-plic couldn't complete masked irq source which has been disabled in
> > > > > +  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
> > > > > +  problem by unmask/mask wrapper.
> > > > > +
> > > >
> > > > This is an incomplete description about how T-HEAD PLIC is different from
> > > > RISC-V PLIC.
> > > >
> > > > I would suggest the following:
> > > >
> > > > The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC specification
> > > > which will mask current IRQ upon read to CLAIM register and will unmask the IRQ
> > > > upon write to CLAIM register. The thead,c900-plic compatible string
> > > > represents the
> > > > custom T-HEAD PLIC specification.
> > > The patch fixup the problem that when "thead,c900-plic" couldn't
> > > complete masked irq source which has been disabled.
> > >
> > > This patch is different from the last one in that there is no
> > > relationship with the auto-mask feature.
> >
> > This patch adds compatible string for T-HEAD PLIC so it
> > should describe how T-HEAD PLIC is different from RISC-V
> > PLIC. The DT bindings document describes HW and not
> > the software work-around implemented using DT bindings.
> >
> > Your irqchip patch uses T-HEAD PLIC compatible string to
> > implement a work-around.
> >
> > In other words, this patch is different from the irqchip patch.
>
> How about below:
>
> The thead,c900-plic compatible string represents the custom T-HEAD
> PLIC specification.
>  - It couldn't complete masked irq source which has been disabled in
> enable register. Add thead_plic_chip which fix up c906-plic irq source
> completion problem by unmask/mask wrapper.

This first bullet is not required because it describes how it is used
in irqchip driver to fix issues. This info has to go in your driver fix
patch.

>  - It implements a modified/custom T-HEAD PLIC specification which
> will mask current IRQ upon read to CLAIM register and will unmask the
> IRQ upon write to CLAIM register. But the feature wasn't utilized by
> software.

Please don't advertise non-compliance with RISC-V PLIC spec as feature.

What I had suggest before seems better.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > >
> > > >
> > > > Regards,
> > > > Anup
> > > >
> > > > >  maintainers:
> > > > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > > > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > > > @@ -42,11 +46,16 @@ maintainers:
> > > > >
> > > > >  properties:
> > > > >    compatible:
> > > > > -    items:
> > > > > +   oneOf:
> > > > > +    - items:
> > > > >        - enum:
> > > > > -          - sifive,fu540-c000-plic
> > > > > -          - canaan,k210-plic
> > > > > +        - sifive,fu540-c000-plic
> > > > > +        - canaan,k210-plic
> > > > >        - const: sifive,plic-1.0.0
> > > > > +    - items:
> > > > > +      - enum:
> > > > > +        - allwinner,sun20i-d1-plic
> > > > > +      - const: thead,c900-plic
> > > > >
> > > > >    reg:
> > > > >      maxItems: 1
> > > > > --
> > > > > 2.25.1
> > > > >
> > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
>
>
>
> --
> Best Regards
>  Guo Ren
>
> ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
