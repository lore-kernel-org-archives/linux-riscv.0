Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD1AC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Feb 2022 03:39:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eivSiQgweXJXlyaZ7dv5DXpD/nQCxM61DJeZho5Cyro=; b=Qu4nF9jxp33kYm
	GUJgNS4FQDXP3Bi/LNSPHthluDmsZ+tJCJZRIFodAyER/vfACdlFdalewSogsNoJqoYpqW0offwfh
	Y8FsWdq/e+a+vV/Fb+XRUXX+8ipfm5uJFY+7tClqvE+PoZwAlNLztVp1+TBrmATnXPCfH+9kO0YEe
	YY8MjzMXGljtlaeJ0MupEY9ew57Cm4pinUeiUQ0FZtyXTRgJs97zQYKyCge6VGw2ppJRtvvvBDa2o
	Wm7F2Ja+01F9yDlxv11pgd6gn1YgBsfI/O0z5osieAADF1s548jUz0ECr2GS7yKdzDVy/8KMCwvaI
	So79z47spFbC9ryeGPgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nLGaL-00GCW7-6v; Sat, 19 Feb 2022 03:39:01 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nLGaI-00GCVo-63
 for linux-riscv@lists.infradead.org; Sat, 19 Feb 2022 03:38:59 +0000
Received: by mail-wm1-x32e.google.com with SMTP id
 x3-20020a05600c21c300b0037c01ad715bso7689115wmj.2
 for <linux-riscv@lists.infradead.org>; Fri, 18 Feb 2022 19:38:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20210112.gappssmtp.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=nedZE9CYo/O4rESVv1Nf5juJloXpQE/HOA07tzdjzh4=;
 b=Ybq8d9MVycFAHyQOoZAXdJHdp57iiyFesmQLye9XQO+8Tuzi92/XZNcHen3n2QEn7l
 dKSl6bBRcP6IjnUSCQtc6n3sUmxOLtb+d+C4jXkuphJuwW51jF1QSG7fIx1t+mCnPK2d
 swg1A+QvUIR8lPQ3MY+HVpejsoLRJOKxy4hz6pQA7N8+io9imHN762onltdMYUyGY4Rq
 TxIboGOG7wUM76Lt2is70XtAD6rtXzMVcS684QF7atMz/ajYdrPohUdnFPrXiU31R/cj
 58MEjctQZYr/HWa5mp9M1pab0LlWRuN14hZ9DDYMh26GVxGs4wS7ItdzyBLGmz0txrVP
 UVFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=nedZE9CYo/O4rESVv1Nf5juJloXpQE/HOA07tzdjzh4=;
 b=vVu0kcvQqYD9iVLcTTeZJddzsmINGF3rmvf4HreUInF9b3yvc3U91AskaXwSPJ2/8w
 wwIos4RB1ALQz6rJkxlRn1OTH9kOwETVct9VvUTln6qdTG0NIH0NiHaQytH2Aw7BP3OP
 I/aGVXzJx6fUR9zLPlO5IuoEyRi91VmUcJZSikecM5GO4OAKQsgL6R/egCwl+64eun7v
 lYEfE3N0lOGB4+ixUCw8gj4BZFwUodTOUbt5+7hTniqD81auax2bOsnPYeSvcPoc7aFr
 mGif6+v/i1KNATzaXjHrjTYgT2Z7X0MBiW1jBOmEIcwe4szWzxu9DbYr7TOixvBXR4BU
 iMrg==
X-Gm-Message-State: AOAM531PeISbH1yJjh4E07MiDXjOpSxKMycdglzBzsojRCwlT7ZAd22H
 oNWTV0YHXq3JLVAiJyNTIHOcbyuCcCqciPMJ+NFY+g==
X-Google-Smtp-Source: ABdhPJyq7a82/Td7K9xNfLwQ93cynMMOkx1OHfvG+rIJx4EO/sDEkBchlMpwDmwye8MsQJqbyqHXc58HTLPqaidUkk0=
X-Received: by 2002:a7b:cb99:0:b0:34e:b056:91ed with SMTP id
 m25-20020a7bcb99000000b0034eb05691edmr9424307wmi.137.1645241936103; Fri, 18
 Feb 2022 19:38:56 -0800 (PST)
MIME-Version: 1.0
References: <20220128052505.859518-1-apatel@ventanamicro.com>
 <20220128052505.859518-3-apatel@ventanamicro.com>
 <063b8a5636d6372f37029946b2c3e0f4@kernel.org>
In-Reply-To: <063b8a5636d6372f37029946b2c3e0f4@kernel.org>
From: Anup Patel <anup@brainfault.org>
Date: Sat, 19 Feb 2022 09:08:43 +0530
Message-ID: <CAAhSdy387r314f=YjvXJCxqxkvjm5q-EBOVu420giFzaVr_NYw@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] irqchip/riscv-intc: Create domain using named
 fwnode
To: Marc Zyngier <maz@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Atish Patra <atishp@atishpatra.org>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220218_193858_336392_900F19E0 
X-CRM114-Status: GOOD (  34.51  )
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

On Thu, Feb 17, 2022 at 8:42 PM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2022-01-28 05:25, Anup Patel wrote:
> > We should create INTC domain using a synthetic fwnode which will allow
> > drivers (such as RISC-V SBI IPI driver, RISC-V timer driver, RISC-V
> > PMU driver, etc) not having dedicated DT/ACPI node to directly create
> > interrupt mapping for standard local interrupt numbers defined by the
> > RISC-V privileged specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  arch/riscv/include/asm/irq.h      |  2 ++
> >  arch/riscv/kernel/irq.c           | 13 +++++++++++++
> >  drivers/clocksource/timer-clint.c | 13 +++++++------
> >  drivers/clocksource/timer-riscv.c | 11 ++---------
> >  drivers/irqchip/irq-riscv-intc.c  | 12 ++++++++++--
> >  drivers/irqchip/irq-sifive-plic.c | 19 +++++++++++--------
> >  6 files changed, 45 insertions(+), 25 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/irq.h
> > b/arch/riscv/include/asm/irq.h
> > index e4c435509983..f85ebaf07505 100644
> > --- a/arch/riscv/include/asm/irq.h
> > +++ b/arch/riscv/include/asm/irq.h
> > @@ -12,6 +12,8 @@
> >
> >  #include <asm-generic/irq.h>
> >
> > +extern struct fwnode_handle *riscv_intc_fwnode(void);
> > +
> >  extern void __init init_IRQ(void);
> >
> >  #endif /* _ASM_RISCV_IRQ_H */
> > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> > index 7207fa08d78f..f2fed78ab659 100644
> > --- a/arch/riscv/kernel/irq.c
> > +++ b/arch/riscv/kernel/irq.c
> > @@ -7,9 +7,22 @@
> >
> >  #include <linux/interrupt.h>
> >  #include <linux/irqchip.h>
> > +#include <linux/irqdomain.h>
> > +#include <linux/module.h>
> >  #include <linux/seq_file.h>
> >  #include <asm/smp.h>
> >
> > +static struct fwnode_handle *intc_fwnode;
> > +
> > +struct fwnode_handle *riscv_intc_fwnode(void)
> > +{
> > +     if (!intc_fwnode)
> > +             intc_fwnode = irq_domain_alloc_named_fwnode("RISCV-INTC");
> > +
> > +     return intc_fwnode;
> > +}
> > +EXPORT_SYMBOL_GPL(riscv_intc_fwnode);
>
> Why is this created outside of the root interrupt controller driver?
> Furthermore, why do you need to create a new fwnode the first place?
> As far as I can tell, the INTC does have a node, and what you don't
> have is the firmware linkage between PMU (an others) and the INTC.

Fair enough, I will update this patch to not create a synthetic fwnode.

The issue is not with INTC driver. We have other drivers and places
(such as SBI IPI driver, SBI PMU driver, and KVM RISC-V AIA support)
where we don't have a way to locate INTC fwnode.

>
> what you should have instead is something like:
>
> static struct fwnode_handle *(*__get_root_intc_node)(void);
> struct fwnode_handle *riscv_get_root_intc_hwnode(void)
> {
>          if (__get_root_intc_node)
>                  return __get_root_intc_node();
>
>          return NULL;
> }
>
> and the corresponding registration interface.

Thanks, I will follow this suggestion. This is a much better approach
and it will avoid touching existing drivers.

>
> But either way, something breaks: the INTC has one node per CPU, and
> expect one irqdomain per CPU. Having a single fwnode completely breaks
> the INTC driver (and probably the irqdomain list, as we don't check for
> duplicate entries).
>
> > diff --git a/drivers/irqchip/irq-riscv-intc.c
> > b/drivers/irqchip/irq-riscv-intc.c
> > index b65bd8878d4f..26ed62c11768 100644
> > --- a/drivers/irqchip/irq-riscv-intc.c
> > +++ b/drivers/irqchip/irq-riscv-intc.c
> > @@ -112,8 +112,16 @@ static int __init riscv_intc_init(struct
> > device_node *node,
> >       if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
> >               return 0;
> >
> > -     intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
> > -                                         &riscv_intc_domain_ops, NULL);
> > +     /*
> > +      * Create INTC domain using a synthetic fwnode which will allow
> > +      * drivers (such as RISC-V SBI IPI driver, RISC-V timer driver,
> > +      * RISC-V PMU driver, etc) not having dedicated DT/ACPI node to
> > +      * directly create interrupt mapping for standard local interrupt
> > +      * numbers defined by the RISC-V privileged specification.
> > +      */
> > +     intc_domain = irq_domain_create_linear(riscv_intc_fwnode(),
> > +                                            BITS_PER_LONG,
> > +                                            &riscv_intc_domain_ops, NULL);
>
> This is what I'm talking about. It is simply broken. So either you don't
> need a per-CPU node (and the DT was bad the first place), or you
> absolutely need
> one (and the whole 'well-known/default domain' doesn't work at all).
>
> Either way, this patch is plain wrong.

Okay, I will update this patch with the new approach which you suggested.

Regards,
Anup

>
>
>          M.
> --
> Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
