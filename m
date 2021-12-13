Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6EE1C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Dec 2021 21:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rDVOE1v4nhUpDvcsPT2TS9dqgV6izA8UVCXG0V6zeO8=; b=p5RzYloc9SAv1P
	8guF/W4Gz20vaLUVKy/ntj61d13LN2VFQUkgqcMMmC3Tfx25l6fq0+yvhIUfVBna13cMsahEDlnIx
	UfbQ3tyhYf9pmtipwPCBva/Pd2q2kTmi2LNfmBKiBLEGJY8WvkgjmWp7YISZMqT3z3tAvhv57lzD4
	IbZBuo8Pg2BYNW1fKo3ADbPiGpR0iNDAFxssHqQYw0nhiLc+XZpVYQBuxJsaP5L2MCtzvDnyRms/z
	DQ5c4JM3K+w2EH6b2qiVqvaR83P6E9NSocvbTJKchv+XRIW6EDglO7NC0DAw8APSN3+RleKRMXjNa
	GUMnSLX+t8+BsTX+dItA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mwsdc-00BRgd-UT; Mon, 13 Dec 2021 21:13:37 +0000
Received: from mail-yb1-xb34.google.com ([2607:f8b0:4864:20::b34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mwscM-00BQuR-HW
 for linux-riscv@lists.infradead.org; Mon, 13 Dec 2021 21:12:20 +0000
Received: by mail-yb1-xb34.google.com with SMTP id x32so41415833ybi.12
 for <linux-riscv@lists.infradead.org>; Mon, 13 Dec 2021 13:12:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=My/OmXhiq7OcGWJQkiyFCdd+Kv9m1hhBpvsAaIS748A=;
 b=sY0boUSc1kTXk72pj3AYCRHIOA8Z6v1zNg5f88fHXl3fc5dDyTD5tq09jKOUVmGhPK
 CItGWETFsRFeAZEYlBFXT9SNE6uCVO24zMKr5NFAubzN/HM0eTO+j6Q+4WrFA00zhBMy
 Lzi/fevPTDecqL4v1GIYSjkUz14rZmPCcu4nw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=My/OmXhiq7OcGWJQkiyFCdd+Kv9m1hhBpvsAaIS748A=;
 b=eH3LMt1OZytpDTfTdAqNGJOMxrJTa/b4G8YiXQWw04YYVdcP23SBTQJTlvAbmnq94h
 NlHND8EgPSh69KWQpBEOY8Wrn/279UfW6O4+J90Sor93JQ0Y08G9ndYPaxihW0eRkOcT
 cK4M9qRh61YT9j//x5sZV/CH3ILzgDMM0heAeI28ypThYIHpcePLBJZKQvc/BBVJ3fIg
 E2SSQywSfCDUMSVfPQahUgCZB+IWTAONUlUuqdTA+izAuR8pKznVMDPiHzB9G4CRtp5m
 cLMoFT3KIGq7/w0GGG2A3ky2IOPFSkSC/Wcpw+VDArOAb3KZV0tsCRsjC8GWlYktkiHS
 OCKg==
X-Gm-Message-State: AOAM533J+V9HJ6L7kl4DNxGuP1nYc/8r/oeBr+OMmNFtmWzlc/l6fwW/
 4HatydR6Mh3vKYMBfrEzJvyv3KLMAYHZAX+dSZQy
X-Google-Smtp-Source: ABdhPJyXbSLGCxibT4a70SEhm5mStRU/zPOS5amju8xNPK1f0j5SugkLU631wl+AaxrsP+OLo83bRKYQEBu7AaRlO50=
X-Received: by 2002:a25:bf8d:: with SMTP id l13mr1054805ybk.713.1639429937040; 
 Mon, 13 Dec 2021 13:12:17 -0800 (PST)
MIME-Version: 1.0
References: <20211204002038.113653-1-atishp@atishpatra.org>
 <20211204002038.113653-4-atishp@atishpatra.org>
 <48012a35c4f66340547ff50525792a29@kernel.org>
In-Reply-To: <48012a35c4f66340547ff50525792a29@kernel.org>
From: Atish Patra <atishp@atishpatra.org>
Date: Mon, 13 Dec 2021 13:12:06 -0800
Message-ID: <CAOnJCUJQrOqEX94Zcv_rfZj3ja0mrM-3NSWwgxj_sn_Q+aHTmQ@mail.gmail.com>
Subject: Re: [RFC 3/6] RISC-V: Use __cpu_up_stack/task_pointer only for
 spinwait method
To: Marc Zyngier <maz@kernel.org>
Cc: "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atishp@rivosinc.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup.patel@wdc.com>, 
 Greentime Hu <greentime.hu@sifive.com>, Guo Ren <guoren@linux.alibaba.com>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>, 
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org, 
 KVM General <kvm@vger.kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 Nanyong Sun <sunnanyong@huawei.com>, Nick Kossifidis <mick@ics.forth.gr>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>, 
 Vitaly Wool <vitaly.wool@konsulko.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211213_131218_640468_0FC86157 
X-CRM114-Status: GOOD (  29.57  )
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

On Mon, Dec 13, 2021 at 4:59 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2021-12-04 00:20, Atish Patra wrote:
> > From: Atish Patra <atishp@rivosinc.com>
> >
> > The __cpu_up_stack/task_pointer array is only used for spinwait method
> > now. The per cpu array based lookup is also fragile for platforms with
> > discontiguous/sparse hartids. The spinwait method is only used for
> > M-mode Linux or older firmwares without SBI HSM extension. For general
> > Linux systems, ordered booting method is preferred anyways to support
> > cpu hotplug and kexec.
> >
> > Make sure that __cpu_up_stack/task_pointer is only used for spinwait
> > method. Take this opportunity to rename it to
> > __cpu_spinwait_stack/task_pointer to emphasize the purpose as well.
> >
> > Signed-off-by: Atish Patra <atishp@rivosinc.com>
> > ---
> >  arch/riscv/include/asm/cpu_ops.h     |  2 --
> >  arch/riscv/kernel/cpu_ops.c          | 16 ----------------
> >  arch/riscv/kernel/cpu_ops_spinwait.c | 27 ++++++++++++++++++++++++++-
> >  arch/riscv/kernel/head.S             |  4 ++--
> >  arch/riscv/kernel/head.h             |  4 ++--
> >  5 files changed, 30 insertions(+), 23 deletions(-)
> >
> > diff --git a/arch/riscv/include/asm/cpu_ops.h
> > b/arch/riscv/include/asm/cpu_ops.h
> > index a8ec3c5c1bd2..134590f1b843 100644
> > --- a/arch/riscv/include/asm/cpu_ops.h
> > +++ b/arch/riscv/include/asm/cpu_ops.h
> > @@ -40,7 +40,5 @@ struct cpu_operations {
> >
> >  extern const struct cpu_operations *cpu_ops[NR_CPUS];
> >  void __init cpu_set_ops(int cpu);
> > -void cpu_update_secondary_bootdata(unsigned int cpuid,
> > -                                struct task_struct *tidle);
> >
> >  #endif /* ifndef __ASM_CPU_OPS_H */
> > diff --git a/arch/riscv/kernel/cpu_ops.c b/arch/riscv/kernel/cpu_ops.c
> > index 3f5a38b03044..c1e30f403c3b 100644
> > --- a/arch/riscv/kernel/cpu_ops.c
> > +++ b/arch/riscv/kernel/cpu_ops.c
> > @@ -8,31 +8,15 @@
> >  #include <linux/of.h>
> >  #include <linux/string.h>
> >  #include <linux/sched.h>
> > -#include <linux/sched/task_stack.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> >  const struct cpu_operations *cpu_ops[NR_CPUS] __ro_after_init;
> >
> > -void *__cpu_up_stack_pointer[NR_CPUS] __section(".data");
> > -void *__cpu_up_task_pointer[NR_CPUS] __section(".data");
> > -
> >  extern const struct cpu_operations cpu_ops_sbi;
> >  extern const struct cpu_operations cpu_ops_spinwait;
> >
> > -void cpu_update_secondary_bootdata(unsigned int cpuid,
> > -                                struct task_struct *tidle)
> > -{
> > -     int hartid = cpuid_to_hartid_map(cpuid);
> > -
> > -     /* Make sure tidle is updated */
> > -     smp_mb();
> > -     WRITE_ONCE(__cpu_up_stack_pointer[hartid],
> > -                task_stack_page(tidle) + THREAD_SIZE);
> > -     WRITE_ONCE(__cpu_up_task_pointer[hartid], tidle);
> > -}
> > -
> >  void __init cpu_set_ops(int cpuid)
> >  {
> >  #if IS_ENABLED(CONFIG_RISCV_SBI)
> > diff --git a/arch/riscv/kernel/cpu_ops_spinwait.c
> > b/arch/riscv/kernel/cpu_ops_spinwait.c
> > index b2c957bb68c1..9f398eb94f7a 100644
> > --- a/arch/riscv/kernel/cpu_ops_spinwait.c
> > +++ b/arch/riscv/kernel/cpu_ops_spinwait.c
> > @@ -6,11 +6,36 @@
> >  #include <linux/errno.h>
> >  #include <linux/of.h>
> >  #include <linux/string.h>
> > +#include <linux/sched/task_stack.h>
> >  #include <asm/cpu_ops.h>
> >  #include <asm/sbi.h>
> >  #include <asm/smp.h>
> >
> >  const struct cpu_operations cpu_ops_spinwait;
> > +void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
> > +void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
> > +
> > +static void cpu_update_secondary_bootdata(unsigned int cpuid,
> > +                                struct task_struct *tidle)
> > +{
> > +     int hartid = cpuid_to_hartid_map(cpuid);
> > +
> > +     /*
> > +      * The hartid must be less than NR_CPUS to avoid out-of-bound access
> > +      * errors for __cpu_spinwait_stack/task_pointer. That is not always
> > possible
> > +      * for platforms with discontiguous hartid numbering scheme. That's
> > why
> > +      * spinwait booting is not the recommended approach for any platforms
> > +      * and will be removed in future.
>
> How can you do that? Yes, spinning schemes are terrible.
> However, once you started supporting them, you are stuck.
>

This was a typo. It is supposed to say "disabled" in the future based
on other configs.
For now, it is enabled by default. Any platform with sparse hartid
needs to disable it in their own config.

In the future, we may be able to make it only available to M-mode
Linux if we can ensure that nobody is running
older firmware without SBI HSM extension.

> Best case, you can have an allow-list and only allow some
> older platforms to use them. You can also make some features
> dependent on non-spin schemes (kexec being one).
>
> But dropping support isn't a valid option, I'm afraid.
>
> Thanks,
>
>           M.
> --
> Jazz is not dead. It just smells funny...



-- 
Regards,
Atish

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
