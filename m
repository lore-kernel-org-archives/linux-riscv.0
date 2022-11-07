Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4FE5C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 03:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vAZIkZjnxNuNafyqAPMFEQLsnoqgE2XfaCP+P5lcNP0=; b=MVSuWLji6HoFAO
	gSlliaCK5iWu/Ie0D+lhkSXO50BJAjezh3YFNvHPC6bMwZHAkcg+Pee4waRMUq18Hqsv8rVRg/0tE
	YdO4yLbyO4GfKATj4pYEyXHWzYw5ornZ0Mtlsqq/Xlv6dCxNBk2YnGNSacFMwA3yM3VOOHWm1e9W5
	COD+rdO/T1ku9wtNR0LIs02PALvoKNdKCJ5UUcQdYDJXba4qQ4niUG6+JMHoRwJ9Hu7sceEbUIg1F
	CYnlChiP2Am8O/+081NupxmXAOH/bmpktrEyMZ8kxYKqxHFyLSC5ApItV9308QfvU7jc2sY2OL0Jz
	joHZZsUHHRsNoTf1MVdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsjX-00BI56-J1; Mon, 07 Nov 2022 03:23:35 +0000
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsjU-00BI1t-7u
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 03:23:34 +0000
Received: by mail-ed1-x529.google.com with SMTP id r14so15538494edc.7
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 19:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=EyNJAB/zJ7Mx8V83c0ByQ2xHLLcAbZ8WVP3stUfzzSc=;
        b=t1d2KaDtBTvOV8ATE1ZHhzD63MlM6A0HN6LqloD/NxajQJKBjonIJLNo4fD7cRQV2N
         ltgapx8O/xHVdQYdxsdwQe83rCStDZMeFrG9cqTssqJvPeqzQOlQ7jijrDfEhOn3Oc+6
         VyY3lyejnM0npnFOV05jKdOI6lYIWorWqJH+SlZKgmIotYYLsU8Cud6O/IkkG3zKMZP2
         qBiu8tMIXCD7ms+UfBdj71i3yoeM4B0qRx5Mo/1pWDFBwA94ry30mj8ynYrowSuy6R7B
         zoBRAB1TS9oVS9gQqcTQ232X8BzXZK2ck5oLhsccNtQRvs/gvqv1hLFiCrIISAuHwd1s
         +7vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EyNJAB/zJ7Mx8V83c0ByQ2xHLLcAbZ8WVP3stUfzzSc=;
        b=LSCr2TMBm/Yf5BXYyIg9ROlLztd5IXNjpny3gIbCWbYNQ8pz12+5+fc0h7s0k11nW+
         wOh/lHhvlRxK6hs3iTAKTDtLNCiTyBhEvJqFSZ4DHFOTNVOnB7fzm8GmUQfS9v/qTWP1
         6vLd62X9WmsjkhpUmC15QAO/75zMb6UmgJmvS5j2Z2PYTCBNUR3aB/xQ6pFfkDDage5V
         uUMQ6bYNCXoeBE0Jb1pBjMLE0U8I1JZke2avmNi+vn6V4YszPVpwl3eHdk9dwtIfASEk
         ssfrz0Zc+yBEniuSuVsj4y8gf2v9etOsDd1i+AmqTkTBoYTA02mgkDS1qIGaHY9GI+qJ
         3/7Q==
X-Gm-Message-State: ACrzQf2FQBSm3zTDrDbEYgAn88GRKDRPxKfiZr4tWZZ3ty65QAYdrffb
	25/edHKS9zI9+gpSPes17KkOqKUDxnSIkbywpW1ZMg==
X-Google-Smtp-Source: AMsMyM4/9I7ba6l9I5J+qbYuNdeEvaxV7Lxl/Gc/ej/a4VF/lw48+pQkJ9OuBQQawv1SOYHKpHdIUyflQTYJMm9plx4=
X-Received: by 2002:aa7:da84:0:b0:463:7873:119a with SMTP id
 q4-20020aa7da84000000b004637873119amr36598544eds.329.1667791408731; Sun, 06
 Nov 2022 19:23:28 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-45-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-45-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:53:16 +0530
Message-ID: <CAAhSdy307ziQVnq=bSJ_KO3kr0w_wqJ+zf3S54z_FHwt6VAmEg@mail.gmail.com>
Subject: Re: [PATCH 44/44] KVM: Opt out of generic hardware enabling on s390
 and PPC
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
X-CRM114-CacheID: sfid-20221106_192332_360113_59C23C1D 
X-CRM114-Status: GOOD (  25.99  )
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

On Thu, Nov 3, 2022 at 4:50 AM Sean Christopherson <seanjc@google.com> wrote:
>
> Allow architectures to opt out of the generic hardware enabling logic,
> and opt out on both s390 and PPC, which don't need to manually enable
> virtualization as it's always on (when available).
>
> In addition to letting s390 and PPC drop a bit of dead code, this will
> hopefully also allow ARM to clean up its related code, e.g. ARM has its
> own per-CPU flag to track which CPUs have enable hardware due to the
> need to keep hardware enabled indefinitely when pKVM is enabled.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/arm64/kvm/Kconfig              |  1 +
>  arch/mips/kvm/Kconfig               |  1 +
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          |  5 -----
>  arch/riscv/kvm/Kconfig              |  1 +
>  arch/s390/include/asm/kvm_host.h    |  1 -
>  arch/s390/kvm/kvm-s390.c            |  6 ------
>  arch/x86/kvm/Kconfig                |  1 +
>  include/linux/kvm_host.h            |  4 ++++
>  virt/kvm/Kconfig                    |  3 +++
>  virt/kvm/kvm_main.c                 | 30 +++++++++++++++++++++++------
>  11 files changed, 35 insertions(+), 19 deletions(-)
>
> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
> index 815cc118c675..0a7d2116b27b 100644
> --- a/arch/arm64/kvm/Kconfig
> +++ b/arch/arm64/kvm/Kconfig
> @@ -21,6 +21,7 @@ if VIRTUALIZATION
>  menuconfig KVM
>         bool "Kernel-based Virtual Machine (KVM) support"
>         depends on HAVE_KVM
> +       select KVM_GENERIC_HARDWARE_ENABLING
>         select MMU_NOTIFIER
>         select PREEMPT_NOTIFIERS
>         select HAVE_KVM_CPU_RELAX_INTERCEPT
> diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
> index 91d197bee9c0..29e51649203b 100644
> --- a/arch/mips/kvm/Kconfig
> +++ b/arch/mips/kvm/Kconfig
> @@ -28,6 +28,7 @@ config KVM
>         select MMU_NOTIFIER
>         select SRCU
>         select INTERVAL_TREE
> +       select KVM_GENERIC_HARDWARE_ENABLING
>         help
>           Support for hosting Guest kernels.
>
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 0a80e80c7b9e..959f566a455c 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -876,7 +876,6 @@ struct kvm_vcpu_arch {
>  #define __KVM_HAVE_ARCH_WQP
>  #define __KVM_HAVE_CREATE_DEVICE
>
> -static inline void kvm_arch_hardware_disable(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 51268be60dac..ed426c9ee0e9 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -436,11 +436,6 @@ int kvmppc_ld(struct kvm_vcpu *vcpu, ulong *eaddr, int size, void *ptr,
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_ld);
>
> -int kvm_arch_hardware_enable(void)
> -{
> -       return 0;
> -}
> -
>  int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>  {
>         struct kvmppc_ops *kvm_ops = NULL;
> diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
> index f36a737d5f96..d5a658a047a7 100644
> --- a/arch/riscv/kvm/Kconfig
> +++ b/arch/riscv/kvm/Kconfig
> @@ -20,6 +20,7 @@ if VIRTUALIZATION
>  config KVM
>         tristate "Kernel-based Virtual Machine (KVM) support (EXPERIMENTAL)"
>         depends on RISCV_SBI && MMU
> +       select KVM_GENERIC_HARDWARE_ENABLING
>         select MMU_NOTIFIER
>         select PREEMPT_NOTIFIERS
>         select KVM_MMIO
> diff --git a/arch/s390/include/asm/kvm_host.h b/arch/s390/include/asm/kvm_host.h
> index b1e98a9ed152..d3e4b5d7013a 100644
> --- a/arch/s390/include/asm/kvm_host.h
> +++ b/arch/s390/include/asm/kvm_host.h
> @@ -1023,7 +1023,6 @@ extern char sie_exit;
>  extern int kvm_s390_gisc_register(struct kvm *kvm, u32 gisc);
>  extern int kvm_s390_gisc_unregister(struct kvm *kvm, u32 gisc);
>
> -static inline void kvm_arch_hardware_disable(void) {}
>  static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
>  static inline void kvm_arch_free_memslot(struct kvm *kvm,
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index 949231f1393e..129c159ab5ee 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -248,12 +248,6 @@ debug_info_t *kvm_s390_dbf;
>  debug_info_t *kvm_s390_dbf_uv;
>
>  /* Section: not file related */
> -int kvm_arch_hardware_enable(void)
> -{
> -       /* every s390 is virtualization enabled ;-) */
> -       return 0;
> -}
> -
>  /* forward declarations */
>  static void kvm_gmap_notifier(struct gmap *gmap, unsigned long start,
>                               unsigned long end);
> diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
> index fbeaa9ddef59..8e578311ca9d 100644
> --- a/arch/x86/kvm/Kconfig
> +++ b/arch/x86/kvm/Kconfig
> @@ -49,6 +49,7 @@ config KVM
>         select SRCU
>         select INTERVAL_TREE
>         select HAVE_KVM_PM_NOTIFIER if PM
> +       select KVM_GENERIC_HARDWARE_ENABLING
>         help
>           Support hosting fully virtualized guest machines using hardware
>           virtualization extensions.  You will need a fairly recent
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 0b96d836a051..23c89c1e7788 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1441,8 +1441,10 @@ void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_
>  static inline void kvm_create_vcpu_debugfs(struct kvm_vcpu *vcpu) {}
>  #endif
>
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
>  int kvm_arch_hardware_enable(void);
>  void kvm_arch_hardware_disable(void);
> +#endif
>  int kvm_arch_vcpu_runnable(struct kvm_vcpu *vcpu);
>  bool kvm_arch_vcpu_in_kernel(struct kvm_vcpu *vcpu);
>  int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu);
> @@ -2074,7 +2076,9 @@ static inline bool kvm_check_request(int req, struct kvm_vcpu *vcpu)
>         }
>  }
>
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
>  extern bool kvm_rebooting;
> +#endif
>
>  extern unsigned int halt_poll_ns;
>  extern unsigned int halt_poll_ns_grow;
> diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
> index 800f9470e36b..d28df77345e1 100644
> --- a/virt/kvm/Kconfig
> +++ b/virt/kvm/Kconfig
> @@ -86,3 +86,6 @@ config KVM_XFER_TO_GUEST_WORK
>
>  config HAVE_KVM_PM_NOTIFIER
>         bool
> +
> +config KVM_GENERIC_HARDWARE_ENABLING
> +       bool
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 859bc27091cd..6736b36cf469 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -102,9 +102,6 @@ EXPORT_SYMBOL_GPL(halt_poll_ns_shrink);
>  DEFINE_MUTEX(kvm_lock);
>  LIST_HEAD(vm_list);
>
> -static DEFINE_PER_CPU(bool, hardware_enabled);
> -static int kvm_usage_count;
> -
>  static struct kmem_cache *kvm_vcpu_cache;
>
>  static __read_mostly struct preempt_ops kvm_preempt_ops;
> @@ -146,9 +143,6 @@ static void hardware_disable_all(void);
>
>  static void kvm_io_bus_destroy(struct kvm_io_bus *bus);
>
> -__visible bool kvm_rebooting;
> -EXPORT_SYMBOL_GPL(kvm_rebooting);
> -
>  #define KVM_EVENT_CREATE_VM 0
>  #define KVM_EVENT_DESTROY_VM 1
>  static void kvm_uevent_notify_change(unsigned int type, struct kvm *kvm);
> @@ -5005,6 +4999,13 @@ static struct miscdevice kvm_dev = {
>         &kvm_chardev_ops,
>  };
>
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
> +__visible bool kvm_rebooting;
> +EXPORT_SYMBOL_GPL(kvm_rebooting);
> +
> +static DEFINE_PER_CPU(bool, hardware_enabled);
> +static int kvm_usage_count;
> +
>  static int __hardware_enable_nolock(void)
>  {
>         if (__this_cpu_read(hardware_enabled))
> @@ -5171,6 +5172,17 @@ static struct syscore_ops kvm_syscore_ops = {
>         .suspend = kvm_suspend,
>         .resume = kvm_resume,
>  };
> +#else /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
> +static int hardware_enable_all(void)
> +{
> +       return 0;
> +}
> +
> +static void hardware_disable_all(void)
> +{
> +
> +}
> +#endif /* CONFIG_KVM_GENERIC_HARDWARE_ENABLING */
>
>  static void kvm_io_bus_destroy(struct kvm_io_bus *bus)
>  {
> @@ -5859,6 +5871,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>         int r;
>         int cpu;
>
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
>         r = cpuhp_setup_state_nocalls(CPUHP_AP_KVM_ONLINE, "kvm/cpu:online",
>                                       kvm_online_cpu, kvm_offline_cpu);
>         if (r)
> @@ -5866,6 +5879,7 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>
>         register_reboot_notifier(&kvm_reboot_notifier);
>         register_syscore_ops(&kvm_syscore_ops);
> +#endif
>
>         /* A kmem cache lets us meet the alignment requirements of fx_save. */
>         if (!vcpu_align)
> @@ -5933,9 +5947,11 @@ int kvm_init(unsigned vcpu_size, unsigned vcpu_align, struct module *module)
>                 free_cpumask_var(per_cpu(cpu_kick_mask, cpu));
>         kmem_cache_destroy(kvm_vcpu_cache);
>  out_free_3:
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
>         unregister_syscore_ops(&kvm_syscore_ops);
>         unregister_reboot_notifier(&kvm_reboot_notifier);
>         cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
> +#endif
>         return r;
>  }
>  EXPORT_SYMBOL_GPL(kvm_init);
> @@ -5957,9 +5973,11 @@ void kvm_exit(void)
>         kmem_cache_destroy(kvm_vcpu_cache);
>         kvm_vfio_ops_exit();
>         kvm_async_pf_deinit();
> +#ifdef CONFIG_KVM_GENERIC_HARDWARE_ENABLING
>         unregister_syscore_ops(&kvm_syscore_ops);
>         unregister_reboot_notifier(&kvm_reboot_notifier);
>         cpuhp_remove_state_nocalls(CPUHP_AP_KVM_ONLINE);
> +#endif
>         kvm_irqfd_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
