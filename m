Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 389B7C4332F
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Nov 2022 23:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LyxShPI+de1qEAe61pCSXf+3TIHlwG97Mzj8GYAG3nE=; b=y6RKXUbSjxKa84
	63Vx5NTAaI78M9G5Vdy6JAu6eUCmBUVAuEcTk8vFm0CryyTlNCfX49U1R5uK2eyJ487efSLXibP2w
	tAZUxdUC/snVYN06Sj6Q34C6VCKewvydyVaH8w4vmcIsVgitmG4A4u1kh0suRl+T4VuGe52UhlnV9
	vkWP7wrAlqu2c5dOrhw+VFG8T1ioV0kIfMg0m5tyR8wF2ThV42zfWCTgoR8o7tQ2/FMDit+aN3JTB
	f/FqPu7dOfzXP7yC67rD4E7YRJVn1akbC01EBVm5CbLp4277W0aQ/C0RbOR1xoBGD1HYPrjLNWk0i
	mL8rKn6bZU/M4o1Btbqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNTW-00FAbu-K7; Wed, 02 Nov 2022 23:48:50 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqNGb-00F1m3-9u
	for linux-riscv@bombadil.infradead.org; Wed, 02 Nov 2022 23:35:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uJmhpw8S0ZJe1korKO0Alzy3kQF9fynwAwKCnYNFX40=; b=jEmKNmVJ0sCf0q3VzoOLAusjcy
	sb7jJgwZ+h/Foutc/gurGClb8nI3tIZ3Hpeq+CuV6cX7sTamnjtSh1qVcL7nECK5TOXpxOGth4Xmw
	+VrdveJg6wYzCMfXmqxrm0GcEQugoiDXjZVgkyZO7Iys+Lc6PLZw9bXeqtjI4w5erBakAK2mmzag9
	zpw1poTec95tXGc+qsRQBHotM8gN25roUaN8GdQGCgVG6RnqhfC2JENdj5DFHCd8c2nmWQouHH434
	XDfIHMFko9cXGgWnBgYAk/Xq5BXv8qw3q2av9wtPMPmgk2vC+0/9bzKecxquVeEboVzcHzY2A5EqX
	l31gMXTw==;
Received: from mail-pf1-x44a.google.com ([2607:f8b0:4864:20::44a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oqN1T-005vpw-MN
	for linux-riscv@lists.infradead.org; Wed, 02 Nov 2022 23:19:53 +0000
Received: by mail-pf1-x44a.google.com with SMTP id a41-20020a056a001d2900b0056e196bcc88so8952pfx.13
        for <linux-riscv@lists.infradead.org>; Wed, 02 Nov 2022 16:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=uJmhpw8S0ZJe1korKO0Alzy3kQF9fynwAwKCnYNFX40=;
        b=JnRgUSD0VggKXw/X9miDz1L3bgH+7mzY/qBVsb5VPbIqmo/8WeJSfMDN7s0MJEsDWW
         IRrPt/ToQ9aREu208mWZmMz1wetPkwYgf7IkAjrUcvtpFHAcmrr1qkSMKgs8JHWtzrGZ
         CHKKRoWYQvrBDmpX8T6vEgqjXxa1oMEELJfC4uPpMrdsTRFF7B9BQGgk3RRywWf9CUd+
         YLc0zH7aX+0nNPyig5EK1utGqDt+vrndZrbBL2NZ9YbvaBy8rkt2oL5tESiQuPEwWBFN
         PCgcr9djcU/1XGcy/YUbMM9m0Qx3ARLp/JlsJFUy/Hid5zzJd25c9nohDUhNnjEJNLr/
         C+cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uJmhpw8S0ZJe1korKO0Alzy3kQF9fynwAwKCnYNFX40=;
        b=dKWw7qnWPX5L+8Iy/+Aw4QXxAWjnu6VGleLj4EDxErKfihah6xZ/Y6SakoDbeaJkd/
         9yYmZ6Q0lRd9cECFj+iZCHG9i+Z2fgRaVkKTO9EPC0CdiuqW2BErFbXRlM8M1Bd2fcDB
         Hl1dbjBZxVEqhIS3Gsmi+fM4BBJUFznqcPGci+R4fK5SsnvaULUNES0Z+ErznG9YhD2h
         oLKaX26FMvRwmKkhabKokeRyW9+4FG8sm2KqyUT7QXwmMB8JwtNuNOnqi4qeviqkJIIn
         EKmbzbrg2LHezY/FirlBZJyRcgdBsIQP2DvUsEB4tx9izAbIol7ycsibXG4NOJOGs5+v
         uOiA==
X-Gm-Message-State: ACrzQf2dnVPkhcylwYbTmCsVKKZ3Rh06qMP21yCu6qPnlHwKXt7zqLir
	GNg9oBRTtUpvc+UbcnYlJ3LUn7EiYvg=
X-Google-Smtp-Source: AMsMyM7DRNBTagVfD6kGqI2BAaQl/o7kEqezBzwKjlyGRtlql5fIuL96+MD52HpfKwQzi2Xg1ufnbhnLvRo=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6a00:1a0e:b0:547:1cf9:40e8 with SMTP id
 g14-20020a056a001a0e00b005471cf940e8mr27409341pfv.82.1667431184428; Wed, 02
 Nov 2022 16:19:44 -0700 (PDT)
Date: Wed,  2 Nov 2022 23:18:45 +0000
In-Reply-To: <20221102231911.3107438-1-seanjc@google.com>
Mime-Version: 1.0
References: <20221102231911.3107438-1-seanjc@google.com>
X-Mailer: git-send-email 2.38.1.431.g37b22c650d-goog
Message-ID: <20221102231911.3107438-19-seanjc@google.com>
Subject: [PATCH 18/44] KVM: arm64: Mark kvm_arm_init() and its unique
 descendants as __init
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Huacai Chen <chenhuacai@kernel.org>, 
	Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Janosch Frank <frankja@linux.ibm.com>, Claudio Imbrenda <imbrenda@linux.ibm.com>, 
	Matthew Rosato <mjrosato@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Sean Christopherson <seanjc@google.com>, Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: James Morse <james.morse@arm.com>, Alexandru Elisei <alexandru.elisei@arm.com>, 
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
X-CRM114-CacheID: sfid-20221102_231951_783623_157625F0 
X-CRM114-Status: GOOD (  17.05  )
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
Reply-To: Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Tag kvm_arm_init() and its unique helper as __init, and tag data that is
only ever modified under the kvm_arm_init() umbrella as read-only after
init.

Opportunistically name the boolean param in kvm_timer_hyp_init()'s
prototype to match its definition.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h | 14 ++++++-------
 arch/arm64/include/asm/kvm_mmu.h  |  4 ++--
 arch/arm64/kvm/arch_timer.c       |  2 +-
 arch/arm64/kvm/arm.c              | 34 +++++++++++++++----------------
 arch/arm64/kvm/mmu.c              | 12 +++++------
 arch/arm64/kvm/reset.c            |  8 ++++----
 arch/arm64/kvm/sys_regs.c         |  6 +++---
 arch/arm64/kvm/vmid.c             |  6 +++---
 include/kvm/arm_arch_timer.h      |  2 +-
 9 files changed, 44 insertions(+), 44 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 5d5a887e63a5..4863fe356be1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -66,8 +66,8 @@ enum kvm_mode kvm_get_mode(void);
 
 DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
-extern unsigned int kvm_sve_max_vl;
-int kvm_arm_init_sve(void);
+extern unsigned int __ro_after_init kvm_sve_max_vl;
+int __init kvm_arm_init_sve(void);
 
 u32 __attribute_const__ kvm_target_cpu(void);
 int kvm_reset_vcpu(struct kvm_vcpu *vcpu);
@@ -793,7 +793,7 @@ int kvm_handle_cp10_id(struct kvm_vcpu *vcpu);
 
 void kvm_reset_sys_regs(struct kvm_vcpu *vcpu);
 
-int kvm_sys_reg_table_init(void);
+int __init kvm_sys_reg_table_init(void);
 
 /* MMIO helpers */
 void kvm_mmio_write_buf(void *buf, unsigned int len, unsigned long data);
@@ -824,9 +824,9 @@ int kvm_arm_pvtime_get_attr(struct kvm_vcpu *vcpu,
 int kvm_arm_pvtime_has_attr(struct kvm_vcpu *vcpu,
 			    struct kvm_device_attr *attr);
 
-extern unsigned int kvm_arm_vmid_bits;
-int kvm_arm_vmid_alloc_init(void);
-void kvm_arm_vmid_alloc_free(void);
+extern unsigned int __ro_after_init kvm_arm_vmid_bits;
+int __init kvm_arm_vmid_alloc_init(void);
+void __init kvm_arm_vmid_alloc_free(void);
 void kvm_arm_vmid_update(struct kvm_vmid *kvm_vmid);
 void kvm_arm_vmid_clear_active(void);
 
@@ -909,7 +909,7 @@ static inline void kvm_clr_pmu_events(u32 clr) {}
 void kvm_vcpu_load_sysregs_vhe(struct kvm_vcpu *vcpu);
 void kvm_vcpu_put_sysregs_vhe(struct kvm_vcpu *vcpu);
 
-int kvm_set_ipa_limit(void);
+int __init kvm_set_ipa_limit(void);
 
 #define __KVM_HAVE_ARCH_VM_ALLOC
 struct kvm *kvm_arch_alloc_vm(void);
diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/asm/kvm_mmu.h
index 7784081088e7..ced5b0028933 100644
--- a/arch/arm64/include/asm/kvm_mmu.h
+++ b/arch/arm64/include/asm/kvm_mmu.h
@@ -163,7 +163,7 @@ int create_hyp_io_mappings(phys_addr_t phys_addr, size_t size,
 			   void __iomem **haddr);
 int create_hyp_exec_mappings(phys_addr_t phys_addr, size_t size,
 			     void **haddr);
-void free_hyp_pgds(void);
+void __init free_hyp_pgds(void);
 
 void stage2_unmap_vm(struct kvm *kvm);
 int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu);
@@ -175,7 +175,7 @@ int kvm_handle_guest_abort(struct kvm_vcpu *vcpu);
 
 phys_addr_t kvm_mmu_get_httbr(void);
 phys_addr_t kvm_get_idmap_vector(void);
-int kvm_mmu_init(u32 *hyp_va_bits);
+int __init kvm_mmu_init(u32 *hyp_va_bits);
 
 static inline void *__kvm_vector_slot2addr(void *base,
 					   enum arm64_hyp_spectre_vector slot)
diff --git a/arch/arm64/kvm/arch_timer.c b/arch/arm64/kvm/arch_timer.c
index 33fca1a691a5..23346585a294 100644
--- a/arch/arm64/kvm/arch_timer.c
+++ b/arch/arm64/kvm/arch_timer.c
@@ -1113,7 +1113,7 @@ static int kvm_irq_init(struct arch_timer_kvm_info *info)
 	return 0;
 }
 
-int kvm_timer_hyp_init(bool has_gic)
+int __init kvm_timer_hyp_init(bool has_gic)
 {
 	struct arch_timer_kvm_info *info;
 	int err;
diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
index bfa2dcd3db11..6e0061eac627 100644
--- a/arch/arm64/kvm/arm.c
+++ b/arch/arm64/kvm/arm.c
@@ -1513,7 +1513,7 @@ static int kvm_init_vector_slots(void)
 	return 0;
 }
 
-static void cpu_prepare_hyp_mode(int cpu)
+static void __init cpu_prepare_hyp_mode(int cpu)
 {
 	struct kvm_nvhe_init_params *params = per_cpu_ptr_nvhe_sym(kvm_init_params, cpu);
 	unsigned long tcr;
@@ -1739,26 +1739,26 @@ static struct notifier_block hyp_init_cpu_pm_nb = {
 	.notifier_call = hyp_init_cpu_pm_notifier,
 };
 
-static void hyp_cpu_pm_init(void)
+static void __init hyp_cpu_pm_init(void)
 {
 	if (!is_protected_kvm_enabled())
 		cpu_pm_register_notifier(&hyp_init_cpu_pm_nb);
 }
-static void hyp_cpu_pm_exit(void)
+static void __init hyp_cpu_pm_exit(void)
 {
 	if (!is_protected_kvm_enabled())
 		cpu_pm_unregister_notifier(&hyp_init_cpu_pm_nb);
 }
 #else
-static inline void hyp_cpu_pm_init(void)
+static inline void __init hyp_cpu_pm_init(void)
 {
 }
-static inline void hyp_cpu_pm_exit(void)
+static inline void __init hyp_cpu_pm_exit(void)
 {
 }
 #endif
 
-static void init_cpu_logical_map(void)
+static void __init init_cpu_logical_map(void)
 {
 	unsigned int cpu;
 
@@ -1775,7 +1775,7 @@ static void init_cpu_logical_map(void)
 #define init_psci_0_1_impl_state(config, what)	\
 	config.psci_0_1_ ## what ## _implemented = psci_ops.what
 
-static bool init_psci_relay(void)
+static bool __init init_psci_relay(void)
 {
 	/*
 	 * If PSCI has not been initialized, protected KVM cannot install
@@ -1798,7 +1798,7 @@ static bool init_psci_relay(void)
 	return true;
 }
 
-static int init_subsystems(void)
+static int __init init_subsystems(void)
 {
 	int err = 0;
 
@@ -1848,13 +1848,13 @@ static int init_subsystems(void)
 	return err;
 }
 
-static void teardown_subsystems(void)
+static void __init teardown_subsystems(void)
 {
 	kvm_unregister_perf_callbacks();
 	hyp_cpu_pm_exit();
 }
 
-static void teardown_hyp_mode(void)
+static void __init teardown_hyp_mode(void)
 {
 	int cpu;
 
@@ -1865,7 +1865,7 @@ static void teardown_hyp_mode(void)
 	}
 }
 
-static int do_pkvm_init(u32 hyp_va_bits)
+static int __init do_pkvm_init(u32 hyp_va_bits)
 {
 	void *per_cpu_base = kvm_ksym_ref(kvm_arm_hyp_percpu_base);
 	int ret;
@@ -1887,7 +1887,7 @@ static int do_pkvm_init(u32 hyp_va_bits)
 	return ret;
 }
 
-static int kvm_hyp_init_protection(u32 hyp_va_bits)
+static int __init kvm_hyp_init_protection(u32 hyp_va_bits)
 {
 	void *addr = phys_to_virt(hyp_mem_base);
 	int ret;
@@ -1917,7 +1917,7 @@ static int kvm_hyp_init_protection(u32 hyp_va_bits)
 /**
  * Inits Hyp-mode on all online CPUs
  */
-static int init_hyp_mode(void)
+static int __init init_hyp_mode(void)
 {
 	u32 hyp_va_bits;
 	int cpu;
@@ -2099,7 +2099,7 @@ static int init_hyp_mode(void)
 	return err;
 }
 
-static void _kvm_host_prot_finalize(void *arg)
+static void __init _kvm_host_prot_finalize(void *arg)
 {
 	int *err = arg;
 
@@ -2107,7 +2107,7 @@ static void _kvm_host_prot_finalize(void *arg)
 		WRITE_ONCE(*err, -EINVAL);
 }
 
-static int pkvm_drop_host_privileges(void)
+static int __init pkvm_drop_host_privileges(void)
 {
 	int ret = 0;
 
@@ -2120,7 +2120,7 @@ static int pkvm_drop_host_privileges(void)
 	return ret;
 }
 
-static int finalize_hyp_mode(void)
+static int __init finalize_hyp_mode(void)
 {
 	if (!is_protected_kvm_enabled())
 		return 0;
@@ -2190,7 +2190,7 @@ void kvm_arch_irq_bypass_start(struct irq_bypass_consumer *cons)
 /**
  * Initialize Hyp-mode and memory mappings on all CPUs.
  */
-int kvm_arm_init(void)
+static __init int kvm_arm_init(void)
 {
 	int err;
 	bool in_hyp_mode;
diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 60ee3d9f01f8..4633664adb11 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -25,11 +25,11 @@
 static struct kvm_pgtable *hyp_pgtable;
 static DEFINE_MUTEX(kvm_hyp_pgd_mutex);
 
-static unsigned long hyp_idmap_start;
-static unsigned long hyp_idmap_end;
-static phys_addr_t hyp_idmap_vector;
+static unsigned long __ro_after_init hyp_idmap_start;
+static unsigned long __ro_after_init hyp_idmap_end;
+static phys_addr_t __ro_after_init hyp_idmap_vector;
 
-static unsigned long io_map_base;
+static unsigned long __ro_after_init io_map_base;
 
 static phys_addr_t stage2_range_addr_end(phys_addr_t addr, phys_addr_t end)
 {
@@ -261,7 +261,7 @@ static void stage2_flush_vm(struct kvm *kvm)
 /**
  * free_hyp_pgds - free Hyp-mode page tables
  */
-void free_hyp_pgds(void)
+void __init free_hyp_pgds(void)
 {
 	mutex_lock(&kvm_hyp_pgd_mutex);
 	if (hyp_pgtable) {
@@ -1615,7 +1615,7 @@ static struct kvm_pgtable_mm_ops kvm_hyp_mm_ops = {
 	.virt_to_phys		= kvm_host_pa,
 };
 
-int kvm_mmu_init(u32 *hyp_va_bits)
+int __init kvm_mmu_init(u32 *hyp_va_bits)
 {
 	int err;
 
diff --git a/arch/arm64/kvm/reset.c b/arch/arm64/kvm/reset.c
index 5ae18472205a..dd58a8629a2e 100644
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -30,7 +30,7 @@
 #include <asm/virt.h>
 
 /* Maximum phys_shift supported for any VM on this host */
-static u32 kvm_ipa_limit;
+static u32 __ro_after_init kvm_ipa_limit;
 
 /*
  * ARMv8 Reset Values
@@ -41,9 +41,9 @@ static u32 kvm_ipa_limit;
 #define VCPU_RESET_PSTATE_SVC	(PSR_AA32_MODE_SVC | PSR_AA32_A_BIT | \
 				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
 
-unsigned int kvm_sve_max_vl;
+unsigned int __ro_after_init kvm_sve_max_vl;
 
-int kvm_arm_init_sve(void)
+int __init kvm_arm_init_sve(void)
 {
 	if (system_supports_sve()) {
 		kvm_sve_max_vl = sve_max_virtualisable_vl();
@@ -352,7 +352,7 @@ u32 get_kvm_ipa_limit(void)
 	return kvm_ipa_limit;
 }
 
-int kvm_set_ipa_limit(void)
+int __init kvm_set_ipa_limit(void)
 {
 	unsigned int parange;
 	u64 mmfr0;
diff --git a/arch/arm64/kvm/sys_regs.c b/arch/arm64/kvm/sys_regs.c
index f4a7c5abcbca..0359f57c2c44 100644
--- a/arch/arm64/kvm/sys_regs.c
+++ b/arch/arm64/kvm/sys_regs.c
@@ -82,7 +82,7 @@ void vcpu_write_sys_reg(struct kvm_vcpu *vcpu, u64 val, int reg)
 }
 
 /* 3 bits per cache level, as per CLIDR, but non-existent caches always 0 */
-static u32 cache_levels;
+static u32 __ro_after_init cache_levels;
 
 /* CSSELR values; used to index KVM_REG_ARM_DEMUX_ID_CCSIDR */
 #define CSSELR_MAX 14
@@ -2620,7 +2620,7 @@ static void get_ctr_el0(struct kvm_vcpu *v, const struct sys_reg_desc *r)
 }
 
 /* ->val is filled in by kvm_sys_reg_table_init() */
-static struct sys_reg_desc invariant_sys_regs[] = {
+static struct sys_reg_desc invariant_sys_regs[] __ro_after_init = {
 	{ SYS_DESC(SYS_MIDR_EL1), NULL, get_midr_el1 },
 	{ SYS_DESC(SYS_REVIDR_EL1), NULL, get_revidr_el1 },
 	{ SYS_DESC(SYS_CLIDR_EL1), NULL, get_clidr_el1 },
@@ -2944,7 +2944,7 @@ int kvm_arm_copy_sys_reg_indices(struct kvm_vcpu *vcpu, u64 __user *uindices)
 	return write_demux_regids(uindices);
 }
 
-int kvm_sys_reg_table_init(void)
+int __init kvm_sys_reg_table_init(void)
 {
 	bool valid = true;
 	unsigned int i;
diff --git a/arch/arm64/kvm/vmid.c b/arch/arm64/kvm/vmid.c
index d78ae63d7c15..08978d0672e7 100644
--- a/arch/arm64/kvm/vmid.c
+++ b/arch/arm64/kvm/vmid.c
@@ -16,7 +16,7 @@
 #include <asm/kvm_asm.h>
 #include <asm/kvm_mmu.h>
 
-unsigned int kvm_arm_vmid_bits;
+unsigned int __ro_after_init kvm_arm_vmid_bits;
 static DEFINE_RAW_SPINLOCK(cpu_vmid_lock);
 
 static atomic64_t vmid_generation;
@@ -172,7 +172,7 @@ void kvm_arm_vmid_update(struct kvm_vmid *kvm_vmid)
 /*
  * Initialize the VMID allocator
  */
-int kvm_arm_vmid_alloc_init(void)
+int __init kvm_arm_vmid_alloc_init(void)
 {
 	kvm_arm_vmid_bits = kvm_get_vmid_bits();
 
@@ -190,7 +190,7 @@ int kvm_arm_vmid_alloc_init(void)
 	return 0;
 }
 
-void kvm_arm_vmid_alloc_free(void)
+void __init kvm_arm_vmid_alloc_free(void)
 {
 	kfree(vmid_map);
 }
diff --git a/include/kvm/arm_arch_timer.h b/include/kvm/arm_arch_timer.h
index 1638418f72dd..71916de7c6c4 100644
--- a/include/kvm/arm_arch_timer.h
+++ b/include/kvm/arm_arch_timer.h
@@ -60,7 +60,7 @@ struct arch_timer_cpu {
 	bool			enabled;
 };
 
-int kvm_timer_hyp_init(bool);
+int __init kvm_timer_hyp_init(bool has_gic);
 int kvm_timer_enable(struct kvm_vcpu *vcpu);
 int kvm_timer_vcpu_reset(struct kvm_vcpu *vcpu);
 void kvm_timer_vcpu_init(struct kvm_vcpu *vcpu);
-- 
2.38.1.431.g37b22c650d-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
