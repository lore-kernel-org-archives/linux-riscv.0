Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E551BC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Feb 2022 10:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Message-ID:References:In-Reply-To:Subject:Cc:To:From
	:Date:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7Z96MubuPwrNDqD3KtYW3IN6EBlm/Yw6VbXNm55AkH8=; b=h+vXJ89quqoWLyE0vNPkmPSHYE
	V4role0iXODnciENcQiEu2GDElzXLN3B8+x07Ewl1NoJlRnmhSn5JADWp7cgnfTZysWNLmWhXIr+I
	cUFZgRMuR97rmKsBSTQ7CZExAylojwRn8CIDnnTbdf3h05tAXGIXKMjZhwBSS4IEe5BOEpnOJSSZV
	1qMVs/xUwoye41TUYrQh5wc7xTv/vBBulDVa1Nlt4MjuP5KiQgHTWyt4QmwQBQvgnOgfucnaJDufi
	w13BoYoi61F9aHIEBV6YK/PsfGKWuuZw+gXZSZ8hIhyiLGXlBXeQX1zqEj671aeahNmPW65+HQ/uC
	cuF6eE6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nM5gG-004o84-5E; Mon, 21 Feb 2022 10:12:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nM4fP-004WHj-K5
 for linux-riscv@lists.infradead.org; Mon, 21 Feb 2022 09:07:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0DACC61251;
 Mon, 21 Feb 2022 09:07:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CFAC340EB;
 Mon, 21 Feb 2022 09:07:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1645434454;
 bh=0UtvbGc/28PIsgWHpVNayzBPg+Fg8BoIZ349umoEGrE=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=IGPF/Xa/4lkRb9hv9Jvcw6kOSnf02B2YCTN2wI0GEnX6vHAd4nWtIhh1ANCsmLq32
 7EjWjxA+daoQUyKEJQMjjwiyTXmDkAtCt8rYcjzeWMd5L4LO48ezdgpJkTsJIDPgkF
 EUCaBx6p03UZu4AFDqTMVKRrr1eSCco8KcB4Iw9KEuEaUXwVyb+6uR4FwYNrScVMHi
 SQNEziEbfLSkLHa2xipkKcf+Yefagx1ZIWHB/gdhchTeKWErMaSEwweqIyy7WpJV3e
 aelCE/RxjsKR1yAaD+WY+cPi3T8iglzUM4JMb7NDLoALTydU6z1WgQngigp3N19+c7
 mRqaQBA5iNv1w==
Received: from disco-boy.misterjones.org ([51.254.78.96] helo=www.loen.fr)
 by disco-boy.misterjones.org with esmtpsa (TLS1.3) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <maz@kernel.org>)
 id 1nM4fM-009E1h-Bo; Mon, 21 Feb 2022 09:07:32 +0000
MIME-Version: 1.0
Date: Mon, 21 Feb 2022 09:07:31 +0000
From: Marc Zyngier <maz@kernel.org>
To: Anup Patel <anup@brainfault.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Thomas
 Gleixner <tglx@linutronix.de>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Atish Patra <atishp@atishpatra.org>, Alistair Francis
 <Alistair.Francis@wdc.com>, linux-riscv <linux-riscv@lists.infradead.org>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/6] irqchip/riscv-intc: Create domain using named
 fwnode
In-Reply-To: <CAAhSdy0jTTDzoc+3T_8uLiWfBN3AFCWj99Ayc-Yh8FBfzUY2sQ@mail.gmail.com>
References: <20220128052505.859518-1-apatel@ventanamicro.com>
 <20220128052505.859518-3-apatel@ventanamicro.com>
 <063b8a5636d6372f37029946b2c3e0f4@kernel.org>
 <CAAhSdy387r314f=YjvXJCxqxkvjm5q-EBOVu420giFzaVr_NYw@mail.gmail.com>
 <31fea18e51a5021b79adb17973f9528e@kernel.org>
 <CAAhSdy0jTTDzoc+3T_8uLiWfBN3AFCWj99Ayc-Yh8FBfzUY2sQ@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.13
Message-ID: <023bd1b9eaad001fca53f714920280aa@kernel.org>
X-Sender: maz@kernel.org
X-SA-Exim-Connect-IP: 51.254.78.96
X-SA-Exim-Rcpt-To: anup@brainfault.org, apatel@ventanamicro.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 daniel.lezcano@linaro.org, atishp@atishpatra.org, Alistair.Francis@wdc.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
X-SA-Exim-Mail-From: maz@kernel.org
X-SA-Exim-Scanned: No (on disco-boy.misterjones.org);
 SAEximRunCond expanded to false
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220221_010735_825390_1DA28B31 
X-CRM114-Status: GOOD (  51.58  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 2022-02-19 13:03, Anup Patel wrote:
> On Sat, Feb 19, 2022 at 3:02 PM Marc Zyngier <maz@kernel.org> wrote:
>> 
>> On 2022-02-19 03:38, Anup Patel wrote:
>> > On Thu, Feb 17, 2022 at 8:42 PM Marc Zyngier <maz@kernel.org> wrote:
>> >>
>> >> On 2022-01-28 05:25, Anup Patel wrote:
>> >> > We should create INTC domain using a synthetic fwnode which will allow
>> >> > drivers (such as RISC-V SBI IPI driver, RISC-V timer driver, RISC-V
>> >> > PMU driver, etc) not having dedicated DT/ACPI node to directly create
>> >> > interrupt mapping for standard local interrupt numbers defined by the
>> >> > RISC-V privileged specification.
>> >> >
>> >> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
>> >> > ---
>> >> >  arch/riscv/include/asm/irq.h      |  2 ++
>> >> >  arch/riscv/kernel/irq.c           | 13 +++++++++++++
>> >> >  drivers/clocksource/timer-clint.c | 13 +++++++------
>> >> >  drivers/clocksource/timer-riscv.c | 11 ++---------
>> >> >  drivers/irqchip/irq-riscv-intc.c  | 12 ++++++++++--
>> >> >  drivers/irqchip/irq-sifive-plic.c | 19 +++++++++++--------
>> >> >  6 files changed, 45 insertions(+), 25 deletions(-)
>> >> >
>> >> > diff --git a/arch/riscv/include/asm/irq.h
>> >> > b/arch/riscv/include/asm/irq.h
>> >> > index e4c435509983..f85ebaf07505 100644
>> >> > --- a/arch/riscv/include/asm/irq.h
>> >> > +++ b/arch/riscv/include/asm/irq.h
>> >> > @@ -12,6 +12,8 @@
>> >> >
>> >> >  #include <asm-generic/irq.h>
>> >> >
>> >> > +extern struct fwnode_handle *riscv_intc_fwnode(void);
>> >> > +
>> >> >  extern void __init init_IRQ(void);
>> >> >
>> >> >  #endif /* _ASM_RISCV_IRQ_H */
>> >> > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
>> >> > index 7207fa08d78f..f2fed78ab659 100644
>> >> > --- a/arch/riscv/kernel/irq.c
>> >> > +++ b/arch/riscv/kernel/irq.c
>> >> > @@ -7,9 +7,22 @@
>> >> >
>> >> >  #include <linux/interrupt.h>
>> >> >  #include <linux/irqchip.h>
>> >> > +#include <linux/irqdomain.h>
>> >> > +#include <linux/module.h>
>> >> >  #include <linux/seq_file.h>
>> >> >  #include <asm/smp.h>
>> >> >
>> >> > +static struct fwnode_handle *intc_fwnode;
>> >> > +
>> >> > +struct fwnode_handle *riscv_intc_fwnode(void)
>> >> > +{
>> >> > +     if (!intc_fwnode)
>> >> > +             intc_fwnode = irq_domain_alloc_named_fwnode("RISCV-INTC");
>> >> > +
>> >> > +     return intc_fwnode;
>> >> > +}
>> >> > +EXPORT_SYMBOL_GPL(riscv_intc_fwnode);
>> >>
>> >> Why is this created outside of the root interrupt controller driver?
>> >> Furthermore, why do you need to create a new fwnode the first place?
>> >> As far as I can tell, the INTC does have a node, and what you don't
>> >> have is the firmware linkage between PMU (an others) and the INTC.
>> >
>> > Fair enough, I will update this patch to not create a synthetic fwnode.
>> >
>> > The issue is not with INTC driver. We have other drivers and places
>> > (such as SBI IPI driver, SBI PMU driver, and KVM RISC-V AIA support)
>> > where we don't have a way to locate INTC fwnode.
>> 
>> And that's exactly what I am talking about: The INTC is OK (sort of),
>> but the firmware is too crap for words, and isn't even able to expose
>> where the various endpoints route their interrupts to.
> 
> The firmware is always present at a higher privilege-level hence there
> is no DT node to discover the presence of firmware. The local 
> interrupts
> used by the firmware for IPI, Timer and PMU are defined by the RISC-V
> ISA specification.
> 
>> 
>> Yes, this is probably fine today because you can describe the topology
>> of RISC-V systems on the surface of a post stamp. Once you get to the
>> complexity of a server-grade SoC (or worse, a mobile phone style SoC),
>> this *implicit topology* stuff doesn't fly, because there is no
>> guarantee
>> that all endpoints will always all point to the same controller.
> 
> The local interrupts (per-CPU) are always managed by the INTC. The
> interrupt controllers to manage device interrupts (such as PLIC) can
> vary from platform to platform and have INTC as the parent domain.

I don't know how to make it clearer: this isn't about the situation
*today*. It is about what you will have two or five years from now.

Relying on a default topology is stupidly bad, and you will end-up
in a terrible corner eventually, because you can't have *two*
defaults.

> 
> We already have high-end interrupt controllers (such as AIA) under
> development which are scalable for server-grade SoC, mobile SoC
> and various other types of SoCs.
> 
> We are able to describe the topology of different types of interrupt
> controllers (PLIC as well as AIA) in DT.
> 
> The only issue is for drivers which do not have dedicated DT node
> (such as SBI IPI, SBI Timer, SBI PMU, or KVM RISC-V) but the
> upside is that local interrupt numbers used by these drivers is
> clearly defined by the RISC-V ISA specification:
> 
> Here are the local interrupts defined by the RISC-V ISA spec:
> IRQ13 => PMU overflow interrupt (used by SBI PMU driver)
> IRQ12 => S-mode guest external interrupt (to be used by KVM RISC-V)
> IRQ11 => M-mode external interrupt (used by firmware)
> IRQ9  => S-mode external interrupt (used by PLIC driver)
> IRQ7  => M-mode timer interrupt
> IRQ5  => S-mode timer interrupt (used by SBI Timer driver)
> IRQ3  => M-mode software interrupt (used by firmware)
> IRQ1 =>  S-mode software interrupt (used by SBI IPI driver)

Again, you are missing the point. It isn't about the interrupt
number (nobody gives a crap about them). It is about the entity
the device is connected to. No amount of copy pasting of the
spec changes that.

>> 
>> >> what you should have instead is something like:
>> >>
>> >> static struct fwnode_handle *(*__get_root_intc_node)(void);
>> >> struct fwnode_handle *riscv_get_root_intc_hwnode(void)
>> >> {
>> >>          if (__get_root_intc_node)
>> >>                  return __get_root_intc_node();
>> >>
>> >>          return NULL;
>> >> }
>> >>
>> >> and the corresponding registration interface.
>> >
>> > Thanks, I will follow this suggestion. This is a much better approach
>> > and it will avoid touching existing drivers.
>> >
>> >>
>> >> But either way, something breaks: the INTC has one node per CPU, and
>> >> expect one irqdomain per CPU. Having a single fwnode completely breaks
>> >> the INTC driver (and probably the irqdomain list, as we don't check
>> >> for
>> >> duplicate entries).
>> >>
>> >> > diff --git a/drivers/irqchip/irq-riscv-intc.c
>> >> > b/drivers/irqchip/irq-riscv-intc.c
>> >> > index b65bd8878d4f..26ed62c11768 100644
>> >> > --- a/drivers/irqchip/irq-riscv-intc.c
>> >> > +++ b/drivers/irqchip/irq-riscv-intc.c
>> >> > @@ -112,8 +112,16 @@ static int __init riscv_intc_init(struct
>> >> > device_node *node,
>> >> >       if (riscv_hartid_to_cpuid(hartid) != smp_processor_id())
>> >> >               return 0;
>> >> >
>> >> > -     intc_domain = irq_domain_add_linear(node, BITS_PER_LONG,
>> >> > -                                         &riscv_intc_domain_ops, NULL);
>> >> > +     /*
>> >> > +      * Create INTC domain using a synthetic fwnode which will allow
>> >> > +      * drivers (such as RISC-V SBI IPI driver, RISC-V timer driver,
>> >> > +      * RISC-V PMU driver, etc) not having dedicated DT/ACPI node to
>> >> > +      * directly create interrupt mapping for standard local interrupt
>> >> > +      * numbers defined by the RISC-V privileged specification.
>> >> > +      */
>> >> > +     intc_domain = irq_domain_create_linear(riscv_intc_fwnode(),
>> >> > +                                            BITS_PER_LONG,
>> >> > +                                            &riscv_intc_domain_ops, NULL);
>> >>
>> >> This is what I'm talking about. It is simply broken. So either you
>> >> don't
>> >> need a per-CPU node (and the DT was bad the first place), or you
>> >> absolutely need
>> >> one (and the whole 'well-known/default domain' doesn't work at all).
>> >>
>> >> Either way, this patch is plain wrong.
>> >
>> > Okay, I will update this patch with the new approach which you
>> > suggested.
>> 
>> But how do you plan to work around the fact that everything is 
>> currently
>> build around having a node (and an irqdomain) per CPU? The PLIC, for
>> example,
>> clearly has one parent per CPU, not one global parent.
>> 
>> I'm sure there was a good reason for this, and I suspect merging the
>> domains
>> will simply end up breaking things.
> 
> We can have multiple PLIC instances in a platform and each PLIC
> instance targets a subset of CPUs. Further, each PLIC instance has
> multiple PLIC contexts for associated CPUs.
> 
> The per-CPU INTC DT nodes and the "interrupts-extended" DT
> property of PLIC DT node helps us describe the association
> between various PLIC contexts and CPUs.
> 
> Here's an example PLIC DT node:
> 
>     plic: interrupt-controller@c000000 {
>       #address-cells = <0>;
>       #interrupt-cells = <1>;
>       compatible = "sifive,fu540-c000-plic", "sifive,plic-1.0.0";
>       interrupt-controller;
>       interrupts-extended = <&cpu0_intc 11>,
>                             <&cpu1_intc 11>, <&cpu1_intc 9>,
>                             <&cpu2_intc 11>, <&cpu2_intc 9>,
>                             <&cpu3_intc 11>, <&cpu3_intc 9>,
>                             <&cpu4_intc 11>, <&cpu4_intc 9>;
>       reg = <0xc000000 0x4000000>;
>       riscv,ndev = <10>;
>     };
> 
> In above above example, PLIC has 9 contexts and context
> to CPU connections are as follows:
> PLIC context0 => CPU0 M-mode external interrupt
> PLIC context1 => CPU1 M-mode external interrupt
> PLIC context2 => CPU1 S-mode external interrupt
> PLIC context3 => CPU2 M-mode external interrupt
> PLIC context4 => CPU2 S-mode external interrupt
> ....

Asymmetric interrupt routing. How lovely. How broken.

> 
> This is just one example and we can describe any kind of
> PLIC context to CPU connections using "interrupts-extended"
> DT property.
> 
> The same level of flexibility is provided by AIA interrupt
> controllers which are under development.

How promising. I really hope someone will eventually barge in
and clean this mess.

           M.
-- 
Jazz is not dead. It just smells funny...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
