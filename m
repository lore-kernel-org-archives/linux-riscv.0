Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E98EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 11 May 2022 08:48:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J2qWmm5aQSEq9P5BJxyAVmRmFqFvIprzmTaXILjip34=; b=J6tLDXKzg61HUE
	E34NVMyxRT4giMri5HP98/26eUgf8lBaUIeNDPvgA2wHakHexXb/fXzpBkirNxg8U4XkVty0wVCDG
	hLrVuVpyHCHKUSyllAek4pGx9wmQM++g1BHC+v22VHRxnpaOsqKMzuiLOgJYP6hXOMDSV3mzKvL0z
	6cGAkdqx3s6G7MkKnWQtHsQ/tw1yfx9gSV+gyqaYNa8nH8QIZvKgdwBk9oRi0pS8XoTEgFPuTKVcu
	i/wxLFpBwcMRG0pFD/bZFvamDCg59/kUSQje0N7elo5Aqkqc/qgjibamiiAFpbXBGPqjLoRbvOD6V
	FgnKB5peNb28kIegqBgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1noi0a-0061vw-6g; Wed, 11 May 2022 08:47:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1noi0X-0061vH-US
 for linux-riscv@bombadil.infradead.org; Wed, 11 May 2022 08:47:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=desiato.20200630; h=References:In-Reply-To:Message-Id:Date
 :Subject:To:From:Sender:Reply-To:Cc:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=IfVlsTAB7z7hMED1dtN6CVJwv02w28SofuIEv8aID38=; b=gYJKUD8OiAN6aeupRIbzTe3bvo
 G6EDJnliyZ07BstbPzlP7OV0i5er+z6DkFIFBSA9Fd+QRWkFI6Hd03uJLqQGmq4IUExE3uMaXC0/J
 sd9rTfddg90xk/p41Rhf3+JHvXwyOh01QvlEJhOIAz0wQ8rbHDqmOfHR3y5dUXYu8l/ZfOKIFKV66
 Hacp0x1YF6BWf4X54AET/1Nv11Bb4Lwfpz2kqTbD5/3Sg8mII8Ac0LFM2Zj5n0QNvFeipD1qxx1Zk
 3pOeG9S09wTrk1U0T3sGewCiqiulit4Q4tJL4yEXnypzDXReRT4MniD1MCKGnzQPNhSGYAqc6YSh+
 +WPCl3Yg==;
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nohlG-00D6nL-6c
 for linux-riscv@lists.infradead.org; Wed, 11 May 2022 08:32:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id n18so1201951plg.5
 for <linux-riscv@lists.infradead.org>; Wed, 11 May 2022 01:31:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:in-reply-to
 :references; bh=IfVlsTAB7z7hMED1dtN6CVJwv02w28SofuIEv8aID38=;
 b=kUs4ehPZnLd+O9p/4BDnqDQkhpIAMDEyA3RjEu3KkBthrdUXYk8CxXqNH7d8xkX/Yr
 ycUya5FVQWnls35kL/H2nCa75zyIIiiiPWMsM4F1ojH73CSRqpcSAQcyu1SovzA120Pp
 bxishhAnO2SGaOVKFoK06QGwPo21zEeff2Pmj9dBM5VL1Zf2c1VMFI6I0m9DeRHCwdXe
 Ho8BWK1v5eFKmYOsIWa/mQKIRTzaKm74kKqb67TQdiNDBaGZSxOYF/Rpv0aK/3GMGajg
 uw7Aek8LfV6LslvTF+Y+js8dWC9iRY+bo59HTZVOsHF6HnXYF+9Rhu8hW2OtqHtr/6SL
 bdaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:in-reply-to:references;
 bh=IfVlsTAB7z7hMED1dtN6CVJwv02w28SofuIEv8aID38=;
 b=AhJlSYSQ9zcnsNyqqgWujK9N6V+ah6/kvY60lyYFmefBMd4rQ7KhcKXGD2htaZRBiw
 o0CTzGMK3U5TP107Pe+kloqCz5wKIJx7dlDM5Pd3CUQT98XRn+o9uLA92+vsOLC4Jztk
 DEwZoPdLOjayK0kJOQI0aLk0LghMM81x8VtnxQdz3NnaeeBgBveXxdVp9d6ttFuIsx0F
 CGoS5QdqP/EoxqNIcahrZ+nIJ3hAL9dQ1Tv0as3evB+lpmUPEKcCzTwYdZLzg7bj6m+r
 zMh+tIjb4Cz7Pt3IcEYnp38Iz4gD/0Ks1vxQMlNdhiA+98BuGbtlw8mz+2VelN2oOplh
 Ge/Q==
X-Gm-Message-State: AOAM533Nidr41U/TKdPf8lEvjt/TIGmgj761autWxupFBy7suKQkYeZ5
 sxQHMr+lCXehGDRH2vIyqVwMz+smVLJHlw==
X-Google-Smtp-Source: ABdhPJzLwaHw233DeREMXjw0n96HLjA5QQn/j6XYIJ3JJyY2e/6KchzzZmtlRy4PV1ArPmPG1p0FKw==
X-Received: by 2002:a17:902:e886:b0:15e:8ba0:b749 with SMTP id
 w6-20020a170902e88600b0015e8ba0b749mr24627356plg.95.1652257916206; 
 Wed, 11 May 2022 01:31:56 -0700 (PDT)
Received: from localhost.localdomain (59-124-168-89.hinet-ip.hinet.net.
 [59.124.168.89]) by smtp.gmail.com with ESMTPSA id
 m10-20020aa7900a000000b0050dc7628170sm1020202pfo.74.2022.05.11.01.31.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 May 2022 01:31:55 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 aou@eecs.berkeley.edu
Subject: [PATCH v10 16/16] riscv: KVM: Add vector lazy save/restore support
Date: Wed, 11 May 2022 08:31:26 +0000
Message-Id: <8174f9e04cbb55b8bdeceeb0ca6ff2bdd748290c.1652257230.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
In-Reply-To: <cover.1652257230.git.greentime.hu@sifive.com>
References: <cover.1652257230.git.greentime.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220511_093159_024412_2DBF5AAF 
X-CRM114-Status: GOOD (  23.02  )
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
---
 arch/riscv/include/asm/kvm_host.h        |   2 +
 arch/riscv/include/asm/kvm_vcpu_vector.h |  65 +++++++++
 arch/riscv/include/uapi/asm/kvm.h        |   6 +
 arch/riscv/kernel/asm-offsets.c          |   7 +
 arch/riscv/kvm/Makefile                  |   1 +
 arch/riscv/kvm/vcpu.c                    |  30 ++++
 arch/riscv/kvm/vcpu_switch.S             |  69 +++++++++
 arch/riscv/kvm/vcpu_vector.c             | 173 +++++++++++++++++++++++
 8 files changed, 353 insertions(+)
 create mode 100644 arch/riscv/include/asm/kvm_vcpu_vector.h
 create mode 100644 arch/riscv/kvm/vcpu_vector.c

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index cd4bbcecb0fb..60fb3de61f5c 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -14,6 +14,7 @@
 #include <linux/kvm_types.h>
 #include <asm/csr.h>
 #include <asm/kvm_vcpu_fp.h>
+#include <asm/kvm_vcpu_vector.h>
 #include <asm/kvm_vcpu_timer.h>
 
 #define KVM_MAX_VCPUS			\
@@ -122,6 +123,7 @@ struct kvm_cpu_context {
 	unsigned long sstatus;
 	unsigned long hstatus;
 	union __riscv_fp_state fp;
+	struct __riscv_v_state vector;
 };
 
 struct kvm_vcpu_csr {
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
new file mode 100644
index 000000000000..1dcc1b2e05bb
--- /dev/null
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -0,0 +1,65 @@
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
+struct kvm_cpu_context;
+
+#ifdef CONFIG_VECTOR
+void __kvm_riscv_vector_save(struct kvm_cpu_context *context);
+void __kvm_riscv_vector_restore(struct kvm_cpu_context *context);
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long isa);
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long isa);
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
+void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
+#else
+static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+						    unsigned long isa)
+{
+}
+
+static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+						       unsigned long isa)
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
index f808ad1ce500..b16e2f72eeee 100644
--- a/arch/riscv/include/uapi/asm/kvm.h
+++ b/arch/riscv/include/uapi/asm/kvm.h
@@ -123,6 +123,12 @@ struct kvm_riscv_timer {
 #define KVM_REG_RISCV_FP_D_REG(name)	\
 		(offsetof(struct __riscv_d_ext_state, name) / sizeof(__u64))
 
+/* V extension registers are mapped as type 7 */
+#define KVM_REG_RISCV_VECTOR		(0x07 << KVM_REG_RISCV_TYPE_SHIFT)
+#define KVM_REG_RISCV_VECTOR_CSR_REG(name)	\
+		(offsetof(struct __riscv_v_state, name) / sizeof(unsigned long))
+#define KVM_REG_RISCV_VECTOR_REG(n)	\
+		((n) + sizeof(struct __riscv_v_state) / sizeof(unsigned long))
 #endif
 
 #endif /* __LINUX_KVM_RISCV_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 80316ef7bb78..2540b9146072 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -278,6 +278,13 @@ void asm_offsets(void)
 	OFFSET(KVM_ARCH_FP_D_F31, kvm_cpu_context, fp.d.f[31]);
 	OFFSET(KVM_ARCH_FP_D_FCSR, kvm_cpu_context, fp.d.fcsr);
 
+	/* V extension */
+
+	OFFSET(KVM_ARCH_VECTOR_VSTART, kvm_cpu_context, vector.vstart);
+	OFFSET(KVM_ARCH_VECTOR_VL, kvm_cpu_context, vector.vl);
+	OFFSET(KVM_ARCH_VECTOR_VTYPE, kvm_cpu_context, vector.vtype);
+	OFFSET(KVM_ARCH_VECTOR_VCSR, kvm_cpu_context, vector.vcsr);
+	OFFSET(KVM_ARCH_VECTOR_DATAP, kvm_cpu_context, vector.datap);
 	/*
 	 * THREAD_{F,X}* might be larger than a S-type offset can handle, but
 	 * these are used in performance-sensitive assembly so we can't resort
diff --git a/arch/riscv/kvm/Makefile b/arch/riscv/kvm/Makefile
index e5c56182f48f..acf39cd87fbb 100644
--- a/arch/riscv/kvm/Makefile
+++ b/arch/riscv/kvm/Makefile
@@ -17,6 +17,7 @@ kvm-y += mmu.o
 kvm-y += vcpu.o
 kvm-y += vcpu_exit.o
 kvm-y += vcpu_fp.o
+kvm-y += vcpu_vector.o
 kvm-y += vcpu_switch.o
 kvm-y += vcpu_sbi.o
 kvm-$(CONFIG_RISCV_SBI_V01) += vcpu_sbi_v01.o
diff --git a/arch/riscv/kvm/vcpu.c b/arch/riscv/kvm/vcpu.c
index c0a3be86d613..c3e941dffcd4 100644
--- a/arch/riscv/kvm/vcpu.c
+++ b/arch/riscv/kvm/vcpu.c
@@ -19,6 +19,7 @@
 #include <linux/kvm_host.h>
 #include <asm/csr.h>
 #include <asm/hwcap.h>
+#include <asm/switch_to.h>
 
 const struct _kvm_stats_desc kvm_vcpu_stats_desc[] = {
 	KVM_GENERIC_VCPU_STATS(),
@@ -74,6 +75,8 @@ static void kvm_riscv_reset_vcpu(struct kvm_vcpu *vcpu)
 
 	kvm_riscv_vcpu_fp_reset(vcpu);
 
+	kvm_riscv_vcpu_vector_reset(vcpu);
+
 	kvm_riscv_vcpu_timer_reset(vcpu);
 
 	WRITE_ONCE(vcpu->arch.irqs_pending, 0);
@@ -110,6 +113,15 @@ int kvm_arch_vcpu_create(struct kvm_vcpu *vcpu)
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
 
@@ -140,6 +152,9 @@ void kvm_arch_vcpu_destroy(struct kvm_vcpu *vcpu)
 
 	/* Free unused pages pre-allocated for Stage2 page table mappings */
 	kvm_mmu_free_memory_cache(&vcpu->arch.mmu_page_cache);
+
+	/* Free vector context space for host and guest kernel */
+	kvm_riscv_vcpu_free_vector_context(vcpu);
 }
 
 int kvm_cpu_has_pending_timer(struct kvm_vcpu *vcpu)
@@ -383,6 +398,9 @@ static int kvm_riscv_vcpu_set_reg(struct kvm_vcpu *vcpu,
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
 		return kvm_riscv_vcpu_set_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR)
+		return kvm_riscv_vcpu_set_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 
 	return -EINVAL;
 }
@@ -404,6 +422,9 @@ static int kvm_riscv_vcpu_get_reg(struct kvm_vcpu *vcpu,
 	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_FP_D)
 		return kvm_riscv_vcpu_get_reg_fp(vcpu, reg,
 						 KVM_REG_RISCV_FP_D);
+	else if ((reg->id & KVM_REG_RISCV_TYPE_MASK) == KVM_REG_RISCV_VECTOR)
+		return kvm_riscv_vcpu_get_reg_vector(vcpu, reg,
+						 KVM_REG_RISCV_VECTOR);
 
 	return -EINVAL;
 }
@@ -643,6 +664,9 @@ void kvm_arch_vcpu_load(struct kvm_vcpu *vcpu, int cpu)
 	kvm_riscv_vcpu_host_fp_save(&vcpu->arch.host_context);
 	kvm_riscv_vcpu_guest_fp_restore(&vcpu->arch.guest_context,
 					vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_save(&vcpu->arch.host_context);
+	kvm_riscv_vcpu_guest_vector_restore(&vcpu->arch.guest_context,
+					    vcpu->arch.isa);
 
 	vcpu->cpu = cpu;
 }
@@ -657,6 +681,12 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
 				     vcpu->arch.isa);
 	kvm_riscv_vcpu_host_fp_restore(&vcpu->arch.host_context);
 
+	kvm_riscv_vcpu_guest_vector_save(&vcpu->arch.guest_context,
+					 vcpu->arch.isa);
+	kvm_riscv_vcpu_host_vector_restore(&vcpu->arch.host_context);
+
+	csr_write(CSR_HGATP, 0);
+
 	csr->vsstatus = csr_read(CSR_VSSTATUS);
 	csr->vsie = csr_read(CSR_VSIE);
 	csr->vstvec = csr_read(CSR_VSTVEC);
diff --git a/arch/riscv/kvm/vcpu_switch.S b/arch/riscv/kvm/vcpu_switch.S
index d74df8eb4d71..730dc9b8c644 100644
--- a/arch/riscv/kvm/vcpu_switch.S
+++ b/arch/riscv/kvm/vcpu_switch.S
@@ -406,3 +406,72 @@ __kvm_riscv_fp_d_restore:
 	csrw CSR_SSTATUS, t2
 	ret
 #endif
+
+#ifdef CONFIG_VECTOR
+
+#define vstatep  a0
+#define datap    a1
+#define x_vstart t0
+#define x_vtype  t1
+#define x_vl     t2
+#define x_vcsr   t3
+#define incr     t4
+#define status   t5
+
+ENTRY(__kvm_riscv_vector_save)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	li	a2, KVM_ARCH_VECTOR_DATAP
+	add	datap, a0, a2
+	ld	datap, (datap)
+	csrr    x_vstart, CSR_VSTART
+	csrr    x_vtype, CSR_VTYPE
+	csrr    x_vl, CSR_VL
+	csrr    x_vcsr, CSR_VCSR
+	vsetvli incr, x0, e8, m8, ta, ma
+	vse8.v   v0, (datap)
+	add     datap, datap, incr
+	vse8.v   v8, (datap)
+	add     datap, datap, incr
+	vse8.v   v16, (datap)
+	add     datap, datap, incr
+	vse8.v   v24, (datap)
+
+	REG_S   x_vstart, KVM_ARCH_VECTOR_VSTART(vstatep)
+	REG_S   x_vtype, KVM_ARCH_VECTOR_VTYPE(vstatep)
+	REG_S   x_vl, KVM_ARCH_VECTOR_VL(vstatep)
+	REG_S   x_vcsr, KVM_ARCH_VECTOR_VCSR(vstatep)
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__kvm_riscv_vector_save)
+
+ENTRY(__kvm_riscv_vector_restore)
+	li      status, SR_VS
+	csrs    CSR_STATUS, status
+
+	li	a2, KVM_ARCH_VECTOR_DATAP
+	add	datap, a0, a2
+	ld	datap, (datap)
+	vsetvli incr, x0, e8, m8, ta, ma
+	vle8.v   v0, (datap)
+	add     datap, datap, incr
+	vle8.v   v8, (datap)
+	add     datap, datap, incr
+	vle8.v   v16, (datap)
+	add     datap, datap, incr
+	vle8.v   v24, (datap)
+
+	REG_L   x_vstart, KVM_ARCH_VECTOR_VSTART(vstatep)
+	REG_L   x_vtype, KVM_ARCH_VECTOR_VTYPE(vstatep)
+	REG_L   x_vl, KVM_ARCH_VECTOR_VL(vstatep)
+	REG_L   x_vcsr, KVM_ARCH_VECTOR_VCSR(vstatep)
+	vsetvl  x0, x_vl, x_vtype
+	csrw    CSR_VSTART, x_vstart
+	csrw    CSR_VCSR, x_vcsr
+
+	csrc	CSR_STATUS, status
+	ret
+ENDPROC(__kvm_riscv_vector_restore)
+#endif
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
new file mode 100644
index 000000000000..37bf4ffd47dd
--- /dev/null
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -0,0 +1,173 @@
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
+
+#ifdef CONFIG_VECTOR
+extern unsigned long riscv_vsize;
+void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
+{
+	unsigned long isa = vcpu->arch.isa;
+	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
+
+	cntx->sstatus &= ~SR_VS;
+	if (riscv_isa_extension_available(&isa, v))
+		cntx->sstatus |= SR_VS_INITIAL;
+	else
+		cntx->sstatus |= SR_VS_OFF;
+
+	memset(cntx->vector.datap, 0, riscv_vsize);
+}
+
+static void kvm_riscv_vcpu_vector_clean(struct kvm_cpu_context *cntx)
+{
+	cntx->sstatus &= ~SR_VS;
+	cntx->sstatus |= SR_VS_CLEAN;
+}
+
+void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
+				      unsigned long isa)
+{
+	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
+		if (riscv_isa_extension_available(&isa, v))
+			__kvm_riscv_vector_save(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
+					 unsigned long isa)
+{
+	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
+		if (riscv_isa_extension_available(&isa, v))
+			__kvm_riscv_vector_restore(cntx);
+		kvm_riscv_vcpu_vector_clean(cntx);
+	}
+}
+
+void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx)
+{
+	/* No need to check host sstatus as it can be modified outside */
+	__kvm_riscv_vector_save(cntx);
+}
+
+void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx)
+{
+	__kvm_riscv_vector_restore(cntx);
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
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if ((rtype == KVM_REG_RISCV_VECTOR) &&
+	    riscv_isa_extension_available(&isa, v)) {
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
+	unsigned long isa = vcpu->arch.isa;
+	unsigned long __user *uaddr =
+			(unsigned long __user *)(unsigned long)reg->addr;
+	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
+					    KVM_REG_SIZE_MASK |
+					    rtype);
+	void *reg_val = NULL;
+	size_t reg_size = KVM_REG_SIZE(reg->id);
+
+	if ((rtype == KVM_REG_RISCV_VECTOR) &&
+	    riscv_isa_extension_available(&isa, v)) {
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
