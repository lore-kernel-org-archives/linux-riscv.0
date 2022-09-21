Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 576AFC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zX6FnxOr699F2qx9+qI5GYXJeMjzpiq3qyi4wFB3jJc=; b=VbShx+g4+Ssu/l
	Dn7wzEif+0oef6InsCbbRhyVQJ8IxFVG9Pnuv4u+aeaBHZ/yROQSuGkMcZhxNJvEGhfIQBE9I1dR0
	6+mSX6kN7vrR1EfOpUnOimvwlHPxfSGNc1AkmOj+9784vdthsPGLgYDj6DQoA58WstEPo/RXN+ZyM
	NRhuJcSXex1TT9lsSLeFk7NGIsd7/bQcudMBuQZ6gIItIIpik1S7Nw2i664qltOGsj/20YBQilQT2
	ojkKWZl7V5MHr6zAlA00cPRO9Q4m1LeX9Ja48LHh/t9fOdhGbrODmWHI2InxvK9Sham345Xxju1ha
	aahWcygbSOJoo2OjiD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob6qr-00Cde1-Hr; Wed, 21 Sep 2022 21:01:49 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob5gW-00CUT3-Mr
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 19:47:06 +0000
Received: by mail-pf1-x42a.google.com with SMTP id u132so7013806pfc.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 12:47:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=y5TIATxeSU7CdaRQF60r8v+cVqRnQKVi0svBY9dcliQ=;
        b=iA5Aa5kF+dPzTLEbd5eJGrwokMSbiMw8Mh53VvrNUdRFJhymTr0N8TlXSndXVr0Ibv
         ubygAFcpUgtMSX4dYfYs4whfhgtkAqsQxj1ejhNbnomLXzYe6Ut4gBlb69C5cNOqfciC
         VnHnlu6MGZIvFw2Q1pTw9VCMeAljQkizzterxXLR3Al1VoUlSMa5Ky+GZsqNHgOXx92+
         LDWLr1UTNxpwZ8XDAdZk+s6MhsaCGghovFrAG15s9MZ14CxngRfBS16YnoBIO8P0cKiK
         qL4NMNNoSkgmRn5PYB6Tkj4VpxXeu9bAr9BykVno78fNxafZYwnBv3ndXoQRJdwKXeG6
         tECw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=y5TIATxeSU7CdaRQF60r8v+cVqRnQKVi0svBY9dcliQ=;
        b=4y5inSj7OnwpvhYkoOl0Nl4w7RGaMeLACId5w7+IZuz5iKfwDeEtfHOsfPpBkG4XhW
         oEzmCHIf7TZiXZvwLT0oKt3P+dIH74flQv7WHmOxGY3k1vDU55SZA9413JaxlTXW3jG7
         fu0VpgDz7oBPczAn5cVXVJKFPeFPNEJvVcWHA3+k26wnbKZysZi/S7z8d/voVD1kGjpL
         hvJl64fVy4RcnBl59MVGUTdBX7V5iSzeZkOUzdFLjwkW5S/ljgAconAeBTzlD73sFQfv
         BuBJaEo8vR6B/P34LTajomstQe9UMl+pBYIc/CfbyMtV62q5tyXVEIeR7Xoy+vfZ9UXj
         mzbQ==
X-Gm-Message-State: ACrzQf3cGzDqT71rJJm5MYlXKxQwIfZTCo8oIZ/IRUk8PnYj85JOaJy8
	QTK0haZ+Xf/K7PELCNE2rQgXqKSUoq3s+Q==
X-Google-Smtp-Source: AMsMyM4Xrr0o6nbJw8LU9QkbXux32rcmZuwDNXTGraKPzmaUk6XeJs2Jhasd9o/twbn4ZiObAXMvFQ==
X-Received: by 2002:a05:6a00:1a8f:b0:548:8ce8:db73 with SMTP id e15-20020a056a001a8f00b005488ce8db73mr31091975pfv.10.1663789623904;
        Wed, 21 Sep 2022 12:47:03 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id o2-20020aa79782000000b0054aa69bc192sm2551057pfp.72.2022.09.21.12.47.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 12:47:03 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	jpalmer@dabbelt.com,
	kvm-riscv@lists.infradead.org
Cc: Chris Stillson <stillson@rivosinc.com>
Subject: [PATCH 17/17] riscv: prctl to enable vector commands
Date: Wed, 21 Sep 2022 12:46:29 -0700
Message-Id: <20220921194629.1480202-18-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921194629.1480202-1-stillson@rivosinc.com>
References: <20220921194629.1480202-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_124704_771788_89943495 
X-CRM114-Status: GOOD (  19.07  )
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

This code makes enabling the vector extension on a riscv manchine
optional by adding an option to prctl() to allow a process to enable,
disable or query its vector context state.

-added prctl to enable/disable/query current vector state
-added actual function in riscv specific code to change/query the process
state
- Fixed problem with initial set of patches
	(missing some EXPORT_SYMBOL() macro calls)
- rebased to 6.0-rc1
---
 arch/riscv/configs/defconfig             |  6 ++++++
 arch/riscv/include/asm/kvm_vcpu_vector.h |  8 ++++----
 arch/riscv/include/asm/processor.h       |  6 ++++++
 arch/riscv/include/asm/switch_to.h       | 11 +++++++++++
 arch/riscv/kernel/cpufeature.c           |  3 ++-
 arch/riscv/kernel/process.c              | 20 +++++++++++++++++++-
 arch/riscv/kvm/vcpu_vector.c             | 14 +++++++-------
 include/uapi/linux/prctl.h               |  6 ++++++
 kernel/sys.c                             |  7 +++++++
 9 files changed, 68 insertions(+), 13 deletions(-)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index aed332a9d4ea..fce054286b1f 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -209,3 +209,9 @@ CONFIG_RCU_EQS_DEBUG=y
 # CONFIG_FTRACE is not set
 # CONFIG_RUNTIME_TESTING_MENU is not set
 CONFIG_MEMTEST=y
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_VECTOR=y
+CONFIG_ARCH_RV64I=y
+CONFIG_64BIT=y
+CONFIG_VECTOR=y
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 1dcc1b2e05bb..c7101ff943a0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -22,9 +22,9 @@ void __kvm_riscv_vector_save(struct kvm_cpu_context *context);
 void __kvm_riscv_vector_restore(struct kvm_cpu_context *context);
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-				      unsigned long isa);
+				      unsigned long *isa);
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-					 unsigned long isa);
+					 unsigned long *isa);
 void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
@@ -34,12 +34,12 @@ static inline void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 }
 
 static inline void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-						    unsigned long isa)
+						    unsigned long *isa)
 {
 }
 
 static inline void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-						       unsigned long isa)
+						       unsigned long *isa)
 {
 }
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index a09141ecf6aa..f2d0a91ce174 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -88,6 +88,12 @@ extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 
 extern unsigned long signal_minsigstksz __ro_after_init;
+
+#ifdef CONFIG_VECTOR
+extern int rvv_proc_enable(unsigned long x);
+#define RVV_PROC_ENABLE(x) rvv_proc_enable(x)
+#endif
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/switch_to.h b/arch/riscv/include/asm/switch_to.h
index 527951c033d4..d9747450311c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -80,6 +80,17 @@ extern unsigned long riscv_vsize;
 extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
 extern void __vstate_restore(struct __riscv_v_state *restore_from, void *datap);
 
+static inline bool vstate_query(struct pt_regs *regs)
+{
+	return (regs->status & SR_VS) != 0;
+}
+
+static inline void vstate_on(struct task_struct *task,
+				struct pt_regs *regs)
+{
+	regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
+}
+
 static inline void __vstate_clean(struct pt_regs *regs)
 {
 	regs->status = (regs->status & ~(SR_VS)) | SR_VS_CLEAN;
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 0487ab19b234..3be469cb9266 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -37,6 +37,8 @@ __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_fpu);
 #include <asm/vector.h>
 __ro_after_init DEFINE_STATIC_KEY_FALSE(cpu_hwcap_vector);
 unsigned long riscv_vsize __read_mostly;
+EXPORT_SYMBOL(cpu_hwcap_vector);
+EXPORT_SYMBOL(riscv_vsize);
 #endif
 
 /**
@@ -346,4 +348,3 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 	}
 }
 #endif
-}
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index e88a37fc77ed..a5a76d1374ec 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/prctl.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -134,7 +135,6 @@ void start_thread(struct pt_regs *regs, unsigned long pc,
 			if (WARN_ON(!vstate->datap))
 				return;
 		}
-		regs->status |= SR_VS_INITIAL;
 
 		/*
 		 * Restore the initial value to the vector register
@@ -230,3 +230,21 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+#ifdef CONFIG_VECTOR
+int rvv_proc_enable(unsigned long x) {
+	switch (x) {
+	case PR_RVV_DISABLE:
+		vstate_off(current, task_pt_regs(current));
+		return 0;
+	case PR_RVV_ENABLE:
+		vstate_on(current, task_pt_regs(current));
+		return 0;
+	case PR_RVV_QUERY:
+		return vstate_query(task_pt_regs(current));
+	default:
+	       	return -(EINVAL);
+
+	}
+}
+#endif
diff --git a/arch/riscv/kvm/vcpu_vector.c b/arch/riscv/kvm/vcpu_vector.c
index 37bf4ffd47dd..9d1613da561a 100644
--- a/arch/riscv/kvm/vcpu_vector.c
+++ b/arch/riscv/kvm/vcpu_vector.c
@@ -20,7 +20,7 @@
 extern unsigned long riscv_vsize;
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;
 
 	cntx->sstatus &= ~SR_VS;
@@ -39,20 +39,20 @@ static void kvm_riscv_vcpu_vector_clean(struct kvm_cpu_context *cntx)
 }
 
 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-				      unsigned long isa)
+				      unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
-		if (riscv_isa_extension_available(&isa, v))
+		if (riscv_isa_extension_available(isa, v))
 			__kvm_riscv_vector_save(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
 }
 
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-					 unsigned long isa)
+					 unsigned long *isa)
 {
 	if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
-		if (riscv_isa_extension_available(&isa, v))
+		if (riscv_isa_extension_available(isa, v))
 			__kvm_riscv_vector_restore(cntx);
 		kvm_riscv_vcpu_vector_clean(cntx);
 	}
@@ -122,7 +122,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg,
 				  unsigned long rtype)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
@@ -149,7 +149,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
 				  const struct kvm_one_reg *reg,
 				  unsigned long rtype)
 {
-	unsigned long isa = vcpu->arch.isa;
+	unsigned long isa = *vcpu->arch.isa;
 	unsigned long __user *uaddr =
 			(unsigned long __user *)(unsigned long)reg->addr;
 	unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index a5e06dcbba13..8ea56e4c48f8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -281,6 +281,12 @@ struct prctl_mm_map {
 # define PR_SME_VL_LEN_MASK		0xffff
 # define PR_SME_VL_INHERIT		(1 << 17) /* inherit across exec */
 
+/* RISC-V V vector extension */
+#define PR_RVV_STATE			65
+# define PR_RVV_DISABLE	  		0
+# define PR_RVV_ENABLE	  		1
+# define PR_RVV_QUERY	  		2
+
 #define PR_SET_VMA		0x53564d41
 # define PR_SET_VMA_ANON_NAME		0
 
diff --git a/kernel/sys.c b/kernel/sys.c
index b911fa6d81ab..3049b1823273 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -138,6 +138,9 @@
 #ifndef GET_TAGGED_ADDR_CTRL
 # define GET_TAGGED_ADDR_CTRL()		(-EINVAL)
 #endif
+#ifndef RVV_PROC_ENABLE
+# define RVV_PROC_ENABLE(x)			(-EINVAL)
+#endif
 
 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2620,6 +2623,10 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long, arg2, unsigned long, arg3,
 		error = sched_core_share_pid(arg2, arg3, arg4, arg5);
 		break;
 #endif
+	case PR_RVV_STATE:
+		error = RVV_PROC_ENABLE(arg2);
+		break;
+
 	case PR_SET_VMA:
 		error = prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
