Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23876C433EF
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Dec 2021 00:21:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CBaKUKH1s7hwS+xnty6Sai3p8YNC8yNihvG+AYpqQJw=; b=gRbTrUhUujBTEI
	XJYnd4wTWFE6GholyLLc6Hg9YsAoq6sVsZ9iiZk/7o2uYAZrshYayUTxiHViVkcOCYPrT0CrMkNRO
	I7WcJDghdND7lLjYg13Ke3yGzqhFPQPzrOMvTjPyVOoFUoSIAK6kbfVp+CZyPg0ecESJSPb7oyx2n
	IXKlGekCi7D2SMYIiADP9R86T59hgY6JZQNnRIST4FJtFHJ1bR8XQVXPRdlYEze5lakk+ZU3mjEIg
	yxZIOJIq0ciBl7gKe0v9tARLeBjugXfN/jjGAQn4Nf9I0J4VWIxBMUq2mdkyVtrdnO1Qn2L6XUTqY
	vFFawLwVtdaImbimsbog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mtInm-00HI6H-3P; Sat, 04 Dec 2021 00:21:18 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mtInN-00HHm0-Nl
 for linux-riscv@lists.infradead.org; Sat, 04 Dec 2021 00:20:57 +0000
Received: by mail-pj1-x102c.google.com with SMTP id
 np6-20020a17090b4c4600b001a90b011e06so3808683pjb.5
 for <linux-riscv@lists.infradead.org>; Fri, 03 Dec 2021 16:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=atishpatra.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+YAC9Q+O81lgWpIZRBdTsLYa3VZSjLSTHyZBTCrDB8A=;
 b=hb4KJdb7yRVYC/pXy8YUvYRFsh38xgMwhr67k1ler80mqTkIi3j5UoO1RIvfAKEzoE
 jnkSh3Wk58iYg1J3XoyoM9a1h4S1ZMqarTn/mKDsqYRZ7PsJtGOFuW7lgHBCFKkw5Cpn
 d53I+aqk2Qwu4WobbnYSXyU1oFxuVNfFCq0CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+YAC9Q+O81lgWpIZRBdTsLYa3VZSjLSTHyZBTCrDB8A=;
 b=MZ/aghs1gQbloYm9u4G8GD26ip3VAlEWfwofZatXs+WCuqEs7tZ6RfYFmr2GaiM5hN
 hVB6Xe3pRzRmHe9AdFKpq3xzgc+s7qWk34pmOoczr1C9RQFQLyHSIEA1oufCud1uChIZ
 QGLL6T+V5uEAdaBYenROcic42r3vcsXP87cCdJyjlnyuQsI1Oaec0j/9xQjNusDRrsWH
 EG0qBIeNF0jNEZfpwDLOeB4J0qwKiL1Uc4d1i0E/wNb6M4YMR6BN3VHSQkId86LI/5zu
 AYtptKLnie5FcxTWbGQ0FzWmqEc2BlkBCba7qZZsKxK+o4NZnS3g1K9O2x5Yl7HrPGT0
 btXw==
X-Gm-Message-State: AOAM533+9pWXysb2b32K/NyLzc12RAx1wixicBAYj0xsiwn3E3I7e9Uc
 sR9l0MGy9KFB/qOi0Zbs+r/T
X-Google-Smtp-Source: ABdhPJxJh/HwKmFYz9F/PzaJZ81PsP9Mcg/8H8dRSXCfe1CEwAcvACPBqoI/spbS097GIwfyDLiuQQ==
X-Received: by 2002:a17:902:bd87:b0:143:c6e8:4110 with SMTP id
 q7-20020a170902bd8700b00143c6e84110mr26434795pls.23.1638577252838; 
 Fri, 03 Dec 2021 16:20:52 -0800 (PST)
Received: from fedora.ba.rivosinc.com
 (99-13-229-45.lightspeed.snjsca.sbcglobal.net. [99.13.229.45])
 by smtp.gmail.com with ESMTPSA id r6sm3272402pjg.21.2021.12.03.16.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Dec 2021 16:20:52 -0800 (PST)
From: Atish Patra <atishp@atishpatra.org>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>, Alexandre Ghiti <alex@ghiti.fr>,
 Anup Patel <anup.patel@wdc.com>, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Ingo Molnar <mingo@kernel.org>,
 Jisheng Zhang <jszhang@kernel.org>, kvm-riscv@lists.infradead.org,
 kvm@vger.kernel.org, linux-riscv@lists.infradead.org,
 Marc Zyngier <maz@kernel.org>, Nanyong Sun <sunnanyong@huawei.com>,
 Nick Kossifidis <mick@ics.forth.gr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Pekka Enberg <penberg@kernel.org>, Vincent Chen <vincent.chen@sifive.com>,
 Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [RFC 1/6] RISC-V: Avoid using per cpu array for ordered booting
Date: Fri,  3 Dec 2021 16:20:33 -0800
Message-Id: <20211204002038.113653-2-atishp@atishpatra.org>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211204002038.113653-1-atishp@atishpatra.org>
References: <20211204002038.113653-1-atishp@atishpatra.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211203_162053_863720_A81832D5 
X-CRM114-Status: GOOD (  16.92  )
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

From: Atish Patra <atishp@rivosinc.com>

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
 arch/riscv/include/asm/cpu_ops_sbi.h | 28 ++++++++++++++++++++++++++++
 arch/riscv/kernel/cpu_ops_sbi.c      | 23 ++++++++++++++++++++---
 arch/riscv/kernel/head.S             | 19 ++++++++++---------
 3 files changed, 58 insertions(+), 12 deletions(-)
 create mode 100644 arch/riscv/include/asm/cpu_ops_sbi.h

diff --git a/arch/riscv/include/asm/cpu_ops_sbi.h b/arch/riscv/include/asm/cpu_ops_sbi.h
new file mode 100644
index 000000000000..ccb9a6d30486
--- /dev/null
+++ b/arch/riscv/include/asm/cpu_ops_sbi.h
@@ -0,0 +1,28 @@
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
+#define SBI_HART_BOOT_TASK_PTR_OFFSET (0x00)
+#define SBI_HART_BOOT_STACK_PTR_OFFSET RISCV_SZPTR
+
+#endif /* ifndef __ASM_CPU_OPS_H */
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
