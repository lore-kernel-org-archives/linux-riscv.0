Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2AFC761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ff8m5kp3gp74Y8J2GkPWgiVCUFTJM6O1As+MFkxhubo=; b=i1FNILVAvCqnDT
	UH8LGHGCatZs6U09OB0g0X/Ay+44yGa/X49h72/wDYnhejH1caeV+UKY9hh6SiJdb2QkbPzxfB1bI
	MRIj3UJfQY3VYqLQzT5FPpdp/UCXhxcE0HseKtedAEq2lp9MzsyuX9+iFaYM9YFv6Vr6dhDfOqkWp
	PW9Wc8SSPABPFScJk+hidwrhQHvseG0EA4Y0d5cqYXa1BRWbh3fz+2uk9b/kEHxpuSgqvbsCTVasS
	QCu8XgrXCAR3sjExthGWp4bpJlMsf563LWbJqEWta1wq2ecHaSgb47hh4tvbxqhhxqt06Xfkr7mLG
	mc3429Frl1/dw9+UVZrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjih9-0021JX-1h;
	Tue, 04 Apr 2023 15:35:39 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjih5-0021HD-2Y
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 15:35:37 +0000
Received: by mail-oi1-x232.google.com with SMTP id bm2so24520149oib.4
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 08:35:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1680622534; x=1683214534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGqXgeLBfRULoc6Z9dXAtLsyGFp5MekVqLdi5gc3SgU=;
        b=jI42tPQLeUmZlwK6PsLhRfaSzTriB9N+nf55oNLD697PTgXR77FeLARXuX9SN7kdrU
         nQYtkgAUGmRUX9COqm1ktt+HdcAcpQlgVX9Ku0gO9pCnx2KQfWuDI4L+7UTnQaJCfiSt
         cy9ebwS82z9ZCafWmoKu571GCF1Sy3xM0ow0gqUubIve8/iM7MX08ChGJS+5m8sTS82u
         7D9Bor70TptTJ5fY68I4/b7W2Es9i8jbFxyu/1mkW1J5MPqCOTzS+kF47pfKtiMHJsSY
         LoSCjdVajG1SEYK/W5pCAqzM6/u9YBTJbF0sMQUnmSaDiJ/mWCQVwirVcy30Fsv7E2+S
         cx8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680622534; x=1683214534;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGqXgeLBfRULoc6Z9dXAtLsyGFp5MekVqLdi5gc3SgU=;
        b=NRknGqKjImQBcpYKrE+UvUWWRq0z//jQIsbdog0ro5TwsiY+4Jq2yoL9qYagZuV9w/
         lMwRgW1lHnLqicSL2d3YZAg1bWSqIDhqQXidabDqvffx0BaztIQsiaHbX6cl95V+zvlp
         B4khwxg6mn67lGdGNpWioCU0KcGwbekeGM5YQ7BfOr3dj86U3r9vkmI2xCnlIzin5R96
         yGOemr9q8UuC0H3rzmXotDIqCBGondKz53zUSvyrZkTiuzY9/eQCK8EXmbfTLxQgtxnT
         P4Mz/4t0CW8lcvetvR7fR0EdwcUQ70J2c/aXHYRDVLSXo8ClLwBg5bBdO7893jKRFvD1
         YC7A==
X-Gm-Message-State: AAQBX9f0juHU9l7zienbqaYUB0Fu8NJkmnV/g1UrZ188JdGcLpSUk3aM
	D2q4mu2GMKXDxaGPMlt3fYiqrA==
X-Google-Smtp-Source: AKy350YvJSZXA10zkuRwQm02Icu8XPEUX1t9l/vHGGxYzHqcesxtcTOj8IR+6d8gBkb9dBfJMqSzjQ==
X-Received: by 2002:a54:488a:0:b0:387:210a:6f47 with SMTP id r10-20020a54488a000000b00387210a6f47mr1703552oic.21.1680622534124;
        Tue, 04 Apr 2023 08:35:34 -0700 (PDT)
Received: from anup-ubuntu-vm.localdomain ([103.97.165.210])
        by smtp.gmail.com with ESMTPSA id w124-20020acadf82000000b00387384dc768sm5325803oig.9.2023.04.04.08.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Apr 2023 08:35:33 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Atish Patra <atishp@atishpatra.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>
Subject: [PATCH v4 4/9] RISC-V: KVM: Initial skeletal support for AIA
Date: Tue,  4 Apr 2023 21:04:47 +0530
Message-Id: <20230404153452.2405681-5-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230404153452.2405681-1-apatel@ventanamicro.com>
References: <20230404153452.2405681-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_083535_852909_2DD01639 
X-CRM114-Status: GOOD (  25.61  )
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

To incrementally implement AIA support, we first add minimal skeletal
support which only compiles and detects AIA hardware support at the
boot-time but does not provide any functionality.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
Reviewed-by: Atish Patra <atishp@rivosinc.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/hwcap.h    |   6 ++
 arch/riscv/include/asm/kvm_aia.h  | 109 ++++++++++++++++++++++++++++++
 arch/riscv/include/asm/kvm_host.h |   7 ++
 arch/riscv/kvm/Makefile           |   1 +
 arch/riscv/kvm/aia.c              |  66 ++++++++++++++++++
 arch/riscv/kvm/main.c             |  22 +++++-
 arch/riscv/kvm/vcpu.c             |  45 ++++++++++--
 arch/riscv/kvm/vcpu_insn.c        |   1 +
 arch/riscv/kvm/vm.c               |   4 ++
 9 files changed, 255 insertions(+), 6 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_aia.h
 create mode 100644 arch/riscv/kvm/aia.c

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 74f5dab2148f..ab2abf561520 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -48,6 +48,12 @@
 #define RISCV_ISA_EXT_MAX		64
 #define RISCV_ISA_EXT_NAME_LEN_MAX	32
 
+#ifdef CONFIG_RISCV_M_MODE
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SMAIA
+#else
+#define RISCV_ISA_EXT_SxAIA		RISCV_ISA_EXT_SSAIA
+#endif
+
 #ifndef __ASSEMBLY__
 
 #include <linux/jump_label.h>
diff --git a/arch/riscv/include/asm/kvm_aia.h b/arch/riscv/include/asm/kvm_aia.h
new file mode 100644
index 000000000000..258a835d4c32
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_aia.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *	Anup Patel <apatel@ventanamicro.com>
+ */
+
+#ifndef __KVM_RISCV_AIA_H
+#define __KVM_RISCV_AIA_H
+
+#include <linux/jump_label.h>
+#include <linux/kvm_types.h>
+
+struct kvm_aia {
+	/* In-kernel irqchip created */
+	bool		in_kernel;
+
+	/* In-kernel irqchip initialized */
+	bool		initialized;
+};
+
+struct kvm_vcpu_aia {
+};
+
+#define kvm_riscv_aia_initialized(k)	((k)->arch.aia.initialized)
+
+#define irqchip_in_kernel(k)		((k)->arch.aia.in_kernel)
+
+DECLARE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
+#define kvm_riscv_aia_available() \
+	static_branch_unlikely(&kvm_riscv_aia_available)
+
+static inline void kvm_riscv_vcpu_aia_flush_interrupts(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_aia_sync_interrupts(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline bool kvm_riscv_vcpu_aia_has_interrupts(struct kvm_vcpu *vcpu,
+						     u64 mask)
+{
+	return false;
+}
+
+static inline void kvm_riscv_vcpu_aia_update_hvip(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_aia_load(struct kvm_vcpu *vcpu, int cpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_aia_put(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline int kvm_riscv_vcpu_aia_get_csr(struct kvm_vcpu *vcpu,
+					     unsigned long reg_num,
+					     unsigned long *out_val)
+{
+	*out_val = 0;
+	return 0;
+}
+
+static inline int kvm_riscv_vcpu_aia_set_csr(struct kvm_vcpu *vcpu,
+					     unsigned long reg_num,
+					     unsigned long val)
+{
+	return 0;
+}
+
+#define KVM_RISCV_VCPU_AIA_CSR_FUNCS
+
+static inline int kvm_riscv_vcpu_aia_update(struct kvm_vcpu *vcpu)
+{
+	return 1;
+}
+
+static inline void kvm_riscv_vcpu_aia_reset(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline int kvm_riscv_vcpu_aia_init(struct kvm_vcpu *vcpu)
+{
+	return 0;
+}
+
+static inline void kvm_riscv_vcpu_aia_deinit(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_aia_init_vm(struct kvm *kvm)
+{
+}
+
+static inline void kvm_riscv_aia_destroy_vm(struct kvm *kvm)
+{
+}
+
+void kvm_riscv_aia_enable(void);
+void kvm_riscv_aia_disable(void);
+int kvm_riscv_aia_init(void);
+void kvm_riscv_aia_exit(void);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cc7da66ee0c0..3157cf748df1 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/kvm_types.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/kvm_aia.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -94,6 +95,9 @@ struct kvm_arch {
 
 	/* Guest Timer */
 	struct kvm_guest_timer timer;
+
+	/* AIA Guest/VM context */
+	struct kvm_aia aia;
 };
 
 struct kvm_cpu_trap {
@@ -221,6 +225,9 @@ struct kvm_vcpu_arch {
 	/* SBI context */
 	struct kvm_vcpu_sbi_context sbi_context;
 
+	/* AIA VCPU context */
+	struct kvm_vcpu_aia aia_context;
+
 	/* Cache pages needed to program page tables with spinlock held */
 	struct kvm_mmu_memory_cache mmu_page_cache;
 
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 278e97c06e0a..8031b8912a0d 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -26,3 +26,4 @@ kvm-y += vcpu_sbi_replace.o
 kvm-y += vcpu_sbi_hsm.o
 kvm-y += vcpu_timer.o
 kvm-$(CONFIG_RISCV_PMU_SBI) += vcpu_pmu.o vcpu_sbi_pmu.o
+kvm-y += aia.o
diff --git a/arch/riscv/kvm/aia.c b/arch/riscv/kvm/aia.c
new file mode 100644
index 000000000000..7a633331cd3e
--- /dev/null
+++ b/arch/riscv/kvm/aia.c
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 Ventana Micro Systems Inc.
+ *
+ * Authors:
+ *	Anup Patel <apatel@ventanamicro.com>
+ */
+
+#include <linux/kvm_host.h>
+#include <asm/hwcap.h>
+
+DEFINE_STATIC_KEY_FALSE(kvm_riscv_aia_available);
+
+static void aia_set_hvictl(bool ext_irq_pending)
+{
+	unsigned long hvictl;
+
+	/*
+	 * HVICTL.IID == 9 and HVICTL.IPRIO == 0 represents
+	 * no interrupt in HVICTL.
+	 */
+
+	hvictl = (IRQ_S_EXT << HVICTL_IID_SHIFT) & HVICTL_IID;
+	hvictl |= ext_irq_pending;
+	csr_write(CSR_HVICTL, hvictl);
+}
+
+void kvm_riscv_aia_enable(void)
+{
+	if (!kvm_riscv_aia_available())
+		return;
+
+	aia_set_hvictl(false);
+	csr_write(CSR_HVIPRIO1, 0x0);
+	csr_write(CSR_HVIPRIO2, 0x0);
+#ifdef CONFIG_32BIT
+	csr_write(CSR_HVIPH, 0x0);
+	csr_write(CSR_HIDELEGH, 0x0);
+	csr_write(CSR_HVIPRIO1H, 0x0);
+	csr_write(CSR_HVIPRIO2H, 0x0);
+#endif
+}
+
+void kvm_riscv_aia_disable(void)
+{
+	if (!kvm_riscv_aia_available())
+		return;
+
+	aia_set_hvictl(false);
+}
+
+int kvm_riscv_aia_init(void)
+{
+	if (!riscv_isa_extension_available(NULL, SxAIA))
+		return -ENODEV;
+
+	/* Enable KVM AIA support */
+	static_branch_enable(&kvm_riscv_aia_available);
+
+	return 0;
+}
+
+void kvm_riscv_aia_exit(void)
+{
+}
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 41ad7639a17b..6396352b4e4d 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -44,11 +44,15 @@ int kvm_arch_hardware_enable(void)
 
 	csr_write(CSR_HVIP, 0);
 
+	kvm_riscv_aia_enable();
+
 	return 0;
 }
 
 void kvm_arch_hardware_disable(void)
 {
+	kvm_riscv_aia_disable();
+
 	/*
 	 * After clearing the hideleg CSR, the host kernel will receive
 	 * spurious interrupts if hvip CSR has pending interrupts and the
@@ -63,6 +67,7 @@ void kvm_arch_hardware_disable(void)
 
 static int __init riscv_kvm_init(void)
 {
+	int rc;
 	const char *str;
 
 	if (!riscv_isa_extension_available(NULL, h)) {
@@ -84,6 +89,10 @@ static int __init riscv_kvm_init(void)
 
 	kvm_riscv_gstage_vmid_detect();
 
+	rc = kvm_riscv_aia_init();
+	if (rc && rc != -ENODEV)
+		return rc;
+
 	kvm_info("hypervisor extension available\n");
 
 	switch (kvm_riscv_gstage_mode()) {
@@ -106,12 +115,23 @@ static int __init riscv_kvm_init(void)
 
 	kvm_info("VMID %ld bits available\n", kvm_riscv_gstage_vmid_bits());
 
-	return kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (kvm_riscv_aia_available())
+		kvm_info("AIA available\n");
+
+	rc = kvm_init(sizeof(struct kvm_vcpu), 0, THIS_MODULE);
+	if (rc) {
+		kvm_riscv_aia_exit();
+		return rc;
+	}
+
+	return 0;
 }
 module_init(riscv_kvm_init);
 
 static void __exit riscv_kvm_exit(void)
 {
+	kvm_riscv_aia_exit();
+
 	kvm_exit();
 }
 module_exit(riscv_kvm_exit);
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 02b49cb94561..b46e9cc92938 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -137,6 +137,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_timer_reset(vcpu);
 
+	kvm_riscv_vcpu_aia_reset(vcpu);
+
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
 	WRITE_ONCE(vcpu->arch.irqs_pending_mask, 0);
 
@@ -159,6 +161,7 @@ int kvm_arch_vcpu_precreate(struct kvm *kvm, unsigned int id)
 
 int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 {
+	int rc;
 	struct kvm_cpu_context *cntx;
 	struct kvm_vcpu_csr *reset_csr = &vcpu->arch.guest_reset_csr;
 	unsigned long host_isa, i;
@@ -201,6 +204,11 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	/* setup performance monitoring */
 	kvm_riscv_vcpu_pmu_init(vcpu);
 
+	/* Setup VCPU AIA */
+	rc = kvm_riscv_vcpu_aia_init(vcpu);
+	if (rc)
+		return rc;
+
 	/* Reset VCPU */
 	kvm_riscv_reset_vcpu(vcpu);
 
@@ -220,6 +228,9 @@ void kvm_arch_vcpu_postcreate(struct kvm_vcpu *vcpu)
 
 void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 {
+	/* Cleanup VCPU AIA context */
+	kvm_riscv_vcpu_aia_deinit(vcpu);
+
 	/* Cleanup VCPU timer */
 	kvm_riscv_vcpu_timer_deinit(vcpu);
 
@@ -741,6 +752,9 @@ void kvm_riscv_vcpu_flush_interrupts(struct kvm_vcpu *vcpu)
 		csr->hvip &= ~mask;
 		csr->hvip |= val;
 	}
+
+	/* Flush AIA high interrupts */
+	kvm_riscv_vcpu_aia_flush_interrupts(vcpu);
 }
 
 void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
@@ -766,6 +780,9 @@ void kvm_riscv_vcpu_sync_interrupts(struct kvm_vcpu *vcpu)
 		}
 	}
 
+	/* Sync-up AIA high interrupts */
+	kvm_riscv_vcpu_aia_sync_interrupts(vcpu);
+
 	/* Sync-up timer CSRs */
 	kvm_riscv_vcpu_timer_sync(vcpu);
 }
@@ -802,10 +819,15 @@ int kvm_riscv_vcpu_unset_interrupt(struct kvm_vcpu *vcpu, unsigned int irq)
 
 bool kvm_riscv_vcpu_has_interrupts(struct kvm_vcpu *vcpu, unsigned long mask)
 {
-	unsigned long ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
-			    << VSIP_TO_HVIP_SHIFT) & mask;
+	unsigned long ie;
+
+	ie = ((vcpu->arch.guest_csr.vsie & VSIP_VALID_MASK)
+		<< VSIP_TO_HVIP_SHIFT) & mask;
+	if (READ_ONCE(vcpu->arch.irqs_pending) & ie)
+		return true;
 
-	return (READ_ONCE(vcpu->arch.irqs_pending) & ie) ? true : false;
+	/* Check AIA high interrupts */
+	return kvm_riscv_vcpu_aia_has_interrupts(vcpu, mask);
 }
 
 void kvm_riscv_vcpu_power_off(struct kvm_vcpu *vcpu)
@@ -901,6 +923,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
 
+	kvm_riscv_vcpu_aia_load(vcpu, cpu);
+
 	vcpu->cpu = cpu;
 }
 
@@ -910,6 +934,8 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 
 	vcpu->cpu = -1;
 
+	kvm_riscv_vcpu_aia_put(vcpu);
+
 	kvm_riscv_vcpu_guest_fp_save(&vcpu->arch.guest_context,
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
@@ -977,6 +1003,7 @@ static void kvm_riscv_update_hvip(struct kvm_vcpu *vcpu)
 	struct kvm_vcpu_csr *csr = &vcpu->arch.guest_csr;
 
 	csr_write(CSR_HVIP, csr->hvip);
+	kvm_riscv_vcpu_aia_update_hvip(vcpu);
 }
 
 /*
@@ -1049,6 +1076,15 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 
 		kvm_riscv_check_vcpu_requests(vcpu);
 
+		preempt_disable();
+
+		/* Update AIA HW state before entering guest */
+		ret = kvm_riscv_vcpu_aia_update(vcpu);
+		if (ret <= 0) {
+			preempt_enable();
+			continue;
+		}
+
 		local_irq_disable();
 
 		/*
@@ -1077,6 +1113,7 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		    xfer_to_guest_mode_work_pending()) {
 			vcpu->mode = OUTSIDE_GUEST_MODE;
 			local_irq_enable();
+			preempt_enable();
 			kvm_vcpu_srcu_read_lock(vcpu);
 			continue;
 		}
@@ -1110,8 +1147,6 @@ int kvm_arch_vcpu_ioctl_run(struct kvm_vcpu *vcpu)
 		/* Syncup interrupts state with HW */
 		kvm_riscv_vcpu_sync_interrupts(vcpu);
 
-		preempt_disable();
-
 		/*
 		 * We must ensure that any pending interrupts are taken before
 		 * we exit guest timing so that timer ticks are accounted as
diff --git a/arch/riscv/kvm/vcpu_insn.c b/arch/riscv/kvm/vcpu_insn.c
index f689337b78ff..7a6abed41bc1 100644
--- a/arch/riscv/kvm/vcpu_insn.c
+++ b/arch/riscv/kvm/vcpu_insn.c
@@ -214,6 +214,7 @@ struct csr_func {
 };
 
 static const struct csr_func csr_funcs[] = {
+	KVM_RISCV_VCPU_AIA_CSR_FUNCS
 	KVM_RISCV_VCPU_HPMCOUNTER_CSR_FUNCS
 };
 
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index 65a964d7e70d..bc03d2ddcb51 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -41,6 +41,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 		return r;
 	}
 
+	kvm_riscv_aia_init_vm(kvm);
+
 	kvm_riscv_guest_timer_init(kvm);
 
 	return 0;
@@ -49,6 +51,8 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
 void kvm_arch_destroy_vm(struct kvm *kvm)
 {
 	kvm_destroy_vcpus(kvm);
+
+	kvm_riscv_aia_destroy_vm(kvm);
 }
 
 int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
