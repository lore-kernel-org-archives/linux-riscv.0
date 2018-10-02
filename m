Return-Path: <SRS0=pZiq=MO=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A403EC43143
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 03:29:31 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7462C20666
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  2 Oct 2018 03:29:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Frwk3Wkl";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="jjW4w0Jj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7462C20666
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Rz7xiQuirFtOHiLNXqCkG0s8YcppS4hr/9rPMdF92NI=; b=Frwk3WklciwPdk
	WXUaT7hbJjv7DQjnLsAhijGeb+aDZK0uG8Xiv/DNWRK6D5J4mrmpCIZ4uf+pHOjiotgLDr+TKrM03
	hf2oh8wrlhdL6pwUEJQftHKhJqjrq1V55FZesBhuwn8HRpBSZhqHAPp0TF2SN+VqqKyLUlmZp0V9u
	qrkrN4GY6DosL1Xlc1+gjtCQ24PImiRkx+QQh88AYq0UPL9xwkMIEumFzTh7OmGY5v0V7KhMuAscP
	ikZA9PQkmkAx9+1I7tNtgJ5PSF+pcty8L+hrG2Uf2kMAWi8Uld9fVyuEF8j9QygIqbcYUpwGyztVD
	CHz0gF8auAXA21RCLLJQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1g7BNJ-0005UR-Qk; Tue, 02 Oct 2018 03:29:29 +0000
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1g7BNG-0005Sg-Ap
 for linux-riscv@lists.infradead.org; Tue, 02 Oct 2018 03:29:27 +0000
Received: by mail-wm1-x342.google.com with SMTP id 193-v6so675270wme.3
 for <linux-riscv@lists.infradead.org>; Mon, 01 Oct 2018 20:29:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dCX/GwmzqqaEro7lRxjOyoDyyqxVketAetl48jxdvcg=;
 b=jjW4w0JjqF0rbDnvztAYmvi+AfTV1Sf2zj9wMGftS16NsZ2+vwmdO1dMS6Ph0zt2zK
 AzT838Loq9GU0xiwkDlg5LnQvnn7EKQcKENW779CCTwlwxU7l40T6lqvUXPvmfB7HqOY
 7gN4v4NpzPmPfqesZUhBB4MnNupEPMCOFYqStFrgP6HnvCliS/Tk2zde4nIKoZPStpDp
 tOfZNA1JYvyXeErD4kN7ilYN9Fz7Hrjn6QjAEqFYqIC8zks3wlTE9OGBcCabR+eutSMt
 JRmKoap+Z5ln75v2lFK7nr1mVROFoD7PWy6ze+q9AoClwMBZmSH7qjozAB3nZPka1oc7
 gdqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dCX/GwmzqqaEro7lRxjOyoDyyqxVketAetl48jxdvcg=;
 b=hd7q2R6Y4uDoggRVtHxOUlD8mlm7a7Qky+mLONwg6XBpytY9yG2AIpBkc8+kDR/lME
 bOiIvzZYakraSEmEkF5hKTqfBORS32+M+7+0GBZ3kgZXwEpAOnjGX8O4wA8YmdIdpBDd
 IBxfRWjys+z0YdaIo9UkWqtVPg6JPf7ghw0MWAkslzU5NJIX2wJZy2mdnUSXyM5AEnZi
 wH6CTNLYqswV8/6L+TwHRntk62IPGvtPyMvZ58ERnYOAOda0GvM7aeM5+iWYsl8BVlZW
 3br2UyEZznRcdkUP1oeijyd8KYsTT/t2qZAh4/Ht0OwYX/oVlK3Bt5xB2CfF34/BTLWC
 nIUg==
X-Gm-Message-State: ABuFfojLzB7p2XUXFvtKWE7ly6sgtPWUD3ps7Gx9gQAmPy21b8sS6HzL
 ZfN3R3Avu4aazYRmVPMATvKLozftYjnVES6CJoT2LA==
X-Google-Smtp-Source: ACcGV610ApY0NX6kjMXZO69tX0bXy69BPjQ9ar5M5RKIIlJEWdbSMGoZs8oruITX7D51P2E3opvMK/D4Q9c6VrK5X5c=
X-Received: by 2002:a1c:1fc2:: with SMTP id
 f185-v6mr435326wmf.18.1538450950644; 
 Mon, 01 Oct 2018 20:29:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180929062605.12888-1-anup@brainfault.org>
 <7d40c900-cfb2-f3a0-fce9-0136814781fe@wdc.com>
In-Reply-To: <7d40c900-cfb2-f3a0-fce9-0136814781fe@wdc.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 2 Oct 2018 08:58:59 +0530
Message-ID:
 <CAAhSdy1DQFNEvW2Nr6g5mv9y_+GrhFL4nVxOROwGwGcqsHhqtg@mail.gmail.com>
Subject: Re: [PATCH v3] RISC-V: Show IPI stats
To: Atish Patra <atish.patra@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20181001_202926_374397_7A069D0A 
X-CRM114-Status: GOOD (  20.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Christoph Hellwig <hch@infradead.org>, linux-riscv@lists.infradead.org,
 Palmer Dabbelt <palmer@sifive.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Albert Ou <aou@eecs.berkeley.edu>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
Message-ID: <20181002032859.AaJ-0U0PBTUPYWCL9PK5yWELGQRrwTYnV5KRFnsXF-E@z>

On Tue, Oct 2, 2018 at 8:45 AM Atish Patra <atish.patra@wdc.com> wrote:
>
> On 9/28/18 11:26 PM, Anup Patel wrote:
> > This patch provides arch_show_interrupts() implementation to
> > show IPI stats via /proc/interrupts.
> >
> > Now the contents of /proc/interrupts" will look like below:
> >             CPU0       CPU1       CPU2       CPU3
> >    8:         17          7          6         14  SiFive PLIC   8  virtio0
> >   10:         10         10          9         11  SiFive PLIC  10  ttyS0
> > IPI0:       170        673        251         79  Rescheduling interrupts
> > IPI1:         1         12         27          1  Function call interrupts
> >
> > Signed-off-by: Anup Patel <anup@brainfault.org>
> >
> > Changes since v2:
> >   - Remove use of IPI_CALL_WAKEUP because it's being removed
> >
> > Changes since v1:
> >   - Add stub inline show_ipi_stats() function for !CONFIG_SMP
> >   - Make ipi_names[] dynamically sized at compile time
> >   - Minor beautification of ipi_names[] using tabs
> >
> > ---
> >   arch/riscv/include/asm/smp.h |  9 +++++++++
> >   arch/riscv/kernel/irq.c      |  8 ++++++++
> >   arch/riscv/kernel/smp.c      | 39 +++++++++++++++++++++++++++++-------
> >   3 files changed, 49 insertions(+), 7 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
> > index fce312ce3516..5278ae8f1346 100644
> > --- a/arch/riscv/include/asm/smp.h
> > +++ b/arch/riscv/include/asm/smp.h
> > @@ -25,8 +25,13 @@
> >   extern unsigned long __cpuid_to_hardid_map[NR_CPUS];
> >   #define cpuid_to_hardid_map(cpu)    __cpuid_to_hardid_map[cpu]
> >
> > +struct seq_file;
> > +
> >   #ifdef CONFIG_SMP
> >
> > +/* print IPI stats */
> > +void show_ipi_stats(struct seq_file *p, int prec);
> > +
> >   /* SMP initialization hook for setup_arch */
> >   void __init setup_smp(void);
> >
> > @@ -47,6 +52,10 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out);
> >
> >   #else
> >
> > +static inline void show_ipi_stats(struct seq_file *p, int prec)
> > +{
> > +}
> > +
> >   static inline int riscv_hartid_to_cpuid(int hartid)
> >   {
> >       return 0;
> > diff --git a/arch/riscv/kernel/irq.c b/arch/riscv/kernel/irq.c
> > index ca4593317e45..48e6b7db83a1 100644
> > --- a/arch/riscv/kernel/irq.c
> > +++ b/arch/riscv/kernel/irq.c
> > @@ -8,6 +8,8 @@
> >   #include <linux/interrupt.h>
> >   #include <linux/irqchip.h>
> >   #include <linux/irqdomain.h>
> > +#include <linux/seq_file.h>
> > +#include <asm/smp.h>
> >
> >   /*
> >    * Possible interrupt causes:
> > @@ -24,6 +26,12 @@
> >    */
> >   #define INTERRUPT_CAUSE_FLAG        (1UL << (__riscv_xlen - 1))
> >
> > +int arch_show_interrupts(struct seq_file *p, int prec)
> > +{
> > +     show_ipi_stats(p, prec);
> > +     return 0;
> > +}
> > +
> >   asmlinkage void __irq_entry do_IRQ(struct pt_regs *regs)
> >   {
> >       struct pt_regs *old_regs = set_irq_regs(regs);
> > diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
> > index 89d95866f562..686fa7a427ff 100644
> > --- a/arch/riscv/kernel/smp.c
> > +++ b/arch/riscv/kernel/smp.c
> > @@ -22,22 +22,24 @@
> >   #include <linux/interrupt.h>
> >   #include <linux/smp.h>
> >   #include <linux/sched.h>
> > +#include <linux/seq_file.h>
> >
> >   #include <asm/sbi.h>
> >   #include <asm/tlbflush.h>
> >   #include <asm/cacheflush.h>
> >
> > -/* A collection of single bit ipi messages.  */
> > -static struct {
> > -     unsigned long bits ____cacheline_aligned;
> > -} ipi_data[NR_CPUS] __cacheline_aligned;
> > -
> >   enum ipi_message_type {
> >       IPI_RESCHEDULE,
> >       IPI_CALL_FUNC,
> >       IPI_MAX
> >   };
> >
> > +/* A collection of single bit ipi messages.  */
> > +static struct {
> > +     unsigned long stats[IPI_MAX] ____cacheline_aligned;
> > +     unsigned long bits ____cacheline_aligned;
> > +} ipi_data[NR_CPUS] __cacheline_aligned;
> > +
> >   int riscv_hartid_to_cpuid(int hartid)
> >   {
> >       int i = -1;
> > @@ -67,6 +69,7 @@ int setup_profiling_timer(unsigned int multiplier)
> >   void riscv_software_interrupt(void)
> >   {
> >       unsigned long *pending_ipis = &ipi_data[smp_processor_id()].bits;
> > +     unsigned long *stats = ipi_data[smp_processor_id()].stats;
> >
> >       /* Clear pending IPI */
> >       csr_clear(sip, SIE_SSIE);
> > @@ -81,11 +84,15 @@ void riscv_software_interrupt(void)
> >               if (ops == 0)
> >                       return;
> >
> > -             if (ops & (1 << IPI_RESCHEDULE))
> > +             if (ops & (1 << IPI_RESCHEDULE)) {
> > +                     stats[IPI_RESCHEDULE]++;
> >                       scheduler_ipi();
> > +             }
> >
> > -             if (ops & (1 << IPI_CALL_FUNC))
> > +             if (ops & (1 << IPI_CALL_FUNC)) {
> > +                     stats[IPI_CALL_FUNC]++;
> >                       generic_smp_call_function_interrupt();
> > +             }
> >
> >               BUG_ON((ops >> IPI_MAX) != 0);
> >
> > @@ -111,6 +118,24 @@ send_ipi_message(const struct cpumask *to_whom, enum ipi_message_type operation)
> >       sbi_send_ipi(cpumask_bits(&hartid_mask));
> >   }
> >
> > +static const char *ipi_names[] = {
> > +     [IPI_RESCHEDULE]        = "Rescheduling interrupts",
> > +     [IPI_CALL_FUNC]         = "Function call interrupts",
> > +};
> > +
> > +void show_ipi_stats(struct seq_file *p, int prec)
> > +{
> > +     unsigned int cpu, i;
> > +
> > +     for (i = 0; i < IPI_MAX; i++) {
> > +             seq_printf(p, "%*s%u:%s", prec - 1, "IPI", i,
> > +                        prec >= 4 ? " " : "");
> > +             for_each_online_cpu(cpu)
> > +                     seq_printf(p, "%10lu ", ipi_data[cpu].stats[i]);
> > +             seq_printf(p, " %s\n", ipi_names[i]);
> > +     }
> > +}
> > +
> >   void arch_send_call_function_ipi_mask(struct cpumask *mask)
> >   {
> >       send_ipi_message(mask, IPI_CALL_FUNC);
> >
> some checkpatch errors.
>
> patches/smp_cleanup/0014-RISC-V-Show-IPI-stats.patch
> ----------------------------------------------------
> WARNING: Missing a blank line after declarations
> #115: FILE: arch/riscv/kernel/smp.c:40:
> +       unsigned long stats[IPI_MAX] ____cacheline_aligned;
> +       unsigned long bits ____cacheline_aligned;

This was already there in existing code.

>
> WARNING: usage of NR_CPUS is often wrong - consider using
> cpu_possible(), num_possible_cpus(), for_each_possible_cpu(), etc
> #116: FILE: arch/riscv/kernel/smp.c:41:
> +} ipi_data[NR_CPUS] __cacheline_aligned;

Even this was already there in existing code.

>
> WARNING: static const char * array should probably be static const char
> * const
> #151: FILE: arch/riscv/kernel/smp.c:121:
> +static const char *ipi_names[] = {
>
> total: 0 errors, 3 warnings, 120 lines checked
>
> Let me know if they were ignored on purpose.
>

Yes, this one was added by this patch.

Do you want me to send revised patch?

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
