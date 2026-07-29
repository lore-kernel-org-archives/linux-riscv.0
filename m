Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FD05C54F51
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Jul 2026 08:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vYqrO0N5UnpyKDAHolIeGAsWnG5IDRcoxzHyqRibk5U=; b=3ezmF2up0iZ0sx
	CeGdktEEmeZaGMLqyN6gyrwz/4p8vdnBM5DXAR+HQ9LUyc5/v0XVrXhK05Q70eqNvPzAWJvlXdPNK
	B4x1R3lyZV66hvg68Tjg/IyfBsmzXRJbN2njfBJiKtuQ78EOpwlkCwVXeJOipUjvedWU5R9pNlThK
	ceeg5IzNkSyCxezBUQBbenP6S3SrPMuFd4mHPpxZV0Kbcatr6g5KaWaugPrwWj92PGOvtMDLB+0FW
	Hh8iqWR8sKqWjQc7oBgTLpF6XVqwbEbsfGMamHgMmx+vJwIkyGhUulAEzt+BLne8/tx5F4O9m172z
	E7C895YnS/WL0LPk0xjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozkB-00000007F2C-19iv;
	Wed, 29 Jul 2026 08:34:27 +0000
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozk8-00000007F1h-0XI9
	for linux-riscv@lists.infradead.org;
	Wed, 29 Jul 2026 08:34:25 +0000
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-80c5cb9a888so8668017b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 29 Jul 2026 01:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785314062; x=1785918862; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=WCfZWs2qBzfBTMw3/b4qNRHgwpbTts4mgogpiMUra6w=;
        b=QQFdldce2nc5odiHrVku6/pfaUvULVTskLDp3807Fb8mDhQD7jJhiXuuk/Xr4oiNnS
         uby7v3h0fkwlqFlZXvZ09UffwDOkFv+u+R4VfnYVZlErT7H3gf7+seBiwKTgL85eJKbn
         vD4+BI9/JOFFmGHGQIUcst6GEf62FpBs5siAlRLJ4NwMUz/EK7G0mFsGZi7Jb+goksIq
         2i+iJJGJ7brknfzKBltXuBRhENPA6FOtajC8oiDt5uWzZSFihhUy+OhYQkiG5fIf+o+K
         wfZHvdOd3QDvanpnzy4cL3A+jF5i8l3bhlARfpnEthXOwdE8jxDAfF/EfkxY/y/lo1z7
         5S5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785314062; x=1785918862;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WCfZWs2qBzfBTMw3/b4qNRHgwpbTts4mgogpiMUra6w=;
        b=CNK45wC5wo3dKC9us641O2eoB6cvEPdjggC15X0Wiiaj0xL3+OdngCtnItpQgETjcX
         Qsjz53vRBOWtZgWNmIjaqutXG9C+EOs1VOp0LHqC5gZ5kpEGN3zWTFVhw9PODerSGJEH
         NeEaUXSW27woHbd7pzxHIkV5rHIb360hjmxj6dJlq+EPtnSaENrbIzmqmjYuIoNaRIX6
         R9uDhhQG47YEe5SZk2PCb8UpuEPqC9OU7AHtcj+kiCzNeQPZVq3bNV429Y2ug6vyj4L0
         khaDLlSXOFycqjGOBOesNfxHjnIUuPA48bYaEt/NOTqC4b5zE1P9iZLLB0fASAvB3WMU
         z2WA==
X-Forwarded-Encrypted: i=1; AHgh+RrryIej8wwKb054g7Se9MeqWAQFL/pA5lUardx/cV/82lqJVXTnkb/Oxrx/SJTj0dIc8d2CT64lQyxcJQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz/G8+SdbOfuzTulPI0BPlI8VyLbc/F7/hR+3vU9ii3SyBEYHX7
	WD0/h8QEZUScJ0nJZNxiT7FGWMa4uSpbicYPLkMJyZHd2qu0owdvjdd/
X-Gm-Gg: AR+sD13/MvkVwQgX++UObMTVYdhVppXI0M0biIQ0gIiPOgqAs2PY8we4pWiRZZhQmBF
	Lqp69h/jy+l27s/UnGW+yNwX7kIFmqtFs5usgID4FFs4cDnThROf/fAMH0py27crIORPwCBu0io
	VKJ8zWmTOFii+Bb87a/MXfA3lu2xL0wNe5S8Pkj/iiji1SofBvpva/TkPnQtsT39BxXraL65zs8
	zuuMYtvKRIMaT+twV8HL2ZupO0wyfi+CbhIL42ef5xwIph24MTuZp1Edla8MZtxBH0D5YCOsjOH
	56DnhS6cLThW2uGyhNvcq9tyYBK1Fqn7HKK7E8/DrzWrfvRqw18delK84o66ipW7A2WclK3txby
	gfu8UTdYEKZAyYBa+xtnLOyV65MtHPUW3Mv3Ivsi78gxaos/bVClMYLniexF3nxbPiARIhY03ss
	lk87GDuI5Zqf00z2siMqXpLP1aG3WmZeWCrfCGqh15Ac26Z5OsJXd0HSPgdpGI7V9HIgKqqvnQk
	r5UU3yxqvsE/omfkIOyv2qlQBSsSn8dIkKElb0joA==
X-Received: by 2002:a05:690c:3685:b0:81e:9f17:8050 with SMTP id 00721157ae682-81f99240917mr28751857b3.21.1785314062516;
        Wed, 29 Jul 2026 01:34:22 -0700 (PDT)
Received: from localhost.localdomain ([107.198.84.185])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-81fa2957751sm14029097b3.35.2026.07.29.01.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 01:34:21 -0700 (PDT)
From: Paul Sherman <shermanpauldylan@gmail.com>
To: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Sherman <shermanpauldylan@gmail.com>
Subject: [PATCH] riscv: smp: fix non-SPINWAIT secondary hart rendezvous for fw_dynamic platforms
Date: Wed, 29 Jul 2026 01:34:14 -0700
Message-ID: <20260729083414.39339-1-shermanpauldylan@gmail.com>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_013424_214778_881C20DD 
X-CRM114-Status: GOOD (  24.89  )
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

On platforms where firmware (e.g. fw_dynamic) releases all harts to the
same Linux entry point simultaneously, the hart selected by OpenSBI as
Domain0 Boot HART is already in SBI_HSM_STATE_STARTED when Linux later
attempts to bring it online as a secondary CPU via SBI HART_START.
OpenSBI correctly returns SBI_ERR_ALREADY_STARTED, but Linux has no
recovery path: with CONFIG_RISCV_BOOT_SPINWAIT=n, there is no secondary
wait path in _start_kernel for harts that entered Linux directly from
firmware, and sbi_cpu_start() has no handler for SBI_ERR_ALREADY_STARTED.

This causes one CPU to be permanently dropped per boot. The missing CPU
is always the OpenSBI Domain0 Boot HART, which varies between boots on
Sophgo SG2042 (hart 1, 2, or 3), explaining the apparent 'moving victim'.

Fix with three cooperating changes:

1. Initialize boot_cpu_hartid to INVALID_HARTID instead of relying on
   BSS zero-initialization. Without this, boot_cpu_hartid aliases with
   hart 0, causing hart 0 to always appear to win the boot CPU race
   regardless of which hart actually stored its hartid first.

2. Add a non-SPINWAIT secondary wait path in _start_kernel. When
   firmware releases multiple harts to the same entry point, non-primary
   harts divert into the existing spinwait rendezvous arrays (previously
   used only by CONFIG_RISCV_BOOT_SPINWAIT) and wait for cpu_start() to
   provide boot data before proceeding to secondary startup.

3. Handle SBI_ERR_ALREADY_STARTED (-EALREADY) in sbi_cpu_start(). When
   HART_START returns -EALREADY, the hart is already executing in Linux
   and spinning in .Lwait_for_cpu_up_sbi. Write the spinwait rendezvous
   arrays to release it into secondary startup, matching the approach
   used by cpu_ops_spinwait.c.

The arrays __cpu_spinwait_stack_pointer and __cpu_spinwait_task_pointer
are defined unconditionally in cpu_ops_spinwait.c but their extern
declarations in head.h were guarded by CONFIG_RISCV_BOOT_SPINWAIT.
Move the declarations outside the guard since the arrays are always
present and now used by both boot paths.

Note: The NR_CPUS bound check mirrors the identical pattern in
cpu_ops_spinwait.c:32 which guards the same arrays against out-of-range
hartids on platforms with discontiguous hart numbering.

Link: https://lore.kernel.org/linux-riscv/20260727221508.5179-1-shermanpauldylan@gmail.com/
Tested-on: Milk-V Pioneer (Sophgo SG2042, 64-hart RISC-V, 4-NUMA nodes,
           128GB DDR4, OpenSBI v1.5, Linux v7.2-rc5)
Result: boot_cpu_hartid correctly reflects Domain0 Boot HART, all 64
        CPUs online in 2.7 seconds (was 63 CPUs, boot always on hart 0)
Signed-off-by: Paul Sherman <shermanpauldylan@gmail.com>
---
 arch/riscv/kernel/cpu_ops_sbi.c | 41 ++++++++++++++++++++++++++++++++-
 arch/riscv/kernel/head.S        | 25 ++++++++++++++++++++
 arch/riscv/kernel/head.h        |  2 --
 arch/riscv/kernel/setup.c       |  9 +++++++-
 4 files changed, 73 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/cpu_ops_sbi.c b/arch/riscv/kernel/cpu_ops_sbi.c
index ee6e4b5cc39e9..3268fda5be35f 100644
--- a/arch/riscv/kernel/cpu_ops_sbi.c
+++ b/arch/riscv/kernel/cpu_ops_sbi.c
@@ -12,6 +12,7 @@
 #include <asm/cpu_ops_sbi.h>
 #include <asm/sbi.h>
 #include <asm/smp.h>
+#include "head.h"
 
 extern char secondary_start_sbi[];
 const struct cpu_operations cpu_ops_sbi;
@@ -23,6 +24,18 @@ const struct cpu_operations cpu_ops_sbi;
  */
 static struct sbi_hart_boot_data boot_data[NR_CPUS];
 
+#ifndef CONFIG_RISCV_BOOT_SPINWAIT
+/*
+ * Secondary hart rendezvous arrays, shared with head.S.
+ * These arrays are named for historical reasons after the spinwait
+ * boot protocol, but serve a generic purpose: holding per-hart boot
+ * data until a secondary hart is ready to proceed. Defined here when
+ * CONFIG_RISCV_BOOT_SPINWAIT=n; otherwise defined in cpu_ops_spinwait.c.
+ */
+void *__cpu_spinwait_stack_pointer[NR_CPUS] __section(".data");
+void *__cpu_spinwait_task_pointer[NR_CPUS] __section(".data");
+#endif
+
 static int sbi_hsm_hart_start(unsigned long hartid, unsigned long saddr,
 			      unsigned long priv)
 {
@@ -62,6 +75,7 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	unsigned long boot_addr = __pa_symbol(secondary_start_sbi);
 	unsigned long hartid = cpuid_to_hartid_map(cpuid);
 	unsigned long hsm_data;
+	int ret;
 	struct sbi_hart_boot_data *bdata = &boot_data[cpuid];
 
 	/* Make sure tidle is updated */
@@ -71,7 +85,32 @@ static int sbi_cpu_start(unsigned int cpuid, struct task_struct *tidle)
 	/* Make sure boot data is updated */
 	smp_mb();
 	hsm_data = __pa(bdata);
-	return sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
+
+	ret = sbi_hsm_hart_start(hartid, boot_addr, hsm_data);
+
+	/*
+	 * The firmware boot hart enters Linux directly from the bootloader
+	 * and is already in SBI_HSM_STATE_STARTED when Linux attempts to
+	 * bring it online as a secondary CPU. HART_START correctly returns
+	 * SBI_ERR_ALREADY_STARTED in this case. The hart is spinning in
+	 * .Lwait_for_cpu_up_sbi waiting for boot data - write the spinwait
+	 * rendezvous arrays to release it into secondary startup.
+	 *
+	 * Guard against invalid or out-of-range hartids, matching the
+	 * same constraint enforced in cpu_ops_spinwait.c.
+	 */
+	if (ret == -EALREADY) {
+		if (hartid != INVALID_HARTID &&
+		    hartid < (unsigned long)NR_CPUS) { /* array bound */
+			/* Ensure bdata writes visible before spinwait arrays */
+			smp_wmb();
+			WRITE_ONCE(__cpu_spinwait_stack_pointer[hartid],
+				task_pt_regs(tidle));
+			WRITE_ONCE(__cpu_spinwait_task_pointer[hartid], tidle);
+		}
+		ret = 0;
+	}
+	return ret;
 }
 
 #ifdef CONFIG_HOTPLUG_CPU
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index f6a8ca49e6277..da48f5efd928b 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -281,6 +281,31 @@ SYM_CODE_START(_start_kernel)
 	la a2, boot_cpu_hartid
 	REG_S a0, (a2)
 
+#ifndef CONFIG_RISCV_BOOT_SPINWAIT
+	/*
+	 * On platforms where firmware releases all harts to the same
+	 * entry point (e.g. fw_dynamic), non-primary harts must divert
+	 * here before MMU setup. Wait in the spinwait rendezvous arrays
+	 * until cpu_start() provides boot data. a0 = hartid.
+	 */
+	REG_L a3, (a2)
+	beq a0, a3, .Lprimary_hart
+	slli a3, a0, LGREG
+	la a1, __cpu_spinwait_stack_pointer
+	la a2, __cpu_spinwait_task_pointer
+	add a1, a3, a1
+	add a2, a3, a2
+.Lwait_for_cpu_up_sbi:
+	fence r, r
+	REG_L sp, (a1)
+	REG_L tp, (a2)
+	beqz sp, .Lwait_for_cpu_up_sbi
+	beqz tp, .Lwait_for_cpu_up_sbi
+	fence
+	tail .Lsecondary_start_common
+.Lprimary_hart:
+#endif /* !CONFIG_RISCV_BOOT_SPINWAIT */
+
 	/* Initialize page tables and relocate to virtual addresses */
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
diff --git a/arch/riscv/kernel/head.h b/arch/riscv/kernel/head.h
index 05a04bef442b1..1b34f8e655581 100644
--- a/arch/riscv/kernel/head.h
+++ b/arch/riscv/kernel/head.h
@@ -12,9 +12,7 @@ extern atomic_t hart_lottery;
 
 asmlinkage void __init setup_vm(uintptr_t dtb_pa);
 
-#ifdef CONFIG_RISCV_BOOT_SPINWAIT
 extern void *__cpu_spinwait_stack_pointer[];
 extern void *__cpu_spinwait_task_pointer[];
-#endif
 
 #endif /* __ASM_HEAD_H */
diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index 52d1d2b8f338b..d2eecb7ad4965 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -47,7 +47,14 @@
  * BSS.
  */
 atomic_t hart_lottery __section(".sdata");
-unsigned long boot_cpu_hartid;
+/*
+ * Initialize to INVALID_HARTID so that the first hart to store its
+ * hartid in head.S is unambiguously the boot CPU. Without this,
+ * boot_cpu_hartid starts as 0 (BSS), which aliases with hart 0 and
+ * causes hart 0 to always appear to win the boot CPU race regardless
+ * of which hart actually wrote first.
+ */
+unsigned long boot_cpu_hartid = INVALID_HARTID;
 EXPORT_SYMBOL_GPL(boot_cpu_hartid);
 
 /*
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
