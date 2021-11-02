Return-Path: <SRS0=IZ/x=PV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62395C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 01:34:45 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6E0D60ED4
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Nov 2021 01:34:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D6E0D60ED4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5lp2YZWznsz2XP2wZspnaTV6aJHCwikijcrQcCK+C3A=; b=4LdvYBKgd+eUjm
	kLOts1vP1sjVo20BRh+TlSWtVriJHdf0Psi/H7JuU5aS5xbpbvl6LjExW1NsyoAx4Lra70Rywb+Yv
	WMEk11JRxZsUwJFEttAYx81WwvrVBWwqbU3maRH+s5Np/DTQqWTaftIYd2zZgI/Chy09ryW8JKqWQ
	ND71bgQ6+Kplmsm8kSILFYHUqd03dRtzhPsCT5vVKEbHU2Z2ZfRyZN+vVGRXifV5le4S3cQItwkd8
	I6pfFg6E4ejYF5Vjwy2c9N3Vz051kDSU6E/aaP1Fml7hpxV2xEP8TAbYmQ4/6s9jFrFcqwx3Y7Q5t
	vysfh6HAtRl6iiZUlbJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mhigw-000DB9-Kl; Tue, 02 Nov 2021 01:34:22 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mhigt-000DAg-JN
 for linux-riscv@lists.infradead.org; Tue, 02 Nov 2021 01:34:21 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 24EBF610E5
 for <linux-riscv@lists.infradead.org>; Tue,  2 Nov 2021 01:34:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635816859;
 bh=KBfwQn1lo+MMUlOPKsEz1KcXY8/Wb65K4WsUqTq24E4=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cE9XgtnUFOFO2LdcnfN4bMNZSI5vIe8XcJU8ODf/p0RqwhC7veDbcQ4tY7uQWyD5z
 rXRK+QLrTmqTudy+dHtvK345uih4d+fZeTCCLYynZXoFizJyjiPqBwpQSsuuG2jXac
 aoTMaA6d5aKfYtAMqN7/pcHu0n04wGRutN23ll5Ke7Frvq7quPllNrWIaGzXbGB8qL
 jWfXVcZjhOww0mc2F0S6bPYULLe+UmDr8sYsj8jrkZRi7LIcy7wLEu3HbNS5eAXfi1
 Dg3uG1Ew3tyPiLI8jVkeFWGaX6yqCMDZev2La5dfh12bpz/u/16Dvush0C8eJ8zVjZ
 BFfp+vVosRDGQ==
Received: by mail-vk1-f172.google.com with SMTP id d128so8294633vkf.11
 for <linux-riscv@lists.infradead.org>; Mon, 01 Nov 2021 18:34:19 -0700 (PDT)
X-Gm-Message-State: AOAM533opL8ftWBsgNL7Y/2ugQiqlI3xatgssTy5H4e8n6iM6IvVQp5x
 SbHFecprbHzl+sSDe166C2B5XwVBcgkk9GPZQk4=
X-Google-Smtp-Source: ABdhPJwiZHnZGzmFzbMokFi2SeReyaH4brsIPT0MbKW0LQSZeF6q6/y7zuc2Tm86DLoMTf0LZH7b7X548r8CFmmo24E=
X-Received: by 2002:a05:6122:2192:: with SMTP id
 j18mr4154959vkd.8.1635816858131; 
 Mon, 01 Nov 2021 18:34:18 -0700 (PDT)
MIME-Version: 1.0
References: <20211101131736.3800114-1-guoren@kernel.org>
 <20211101164705.4e07fdb9@redslave.neermore.group>
In-Reply-To: <20211101164705.4e07fdb9@redslave.neermore.group>
From: Guo Ren <guoren@kernel.org>
Date: Tue, 2 Nov 2021 09:34:06 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRM4xFv+EFCBGwLfp3sLoP=fb-aqX572kYvT+nRJFboTw@mail.gmail.com>
Message-ID: <CAJF2gTRM4xFv+EFCBGwLfp3sLoP=fb-aqX572kYvT+nRJFboTw@mail.gmail.com>
Subject: Re: [PATCH V6] irqchip/sifive-plic: Fixup EOI failed when masked
To: Nikita Shubin <nikita.shubin@maquefel.me>
Cc: Anup Patel <anup@brainfault.org>, Atish Patra <atish.patra@wdc.com>, 
 Marc Zyngier <maz@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
 linux-riscv <linux-riscv@lists.infradead.org>,
 Guo Ren <guoren@linux.alibaba.com>, 
 Vincent Pelletier <plr.vincent@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211101_183419_730429_D497344B 
X-CRM114-Status: GOOD (  33.46  )
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

On Mon, Nov 1, 2021 at 9:47 PM Nikita Shubin <nikita.shubin@maquefel.me> wrote:
>
> On Mon,  1 Nov 2021 21:17:36 +0800
> guoren@kernel.org wrote:
>
> Hi Guo Ren,
>
> Thank you for your patch.
>
> May be it should be applied to stable ?
Yes, I would Cc stable next.

>
> Tested-by: Nikita Shubin <nikita.shubin@maquefel.me>
>
> > From: Guo Ren <guoren@linux.alibaba.com>
> >
> > When using "devm_request_threaded_irq(,,,,IRQF_ONESHOT,,)" in the
> > driver, only the first interrupt could be handled, and continue irq
> > is blocked by hw. Because the riscv plic couldn't complete masked irq
> > source which has been disabled in enable register. The bug was
> > firstly reported in [1].
> >
> > Here is the description of Interrupt Completion in PLIC spec [2]:
> >
> > The PLIC signals it has completed executing an interrupt handler by
> > writing the interrupt ID it received from the claim to the
> > claim/complete register. The PLIC does not check whether the
> > completion ID is the same as the last claim ID for that target. If
> > the completion ID does not match an interrupt source that is
> > currently enabled for the target, the ^^ ^^^^^^^^^ ^^^^^^^
> > completion is silently ignored.
> >
> > [1]
> > http://lists.infradead.org/pipermail/linux-riscv/2021-July/007441.html
> > [2]
> > https://github.com/riscv/riscv-plic-spec/blob/8bc15a35d07c9edf7b5d23fec9728302595ffc4d/riscv-plic.adoc
> >
> > Reported-by: Vincent Pelletier <plr.vincent@gmail.com>
> > Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
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
> > diff --git a/drivers/irqchip/irq-sifive-plic.c
> > b/drivers/irqchip/irq-sifive-plic.c index cf74cfa82045..259065d271ef
> > 100644 --- a/drivers/irqchip/irq-sifive-plic.c
> > +++ b/drivers/irqchip/irq-sifive-plic.c
> > @@ -163,7 +163,13 @@ static void plic_irq_eoi(struct irq_data *d)
> >  {
> >       struct plic_handler *handler = this_cpu_ptr(&plic_handlers);
> >
> > -     writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +     if (irqd_irq_masked(d)) {
> > +             plic_irq_unmask(d);
> > +             writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +             plic_irq_mask(d);
> > +     } else {
> > +             writel(d->hwirq, handler->hart_base + CONTEXT_CLAIM);
> > +     }
> >  }
> >
> >  static struct irq_chip plic_chip = {
>


-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
