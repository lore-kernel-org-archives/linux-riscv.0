Return-Path: <SRS0=H9LG=EE=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DA16C4363A
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:06:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E4F1F2076E
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Oct 2020 16:06:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="FR6DQTbf";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="cpzLRG10"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E4F1F2076E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=8kmCyqVe6smyEPy4+n/e7RJjNWxLr/mhwDS9pVBw2Q4=; b=FR6DQTbffsBF93WWbqwBH0JO1
	cdSzjcoIiQLeICeZ4tzXuidsll61VfJLBfrLaxTaIu7m9+rtynEi3I7jU0IFO6cX5peftslRhp6Fb
	hjSJrt/zDlkPB30SsElpiV8fEMiWXZ4PuygjyOAbPw1caGSVPlVOYAVIyO7imFXZtN9xQ9gu6Gk7Y
	6PzATnSLeXxzrvTSoUq/jS/Uf2l1xVdwU+aKOukcd14bVAlIDo+e7UjHLCxbJFd+2jQPYVxLEvUbJ
	rktn4C7yBfqqgaeOBLHGLY02s73jHylzUC7m2rSlC7WfmctRIE5Dbx9mXLuazfkEhRIUkpSNwhDru
	udwmAKhNA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kYARR-0000II-Tz; Thu, 29 Oct 2020 16:06:21 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kYARO-0000HU-ME
 for linux-riscv@lists.infradead.org; Thu, 29 Oct 2020 16:06:19 +0000
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 4560220825
 for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2020 16:06:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603987577;
 bh=Eu3+a5UtJJUIFUk4sT7sedKLYrHKgrRBWUsMDTBc+Ac=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=cpzLRG106cqEogOEeK/YCZK3cYmaWQTMI/QtbE96BygLBfj3PlimK82p7ZT5Dx29x
 BqYRRI2GA7gjU4At15zhpmfMCRQd2Z8CaR2k0MEPVgUYckI40aS/X6CMj5sSQvu/sh
 nKTqUjjs3QZ8vc9qRW4Cam55zNMdGOcOsyA0U/AM=
Received: by mail-lj1-f170.google.com with SMTP id d25so3650299ljc.11
 for <linux-riscv@lists.infradead.org>; Thu, 29 Oct 2020 09:06:17 -0700 (PDT)
X-Gm-Message-State: AOAM530RqNEWCz3fuhQusa8682Nc4Vd/8aI9XXVsx0RGEV8xp9n0fBkB
 qg0Gx7pdbK9oJusByfeHNNr4PA9VkcCWFT+A71g=
X-Google-Smtp-Source: ABdhPJxMl/uLKQtkDHHuc3sFFIR6KC6Nl9MhUpv5jbuJw9fea43FkUooJcxTWLlB5pZlowZKRN4IuoSkvtd4WmQDXG8=
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr2030999ljj.250.1603987575330; 
 Thu, 29 Oct 2020 09:06:15 -0700 (PDT)
MIME-Version: 1.0
References: <20201021073839.43935-1-zong.li@sifive.com>
 <CAJF2gTTnGSYAc3AZKCPvhNJsPm_TchPjPrtqc_WzaK7K5eNt+w@mail.gmail.com>
 <CAOnJCULN8h0Jk3H-vskgbaXhgBTgTTAT5Dji0qHi6yHoXGePvg@mail.gmail.com>
 <CANXhq0q_fOg7vsniVMtNd8VezW1yymf55FYRc61WMkXMOtZpgA@mail.gmail.com>
In-Reply-To: <CANXhq0q_fOg7vsniVMtNd8VezW1yymf55FYRc61WMkXMOtZpgA@mail.gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Fri, 30 Oct 2020 00:06:04 +0800
X-Gmail-Original-Message-ID: <CAJF2gTR-_=_vDLsST9BVxRFC0OTR4_TYV-2=nH_Gux_zWDOk3Q@mail.gmail.com>
Message-ID: <CAJF2gTR-_=_vDLsST9BVxRFC0OTR4_TYV-2=nH_Gux_zWDOk3Q@mail.gmail.com>
Subject: Re: [PATCH] stop_machine: Mark functions as notrace
To: Zong Li <zong.li@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201029_120618_907619_7896050F 
X-CRM114-Status: GOOD (  44.73  )
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
Cc: Palmer Dabbelt <palmerdabbelt@google.com>,
 Paul McKenney <paulmck@kernel.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 vincent.whitchurch@axis.com, jiangshanlai@gmail.com, josh@joshtriplett.org,
 Steven Rostedt <rostedt@goodmis.org>,
 Colin Ian King <colin.king@canonical.com>, rcu@vger.kernel.org,
 mathieu.desnoyers@efficios.com, Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Atish Patra <atishp@atishpatra.org>,
 joel@joelfernandes.org, Greentime Hu <greentime.hu@sifive.com>,
 Thomas Gleixner <tglx@linutronix.de>,
 linux-riscv <linux-riscv@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Oct 29, 2020 at 10:34 AM Zong Li <zong.li@sifive.com> wrote:
>
> On Thu, Oct 29, 2020 at 8:23 AM Atish Patra <atishp@atishpatra.org> wrote:
> >
> > On Wed, Oct 28, 2020 at 8:44 AM Guo Ren <guoren@kernel.org> wrote:
> > >
> > > Hi Zong & Atish,
> > >
> > > In our 2 harts c910 chip, we found:
> > >
> > > echo function > /sys/kernel/debug/tracing/current_tracer
> > > echo function_graph > /sys/kernel/debug/tracing/current_tracer
> > > echo function > /sys/kernel/debug/tracing/current_tracer
> > > echo function_graph > /sys/kernel/debug/tracing/current_tracer
> > >
> > > Then one core halted at stop_machine_yield:
> > > arch_cpu_idle () at arch/riscv/kernel/process.c:39
> > > 39              local_irq_enable();
> > > (gdb) i th
> > >   Id   Target Id         Frame
> > > * 1    Thread 1 (CPU#0)  arch_cpu_idle () at arch/riscv/kernel/process.c:39
> > >   2    Thread 2 (CPU#1)  stop_machine_yield
> > > (cpumask=0xffffffe001371fa8 <__cpu_online_mask>) at
> > > ./arch/riscv/include/asm/vdso/processor.h:12
> > > (gdb) thread 2
> > > [Switching to thread 2 (Thread 2)]
> > > #0  stop_machine_yield (cpumask=0xffffffe001371fa8
> > > <__cpu_online_mask>) at ./arch/riscv/include/asm/vdso/processor.h:12
> > > 12              __asm__ __volatile__ ("div %0, %0, zero" : "=r" (dummy));
> > >
> > > With your patch, it's solved. For this patch, I'll give:
> > > Tested by: Guo Ren <guoren@kernel.org>
> > >
> > > But that's not enough, we still need:
> > >
> > > diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
> > > index 226ccce..12b8808 100644
> > > --- a/arch/riscv/kernel/sbi.c
> > > +++ b/arch/riscv/kernel/sbi.c
> > > @@ -376,7 +376,7 @@ EXPORT_SYMBOL(sbi_send_ipi);
> > >   *
> > >   * Return: None
> > >   */
> > > -void sbi_remote_fence_i(const unsigned long *hart_mask)
> > > +void notrace sbi_remote_fence_i(const unsigned long *hart_mask)
> > >  {
> > >         __sbi_rfence(SBI_EXT_RFENCE_REMOTE_FENCE_I,
> > >                      hart_mask, 0, 0, 0, 0);
> > > diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> > > index 400b945d..9467d987 100644
> > > --- a/arch/riscv/mm/cacheflush.c
> > > +++ b/arch/riscv/mm/cacheflush.c
> > > @@ -9,12 +9,12 @@
> > >
> > >  #include <asm/sbi.h>
> > >
> > > -static void ipi_remote_fence_i(void *info)
> > > +static void notrace ipi_remote_fence_i(void *info)
> > >  {
> > >         return local_flush_icache_all();
> > >  }
> > >
> > > -void flush_icache_all(void)
> > > +void notrace flush_icache_all(void)
> > >  {
> > >         if (IS_ENABLED(CONFIG_RISCV_SBI))
> > >                 sbi_remote_fence_i(NULL);
> > >
> >
> > Did you see any issue if these functions are not marked as notrace ?
> >
> > As per Zong's explanation, the issue was that the other harts already
> > fetched the next 2 nops and
> > executed 1 while kernel patching replaced other with one of the auipc
> > + jalr pair.
> >
> > @Zong can correct me if I am wrong.
> >
> > These functions are too far ahead. Can it cause such issues ? If yes,
> > then we need to mark each and every function
> > that can be invoked from patch_text_nosync and are not inlined.
> >
> > That includes copy_to_kernel_nofault, __sbi_rfence_v02,
> > __sbi_rfence_v02_call, sbi_ecall.
> >
> > Few of these functions may be inlined by compiler. Can we depend on that ?
> >
> > > Because:
> > > (gdb) bt
> > > #0  flush_icache_all () at arch/riscv/mm/cacheflush.c:20
> > > #1  0xffffffe00020473a in patch_text_nosync (addr=<optimized out>, insns=
> > >     <optimized out>, len=<optimized out>) at arch/riscv/kernel/patch.c:96
> > > #2  0xffffffe000206792 in ftrace_make_call (rec=<optimized out>,
> > > addr=<optimized out>) at arch/riscv/kernel/ftrace.c:109
> > > #3  0xffffffe0002c9be4 in __ftrace_replace_code (rec=0xffffffe01ae40020, e
> > >     nable=true) at kernel/trace/ftrace.c:2503
> > > #4  0xffffffe0002ca092 in ftrace_replace_code (mod_flags=<optimized
> > >     out>) at kernel/trace/ftrace.c:2530
> > > #5  0xffffffe0002ca24a in ftrace_modify_all_code (command=9) at kernel
> > >    /trace/ftrace.c:2677
> > > #6  0xffffffe0002ca2ee in __ftrace_modify_code (data=<optimized out>) at
> > >    kernel/trace/ftrace.c:2703
> > > #7  0xffffffe0002c1390 in multi_cpu_stop (data=0x0) at kernel/stop_machin
> > >    e.c:224
> > > #8  0xffffffe0002c0fbe in cpu_stopper_thread (cpu=<optimized out>) at kern
> > >    el/stop_machine.c:491
> > > #9  0xffffffe0002343be in smpboot_thread_fn (data=0x0) at kernel/smpboot.
> > >    c:165
> > > #10 0xffffffe00022f894 in kthread (_create=0xffffffe01af13040) at kern
> > >    el/kthread.c:292
> > > #11 0xffffffe000201fac in handle_exception () at arch/riscv/kernel/entry.S:236
> > >
>
> It seems to me that the problem happens on the waiting threads, it
No, that is the call trace to show ftrace_make_call ->
flush_icache_all and we should give notrace on the whole path.

> doesn't cause the issue on the patching code thread, so it is OK that
> these functions are traceable. I probably don't figure out all
> possible situations, do you find any issue and reason to change the
> annotation of these functions?
>
> > > On Wed, Oct 21, 2020 at 3:38 PM Zong Li <zong.li@sifive.com> wrote:
> > > >
> > > > Like the commit cb9d7fd51d9f ("watchdog: Mark watchdog touch functions
> > > > as notrace"), some architectures assume that the stopped CPUs don't make
> > > > function calls to traceable functions when they are in the stopped
> > > > state. For example, it causes unexpected kernel crashed when switching
> > > > tracer on RISC-V.
> > > >
> > > > The following patches added calls to these two functions, fix it by
> > > > adding the notrace annotations.
> > > >
> > > > Fixes: 4ecf0a43e729 ("processor: get rid of cpu_relax_yield")
> > > > Fixes: 366237e7b083 ("stop_machine: Provide RCU quiescent state in
> > > > multi_cpu_stop()")
> > > >
> > > > Signed-off-by: Zong Li <zong.li@sifive.com>
> > > > ---
> > > >  kernel/rcu/tree.c     | 2 +-
> > > >  kernel/stop_machine.c | 2 +-
> > > >  2 files changed, 2 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > > > index 06895ef85d69..2a52f42f64b6 100644
> > > > --- a/kernel/rcu/tree.c
> > > > +++ b/kernel/rcu/tree.c
> > > > @@ -409,7 +409,7 @@ bool rcu_eqs_special_set(int cpu)
> > > >   *
> > > >   * The caller must have disabled interrupts and must not be idle.
> > > >   */
> > > > -void rcu_momentary_dyntick_idle(void)
> > > > +notrace void rcu_momentary_dyntick_idle(void)
> > > >  {
> > > >         int special;
> > > >
> > > > diff --git a/kernel/stop_machine.c b/kernel/stop_machine.c
> > > > index 865bb0228ab6..890b79cf0e7c 100644
> > > > --- a/kernel/stop_machine.c
> > > > +++ b/kernel/stop_machine.c
> > > > @@ -178,7 +178,7 @@ static void ack_state(struct multi_stop_data *msdata)
> > > >                 set_state(msdata, msdata->state + 1);
> > > >  }
> > > >
> > > > -void __weak stop_machine_yield(const struct cpumask *cpumask)
> > > > +notrace void __weak stop_machine_yield(const struct cpumask *cpumask)
> > > >  {
> > > >         cpu_relax();
> > > >  }
> > > > --
> > > > 2.28.0
> > > >
> > >
> > >
> > > --
> > > Best Regards
> > >  Guo Ren
> > >
> > > ML: https://lore.kernel.org/linux-csky/
> >
> >
> >
> > --
> > Regards,
> > Atish



-- 
Best Regards
 Guo Ren

ML: https://lore.kernel.org/linux-csky/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
