Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A507AC43217
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Nov 2022 03:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=p8hmIw4jCONAeORD3KrVrAg6C4rmZAOVhPByR+Voy/U=; b=T1pauy5WaMXpTd
	SIpqp6daSsq/fNmKv3LBjl3bEfr+EHUGS+YwrCpEXQVvclvHDaOOtntjqywJOtqM6U+lsowib8KyB
	VBfbJ59S155p8gjbpxk/xxSNC2OiqC/U5IejUVwXNBOWldZvbTc6Idl84lxId8CpYrXaC/pI9FSJs
	7y0lW5/aUixDokJ8Sha10Hq8ZPHmuloJs7eI0LrJE8fzf4pwD9udCZKVyMryMVDQgidSZaGOUBDYm
	ZfNHcJH8tVGGqbGLUswy1se1X5LdqgO+xt75ZYjJL3EjVVldIWgk3T84l2KqyG5S54PS3/O4OoDcM
	9cmdYSMLS8E6SPjv8fiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsa7-00BFaY-VV; Mon, 07 Nov 2022 03:13:51 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1orsZw-00BFTP-Q5
	for linux-riscv@lists.infradead.org; Mon, 07 Nov 2022 03:13:43 +0000
Received: by mail-ej1-x634.google.com with SMTP id sc25so26646086ejc.12
        for <linux-riscv@lists.infradead.org>; Sun, 06 Nov 2022 19:13:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSzSSykdSUMY4z4QifNhRv3KUDv6uVGdlzhODRpQKlU=;
        b=Q5Al979g3+9Gavat8UlkB2Vleew+RmRbxdo+12K5r30eUrjF3YlGq0gOgvyYiLB3mt
         xgUU5ersVZgrB7+2jJY/bYXwsyIwwhtdWpcjxIdfzpDR5elbZNcB3K1l5DpUeR+BlciO
         idhic3khR724h6Kur7YB5I6R8BRlRfSrPOCcVMYpVLmUdl3EmI7WB0tcku7Xie02geae
         eDiGCrNsXaCEqHNBI+afAsQfH8ga4ziKwv6dMs7TpaKnqLBYnx3mO1Kmkb76PW7I4nHp
         zTYmmE0IV6+5AUD6cMBbhksIlq29dbZUxDj36O2JK9+DFGax2INM4cuyGR/ddy4VkTs8
         0+GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZSzSSykdSUMY4z4QifNhRv3KUDv6uVGdlzhODRpQKlU=;
        b=k6mio+SZE4tMulmCgrb6Xer317Zwud/nl1k+JZvZtqpXOjddh9R/7CSnRrwC/NV8N7
         3kqUNla3aLIbtDSZlZMbm/R5VBd4CxAGsJuosdJwcOfCpvYL/RhVAa+r6ls4NiTPEz1H
         jGboit7o3xbfDjYzEtfsBaiIFx5urSebmXhr5yTh2jO+RqwdEMQFUvy+1Tuo20alj2Db
         X4JgjJjaICSpAeC9nkoeqw8fHKbCd5GP3EMcZ8N78+u/KoAUbc0ZP7n6n8k+J/xJolkA
         DpCTuo5zZ6iJnzsDZbfmCwQSt1qKYaXWzzy6RuQB405gqL2H1/dVF00B37P7Cn4oyDyO
         bnQA==
X-Gm-Message-State: ACrzQf2bqu88rycTR1VTirYWdUpX4OfbNa3sAEOTEgPuFPKzgAHy/tXM
	cMmKzWvBfP9/hfN4Fsm1DjBC07+t6XNla7b5doniOA==
X-Google-Smtp-Source: AMsMyM7D2DoscbPAWYNYytpiXrSBqYxlapsLxGuKk8BIHT4WrARNfmGmCFDOprFU5TU26yMJOep8BKHwirYzuxZh2l8=
X-Received: by 2002:a17:906:dac8:b0:741:545b:796a with SMTP id
 xi8-20020a170906dac800b00741545b796amr45641186ejb.240.1667790817058; Sun, 06
 Nov 2022 19:13:37 -0800 (PST)
MIME-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com> <20221102231911.3107438-28-seanjc@google.com>
In-Reply-To: <20221102231911.3107438-28-seanjc@google.com>
From: Anup Patel <anup@brainfault.org>
Date: Mon, 7 Nov 2022 08:43:25 +0530
Message-ID: <CAAhSdy0NME71v2QMBWG-OFn1LLvGVZ=Gvadfiw70+OpZ2uLdPQ@mail.gmail.com>
Subject: Re: [PATCH 27/44] KVM: Drop kvm_arch_{init,exit}() hooks
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
X-CRM114-CacheID: sfid-20221106_191340_888992_86EACADF 
X-CRM114-Status: GOOD (  19.36  )
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
> Drop kvm_arch_init() and kvm_arch_exit() now that all implementations
> are nops.
>
> No functional change intended.
>
> Signed-off-by: Sean Christopherson <seanjc@google.com>

For KVM RISC-V:
Acked-by: Anup Patel <anup@brainfault.org>

Thanks,
Anup

> ---
>  arch/arm64/kvm/arm.c                | 11 -----------
>  arch/mips/kvm/mips.c                | 10 ----------
>  arch/powerpc/include/asm/kvm_host.h |  1 -
>  arch/powerpc/kvm/powerpc.c          |  5 -----
>  arch/riscv/kvm/main.c               |  9 ---------
>  arch/s390/kvm/kvm-s390.c            | 10 ----------
>  arch/x86/kvm/x86.c                  | 10 ----------
>  include/linux/kvm_host.h            |  3 ---
>  virt/kvm/kvm_main.c                 | 19 ++-----------------
>  9 files changed, 2 insertions(+), 76 deletions(-)
>
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 6e0061eac627..75c5125b0dd3 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -2284,17 +2284,6 @@ static __init int kvm_arm_init(void)
>         return err;
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -/* NOP: Compiling as a module not supported */
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  static int __init early_kvm_mode_cfg(char *arg)
>  {
>         if (!arg)
> diff --git a/arch/mips/kvm/mips.c b/arch/mips/kvm/mips.c
> index ae7a24342fdf..3cade648827a 100644
> --- a/arch/mips/kvm/mips.c
> +++ b/arch/mips/kvm/mips.c
> @@ -1010,16 +1010,6 @@ long kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
>         return r;
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  int kvm_arch_vcpu_ioctl_get_sregs(struct kvm_vcpu *vcpu,
>                                   struct kvm_sregs *sregs)
>  {
> diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
> index 5d2c3a487e73..0a80e80c7b9e 100644
> --- a/arch/powerpc/include/asm/kvm_host.h
> +++ b/arch/powerpc/include/asm/kvm_host.h
> @@ -881,7 +881,6 @@ static inline void kvm_arch_sync_events(struct kvm *kvm) {}
>  static inline void kvm_arch_memslots_updated(struct kvm *kvm, u64 gen) {}
>  static inline void kvm_arch_flush_shadow_all(struct kvm *kvm) {}
>  static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
> -static inline void kvm_arch_exit(void) {}
>  static inline void kvm_arch_vcpu_blocking(struct kvm_vcpu *vcpu) {}
>  static inline void kvm_arch_vcpu_unblocking(struct kvm_vcpu *vcpu) {}
>
> diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
> index 36c27381a769..34278042ad27 100644
> --- a/arch/powerpc/kvm/powerpc.c
> +++ b/arch/powerpc/kvm/powerpc.c
> @@ -2525,11 +2525,6 @@ void kvmppc_init_lpid(unsigned long nr_lpids_param)
>  }
>  EXPORT_SYMBOL_GPL(kvmppc_init_lpid);
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
>  EXPORT_TRACEPOINT_SYMBOL_GPL(kvm_ppc_instr);
>
>  void kvm_arch_create_vcpu_debugfs(struct kvm_vcpu *vcpu, struct dentry *debugfs_dentry)
> diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
> index cb063b8a9a0f..4710a6751687 100644
> --- a/arch/riscv/kvm/main.c
> +++ b/arch/riscv/kvm/main.c
> @@ -65,15 +65,6 @@ void kvm_arch_hardware_disable(void)
>         csr_write(CSR_HIDELEG, 0);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -}
> -
>  static int __init riscv_kvm_init(void)
>  {
>         const char *str;
> diff --git a/arch/s390/kvm/kvm-s390.c b/arch/s390/kvm/kvm-s390.c
> index f6ae845bc1c1..7c1c6d81b5d7 100644
> --- a/arch/s390/kvm/kvm-s390.c
> +++ b/arch/s390/kvm/kvm-s390.c
> @@ -533,16 +533,6 @@ static void __kvm_s390_exit(void)
>         debug_unregister(kvm_s390_dbf_uv);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  /* Section: device related */
>  long kvm_arch_dev_ioctl(struct file *filp,
>                         unsigned int ioctl, unsigned long arg)
> diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
> index 218707597bea..2b4530a33298 100644
> --- a/arch/x86/kvm/x86.c
> +++ b/arch/x86/kvm/x86.c
> @@ -9271,16 +9271,6 @@ static inline void kvm_ops_update(struct kvm_x86_init_ops *ops)
>         kvm_pmu_ops_update(ops->pmu_ops);
>  }
>
> -int kvm_arch_init(void *opaque)
> -{
> -       return 0;
> -}
> -
> -void kvm_arch_exit(void)
> -{
> -
> -}
> -
>  static int __kvm_x86_vendor_init(struct kvm_x86_init_ops *ops)
>  {
>         u64 host_pat;
> diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
> index 9b52bd40be56..6c2a28c4c684 100644
> --- a/include/linux/kvm_host.h
> +++ b/include/linux/kvm_host.h
> @@ -1423,9 +1423,6 @@ int kvm_arch_vcpu_ioctl_set_guest_debug(struct kvm_vcpu *vcpu,
>                                         struct kvm_guest_debug *dbg);
>  int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu);
>
> -int kvm_arch_init(void *opaque);
> -void kvm_arch_exit(void);
> -
>  void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu);
>
>  void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu);
> diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
> index 27ce263a80e4..17c852cb6842 100644
> --- a/virt/kvm/kvm_main.c
> +++ b/virt/kvm/kvm_main.c
> @@ -5833,20 +5833,8 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         int r;
>         int cpu;
>
> -       /*
> -        * FIXME: Get rid of kvm_arch_init(), vendor code should call arch code
> -        * directly.  Note, kvm_arch_init() _must_ be called before anything
> -        * else as x86 relies on checks buried in kvm_arch_init() to guard
> -        * against multiple calls to kvm_init().
> -        */
> -       r = kvm_arch_init(opaque);
> -       if (r)
> -               return r;
> -
> -       if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL)) {
> -               r = -ENOMEM;
> -               goto err_hw_enabled;
> -       }
> +       if (!zalloc_cpumask_var(&cpus_hardware_enabled, GFP_KERNEL))
> +               return -ENOMEM;
>
>         c.ret = &r;
>         c.opaque = opaque;
> @@ -5934,8 +5922,6 @@ int kvm_init(void *opaque, unsigned vcpu_size, unsigned vcpu_align,
>         cpuhp_remove_state_nocalls(CPUHP_AP_KVM_STARTING);
>  out_free_2:
>         free_cpumask_var(cpus_hardware_enabled);
> -err_hw_enabled:
> -       kvm_arch_exit();
>         return r;
>  }
>  EXPORT_SYMBOL_GPL(kvm_init);
> @@ -5963,7 +5949,6 @@ void kvm_exit(void)
>         on_each_cpu(hardware_disable_nolock, NULL, 1);
>         kvm_irqfd_exit();
>         free_cpumask_var(cpus_hardware_enabled);
> -       kvm_arch_exit();
>  }
>  EXPORT_SYMBOL_GPL(kvm_exit);
>
> --
> 2.38.1.431.g37b22c650d-goog
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
