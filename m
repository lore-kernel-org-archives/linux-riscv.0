Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E41C636F9
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 22:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pN9F1r5WfJyK+bXVnkcdON1e4TpmihvP1Y46C8QR20=; b=BGp7VpVWIVJffI
	/85Ia+vwASLKo8FqJZNqCSIQPwK879SIxaUopGbmSap6UgiDSjf5J7SEY/aYygzy/Zi++6BoalC7D
	gl82FC1FD32SgLfhRY9f2mhdRoeXFCmiWNR7DLQXkwogQnVr9EQYxadHpMDxSuMWDJ38RFtY7TsIQ
	KcaW61vTkRBl7SV2eR1uKnOMFm94kQ94Jn3DHczyyqFt+Dxxdo/DTp/11gNaWemJPA+wKSwCkhbp+
	SUdLgZZJyvOQA1afz2AvrUmcBZsvtShtHOTntBLzeq2B9XGpdXbYnTPYFb9S8KKPHjFTzP4gaYvzm
	BibXBirNx8rNc4QRx9mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JZb-00B4ax-Rd; Mon, 05 Dec 2022 22:04:27 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2JZY-00B4Vb-5X
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 22:04:26 +0000
Received: by mail-ej1-x62e.google.com with SMTP id n21so1771505ejb.9
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 14:04:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=s9lc01aCxQTSJwdx7RUodm3mRi7nxix9tLqZdF2sFQo=;
        b=aONPpMB54y9faDQtvFnc8RfGe22FaOc9EcPYO6fH7m77YVH34zckI4t5zwJFj2LPRn
         Wkef5GGEyBWRC7xgGNpgQnmwZDF2SV92UI4D6e7b+RJUE1vAX0IxZG+LgpP/x8o9BXXg
         nUOwE/IbaYsl/mFyI2fEa/IGMYruiQ0JMSEC7pcUSspfqAg9/lpQ7y34sTgCHQIMJp7V
         kXmzmqkireW08op7Lbio2kEZk5kpdURtD0VVwmV7LQz5JJEY8ALGnE9DAKIY0/G1VQXB
         9BbDhI4C13tyVy1WCti4TlRQj/6RxdmBkStRc/GQalqTQh59k4xCpBKaWEdVNN4kyu4u
         w0bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s9lc01aCxQTSJwdx7RUodm3mRi7nxix9tLqZdF2sFQo=;
        b=q5ittd64OkUIUfIRylrsM24SqauS5+NpV8mYkCwFyoTzdqAaXUnPmdGSMzuik9EWA7
         HbMWnUw8kOy3nOjNK7J+aGIXbbH8t5fBf2TxBnfeClnvFPHgair7aRCk5otQeap843bt
         Zpz349kahLV62JnoG+1OvDvfCZlkR0MvyZVatXaswOOxdA0jCj8lRK695kdCrQMsrN5n
         +1P4KIAfbUGwa51A0resj+znxgXclfTyZw+kKh2/+FPjsk0lTmgxgTYNQmHN+MDu1J0d
         w13UP8nM0rhsELDhvuq9VQlXKRd5qEWrUqLFWO7K2XnPZodVga/2D3LJbuUKTGUS0Dbl
         WbJA==
X-Gm-Message-State: ANoB5pkQltxWZhFt3z+k2bJCeoT0gCAC6abHBh68L3C57MySSuXmI763
	YP8mv2cKmdzdqDRGhxIHyOamk3ratn2fp6GjpqtYcw==
X-Google-Smtp-Source: AA0mqf6pvPdZ4FTJxIRInbmyU3P5Gysoxv0jzItR7ncFVPN8Th1XmEH6dUBNagCD4TWu62MM3uaWessrJIPBqKHoXeo=
X-Received: by 2002:a17:906:a198:b0:7b4:bc42:3b44 with SMTP id
 s24-20020a170906a19800b007b4bc423b44mr64679643ejy.101.1670277860575; Mon, 05
 Dec 2022 14:04:20 -0800 (PST)
MIME-Version: 1.0
References: <20221203215535.208948-1-geomatsi@gmail.com> <20221203215535.208948-4-geomatsi@gmail.com>
 <CALE4mHrrxTJaQ5YYZamS9GmNhGopiUA3jk5+iw1XAn=8=XT=fg@mail.gmail.com> <Y45TuQUQiDsH2cJ1@curiosity>
In-Reply-To: <Y45TuQUQiDsH2cJ1@curiosity>
From: Andrew Bresticker <abrestic@rivosinc.com>
Date: Mon, 5 Dec 2022 17:04:09 -0500
Message-ID: <CALE4mHpf8obcfiWEvstBMycTWYur0JoNeAYMNn5r=q-gdb6ZXQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: hw-breakpoints: add more trigger controls
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, 
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_140424_458740_31898905 
X-CRM114-Status: GOOD (  30.89  )
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

On Mon, Dec 5, 2022 at 3:25 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
>
> Hi Andrew,
>
>
> > Hi Sergey,
> >
> > On Sat, Dec 3, 2022 at 4:55 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> > >
> > > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> > >
> > > RISC-V SBI Debug Trigger extension proposal defines multiple functions
> > > to control debug triggers. The pair of install/uninstall functions was
> > > enough to implement ptrace interface for user-space debug. This patch
> > > implements kernel wrappers for start/update/stop SBI functions. The
> > > intended users of these control wrappers are kgdb and kernel modules
> > > that make use of kernel-wide hardware breakpoints and watchpoints.
> > >
> > > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> >
> > <snip>
> >
> > > diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
> > > index 5bb3b55cd464..afc59f8e034e 100644
> > > --- a/arch/riscv/include/asm/hw_breakpoint.h
> > > +++ b/arch/riscv/include/asm/hw_breakpoint.h
> > > @@ -137,6 +137,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
> > >  int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
> > >                                     unsigned long val, void *data);
> > >
> > > +void arch_enable_hw_breakpoint(struct perf_event *bp);
> > > +void arch_update_hw_breakpoint(struct perf_event *bp);
> > > +void arch_disable_hw_breakpoint(struct perf_event *bp);
> > >  int arch_install_hw_breakpoint(struct perf_event *bp);
> > >  void arch_uninstall_hw_breakpoint(struct perf_event *bp);
> > >  void hw_breakpoint_pmu_read(struct perf_event *bp);
> > > @@ -153,5 +156,17 @@ static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> > >  {
> > >  }
> > >
> > > +void arch_enable_hw_breakpoint(struct perf_event *bp)
> > > +{
> > > +}
> > > +
> > > +void arch_update_hw_breakpoint(struct perf_event *bp)
> > > +{
> > > +}
> > > +
> > > +void arch_disable_hw_breakpoint(struct perf_event *bp)
> > > +{
> > > +}
> >
> > I don't see any references to {enable,update,disable}_hw_breakpoint in
> > common kernel code, nor do any other architectures define these
> > functions. Who are the intended users? Do we even need them for kgdb
> > on RISC-V?
>
> SBI Debug Trigger extension proposal defines more functions than just
> install/uninstall required for ptrace hw-breakpoints API. So this patch
> is an attempt to expose some additional SBI features to the rest of the
> kernel.

Got it. IMHO it's generally best not to add dead code unless a user
for it is imminent. It's harder to review something if you don't know
exactly how it'll be used.

> For instance, I have been using these stop/update/start functions for
> managing kernel-wide hw-breakpoints when experimenting with a sample
> module from samples/hw_breakpoint. It can be convenient to modify a
> breakpoint or watchpoint when it fires, e.g. to perform single-step
> before proceeding execution. Full-fledged unregister/register cycle is
> not suitable for this task. And this is where disable/update/enable
> sequence can help.
>
> I haven't yet tried to implement hw-breakpoint support in RISC-V kgdb,
> so I don't know for sure if these custom calls are needed there.
>
> > > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> > > index 8eddf512cd03..ca7df02830c2 100644
> > > --- a/arch/riscv/kernel/hw_breakpoint.c
> > > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > > @@ -2,6 +2,7 @@
> > >
> > >  #include <linux/hw_breakpoint.h>
> > >  #include <linux/perf_event.h>
> > > +#include <linux/spinlock.h>
> > >  #include <linux/percpu.h>
> > >  #include <linux/kdebug.h>
> > >
> > > @@ -9,6 +10,8 @@
> > >
> > >  /* bps/wps currently set on each debug trigger for each cpu */
> > >  static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
> > > +static DEFINE_PER_CPU(unsigned long, msg_lock_flags);
> > > +static DEFINE_PER_CPU(raw_spinlock_t, msg_lock);
> >
> > I'm not sure I understand the point of this per-CPU spinlock. Just
> > disable preemption (and interrupts, if necessary).
> >
> > Also, arch_{install,uninstall}_hw_breakpoint are already expected to
> > be called from atomic context; is the intention here that they be
> > callable from outside atomic context?
>
> These additional locsk are not needed for install/uninstall pair due to
> the reason that you mentioned: those calls are called by kernel event
> core in atomic context with ctx->lock held. These locks are needed only
> to make sure that new 'arch_update_hw_breakpoint' function can use the
> same message buffers as install/uninstall.

Sure, but you can achieve the same by disabling preemption. No need
for an actual spinlock.

-Andrew

>
> Regards,
> Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
