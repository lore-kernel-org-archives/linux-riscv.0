Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10CDDC32771
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Sep 2022 21:56:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z/B0WW6Zv2StNOv4CMo0X0J3LixwIufEb84n5FIw2g4=; b=KAQt6d1jGImJNs
	gXhx6aAavfZBTX0VicdXWCPYx0gOzWOdF2N4YbPDjKewtnEBYgIJWEtcvuR8lgU2OE/tGjRKlGgKt
	E54Tehquvybbibdydo12bsg2ELltwJ8fL7Vca4a9Qa3i2KVG0TWVZEJmLN+uW7BmvjS1Elsla3Ehv
	tV0N+BVsjH7mL/6mh8wTO9kDzsSYwsfffkQvjr4Af60Vbw/5jAaVwsBNB5irsFjccd9i9lc421bHH
	2LF1yf9tCMi2WGr7HyQharFWvOr3mhO1gRbBFtKxdG1gQZKsLfnX+aO/0kbCoqIvENeL0wCNGOjDZ
	UW+bK1+q7wRFpzXR7XNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7hf-00Co5q-OU; Wed, 21 Sep 2022 21:56:23 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ob7hc-00Co3l-2l
	for linux-riscv@lists.infradead.org; Wed, 21 Sep 2022 21:56:22 +0000
Received: by mail-pg1-x52c.google.com with SMTP id r23so7256910pgr.6
        for <linux-riscv@lists.infradead.org>; Wed, 21 Sep 2022 14:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=nS6duVJdRpy7VzEDbeuUiz7BRgby2LGBHTgBEvvIt40=;
        b=tjpF60fiDMo8Hp79sblUDwhbNESEOQ84S6zPjYO6+5DyJUVJ/QopYsgVRSL8uJ2n4c
         ZPT2Qw3dhXdov9tlFNovScCJpiwpUU86XiclidfdW1njjtkAk931axbm2bs1oOM6M1Iz
         zGf9sFOrCYS+LsE5K72TRh8c8F6rKRoisDV1iGUb5YpBiCvatrSBCV1vifRVPv/vV+iV
         i6eRKB9Mh6ebx0CSewJVuIgZBNscXgv8u7XeaqFfGrxRPe/swmXV96anwn24NmhzkqL+
         oSv7H/uWDSmLvFLrjvVjbPf4bprpIcdSHC69Yjb8B/GskqoDB5LaX0qNK/WMzK3l3oGE
         F/CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=nS6duVJdRpy7VzEDbeuUiz7BRgby2LGBHTgBEvvIt40=;
        b=uLTH7Pge2f82XO+RIlroEsfqZYyM7SZbVuzUHRJ3E+ey/dcV/EgAs5QbtxVw7B4zfZ
         iBigPQUvzQYEzpLQXJidpXtHHTjMK2cZ6AMau0tvWCb75LCFaV4+DuZ5pUrCM4ClTqho
         s8bEOPWb0hZZyBaGV37RAX9JTQ//UjXlIlJhjOuKqwsKLYpZjy/rtL7XzHbtDV9UpjtM
         ry3J89bQScidu7xDvkJiD1GbDXy6zKxvl2QqXu1CLy6B4Zc1jogOFGuPQipkmIiHfz2j
         bm1tUE+iHo7Fr4gY4piRXODMNvRpX0wS70fHxItdcMAkrQTSI/CFYsCwg2X01hG9ilxb
         J/5A==
X-Gm-Message-State: ACrzQf1+oT0dt5DuQMpbZjwOCPW0p4QSYxNcMjKLs/b5v2riyyVY0FmC
	2chlZ4/rvosT6amWy1uD5S9lXQ==
X-Google-Smtp-Source: AMsMyM4eI1QZHxWSIPvoJijVfop0chBMt0kkLqJBs6N8ucJKxntXUdb9sZC80mjW3BJ/veY4quk7Rw==
X-Received: by 2002:a05:6a02:104:b0:430:93ec:776f with SMTP id bg4-20020a056a02010400b0043093ec776fmr236548pgb.544.1663797379221;
        Wed, 21 Sep 2022 14:56:19 -0700 (PDT)
Received: from stillson.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id k7-20020aa79727000000b005484d133127sm2634536pfg.129.2022.09.21.14.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Sep 2022 14:56:18 -0700 (PDT)
From: Chris Stillson <stillson@rivosinc.com>
To: 
Cc: Chris Stillson <stillson@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Eric Biederman <ebiederm@xmission.com>,
	Kees Cook <keescook@chromium.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Qinglin Pan <panqinglin2020@iscas.ac.cn>,
	Alexandre Ghiti <alexandre.ghiti@canonical.com>,
	Greentime Hu <greentime.hu@sifive.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Vincent Chen <vincent.chen@sifive.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Dao Lu <daolu@rivosinc.com>,
	Sunil V L <sunilvl@ventanamicro.com>,
	Han-Kuan Chen <hankuan.chen@sifive.com>,
	Changbin Du <changbin.du@intel.com>,
	Li Zhengyu <lizhengyu3@huawei.com>,
	Alexander Graf <graf@amazon.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Tsukasa OI <research_trasio@irq.a4lg.com>,
	Yury Norov <yury.norov@gmail.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Chen Lu <181250012@smail.nju.edu.cn>,
	Vitaly Wool <vitaly.wool@konsulko.com>,
	Myrtle Shah <gatecat@ds0.me>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Mark Brown <broonie@kernel.org>,
	Will Deacon <will@kernel.org>,
	Luis Machado <luis.machado@linaro.org>,
	Janosch Frank <frankja@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	Alexey Dobriyan <adobriyan@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Peter Collingbourne <pcc@google.com>,
	Colin Cross <ccross@google.com>,
	Eugene Syromiatnikov <esyr@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Barret Rhoden <brho@google.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v12 17/17] riscv: prctl to enable vector commands
Date: Wed, 21 Sep 2022 14:43:59 -0700
Message-Id: <20220921214439.1491510-17-stillson@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220921214439.1491510-1-stillson@rivosinc.com>
References: <20220921214439.1491510-1-stillson@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220921_145620_172035_D382D82E 
X-CRM114-Status: GOOD (  21.84  )
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
@@ -230,3 +229,22 @@ int copy_thread(struct task_struct *p, const struct kernel_clone_args *args)
 	p->thread.sp = (unsigned long)childregs; /* kernel sp */
 	return 0;
 }
+
+#ifdef CONFIG_VECTOR
+int rvv_proc_enable(unsigned long x)
+{
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
+		return -(EINVAL);
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
+# define PR_RVV_DISABLE			0
+# define PR_RVV_ENABLE			1
+# define PR_RVV_QUERY			2
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
