Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0AF9C0015E
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Jul 2023 05:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID
	:References:Mime-Version:In-Reply-To:Date:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Nmvm/bYFjkff1oj9cvBJ6fhZ3QDr0CObMDhzqczBQss=; b=APlk8WGcyBO2qL
	W7LoUIx/BSDRKHmht1rV9uqadUb0xHZicZNQCz+UWEBDjaRzZcvpGYk4O5vzi25k74sBxTtX1vXoq
	NZrZ34y/34qzS61HgPZPVpUgclP5mpF5Y+rqH2sVfwtlvJFjSn9cPvugSZm1Nty2l8CkajYHP9/IP
	7NFQ1MqRGdCCjFFAg7G+YBCDMkzXBdwf8ySRAHDXJVC+/7rLvZz3rJLw+H2Yo87Sj2FDxjLmrzUCw
	QG1mtP8jUXbkfTPiBBRfEzWkYD1IQIJpFJ90NUvRdDjaVV183wuwpxSSOp25TwIIxmQ158b4fhH8P
	ehhYVS4HJC/QK9XJ1g2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzef-005GJn-0q;
	Wed, 19 Jul 2023 05:23:17 +0000
Received: from casper.infradead.org ([90.155.50.34])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qLzc7-005Dg5-1F
	for linux-riscv@bombadil.infradead.org;
	Wed, 19 Jul 2023 05:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:Sender:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Egm/XxJ8ddWbI/DaWjAWd8f37iIZoXJS+wUVmFcRAns=; b=r5Bps/Mfw+yDLDz7bXEYbIzJeE
	H2W1Bd9T+DK6O6DrFxTbuVxSD0AWSbpdx8krLW/6W/3yxxP3DvFpYfCHSsmaV/Xp8MFxH1nMoGupk
	WrgsrAD9ekaZ/KBr6h70wRqfTBlLpruGENndSnhRvKjJzWmSt7iqhQaaudU5h/R4Tyu7CXLOGJLvU
	EKf0z8u75mGQrh+YIQg6ZnCia5NyGfWGf56i/WMM/0YuLoHWagx/QiSbVlqbgr4ymVquxSs7WNOqC
	Ic8MpYjP4/3NAvwFBuvNYnliifEbvu0ozQdtc2hszTynQivlrt90osALMaWBFIjGXJWanMpgwPmOk
	SW23+utg==;
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by casper.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1qLuRu-005QWx-IE
	for linux-riscv@lists.infradead.org; Tue, 18 Jul 2023 23:49:49 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-cf4cb742715so68169276.2
        for <linux-riscv@lists.infradead.org>; Tue, 18 Jul 2023 16:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689724121; x=1692316121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=Egm/XxJ8ddWbI/DaWjAWd8f37iIZoXJS+wUVmFcRAns=;
        b=jmuY9roKZMyFhtYvPEoDziDnCcR7JdYNk6MHm5cFsWzUI97GEXVLYK1GdjIllbAuc8
         4ySkYVESTYqTzNduR8YSId27LdhHiTgoO/QliIr5NJBmEYoJ3hqAD7mwOWzvFkUx4Bii
         goVBiLBONUuy9TatGLx00I5NjhWHSEHqUSiN1WkdO1FULfalsZjiiUrIy35lsmGM8gg5
         0R9io78Au8wj9A4RGlGH7FDc+jn67CVyDvAeFJPAeD6X9/PbcbAdX5be8ZMA4OH8wO2X
         REDfKC9pVZc7WTJWTP+0UyFThTKKDkHpI7he51JmdU9wLJq3gXsen7d9rft5gMUHTkyh
         wERA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689724121; x=1692316121;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Egm/XxJ8ddWbI/DaWjAWd8f37iIZoXJS+wUVmFcRAns=;
        b=kAcUXzgaq+BQCURrc/bfqiM8lrtdoof1Ok3FNi0AbVzL6FdubW9iZnMWGPiy7dTSPj
         g6TEeC0xTNGitJq0+iD6S06N++A4m1yBvGBhvZJoZfStRBqmSW5/1OspfMqh+KFlvzrk
         1bmS7zqqlpsIt3tczNJsVVwwBHYHy6DOCvw94mqOoUi8ghD0Tc2yyjcX7azGZULkGQi7
         Khk5FZQauli2YutCo+HWJNR/z65U6viMtKwWdv/5WqVP63NIIF2j8+N9eMewwG/1Tuyi
         FXE/10gqRP2hM1cjNbRzMza+wMsNM519DLHKgpHlbbj/CP9dwH8lUNcsKns3qbG0V1Kx
         8zrw==
X-Gm-Message-State: ABy/qLYtVBRPL6nuw5ogJY3TwAuFBjG0XrmbCbgLoWSEwyL8518JGdSo
	yl+LUkjPq6EGw2oZSS7HA78eSua4K7A=
X-Google-Smtp-Source: APBJJlFh2D+dQAa/XLO1xU2e6kFsryQ3DCD95rOJdVXmpZcOUWfUGVGQg2QmRxbQ3p6/rJNCJuKy9Jt0/xg=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:1005:b0:c5d:2623:560e with SMTP id
 w5-20020a056902100500b00c5d2623560emr14047ybt.12.1689724121300; Tue, 18 Jul
 2023 16:48:41 -0700 (PDT)
Date: Tue, 18 Jul 2023 16:44:48 -0700
In-Reply-To: <20230718234512.1690985-1-seanjc@google.com>
Mime-Version: 1.0
References: <20230718234512.1690985-1-seanjc@google.com>
X-Mailer: git-send-email 2.41.0.255.g8b1d071c50-goog
Message-ID: <20230718234512.1690985-6-seanjc@google.com>
Subject: [RFC PATCH v11 05/29] KVM: Convert KVM_ARCH_WANT_MMU_NOTIFIER to CONFIG_KVM_GENERIC_MMU_NOTIFIER
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Huacai Chen <chenhuacai@kernel.org>, 
	Michael Ellerman <mpe@ellerman.id.au>, Anup Patel <anup@brainfault.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Sean Christopherson <seanjc@google.com>, 
	"Matthew Wilcox (Oracle)" <willy@infradead.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-mips@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, kvm-riscv@lists.infradead.org, 
	linux-riscv@lists.infradead.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Chao Peng <chao.p.peng@linux.intel.com>, 
	Fuad Tabba <tabba@google.com>, Jarkko Sakkinen <jarkko@kernel.org>, 
	Yu Zhang <yu.c.zhang@linux.intel.com>, Vishal Annapurve <vannapurve@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Maciej Szmigiero <mail@maciej.szmigiero.name>, 
	Vlastimil Babka <vbabka@suse.cz>, David Hildenbrand <david@redhat.com>, Quentin Perret <qperret@google.com>, 
	Michael Roth <michael.roth@amd.com>, Wang <wei.w.wang@intel.com>, 
	Liam Merwick <liam.merwick@oracle.com>, Isaku Yamahata <isaku.yamahata@gmail.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_004946_612709_D8CD8844 
X-CRM114-Status: GOOD (  13.59  )
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

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/arm64/include/asm/kvm_host.h   |  2 --
 arch/arm64/kvm/Kconfig              |  2 +-
 arch/mips/include/asm/kvm_host.h    |  2 --
 arch/mips/kvm/Kconfig               |  2 +-
 arch/powerpc/include/asm/kvm_host.h |  2 --
 arch/powerpc/kvm/Kconfig            |  8 ++++----
 arch/powerpc/kvm/powerpc.c          |  4 +---
 arch/riscv/include/asm/kvm_host.h   |  2 --
 arch/riscv/kvm/Kconfig              |  2 +-
 arch/x86/include/asm/kvm_host.h     |  2 --
 arch/x86/kvm/Kconfig                |  2 +-
 include/linux/kvm_host.h            |  8 +++++---
 virt/kvm/Kconfig                    |  4 ++++
 virt/kvm/kvm_main.c                 | 10 +++++-----
 14 files changed, 23 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
index 8b6096753740..50d89d400bf1 100644
--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -912,8 +912,6 @@ int __kvm_arm_vcpu_get_events(struct kvm_vcpu *vcpu,
 int __kvm_arm_vcpu_set_events(struct kvm_vcpu *vcpu,
 			      struct kvm_vcpu_events *events);
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 void kvm_arm_halt_guest(struct kvm *kvm);
 void kvm_arm_resume_guest(struct kvm *kvm);
 
diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
index f531da6b362e..a650b46f4f2f 100644
--- a/arch/arm64/kvm/Kconfig
+++ b/arch/arm64/kvm/Kconfig
@@ -22,7 +22,7 @@ menuconfig KVM
 	bool "Kernel-based Virtual Machine (KVM) support"
 	depends on HAVE_KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	select HAVE_KVM_CPU_RELAX_INTERCEPT
 	select HAVE_KVM_ARCH_TLB_FLUSH_ALL
diff --git a/arch/mips/include/asm/kvm_host.h b/arch/mips/include/asm/kvm_host.h
index 04cedf9f8811..22a41d941bf3 100644
--- a/arch/mips/include/asm/kvm_host.h
+++ b/arch/mips/include/asm/kvm_host.h
@@ -810,8 +810,6 @@ int kvm_mips_mkclean_gpa_pt(struct kvm *kvm, gfn_t start_gfn, gfn_t end_gfn);
 pgd_t *kvm_pgd_alloc(void);
 void kvm_mmu_free_memory_caches(struct kvm_vcpu *vcpu);
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 /* Emulation */
 enum emulation_result update_pc(struct kvm_vcpu *vcpu, u32 cause);
 int kvm_get_badinstr(u32 *opc, struct kvm_vcpu *vcpu, u32 *out);
diff --git a/arch/mips/kvm/Kconfig b/arch/mips/kvm/Kconfig
index a8cdba75f98d..c04987d2ed2e 100644
--- a/arch/mips/kvm/Kconfig
+++ b/arch/mips/kvm/Kconfig
@@ -25,7 +25,7 @@ config KVM
 	select HAVE_KVM_EVENTFD
 	select HAVE_KVM_VCPU_ASYNC_IOCTL
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select INTERVAL_TREE
 	select KVM_GENERIC_HARDWARE_ENABLING
 	help
diff --git a/arch/powerpc/include/asm/kvm_host.h b/arch/powerpc/include/asm/kvm_host.h
index 14ee0dece853..4b5c3f2acf78 100644
--- a/arch/powerpc/include/asm/kvm_host.h
+++ b/arch/powerpc/include/asm/kvm_host.h
@@ -62,8 +62,6 @@
 
 #include <linux/mmu_notifier.h>
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 #define HPTEG_CACHE_NUM			(1 << 15)
 #define HPTEG_HASH_BITS_PTE		13
 #define HPTEG_HASH_BITS_PTE_LONG	12
diff --git a/arch/powerpc/kvm/Kconfig b/arch/powerpc/kvm/Kconfig
index 902611954200..b33358ee6424 100644
--- a/arch/powerpc/kvm/Kconfig
+++ b/arch/powerpc/kvm/Kconfig
@@ -42,7 +42,7 @@ config KVM_BOOK3S_64_HANDLER
 config KVM_BOOK3S_PR_POSSIBLE
 	bool
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 
 config KVM_BOOK3S_HV_POSSIBLE
 	bool
@@ -85,7 +85,7 @@ config KVM_BOOK3S_64_HV
 	tristate "KVM for POWER7 and later using hypervisor mode in host"
 	depends on KVM_BOOK3S_64 && PPC_POWERNV
 	select KVM_BOOK3S_HV_POSSIBLE
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select CMA
 	help
 	  Support running unmodified book3s_64 guest kernels in
@@ -194,7 +194,7 @@ config KVM_E500V2
 	depends on !CONTEXT_TRACKING_USER
 	select KVM
 	select KVM_MMIO
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	help
 	  Support running unmodified E500 guest kernels in virtual machines on
 	  E500v2 host processors.
@@ -211,7 +211,7 @@ config KVM_E500MC
 	select KVM
 	select KVM_MMIO
 	select KVM_BOOKE_HV
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	help
 	  Support running unmodified E500MC/E5500/E6500 guest kernels in
 	  virtual machines on E500MC/E5500/E6500 host processors.
diff --git a/arch/powerpc/kvm/powerpc.c b/arch/powerpc/kvm/powerpc.c
index 5cf9e5e3112a..f97fbac7eac9 100644
--- a/arch/powerpc/kvm/powerpc.c
+++ b/arch/powerpc/kvm/powerpc.c
@@ -635,9 +635,7 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
 #ifdef CONFIG_KVM_BOOK3S_HV_POSSIBLE
 		r = hv_enabled;
 #else
-#ifndef KVM_ARCH_WANT_MMU_NOTIFIER
-		BUILD_BUG();
-#endif
+		BUILD_BUG_ON(!IS_ENABLED(CONFIG_KVM_GENERIC_MMU_NOTIFIER));
 		r = 1;
 #endif
 		break;
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 2d8ee53b66c7..6ddaf0b9278c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -249,8 +249,6 @@ struct kvm_vcpu_arch {
 static inline void kvm_arch_sync_events(struct kvm *kvm) {}
 static inline void kvm_arch_sched_in(struct kvm_vcpu *vcpu, int cpu) {}
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 #define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
 
 void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
diff --git a/arch/riscv/kvm/Kconfig b/arch/riscv/kvm/Kconfig
index dfc237d7875b..ae2e05f050ec 100644
--- a/arch/riscv/kvm/Kconfig
+++ b/arch/riscv/kvm/Kconfig
@@ -30,7 +30,7 @@ config KVM
 	select KVM_GENERIC_HARDWARE_ENABLING
 	select KVM_MMIO
 	select KVM_XFER_TO_GUEST_WORK
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select PREEMPT_NOTIFIERS
 	help
 	  Support hosting virtualized guest machines.
diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 28bd38303d70..f9a927296d85 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -2110,8 +2110,6 @@ enum {
 # define kvm_memslots_for_spte_role(kvm, role) __kvm_memslots(kvm, 0)
 #endif
 
-#define KVM_ARCH_WANT_MMU_NOTIFIER
-
 int kvm_cpu_has_injectable_intr(struct kvm_vcpu *v);
 int kvm_cpu_has_interrupt(struct kvm_vcpu *vcpu);
 int kvm_cpu_has_extint(struct kvm_vcpu *v);
diff --git a/arch/x86/kvm/Kconfig b/arch/x86/kvm/Kconfig
index 89ca7f4c1464..a7eb2bdbfb18 100644
--- a/arch/x86/kvm/Kconfig
+++ b/arch/x86/kvm/Kconfig
@@ -24,7 +24,7 @@ config KVM
 	depends on HIGH_RES_TIMERS
 	depends on X86_LOCAL_APIC
 	select PREEMPT_NOTIFIERS
-	select MMU_NOTIFIER
+	select KVM_GENERIC_MMU_NOTIFIER
 	select HAVE_KVM_IRQCHIP
 	select HAVE_KVM_PFNCACHE
 	select HAVE_KVM_IRQFD
diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 90a0be261a5c..d2d3e083ec7f 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -255,7 +255,9 @@ bool kvm_setup_async_pf(struct kvm_vcpu *vcpu, gpa_t cr2_or_gpa,
 int kvm_async_pf_wakeup_all(struct kvm_vcpu *vcpu);
 #endif
 
-#ifdef KVM_ARCH_WANT_MMU_NOTIFIER
+struct kvm_gfn_range;
+
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 struct kvm_gfn_range {
 	struct kvm_memory_slot *slot;
 	gfn_t start;
@@ -784,7 +786,7 @@ struct kvm {
 	struct hlist_head irq_ack_notifier_list;
 #endif
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	struct mmu_notifier mmu_notifier;
 	unsigned long mmu_invalidate_seq;
 	long mmu_invalidate_in_progress;
@@ -1916,7 +1918,7 @@ extern const struct _kvm_stats_desc kvm_vm_stats_desc[];
 extern const struct kvm_stats_header kvm_vcpu_stats_header;
 extern const struct _kvm_stats_desc kvm_vcpu_stats_desc[];
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 static inline int mmu_invalidate_retry(struct kvm *kvm, unsigned long mmu_seq)
 {
 	if (unlikely(kvm->mmu_invalidate_in_progress))
diff --git a/virt/kvm/Kconfig b/virt/kvm/Kconfig
index b74916de5183..2fa11bd26cfc 100644
--- a/virt/kvm/Kconfig
+++ b/virt/kvm/Kconfig
@@ -95,3 +95,7 @@ config HAVE_KVM_PM_NOTIFIER
 
 config KVM_GENERIC_HARDWARE_ENABLING
        bool
+
+config KVM_GENERIC_MMU_NOTIFIER
+       select MMU_NOTIFIER
+       bool
diff --git a/virt/kvm/kvm_main.c b/virt/kvm/kvm_main.c
index 8101b11a13ba..53346bc2902a 100644
--- a/virt/kvm/kvm_main.c
+++ b/virt/kvm/kvm_main.c
@@ -510,7 +510,7 @@ void kvm_destroy_vcpus(struct kvm *kvm)
 }
 EXPORT_SYMBOL_GPL(kvm_destroy_vcpus);
 
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 static inline struct kvm *mmu_notifier_to_kvm(struct mmu_notifier *mn)
 {
 	return container_of(mn, struct kvm, mmu_notifier);
@@ -938,14 +938,14 @@ static int kvm_init_mmu_notifier(struct kvm *kvm)
 	return mmu_notifier_register(&kvm->mmu_notifier, current->mm);
 }
 
-#else  /* !(CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER) */
+#else  /* !CONFIG_KVM_GENERIC_MMU_NOTIFIER */
 
 static int kvm_init_mmu_notifier(struct kvm *kvm)
 {
 	return 0;
 }
 
-#endif /* CONFIG_MMU_NOTIFIER && KVM_ARCH_WANT_MMU_NOTIFIER */
+#endif /* CONFIG_KVM_GENERIC_MMU_NOTIFIER */
 
 #ifdef CONFIG_HAVE_KVM_PM_NOTIFIER
 static int kvm_pm_notifier_call(struct notifier_block *bl,
@@ -1265,7 +1265,7 @@ static struct kvm *kvm_create_vm(unsigned long type, const char *fdname)
 out_err_no_debugfs:
 	kvm_coalesced_mmio_free(kvm);
 out_no_coalesced_mmio:
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	if (kvm->mmu_notifier.ops)
 		mmu_notifier_unregister(&kvm->mmu_notifier, current->mm);
 #endif
@@ -1325,7 +1325,7 @@ static void kvm_destroy_vm(struct kvm *kvm)
 		kvm->buses[i] = NULL;
 	}
 	kvm_coalesced_mmio_free(kvm);
-#if defined(CONFIG_MMU_NOTIFIER) && defined(KVM_ARCH_WANT_MMU_NOTIFIER)
+#ifdef CONFIG_KVM_GENERIC_MMU_NOTIFIER
 	mmu_notifier_unregister(&kvm->mmu_notifier, kvm->mm);
 	/*
 	 * At this point, pending calls to invalidate_range_start()
-- 
2.41.0.255.g8b1d071c50-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
