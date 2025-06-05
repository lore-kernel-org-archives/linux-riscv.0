Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54680C61CE7
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Jun 2025 06:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mZzQhbYJFMWK5J8OaYn8T6UyQxGXaG+2di3loONxDsc=; b=RSs6pou1PBxh8y
	s2M1GBU9O7z7DDuzKu0NRl9njS4qqEPS0v5Vb74s1xA/N5rF3orXk0H9pywoOSnvXd9ULl4aFXhSR
	3Aos5etUylx2XLeuMj929tsbZayNzcBS/GwVhBORxE2de/l2JwYSpJ4/ptKRrrewIGdUOEo/AKiCz
	PGgnpvNLRbo1Y2t/ex3QjNK8ZWgms4zKCeakJwondf5QiCTQmhm+OSPm94H269fj7lwI5JfTtAB2I
	xDH44rr3xsF6osKfusHV+m6KizbZspX3xafQrwetRm3cEIxi745TqGDpbdGdgPyAiFz8lY/JbXris
	/Ky3bM0NPgRAacQ1zqlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3tB-0000000EpJn-3nX6;
	Thu, 05 Jun 2025 06:15:45 +0000
Received: from mail-pg1-x531.google.com ([2607:f8b0:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN3t7-0000000EpCc-0aJx
	for linux-riscv@lists.infradead.org;
	Thu, 05 Jun 2025 06:15:44 +0000
Received: by mail-pg1-x531.google.com with SMTP id 41be03b00d2f7-b2f11866376so409743a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Jun 2025 23:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1749104140; x=1749708940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/5L0+ykOWiXelXLICAGslkImYlGqzZkgVfyp6ia3O1g=;
        b=MRYuc8DsrNAabXkC40qzMFIHrBWmiPRQlmVus18kMsWUwZWMszgjZ0VCnjjW48XG1s
         7cpBfzJf9yCiS0Tx/UWKFhqMywKqDHMf8xfkisY/iWTEREz9MB6Ig4NeQ342N4TS9AZf
         vsfUTFc1IzSIjE5RpfLSUedkCtQax5oiDRwck8NbqtyD5qzjvTlY4X7C7P/SM/cUSp8h
         1uji7wqtKOr9BnfwucrVw4G3uhmqrrxm6Jit5c6NuUKr8tTYp/GhE2qPEns5AK5RZrgB
         csfivoJyhrwAkcgpAfMQUWY2CZ6iLKWwbXjFea0zHo6F62F9Y7TxwJWDbbu+0SvCT9ZF
         tQ1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749104140; x=1749708940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5L0+ykOWiXelXLICAGslkImYlGqzZkgVfyp6ia3O1g=;
        b=ETBs4d0IaRJ9KRDEifb8CRN5bRVnOS7aBEUHAfgj2bLJ7PR02c71E0YYn2+DR7Onc+
         M9O4uhiXxPDOsBbpmRU4vW63OaOy/HEf1BlSjqaWKqWW93fs3hTmZBSf3l9BBZdpdpHm
         2QqEQYr/bFRWX/a4VkdoK8YYsB6bt3z9ZT5bwNkk6Jrbhdud0E6dNL4eJPfUplQtZePB
         Q9EmOM+0+NlwYA8JmlDXIRuEnmeeC8U8sra9XRd3PepT9cGex8iCn2snvIRx2/vX9KkG
         D/uw4Q22V7kn6JPuWMDcbc23VDYInPFHQaUtjYpfvDZd9XjaYcXlffguAdVTUK0jrCGX
         TkcQ==
X-Forwarded-Encrypted: i=1; AJvYcCWiUu3g2BNAbczarHLv0LuVxleOSTB6Sh1KDyZj4tqtVxP2bgD2/bBQMIMBL7mxmczhqnzHSk6K6ek+hg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzu4/yBDyrkmldux9Gaa3THpR+tSvkDgId0LGAiVAmma8rIr/wo
	J99pJJnE/N4Smm6vp+ss+qDEitEVJpQmAJa+Ugl4gkwP3YeeU51RQiO0jBIs+PXMsuTMjJTpFrv
	1G5gV
X-Gm-Gg: ASbGncs7kwZYptAl8WoCcRcK4iUia3SiicUePwEzmvmhVLZ+Yj2m422r6SdBVsgWqnf
	IQPyBiFVTcYZRNxBL5SMjoVKBgnZvuV4eQMoKQlI3pCH8durm4Mp89weezfjfuHZto3SVopLF9t
	D9wDNaLD5xyDh4gG07OJr4H4z/ne0lFhFuOrMHmSBy8a064J6LFQYSyYuV7twtaamgfUYkjivIw
	KUKqDRoU7KLxofE9X5zbCvedeQUYlmOaIzXVvIIoiBvSnPFvm2/JZMmouSZYEyR6iwH8mLeZeTf
	gVdVdZqsd/WCzdTCnxNsmJfZiGH66G5jy5v1F9xkEafzpMnqfZbmMI6aGnHcYiv/0rGzNtdyUms
	H5fH4Yw==
X-Google-Smtp-Source: AGHT+IGeCP7yjnGqfjqlB4ks6ph12/2Dcv3NbYOPrnzOV1SF+VtBogS3QcmQr2cFbHhenw53773/UA==
X-Received: by 2002:a17:90b:1d51:b0:313:2464:ad20 with SMTP id 98e67ed59e1d1-3132464ad44mr5168665a91.13.1749104140057;
        Wed, 04 Jun 2025 23:15:40 -0700 (PDT)
Received: from localhost.localdomain ([14.141.91.70])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3132c0bedc7sm716026a91.49.2025.06.04.23.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 23:15:39 -0700 (PDT)
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
Subject: [PATCH 09/13] RISC-V: KVM: Factor-out MMU related declarations into separate headers
Date: Thu,  5 Jun 2025 11:44:54 +0530
Message-ID: <20250605061458.196003-10-apatel@ventanamicro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250605061458.196003-1-apatel@ventanamicro.com>
References: <20250605061458.196003-1-apatel@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250604_231541_218150_8382A999 
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
index b9e241c46209..8d7a59274386 100644
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
@@ -55,24 +57,6 @@
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
@@ -98,15 +82,6 @@ struct kvm_vcpu_stat {
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
@@ -307,77 +282,6 @@ static inline bool kvm_arch_pmi_in_guest(struct kvm_vcpu *vcpu)
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
index 834d855b0478..c9d87e7472fb 100644
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
index 684efaf5cee9..bfe4d1369b24 100644
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
index 6e0c18412795..cc82bbab0e24 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -9,6 +9,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/insn-def.h>
+#include <asm/kvm_mmu.h>
 
 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
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
