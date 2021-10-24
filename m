Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05CE3C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 10:05:20 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80C5260FC3
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 10:05:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 80C5260FC3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=X/sZ9FePVo2eVvRyC3/gEiQCjhec4HOzAJB006wfNIU=; b=hOkyMNre1SfNO8
	Hh55lQfXqIiKiu3acXIjipphQeWkffvhRAMXa+X2gPpYN/4RyFYHaAvNvwhnAXOT7PZ+2oHD0oi1P
	P7qqGH0X3tI2WnGSoGUrRwvZ0ECFA4d2mMROzAmJ8nG24aLoCZqQLttrencaQkwUiiqt0wXJrVSAr
	Q7A5+cynDcc6HHIVk8q40kBYdtcO2bj+6PtZhBqeR9pwBeC2xDS8jG1jJX9SLq4jRKyNnuqs1YR5E
	UqxTstpGnstHGbSYrYbSskIDyvCSURiC19RinIP0mQgoXDB+p0lLboi71DZFdXBf+xCve5V2inJ+c
	uaf5amEzrRAenqSt6w2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meaNI-00Du2N-76; Sun, 24 Oct 2021 10:05:08 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meaNE-00Du23-NB
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 10:05:06 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D02A6101D
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 10:05:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635069904;
 bh=FouihXTAlUKDdV44bkvCaKVcaK2k/2Yt3weSyr3OdkI=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=ZYYdsyEdD/h6kbTezR2Kqj8G7aVGekAzhvT106t1EfHGSUvdcwrrTF5GXEGhQMLcl
 Xh18cq6CIs7gZ1CguX995qLVZy2w9yUVmhsNvujSLXpC7dSSVhp+rYT9VfewZscvuO
 Cgqz1syDL3mPRgK6U4PLFzkQFJDGVd1u3Z3YAqMhyGtm905UUf/rHmAGAYmkIRYUOz
 jPpUADncF2esXR6j1+CNJRmC5+ZpkHO1PyXgRRQmVMtFktzPFNNnh9GM0OZQLM6Vek
 fg/BNzWVQ0N94UiP6wFbabnBFhCfNKsg8+TPhKjEeRoDWWGCFns+24ZAW7SbSqNF4d
 9EloaIuWzKebA==
Received: by mail-ua1-f48.google.com with SMTP id e10so16319001uab.3
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 03:05:04 -0700 (PDT)
X-Gm-Message-State: AOAM531s6Rut2I0m0Crz1zdBFPk5D25EZwq4sCd5lnJFN4wyK30qrlfj
 CddJWIgcrqn8OtpyFEdnPWrp2rcCJq/RYPTP+js=
X-Google-Smtp-Source: ABdhPJyK+agFqTBGO/d+LZGb2WbJ2T363XhMw87qNPKQPhukoSKeca/pt31DkUHhGhQRqnoLsiFBHUfw5rEbl57dJ6E=
X-Received: by 2002:a67:fa93:: with SMTP id f19mr9721142vsq.43.1635069903168; 
 Sun, 24 Oct 2021 03:05:03 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-3-guoren@kernel.org>
 <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
 <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
 <CAAhSdy1FfMGPWBExEVe9Vdh2s_fNP43Rp7jNdEMNmP1nmPZL_Q@mail.gmail.com>
 <CAJF2gTTevdrtqphqtHDx1pmypwjUSG7fZz5Znr-iDNsn1QNu3Q@mail.gmail.com>
 <CAAhSdy1a8HH=n7obuAeeChfr2dVPDTWuLdCoTUE1d5Lud=vGMA@mail.gmail.com>
In-Reply-To: <CAAhSdy1a8HH=n7obuAeeChfr2dVPDTWuLdCoTUE1d5Lud=vGMA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 24 Oct 2021 18:04:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTS8Z+6Ewy0D5+0X_h2Jz4BqsJp7wEC5F0iNaDsSpiE2aw@mail.gmail.com>
Message-ID: <CAJF2gTS8Z+6Ewy0D5+0X_h2Jz4BqsJp7wEC5F0iNaDsSpiE2aw@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211024_030504_827496_0C18792F 
X-CRM114-Status: GOOD (  37.63  )
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

On Sun, Oct 24, 2021 at 5:53 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Sun, Oct 24, 2021 at 3:05 PM Guo Ren <guoren@kernel.org> wrote:
> >
> > On Sun, Oct 24, 2021 at 5:18 PM Anup Patel <anup@brainfault.org> wrote:
> > >
> > > On Sun, Oct 24, 2021 at 2:31 PM Guo Ren <guoren@kernel.org> wrote:
> > > >
> > > > On Sun, Oct 24, 2021 at 3:35 PM Anup Patel <anup@brainfault.org> wrote:
> > > > >
> > > > > On Sun, Oct 24, 2021 at 7:03 AM <guoren@kernel.org> wrote:
> > > > > >
> > > > > > From: Guo Ren <guoren@linux.alibaba.com>
> > > > > >
> > > > > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > > > > bindings to support allwinner d1 SOC which contains c906 core.
> > > > > >
> > > > > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > > > > Cc: Anup Patel <anup@brainfault.org>
> > > > > > Cc: Atish Patra <atish.patra@wdc.com>
> > > > > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > > > > Cc: Rob Herring <robh@kernel.org>
> > > > > > Cc: Rob Herring <robh+dt@kernel.org>
> > > > > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > > > > >
> > > > > > ---
> > > > > >
> > > > > > Changes since V5:
> > > > > >  - Add DT list
> > > > > >  - Fixup compatible string
> > > > > >  - Remove allwinner-d1 compatible
> > > > > >  - make dt_binding_check
> > > > > >
> > > > > > Changes since V4:
> > > > > >  - Update description in errata style
> > > > > >  - Update enum suggested by Anup, Heiko, Samuel
> > > > > >
> > > > > > Changes since V3:
> > > > > >  - Rename "c9xx" to "c900"
> > > > > >  - Add thead,c900-plic in the description section
> > > > > > ---
> > > > > >  .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
> > > > > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > > index 08d5a57ce00f..18b97bfd7954 100644
> > > > > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > > > > @@ -35,6 +35,10 @@ description:
> > > > > >    contains a specific memory layout, which is documented in chapter 8 of the
> > > > > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> > > > > >
> > > > > > +  The thead,c900-plic couldn't complete masked irq source which has been disabled in
> > > > > > +  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
> > > > > > +  problem by unmask/mask wrapper.
> > > > > > +
> > > > >
> > > > > This is an incomplete description about how T-HEAD PLIC is different from
> > > > > RISC-V PLIC.
> > > > >
> > > > > I would suggest the following:
> > > > >
> > > > > The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC specification
> > > > > which will mask current IRQ upon read to CLAIM register and will unmask the IRQ
> > > > > upon write to CLAIM register. The thead,c900-plic compatible string
> > > > > represents the
> > > > > custom T-HEAD PLIC specification.
> > > > The patch fixup the problem that when "thead,c900-plic" couldn't
> > > > complete masked irq source which has been disabled.
> > > >
> > > > This patch is different from the last one in that there is no
> > > > relationship with the auto-mask feature.
> > >
> > > This patch adds compatible string for T-HEAD PLIC so it
> > > should describe how T-HEAD PLIC is different from RISC-V
> > > PLIC. The DT bindings document describes HW and not
> > > the software work-around implemented using DT bindings.
> > >
> > > Your irqchip patch uses T-HEAD PLIC compatible string to
> > > implement a work-around.
> > >
> > > In other words, this patch is different from the irqchip patch.
> >
> > How about below:
> >
> > The thead,c900-plic compatible string represents the custom T-HEAD
> > PLIC specification.
> >  - It couldn't complete masked irq source which has been disabled in
> > enable register. Add thead_plic_chip which fix up c906-plic irq source
> > completion problem by unmask/mask wrapper.
>
> This first bullet is not required because it describes how it is used
> in irqchip driver to fix issues. This info has to go in your driver fix
> patch.
>
> >  - It implements a modified/custom T-HEAD PLIC specification which
> > will mask current IRQ upon read to CLAIM register and will unmask the
> > IRQ upon write to CLAIM register. But the feature wasn't utilized by
> > software.
>
> Please don't advertise non-compliance with RISC-V PLIC spec as feature.
>
> What I had suggest before seems better.
Okay, just put these in the description in the next version.

The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC
specification which will mask current IRQ upon read to CLAIM register
and will unmask the IRQ upon write to CLAIM register. The
thead,c900-plic compatible string represents the custom T-HEAD PLIC
specification.

>
> Regards,
> Anup
>
> >
> > >
> > > Regards,
> > > Anup
> > >
> > > >
> > > > >
> > > > > Regards,
> > > > > Anup
> > > > >
> > > > > >  maintainers:
> > > > > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > > > > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > > > > @@ -42,11 +46,16 @@ maintainers:
> > > > > >
> > > > > >  properties:
> > > > > >    compatible:
> > > > > > -    items:
> > > > > > +   oneOf:
> > > > > > +    - items:
> > > > > >        - enum:
> > > > > > -          - sifive,fu540-c000-plic
> > > > > > -          - canaan,k210-plic
> > > > > > +        - sifive,fu540-c000-plic
> > > > > > +        - canaan,k210-plic
> > > > > >        - const: sifive,plic-1.0.0
> > > > > > +    - items:
> > > > > > +      - enum:
> > > > > > +        - allwinner,sun20i-d1-plic
> > > > > > +      - const: thead,c900-plic
> > > > > >
> > > > > >    reg:
> > > > > >      maxItems: 1
> > > > > > --
> > > > > > 2.25.1
> > > > > >
> > > >
> > > >
> > > >
> > > > --
> > > > Best Regards
> > > >  Guo Ren
> > > >
> > > > ML: https://lore.kernel.org/linux-csky/
> >
> >
> >
> > --
> > Best Regards
> >  Guo Ren
> >
> > ML: https://lore.kernel.org/linux-csky/



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
