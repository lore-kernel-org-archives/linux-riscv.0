Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D044C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 20:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFv+vxH2A+aFKQcRh/bDdhc7MnNolqTrkxWwy6+uS8o=; b=qvBTQEsoaigN88
	BFZWI3DmnmxrI5D29chSkXbeEdVTP04tn0fvg6f1qq/e9VVs8MEsB2rMXU/KlRZr5p3hiJLyupNpl
	NdAXddXDuMp0Y2Wb8pFX0JtOMCC0XEc+h0bpciET9E56vRocsPy9ZaoFpghTQP8sl4OFufGjK4M11
	LuNyT0TxymGbGncBEvBI9dAJ0I+Zm5qVP4lb186SYGa3G3suwNGWJkNsi8X9Fy/l5+hox1Qr0UZIS
	UoR6WXtOYEhH/P4mbCKl1MBvMm0Vn2orQzj3uJyDauMsHRXXBBhFH0auVR2pJAnNppd/QaE5Lhh+B
	SxekTs+vZlMOO9Fpu8AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I1x-00AHEP-Om; Mon, 05 Dec 2022 20:25:37 +0000
Received: from mail-lf1-x136.google.com ([2a00:1450:4864:20::136])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2I1v-00AHCv-Bn
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 20:25:36 +0000
Received: by mail-lf1-x136.google.com with SMTP id j4so20448395lfk.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Dec 2022 12:25:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ogmJ/dWUBZD+uMZNYkaeGhKQ/egpqNLTz8BioKE74tU=;
        b=n7ANnxZecCZLWKpbDSw9/wmUZMNBAUMFtFCN2mnfhhBbLAk61s61OcFWFrt7oswmbl
         KNLv8uhpec4Xk/MizbMsHeZ5unEljkjha4WvDu5Ebu2SSrKYyAHfMQCX8VOoYvbovLYj
         TKfBzZqHhQWJhcmVE/SL5ydMQwMX29W80VoG0IU69JKgU71Mbouzn+RSey6l6DmeKRZB
         Ioc/wizRl7EIPA8eh3Mgr9rYOyl0mFgkEH/gYIOjogtuA1lLHGHOmybRp20TPy8fdNhj
         3gDeJq+bLP2VyHhEZzurpGCw0lrCkY48Kn59iU7NuMfazElxEIX8XHXNiIdx7xlTkhp5
         sFPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ogmJ/dWUBZD+uMZNYkaeGhKQ/egpqNLTz8BioKE74tU=;
        b=V5Nq3Sp9KRfJ/4TXQGbN4uqHUwptmJ9HBqL+HtXTxUKKiTx1wEjWWlMIAtoYqMBWCW
         exFDcdhif7cdyCsJJ4oqwzqfJnpFFeUJQA1TuiRqw+Ywj4gpdGCGyGt/elchyN5RbC95
         76SZHpn+pm1vXf/tTRyU0Pynoy/DzWa709Dyk90OmVd5Nx9PRuwM0cnTJ+ZLJvv6d0y+
         ZnVdIPHhV+apPe7bKsuXIBx589vmRulc1qzHFNDOSypcrOWBANWCtkOHsyDVQL2nuVzg
         CyrI0DcfIK6NRcm1+3C3tvCfCMyAInUpsqfladMVfkm4bNnKROL7uJwsUN0sFw+SU0QT
         YLdg==
X-Gm-Message-State: ANoB5pnUbmnGpLJ/iI0hLLoiQCEPOe7Gc1mYiU+hpB0DEoC4Ci8AAIYO
	FSHyB87h5aShHvhFA3TBSL4=
X-Google-Smtp-Source: AA0mqf433ack9SZ8Lay/Ax51df2+q54C9rGETtEc478pwoXLpy6FyiRYvdQFITN86i8KqJezzo8baA==
X-Received: by 2002:a05:6512:33c5:b0:4b5:237a:fb0d with SMTP id d5-20020a05651233c500b004b5237afb0dmr9697654lfg.658.1670271930570;
        Mon, 05 Dec 2022 12:25:30 -0800 (PST)
Received: from curiosity ([5.188.167.245])
        by smtp.gmail.com with ESMTPSA id u7-20020a2eb807000000b002778d482800sm1464094ljo.59.2022.12.05.12.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Dec 2022 12:25:29 -0800 (PST)
Date: Mon, 5 Dec 2022 23:25:29 +0300
From: Sergey Matyukevich <geomatsi@gmail.com>
To: Andrew Bresticker <abrestic@rivosinc.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>
Subject: Re: [PATCH RFC v2 3/3] riscv: hw-breakpoints: add more trigger
 controls
Message-ID: <Y45TuQUQiDsH2cJ1@curiosity>
References: <20221203215535.208948-1-geomatsi@gmail.com>
 <20221203215535.208948-4-geomatsi@gmail.com>
 <CALE4mHrrxTJaQ5YYZamS9GmNhGopiUA3jk5+iw1XAn=8=XT=fg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CALE4mHrrxTJaQ5YYZamS9GmNhGopiUA3jk5+iw1XAn=8=XT=fg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_122535_429258_0ABF51BB 
X-CRM114-Status: GOOD (  26.53  )
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

Hi Andrew,


> Hi Sergey,
> 
> On Sat, Dec 3, 2022 at 4:55 PM Sergey Matyukevich <geomatsi@gmail.com> wrote:
> >
> > From: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> >
> > RISC-V SBI Debug Trigger extension proposal defines multiple functions
> > to control debug triggers. The pair of install/uninstall functions was
> > enough to implement ptrace interface for user-space debug. This patch
> > implements kernel wrappers for start/update/stop SBI functions. The
> > intended users of these control wrappers are kgdb and kernel modules
> > that make use of kernel-wide hardware breakpoints and watchpoints.
> >
> > Signed-off-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> 
> <snip>
> 
> > diff --git a/arch/riscv/include/asm/hw_breakpoint.h b/arch/riscv/include/asm/hw_breakpoint.h
> > index 5bb3b55cd464..afc59f8e034e 100644
> > --- a/arch/riscv/include/asm/hw_breakpoint.h
> > +++ b/arch/riscv/include/asm/hw_breakpoint.h
> > @@ -137,6 +137,9 @@ int hw_breakpoint_arch_parse(struct perf_event *bp,
> >  int hw_breakpoint_exceptions_notify(struct notifier_block *unused,
> >                                     unsigned long val, void *data);
> >
> > +void arch_enable_hw_breakpoint(struct perf_event *bp);
> > +void arch_update_hw_breakpoint(struct perf_event *bp);
> > +void arch_disable_hw_breakpoint(struct perf_event *bp);
> >  int arch_install_hw_breakpoint(struct perf_event *bp);
> >  void arch_uninstall_hw_breakpoint(struct perf_event *bp);
> >  void hw_breakpoint_pmu_read(struct perf_event *bp);
> > @@ -153,5 +156,17 @@ static inline void clear_ptrace_hw_breakpoint(struct task_struct *tsk)
> >  {
> >  }
> >
> > +void arch_enable_hw_breakpoint(struct perf_event *bp)
> > +{
> > +}
> > +
> > +void arch_update_hw_breakpoint(struct perf_event *bp)
> > +{
> > +}
> > +
> > +void arch_disable_hw_breakpoint(struct perf_event *bp)
> > +{
> > +}
> 
> I don't see any references to {enable,update,disable}_hw_breakpoint in
> common kernel code, nor do any other architectures define these
> functions. Who are the intended users? Do we even need them for kgdb
> on RISC-V?

SBI Debug Trigger extension proposal defines more functions than just
install/uninstall required for ptrace hw-breakpoints API. So this patch
is an attempt to expose some additional SBI features to the rest of the
kernel.

For instance, I have been using these stop/update/start functions for
managing kernel-wide hw-breakpoints when experimenting with a sample
module from samples/hw_breakpoint. It can be convenient to modify a
breakpoint or watchpoint when it fires, e.g. to perform single-step
before proceeding execution. Full-fledged unregister/register cycle is
not suitable for this task. And this is where disable/update/enable
sequence can help.

I haven't yet tried to implement hw-breakpoint support in RISC-V kgdb,
so I don't know for sure if these custom calls are needed there.

> > diff --git a/arch/riscv/kernel/hw_breakpoint.c b/arch/riscv/kernel/hw_breakpoint.c
> > index 8eddf512cd03..ca7df02830c2 100644
> > --- a/arch/riscv/kernel/hw_breakpoint.c
> > +++ b/arch/riscv/kernel/hw_breakpoint.c
> > @@ -2,6 +2,7 @@
> >
> >  #include <linux/hw_breakpoint.h>
> >  #include <linux/perf_event.h>
> > +#include <linux/spinlock.h>
> >  #include <linux/percpu.h>
> >  #include <linux/kdebug.h>
> >
> > @@ -9,6 +10,8 @@
> >
> >  /* bps/wps currently set on each debug trigger for each cpu */
> >  static DEFINE_PER_CPU(struct perf_event *, bp_per_reg[HBP_NUM_MAX]);
> > +static DEFINE_PER_CPU(unsigned long, msg_lock_flags);
> > +static DEFINE_PER_CPU(raw_spinlock_t, msg_lock);
> 
> I'm not sure I understand the point of this per-CPU spinlock. Just
> disable preemption (and interrupts, if necessary).
> 
> Also, arch_{install,uninstall}_hw_breakpoint are already expected to
> be called from atomic context; is the intention here that they be
> callable from outside atomic context?

These additional locsk are not needed for install/uninstall pair due to
the reason that you mentioned: those calls are called by kernel event
core in atomic context with ctx->lock held. These locks are needed only
to make sure that new 'arch_update_hw_breakpoint' function can use the
same message buffers as install/uninstall.

Regards,
Sergey

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
