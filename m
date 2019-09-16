Return-Path: <SRS0=O4lQ=XL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB11DC49ED7
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 21:33:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9575821924
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 16 Sep 2019 21:33:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Ber5D7Kh"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9575821924
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PMYveKn3/ez6hTBARR3sZoMNwY+gw4B9mG+RH3JwZ/c=; b=Ber5D7KhVCMA0W
	5ggM+sHlF76Cdg3kjcWRtMEP3cPtckB1Cpr4NALZTSM6JYw4eb9boMf0IlY5DSyj/ULdTCFhhTk/p
	DT8G0YiJg8QU8KOWO/X5dRNsUGw0EByUGAl8GQjP9bK+PpbnLW4Pt5W5aiDAHgLEE+qagIu+mLVLD
	K1yJi7lrlcbk8dwHmytdzMhsrGw7knuQMutSC3B/Hy6vAMgHV5/EHXenAB6O6NH46SV8IvZSca4aY
	0aCs/XvhuzSoem3de2oMHeDsWZ/OWvhxuK+WgSpF78ny9D4qQgHXe5/Lemm2kC3JZjWq1BB5kOJtM
	osXAYmVGtYxA612sW6Pg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.2 #3 (Red Hat Linux))
	id 1i9ycn-0004Bw-6D; Mon, 16 Sep 2019 21:33:33 +0000
Received: from inca-roads.misterjones.org ([213.251.177.50])
 by bombadil.infradead.org with esmtps (Exim 4.92.2 #3 (Red Hat Linux))
 id 1i9ycj-0004B0-CS
 for linux-riscv@lists.infradead.org; Mon, 16 Sep 2019 21:33:31 +0000
Received: from 78.163-31-62.static.virginmediabusiness.co.uk ([62.31.163.78]
 helo=why)
 by cheepnis.misterjones.org with esmtpsa (TLSv1.2:AES256-GCM-SHA384:256)
 (Exim 4.80) (envelope-from <maz@kernel.org>)
 id 1i9ycf-0001TZ-K3; Mon, 16 Sep 2019 23:33:25 +0200
Date: Mon, 16 Sep 2019 22:33:23 +0100
From: Marc Zyngier <maz@kernel.org>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: Re: [PATCH] irqchip/sifive-plic: add irq_mask and irq_unmask
Message-ID: <20190916223323.07664bc2@why>
In-Reply-To: <mhng-df6c7aad-d4fd-4c44-96c8-bf63465e0c97@palmer-si-x1c4>
References: <3c0eb4e9-ee21-d07b-ad16-735b7dc06051@bluespec.com>
 <mhng-df6c7aad-d4fd-4c44-96c8-bf63465e0c97@palmer-si-x1c4>
Organization: Approximate
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.31.163.78
X-SA-Exim-Rcpt-To: palmer@sifive.com, darius@bluespec.com,
 david.abdurachmanov@sifive.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 tglx@linutronix.de, jason@lakedaemon.net
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on cheepnis.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190916_143329_575673_A494B8E9 
X-CRM114-Status: GOOD (  31.66  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: jason@lakedaemon.net, David Abdurachmanov <david.abdurachmanov@sifive.com>,
 Darius Rad <darius@bluespec.com>, linux-kernel@vger.kernel.org,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 tglx@linutronix.de
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, 16 Sep 2019 13:51:58 -0700 (PDT)
Palmer Dabbelt <palmer@sifive.com> wrote:

> On Mon, 16 Sep 2019 12:04:56 PDT (-0700), Darius Rad wrote:
> > On 9/15/19 2:20 PM, Marc Zyngier wrote:  
> >> On Sun, 15 Sep 2019 18:31:33 +0100,
> >> Palmer Dabbelt <palmer@sifive.com> wrote:
> >>
> >> Hi Palmer,
> >>  
> >>>
> >>> On Sun, 15 Sep 2019 07:24:20 PDT (-0700), maz@kernel.org wrote:  
> >>>> On Thu, 12 Sep 2019 22:40:34 +0100,
> >>>> Darius Rad <darius@bluespec.com> wrote:
> >>>>
> >>>> Hi Darius,
> >>>>  
> >>>>>
> >>>>> As per the existing comment, irq_mask and irq_unmask do not need
> >>>>> to do anything for the PLIC.  However, the functions must exist
> >>>>> (the pointers cannot be NULL) as they are not optional, based on
> >>>>> the documentation (Documentation/core-api/genericirq.rst) as well
> >>>>> as existing usage (e.g., include/linux/irqchip/chained_irq.h).
> >>>>>
> >>>>> Signed-off-by: Darius Rad <darius@bluespec.com>
> >>>>> ---
> >>>>>  drivers/irqchip/irq-sifive-plic.c | 13 +++++++++----
> >>>>>  1 file changed, 9 insertions(+), 4 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> >>>>> index cf755964f2f8..52d5169f924f 100644
> >>>>> --- a/drivers/irqchip/irq-sifive-plic.c
> >>>>> +++ b/drivers/irqchip/irq-sifive-plic.c
> >>>>> @@ -111,6 +111,13 @@ static void plic_irq_disable(struct irq_data *d)
> >>>>>  	plic_irq_toggle(cpu_possible_mask, d->hwirq, 0);
> >>>>>  }
> >>>>>  +/*
> >>>>> + * There is no need to mask/unmask PLIC interrupts.  They are "masked"
> >>>>> + * by reading claim and "unmasked" when writing it back.
> >>>>> + */
> >>>>> +static void plic_irq_mask(struct irq_data *d) { }
> >>>>> +static void plic_irq_unmask(struct irq_data *d) { }  
> >>>>
> >>>> This outlines a bigger issue. If your irqchip doesn't require
> >>>> mask/unmask, you're probably not using the right interrupt
> >>>> flow. Looking at the code, I see you're using handle_simple_irq, which
> >>>> is almost universally wrong.
> >>>>
> >>>> As per the description above, these interrupts should be using the
> >>>> fasteoi flow, which is designed for this exact behaviour (the
> >>>> interrupt controller knows which interrupt is in flight and doesn't
> >>>> require SW to do anything bar signalling the EOI).
> >>>>
> >>>> Another thing is that mask/unmask tends to be a requirement, while
> >>>> enable/disable tends to be optional. There is no hard line here, but
> >>>> the expectations are that:
> >>>>
> >>>> (a) A disabled line can drop interrupts
> >>>> (b) A masked line cannot drop interrupts
> >>>>
> >>>> Depending what the PLIC architecture mandates, you'll need to
> >>>> implement one and/or the other. Having just (a) is indicative of a HW
> >>>> bug, and I'm not assuming that this is the case. (b) only is pretty
> >>>> common, and (a)+(b) has a few adepts. My bet is that it requires (b)
> >>>> only.
> >>>>  
> >>>>> +
> >>>>>  #ifdef CONFIG_SMP
> >>>>>  static int plic_set_affinity(struct irq_data *d,
> >>>>>  			     const struct cpumask *mask_val, bool force)
> >>>>> @@ -138,12 +145,10 @@ static int plic_set_affinity(struct irq_data *d,
> >>>>>   static struct irq_chip plic_chip = {
> >>>>>  	.name		= "SiFive PLIC",
> >>>>> -	/*
> >>>>> -	 * There is no need to mask/unmask PLIC interrupts.  They are "masked"
> >>>>> -	 * by reading claim and "unmasked" when writing it back.
> >>>>> -	 */
> >>>>>  	.irq_enable	= plic_irq_enable,
> >>>>>  	.irq_disable	= plic_irq_disable,
> >>>>> +	.irq_mask	= plic_irq_mask,
> >>>>> +	.irq_unmask	= plic_irq_unmask,
> >>>>>  #ifdef CONFIG_SMP
> >>>>>  	.irq_set_affinity = plic_set_affinity,
> >>>>>  #endif  
> >>>>
> >>>> Can you give the following patch a go? It brings the irq flow in line
> >>>> with what the HW can do. It is of course fully untested (not even
> >>>> compile tested...).
> >>>>
> >>>> Thanks,
> >>>>
> >>>> 	M.
> >>>>
> >>>> From c0ce33a992ec18f5d3bac7f70de62b1ba2b42090 Mon Sep 17 00:00:00 2001
> >>>> From: Marc Zyngier <maz@kernel.org>
> >>>> Date: Sun, 15 Sep 2019 15:17:45 +0100
> >>>> Subject: [PATCH] irqchip/sifive-plic: Switch to fasteoi flow
> >>>>
> >>>> The SiFive PLIC interrupt controller seems to have all the HW
> >>>> features to support the fasteoi flow, but the driver seems to be
> >>>> stuck in a distant past. Bring it into the 21st century.  
> >>>
> >>> Thanks.  We'd gotten these comments during the review process but
> >>> nobody had gotten the time to actually fix the issues.  
> >>
> >> No worries. The IRQ subsystem is an acquired taste... ;-)
> >>  
> >>>>
> >>>> Signed-off-by: Marc Zyngier <maz@kernel.org>
> >>>> ---
> >>>>  drivers/irqchip/irq-sifive-plic.c | 29 +++++++++++++++--------------
> >>>>  1 file changed, 15 insertions(+), 14 deletions(-)
> >>>>
> >>>> diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
> >>>> index cf755964f2f8..8fea384d392b 100644
> >>>> --- a/drivers/irqchip/irq-sifive-plic.c
> >>>> +++ b/drivers/irqchip/irq-sifive-plic.c
> >>>> @@ -97,7 +97,7 @@ static inline void plic_irq_toggle(const struct cpumask *mask,
> >>>>  	}
> >>>>  }
> >>>>  -static void plic_irq_enable(struct irq_data *d)
> >>>> +static void plic_irq_mask(struct irq_data *d)  
> >>
> >> Of course, this is wrong. The perks of trying to do something at the
> >> last minute while boarding an airplane. Don't do that.
> >>
> >> This should of course read "plic_irq_unmask"...
> >>  
> >>>>  {
> >>>>  	unsigned int cpu = cpumask_any_and(irq_data_get_affinity_mask(d),
> >>>>  					   cpu_online_mask);
> >>>> @@ -106,7 +106,7 @@ static void plic_irq_enable(struct irq_data *d)
> >>>>  	plic_irq_toggle(cpumask_of(cpu), d->hwirq, 1);
> >>>>  }
> >>>>  -static void plic_irq_disable(struct irq_data *d)
> >>>> +static void plic_irq_unmask(struct irq_data *d)  
> >>
> >> ... and this should be "plic_irq_mask".
> >>
> >> [...]
> >>  
> >>> Reviewed-by: Palmer Dabbelt <palmer@sifive.com>
> >>> Tested-by: Palmer Dabbelt <palmer@sifive.com> (QEMU Boot)  
> >>
> >> Huhuh... It may be that QEMU doesn't implement the full-fat PLIC, as
> >> the above bug should have kept the IRQ lines masked.
> >>  
> >>> We should test them on the hardware, but I don't have any with me
> >>> right now.  David's probably in the best spot to do this, as he's got
> >>> a setup that does all the weird interrupt sources (ie, PCIe).
> >>>
> >>> David: do you mind testing this?  I've put the patch here:
> >>>
> >>>    ssh://gitolite.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git
> >>>    -b plic-fasteoi  
> >>
> >> I've pushed out a branch with the fixed patch:
> >>
> >> git://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/plic-fasteoi
> >>  
> >
> > That patch works for me on real-ish hardware.  I tried on two FPGA
> > systems that have different PLIC implementations.  Both include
> > a PCIe root port (and associated interrupt source).  So for
> > whatever it's worth:
> >
> > Tested-by: Darius Rad <darius@bluespec.com>  
> 
> Awesome, thanks.  Would it be OK to put a "(on two hardware PLIC
> implementations)" after that, just so we're clear as to who tested
> what?

Sure, no problem.

> Assuming one of yours wasn't a SiFive PLIC then it'd be great if
> David could still give this a whack, but I don't think it strictly
> needs to block merging the patch.  I've included the right David this
> time, with any luck that will be more fruitful :)

Well, we still have time before -rc1. Once David gets a chance to test
it, I'll apply it. Additional question: do you want this backported to
-stable? If so, how far?

Thanks,

	M.
-- 
Without deviation from the norm, progress is not possible.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
