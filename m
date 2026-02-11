Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF1DECD6C7
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Feb 2026 16:58:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=p6e0Q2LfTk8/lh5N/9AYUSUor1m8wb3rOVlHOf/NbZ4=; b=Z7pLeEyOAG1OQ9
	Lguv3/K1mY0HYvkiwSq73C5PP0eSpk3R/Jcv2n8ATC+62NydbQ7mlKfs5a2Xw/DhP0pPJ4PeLEGNb
	VWtmOOwkPxCoKqc3dkpZ9aVzUc3jca2wm8AbIXdPX+Je+TuPl7T/eLgpHnplLtCqJjPMHzg6zVRKN
	heBTLLgqaF6tRF9ZKvN/y5kt1KGTc7TYZgQnTzx31boMmoebEmxHsxq4DwJnfi4FSxvOMBl5g7AVF
	bko+VFnxL0oa2l47dvSDecPVpFVmadWR146GEuQgBFATgGqKW8hqODe/nZRDLc05Dd+dzN5+cBISX
	zojBG2Ec38l1mH/L54wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDXy-00000000rcv-2dhV;
	Wed, 11 Feb 2026 16:58:38 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqDXv-00000000rcZ-3De6
	for linux-riscv@lists.infradead.org;
	Wed, 11 Feb 2026 16:58:36 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-354c67da885so3670463a91.3
        for <linux-riscv@lists.infradead.org>; Wed, 11 Feb 2026 08:58:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770829114; x=1771433914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kE8z3yHeIOuK07jc/1qHwHDjrXP9j6jXOYrZ8B0yuFA=;
        b=fAncpqBFplaVMPX1bKei0t89mS+USS+IIvo1J513O7U/m3rYP3YQUgzRyuzsobtFv9
         lLPSkn37Nui20HTgZBNkf0DF6kH7AZtOoSur4T6r6LP007F1KBh5myI3Bzspf831FjWO
         qF2rn0kgJlkV+oH+hj/D2gjEWtBUlLhk96DWuUffjsbD4IosHI5PI7K56yhd1CsYRzZu
         Bg0tItCDskXGdJKOo/xyA/lQE3mCWTFcB8fdxBTrq2O/V2CUCjYWBkxCY6M/3ad7Gzup
         LQFuS4jPKUzZgQ+2TvNPfnCV0/Z7y6C+pg/rzn23FGjCixxJMtP597bbybuuR/EDQKEA
         96bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770829114; x=1771433914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kE8z3yHeIOuK07jc/1qHwHDjrXP9j6jXOYrZ8B0yuFA=;
        b=nARdV5t43vweVBKXibIBAWM1w2eaulrs7YYs6MCJKlfEucQWqgzHkIvQrt2f57PPd0
         vohXBBbs8tD5hxWMfcF/QNce3fhOGLPVmyOV3U6S4h43Uhha0jIHRM1BiPvCqF7dVPfv
         +O9/RGWZsZsc/zMXIPVFsS3/OK+4Ixw1kaP9Ol9VSu/J/lzPmq1luefFFfTd/o+kCHjs
         S8AO2z7czSuUZTK3rUybxjyYpLs5fbntJl4m3hgKKNjOJRXGBMTQMF89XuenIHrzr793
         3Q+kUckjSGQ5D8ElsfGoYX5lfElb3WSCm+QJIpmrekSLeuQHQTK7vFeQmcUXPYBlqdP1
         HdGw==
X-Forwarded-Encrypted: i=1; AJvYcCXGroIS9pEO+38Lp5mVdo8BF3miB9FhGa2TI9CAk0P/jM7V3xy89wC947RsQ0KhzVr/RZeupsRWxWZFaA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBWJsNbfUMwbeIVOfklZoRDHz/ZVryPuh6sJClwPl0uTwF5jZF
	Bhg0/fKdsegid4eKKTi6q5VXtyR4pK8f/0qX9bMlOVrrgh6QAvE1bAdSeI/Wxg==
X-Gm-Gg: AZuq6aLwBFHS4+aoHNAXS6QUDtvbn1BqunOCdb2A14VX4/edj7sxFY+N1GtjNqup2Z0
	yFS48li8hmKt9LdATMOHRtHRhoRPioakTgf4Q1rI1M312TJxFud9Kx1xZUcsL6c66LKbWF80oZ6
	kWA4Cz+cFjc/vRb4wmveiDU/nm/XdpvOx/o2im62H8Qq5aZJQ31B0RIYX4uKmoZBL/ptKhQAM02
	hktp0ri+ExN+Bc6QqFMeyIvOYpsaiuhkHrRy7wzc4ncDf4EeRmlZAE0MRzGJlof1H6nARjRmyw7
	WMWRmf5zle1jm9nH4JUoz2ndDotCiMBrb9etQowo2BVXyxXbYCDS8015f8qw/WyhNdI6E9D6knX
	aw9cMw5dml7mYI0WAzlp2itJN8CFeQ0Hu1GXCHYIs3s/BwSj004uOiTaJ7ZWA59ObQb+NQ/lQmW
	ZVlZrvGr+uSBazNWGOtfP/g1yAtTi9t18A+2lYk0KYLzqIkV7dy1yqQlCwFWoY2hAIZznyTVo=
X-Received: by 2002:a17:90b:54cd:b0:343:f509:aa4a with SMTP id 98e67ed59e1d1-3568f5516famr44747a91.36.1770829114044;
        Wed, 11 Feb 2026 08:58:34 -0800 (PST)
Received: from sean-All-Series.. (1-160-233-226.dynamic-ip.hinet.net. [1.160.233.226])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3567aeb1643sm1781754a91.1.2026.02.11.08.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 08:58:33 -0800 (PST)
From: seanwascoding <seanwascoding@gmail.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Paul Walmsley <pjw@kernel.org>,
	linux-riscv@lists.infradead.org,
	kernel-janitors@vger.kernel.org,
	seanwascoding <seanwascoding@gmail.com>
Subject: [PATCH] riscv: fix various typos in comments and code
Date: Thu, 12 Feb 2026 00:58:27 +0800
Message-Id: <20260211165827.78574-1-seanwascoding@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260211_085835_823995_0C37CC44 
X-CRM114-Status: GOOD (  25.32  )
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

Signed-off-by: seanwascoding <seanwascoding@gmail.com>
---
 arch/riscv/errata/thead/errata.c     | 2 +-
 arch/riscv/include/asm/atomic.h      | 4 ++--
 arch/riscv/include/asm/elf.h         | 2 +-
 arch/riscv/include/asm/processor.h   | 2 +-
 arch/riscv/include/asm/thread_info.h | 2 +-
 arch/riscv/kernel/acpi.c             | 2 +-
 arch/riscv/kernel/ftrace.c           | 2 +-
 arch/riscv/kernel/head.S             | 2 +-
 arch/riscv/kernel/mcount-dyn.S       | 2 +-
 arch/riscv/kernel/module-sections.c  | 2 +-
 arch/riscv/kernel/probes/kprobes.c   | 2 +-
 arch/riscv/kernel/probes/uprobes.c   | 2 +-
 arch/riscv/kernel/soc.c              | 2 +-
 arch/riscv/kernel/suspend.c          | 2 +-
 arch/riscv/kvm/tlb.c                 | 2 +-
 arch/riscv/kvm/vcpu_pmu.c            | 2 +-
 arch/riscv/lib/csum.c                | 2 +-
 arch/riscv/lib/memmove.S             | 4 ++--
 arch/riscv/mm/cacheflush.c           | 2 +-
 arch/riscv/mm/physaddr.c             | 4 ++--
 20 files changed, 23 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index 0b942183f708..6f1c683f0ec0 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -153,7 +153,7 @@ static bool errata_probe_ghostwrite(unsigned int stage,
 	 * target-c9xx cores report arch_id and impid as 0
 	 *
 	 * While ghostwrite may not affect all c9xx cores that implement
-	 * xtheadvector, there is no futher granularity than c9xx. Assume
+	 * xtheadvector, there is no further granularity than c9xx. Assume
 	 * vulnerable for this entire class of processors when xtheadvector is
 	 * enabled.
 	 */
diff --git a/arch/riscv/include/asm/atomic.h b/arch/riscv/include/asm/atomic.h
index 3f33dc54f94b..616b8b332ac5 100644
--- a/arch/riscv/include/asm/atomic.h
+++ b/arch/riscv/include/asm/atomic.h
@@ -46,7 +46,7 @@ static __always_inline void arch_atomic64_set(atomic64_t *v, s64 i)
 #endif
 
 /*
- * First, the atomic ops that have no ordering constraints and therefor don't
+ * First, the atomic ops that have no ordering constraints and therefore don't
  * have the AQ or RL bits set.  These don't return anything, so there's only
  * one version to worry about.
  */
@@ -81,7 +81,7 @@ ATOMIC_OPS(xor, xor,  i)
 
 /*
  * Atomic ops that have ordered, relaxed, acquire, and release variants.
- * There's two flavors of these: the arithmatic ops have both fetch and return
+ * There's two flavors of these: the arithmetic ops have both fetch and return
  * versions, while the logical ops only have fetch versions.
  */
 #define ATOMIC_FETCH_OP(op, asm_op, I, asm_type, c_type, prefix)	\
diff --git a/arch/riscv/include/asm/elf.h b/arch/riscv/include/asm/elf.h
index c7aea7886d22..04bc662cabbb 100644
--- a/arch/riscv/include/asm/elf.h
+++ b/arch/riscv/include/asm/elf.h
@@ -59,7 +59,7 @@ extern bool compat_elf_check_arch(Elf32_Ehdr *hdr);
 #endif
 
 /*
- * Provides information on the availiable set of ISA extensions to userspace,
+ * Provides information on the available set of ISA extensions to userspace,
  * via a bitmap that coorespends to each single-letter ISA extension.  This is
  * essentially defunct, but will remain for compatibility with userspace.
  */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index da5426122d28..c571c276b2e9 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -85,7 +85,7 @@ struct pt_regs;
  *    preempt_v. All preempt_v context should be dropped in such case because
  *    V-regs are caller-saved. Only sstatus.VS=ON is persisted across a
  *    schedule() call.
- *  - bit 30: The in-kernel preempt_v context is saved, and requries to be
+ *  - bit 30: The in-kernel preempt_v context is saved, and requires to be
  *    restored when returning to the context that owns the preempt_v.
  *  - bit 31: The in-kernel preempt_v context is dirty, as signaled by the
  *    trap entry code. Any context switches out-of current task need to save
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 836d80dd2921..e5cc6c0db710 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -117,7 +117,7 @@ int arch_dup_task_struct(struct task_struct *dst, struct task_struct *src);
 #include <asm-generic/thread_info_tif.h>
 
 #define TIF_32BIT			16	/* compat-mode 32bit process */
-#define TIF_RISCV_V_DEFER_RESTORE	17	/* restore Vector before returing to user */
+#define TIF_RISCV_V_DEFER_RESTORE	17	/* restore Vector before returning to user */
 
 #define _TIF_RISCV_V_DEFER_RESTORE	BIT(TIF_RISCV_V_DEFER_RESTORE)
 
diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
index 71698ee11621..26c018ebce03 100644
--- a/arch/riscv/kernel/acpi.c
+++ b/arch/riscv/kernel/acpi.c
@@ -69,7 +69,7 @@ static int __init acpi_fadt_sanity_check(void)
 
 	/*
 	 * FADT is required on riscv; retrieve it to check its presence
-	 * and carry out revision and ACPI HW reduced compliancy tests
+	 * and carry out revision and ACPI HW reduced compliance tests
 	 */
 	status = acpi_get_table(ACPI_SIG_FADT, 0, &table);
 	if (ACPI_FAILURE(status)) {
diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
index 8d18d6727f0f..b430edfb83f4 100644
--- a/arch/riscv/kernel/ftrace.c
+++ b/arch/riscv/kernel/ftrace.c
@@ -148,7 +148,7 @@ int ftrace_make_nop(struct module *mod, struct dyn_ftrace *rec, unsigned long ad
 
 /*
  * This is called early on, and isn't wrapped by
- * ftrace_arch_code_modify_{prepare,post_process}() and therefor doesn't hold
+ * ftrace_arch_code_modify_{prepare,post_process}() and therefore doesn't hold
  * text_mutex, which triggers a lockdep failure.  SMP isn't running so we could
  * just directly poke the text, but it's simpler to just take the lock
  * ourselves.
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..d7debc6a5e70 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -80,7 +80,7 @@ relocate_enable_mmu:
 	sub a1, a1, a2
 	add ra, ra, a1
 
-	/* Point stvec to virtual address of intruction after satp write */
+	/* Point stvec to virtual address of instruction after satp write */
 	la a2, 1f
 	add a2, a2, a1
 	csrw CSR_TVEC, a2
diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 48f6c4f7dca0..082fe0b0e3c0 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -66,7 +66,7 @@
 * 8(sp) stores the function return address (i.e. parent IP) that
 * can be accessed by &(fregs)->ra in tracing function.
 *
-* The other regs are saved at the respective localtion and accessed
+* The other regs are saved at the respective location and accessed
 * by the respective ftrace_regs member.
 *
 * Here is the layout of stack for your reference.
diff --git a/arch/riscv/kernel/module-sections.c b/arch/riscv/kernel/module-sections.c
index 1675cbad8619..98eaac6f6606 100644
--- a/arch/riscv/kernel/module-sections.c
+++ b/arch/riscv/kernel/module-sections.c
@@ -148,7 +148,7 @@ int module_frob_arch_sections(Elf_Ehdr *ehdr, Elf_Shdr *sechdrs,
 		return -ENOEXEC;
 	}
 
-	/* Calculate the maxinum number of entries */
+	/* Calculate the maximum number of entries */
 	for (i = 0; i < ehdr->e_shnum; i++) {
 		size_t num_relas = sechdrs[i].sh_size / sizeof(Elf_Rela);
 		Elf_Rela *relas = (void *)ehdr + sechdrs[i].sh_offset;
diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
index 8723390c7cad..9e2afabf94e8 100644
--- a/arch/riscv/kernel/probes/kprobes.c
+++ b/arch/riscv/kernel/probes/kprobes.c
@@ -149,7 +149,7 @@ static void __kprobes set_current_kprobe(struct kprobe *p)
 
 /*
  * Interrupts need to be disabled before single-step mode is set, and not
- * reenabled until after single-step mode ends.
+ * re-enabled until after single-step mode ends.
  * Without disabling interrupt on local CPU, there is a chance of
  * interrupt occurrence in the period of exception return and  start of
  * out-of-line single-step, that result in wrongly single stepping
diff --git a/arch/riscv/kernel/probes/uprobes.c b/arch/riscv/kernel/probes/uprobes.c
index f0d0691a8688..eb177d0ce8ab 100644
--- a/arch/riscv/kernel/probes/uprobes.c
+++ b/arch/riscv/kernel/probes/uprobes.c
@@ -111,7 +111,7 @@ void arch_uprobe_abort_xol(struct arch_uprobe *auprobe, struct pt_regs *regs)
 
 	current->thread.bad_cause = utask->autask.saved_cause;
 	/*
-	 * Task has received a fatal signal, so reset back to probbed
+	 * Task has received a fatal signal, so reset back to probed
 	 * address.
 	 */
 	instruction_pointer_set(regs, utask->vaddr);
diff --git a/arch/riscv/kernel/soc.c b/arch/riscv/kernel/soc.c
index a0516172a33c..7d69e3b6bab4 100644
--- a/arch/riscv/kernel/soc.c
+++ b/arch/riscv/kernel/soc.c
@@ -8,7 +8,7 @@
 #include <asm/soc.h>
 
 /*
- * This is called extremly early, before parse_dtb(), to allow initializing
+ * This is called extremely early, before parse_dtb(), to allow initializing
  * SoC hardware before memory or any device driver initialization.
  */
 void __init soc_early_init(void)
diff --git a/arch/riscv/kernel/suspend.c b/arch/riscv/kernel/suspend.c
index aff93090c4ef..3efbf7874f3b 100644
--- a/arch/riscv/kernel/suspend.c
+++ b/arch/riscv/kernel/suspend.c
@@ -78,7 +78,7 @@ int cpu_suspend(unsigned long arg,
 	suspend_save_csrs(&context);
 
 	/*
-	 * Function graph tracer state gets incosistent when the kernel
+	 * Function graph tracer state gets inconsistent when the kernel
 	 * calls functions that never return (aka finishers) hence disable
 	 * graph tracing during their execution.
 	 */
diff --git a/arch/riscv/kvm/tlb.c b/arch/riscv/kvm/tlb.c
index ff1aeac4eb8e..e44f3ebe3844 100644
--- a/arch/riscv/kvm/tlb.c
+++ b/arch/riscv/kvm/tlb.c
@@ -182,7 +182,7 @@ void kvm_riscv_local_tlb_sanitize(struct kvm_vcpu *vcpu)
 
 	/*
 	 * Flush VS-stage TLB entries for implementation where VS-stage
-	 * TLB does not cahce guest physical address and VMID.
+	 * TLB does not cache guest physical address and VMID.
 	 */
 	if (static_branch_unlikely(&kvm_riscv_vsstage_tlb_no_gpa))
 		kvm_riscv_local_hfence_vvma_all(vmid);
diff --git a/arch/riscv/kvm/vcpu_pmu.c b/arch/riscv/kvm/vcpu_pmu.c
index a2fae70ee174..ebff438a725f 100644
--- a/arch/riscv/kvm/vcpu_pmu.c
+++ b/arch/riscv/kvm/vcpu_pmu.c
@@ -671,7 +671,7 @@ int kvm_riscv_vcpu_pmu_ctr_stop(struct kvm_vcpu *vcpu, unsigned long ctr_base,
 				pmc->counter_val += perf_event_read_value(pmc->perf_event,
 									  &enabled, &running);
 			/*
-			 * The counter and overflow indicies in the snapshot region are w.r.to
+			 * The counter and overflow indices in the snapshot region are w.r.to
 			 * cbase. Modify the set bit in the counter mask instead of the pmc_index
 			 * which indicates the absolute counter index.
 			 */
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 75bd0abffd63..5d4379768e5d 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -269,7 +269,7 @@ unsigned int do_csum(const unsigned char *buff, int len)
 	 * on machines with fast misaligned accesses.
 	 *
 	 * There is some duplicate code between the "with_alignment" and
-	 * "no_alignment" implmentations, but the overlap is too awkward to be
+	 * "no_alignment" implementations, but the overlap is too awkward to be
 	 * able to fit in one function without introducing multiple static
 	 * branches. The largest chunk of overlap was delegated into the
 	 * do_csum_common function.
diff --git a/arch/riscv/lib/memmove.S b/arch/riscv/lib/memmove.S
index cb3e2e7ef0ba..410e598d4677 100644
--- a/arch/riscv/lib/memmove.S
+++ b/arch/riscv/lib/memmove.S
@@ -40,8 +40,8 @@ SYM_FUNC_START(__memmove)
 	 *   Both Copy Modes: t1 - Temporary for load-store
 	 *   Both Copy Modes: t2 - Temporary for load-store
 	 *   Both Copy Modes: a5 - dest to src alignment offset
-	 *   Both Copy Modes: a6 - Shift ammount
-	 *   Both Copy Modes: a7 - Inverse Shift ammount
+	 *   Both Copy Modes: a6 - Shift amount
+	 *   Both Copy Modes: a7 - Inverse Shift amount
 	 *   Both Copy Modes: a2 - Alternate breakpoint for unrolled loops
 	 */
 
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index d83a612464f6..f8ead7cb7c7d 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -29,7 +29,7 @@ void flush_icache_all(void)
 	 * Make sure all previous writes to the D$ are ordered before making
 	 * the IPI. The RISC-V spec states that a hart must execute a data fence
 	 * before triggering a remote fence.i in order to make the modification
-	 * visable for remote harts.
+	 * visible for remote harts.
 	 *
 	 * IPIs on RISC-V are triggered by MMIO writes to either CLINT or
 	 * S-IMSIC, so the fence ensures previous data writes "happen before"
diff --git a/arch/riscv/mm/physaddr.c b/arch/riscv/mm/physaddr.c
index 559d291fac5c..b1836e9481ce 100644
--- a/arch/riscv/mm/physaddr.c
+++ b/arch/riscv/mm/physaddr.c
@@ -9,7 +9,7 @@
 phys_addr_t __virt_to_phys(unsigned long x)
 {
 	/*
-	 * Boundary checking aginst the kernel linear mapping space.
+	 * Boundary checking against the kernel linear mapping space.
 	 */
 	WARN(!is_linear_mapping(x) && !is_kernel_mapping(x),
 	     "virt_to_phys used for non-linear address: %p (%pS)\n",
@@ -25,7 +25,7 @@ phys_addr_t __phys_addr_symbol(unsigned long x)
 	unsigned long kernel_end = kernel_start + kernel_map.size;
 
 	/*
-	 * Boundary checking aginst the kernel image mapping.
+	 * Boundary checking against the kernel image mapping.
 	 * __pa_symbol should only be used on kernel symbol addresses.
 	 */
 	VIRTUAL_BUG_ON(x < kernel_start || x > kernel_end);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
