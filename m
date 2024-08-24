Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671E1C5321E
	for <linux-riscv@archiver.kernel.org>; Sat, 24 Aug 2024 00:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=FbP4+c1zt9D0BR+QaOc66Be3X6nlV7z6MJCgFbltfO8=; b=oB2+wQsqTtR/hz
	c66O5FVzMWek5qroZWs3s7HkzRGhmP2GWnQYA3a42mJSK9ANUPXOiAyDboY8xGC0HCJxtKYkumOG1
	zHjBvKn0hRN+ioOvUCRGjd+q6810LSZ6jwSzdY9FTPLln8GnQujJ8nVNbD+lDjTuJ00fyRyZQWFBo
	BNT9omJRnRDDh9kNNeZ2tc7RdN/OkoBK3DoUoVY/ooG28ALDI2dBbqaZMAqUCAfuFdbzN/6wd2MQ/
	R1cgvIx05YhYGwZ6/M8BdLbS7aeOF4eZpEpMHDhyS2VvVNfJBw1EOtLCRjkuSHuhNSWV36ChM9yN0
	sTubh+5CnLjjr6SUEyLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sheyL-000000015Vm-0pOB;
	Sat, 24 Aug 2024 00:49:41 +0000
Received: from mail-ot1-x32d.google.com ([2607:f8b0:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sheyI-000000015Ur-2V4Z
	for linux-riscv@lists.infradead.org;
	Sat, 24 Aug 2024 00:49:40 +0000
Received: by mail-ot1-x32d.google.com with SMTP id 46e09a7af769-7093f3a1af9so2051926a34.1
        for <linux-riscv@lists.infradead.org>; Fri, 23 Aug 2024 17:49:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1724460573; x=1725065373; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=V9LfDeeWKMLmiNvxF44yCZAImDGYCScd/uarouyejBQ=;
        b=LHnoBe9dIeBcETSeKYUNeziCuBWonSw0wPcK4/dm+x5lSeRA4GnTZfeF7VKrzuBf3T
         TJu+WVOE4lMpUQrJe85WPUSzNgM+HsaJJH0hnWTWYqK3VYU7ivTvdZtwodMZfoTY5wo9
         9tMa8lz6aFUutwQKrh82YbLDMZYYEHJFfzfWDtj+lffMM+Juv10Vlrb0aA5c+4fXsXJg
         So0k7KDyvRLkmYjgbhhP9GfSwKyunhs5p24nroRe2xvo6Sv6caaZE+jDdfiVJm2KnQrD
         Mr8DYElXHfvAB8rX5Ke94URlBJXiznMLgQ0gDlKvd7Pl/+WCu1hLysW0Kf8oPSRQgLNB
         vt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724460573; x=1725065373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V9LfDeeWKMLmiNvxF44yCZAImDGYCScd/uarouyejBQ=;
        b=FyXBzoUdsZTA7FhOCkibSNcWdcI1BgAvmRdBNB67gREEYq3rzKtpg1eY6ytyUBP3qc
         M3UPGhpQh0Xlcr71X/G7NqYmEDpzpwguelNTU5J2JSvIFDrBlQ0IM4zpBR+PCGFMhSP/
         R4qyxlDE4iW2cZTVmExN6WEnx3FHw28JoE11UdikkIXV0SwjsXXMPqQda8SdyNTNscQ/
         Ej3PQ5ClVSaHxVnwBkj9bbqYmGK9sb4EoaRmyRlSyKqK/MmiUDcVGXSwqsVr+NlfBY7h
         HUiv5cF+FsW/hAPQyVYV2mdQXiqZ5dnq2mWKHkdFvRmrCpyMEo8YMfgc5uuMqpbGt0zK
         x+6g==
X-Forwarded-Encrypted: i=1; AJvYcCXKSlFN9I8Arrb6gdhe9FoDuFl4fUVDacW7Wxfoy3j8W5uFI6NJvnoIuYgNAGIgF/9j1sx5+91UDlOBYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8cGf8maAjhD/g5zycN5M0U1bKSEu/9XsXkYBM/GrRLPbK/Sx4
	aFDk7WCNK0yn4Bw11XR3TnuoGmcSESNkOCAiUG751xFwrlnE1oz2ExebKhsP+0A=
X-Google-Smtp-Source: AGHT+IHXN44/Uhpbc5HjU/UNIngFnsErN7xy0wmHCyVmt+yEtdYziYd3Gj1rFnHMzEVOqHQmQWL9yQ==
X-Received: by 2002:a05:6830:6004:b0:70a:9876:b76b with SMTP id 46e09a7af769-70e0ead89c3mr5064366a34.2.1724460573141;
        Fri, 23 Aug 2024 17:49:33 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d5ebbb0b27sm7088692a91.45.2024.08.23.17.49.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 23 Aug 2024 17:49:32 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: punit.agrawal@bytedance.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dennis@kernel.org,
	tj@kernel.org,
	cl@linux.com,
	samitolvanen@google.com,
	guoren@kernel.org,
	debug@rivosinc.com,
	charlie@rivosinc.com,
	cuiyunhui@bytedance.com,
	cleger@rivosinc.com,
	puranjay@kernel.org,
	antonb@tenstorrent.com,
	namcaov@gmail.com,
	andy.chiu@sifive.com,
	ajones@ventanamicro.com,
	samuel.holland@sifive.com,
	haxel@fzi.de,
	yang.zhang@hexintek.com,
	conor.dooley@microchip.com,
	evan@rivosinc.com,
	yang.lee@linux.alibaba.com,
	tglx@linutronix.de,
	haibo1.xu@intel.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org
Subject: [PATCH RFC] riscv: use gp to save percpu offset
Date: Sat, 24 Aug 2024 08:49:20 +0800
Message-Id: <20240824004920.35877-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240823_174938_990155_9C1C0678 
X-CRM114-Status: GOOD (  16.47  )
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

Compared to directly fetching the per-CPU offset from memory (or cache),
using the global pointer (gp) to store the per-CPU offset can save one
memory access.

When compiling the kernel, the following command needs to be explicitly
specified:
export KCFLAGS="... -mno-relax"
export KAFLAGS="... -mno-relax"

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 arch/riscv/include/asm/asm.h      | 18 ++++++------------
 arch/riscv/include/asm/percpu.h   | 24 ++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c   |  1 +
 arch/riscv/kernel/entry.S         |  4 ++--
 arch/riscv/kernel/head.S          |  9 ---------
 arch/riscv/kernel/smpboot.c       |  7 +++++++
 arch/riscv/kernel/suspend_entry.S |  2 --
 7 files changed, 40 insertions(+), 25 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/arch/riscv/include/asm/asm.h b/arch/riscv/include/asm/asm.h
index 776354895b81..be4e4e5ac134 100644
--- a/arch/riscv/include/asm/asm.h
+++ b/arch/riscv/include/asm/asm.h
@@ -109,19 +109,13 @@
 	REG_L \dst, 0(\dst)
 .endm
 
-#ifdef CONFIG_SHADOW_CALL_STACK
-/* gp is used as the shadow call stack pointer instead */
-.macro load_global_pointer
+.macro load_pcpu_off_gp tmp
+	REG_L \tmp, TASK_TI_CPU(tp)
+	slli \tmp, \tmp, 3
+	la gp, __per_cpu_offset
+	add gp, gp, \tmp
+	REG_L gp, 0(gp)
 .endm
-#else
-/* load __global_pointer to gp */
-.macro load_global_pointer
-.option push
-.option norelax
-	la gp, __global_pointer$
-.option pop
-.endm
-#endif /* CONFIG_SHADOW_CALL_STACK */
 
 	/* save all GPs except x1 ~ x5 */
 	.macro save_from_x6_to_x31
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000000..858d0a93ff14
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	asm volatile("addi gp, %0, 0" :: "r" (off));
+}
+
+static inline unsigned long __kern_my_cpu_offset(void)
+{
+	unsigned long off;
+
+	asm ("mv %0, gp":"=r" (off) :);
+	return off;
+}
+
+#define __my_cpu_offset __kern_my_cpu_offset()
+
+#include <asm-generic/percpu.h>
+
+#endif /* __ASM_PERCPU_H */
+
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index b09ca5f944f7..5cc6d1de4ab4 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -36,6 +36,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index ac2e908d4418..39d7e66567cf 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,8 +77,8 @@ SYM_CODE_START(handle_exception)
 	 */
 	csrw CSR_SCRATCH, x0
 
-	/* Load the global pointer */
-	load_global_pointer
+	/* load __per_cpu_offset[cpu] to gp*/
+	load_pcpu_off_gp t6
 
 	/* Load the kernel shadow call stack pointer if coming from userspace */
 	scs_load_current_if_task_changed s5
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..aa3d22967eef 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -110,9 +110,6 @@ relocate_enable_mmu:
 	la a0, .Lsecondary_park
 	csrw CSR_TVEC, a0
 
-	/* Reload the global pointer */
-	load_global_pointer
-
 	/*
 	 * Switch to kernel page tables.  A full fence is necessary in order to
 	 * avoid using the trampoline translations, which are only correct for
@@ -131,9 +128,6 @@ secondary_start_sbi:
 	csrw CSR_IE, zero
 	csrw CSR_IP, zero
 
-	/* Load the global pointer */
-	load_global_pointer
-
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
 	 * floating point or vector in kernel space
@@ -228,9 +222,6 @@ SYM_CODE_START(_start_kernel)
 	csrr a0, CSR_MHARTID
 #endif /* CONFIG_RISCV_M_MODE */
 
-	/* Load the global pointer */
-	load_global_pointer
-
 	/*
 	 * Disable FPU & VECTOR to detect illegal usage of
 	 * floating point or vector in kernel space
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 0f8f1c95ac38..844aede75662 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -41,6 +41,11 @@
 
 static DECLARE_COMPLETION(cpu_running);
 
+void __init smp_prepare_boot_cpu(void)
+{
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
+}
+
 void __init smp_prepare_cpus(unsigned int max_cpus)
 {
 	int cpuid;
@@ -212,6 +217,8 @@ asmlinkage __visible void smp_callin(void)
 	struct mm_struct *mm = &init_mm;
 	unsigned int curr_cpuid = smp_processor_id();
 
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	if (has_vector()) {
 		/*
 		 * Return as early as possible so the hart with a mismatching
diff --git a/arch/riscv/kernel/suspend_entry.S b/arch/riscv/kernel/suspend_entry.S
index 2d54f309c140..0ec850489e0c 100644
--- a/arch/riscv/kernel/suspend_entry.S
+++ b/arch/riscv/kernel/suspend_entry.S
@@ -60,8 +60,6 @@ SYM_FUNC_START(__cpu_suspend_enter)
 SYM_FUNC_END(__cpu_suspend_enter)
 
 SYM_TYPED_FUNC_START(__cpu_resume_enter)
-	/* Load the global pointer */
-	load_global_pointer
 
 #ifdef CONFIG_MMU
 	/* Save A0 and A1 */
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
