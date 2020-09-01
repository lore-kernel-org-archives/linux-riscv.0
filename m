Return-Path: <SRS0=nmAS=CK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98CB7C433E2
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 15:20:52 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 543892078B
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2020 15:20:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="X/tGok8W";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="L77kMGJf"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 543892078B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=B81rLBMm1S6RQlw+EBr5J1iswn/0Qp83B2gZn2AgCZI=; b=X/tGok8WVqdKTovd4wEfnTw39
	C4OHOyvgtuzJZMJ/VAB3th3MCR5zekTrcpZ62ETEAeLunkTXHcsufuNRiR915cxvPUqzr8KJewnQu
	YyzXVeXMHo5VwtNZMkr6Yv31ws0nmSIQLmOmwPrMsRbeAwK1VuUWy2VfrWOSHXbjzP5x+Qa6IVI1/
	Rok4EI79KyPWLsbz4MEvjkqhRTOpcwdxoG9itvKR/KRPEK/+44n/boi5CfjJ1DkjgWjrmwjOscRL9
	vZSHkoFeny9j+xm8A0UAfgdrVEcxEfpReerTGBEHbkU2r4gZSi3NdteDttvkzl6TIOnC5AF57l8WN
	gosRstuOA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kD85Q-0007j3-VM; Tue, 01 Sep 2020 15:20:41 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kD85N-0007hw-Ol
 for linux-riscv@lists.infradead.org; Tue, 01 Sep 2020 15:20:39 +0000
Received: by mail-wm1-x344.google.com with SMTP id e17so1561342wme.0
 for <linux-riscv@lists.infradead.org>; Tue, 01 Sep 2020 08:20:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=tMjitHZNBt8kTO+CIJfeM1vmU9I4HlH8A4gIVmfnjGY=;
 b=L77kMGJfQTrk5Xl9ZAL/3+B/1OewqGvBlXziTF4NBfHE8AA6RzQ8TDLb7w+80PYJ1C
 +MdodKJTlmLGE1Ud5RWtzEDWDGwCnMZd6z7JfaWfAVeJUykNoUbiPtpto3iUtFoGm2d8
 L0N8dMqd64L3ggPPJKkETH6OTe9GwGpoKFPtYmCLrBXPFoV+1vhDKg0CiKem1ck6s1e6
 FhZucW8W/2D81Uz6Vku81IbYLq+df1oVmRwZ+AWEA/Hz76WpfGzjaIGc6emPxBoMk6yf
 mVoZmTd3g1Td51HqeAqHtmLR92TSSwGBYQMCIgGQO6aMPaZJyPU/D+7Qmkj3fEU1bo86
 Vyaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=tMjitHZNBt8kTO+CIJfeM1vmU9I4HlH8A4gIVmfnjGY=;
 b=lzr5ZLUaXuJUhRB7U2fbM5NSqACkJlZSzrsPkqRWmnISSdE0UyIa/2wJpdMJDKTFfi
 BM9v0/zGi/avxsxd9V3ynLPlieKJO2ZvrHT5lEOw0+LQcOHLeFY7agIYo7kAku1ihaOK
 SsoMMd6dg5mnVjEbOOeFyQHp3K6kEEr3rg6u/hieTmMW0FP+juvf0utXH+/8PGzMwPRz
 PI1BqCeWT4DimDIfRomaEtZCwGNf75Zw5wwG10HFX3p8zU30nYSNTsoi1K96qcZ2GEOZ
 jIYbsv5CwG/efUn7r5YOZyB1EaWheuZ0KAXr8o4Jvq65h9eHIlk5kg4el2dpYI4ckvPz
 /JMA==
X-Gm-Message-State: AOAM533hZmCysl7su88nrTEnyGaeSBN/wfKXUmwpcYgTtoxWg4Bz7lVG
 wniibrJ1ZxJ4YwBDTlG/JvNsi0ARiU1cHFEl9JC7eg==
X-Google-Smtp-Source: ABdhPJzwYy9cK5sFQqzqHPjeGTpCHCF8czMdkOBH4/m0P0epqL9U/Qtv+eDqWf8ERuSUsKNU6Tu5jAJVE+A4tRub2bQ=
X-Received: by 2002:a7b:c0c5:: with SMTP id s5mr2251524wmh.152.1598973635458; 
 Tue, 01 Sep 2020 08:20:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200827082251.1591-1-jiangyifei@huawei.com>
 <20200827082251.1591-3-jiangyifei@huawei.com>
 <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
 <3915816D913D8241BB43E932213F57D4ADD8F34F@dggemm525-mbs.china.huawei.com>
In-Reply-To: <3915816D913D8241BB43E932213F57D4ADD8F34F@dggemm525-mbs.china.huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 1 Sep 2020 20:50:23 +0530
Message-ID: <CAAhSdy3jvCcA=DsR6NoZ4HRx9qXTC-Wwc+B3T79TKDtXBPd8Jw@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
To: Jiangyifei <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200901_112037_968971_0907925B 
X-CRM114-Status: GOOD (  40.06  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>,
 Zhanghailiang <zhang.zhanghailiang@huawei.com>,
 KVM General <kvm@vger.kernel.org>, yinyipeng <yinyipeng1@huawei.com>,
 Anup Patel <anup.patel@wdc.com>,
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>,
 Atish Patra <atish.patra@wdc.com>,
 "Zhangxiaofeng \(F\)" <victor.zhangxiaofeng@huawei.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 "deepa.kernel@gmail.com" <deepa.kernel@gmail.com>,
 "kvm-riscv@lists.infradead.org" <kvm-riscv@lists.infradead.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 "zhaosiqi \(A\)" <zhaosiqi3@huawei.com>, "Wubin \(H\)" <wu.wubin@huawei.com>,
 "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Aug 31, 2020 at 8:09 AM Jiangyifei <jiangyifei@huawei.com> wrote:
>
>
> > -----Original Message-----
> > From: Anup Patel [mailto:anup@brainfault.org]
> > Sent: Friday, August 28, 2020 12:54 PM
> > To: Jiangyifei <jiangyifei@huawei.com>
> > Cc: Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> > <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Anup Patel
> > <anup.patel@wdc.com>; Alistair Francis <alistair.francis@wdc.com>; Atish
> > Patra <atish.patra@wdc.com>; deepa.kernel@gmail.com;
> > kvm-riscv@lists.infradead.org; KVM General <kvm@vger.kernel.org>;
> > linux-riscv <linux-riscv@lists.infradead.org>; linux-kernel@vger.kernel.org List
> > <linux-kernel@vger.kernel.org>; Zhangxiaofeng (F)
> > <victor.zhangxiaofeng@huawei.com>; Wubin (H) <wu.wubin@huawei.com>;
> > Zhanghailiang <zhang.zhanghailiang@huawei.com>; dengkai (A)
> > <dengkai1@huawei.com>; yinyipeng <yinyipeng1@huawei.com>
> > Subject: Re: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
> >
> > On Thu, Aug 27, 2020 at 1:54 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> > >
> > > Add two interfaces of log dirty for kvm_main.c, and detele the
> > > interface kvm_vm_ioctl_get_dirty_log which is redundantly defined.
> > >
> > > CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT is added in defconfig.
> > >
> > > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> > > ---
> > >  arch/riscv/configs/defconfig |  1 +
> > >  arch/riscv/kvm/Kconfig       |  1 +
> > >  arch/riscv/kvm/mmu.c         | 43
> > ++++++++++++++++++++++++++++++++++++
> > >  arch/riscv/kvm/vm.c          |  6 -----
> > >  4 files changed, 45 insertions(+), 6 deletions(-)
> > >
> > > diff --git a/arch/riscv/configs/defconfig
> > > b/arch/riscv/configs/defconfig index d36e1000bbd3..857d799672c2 100644
> > > --- a/arch/riscv/configs/defconfig
> > > +++ b/arch/riscv/configs/defconfig
> > > @@ -19,6 +19,7 @@ CONFIG_SOC_VIRT=y
> > >  CONFIG_SMP=y
> > >  CONFIG_VIRTUALIZATION=y
> > >  CONFIG_KVM=y
> > > +CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> > >  CONFIG_HOTPLUG_CPU=y
> > >  CONFIG_MODULES=y
> > >  CONFIG_MODULE_UNLOAD=y
> > > diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig index
> > > 2356dc52ebb3..91fcffc70e5d 100644
> > > --- a/arch/riscv/kvm/Kconfig
> > > +++ b/arch/riscv/kvm/Kconfig
> > > @@ -26,6 +26,7 @@ config KVM
> > >         select KVM_MMIO
> > >         select HAVE_KVM_VCPU_ASYNC_IOCTL
> > >         select SRCU
> > > +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> > >         help
> > >           Support hosting virtualized guest machines.
> > >
> > > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> > > 88bce80ee983..df2a470c25e4 100644
> > > --- a/arch/riscv/kvm/mmu.c
> > > +++ b/arch/riscv/kvm/mmu.c
> > > @@ -358,6 +358,43 @@ void stage2_wp_memory_region(struct kvm *kvm,
> > int slot)
> > >         kvm_flush_remote_tlbs(kvm);
> > >  }
> > >
> > > +/**
> > > + * kvm_mmu_write_protect_pt_masked() - write protect dirty pages
> > > + * @kvm:    The KVM pointer
> > > + * @slot:   The memory slot associated with mask
> > > + * @gfn_offset: The gfn offset in memory slot
> > > + * @mask:   The mask of dirty pages at offset 'gfn_offset' in this memory
> > > + *      slot to be write protected
> > > + *
> > > + * Walks bits set in mask write protects the associated pte's. Caller
> > > +must
> > > + * acquire kvm_mmu_lock.
> > > + */
> > > +static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
> > > +        struct kvm_memory_slot *slot,
> > > +        gfn_t gfn_offset, unsigned long mask) {
> > > +    phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> > > +    phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> > > +    phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> > > +
> > > +    stage2_wp_range(kvm, start, end); }
> > > +
> > > +/*
> > > + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for
> > > +selected
> > > + * dirty pages.
> > > + *
> > > + * It calls kvm_mmu_write_protect_pt_masked to write protect selected
> > > +pages to
> > > + * enable dirty logging for them.
> > > + */
> > > +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> > > +        struct kvm_memory_slot *slot,
> > > +        gfn_t gfn_offset, unsigned long mask) {
> > > +    kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask); }
> > > +
> > > +
> > >  int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> > >                    unsigned long size, bool writable)  { @@ -433,6
> > > +470,12 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct
> > > kvm_memory_slot *memslot)  {  }
> > >
> > > +void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> > > +                                       struct kvm_memory_slot
> > > +*memslot) {
> > > +       kvm_flush_remote_tlbs(kvm);
> > > +}
> > > +
> > >  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot
> > > *free)  {  } diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > > index 4f2498198cb5..f7405676903b 100644
> > > --- a/arch/riscv/kvm/vm.c
> > > +++ b/arch/riscv/kvm/vm.c
> > > @@ -12,12 +12,6 @@
> > >  #include <linux/uaccess.h>
> > >  #include <linux/kvm_host.h>
> > >
> > > -int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log
> > > *log) -{
> > > -       /* TODO: To be added later. */
> > > -       return -ENOTSUPP;
> > > -}
> > > -
> > >  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)  {
> > >         int r;
> > > --
> > > 2.19.1
> > >
> > >
> >
> > I already have a similar change as part of v14 KVM RISC-V series.
> >
> > Let us coordinate better. Please let us know in-advance for any KVM RISC-V
> > feature you plan to work on. Otherwise, this leads to efforts wasted at your
> > end or at our end.
> >
> > Regards,
> > Anup
>
> Hi Anup,
>
> Thanks for accepting our patches.
>
> In the next few weeks we plan to work on the following:
> 1. memory reverse mapping (rmap), related to migration.

This is fine.

> 2. irqfd.

We had past discussion about doing in-kernel PLIC.

Generally, in-kernel emulation of an interrupt controller provides the
following benefits:
1. Faster emulation of timer interrupts
2. Faster emulation of ipi interrupts
3. Irqfd for Vhost
4. Pass-through interrupt routing
5. Anything else ??

For RISC-V, timer and ipi interrupts are handled locally by each HART
so in-kernel PLIC emulation won't provide 1) and 2). Also, considering
simplicity of PLIC we can't provide 4) as well. This means 3) might be
the only benefit of in-kernel PLIC.

There are already efforts underway to have a new interrupt-controller
spec which has virtualization support and also supports MSIs. I think
it is OKAY to have PLIC emulated in user-space for now. We will go
for in-kernel emulation and irqfd support for the new interrupt controller.

Does this sound okay ??

(Please talk to Andrew Waterman and John Hauser for more details on
new interrupt-controller spec)

> 3. implmentaion related to the dedicated clock event source proposal.

There are two SBI extensions required:
1. Para-virt CPU steal accounting
    This is for accounting stolen time by hypervisors.
2. Para-virt time scaling
    This is for migrating Guest/VM across Host with different timer frequency.

We are already doing 1) and we will be proposing an SBI extension for it in
the UnixPlatformSpec mailing list soon.

By "dedicated clock event source" I assume you meant something related
to 2). I would suggest you to join UnixPlatformSpec mailing list on RISC-V
foundation and propose your SBI spec related ideas over there.

>
> Besides, we are aware of that you are working on irq chip emulation in KVM. Meanwhile, our implementaiton of irqfd and the clock event source has dependency on the irq chip and we may well modify the irq chip emulation code. So could you share with us any ideas, plans or progress regarding your work since there might be potential collision?

Please see my comments on irqfd.

>
> Let's stay in touch in the long run and coodinate better. BTW, could you share with us if there's any regular discussion sessions focused on RISC-V KVM?

I have started an email discussion about having regular Hypervisor sync-up
call on the UnixPlatformSpec mailing list. We can use this sync-up call for
KVM RISC-V as well.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
