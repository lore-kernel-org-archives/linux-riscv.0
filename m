Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA48C2BBCA
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Jun 2024 09:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t8zKtvqCRN+8ROz+JTynrAfEwmHdebjIVSAL3Htp+Hc=; b=jq/njDxkmfnH7r
	ToOBxIgc18iqoyELvKe5Z5/gcU+NMOunXS7bwuU/dauOyyBRDbYgR2tNSgF1tQ4lI6xaiXUJUotxK
	nFaJOc7maaPOLTzjvHNTPXQr487dIuvPbEDtvbvmELA6aDQ5Ry4JoLsP55jkutHTmaXyJUQYmjDPw
	nWcMekAgnARcvpieu/sJObuiyOhIfI0WkFhxM3mcHyI9BsI3hQAgA4NdbT5hLoLvoOOhxLTMljHR8
	ueGpei/ANKSFyvOP0x+Omox7xSkwkS9nQQI4w9TpEhdBD1QtlT5svOdLJm4R5l8ses000kMgt8k/G
	FnB/SQz2BhpJw0ZrJRsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadS-00000008Z3d-3Q3P;
	Fri, 21 Jun 2024 09:32:46 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKadO-00000008Z0g-0w62
	for linux-riscv@lists.infradead.org;
	Fri, 21 Jun 2024 09:32:45 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3d23a0a32afso879315b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 21 Jun 2024 02:32:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1718962360; x=1719567160; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fGIGu1QUhBsktwpUPOKpE8P34T3ApzsbK5/ENNJ+dHs=;
        b=k/Za88dZLe78SDOjjHHAtv5nd5XtqsIkoFM1zXOkxJAvtpO0cQbJdAvI50izqcPhdO
         BCySMFD/mIIpMz0velZydmmj34AQZIaxhF3AEB1LpEhZlQsIyTUrpckGnPL5q/JxXx+2
         ko2ke8r9MzxJW7NXEWxslAwrKzAqwc6ugmjZbkISNdO3rq2onGXtXkpKPzdCiMdlc5Ij
         K53yL+6EPVKz5o5wVOEtd78K1a5xQ6nyqqeEDhTfmi86IHYOwoKyBUbei1uPLTzVgzU1
         FPn3eEv3Ol0m8u59m+vXZU5Ube9P+ar/nDUqcY3cutLHTzkW/WnBOZR9yGT5Y0RioSa4
         LXRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718962360; x=1719567160;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fGIGu1QUhBsktwpUPOKpE8P34T3ApzsbK5/ENNJ+dHs=;
        b=GnHyJt1cuGayOb9NnZkLsQkU7VaFqncpSp7hCBT0wThfDjjKRor/sgFE7PXdEJvRSI
         o5S1E8WJ4q8Ty7xWjgm1pvyxS3NWuqBRz5zn/JG3bgFQnSGnsaARo7n/ZPXPSMBRfHNJ
         atmwth41MW0TL0pKXgHFqCUoiRXlRFwalHBEdqPxhL+KpuhzCkAOcxFgmwbygl2gbofn
         XQp196737aGVymtg36guaK35WjAO8yy79gfIpiyPFDmybGGmKfR/7H5XUCu1mfJoPnFb
         eifCWIjhhpy/QlilSc3PH2bVfZmKI4w2kI1EjYS0MaLYiqx0S4gkt6RnXIcdU53aqsLV
         VnzA==
X-Gm-Message-State: AOJu0YwQ5jiN4Ie+hNUsuLxdbCh6AryN1WyytSEUqsGWe2+X8w4lj0v0
	AzKzlr2Ig8//dAUx0/dFaxFDCNe21IS2LVnberw2PXAZKw+lv7Bl2Vhn7Ouh7zA893uZP9pnWdg
	gsBU=
X-Google-Smtp-Source: AGHT+IFNK1H6Yqd1iJz0ZbHduOnD+WCNo9reooO6aMGXLiN3SjbCwLwX3YRBxhOXjm0hDh01lxikQQ==
X-Received: by 2002:a05:6808:1782:b0:3d5:1bd8:ab1f with SMTP id 5614622812f47-3d51bd8ac9amr9439532b6e.17.1718962360548;
        Fri, 21 Jun 2024 02:32:40 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7065124dd26sm968415b3a.127.2024.06.21.02.32.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 21 Jun 2024 02:32:40 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: linux-riscv@lists.infradead.org,
	kvm-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	conor.dooley@microchip.com,
	anup@brainfault.org,
	atishp@atishpatra.org,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	christoph.muellner@vrull.eu,
	heiko@sntech.de,
	charlie@rivosinc.com,
	David.Laight@aculab.com,
	parri.andrea@gmail.com,
	Xu Lu <luxu.kernel@bytedance.com>,
	Hangjing Li <lihangjing@bytedance.com>,
	Liang Deng <dengliang.1214@bytedance.com>,
	Wen Chai <chaiwen.cc@bytedance.com>
Subject: [RFC v2 1/2] riscv: process: Introduce idle thread using Zawrs extension
Date: Fri, 21 Jun 2024 17:32:22 +0800
Message-Id: <20240621093223.37893-2-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20240621093223.37893-1-luxu.kernel@bytedance.com>
References: <20240621093223.37893-1-luxu.kernel@bytedance.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240621_023242_352100_E1F3B8F5 
X-CRM114-Status: GOOD (  15.13  )
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
 arch/riscv/Kconfig                 | 10 ++++++++
 arch/riscv/include/asm/cpuidle.h   | 11 +-------
 arch/riscv/include/asm/processor.h | 18 +++++++++++++
 arch/riscv/kernel/cpu.c            |  5 ++++
 arch/riscv/kernel/process.c        | 41 +++++++++++++++++++++++++++++-
 5 files changed, 74 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 34bbe6b70546..898e61bbb328 100644
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
@@ -1081,6 +1082,15 @@ endmenu # "Power management options"
 
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
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0faf5f161f1e..5ad572645bee 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -12,6 +12,7 @@
 
 #include <vdso/processor.h>
 
+#include <asm/insn-def.h>
 #include <asm/ptrace.h>
 
 /*
@@ -157,6 +158,21 @@ static inline void wait_for_interrupt(void)
 	__asm__ __volatile__ ("wfi");
 }
 
+static inline void wrs_nto(unsigned long *addr)
+{
+	int val;
+
+	__asm__ __volatile__(
+#ifdef CONFIG_64BIT
+			"lr.d %[p], %[v]\n\t"
+#else
+			"lr.w %[p], %[v]\n\t"
+#endif
+			ZAWRS_WRS_NTO "\n\t"
+			: [p] "=&r" (val), [v] "+A" (*addr)
+			: : "memory");
+}
+
 extern phys_addr_t dma32_phys_limit;
 
 struct device_node;
@@ -183,6 +199,8 @@ extern int set_unalign_ctl(struct task_struct *tsk, unsigned int val);
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
