Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03B60C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:19:06 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A721160F57
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 09:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A721160F57
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lQ8Mbyue82G9/dpPUkRH6eETSm/A6Fv3jMDHSt3jGz0=; b=dBrI7HNt40dDql
	p+uoBuIBuN4T/AasqEKAVI7ysZpAVJLiekRNxcQFBtQjztdiReMCwr3dhF5AGUXMwOeWkZfgvZlyh
	WNkJlSv1QJOzNY3IC+wsfW6Gac/DPF77i131OccMrJOpbhR5utoyzXn99XU8sdySlEr3SGtho6zYy
	FF/sVLC4sQe5XKt6wlVltmeqeWmJhjwUDtoH3lDRaeiUohJlSyX5STK7/fZn8KgvRAUdRF5ktINQs
	GW9fo8sLCiOZ457daubQ2SMs8h7fJf4OswjptO9IqVnsvGA9+Gdk9wG0w+1gue/4AFYeVEZLF6/eU
	3K5rjQylYfa1wCRTepVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meZeY-00Dq0p-Np; Sun, 24 Oct 2021 09:18:54 +0000
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meZeV-00Dpzs-OE
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 09:18:53 +0000
Received: by mail-wm1-x334.google.com with SMTP id p21so7514440wmq.1
 for <linux-riscv@lists.infradead.org>; Sun, 24 Oct 2021 02:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ZgyiV7a56jcfc4Zgoz6RZ06xgGpfIBQ1EcTEps9MZjg=;
 b=XKSV0mMdPBwyMtpoB+nMYnoMrQWo7jtJYxcm9fM447tgOmbpzq2q1uBMTJ6OCoqJsa
 xUaNmOpA6PXlO5DIHHercncaA7oEyh/taIXVaw9rhbaccLMFTbX/Ei+55vl1/xWraSW8
 iHxKtOzpHQaJIsXtzifgJd67lg3/C7/WbYhGJLUwcoAqEJnp96yfLaRXYOKDYdExgWKj
 BOa3XPKe+0LaX8JPO8BjVK1KVaQAF+265jypGC5JHayXfgy23HJyUqyrg2p6pU9ssjDz
 bmygz1sfZtTKR7XjStPG5terbAPdKGJnGJ2nOx1jp3H01BUhYyEpKImZ8hMDC0UWei/U
 QpYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ZgyiV7a56jcfc4Zgoz6RZ06xgGpfIBQ1EcTEps9MZjg=;
 b=RE5HBmU7pdrf3prjAJZLTQSJRvqKXuQ6cd5CJa4BNmkIO1sZroKTfeJYly1E79Eh48
 xTtmbn2zhV17Ikig9y+9FfuDK1HsYVQw2x+K0eWIiPKFVtTL7llcZ3yCDSiOn1sOMBEv
 1LieEJKEpMdv747+0TmILEFqadDzPgX+/0Qo3HWq6nGPuVReYMKWAdShTbPv8h+GRX4/
 xl3zKkUN+0dpo3u3Dmj4Z5nOKxM50Ev+S5dQ/zM5zF+3jGJ9FzVSpU+HVeapwM9dtnu6
 JRzCkPswJAiT8Khnh2YPmIqcLTzyJLtSELnLRuAm2gOr51BeD/X5C/8lmhxLLR6YwjGc
 HO5Q==
X-Gm-Message-State: AOAM533mzibDcKlyWy64p8Yk1Y5/NjYJoljI8By11/vqVaf1Dbkq5iMS
 CKbNv8LIuY9O04hTTDlV8B2CAdI1hO2pgeH33X2fOQ==
X-Google-Smtp-Source: ABdhPJxdU+4zeuFzfRihPM9WedFMwnx5jYQEiDfGFR2NApNSgsTeKpCU8nbwhdPVkMLvdUDFBZDWn1zlnN+yOpiVVf0=
X-Received: by 2002:a1c:7918:: with SMTP id l24mr11879021wme.137.1635067129520; 
 Sun, 24 Oct 2021 02:18:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211024013303.3499461-1-guoren@kernel.org>
 <20211024013303.3499461-3-guoren@kernel.org>
 <CAAhSdy2a2XgjOpezoq=SvX2XTcAWhceKF9X9v3z7xyO9Z4DMPQ@mail.gmail.com>
 <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
In-Reply-To: <CAJF2gTTKJXY6DAq=-ajAiTEY7hpMT1bqnvNndW=5EnD5EEP-cw@mail.gmail.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 24 Oct 2021 14:48:38 +0530
Message-ID: <CAAhSdy1FfMGPWBExEVe9Vdh2s_fNP43Rp7jNdEMNmP1nmPZL_Q@mail.gmail.com>
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
X-CRM114-CacheID: sfid-20211024_021851_875316_6B5944A3 
X-CRM114-Status: GOOD (  27.52  )
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

On Sun, Oct 24, 2021 at 2:31 PM Guo Ren <guoren@kernel.org> wrote:
>
> On Sun, Oct 24, 2021 at 3:35 PM Anup Patel <anup@brainfault.org> wrote:
> >
> > On Sun, Oct 24, 2021 at 7:03 AM <guoren@kernel.org> wrote:
> > >
> > > From: Guo Ren <guoren@linux.alibaba.com>
> > >
> > > Add the compatible string "thead,c900-plic" to the riscv plic
> > > bindings to support allwinner d1 SOC which contains c906 core.
> > >
> > > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> > > Cc: Anup Patel <anup@brainfault.org>
> > > Cc: Atish Patra <atish.patra@wdc.com>
> > > Cc: Heiko Stuebner <heiko@sntech.de>
> > > Cc: Rob Herring <robh@kernel.org>
> > > Cc: Rob Herring <robh+dt@kernel.org>
> > > Cc: Palmer Dabbelt <palmerdabbelt@google.com>
> > >
> > > ---
> > >
> > > Changes since V5:
> > >  - Add DT list
> > >  - Fixup compatible string
> > >  - Remove allwinner-d1 compatible
> > >  - make dt_binding_check
> > >
> > > Changes since V4:
> > >  - Update description in errata style
> > >  - Update enum suggested by Anup, Heiko, Samuel
> > >
> > > Changes since V3:
> > >  - Rename "c9xx" to "c900"
> > >  - Add thead,c900-plic in the description section
> > > ---
> > >  .../interrupt-controller/sifive,plic-1.0.0.yaml   | 15 ++++++++++++---
> > >  1 file changed, 12 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > index 08d5a57ce00f..18b97bfd7954 100644
> > > --- a/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > +++ b/Documentation/devicetree/bindings/interrupt-controller/sifive,plic-1.0.0.yaml
> > > @@ -35,6 +35,10 @@ description:
> > >    contains a specific memory layout, which is documented in chapter 8 of the
> > >    SiFive U5 Coreplex Series Manual <https://static.dev.sifive.com/U54-MC-RVCoreIP.pdf>.
> > >
> > > +  The thead,c900-plic couldn't complete masked irq source which has been disabled in
> > > +  enable register. Add thead_plic_chip which fix up c906-plic irq source completion
> > > +  problem by unmask/mask wrapper.
> > > +
> >
> > This is an incomplete description about how T-HEAD PLIC is different from
> > RISC-V PLIC.
> >
> > I would suggest the following:
> >
> > The T-HEAD C9xx SoC implements a modified/custom T-HEAD PLIC specification
> > which will mask current IRQ upon read to CLAIM register and will unmask the IRQ
> > upon write to CLAIM register. The thead,c900-plic compatible string
> > represents the
> > custom T-HEAD PLIC specification.
> The patch fixup the problem that when "thead,c900-plic" couldn't
> complete masked irq source which has been disabled.
>
> This patch is different from the last one in that there is no
> relationship with the auto-mask feature.

This patch adds compatible string for T-HEAD PLIC so it
should describe how T-HEAD PLIC is different from RISC-V
PLIC. The DT bindings document describes HW and not
the software work-around implemented using DT bindings.

Your irqchip patch uses T-HEAD PLIC compatible string to
implement a work-around.

In other words, this patch is different from the irqchip patch.

Regards,
Anup

>
> >
> > Regards,
> > Anup
> >
> > >  maintainers:
> > >    - Sagar Kadam <sagar.kadam@sifive.com>
> > >    - Paul Walmsley  <paul.walmsley@sifive.com>
> > > @@ -42,11 +46,16 @@ maintainers:
> > >
> > >  properties:
> > >    compatible:
> > > -    items:
> > > +   oneOf:
> > > +    - items:
> > >        - enum:
> > > -          - sifive,fu540-c000-plic
> > > -          - canaan,k210-plic
> > > +        - sifive,fu540-c000-plic
> > > +        - canaan,k210-plic
> > >        - const: sifive,plic-1.0.0
> > > +    - items:
> > > +      - enum:
> > > +        - allwinner,sun20i-d1-plic
> > > +      - const: thead,c900-plic
> > >
> > >    reg:
> > >      maxItems: 1
> > > --
> > > 2.25.1
> > >
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
