Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BEAC71135
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Jun 2025 06:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5Ibi3qAdBSt7pJ6ZSkjK4FYQVHBxmHG+dwCPNtk3M4=; b=m5heLIcqh+/17f
	MiosJR27f6A9u/MvIiQi9BUKaXQGNbn5BQ7izv/gity12+2ZoCbkKw0B+JY9ScC9TeWobsKaafSbD
	3JPl4st3PRbDD5GvUlnEZHg0g0kUetS7WbQX/Rgtuxtn4eII8PeI3+e0t7usQf0T2jnO8agyi540S
	4PevD529EVa/eh8uNohrCPeGlZPvH6edzNw8RdOzosduaSErjxI3Mfmi7vktR74bSuLqZKv/egtla
	Vu2R/dMroxSOSWgHK1zoptliFL72Fde8oTO7I+s1Po+L/pFt8tl99Y2R4joyuRYivSGTSUI/9bRkf
	29YDS1wJU89yoleboXmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN3-0000000FXht-4ANl;
	Fri, 13 Jun 2025 06:58:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN2-0000000FXfk-0tYZ
	for linux-riscv@bombadil.infradead.org;
	Fri, 13 Jun 2025 06:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=QJDMunx77DiWvLiT8iabo538wHDqwftJ+lPwnBfNsX4=; b=Igd9aOMaQ0ZNkcXIR0nHUs//tb
	mmHpnt5PzdhBw67bVRqLskvwFFtE//o8An63+eaNOx5ResIB+52Zl3xGMGMCaMNtsa0VnqRyY5epp
	IgpXWfXgIyEGGBfV9FeMoHI71GyHjkYIlkP+iNIPNyopvgb1dyCyc4llzTqdS4Xc15F/Cb/E4DLSx
	Mqi/FJZApbd6NIRU2FW2Hmz9JAKfjiQ0Qs/lZ52TQiBssFtWPz0NZIpfzs4VcOp8R19ktriZYO+Z/
	QTyDNIfnxP8j5vcdeodNr0f2T/DGQPH7m1xiAIbD3gJLEcA2yV8CdmH55VMPPQoKingW/xwYIU5qF
	dGH+h8XQ==;
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPyN0-00000002rwz-1Gxi
	for linux-riscv@lists.infradead.org;
	Fri, 13 Jun 2025 06:58:36 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-22c33677183so15677405ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 12 Jun 2025 23:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749797911; x=1750402711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QJDMunx77DiWvLiT8iabo538wHDqwftJ+lPwnBfNsX4=;
        b=gMROWcL1xG8CJ4sTOyFCA571Hy+cZpnxzAO+NRW+GzD0OMlTZqgMYTIw3nN1iJHAN0
         uBM/xD8tNyIe+5yc6Ko+EQ0oDAjZNLrCtwFz+6SXeSoUtWJU2wmqLHnKrrDznV9bTuDy
         j4XvX973BMi/ZnCtbF4j9jxh11CRhjHDDVd0X025AmnTFpt59ujgtHhvNOOnmgUF4mHO
         ixN9oo7oznz9luYfSspHDkrScxwHKpns86tGDYCkXsIGMXmRvPxmCxQjDpMbhSLFwXB+
         a7Kvu5SlmtuJclxWEjtFzXQHbaFu25kGNk/EDWP+XjXPa3JjgZ2BWTJ3vA/Jv463dxcS
         8V+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749797911; x=1750402711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QJDMunx77DiWvLiT8iabo538wHDqwftJ+lPwnBfNsX4=;
        b=M4IHrBYzcu99KrjkyB93xgRha8r+ofAwAI0g5XvGWnAhb8QMw5x5NA31nhB3KdAO16
         LM2ulBvVyc4xXPadww+ai2c6pIxh5N/a8RbVM09Qtw2rqTv6nOrCWBMPRMOJSyJ0uCdL
         alRTj0F23GL0ckfGUGnOyXrzntuXQb3p52VeqwFVlqDyOVH5SoWI6h4H6KU6FKGLfKcR
         qBEtAmsHMdJy2N4G0ELF7b2VSjwHYoW1z9A1/vkO1rMJKtZJPwOpsqb2bNbkm9LZc4mz
         /f3po6qzRCc0YzmhI57D1zYylgE7utxgZuBQa5GDsAQl6sqdyOCKJkuKuYDGQlpFE1FM
         fawg==
X-Forwarded-Encrypted: i=1; AJvYcCVip91M5PZjqt0236noVIxMhxR1xWmpf2n8SARzJcAnMe4V/Elt1pS2sjZa3POH2SKYIsHxD2dbunQIYA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxhPErmeLTsBGzjsLQXHuYpF6EUyxSvhPNeW9mGLbQsmY1tBqlb
	hn/hBl2AgM+Mv6KfHfKeFXeiWo6cOQHTrNnM/8WN49HJFAufJvPz9yu3xYMRTysmO2s=
X-Gm-Gg: ASbGncsHbAaqgMgUzdmIFIBMiNjyVeuZJ8oTdQthUUmWa/mWb9xc5rLQtHBz4D4d5NR
	4MJGnXg1yNfzRJqI4v+javLPqO6YHdtliWROuwFqECLf5aA0crK2D7eMR0pL1FtS6pcag0//GnP
	8xUAZIHWsH93yaIW0Sby+IWnYEFTwfSbkhae8TdVaKGzxsOBKNh72vGsENEGmiC8BOrejxxx4jq
	io+NEXX1aDL2aQbgUBrPkgfhlLlxxvC5UjpSl7GzHKpY107E9g7uWMcWcJkogmewz5UU8fRSMv/
	ZroJYUn7vuBYnSGE/i1Oi7zAy03m3GBAI8pSr8f9B2jYf5zQED2imyz+O2gH+OaN7H4OGzOGRNO
	73AX644ARwS6hRC3JhlY=
X-Google-Smtp-Source: AGHT+IG/AKFRhvSUib4IO3DiL2Z6cy22qs6RStWYGT7HQao1EiZfTJukYmGap593VUz8G1KvozvSZQ==
X-Received: by 2002:a17:903:19d0:b0:234:f15b:f158 with SMTP id d9443c01a7336-2365d8a167dmr27764385ad.13.1749797911264;
        Thu, 12 Jun 2025 23:58:31 -0700 (PDT)
Received: from localhost.localdomain ([103.97.166.196])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313c1b49b7fsm2653022a91.24.2025.06.12.23.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 23:58:30 -0700 (PDT)
From: Anup Patel <apatel@ventanamicro.com>
To: Atish Patra <atish.patra@linux.dev>
Cc: Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH v2 08/12] RISC-V: KVM: Factor-out MMU related declarations into separate headers
Date: Fri, 13 Jun 2025 12:27:39 +0530
Message-ID: <20250613065743.737102-9-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250613065743.737102-1-apatel@ventanamicro.com>
References: <20250613065743.737102-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250613_075834_499187_6BE29651 
X-CRM114-Status: GOOD (  16.89  )
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

The MMU, TLB, and VMID management for KVM RISC-V already exists as
seprate sources so create separate headers along these lines. This
further simplifies asm/kvm_host.h header.

Signed-off-by: Anup Patel <apatel@ventanamicro.com>
---
 arch/riscv/include/asm/kvm_host.h | 100 +-----------------------------
 arch/riscv/include/asm/kvm_mmu.h  |  26 ++++++++
 arch/riscv/include/asm/kvm_tlb.h  |  78 +++++++++++++++++++++++
 arch/riscv/include/asm/kvm_vmid.h |  27 ++++++++
 arch/riscv/kvm/aia_imsic.c        |   1 +
 arch/riscv/kvm/main.c             |   1 +
 arch/riscv/kvm/mmu.c              |   1 +
 arch/riscv/kvm/tlb.c              |   2 +
 arch/riscv/kvm/vcpu.c             |   1 +
 arch/riscv/kvm/vcpu_exit.c        |   1 +
 arch/riscv/kvm/vm.c               |   1 +
 arch/riscv/kvm/vmid.c             |   2 +
 12 files changed, 143 insertions(+), 98 deletions(-)
 create mode 100644 arch/riscv/include/asm/kvm_mmu.h
 create mode 100644 arch/riscv/include/asm/kvm_tlb.h
 create mode 100644 arch/riscv/include/asm/kvm_vmid.h

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 6162575e2177..bd5341efa127 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -16,6 +16,8 @@
 #include <asm/hwcap.h>
 #include <asm/kvm_aia.h>
 #include <asm/ptrace.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -56,24 +58,6 @@
 					 BIT(IRQ_VS_TIMER) | \
 					 BIT(IRQ_VS_EXT))
 
-enum kvm_riscv_hfence_type {
-	KVM_RISCV_HFENCE_UNKNOWN = 0,
-	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
-	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
-	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
-	KVM_RISCV_HFENCE_VVMA_GVA,
-};
-
-struct kvm_riscv_hfence {
-	enum kvm_riscv_hfence_type type;
-	unsigned long asid;
-	unsigned long order;
-	gpa_t addr;
-	gpa_t size;
-};
-
-#define KVM_RISCV_VCPU_MAX_HFENCE	64
-
 struct kvm_vm_stat {
 	struct kvm_vm_stat_generic generic;
 };
@@ -99,15 +83,6 @@ struct kvm_vcpu_stat {
 struct kvm_arch_memory_slot {
 };
 
-struct kvm_vmid {
-	/*
-	 * Writes to vmid_version and vmid happen with vmid_lock held
-	 * whereas reads happen without any lock held.
-	 */
-	unsigned long vmid_version;
-	unsigned long vmid;
-};
-
 struct kvm_arch {
 	/* G-stage vmid */
 	struct kvm_vmid vmid;
@@ -311,77 +286,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
 	return IS_ENABLED(CONFIG_GUEST_PERF_EVENTS) && !!vcpu;
 }
 
-#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
-
-void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
-					  gpa_t gpa, gpa_t gpsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
-void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_gvma_all(void);
-void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
-					  unsigned long asid,
-					  unsigned long gva,
-					  unsigned long gvsz,
-					  unsigned long order);
-void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
-					  unsigned long asid);
-void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
-				     unsigned long gva, unsigned long gvsz,
-				     unsigned long order);
-void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
-
-void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
-void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
-
-void kvm_riscv_fence_i(struct kvm *kvm,
-		       unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    gpa_t gpa, gpa_t gpsz,
-				    unsigned long order);
-void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask);
-void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long gva, unsigned long gvsz,
-				    unsigned long order, unsigned long asid);
-void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
-				    unsigned long hbase, unsigned long hmask,
-				    unsigned long asid);
-void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask,
-			       unsigned long gva, unsigned long gvsz,
-			       unsigned long order);
-void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
-			       unsigned long hbase, unsigned long hmask);
-
-int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
-			     phys_addr_t hpa, unsigned long size,
-			     bool writable, bool in_atomic);
-void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
-			      unsigned long size);
-int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
-			 struct kvm_memory_slot *memslot,
-			 gpa_t gpa, unsigned long hva, bool is_write);
-int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
-void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
-void __init kvm_riscv_gstage_mode_detect(void);
-unsigned long __init kvm_riscv_gstage_mode(void);
-int kvm_riscv_gstage_gpa_bits(void);
-
-void __init kvm_riscv_gstage_vmid_detect(void);
-unsigned long kvm_riscv_gstage_vmid_bits(void);
-int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
-bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
-void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
-void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
-
 int kvm_riscv_setup_default_irq_routing(struct kvm *kvm, u32 lines);
 
 void __kvm_riscv_unpriv_trap(void);
diff --git a/arch/riscv/include/asm/kvm_mmu.h b/arch/riscv/include/asm/kvm_mmu.h
new file mode 100644
index 000000000000..4e1654282ee4
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_mmu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_MMU_H_
+#define __RISCV_KVM_MMU_H_
+
+#include <linux/kvm_types.h>
+
+int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
+			     phys_addr_t hpa, unsigned long size,
+			     bool writable, bool in_atomic);
+void kvm_riscv_gstage_iounmap(struct kvm *kvm, gpa_t gpa,
+			      unsigned long size);
+int kvm_riscv_gstage_map(struct kvm_vcpu *vcpu,
+			 struct kvm_memory_slot *memslot,
+			 gpa_t gpa, unsigned long hva, bool is_write);
+int kvm_riscv_gstage_alloc_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_free_pgd(struct kvm *kvm);
+void kvm_riscv_gstage_update_hgatp(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_mode_detect(void);
+unsigned long kvm_riscv_gstage_mode(void);
+int kvm_riscv_gstage_gpa_bits(void);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_tlb.h b/arch/riscv/include/asm/kvm_tlb.h
new file mode 100644
index 000000000000..cd00c9a46cb1
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_tlb.h
@@ -0,0 +1,78 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_TLB_H_
+#define __RISCV_KVM_TLB_H_
+
+#include <linux/kvm_types.h>
+
+enum kvm_riscv_hfence_type {
+	KVM_RISCV_HFENCE_UNKNOWN = 0,
+	KVM_RISCV_HFENCE_GVMA_VMID_GPA,
+	KVM_RISCV_HFENCE_VVMA_ASID_GVA,
+	KVM_RISCV_HFENCE_VVMA_ASID_ALL,
+	KVM_RISCV_HFENCE_VVMA_GVA,
+};
+
+struct kvm_riscv_hfence {
+	enum kvm_riscv_hfence_type type;
+	unsigned long asid;
+	unsigned long order;
+	gpa_t addr;
+	gpa_t size;
+};
+
+#define KVM_RISCV_VCPU_MAX_HFENCE	64
+
+#define KVM_RISCV_GSTAGE_TLB_MIN_ORDER		12
+
+void kvm_riscv_local_hfence_gvma_vmid_gpa(unsigned long vmid,
+					  gpa_t gpa, gpa_t gpsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_gvma_vmid_all(unsigned long vmid);
+void kvm_riscv_local_hfence_gvma_gpa(gpa_t gpa, gpa_t gpsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_gvma_all(void);
+void kvm_riscv_local_hfence_vvma_asid_gva(unsigned long vmid,
+					  unsigned long asid,
+					  unsigned long gva,
+					  unsigned long gvsz,
+					  unsigned long order);
+void kvm_riscv_local_hfence_vvma_asid_all(unsigned long vmid,
+					  unsigned long asid);
+void kvm_riscv_local_hfence_vvma_gva(unsigned long vmid,
+				     unsigned long gva, unsigned long gvsz,
+				     unsigned long order);
+void kvm_riscv_local_hfence_vvma_all(unsigned long vmid);
+
+void kvm_riscv_tlb_flush_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_vvma_all_process(struct kvm_vcpu *vcpu);
+void kvm_riscv_hfence_process(struct kvm_vcpu *vcpu);
+
+void kvm_riscv_fence_i(struct kvm *kvm,
+		       unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_gvma_vmid_gpa(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    gpa_t gpa, gpa_t gpsz,
+				    unsigned long order);
+void kvm_riscv_hfence_gvma_vmid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask);
+void kvm_riscv_hfence_vvma_asid_gva(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long gva, unsigned long gvsz,
+				    unsigned long order, unsigned long asid);
+void kvm_riscv_hfence_vvma_asid_all(struct kvm *kvm,
+				    unsigned long hbase, unsigned long hmask,
+				    unsigned long asid);
+void kvm_riscv_hfence_vvma_gva(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask,
+			       unsigned long gva, unsigned long gvsz,
+			       unsigned long order);
+void kvm_riscv_hfence_vvma_all(struct kvm *kvm,
+			       unsigned long hbase, unsigned long hmask);
+
+#endif
diff --git a/arch/riscv/include/asm/kvm_vmid.h b/arch/riscv/include/asm/kvm_vmid.h
new file mode 100644
index 000000000000..ab98e1434fb7
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vmid.h
@@ -0,0 +1,27 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2025 Ventana Micro Systems Inc.
+ */
+
+#ifndef __RISCV_KVM_VMID_H_
+#define __RISCV_KVM_VMID_H_
+
+#include <linux/kvm_types.h>
+
+struct kvm_vmid {
+	/*
+	 * Writes to vmid_version and vmid happen with vmid_lock held
+	 * whereas reads happen without any lock held.
+	 */
+	unsigned long vmid_version;
+	unsigned long vmid;
+};
+
+void __init kvm_riscv_gstage_vmid_detect(void);
+unsigned long kvm_riscv_gstage_vmid_bits(void);
+int kvm_riscv_gstage_vmid_init(struct kvm *kvm);
+bool kvm_riscv_gstage_vmid_ver_changed(struct kvm_vmid *vmid);
+void kvm_riscv_gstage_vmid_update(struct kvm_vcpu *vcpu);
+void kvm_riscv_gstage_vmid_sanitize(struct kvm_vcpu *vcpu);
+
+#endif
diff --git a/arch/riscv/kvm/aia_imsic.c b/arch/riscv/kvm/aia_imsic.c
index 29ef9c2133a9..40b469c0a01f 100644
--- a/arch/riscv/kvm/aia_imsic.c
+++ b/arch/riscv/kvm/aia_imsic.c
@@ -16,6 +16,7 @@
 #include <linux/swab.h>
 #include <kvm/iodev.h>
 #include <asm/csr.h>
+#include <asm/kvm_mmu.h>
 
 #define IMSIC_MAX_EIX	(IMSIC_MAX_ID / BITS_PER_TYPE(u64))
 
diff --git a/arch/riscv/kvm/main.c b/arch/riscv/kvm/main.c
index 4b24705dc63a..b861a5dd7bd9 100644
--- a/arch/riscv/kvm/main.c
+++ b/arch/riscv/kvm/main.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/kvm_host.h>
 #include <asm/cpufeature.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/sbi.h>
 
diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index a5387927a1c1..c1a3eb076df3 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -15,6 +15,7 @@
 #include <linux/vmalloc.h>
 #include <linux/kvm_host.h>
 #include <linux/sched/signal.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/page.h>
 #include <asm/pgtable.h>
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index f46a27658c2e..6fc4361c3d75 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -15,6 +15,8 @@
 #include <asm/cpufeature.h>
 #include <asm/insn-def.h>
 #include <asm/kvm_nacl.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
 
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index 6eb11c913b13..8ad7b31f5939 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -18,6 +18,7 @@
 #include <linux/fs.h>
 #include <linux/kvm_host.h>
 #include <asm/cacheflush.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 #include <asm/kvm_vcpu_vector.h>
 
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 85c43c83e3b9..965df528de90 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
diff --git a/arch/riscv/kvm/vm.c b/arch/riscv/kvm/vm.c
index b27ec8f96697..8601cf29e5f8 100644
--- a/arch/riscv/kvm/vm.c
+++ b/arch/riscv/kvm/vm.c
@@ -11,6 +11,7 @@
 #include <linux/module.h>
 #include <linux/uaccess.h>
 #include <linux/kvm_host.h>
+#include <asm/kvm_mmu.h>
 
 const struct _kvm_stats_desc kvm_vm_stats_desc[] = {
 	KVM_GENERIC_VM_STATS()
diff --git a/arch/riscv/kvm/vmid.c b/arch/riscv/kvm/vmid.c
index 92c01255f86f..3b426c800480 100644
--- a/arch/riscv/kvm/vmid.c
+++ b/arch/riscv/kvm/vmid.c
@@ -14,6 +14,8 @@
 #include <linux/smp.h>
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
+#include <asm/kvm_tlb.h>
+#include <asm/kvm_vmid.h>
 
 static unsigned long vmid_version = 1;
 static unsigned long vmid_next;
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
