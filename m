Return-Path: <SRS0=VhLN=P2=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAEA5C433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 13:10:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7FD5F6112D
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Nov 2021 13:10:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7FD5F6112D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nIT3P9GLXJGHUe6CKi1ArxK5wTEnzGb0Lp+2cL34v54=; b=EHJ/czczva/YVj
	1cmEcZue3HisAz54Ot58oHNLCKtcjd3wvwSbuhqqgmUi/tk3jLAfTbyY6WeYdAfdNdaJFSXP6KWtZ
	FvWH+q9G5qnqyr61Hy0/d7HZOX0wjOaSD8jAx1M4H5XYW28sNIuQSyLAwcBTT79jTkWqcg9PCfavy
	FruM8GFdG3cK+bVuURYI6UgGEe9gjfIkLcVLeGIz1KAvjdt/2UHFHn8IoqMoGLB+Pkes9s48O9N3F
	gyBjEig6XCmqPR/ddgwvWa4OlHBsUsMxnD4ysMb19VU4oK1Wt0IDMbpf+avRpeaAK+AgWMgE960rU
	qkw9RAqxSbe93VaKjw9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mjhvl-00EN2S-R1; Sun, 07 Nov 2021 13:09:53 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mjhvj-00EN1b-5I
 for linux-riscv@lists.infradead.org; Sun, 07 Nov 2021 13:09:52 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id B89A76103D
 for <linux-riscv@lists.infradead.org>; Sun,  7 Nov 2021 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1636290589;
 bh=KTTVrTd2ihbh9KwJ9n54z88VqLiq1cWDd/itc0fUwkk=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=HgozeBh6rpCvMRtgrEjwmZOdYtMdw3efdzXV7iQfL89J7mW3eajDkFlapmkE61671
 9xKV9bDQ12adyUe1cwcZoZfk9tMCULRM6YlfMG+jgnSGuxJi4hhCjrAxHb1fcrYTN2
 eZqbdJY+BE3TWELfEvMp5Z/FGtlIUrNYkFUjsVtCQSLSjbyISLiBNICZkZvHTaQLtI
 ZIA9iOwM+/iYTbSAuaTzTpCqslKyy9WmwLSPhkTpkmXkFQ8ZZddP7vKFnvX+9VPyKj
 ArNuyyW44uo7AxQZTL8cl+ExGU3acsIGXOhDwz02Wbuk+nAExX31UkdmG6pKre88fI
 YF75MxMUnPqqg==
Received: by mail-ua1-f45.google.com with SMTP id v3so26267321uam.10
 for <linux-riscv@lists.infradead.org>; Sun, 07 Nov 2021 05:09:49 -0800 (PST)
X-Gm-Message-State: AOAM532K8XujZETKjaDfLNQ2V4tuS8m9E4Ojp5yL6CR6aCXCThYcSyn/
 2cXTz5TqJvSzRJZJe3Y9gTeYkEYp6LqPBLS9GVE=
X-Google-Smtp-Source: ABdhPJy6SHuBT9ZKBzGHzAGDfkrU4I/o9sw4qE3Sm+bDD3q17LwpNd6AfgdHtPrDO+s36w7HEzo9u4jnAZ9X0MyzPg0=
X-Received: by 2002:a67:fa93:: with SMTP id f19mr92381967vsq.43.1636290588838; 
 Sun, 07 Nov 2021 05:09:48 -0800 (PST)
MIME-Version: 1.0
References: <20211105094748.3894453-1-guoren@kernel.org>
 <CAAhSdy1vyCQdv_gNaNSzU79PC4giCAig6hzgD9JXSXs6+gfFPA@mail.gmail.com>
In-Reply-To: <CAAhSdy1vyCQdv_gNaNSzU79PC4giCAig6hzgD9JXSXs6+gfFPA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Sun, 7 Nov 2021 21:09:38 +0800
X-Gmail-Original-Message-ID: <CAJF2gTTcx0GWQ6CY0VJtzAi8TqvOKK00py4f-d_1iHhi1XAXmw@mail.gmail.com>
Message-ID: <CAJF2gTTcx0GWQ6CY0VJtzAi8TqvOKK00py4f-d_1iHhi1XAXmw@mail.gmail.com>
Subject: Re: [PATCH V7] irqchip/sifive-plic: Fixup EOI failed when masked
To: Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>
Cc: Atish Patra <atish.patra@wdc.com>, Thomas Gleixner <tglx@linutronix.de>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Vincent Pelletier <plr.vincent@gmail.com>,
 Nikita Shubin <nikita.shubin@maquefel.me>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211107_050951_261796_5633B66B 
X-CRM114-Status: GOOD (  32.43  )
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

On Sat, Nov 6, 2021 at 9:45 PM Anup Patel <anup@brainfault.org> wrote:
>
> On Fri, Nov 5, 2021 at 3:18 PM <guoren@kernel.org> wrote:
> >
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the driver,
> > only the first interrupt could be handled, and continue irq is blocked by
> > hw. Because the riscv plic couldn't complete masked irq source which has
> > been disabled in enable register. The bug was firstly reported in [1].
> >
> > Here is the description of Interrupt Completion in PLIC spec [2]:
> >
> > The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the claim/complete
> > register. The PLIC does not check whether the completion ID is the same
> > as the last claim ID for that target. If the completion ID does not match
> > an interrupt source that is currently enabled for the target, the
> >                          ^^ ^^^^^^^^^ ^^^^^^^
> > completion is silently ignored.
> >
> > [1] http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> > [2] https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
> >
> > Fixes: bb0fed1c60cc ("irqchip/sifive-plic: Switch to fasteoi flow")
> > Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> > Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
>
> Looks good to me.
>
> Reviewed-by: Anup Patel <anup@brainfault.org>
Thx

@Marc Zyngier
Could you help to take the patch into your tree include "Anup's
Reviewed-by"? Or Let me update a new version of the patch.

>
> Regards,
> Anup
>
> > Cc: stable@vger.kernel.org
> > Cc: Anup Patel <anup@brainfault.org>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Marc Zyngier <maz@kernel.org>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>
> > Cc: Atish Patra <atish.patra@wdc.com>
> > Cc: Nikita Shubin <nikita.shubin@maquefel.me>
> > Cc: incent Pelletier <plr.vincent@gmail.com>
> >
> > ---
> >
> > Changes since V7:
> >  - Add Fixes tag
> >  - Add Tested-by
> >  - Add Cc stable
> >
> > Changes since V6:
> >  - Propagate to plic_irq_eoi for all riscv,plic by Nikita Shubin
> >  - Remove thead related codes
> >
> > Changes since V5:
> >  - Move back to mask/unmask
> >  - Fixup the problem in eoi callback
> >  - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
> >  - Rewrite comment log
> >
> > Changes since V4:
> >  - Update comment by Anup
> >
> > Changes since V3:
> >  - Rename "c9xx" to "c900"
> >  - Add sifive_plic_chip and thead_plic_chip for difference
> >
> > Changes since V2:
> >  - Add a separate compatible string "thead,c9xx-plic"
> >  - set irq_mask/unmask of "plic_chip" to NULL and point
> >    irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
> >  - Add a detailed comment block in plic_init() about the
> >    differences in Claim/Completion process of RISC-V PLIC and C9xx
> >    PLIC.
> > ---
> >  drivers/irqchip/irq-sifive-plic.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> > index cf74cfa82045..259065d271ef 100644
> > --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
> >  {
> >         struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> > -       writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +       if (irqd_irq_masked(d)) {
> > +               plic_irq_unmask(d);
> > +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +               plic_irq_mask(d);
> > +       } else {
> > +               writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +       }
> >  }
> >
> >  static struct irq_chip plic_chip = {
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
