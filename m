Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72E29C4345F
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Apr 2024 11:50:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=I5Gv8Ks59zLnP4qNj9mKyKcLYfoGxn1SHJrcwQ8BBaY=; b=UmZA9m+1WfxFmo
	JlVqhXegr3giILcRFY5V+WiOIjU6XAMkVTPwZxaL1UHe5F7NcOOloDrxyH0s8N+jdylYdCURGuMNp
	5j3Bp12/W40Bv6Mri5cjs4teUwWo9270elyimrXhRpoCu8I4dV10VIFgA1SWMW0WUZfEelcHOiuBX
	jN6LrNdvX7vN1l7vja2XnEKAien4QSujHU/u57knNxTMu040yCrzCAnnEaf3QCpOXaTapdNmq50C9
	VmMLmwFX61Ne7+NfJ/z1OzhJOjD7HpG2bvhTUGGv5dwbP+MFfvYOSAsPyKFZW8RYO7cZuHK6Kiv/o
	Gpn9rDniFFV79kx6wnlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQHH-000000023gK-0dH9;
	Thu, 18 Apr 2024 11:50:07 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxQHD-000000023cc-2ztH
	for linux-riscv@lists.infradead.org;
	Thu, 18 Apr 2024 11:50:06 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-5bdbe2de25fso521043a12.3
        for <linux-riscv@lists.infradead.org>; Thu, 18 Apr 2024 04:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1713440998; x=1714045798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GJdeD5iiUhWW9ibJfrIuQV6O5oUuL7RJYhdQuUEPhzw=;
        b=f9W0AL6t4wBe6M4jv0JTNjIY94CwBNKP9a0Y84N6S/Spvi5sRw2/VfD6uqNOviBGIL
         8O37cFUBTSWz9oFTLaM1UDhDQWwxAOI3D6eaie/4HKUrrixAxXxXJxKpZ7omm6VhCevu
         PV3Q5+JZm9vba1vXw//lrc/A32XDqrDbcFeiYF4dDKlvlUvyfcuQ8aJ41l2mmNpVtZsN
         YF9pFB8hFeuYKbcqWI4I8rsdRHvXJR5OIkD1bMuha413+XevGjY5p11noM9SAd1O3lxo
         ePJLtPXa3GUUZU/foxSJAXY725j6tUPaMVqsmKewQZmBAY8Ne4jbCB4qfKUZ6yG3jUHD
         eg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713440998; x=1714045798;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GJdeD5iiUhWW9ibJfrIuQV6O5oUuL7RJYhdQuUEPhzw=;
        b=TvDpr8i/ESaontvwYPM++JhZuCto48X6/kroUjrM/PiQvmRsa5GveAPFxzGSZsm9SC
         Y2E9i8A8sKnSdN9WQ444aYsCzBptFzO3EpFcDV6KQw5ZNOjrgFLIw4Q0/6ws9UHbYj7G
         lqBUTzwhj+85TOjgHFbGm556NjfsLN/YvGo9PzFxk70B7Iv/DGjU44voJV4fCMaC4dey
         970X7/CApeB9hsAyqvRiZs6mhxXAj1Yh/ebmtvUaaWhTIt92mvknD5ZHBPaabx1tdf/y
         SBL/nB/SI9H54ykqDqBrbk3MJvTjPI10pANbqpYqJcBdgKRv9SCnE3v4fmzqfHZnvVQ1
         lNkQ==
X-Gm-Message-State: AOJu0YxhkLR7Gb854W1SoOTnUyvJfOiegFKR7Bsjp+5Sgu4MUukvt+Vl
	gIJNXaKzXtj3/HUQk1YZfpJwyncJRQLfjU2SrlzRqJzXBo7JBgbpjeNTVB9S/Ec=
X-Google-Smtp-Source: AGHT+IEhQRyarVDWCbICPcIgg9trabajpb3eBKbcprMDbL7Q13Be7F8tBjQiW5L97nkQIRBDFgy6Pg==
X-Received: by 2002:a17:90a:e2c8:b0:2a0:7758:31ac with SMTP id fr8-20020a17090ae2c800b002a0775831acmr2355963pjb.25.1713440997972;
        Thu, 18 Apr 2024 04:49:57 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.55])
        by smtp.gmail.com with ESMTPSA id y7-20020a17090aa40700b002abdb19f499sm1032293pjp.26.2024.04.18.04.49.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 18 Apr 2024 04:49:57 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	andy.chiu@sifive.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	lihangjing@bytedance.com,
	dengliang.1214@bytedance.com,
	xieyongji@bytedance.com,
	chaiwen.cc@bytedance.com,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [RFC 1/2] riscv: process: Introduce idle thread using Zawrs extension
Date: Thu, 18 Apr 2024 19:49:41 +0800
Message-Id: <20240418114942.52770-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240418114942.52770-1-luxu.kernel@bytedance.com>
References: <20240418114942.52770-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_045003_831647_5AA022B2 
X-CRM114-Status: GOOD (  17.44  )
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

The Zawrs extension introduces a new instruction WRS.NTO, which will
register a reservation set and causes the hart to temporarily stall
execution in a low-power state until a store occurs to the reservation
set or an interrupt is observed.

This commit implements new version of idle thread for RISC-V via Zawrs
extension.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
Reviewed-by: Hangjing Li <lihangjing@bytedance.com>
Reviewed-by: Liang Deng <dengliang.1214@bytedance.com>
Reviewed-by: Wen Chai <chaiwen.cc@bytedance.com>
---
 arch/riscv/Kconfig                 | 24 +++++++++++++++++
 arch/riscv/include/asm/cpuidle.h   | 11 +-------
 arch/riscv/include/asm/hwcap.h     |  1 +
 arch/riscv/include/asm/processor.h | 17 +++++++++++++
 arch/riscv/kernel/cpu.c            |  5 ++++
 arch/riscv/kernel/cpufeature.c     |  1 +
 arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
 7 files changed, 89 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index be09c8836d56..a0d344e9803f 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -19,6 +19,7 @@ config RISCV
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
 	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
+	select ARCH_HAS_CPU_FINALIZE_INIT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VIRTUAL if MMU
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -525,6 +526,20 @@ config RISCV_ISA_SVPBMT
 
 	   If you don't know what to do here, say Y.
 
+config RISCV_ISA_ZAWRS
+	bool "Zawrs extension support for wait-on-reservation-set instructions"
+	depends on RISCV_ALTERNATIVE
+	default y
+	help
+	   Adds support to dynamically detect the presence of the Zawrs
+	   extension and enable its usage.
+
+	   The Zawrs extension defines a pair of instructions to be used
+	   in polling loops that allows a core to enter a low-power state
+	   and wait on a store to a memory location.
+
+	   If you don't know what to do here, say Y.
+
 config TOOLCHAIN_HAS_V
 	bool
 	default y
@@ -1075,6 +1090,15 @@ endmenu # "Power management options"
 
 menu "CPU Power Management"
 
+config RISCV_ZAWRS_IDLE
+	bool "Idle thread using ZAWRS extensions"
+	depends on RISCV_ISA_ZAWRS
+	default y
+	help
+		Adds support to implement idle thread using ZAWRS extension.
+
+		If you don't know what to do here, say Y.
+
 source "drivers/cpuidle/Kconfig"
 
 source "drivers/cpufreq/Kconfig"
diff --git a/arch/riscv/include/asm/cpuidle.h b/arch/riscv/include/asm/cpuidle.h
index 71fdc607d4bc..94c9ecb46571 100644
--- a/arch/riscv/include/asm/cpuidle.h
+++ b/arch/riscv/include/asm/cpuidle.h
@@ -10,15 +10,6 @@
 #include <asm/barrier.h>
 #include <asm/processor.h>
 
-static inline void cpu_do_idle(void)
-{
-	/*
-	 * Add mb() here to ensure that all
-	 * IO/MEM accesses are completed prior
-	 * to entering WFI.
-	 */
-	mb();
-	wait_for_interrupt();
-}
+void cpu_do_idle(void);
 
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index e17d0078a651..5b358c3cf212 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -81,6 +81,7 @@
 #define RISCV_ISA_EXT_ZTSO		72
 #define RISCV_ISA_EXT_ZACAS		73
 #define RISCV_ISA_EXT_XANDESPMU		74
+#define RISCV_ISA_EXT_ZAWRS		75
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0faf5f161f1e..1143367de8c6 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -157,6 +157,21 @@ static inline void wait_for_interrupt(void)
 	__asm__ __volatile__ ("wfi");
 }
 
+static inline void wrs_nto(unsigned long *addr)
+{
+	int val;
+
+	__asm__ __volatile__(
+#ifdef CONFIG_64BIT
+			"lr.d %[p], %[v] \n\t"
+#else
+			"lr.w %[p], %[v] \n\t"
+#endif
+			".long 0x00d00073 \n\t"
+			: [p] "=&r" (val), [v] "+A" (*addr)
+			: : "memory");
+}
+
 extern phys_addr_t dma32_phys_limit;
 
 struct device_node;
@@ -183,6 +198,8 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
 #define GET_UNALIGN_CTL(tsk, addr)	get_unalign_ctl((tsk), (addr))
 #define SET_UNALIGN_CTL(tsk, val)	set_unalign_ctl((tsk), (val))
 
+extern void select_idle_routine(void);
+
 #endif /* __ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PROCESSOR_H */
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index d11d6320fb0d..69cebd41f5f3 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -22,6 +22,11 @@ bool arch_match_cpu_phys_id(int cpu, u64 phys_id)
 	return phys_id == cpuid_to_hartid_map(cpu);
 }
 
+void __init arch_cpu_finalize_init(void)
+{
+	select_idle_routine();
+}
+
 /*
  * Returns the hart ID of the given device tree node, or -ENODEV if the node
  * isn't an enabled and valid RISC-V hart node.
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 3ed2359eae35..c080e6ca54ba 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -305,6 +305,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
 	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
 	__RISCV_ISA_EXT_DATA(xandespmu, RISCV_ISA_EXT_XANDESPMU),
+	__RISCV_ISA_EXT_DATA(zawrs, RISCV_ISA_EXT_ZAWRS),
 };
 
 const size_t riscv_isa_ext_count = ARRAY_SIZE(riscv_isa_ext);
diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 92922dbd5b5c..9f0f7b888bc1 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -15,6 +15,7 @@
 #include <linux/tick.h>
 #include <linux/ptrace.h>
 #include <linux/uaccess.h>
+#include <linux/static_call.h>
 
 #include <asm/unistd.h>
 #include <asm/processor.h>
@@ -37,11 +38,49 @@ EXPORT_SYMBOL(__stack_chk_guard);
 
 extern asmlinkage void ret_from_fork(void);
 
-void arch_cpu_idle(void)
+static __cpuidle void default_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WFI.
+	 */
+	mb();
+	wait_for_interrupt();
+}
+
+static __cpuidle void wrs_idle(void)
+{
+	/*
+	 * Add mb() here to ensure that all
+	 * IO/MEM accesses are completed prior
+	 * to entering WRS.NTO.
+	 */
+	mb();
+	wrs_nto(&current_thread_info()->flags);
+}
+
+DEFINE_STATIC_CALL_NULL(riscv_idle, default_idle);
+
+void __cpuidle cpu_do_idle(void)
+{
+	static_call(riscv_idle)();
+}
+
+void __cpuidle arch_cpu_idle(void)
 {
 	cpu_do_idle();
 }
 
+void __init select_idle_routine(void)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ZAWRS_IDLE) &&
+			riscv_has_extension_likely(RISCV_ISA_EXT_ZAWRS))
+		static_call_update(riscv_idle, wrs_idle);
+	else
+		static_call_update(riscv_idle, default_idle);
+}
+
 int set_unalign_ctl(struct task_struct *tsk, unsigned int val)
 {
 	if (!unaligned_ctl_available())
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
