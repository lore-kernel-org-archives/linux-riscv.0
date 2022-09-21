Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 739DAC6FA82
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 16:51:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3RW7m+jcJhJrzKvd5/FVLlp3SkqlvprQRmy0N4iWQ6g=; b=c22oKzX6vExFAJ
	U4qX71HUHWFhhvVjuHzRriEPh3q85M8CCNhdl61ldSOacgOzZZabsCdjDv5tUYwBl+11qDiYmnxJ6
	S3zi8sDe/EBg/S4d5TQWxv1jfsDPemU6j20cEWmIEZ41gIB87fqPbR/J8f4SdC8DZzYPYch9EDiQA
	SL9l1e9hH/6Sa85GVTL59Z6mm8+PMCk3Jt2tUycsfoT0+7MB8GAGqaVvqKUM6W/OIkkSKz4pH4WQd
	wek8ILyPpEQaqEC42ToQduz/N/HbQIDN89/n7TGvJ8OcIy1sXXcu+a+s6UzsZQpq6ZMWcd7joDlFR
	GKTlz58Y9xTUtqDyatkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2wf-00C4bu-3d; Wed, 21 Sep 2022 16:51:33 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob2wc-00C4a2-Cp
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 16:51:32 +0000
Received: by mail-wm1-x336.google.com with SMTP id l8so4895752wmi.2
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 09:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date;
        bh=iiNWrVYExZtyCTmhZMPXv3Z+V5/s9eeZmuS1v1hmbZc=;
        b=l6iPTEdQXyy7Lmzuah2UTCk2eXp7jdvPcOf9lidb8uCcqODJpCvm8+/gAdt0o7yiZN
         HRnR1FOjvBdbMO/6ITLdCfCHUQ1VZeMQXoauUveDDC4EWG2kZAeMVTCbu294FEZgJeHH
         QIDHy8w4jQ0skUbChO/JqNZrEDjoBTQwa68M4xhx/Cj8RGXdIarqlp6WHq+NPvxRXe/p
         MoaGAMPZJ/6eJSJO6JN+8nCpus3ttKhbZnOYcksg616foYbxISZ0UW/5nMrrXPwwtWyG
         kGOVU1jynRaws7ctHAwY4gQYHMpd8gizajzRWTBsRyCSsr+njvnUV1Xxa9HNs9hVTt9b
         LY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date;
        bh=iiNWrVYExZtyCTmhZMPXv3Z+V5/s9eeZmuS1v1hmbZc=;
        b=wmd5ssl3ECfp7ZOajJerLa0Olr9lO1Vg9Gm5vpVzv6EdNqA6x8EHnOYCoGauZ9ug6t
         uWcEGfEQo5urk/CS8ICCh0v4wyG+znDv5zFIAcwvnPi+3erBRQG6RDURSZtILI7HtH40
         RLpX55AYuDD5qqkW8dZaRMORuzFhwgn2LppG0uUQHYsdkts0Er4dXoKQhXB/UfI2ZvCB
         t4kxFY+q66gBzmMeBCH1t9YZDB8poees3pzGQA2mABlu5pKZmFsw26SHIbFlu+WGRSAP
         nB95dFW+RxBGeKsq38cHPeFbdaoM/QHxMgJkbpL/LvZA5v4O6sc532Nq1FpNpJ519NsA
         fX2Q==
X-Gm-Message-State: ACrzQf3VsO+tFMgOQs+3rxRUcDbCf9zZMbIpcqkh7kuWfdngkgeLCd4v
	xMO3w7TPfFVzgE0TW2OHzPC5j/HXX+n4Y9lOHpqiCtmt7GKjwg==
X-Google-Smtp-Source: AMsMyM6aor/vHTbQFZim6OWwSlN7TYikJGkCiKEB/N8x0zyjbwFR0fUFOS8gaw68B0aYsramY9VI5SlyeTK6zgjnsDw=
X-Received: by 2002:a1c:4b05:0:b0:3b4:90c1:e249 with SMTP id
 y5-20020a1c4b05000000b003b490c1e249mr6690440wma.201.1663779088748; Wed, 21
 Sep 2022 09:51:28 -0700 (PDT)
MIME-Version: 1.0
From: Chris Stillson <stillson@rivosinc.com>
Date: Wed, 21 Sep 2022 09:50:52 -0700
Message-ID: <CAM2SziXtppQQmreSLLdB0rfb_CZi-sGAZAZeQJ5ShfkK-goK0w@mail.gmail.com>
Subject: [PATCH 17/17] riscv: prctl to enable vector commands
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_095130_473965_E1B7228E 
X-CRM114-Status: GOOD (  18.11  )
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
diff --git a/arch/riscv/include/asm/kvm_vcpu_vector.h
b/arch/riscv/include/asm/kvm_vcpu_vector.h
index 1dcc1b2e05bb..c7101ff943a0 100644
--- a/arch/riscv/include/asm/kvm_vcpu_vector.h
+++ b/arch/riscv/include/asm/kvm_vcpu_vector.h
@@ -22,9 +22,9 @@ void __kvm_riscv_vector_save(struct kvm_cpu_context *context);
 void __kvm_riscv_vector_restore(struct kvm_cpu_context *context);
 void kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu);
 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-                                     unsigned long isa);
+                                     unsigned long *isa);
 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-                                        unsigned long isa);
+                                        unsigned long *isa);
 void kvm_riscv_vcpu_host_vector_save(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_host_vector_restore(struct kvm_cpu_context *cntx);
 void kvm_riscv_vcpu_free_vector_context(struct kvm_vcpu *vcpu);
@@ -34,12 +34,12 @@ static inline void
kvm_riscv_vcpu_vector_reset(struct kvm_vcpu *vcpu)
 }

 static inline void kvm_riscv_vcpu_guest_vector_save(struct
kvm_cpu_context *cntx,
-                                                   unsigned long isa)
+                                                   unsigned long *isa)
 {
 }

 static inline void kvm_riscv_vcpu_guest_vector_restore(struct
kvm_cpu_context *cntx,
-                                                      unsigned long isa)
+                                                      unsigned long *isa)
 {
 }

diff --git a/arch/riscv/include/asm/processor.h
b/arch/riscv/include/asm/processor.h
index a09141ecf6aa..f2d0a91ce174 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -88,6 +88,12 @@ extern void riscv_fill_hwcap(void);
 extern int arch_dup_task_struct(struct task_struct *dst, struct
task_struct *src);

 extern unsigned long signal_minsigstksz __ro_after_init;
+
+#ifdef CONFIG_VECTOR
+extern int rvv_proc_enable(unsigned long x);
+#define RVV_PROC_ENABLE(x) rvv_proc_enable(x)
+#endif
+
 #endif /* __ASSEMBLY__ */

 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/include/asm/switch_to.h
b/arch/riscv/include/asm/switch_to.h
index 527951c033d4..d9747450311c 100644
--- a/arch/riscv/include/asm/switch_to.h
+++ b/arch/riscv/include/asm/switch_to.h
@@ -80,6 +80,17 @@ extern unsigned long riscv_vsize;
 extern void __vstate_save(struct __riscv_v_state *save_to, void *datap);
 extern void __vstate_restore(struct __riscv_v_state *restore_from,
void *datap);

+static inline bool vstate_query(struct pt_regs *regs)
+{
+       return (regs->status & SR_VS) != 0;
+}
+
+static inline void vstate_on(struct task_struct *task,
+                               struct pt_regs *regs)
+{
+       regs->status = (regs->status & ~(SR_VS)) | SR_VS_INITIAL;
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
@@ -346,4 +348,3 @@ void __init_or_module
riscv_cpufeature_patch_func(struct alt_entry *begin,
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
-               regs->status |= SR_VS_INITIAL;

                /*
                 * Restore the initial value to the vector register
@@ -230,3 +230,21 @@ int copy_thread(struct task_struct *p, const
struct kernel_clone_args *args)
        p->thread.sp = (unsigned long)childregs; /* kernel sp */
        return 0;
 }
+
+#ifdef CONFIG_VECTOR
+int rvv_proc_enable(unsigned long x) {
+       switch (x) {
+       case PR_RVV_DISABLE:
+               vstate_off(current, task_pt_regs(current));
+               return 0;
+       case PR_RVV_ENABLE:
+               vstate_on(current, task_pt_regs(current));
+               return 0;
+       case PR_RVV_QUERY:
+               return vstate_query(task_pt_regs(current));
+       default:
+               return -(EINVAL);
+
+       }
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
-       unsigned long isa = vcpu->arch.isa;
+       unsigned long isa = *vcpu->arch.isa;
        struct kvm_cpu_context *cntx = &vcpu->arch.guest_context;

        cntx->sstatus &= ~SR_VS;
@@ -39,20 +39,20 @@ static void kvm_riscv_vcpu_vector_clean(struct
kvm_cpu_context *cntx)
 }

 void kvm_riscv_vcpu_guest_vector_save(struct kvm_cpu_context *cntx,
-                                     unsigned long isa)
+                                     unsigned long *isa)
 {
        if ((cntx->sstatus & SR_VS) == SR_VS_DIRTY) {
-               if (riscv_isa_extension_available(&isa, v))
+               if (riscv_isa_extension_available(isa, v))
                        __kvm_riscv_vector_save(cntx);
                kvm_riscv_vcpu_vector_clean(cntx);
        }
 }

 void kvm_riscv_vcpu_guest_vector_restore(struct kvm_cpu_context *cntx,
-                                        unsigned long isa)
+                                        unsigned long *isa)
 {
        if ((cntx->sstatus & SR_VS) != SR_VS_OFF) {
-               if (riscv_isa_extension_available(&isa, v))
+               if (riscv_isa_extension_available(isa, v))
                        __kvm_riscv_vector_restore(cntx);
                kvm_riscv_vcpu_vector_clean(cntx);
        }
@@ -122,7 +122,7 @@ int kvm_riscv_vcpu_get_reg_vector(struct kvm_vcpu *vcpu,
                                  const struct kvm_one_reg *reg,
                                  unsigned long rtype)
 {
-       unsigned long isa = vcpu->arch.isa;
+       unsigned long isa = *vcpu->arch.isa;
        unsigned long __user *uaddr =
                        (unsigned long __user *)(unsigned long)reg->addr;
        unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
@@ -149,7 +149,7 @@ int kvm_riscv_vcpu_set_reg_vector(struct kvm_vcpu *vcpu,
                                  const struct kvm_one_reg *reg,
                                  unsigned long rtype)
 {
-       unsigned long isa = vcpu->arch.isa;
+       unsigned long isa = *vcpu->arch.isa;
        unsigned long __user *uaddr =
                        (unsigned long __user *)(unsigned long)reg->addr;
        unsigned long reg_num = reg->id & ~(KVM_REG_ARCH_MASK |
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index a5e06dcbba13..8ea56e4c48f8 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -281,6 +281,12 @@ struct prctl_mm_map {
 # define PR_SME_VL_LEN_MASK            0xffff
 # define PR_SME_VL_INHERIT             (1 << 17) /* inherit across exec */

+/* RISC-V V vector extension */
+#define PR_RVV_STATE                   65
+# define PR_RVV_DISABLE                        0
+# define PR_RVV_ENABLE                 1
+# define PR_RVV_QUERY                  2
+
 #define PR_SET_VMA             0x53564d41
 # define PR_SET_VMA_ANON_NAME          0

diff --git a/kernel/sys.c b/kernel/sys.c
index b911fa6d81ab..3049b1823273 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -138,6 +138,9 @@
 #ifndef GET_TAGGED_ADDR_CTRL
 # define GET_TAGGED_ADDR_CTRL()                (-EINVAL)
 #endif
+#ifndef RVV_PROC_ENABLE
+# define RVV_PROC_ENABLE(x)                    (-EINVAL)
+#endif

 /*
  * this is where the system-wide overflow UID and GID are defined, for
@@ -2620,6 +2623,10 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned
long, arg2, unsigned long, arg3,
                error = sched_core_share_pid(arg2, arg3, arg4, arg5);
                break;
 #endif
+       case PR_RVV_STATE:
+               error = RVV_PROC_ENABLE(arg2);
+               break;
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
