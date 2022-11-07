Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759F2C433FE
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 03:01:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=j/mnsURZbQQhbR2E/b0J07Aqrmn/O5IAnHBgkbQv0RY=; b=XL812na54sBlRp
	UhPDO9A/++1vwlEVx5rN9SpTWdW0DQBzLSpcIybmbA9METXaP7Y22lcaKx23W3mouqV8XxmtlLbLY
	uSVexPNFVGFygAbItlEvfHD+zHKokc69wXcCz3E592vGxpoRojX6IZK6YLmaaofVZy2d9P/3JELmN
	6cgvZc4xWyB4+RQn+VGl/eUmAikebe/22craWi9SsCoovetZRTiqKL4hssNf+sC+CJpSz1X8pXa+5
	IHWft0alGoDIhyY/TY1fjLh2PBUhIeQmG9MHPLPQeOztVxq1STPWXmW/NZOiQ2js1q1I/3ChSpoHg
	mfr0V9b5gBU2EdvoNw9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsO7-00BDDH-2X; Mon, 07 Nov 2022 03:01:27 +0000
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsNw-00BD8w-Bv
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 03:01:18 +0000
Received: by mail-ej1-x62a.google.com with SMTP id sc25so26605021ejc.12
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 19:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=JlY2OstXwROXIDpT6VsXnJfzUqv1irH1Acsts2GGjpg=;
        b=wH7KmpU7jVwmAquM9Wvk3ttImj9+lvZI8Rxq1i6YYsElC8cWksh48ZwROArAULlZ7C
         tWe8M8ahyJHdHwo2Ck68YVw1aHJ/MLoYcQlrnfABVok8QpmzXxG1ffcBMZXcH6h5LAvm
         0tBbIsqoRxCX/KnzpT+CYyHXfKhw4foQW6+Ax6UY2aF+XO4GKByYk/PtdVxGB2RT0Fbu
         ysRYJ78VJd30TMAFhUzwFf/xZ7AJ2g1baQLCe9iqAVhA1Yqqkk67FLLNxduytkqwDB7v
         JP5zJ/Gyoc7JfJxpc+R8WHDqVMk2NzGLLCgzvKh3qN6XuvMHVMMnDXEN4atLvrkjLInL
         jZnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JlY2OstXwROXIDpT6VsXnJfzUqv1irH1Acsts2GGjpg=;
        b=Agr4gfvpJqOhWzROueXhDX4uao3vNE79VniQd3SvPftL8jVGzuQ61EUAvLvaTFUcpl
         GZ2mwos9IUlommFHyW1dvXgGcnJP0liueaSDYWzbNQiQ95mrco+sZCiF5xcW4q3p+PKi
         GL0daHzeJCFlzZ5IyqDswrA1M/dwYXzKhwED9XUNKOuRtS3Au1poJRYj9LC05jS7HSqk
         YCzrYiw8iZzlzzcO1loaMj02M2ZCZ0nZdEOcBIJmxQU77sx34G1rlmMLwa+oDWrxyx66
         XNHjZt5na/+xyPMiYGjmaiyb5pw7eZVE7zViX7dlePBPVm7FaYnRgMFcGx3jtWSZwXTB
         z+5A==
X-Gm-Message-State: ACrzQf2RvaIK+88/KF6ylZucdZLMrA1osxGKi2eML2qdOAky3VsKGV9i
	bWap84AsvnRkUBKxRcHorLk4g+8HsUZ5+Nz3untMiQ==
X-Google-Smtp-Source: AMsMyM6JBSnXu9W+mu2GHeFQ3pcqBebFarC8BvVQZEanz3Zu4tMlcAMijwZHL0jNoTpD/MpfGKS3dVLLizMbV1pDGog=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr45605430ejb.240.1667790073283; Sun, 06
 Nov 2022 19:01:13 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-10-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-10-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:31:01 +0530
Message-ID: <CAAhSdy10dC+_S5PZ=QziYqVJKHh6Gi6D0H0C7GSsxWdFVrTQjA@mail.gmail.com>
Subject: Re: [PATCH 09/44] KVM: Drop arch hardware (un)setup hooks
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Christian Borntraeger <borntraeger@linux.ibm.com>, Janosch Frank <frankja@linux.ibm.com>, 
	Claudio Imbrenda <imbrenda@linux.ibm.com>, Matthew Rosato <mjrosato@linux.ibm.com>, 
	Eric Farman <farman@linux.ibm.com>, Vitaly Kuznetsov <vkuznets@redhat.com>, 
	James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
	Suzuki K Poulose <suzuki.poulose@arm.com>, Oliver Upton <oliver.upton@linux.dev>, 
	Atish Patra <atishp@atishpatra.org>, David Hildenbrand <david@redhat.com>, kvm@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvmarm@lists.cs.columbia.edu, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Fabiano Rosas <farosas@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Chao Gao <chao.gao@intel.com>, Thomas Gleixner <tglx@linutronix.de>, Yuan Yao <yuan.yao@intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221106_190116_627418_08292480 
X-CRM114-Status: GOOD (  16.70  )
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

On Thu, Nov 3, 2022 at 4:49 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Drop kvm_arch_hardware_setup() and kvm_arch_hardware_unsetup() now that
> all implementations are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/arm64/include/asm/kvm_host.h   |  1 -
>  arch/arm64/kvm/arm.c                |  5 -----
>  arch/mips/include/asm/kvm_host.h    |  1 -
>  arch/mips/kvm/mips.c                |  5 -----
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          |  5 -----
>  arch/riscv/include/asm/kvm_host.h   |  1 -
>  arch/riscv/kvm/main.c               |  5 -----
>  arch/s390/kvm/kvm-s390.c            | 10 ----------
>  arch/x86/kvm/x86.c                  | 10 ----------
>  include/linux/kvm_host.h            |  2 --
>  virt/kvm/kvm_main.c                 |  7 -------
>  12 files changed, 53 deletions(-)
>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index 45e2136322ba..5d5a887e63a5 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -859,7 +859,6 @@ static inline bool kvm_system_needs_idmapped_vectors(void)
>
>  void kvm_arm_vcpu_ptrauth_trap(struct kvm_vcpu *vcpu);
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 94d33e296e10..2ee729f54ce0 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -63,11 +63,6 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>         return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return 0;
> diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
> index 5cedb28e8a40..28f0ba97db71 100644
> --- a/arch/mips/include/asm/kvm_host.h
> +++ b/arch/mips/include/asm/kvm_host.h
> @@ -888,7 +888,6 @@ extern unsigned long kvm_mips_get_ramsize(struct kvm *kvm);
>  extern int kvm_vcpu_ioctl_interrupt(struct kvm_vcpu *vcpu,
>                              struct kvm_mips_interrupt *irq);
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm,
>                                          struct kvm_memory_slot *slot) {}
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index a25e0b73ee70..af29490d9740 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -135,11 +135,6 @@ void kvm_arch_hardware_disable(void)
>         kvm_mips_callbacks->hardware_disable();
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return 0;
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index caea15dcb91d..5d2c3a487e73 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -877,7 +877,6 @@ struct kvm_vcpu_arch {
>  #define __KVM_HAVE_CREATE_DEVICE
>
>  static inline void kvm_arch_hardware_disable(void) {}
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index b850b0efa201..74ea5687ecbc 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -441,11 +441,6 @@ int kvm_arch_hardware_enable(void)
>         return 0;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         return kvmppc_core_check_processor_compat();
> diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
> index dbbf43d52623..8c771fc4f5d2 100644
> --- a/arch/riscv/include/asm/kvm_host.h
> +++ b/arch/riscv/include/asm/kvm_host.h
> @@ -229,7 +229,6 @@ struct kvm_vcpu_arch {
>         bool pause;
>  };
>
> -static inline void kvm_arch_hardware_unsetup(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index df2d8716851f..a146fa0ce4d2 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -25,11 +25,6 @@ int kvm_arch_check_processor_compat(void *opaque)
>         return 0;
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_hardware_enable(void)
>  {
>         unsigned long hideleg, hedeleg;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 1aaee15211f2..7fcd2d3b3558 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -321,16 +321,6 @@ static struct notifier_block kvm_clock_notifier = {
>         .notifier_call = kvm_clock_sync,
>  };
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_hardware_unsetup(void)
> -{
> -
> -}
> -
>  static void allow_cpu_feat(unsigned long nr)
>  {
>         set_bit_inv(nr, kvm_s390_available_cpu_feat);
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 80ee580a9cd4..40d4bfaa17a4 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -11985,16 +11985,6 @@ void kvm_arch_hardware_disable(void)
>         drop_user_return_notifiers();
>  }
>
> -int kvm_arch_hardware_setup(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_hardware_unsetup(void)
> -{
> -
> -}
> -
>  int kvm_arch_check_processor_compat(void *opaque)
>  {
>         struct cpuinfo_x86 *c = &cpu_data(smp_processor_id());
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 18592bdf4c1b..9b52bd40be56 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1447,8 +1447,6 @@ static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
>
>  int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
> -int kvm_arch_hardware_setup(void *opaque);
> -void kvm_arch_hardware_unsetup(void);
>  int kvm_arch_check_processor_compat(void *opaque);
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index f592dd4ce8f2..27ce263a80e4 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5843,10 +5843,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         if (r)
>                 return r;
>
> -       r = kvm_arch_hardware_setup(opaque);
> -       if (r < 0)
> -               goto err_hw_setup;
> -
>         if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
>                 r = -ENOMEM;
>                 goto err_hw_enabled;
> @@ -5939,8 +5935,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>  out_free_2:
>         free_cpumask_var(cpus_hardware_enabled);
>  err_hw_enabled:
> -       kvm_arch_hardware_unsetup();
> -err_hw_setup:
>         kvm_arch_exit();
>         return r;
>  }
> @@ -5969,7 +5963,6 @@ void kvm_exit(void)
>         on_each_cpu(hardware_disable_nolock, NULL, 1);
>         kvm_irqfd_exit();
>         free_cpumask_var(cpus_hardware_enabled);
> -       kvm_arch_hardware_unsetup();
>         kvm_arch_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
