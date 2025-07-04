Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91E0AC83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NhNPMwKeyJWMXxJH4DHCrBpj8GcJzkPtV7lT2A166dA=; b=WCWxPGYGpQ9aa1
	L96XThQJ6QYSveKt9JpO3tXXFD3A/0zOYhazE85vADGaEPVdWT1Cvy+P8ck1mf2U5Njgd1GnauJOA
	r2t2hTgs+GectMIxDfTClLVQ/z5utq4TboWEYc+ZDLsNfebBeFQ99OZyS23Qx0izWLpHpBwXzgWJr
	OT31tCMqGuPaaOpWWLYzyWWf2L6Q90fxzLq/FL3KVi4SB54L7KwOfDw3mm4w2oTCEU0AJKiCkpgOI
	nCUSUjE+qxLv3cIUV9rscpzz6PvZIMkBpG5FW4z0tdMHq0SchtelPZqtvfhbtZrmw5TAnQdyItOay
	joATmXOMWRHtuAWK8wMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeUL-0000000ECKc-392o;
	Fri, 04 Jul 2025 11:21:53 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXc2m-0000000Dmcs-45E4
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:45:18 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-7425bd5a83aso826646b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 04 Jul 2025 01:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1751618712; x=1752223512; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=63zu7OUSE7H3LEgq1aY0wKyYCc7q428IAvJH1wbVnOQ=;
        b=igBN3BLTndH6l3jkwlPOILyIWGYoA+VroVw6755HIpVUYggWGToIGJpIunOthFLW++
         AmY5Dn/xio9XIyu2suG/V0Qi1mEE852txtLpu+jfAtb3kF3AlHf0M6D9W372aJt+1kyi
         Tyx3uQ/VFU4RsjSU+cUVE0WuHsZ6TXWAiLz5gE7dwerjFNHu9AiNJvryYdy+RryraWP4
         WUN61scEOZNlgjs9bvco/g/ImgbsmacZNB0ksdM7aEjNVxJSSUdXfyglF4uTegvaspjh
         d/g3ng69IokKTlFVgpQ0Nkfc1WQ/FhQLnmtdUqxLrI1Gb4lqEjA8EWF5pjtEznIGO/WQ
         16UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618712; x=1752223512;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=63zu7OUSE7H3LEgq1aY0wKyYCc7q428IAvJH1wbVnOQ=;
        b=p6ga6H0XPdpNGbfxtZgHZmi7mNOG4OKVnS5HdYSJo2fp9KDWceLrdLDPqbh77pLliD
         uculHgoeqpCCGpyxSw2leXPt8BOetCXHuAMG2uZ9bcnPVd/xi17tvSQz36y/NsHzY8Gj
         d1gfBxw8znx4wBudIAlONrJUI6OEUR9dNHq6J/CfbinTfH4MLJRwDe+71vCb58dIUTDa
         um+QsRLazr6QBA5yo7bvISneV+GYtNrUdDQ8Kc3zWXe23wg8NGRk3GNDWxmA9K6MV3m3
         13xYAOb+q8KbzZGy/oQbhDM4KsNfQdEUpKflWyrtyRk8gsVQvN8BGN94SQnD1cSd9QNk
         qI1g==
X-Forwarded-Encrypted: i=1; AJvYcCUVEH3SUMQ7Uk2TphI3pPLSfHGt2cmLXOF3G/ZNdwFTtsAAfDMccUaCBj0qjyTCfHVaLxc4G5oESiFT5Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YzYXzWnEJm/8GLdTiAg55m53undmsHssA5pWyq5hwoyUmi7uE9x
	PnMTiWepF7xeMFv3TTFMun5V8/4/k1Clt/MjR+uaRmUaHGT/5LkaCuImGbBqWyUHTqU=
X-Gm-Gg: ASbGncsl/2ThOAK90Fb4dKHiVRTBqA0qWkQIVrnW7hfWA357uXwzRgfRq03Dt5akm//
	jTe3k3hUzIXEAZb4We7GlxyDB4c7wUg9HurxSx6sH7DCNMvSZqc88LOMAf4lMgYopkcRQZgxUn1
	w5UrkN5XEzRV/USj7CRdvd3wCVHO3f0Egvqjhd6l66fk5mMpcYQ6VACyTBdr7JgnzVVUdonayux
	h5JRzMwBeYdmA1GA8UdhVnnuLR3PfFOFZh5UToLwc7qZh64q8HSDOH7J/uxrJeEsje+WlKINQTg
	SRO+0HON5QDWrL933Ysh54RdVqcydCIhq1bAuHMiqUq9c/gujA9DREvLZUfdPP9CauLF1Fn9sp0
	QswaiNIVAC9Fh9XYB
X-Google-Smtp-Source: AGHT+IHwfnsSoknuDyaRYIcga1M43ZSFI80Oh8nP0dEX5TdzD+tVrQdta0nFCVUmLLuNum1o9VjWJA==
X-Received: by 2002:a05:6a00:6ca1:b0:74c:efae:ffae with SMTP id d2e1a72fcca58-74cefaf0042mr19469b3a.5.1751618712474;
        Fri, 04 Jul 2025 01:45:12 -0700 (PDT)
Received: from L6YN4KR4K9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74ce35cd066sm1722118b3a.53.2025.07.04.01.45.04
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 04 Jul 2025 01:45:12 -0700 (PDT)
From: Yunhui Cui <cuiyunhui@bytedance.com>
To: masahiroy@kernel.org,
	nathan@kernel.org,
	nicolas.schier@linux.dev,
	dennis@kernel.org,
	tj@kernel.org,
	cl@gentwo.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	andybnac@gmail.com,
	bjorn@rivosinc.com,
	cyrilbur@tenstorrent.com,
	rostedt@goodmis.org,
	puranjay@kernel.org,
	ben.dooks@codethink.co.uk,
	zhangchunyan@iscas.ac.cn,
	ruanjinjie@huawei.com,
	jszhang@kernel.org,
	charlie@rivosinc.com,
	cleger@rivosinc.com,
	antonb@tenstorrent.com,
	ajones@ventanamicro.com,
	debug@rivosinc.com,
	cuiyunhui@bytedance.com,
	haibo1.xu@intel.com,
	samuel.holland@sifive.com,
	linux-kbuild@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH RFC] RISC-V: Fix a register to store the percpu offset
Date: Fri,  4 Jul 2025 16:45:00 +0800
Message-Id: <20250704084500.62688-1-cuiyunhui@bytedance.com>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_014517_260459_3EB76227 
X-CRM114-Status: GOOD (  15.44  )
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

The following data was collected from tests conducted on the
Spacemit(R) X60 using the fixed register method:

No modifications:
6.77, 6.791, 6.792, 6.826, 6.784, 6.839, 6.776, 6.733, 6.795, 6.763
Average: 6.786839305

ffix-x27:
7.106, 7.035, 7.362, 7.141, 7.096, 7.182, 7.109, 7.126, 7.186, 7.12
Average: 7.145826539

ffix-x27 + x27(s11) used for offset optimization:
7.059, 6.951, 6.961, 6.985, 6.93, 6.964, 6.977, 6.907, 6.983, 6.944
Average: 6.965993173

Analysis:
The fixed register method reduced performance by 5.29%.
The per-CPU offset optimization improved performance by 2.52%.

Issues with the fixed register method (beyond code size):
Performance degradation due to the loss of one general-purpose register.
Each handle_exception() call requires loading the per-CPU offset into the
fixed register.

Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
---
 Makefile                        |  4 ++--
 arch/riscv/include/asm/percpu.h | 22 ++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c |  1 +
 arch/riscv/kernel/entry.S       | 11 +++++++++--
 arch/riscv/kernel/smpboot.c     |  3 +++
 5 files changed, 37 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/include/asm/percpu.h

diff --git a/Makefile b/Makefile
index b7d5f2f0def0..e291f865adc4 100644
--- a/Makefile
+++ b/Makefile
@@ -1026,8 +1026,8 @@ include $(addprefix $(srctree)/, $(include-y))
 
 # Add user supplied CPPFLAGS, AFLAGS, CFLAGS and RUSTFLAGS as the last assignments
 KBUILD_CPPFLAGS += $(KCPPFLAGS)
-KBUILD_AFLAGS   += $(KAFLAGS)
-KBUILD_CFLAGS   += $(KCFLAGS)
+KBUILD_AFLAGS   += $(KAFLAGS) -ffixed-x27
+KBUILD_CFLAGS   += $(KCFLAGS) -ffixed-x27
 KBUILD_RUSTFLAGS += $(KRUSTFLAGS)
 
 KBUILD_LDFLAGS_MODULE += --build-id=sha1
diff --git a/arch/riscv/include/asm/percpu.h b/arch/riscv/include/asm/percpu.h
new file mode 100644
index 000000000000..5d6b109cfab7
--- /dev/null
+++ b/arch/riscv/include/asm/percpu.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_PERCPU_H
+#define __ASM_PERCPU_H
+
+static inline void set_my_cpu_offset(unsigned long off)
+{
+	asm volatile("addi s11, %0, 0" :: "r" (off));
+}
+
+static inline unsigned long __kern_my_cpu_offset(void)
+{
+	unsigned long off;
+	asm ("mv %0, s11" :"=r" (off) :);
+	return off;
+}
+
+#define __my_cpu_offset __kern_my_cpu_offset()
+
+#include <asm-generic/percpu.h>
+
+#endif
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index a03129f40c46..0ce96f30bf32 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -35,6 +35,7 @@ void asm_offsets(void)
 	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
 	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
 	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
+	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
 	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
 	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
 	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 9d1a305d5508..529d6576265e 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -77,6 +77,13 @@ SYM_CODE_START(handle_exception)
 	 */
 	csrw CSR_SCRATCH, x0
 
+	/* load __per_cpu_offset[cpu] to s11*/
+	REG_L t6, TASK_TI_CPU(tp)
+	slli t6, t6, 3
+	la s11, __per_cpu_offset
+	add s11, s11, t6
+	REG_L s11, 0(s11)
+
 	/* Load the global pointer */
 	load_global_pointer
 
@@ -298,7 +305,7 @@ SYM_FUNC_START(__switch_to)
 	REG_S s8,  TASK_THREAD_S8_RA(a3)
 	REG_S s9,  TASK_THREAD_S9_RA(a3)
 	REG_S s10, TASK_THREAD_S10_RA(a3)
-	REG_S s11, TASK_THREAD_S11_RA(a3)
+	/* REG_S s11, TASK_THREAD_S11_RA(a3) */
 	/* Save the kernel shadow call stack pointer */
 	scs_save_current
 	/* Restore context from next->thread */
@@ -315,7 +322,7 @@ SYM_FUNC_START(__switch_to)
 	REG_L s8,  TASK_THREAD_S8_RA(a4)
 	REG_L s9,  TASK_THREAD_S9_RA(a4)
 	REG_L s10, TASK_THREAD_S10_RA(a4)
-	REG_L s11, TASK_THREAD_S11_RA(a4)
+	/* REG_L s11, TASK_THREAD_S11_RA(a4) */
 	/* The offset of thread_info in task_struct is zero. */
 	move tp, a1
 	/* Switch to the next shadow call stack */
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index fb6ab7f8bfbd..6fa12cc84523 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -43,6 +43,7 @@ static DECLARE_COMPLETION(cpu_running);
 
 void __init smp_prepare_boot_cpu(void)
 {
+	set_my_cpu_offset(per_cpu_offset(smp_processor_id()));
 }
 
 void __init smp_prepare_cpus(unsigned int max_cpus)
@@ -240,6 +241,8 @@ asmlinkage __visible void smp_callin(void)
 	mmgrab(mm);
 	current->active_mm = mm;
 
+	set_my_cpu_offset(per_cpu_offset(curr_cpuid));
+
 	store_cpu_topology(curr_cpuid);
 	notify_cpu_starting(curr_cpuid);
 
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
