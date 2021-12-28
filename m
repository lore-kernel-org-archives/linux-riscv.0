Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D5FBC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 22:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QO+a0EnfgCifSMjacfLweA2+lg8L56Azf20vage1Xlw=; b=YZ1OVtfkI61OHw
	prM7xOOW80dnZv1c8bzVs7BcUqpwtUP2W8/pF8B9d34B3s9vnYTDDvVqFPlYEwvhVVXntEPoDrIyb
	wh3IgStK5JvC0cSpU/0IQ5M93DHX7aOKLyNorDM/OKAk0w7na0U0NQ1oRm2iTGv+0tZ17ZddjIcMc
	1KrJFqXnsMO49xekUY69HJan/DYw3UgwN1brXTii55cw5gW8hQEUgWyqz/fp3aIkiNG/ZY7iTNnmk
	RpypxcMIam24pAfyGbN05aafS3u7WkGBbVNyQqfGS6hATNpOaOq9MpiMRKH/vnVX422q96q00Lypq
	C2YaeDrmxNNSG8LzpJbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n2Kzv-001vCO-1z; Tue, 28 Dec 2021 22:31:11 +0000
Received: from mail-qv1-xf29.google.com ([2607:f8b0:4864:20::f29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n2Kzo-001v9O-Jn
 for linux-riscv@lists.infradead.org; Tue, 28 Dec 2021 22:31:08 +0000
Received: by mail-qv1-xf29.google.com with SMTP id fq10so17613512qvb.10
 for <linux-riscv@lists.infradead.org>; Tue, 28 Dec 2021 14:31:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=YZjcQncsl/Fm2AdsTNC7FL4vyo82VuLFubZsDwMSskQ=;
 b=T71vJN6MUcSaElSUjsHnCqKrNq4sFars5Ly0wiGN/3YxxbWqoXO81RW1RVe52DBE+D
 qF1+6S1DgyC6yMvdeVVmwkQtCSFJjwKwD5fn6au7FPiDVWfoeBm8FJnSJ7/KGVyo6nCU
 pcY947w0CiFEV7Aty5ibfS4TcRy2YLOcVFauc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=YZjcQncsl/Fm2AdsTNC7FL4vyo82VuLFubZsDwMSskQ=;
 b=ucEyoaCzxHYgWaLiVBlzt2beUfMFr3G/2LpsEw0jZLiYIrWSVtBCpvo4qRJcJjGJWk
 oZxXxv799AvA3zK/zpE43Eo9sXjKomFc9eFyP6IOj/ilVARtwddmIBSPorzUwI7kybeR
 KF3fK6Z2XP5iKYTCOAOFgIqJECXnznpWwuTKWqvMTuUZYqmbVcbMLRCOoix7M7y+PwKB
 aLXC9JUoEl+UE34tdHr0RLkkwalX6OR/UH1lWuE3ZuitDv1jJ7JMLDQLzTER8gmX+7lc
 SoGU9utv454amjeyDNiBKgQN+YD0J10JPL4JVuGMunAECgqxZKYRd5QRUMhYkXl4Ta3S
 ghqQ==
X-Gm-Message-State: AOAM533xNESg5SqKy5nfCKe1KWSvvr8jNE43ncQy5EQum4vaAiiXsMUy
 RWSZ8Fxo9OLJnWiaXN+exumY
X-Google-Smtp-Source: ABdhPJzIipRG6e8D96A6nebFdXAyEQR4b2fxvxwk0mUcKP0RHTytvCX4RrrrlEKp/hIpOIAdfK8M4g==
X-Received: by 2002:a05:6214:c4a:: with SMTP id
 r10mr18474676qvj.62.1640730663602; 
 Tue, 28 Dec 2021 14:31:03 -0800 (PST)
Received: from fedora.. (adsl-70-228-75-190.dsl.akrnoh.ameritech.net.
 [70.228.75.190])
 by smtp.gmail.com with ESMTPSA id i5sm2738407qti.27.2021.12.28.14.31.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Dec 2021 14:31:03 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
X-Google-Original-From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@atishpatra.org>, Anup Patel <anup@brainfault.org>,
 Damien Le Moal <damien.lemoal@wdc.com>, devicetree@vger.kernel.org,
 Jisheng Zhang <jszhang@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>
Subject: [PATCH v2 1/6] RISC-V: Avoid using per cpu array for ordered booting
Date: Tue, 28 Dec 2021 14:30:52 -0800
Message-Id: <20211228223057.2772727-2-atishp@rivosinc.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211228223057.2772727-1-atishp@rivosinc.com>
References: <20211228223057.2772727-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211228_143104_675993_3E46E225 
X-CRM114-Status: GOOD (  17.83  )
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

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/cpu_ops_sbi.h | 25 +++++++++++++++++++++++++
 arch/riscv/kernel/asm-offsets.c      |  3 +++
 arch/riscv/kernel/cpu_ops_sbi.c      | 23 ++++++++++++++++++++---
 arch/riscv/kernel/head.S             | 19 ++++++++++---------
 4 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
new file mode 100644
index 000000000000..90e2219f5eec
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
+#endif /* ifndef __ASM_CPU_OPS_H */
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
index 685fae72b7f5..2e7a9dd9c2a7 100644
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
+ * be invoked from multiple threads in paralle. Define a per cpu data
+ * to handle that.
+ */
+DEFINE_PER_CPU(struct sbi_hart_boot_data, boot_data);
+
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
 {
@@ -58,9 +67,17 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	int rc;
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
 	int hartid = cpuid_to_hartid_map(cpuid);
-
-	cpu_update_secondary_bootdata(cpuid, tidle);
-	rc = sbi_hsm_hart_start(hartid, boot_addr, 0);
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
+	rc = sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
 
 	return rc;
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f52f01ecbeea..40d4c625513c 100644
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
 
 	.global secondary_start_common
 secondary_start_common:
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
