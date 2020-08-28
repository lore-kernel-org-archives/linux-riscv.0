Return-Path: <SRS0=ua5H=CG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17985C433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:54:20 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D6C2920848
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Aug 2020 04:54:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="h55FeWOm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=brainfault-org.20150623.gappssmtp.com header.i=@brainfault-org.20150623.gappssmtp.com header.b="wzNVuFCj"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D6C2920848
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=hlRfkJHQcr20d3KDpAbds2DNED2kdqOKTngU2koY+8I=; b=h55FeWOm9M1F9Zvgqcv9zZD1y
	clRaEHwTVSi3PZFD9mJ2m77hkgNz6wdHnn2JNlE1+SBGmiZSMAb56a2H6NbhuMX2gcwVoIGg4Aaz8
	jz7VbimFpNqFUqI7RBKTO3wG8DY4Fj+GQuLuMckdY2ne+/zs1JFrVACLYNg6b2qNJta8Ach/LgMv/
	tRg5dlcl4wiDcoQ3SAbvvDKSpFOe3wNXB7VJwikbhWjF79feOGoHoaaUhmdfugl1yV4+GA1Olhf7h
	nKwAmxiJjbm5OcmgS+03OM41EiAmLTUiajVhJTO+CGHYRfy1WaVU9cn1om6ghaksP0+J6m+LlVzro
	4t3RERDKQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kBWOt-0001LM-H5; Fri, 28 Aug 2020 04:54:07 +0000
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kBWOr-0001KZ-HK
 for linux-riscv@lists.infradead.org; Fri, 28 Aug 2020 04:54:06 +0000
Received: by mail-wm1-x344.google.com with SMTP id k20so38843wmi.5
 for <linux-riscv@lists.infradead.org>; Thu, 27 Aug 2020 21:54:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=xCkPRCKVOyv6UdC08SrLjktcyNyR3bWo2BWIKaXwLIU=;
 b=wzNVuFCj/YGjuC6NDV1gHwffImireBFCVYVdrHj0WUr+2vvzYZTAgyeaw28x2dUPbd
 ShRUHS3rP6pBj/FcTwkdikNlfeGx1bWm7WEKfEBmWiEz88ZxRXe1AW8Kh5Xr3w95ZWOL
 uEhmg2WHxPEEvrNNBPr3SeykviI0capLfcMCr2WBcnYmQ84GYJYfxoWbI6GtvVjSlMpD
 6xi87zx7+KFN+ckqJiXSKbzlyFqWY0+REM6PQJGxTAifwXNGrlEMz+pdRTl7AGAPKNG/
 KwjOIJsHc0Opqh3TdvhPlFlqCdC0Dt7M1TzJLiHSACfAwNSWnvbjVieHE0Jndxidt1hH
 BM6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xCkPRCKVOyv6UdC08SrLjktcyNyR3bWo2BWIKaXwLIU=;
 b=D6WUcra9TZaHVfePkAKZjYhW7e+u2Ix967q1GFayIjk9UEScXQgAwfNW1pW+O+4Xu2
 84m07zbOff08X0FoSHP8c8+nJAHOOneIyXK9CyfNOw7RyA8X7x9Ts/rmp7r2FCDzNqxA
 r5FOctIA93rcjUOeV7BkHGfKzz3wGI9yftqAOtvwYqw647+O2y/EFIjjcjPAb3G2k+eR
 btegBzZmxuhWQ17vIffaGInvkHkqQ6LY/GhpoQ4t1w3wfZuJtnRj/ZRBzZ1JVHz0rLFz
 eAclhONZtj9ZECSScXqQMqJbH56JIm0/Vd3OkgfP4y4DKHbrXpy08u7FRjQG7+JHQAQ+
 JqGg==
X-Gm-Message-State: AOAM531SGhvkPOa034h+8vBMFbS/IFS5A1Zfd8P20s61q5Wd3MX1W9jp
 qR6wramC72AEsTTUotmqGXCvGF1rmQFDvNge1rhlJw==
X-Google-Smtp-Source: ABdhPJz3rZLWV6A3Em0ve8Z6e606P/Ks47lsI+RkOV083HeFssFde+guqsIX7d3OuAhb6RNGeYB7ks4hletdcMQevi4=
X-Received: by 2002:a1c:1b17:: with SMTP id b23mr101507wmb.152.1598590444059; 
 Thu, 27 Aug 2020 21:54:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200827082251.1591-1-jiangyifei@huawei.com>
 <20200827082251.1591-3-jiangyifei@huawei.com>
In-Reply-To: <20200827082251.1591-3-jiangyifei@huawei.com>
From: Anup Patel <anup@brainfault.org>
Date: Fri, 28 Aug 2020 10:23:52 +0530
Message-ID: <CAAhSdy36ZCubU-1+WzjMzBaR+RipgEhvRqd9AT+28=99-EUDaQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/2] target/kvm: Add interfaces needed for log dirty
To: Yifei Jiang <jiangyifei@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200828_005405_755718_776121FA 
X-CRM114-Status: GOOD (  23.57  )
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
 Alistair Francis <alistair.francis@wdc.com>, deepa.kernel@gmail.com,
 kvm-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, wu.wubin@huawei.com,
 "dengkai \(A\)" <dengkai1@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Aug 27, 2020 at 1:54 PM Yifei Jiang <jiangyifei@huawei.com> wrote:
>
> Add two interfaces of log dirty for kvm_main.c, and detele the interface
> kvm_vm_ioctl_get_dirty_log which is redundantly defined.
>
> CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT is added in defconfig.
>
> Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
> Signed-off-by: Yipeng Yin <yinyipeng1@huawei.com>
> ---
>  arch/riscv/configs/defconfig |  1 +
>  arch/riscv/kvm/Kconfig       |  1 +
>  arch/riscv/kvm/mmu.c         | 43 ++++++++++++++++++++++++++++++++++++
>  arch/riscv/kvm/vm.c          |  6 -----
>  4 files changed, 45 insertions(+), 6 deletions(-)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index d36e1000bbd3..857d799672c2 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -19,6 +19,7 @@ CONFIG_SOC_VIRT=y
>  CONFIG_SMP=y
>  CONFIG_VIRTUALIZATION=y
>  CONFIG_KVM=y
> +CONFIG_KVM_GENERIC_DIRTYLOG_READ_PROTECT=y
>  CONFIG_HOTPLUG_CPU=y
>  CONFIG_MODULES=y
>  CONFIG_MODULE_UNLOAD=y
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index 2356dc52ebb3..91fcffc70e5d 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -26,6 +26,7 @@ config KVM
>         select KVM_MMIO
>         select HAVE_KVM_VCPU_ASYNC_IOCTL
>         select SRCU
> +       select KVM_GENERIC_DIRTYLOG_READ_PROTECT
>         help
>           Support hosting virtualized guest machines.
>
> diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
> index 88bce80ee983..df2a470c25e4 100644
> --- a/arch/riscv/kvm/mmu.c
> +++ b/arch/riscv/kvm/mmu.c
> @@ -358,6 +358,43 @@ void stage2_wp_memory_region(struct kvm *kvm, int slot)
>         kvm_flush_remote_tlbs(kvm);
>  }
>
> +/**
> + * kvm_mmu_write_protect_pt_masked() - write protect dirty pages
> + * @kvm:    The KVM pointer
> + * @slot:   The memory slot associated with mask
> + * @gfn_offset: The gfn offset in memory slot
> + * @mask:   The mask of dirty pages at offset 'gfn_offset' in this memory
> + *      slot to be write protected
> + *
> + * Walks bits set in mask write protects the associated pte's. Caller must
> + * acquire kvm_mmu_lock.
> + */
> +static void kvm_mmu_write_protect_pt_masked(struct kvm *kvm,
> +        struct kvm_memory_slot *slot,
> +        gfn_t gfn_offset, unsigned long mask)
> +{
> +    phys_addr_t base_gfn = slot->base_gfn + gfn_offset;
> +    phys_addr_t start = (base_gfn +  __ffs(mask)) << PAGE_SHIFT;
> +    phys_addr_t end = (base_gfn + __fls(mask) + 1) << PAGE_SHIFT;
> +
> +    stage2_wp_range(kvm, start, end);
> +}
> +
> +/*
> + * kvm_arch_mmu_enable_log_dirty_pt_masked - enable dirty logging for selected
> + * dirty pages.
> + *
> + * It calls kvm_mmu_write_protect_pt_masked to write protect selected pages to
> + * enable dirty logging for them.
> + */
> +void kvm_arch_mmu_enable_log_dirty_pt_masked(struct kvm *kvm,
> +        struct kvm_memory_slot *slot,
> +        gfn_t gfn_offset, unsigned long mask)
> +{
> +    kvm_mmu_write_protect_pt_masked(kvm, slot, gfn_offset, mask);
> +}
> +
> +
>  int stage2_ioremap(struct kvm *kvm, gpa_t gpa, phys_addr_t hpa,
>                    unsigned long size, bool writable)
>  {
> @@ -433,6 +470,12 @@ void kvm_arch_sync_dirty_log(struct kvm *kvm, struct kvm_memory_slot *memslot)
>  {
>  }
>
> +void kvm_arch_flush_remote_tlbs_memslot(struct kvm *kvm,
> +                                       struct kvm_memory_slot *memslot)
> +{
> +       kvm_flush_remote_tlbs(kvm);
> +}
> +
>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *free)
>  {
>  }
> diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
> index 4f2498198cb5..f7405676903b 100644
> --- a/arch/riscv/kvm/vm.c
> +++ b/arch/riscv/kvm/vm.c
> @@ -12,12 +12,6 @@
>  #include <linux/uaccess.h>
>  #include <linux/kvm_host.h>
>
> -int kvm_vm_ioctl_get_dirty_log(struct kvm *kvm, struct kvm_dirty_log *log)
> -{
> -       /* TODO: To be added later. */
> -       return -ENOTSUPP;
> -}
> -
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  {
>         int r;
> --
> 2.19.1
>
>

I already have a similar change as part of v14 KVM RISC-V series.

Let us coordinate better. Please let us know in-advance for any
KVM RISC-V feature you plan to work on. Otherwise, this leads to
efforts wasted at your end or at our end.

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
