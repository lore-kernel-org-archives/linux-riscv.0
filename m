Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47A6DC54EAA
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Jan 2023 15:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hmFSa3gf1aAt9/dzxdlT+Ma9NOiO/vDXYN/wbBCiVWo=; b=BZZquPOo+xgKW0
	SqV7GetrI4p/ecCCFGcKDVinua8zhMKbt7ncAVWnvaBFGeahNmH9+pR0N9qVCb6RXEpFwlUaL+ATT
	0lTP9jet16t3l6Yl+9tnZLlBuA8KdHukml5cNd2Mxft+RMQBNZiSD3FXunyH+TFqC2ehsD/hXXEHr
	2fkCl20z652iBNZiLRBsHl+nfJ72cb57SnTI/VMMRLnaY9fBr9K6oOws8ntjT+09wptFp3Z2Eg8lv
	Rfnmjl0MffS1ZZFuDnx86yYu25xJ9lBgLT16ypcUWSpa+07w8LwhYPo+ohQajfKVvsqVO6C8pBG1l
	/xBJAlq+0aplzqmJzU/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKhjd-007p70-2c; Wed, 25 Jan 2023 15:30:49 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pKgfd-007VoT-0H
	for linux-riscv@lists.infradead.org; Wed, 25 Jan 2023 14:22:39 +0000
Received: by mail-pl1-x632.google.com with SMTP id a18so5453572plm.2
        for <linux-riscv@lists.infradead.org>; Wed, 25 Jan 2023 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Wn7QAq/CMjjE+KeLIx5bMwwXu7MZiSu0/lg0njqlOGY=;
        b=kqS9/Zc49bL4OW575u7afI3AIrwWEF0i3pw1pKdPYWkX2uwSDHvZac5dKpG6OPb53u
         5ZrXxmp9hXOEIf1/Q/Wigc0/XQ44ZiLndO2G7NCA2FQeFcrVS+9dSFPOdiOYqeDJrr30
         w+WJgjsGk7xTdq0UQrMpZxV3PrU4Aemb9OYP+EoDeEL/JMEPepPMXbHKpPqsARwy5aLj
         5ssj7zjdgHuYcuewbsPPsHLsQZNDdsZhykNmFyFDH/ZDuhNibpho4BTEVZ5w3qgD4PaE
         1BUhAdXNQkxyHEdkCUNCMBCeI+sZkAT9Y4t5Muub8VyarFR5NxLPpbBiWS6/R3sVrBQ/
         8p5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Wn7QAq/CMjjE+KeLIx5bMwwXu7MZiSu0/lg0njqlOGY=;
        b=F7zN6EFg0fUyDDsMZdikM6og0F/rr9Y+Uo8tAayapBBaz0H/ztCh6ns4CpQ+g2YjEm
         U1h7wVef8bJOE68tQChe9LhhK6C3I+Y3RP4x6aj8YqenS1PuhXURL6JVO3l0c3FkmR8h
         hFe4Ht+WfCEGsd4i5vHVHKRaG/0+rM+qwyrV9ew6xaglwN9HUsvlzweFMCKpv2rHSDeg
         3Yx2grUTrV0rGOsM4vgH0nfqtWsj54qf4GM0q9TAqbXeeN892CnJfn7KeFWh6xCNLCta
         9R3Jk8PbuuRIFkSF+mFtH174pPT+0aGr8SWmJsP2e8y6DlfMp+WNqAcp64lSOfPMpFw4
         PA5Q==
X-Gm-Message-State: AFqh2krUcwLWRP+UUCDXWlYuPjlcHCR6fTmzBPtfJB9ToifaTRGnqWHd
	Qet79Xlz4wS9enFXlyILo13sHskh5sl2Gnm0El9qgc4KnQ7SnQzQd6lu9QwS5roWTTJj6JF0V65
	RftoIFhpDpiyROzDiR9J/oCNU9TR6Ps2vW18Yh0KLPxFC3CpbjD9jsATpW4pPHAoxjDphTR7WOO
	oQkp4h6hznAg==
X-Google-Smtp-Source: AMrXdXvEhrLYmptRbR2deBmqvnCAJ6cSnVZT8sa3GykpcFixnUnEZp8qCiOBK9qUPQnFNpimbcF5zA==
X-Received: by 2002:a05:6a20:b914:b0:b8:537a:5525 with SMTP id fe20-20020a056a20b91400b000b8537a5525mr34689971pzb.51.1674656556341;
        Wed, 25 Jan 2023 06:22:36 -0800 (PST)
Received: from hsinchu25.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id bu11-20020a63294b000000b004a3510effa5sm3203520pgb.65.2023.01.25.06.22.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 06:22:36 -0800 (PST)
From: Andy Chiu <andy.chiu@sifive.com>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org
Cc: vineetg@rivosinc.com,
	greentime.hu@sifive.com,
	guoren@linux.alibaba.com,
	Vincent Chen <vincent.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH -next v13 17/19] riscv: KVM: Add vector lazy save/restore support
Date: Wed, 25 Jan 2023 14:20:54 +0000
Message-Id: <20230125142056.18356-18-andy.chiu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20230125142056.18356-1-andy.chiu@sifive.com>
References: <20230125142056.18356-1-andy.chiu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230125_062237_074546_86B2299A 
X-CRM114-Status: GOOD (  24.81  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Vincent Chen <vincent.chen@sifive.com>

This patch adds vector context save/restore for guest VCPUs. To reduce the
impact on KVM performance, the implementation imitates the FP context
switch mechanism to lazily store and restore the vector context only when
the kernel enters/exits the in-kernel run loop and not during the KVM
world switch.

Signed-off-by: Vincent Chen <vincent.chen@sifive.com>
Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Signed-off-by: Andy Chiu <andy.chiu@sifive.com>
---
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  77 ++++++++++
 arch/riscv/include/uapi/asm/kvm.h        |   7 +
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  30 ++++
 arch/riscv/kvm/vcpu_vector.c             | 177 +++++++++++++++++++++++
 6 files changed, 294 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/kvm/vcpu_vector.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 93f43a3e7886..f96c3f8d9586 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/kvm_types.h>
 #include <linux/spinlock.h>
 #include <asm/hwcap.h>
+#include <asm/ptrace.h>
 #include <asm/kvm_vcpu_fp.h>
 #include <asm/kvm_vcpu_insn.h>
 #include <asm/kvm_vcpu_sbi.h>
@@ -140,6 +141,7 @@ struct kvm_cpu_context {
 	unsigned long sstatus;
 	unsigned long hstatus;
 	union __riscv_fp_state fp;
+	struct __riscv_v_state vector;
 };
 
 struct kvm_vcpu_csr {
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
new file mode 100644
index 000000000000..b0cc6ed25642
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -0,0 +1,77 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 SiFive
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ *     Vincent Chen <vincent.chen@sifive.com>
+ *     Greentime Hu <greentime.hu@sifive.com>
+ */
+
+#ifndef __KVM_VCPU_RISCV_VECTOR_H
+#define __KVM_VCPU_RISCV_VECTOR_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+#include <asm/vector.h>
+#include <asm/kvm_host.h>
+
+static __always_inline void __kvm_riscv_vector_save(struct kvm_cpu_context *context)
+{
+	__vstate_save(&context->vector, context->vector.datap);
+}
+
+static __always_inline void __kvm_riscv_vector_restore(struct kvm_cpu_context *context)
+{
+	__vstate_restore(&context->vector, context->vector.datap);
+}
+
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long *isa);
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long *isa);
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+#else
+
+struct kvm_cpu_context;
+
+static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+						    unsigned long *isa)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+						       unsigned long *isa)
+{
+}
+
+static inline void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+{
+}
+
+static inline void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+{
+}
+
+static inline void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
+{
+}
+#endif
+
+int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype);
+int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype);
+#endif
diff --git a/arch/riscv/include/uapi/asm/kvm.h b/arch/riscv/include/uapi/asm/kvm.h
index e7c9183ad4af..f82fc17fef27 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -153,6 +153,13 @@ enum KVM_RISCV_ISA_EXT_ID {
 /* ISA Extension registers are mapped as type 7 */
 #define KVM_REG_RISCV_ISA_EXT		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
 
+/* V extension registers are mapped as type 8 */
+#define KVM_REG_RISCV_VECTOR		(0x08 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_VECTOR_CSR_REG(name)	\
+		(offsetof(struct __riscv_v_state, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_VECTOR_REG(n)	\
+		((n) + sizeof(struct __riscv_v_state) / sizeof(unsigned long))
+
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index 019df9208bdd..b26bc605a267 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -17,6 +17,7 @@ kvm-y += mmu.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
+kvm-y += vcpu_vector.o
 kvm-y += vcpu_insn.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index b060d26ab783..0bbf67bd76f4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -22,6 +22,8 @@
 #include <asm/cacheflush.h>
 #include <asm/hwcap.h>
 #include <asm/sbi.h>
+#include <asm/vector.h>
+#include <asm/kvm_vcpu_vector.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -134,6 +136,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
+	kvm_riscv_vcpu_vector_reset(vcpu);
+
 	kvm_riscv_vcpu_timer_reset(vcpu);
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
@@ -189,6 +193,15 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
 	cntx->hstatus |= HSTATUS_SPVP;
 	cntx->hstatus |= HSTATUS_SPV;
 
+	if (has_vector()) {
+		cntx->vector.datap = kmalloc(riscv_vsize, GFP_KERNEL);
+		if (!cntx->vector.datap)
+			return -ENOMEM;
+		vcpu->arch.host_context.vector.datap = kzalloc(riscv_vsize, GFP_KERNEL);
+		if (!vcpu->arch.host_context.vector.datap)
+			return -ENOMEM;
+	}
+
 	/* By default, make CY, TM, and IR counters accessible in VU mode */
 	reset_csr->scounteren = 0x7;
 
@@ -219,6 +232,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	/* Free unused pages pre-allocated for G-stage page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+
+	/* Free vector context space for host and guest kernel */
+	kvm_riscv_vcpu_free_vector_context(vcpu);
 }
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
@@ -595,6 +611,9 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 						 KVM_REG_RISCV_FP_D);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_set_reg_isa_ext(vcpu, reg);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 	default:
 		break;
 	}
@@ -622,6 +641,9 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 						 KVM_REG_RISCV_FP_D);
 	case KVM_REG_RISCV_ISA_EXT:
 		return kvm_riscv_vcpu_get_reg_isa_ext(vcpu, reg);
+	case KVM_REG_RISCV_VECTOR:
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 	default:
 		break;
 	}
@@ -888,6 +910,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
+	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
+					    vcpu->arch.isa);
 
 	vcpu->cpu = cpu;
 }
@@ -903,6 +928,11 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
 	kvm_riscv_vcpu_timer_save(vcpu);
+	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
+					 vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+
+	csr_write(CSR_HGATP, 0);
 
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
new file mode 100644
index 000000000000..a5e6bb126460
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -0,0 +1,177 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (C) 2022 SiFive
+ *
+ * Authors:
+ *     Atish Patra <atish.patra@wdc.com>
+ *     Anup Patel <anup.patel@wdc.com>
+ *     Vincent Chen <vincent.chen@sifive.com>
+ *     Greentime Hu <greentime.hu@sifive.com>
+ */
+
+#include <linux/errno.h>
+#include <linux/err.h>
+#include <linux/kvm_host.h>
+#include <linux/uaccess.h>
+#include <asm/hwcap.h>
+#include <asm/kvm_vcpu_vector.h>
+
+#ifdef CONFIG_RISCV_ISA_V
+extern unsigned long riscv_vsize;
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+	unsigned long *isa = vcpu->arch.isa;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	cntx->sstatus &= ~SR_VS;
+	if (riscv_isa_extension_available(isa, v)) {
+		cntx->sstatus |= SR_VS_INITIAL;
+		WARN_ON(!cntx->vector.datap);
+		memset(cntx->vector.datap, 0, riscv_vsize);
+	} else {
+		cntx->sstatus |= SR_VS_OFF;
+	}
+}
+
+static void kvm_riscv_vcpu_vector_clean(struct kvm_cpu_context *cntx)
+{
+	cntx->sstatus &= ~SR_VS;
+	cntx->sstatus |= SR_VS_CLEAN;
+}
+
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long *isa)
+{
+	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
+		if (riscv_isa_extension_available(isa, v))
+			__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long *isa)
+{
+	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
+		if (riscv_isa_extension_available(isa, v))
+			__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+{
+	/* No need to check host sstatus as it can be modified outside */
+	if (riscv_isa_extension_available(NULL, v))
+		__kvm_riscv_vector_save(cntx);
+}
+
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+{
+	if (riscv_isa_extension_available(NULL, v))
+		__kvm_riscv_vector_restore(cntx);
+}
+
+void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu)
+{
+	kfree(vcpu->arch.guest_reset_context.vector.datap);
+	kfree(vcpu->arch.host_context.vector.datap);
+}
+#else
+#define riscv_vsize (0)
+#endif
+
+static void *kvm_riscv_vcpu_vreg_addr(struct kvm_vcpu *vcpu,
+				      unsigned long reg_num,
+				      size_t reg_size)
+{
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+	void *reg_val;
+	size_t vlenb = riscv_vsize / 32;
+
+	if (reg_num < KVM_REG_RISCV_VECTOR_REG(0)) {
+		if (reg_size != sizeof(unsigned long))
+			return NULL;
+		switch (reg_num) {
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vstart):
+			reg_val = &cntx->vector.vstart;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vl):
+			reg_val = &cntx->vector.vl;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vtype):
+			reg_val = &cntx->vector.vtype;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(vcsr):
+			reg_val = &cntx->vector.vcsr;
+			break;
+		case KVM_REG_RISCV_VECTOR_CSR_REG(datap):
+		default:
+			return NULL;
+		}
+	} else if (reg_num <= KVM_REG_RISCV_VECTOR_REG(31)) {
+		if (reg_size != vlenb)
+			return NULL;
+		reg_val = cntx->vector.datap
+			  + (reg_num - KVM_REG_RISCV_VECTOR_REG(0)) * vlenb;
+	} else {
+		return NULL;
+	}
+
+	return reg_val;
+}
+
+int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype)
+{
+	unsigned long *isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val = NULL;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if (rtype == KVM_REG_RISCV_VECTOR &&
+	    riscv_isa_extension_available(isa, v)) {
+		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
+	}
+
+	if (!reg_val)
+		return -EINVAL;
+
+	if (copy_to_user(uaddr, reg_val, reg_size))
+		return -EFAULT;
+
+	return 0;
+}
+
+int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
+				  const struct kvm_one_reg *reg,
+				  unsigned long rtype)
+{
+	unsigned long *isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val = NULL;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if (rtype == KVM_REG_RISCV_VECTOR &&
+	    riscv_isa_extension_available(isa, v)) {
+		reg_val = kvm_riscv_vcpu_vreg_addr(vcpu, reg_num, reg_size);
+	}
+
+	if (!reg_val)
+		return -EINVAL;
+
+	if (copy_from_user(reg_val, uaddr, reg_size))
+		return -EFAULT;
+
+	return 0;
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
