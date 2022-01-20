Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEDECC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jan 2022 09:10:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KRvlB+wJkMcR1sFlen7THYriOBbx0zvHOrNl7HaB3bg=; b=CobtIkPcjFJA+S
	Ioos5hI9c+02hveJ2WpNcOXsZhrDDCSv08D8RrVyFQH1fzBbWrbktw9J6MJ6aOc73zZk/mysWlCT2
	/4BhFcyJg3SsjYa9l1wi2MnkgPFalIcieL4/XdZ0ivbUrtvFg/nIXu8JTufstUYtHEUbBPQCj/M2r
	fuRAUIUovyi8pvMyFBFSbAZQ8uwTQ9NAYLicG+aY1IJKIA3MvaU+3N0ZKjWq8RZ4yRC3Jl9yTKPgl
	cr1JBqEYwABELHs5PHqfCf9gZSgWI2GZdyJDUOn9R3+Dab8shg/0zcAk3iwXTSTOqqvSU99ZJ6hog
	q3K5pR2ec7xgFYPRsXdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nATSf-00A5iQ-8v; Thu, 20 Jan 2022 09:10:29 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nATSb-00A5eL-LC
 for linux-riscv@lists.infradead.org; Thu, 20 Jan 2022 09:10:27 +0000
Received: by mail-oo1-xc34.google.com with SMTP id
 b20-20020a4a3414000000b002dda566aba7so1582840ooa.13
 for <linux-riscv@lists.infradead.org>; Thu, 20 Jan 2022 01:10:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=rivosinc-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NJk4b/xcyk8TbILg9v6pKfeA3aW2zvFe/CieAccUwMI=;
 b=fh88Ka60uxDGZBv3RVD38dibfyHiDAZh9d5wb+FyltxAlj3cs58CLnVLvzNOsz+/4i
 JxHczDEyZVzjXRzm8jpNJcSOZVVxINLxu1iFp+TDV1fYFt51cjZ8XsRAAKhev84nL5tE
 SA5eHNRvvHfkdQpUsjlK3tNt0gnPKQuqGdLBrZBWBQz9Aleri+IVaGcs9ZPynANehceY
 QOHz2/5bZh09eEGpAcizKNQlTYvVxEMbg3SvivjZbIKBMJUdKHzfQnDpv9wxF0TxKYbC
 5gOwHAazjOWcw7ald0zkWDN7VNR90Uh3Hfx2i/HZPZZGcU2sZbGdIaYGhjb1EYHRkFDd
 +sew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NJk4b/xcyk8TbILg9v6pKfeA3aW2zvFe/CieAccUwMI=;
 b=4Mlef1Ee4kz9OE5FDXNA0ZLfuVLyZwrR44pih8wY/VglSJH13wPjJgbKogUywwKGyt
 H+9QZtQRhtn5vcSMR2ucvI8KJcDruwu5JFk+os8/cojt9vshd26aqg332l2zkOCnHzcf
 2xfg7A11WkcSf5iE2+cO90+k/M5ZkkRcQgXXKtlztFgl586fSZk5+k90tRnjOLGSaRpR
 fLQ7jAGpRAo1ixkAFtz7Obuejd71eEtxs6NETl1iSq7mPSEPpWkO25ufQAob+dh/Ae4l
 g660xsm7GT1AxJp2voogIUZPmKmowxIuQrHH2O3VsmxOpzzsd/O7qiGUTmt0KP0JLP9A
 STvg==
X-Gm-Message-State: AOAM533b/U3jNeCLEdSHeSKdtHH4TaZluM7SMXpvJ8p5COhSYpqV+Liw
 QBeQaJFAe8S/EXdA0Yk6vLueiA==
X-Google-Smtp-Source: ABdhPJwOz9PXJtwwxTmokIldnLFwjMci0CGdx8265e/x8c9VWrTlaHf56di+59tuuWDe+6kxLvN6WA==
X-Received: by 2002:a4a:374c:: with SMTP id r73mr19369221oor.68.1642669823177; 
 Thu, 20 Jan 2022 01:10:23 -0800 (PST)
Received: from rivos-atish.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i12sm944766oot.25.2022.01.20.01.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jan 2022 01:10:22 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Anup Patel <anup@brainfault.org>,
 Albert Ou <aou@eecs.berkeley.edu>, Atish Patra <atishp@atishpatra.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v3 1/6] RISC-V: Avoid using per cpu array for ordered booting
Date: Thu, 20 Jan 2022 01:09:13 -0800
Message-Id: <20220120090918.2646626-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220120090918.2646626-1-atishp@rivosinc.com>
References: <20220120090918.2646626-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220120_011025_746314_534400D9 
X-CRM114-Status: GOOD (  18.44  )
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

Currently both order booting and spinwait approach uses a per cpu
array to update stack & task pointer. This approach will not work for the
following cases.
1. If NR_CPUs are configured to be less than highest hart id.
2. A platform has sparse hartid.

This issue can be fixed for ordered booting as the booting cpu brings up
one cpu at a time using SBI HSM extension which has opaque parameter
that is unused until now.

Introduce a common secondary boot data structure that can store the stack
and task pointer. Secondary harts will use this data while booting up
to setup the sp & tp.

Reviewed-by: Anup Patel <anup@brainfault.org>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/cpu_ops_sbi.h | 25 +++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  3 +++
 arch/riscv/kernel/cpu_ops_sbi.c      | 26 ++++++++++++++++++++------
 arch/riscv/kernel/head.S             | 19 ++++++++++---------
 4 files changed, 58 insertions(+), 15 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
new file mode 100644
index 000000000000..56e4b76d09ff
--- /dev/null
+++ b/arch/riscv/include/asm/cpu_ops_sbi.h
@@ -0,0 +1,25 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) 2021 by Rivos Inc.
+ */
+#ifndef __ASM_CPU_OPS_SBI_H
+#define __ASM_CPU_OPS_SBI_H
+
+#ifndef __ASSEMBLY__
+#include <linux/init.h>
+#include <linux/sched.h>
+#include <linux/threads.h>
+
+/**
+ * struct sbi_hart_boot_data - Hart specific boot used during booting and
+ *			       cpu hotplug.
+ * @task_ptr: A pointer to the hart specific tp
+ * @stack_ptr: A pointer to the hart specific sp
+ */
+struct sbi_hart_boot_data {
+	void *task_ptr;
+	void *stack_ptr;
+};
+#endif
+
+#endif /* ifndef __ASM_CPU_OPS_SBI_H */
diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 253126e4beef..df0519a64eaf 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -12,6 +12,7 @@
 #include <asm/kvm_host.h>
 #include <asm/thread_info.h>
 #include <asm/ptrace.h>
+#include <asm/cpu_ops_sbi.h>
 
 void asm_offsets(void);
 
@@ -468,4 +469,6 @@ void asm_offsets(void)
 	DEFINE(PT_SIZE_ON_STACK, ALIGN(sizeof(struct pt_regs), STACK_ALIGN));
 
 	OFFSET(KERNEL_MAP_VIRT_ADDR, kernel_mapping, virt_addr);
+	OFFSET(SBI_HART_BOOT_TASK_PTR_OFFSET, sbi_hart_boot_data, task_ptr);
+	OFFSET(SBI_HART_BOOT_STACK_PTR_OFFSET, sbi_hart_boot_data, stack_ptr);
 }
diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index 685fae72b7f5..dae29cbfe550 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -7,13 +7,22 @@
 
 #include <linux/init.h>
 #include <linux/mm.h>
+#include <linux/sched/task_stack.h>
 #include <asm/cpu_ops.h>
+#include <asm/cpu_ops_sbi.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
 
 extern char secondary_start_sbi[];
 const struct cpu_operations cpu_ops_sbi;
 
+/*
+ * Ordered booting via HSM brings one cpu at a time. However, cpu hotplug can
+ * be invoked from multiple threads in parallel. Define a per cpu data
+ * to handle that.
+ */
+DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
+
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
 {
@@ -55,14 +64,19 @@ static int sbi_hsm_hart_get_status(unsigned long hartid)
 
 static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 {
-	int rc;
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
 	int hartid = cpuid_to_hartid_map(cpuid);
-
-	cpu_update_secondary_bootdata(cpuid, tidle);
-	rc = sbi_hsm_hart_start(hartid, boot_addr, 0);
-
-	return rc;
+	unsigned long hsm_data;
+	struct sbi_hart_boot_data *bdata = &per_cpu(boot_data, cpuid);
+
+	/* Make sure tidle is updated */
+	smp_mb();
+	bdata->task_ptr = tidle;
+	bdata->stack_ptr = task_stack_page(tidle) + THREAD_SIZE;
+	/* Make sure boot data is updated */
+	smp_mb();
+	hsm_data = __pa(bdata);
+	return sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
 }
 
 static int sbi_cpu_prepare(unsigned int cpuid)
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 604d60292dd8..bc24a90ede1c 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -11,6 +11,7 @@
 #include <asm/page.h>
 #include <asm/pgtable.h>
 #include <asm/csr.h>
+#include <asm/cpu_ops_sbi.h>
 #include <asm/hwcap.h>
 #include <asm/image.h>
 #include "efi-header.S"
@@ -167,15 +168,15 @@ secondary_start_sbi:
 	la a3, .Lsecondary_park
 	csrw CSR_TVEC, a3
 
-	slli a3, a0, LGREG
-	la a4, __cpu_up_stack_pointer
-	XIP_FIXUP_OFFSET a4
-	la a5, __cpu_up_task_pointer
-	XIP_FIXUP_OFFSET a5
-	add a4, a3, a4
-	add a5, a3, a5
-	REG_L sp, (a4)
-	REG_L tp, (a5)
+	/* a0 contains the hartid & a1 contains boot data */
+	li a2, SBI_HART_BOOT_TASK_PTR_OFFSET
+	XIP_FIXUP_OFFSET a2
+	add a2, a2, a1
+	REG_L tp, (a2)
+	li a3, SBI_HART_BOOT_STACK_PTR_OFFSET
+	XIP_FIXUP_OFFSET a3
+	add a3, a3, a1
+	REG_L sp, (a3)
 
 .Lsecondary_start_common:
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
