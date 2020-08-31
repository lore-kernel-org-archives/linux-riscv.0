Return-Path: <SRS0=z0PQ=CJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCBBC433E2
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 02:40:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BAD020720
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Aug 2020 02:40:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="n72bEqw1"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BAD020720
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=huawei.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:Message-ID:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=/2V2ymZLfSthSLcT0dzc7GUFbXplOQzveooQ0+T6eW8=; b=n72bEqw17pb4FP0L5xniiteWQ
	DgVlp1Y1XV/tPZskkfoqT70BoAkXBeoUCwvjqBWRLWkfZ6rx3bgmYM+3Jus6FON065xTft0kvqgZI
	ek8VEjEAKplvw7R4HkW9dSnFLQEFeNoy/41viJQySuIknvMloy0qLzZX42PmdcoQipjE/g6YgmQVg
	2PCJRVyuAphv4anpYbcit0htx25zptZxg9FqA8agWmUCwi8xXOWl7QtYHIsxb5XspW1Q5Xg/B1bnB
	Y28gbenhGypG6BOSTMvr/AvHlqFXd+XroQ+ec3xR84hM6WpDbTIxrIZhuWVKU+osQeRu9Xxe3Wyec
	i43QwEnJg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kCZjj-00065Y-IO; Mon, 31 Aug 2020 02:39:59 +0000
Received: from szxga02-in.huawei.com ([45.249.212.188] helo=huawei.com)
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kCZjc-000640-CC; Mon, 31 Aug 2020 02:39:53 +0000
Received: from DGGEMM403-HUB.china.huawei.com (unknown [172.30.72.56])
 by Forcepoint Email with ESMTP id 7B494EEB1E8EDA7F4D5F;
 Mon, 31 Aug 2020 10:39:42 +0800 (CST)
Received: from DGGEMM421-HUB.china.huawei.com (10.1.198.38) by
 DGGEMM403-HUB.china.huawei.com (10.3.20.211) with Microsoft SMTP Server (TLS)
 id 14.3.487.0; Mon, 31 Aug 2020 10:39:42 +0800
Received: from DGGEMM525-MBS.china.huawei.com ([169.254.5.119]) by
 dggemm421-hub.china.huawei.com ([10.1.198.38]) with mapi id 14.03.0487.000;
 Mon, 31 Aug 2020 10:39:35 +0800
From: Jiangyifei <jiangyifei@huawei.com>
To: Anup Patel <anup@brainfault.org>
Subject: RE: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
Thread-Topic: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
Thread-Index: AQHWfEtmTyNMW66okESUbG9EQ0iVQKlMb8AAgAUV7AA=
Date: Mon, 31 Aug 2020 02:39:35 +0000
Message-ID: <3915816D913D8241BB43E932213F57D4ADD8F34F@dggemm525-mbs.china.huawei.com>
References: <20200827082251.1591-1-jiangyifei@huawei.com>
 <20200827082251.1591-3-jiangyifei@huawei.com>
 <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
In-Reply-To: <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.174.187.31]
MIME-Version: 1.0
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200830_223952_995393_332D24D4 
X-CRM114-Status: GOOD (  30.09  )
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
 Anup Patel <anup.patel@wdc.com>, "linux-kernel@vger.kernel.org
 List" <linux-kernel@vger.kernel.org>, Atish Patra <atish.patra@wdc.com>,
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


> -----Original Message-----
> From: Anup Patel [mailto:anup@brainfault.org]
> Sent: Friday, August 28, 2020 12:54 PM
> To: Jiangyifei <jiangyifei@huawei.com>
> Cc: Paul Walmsley <paul.walmsley@sifive.com>; Palmer Dabbelt
> <palmer@dabbelt.com>; Albert Ou <aou@eecs.berkeley.edu>; Anup Patel
> <anup.patel@wdc.com>; Alistair Francis <alistair.francis@wdc.com>; Atish
> Patra <atish.patra@wdc.com>; deepa.kernel@gmail.com;
> kvm-riscv@lists.infradead.org; KVM General <kvm@vger.kernel.org>;
> linux-riscv <linux-riscv@lists.infradead.org>; linux-kernel@vger.kernel.org List
> <linux-kernel@vger.kernel.org>; Zhangxiaofeng (F)
> <victor.zhangxiaofeng@huawei.com>; Wubin (H) <wu.wubin@huawei.com>;
> Zhanghailiang <zhang.zhanghailiang@huawei.com>; dengkai (A)
> <dengkai1@huawei.com>; yinyipeng <yinyipeng1@huawei.com>
> Subject: Re: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
> 
> On Thu, Aug 27, 2020 at 1:54 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
> >
> > Add two interfaces of log dirty for kvm_main.c, and detele the
> > interface kvm_vm_ioctl_get_dirty_log which is redundantly defined.
> >
> > CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT is added in defconfig.
> >
> > Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> > Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> > ---
> >  arch/riscv/configs/defconfig |  1 +
> >  arch/riscv/kvm/Kconfig       |  1 +
> >  arch/riscv/kvm/mmu.c         | 43
> ++++++++++++++++++++++++++++++++++++
> >  arch/riscv/kvm/vm.c          |  6 -----
> >  4 files changed, 45 insertions(+), 6 deletions(-)
> >
> > diff --git a/arch/riscv/configs/defconfig
> > b/arch/riscv/configs/defconfig index d36e1000bbd3..857d799672c2 100644
> > --- a/arch/riscv/configs/defconfig
> > +++ b/arch/riscv/configs/defconfig
> > @@ -19,6 +19,7 @@ CONFIG_SOC_VIRT=y
> >  CONFIG_SMP=y
> >  CONFIG_VIRTUALIZATION=y
> >  CONFIG_KVM=y
> > +CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
> >  CONFIG_HOTPLUG_CPU=y
> >  CONFIG_MODULES=y
> >  CONFIG_MODULE_UNLOAD=y
> > diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig index
> > 2356dc52ebb3..91fcffc70e5d 100644
> > --- a/arch/riscv/kvm/Kconfig
> > +++ b/arch/riscv/kvm/Kconfig
> > @@ -26,6 +26,7 @@ config KVM
> >         select KVM_MMIO
> >         select HAVE_KVM_VCPU_ASYNC_IOCTL
> >         select SRCU
> > +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
> >         help
> >           Support hosting virtualized guest machines.
> >
> > diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c index
> > 88bce80ee983..df2a470c25e4 100644
> > --- a/arch/riscv/kvm/mmu.c
> > +++ b/arch/riscv/kvm/mmu.c
> > @@ -358,6 +358,43 @@ void stage2_wp_memory_region(struct kvm *kvm,
> int slot)
> >         kvm_flush_remote_tlbs(kvm);
> >  }
> >
> > +/**
> > + * kvm_mmu_write_protect_pt_masked() - write protect dirty pages
> > + * @kvm:    The KVM pointer
> > + * @slot:   The memory slot associated with mask
> > + * @gfn_offset: The gfn offset in memory slot
> > + * @mask:   The mask of dirty pages at offset 'gfn_offset' in this memory
> > + *      slot to be write protected
> > + *
> > + * Walks bits set in mask write protects the associated pte's. Caller
> > +must
> > + * acquire kvm_mmu_lock.
> > + */
> > +static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
> > +        struct kvm_memory_slot *slot,
> > +        gfn_t gfn_offset, unsigned long mask) {
> > +    phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> > +    phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> > +    phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> > +
> > +    stage2_wp_range(kvm, start, end); }
> > +
> > +/*
> > + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for
> > +selected
> > + * dirty pages.
> > + *
> > + * It calls kvm_mmu_write_protect_pt_masked to write protect selected
> > +pages to
> > + * enable dirty logging for them.
> > + */
> > +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> > +        struct kvm_memory_slot *slot,
> > +        gfn_t gfn_offset, unsigned long mask) {
> > +    kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask); }
> > +
> > +
> >  int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
> >                    unsigned long size, bool writable)  { @@ -433,6
> > +470,12 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct
> > kvm_memory_slot *memslot)  {  }
> >
> > +void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> > +                                       struct kvm_memory_slot
> > +*memslot) {
> > +       kvm_flush_remote_tlbs(kvm);
> > +}
> > +
> >  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot
> > *free)  {  } diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> > index 4f2498198cb5..f7405676903b 100644
> > --- a/arch/riscv/kvm/vm.c
> > +++ b/arch/riscv/kvm/vm.c
> > @@ -12,12 +12,6 @@
> >  #include <linux/uaccess.h>
> >  #include <linux/kvm_host.h>
> >
> > -int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log
> > *log) -{
> > -       /* TODO: To be added later. */
> > -       return -ENOTSUPP;
> > -}
> > -
> >  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)  {
> >         int r;
> > --
> > 2.19.1
> >
> >
> 
> I already have a similar change as part of v14 KVM RISC-V series.
> 
> Let us coordinate better. Please let us know in-advance for any KVM RISC-V
> feature you plan to work on. Otherwise, this leads to efforts wasted at your
> end or at our end.
> 
> Regards,
> Anup

Hi Anup,

Thanks for accepting our patches.

In the next few weeks we plan to work on the following:
1. memory reverse mapping (rmap), related to migration.
2. irqfd.
3. implmentaion related to the dedicated clock event source proposal.

Besides, we are aware of that you are working on irq chip emulation in KVM. Meanwhile, our implementaiton of irqfd and the clock event source has dependency on the irq chip and we may well modify the irq chip emulation code. So could you share with us any ideas, plans or progress regarding your work since there might be potential collision?

Let's stay in touch in the long run and coodinate better. BTW, could you share with us if there's any regular discussion sessions focused on RISC-V KVM?

Regards,
Yifei
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
