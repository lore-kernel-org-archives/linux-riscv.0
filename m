Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D433C3ABCC
	for <linux-riscv@archiver.kernel.org>; Tue, 13 May 2025 15:20:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hOktytjwRtxibQ0BCXCvgOWND0CrjPvuwB4FGiAkxMY=; b=sDqZcc2VHuA6SD
	eJ9Ef3GxpkGZPnuMRovzz5nggwLV/1B0OnOa3LNagbPbWYkyNRN+siRh5c5+gxkIZsWjyS1SOGfg5
	WrHBdC2+Fmod215zAB/KyTAXYqn3A1G/GE2A14EG8dWqVYxjOeib9o5fe/skEO/aM4pLnEm9UnLfO
	OfQYclrWcH1Wfm1E/qrsTtiAizS+FQRs43O7Lf1a2H/gTLC0627ZFNJKjGEjra7ynCh8yiiCiwbbY
	6AQ03z6bbNqmrq9GbAOc2IHIHQvYrxrTp0uSIpEoK2mVGMIr5VW/1z31+47eYPyaV/2l4sFnNbOIr
	ckpEqVKyjktPJLP/PZQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErR0-0000000ClBW-2cku;
	Tue, 13 May 2025 15:20:46 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uErN3-0000000CkM1-22eR
	for linux-riscv@lists.infradead.org;
	Tue, 13 May 2025 15:16:43 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747149398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZUjVlAw/3ECoJhha+RLfZZG4OVYkSRubonHMnjBN+k=;
	b=pztJMVLdPWMbYDKOfAvy9RB+Wb5X7k9G5PGR9wDkrOwkf6qQbqnInCRtkHjjVK+ZP6FJrj
	63YhT5ENvF/XPL1UoPDbXA5AC+eu1+6w6CduzH26oQFsuFSQJceYJm5SsYzTaBD+uULpD7
	3KNcLgTTqMMrGtdazo7DTqEOfDrTAWhOTgJRg4pf7Ro+iAycGvE1e2dnDro/xXIZ0bLWY4
	fYbVwx1jwhUcMA6rJ2tS0Hf2iuFenPG121hiSMk5BX6AymaYOcb327esfi8swuXkg6aOjC
	23dErzDwopAf0jMhAJNErpjS5U/PqK7RVxAlRLRdafW5jFi4FCgxKlWFC/jTvQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747149398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nZUjVlAw/3ECoJhha+RLfZZG4OVYkSRubonHMnjBN+k=;
	b=1yORUvT5V4uRMVjzNksk1bdlzGsPUFtrUQtKtMumU5ngdTLdiSuzjZC+pA4da79Pog3EC6
	qCVBcEY2vnfSc7AQ==
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>
Subject: [PATCH v2] riscv: Add kprobes KUnit test
Date: Tue, 13 May 2025 17:16:31 +0200
Message-Id: <20250513151631.3520793-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_081641_822485_D8D47AD6 
X-CRM114-Status: GOOD (  17.32  )
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

Add KUnit test for riscv kprobes, mostly for simulated instructions. The
test install kprobes into multiple sample functions, and check that these
functions still return the expected magic value.

This test can detect some kprobe bugs reported in the past (in Link:).

Link: https://lore.kernel.org/linux-riscv/20241119111056.2554419-1-namcao@linutronix.de/
Link: https://lore.kernel.org/stable/c7e463c0-8cad-4f4e-addd-195c06b7b6de@iscas.ac.cn/
Link: https://lore.kernel.org/linux-riscv/20230829182500.61875-1-namcaov@gmail.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
v2: rewrite the auipc test so that clang can compile

 arch/riscv/kernel/tests/Kconfig.debug         |  12 +
 arch/riscv/kernel/tests/Makefile              |   1 +
 arch/riscv/kernel/tests/kprobes/Makefile      |   1 +
 .../kernel/tests/kprobes/test-kprobes-asm.S   | 229 ++++++++++++++++++
 .../riscv/kernel/tests/kprobes/test-kprobes.c |  56 +++++
 .../riscv/kernel/tests/kprobes/test-kprobes.h |  24 ++
 6 files changed, 323 insertions(+)
 create mode 100644 arch/riscv/kernel/tests/kprobes/Makefile
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.c
 create mode 100644 arch/riscv/kernel/tests/kprobes/test-kprobes.h

diff --git a/arch/riscv/kernel/tests/Kconfig.debug b/arch/riscv/kernel/tests/Kconfig.debug
index 78cea5d2c270..5db4df44279e 100644
--- a/arch/riscv/kernel/tests/Kconfig.debug
+++ b/arch/riscv/kernel/tests/Kconfig.debug
@@ -30,6 +30,18 @@ config RISCV_MODULE_LINKING_KUNIT
 
          If unsure, say N.
 
+config RISCV_KPROBES_KUNIT
+       bool "KUnit test for riscv kprobes" if !KUNIT_ALL_TESTS
+       depends on KUNIT
+       depends on KPROBES
+       default KUNIT_ALL_TESTS
+       help
+         Enable testing for riscv kprobes. Useful for riscv and/or kprobes
+         development. The test verifies that kprobes do not change the behaviour
+         of some sample functions.
+
+         If unsure, say N.
+
 endif # RUNTIME_TESTING_MENU
 
 endmenu # "arch/riscv/kernel runtime Testing"
diff --git a/arch/riscv/kernel/tests/Makefile b/arch/riscv/kernel/tests/Makefile
index 7d6c76cffe20..407e7e6c28dc 100644
--- a/arch/riscv/kernel/tests/Makefile
+++ b/arch/riscv/kernel/tests/Makefile
@@ -1 +1,2 @@
 obj-$(CONFIG_RISCV_MODULE_LINKING_KUNIT)	+= module_test/
+obj-$(CONFIG_RISCV_KPROBES_KUNIT)		+= kprobes/
diff --git a/arch/riscv/kernel/tests/kprobes/Makefile b/arch/riscv/kernel/tests/kprobes/Makefile
new file mode 100644
index 000000000000..4cb6c66a98e8
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/Makefile
@@ -0,0 +1 @@
+obj-y += test-kprobes.o test-kprobes-asm.o
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
new file mode 100644
index 000000000000..b951d0f12482
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes-asm.S
@@ -0,0 +1,229 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+#include "test-kprobes.h"
+
+SYM_FUNC_START(test_kprobes_add)
+	li a1, KPROBE_TEST_MAGIC_UPPER
+	li a2, KPROBE_TEST_MAGIC_LOWER
+test_kprobes_add_addr1:
+	add a1, a1, a2
+test_kprobes_add_addr2:
+	add a0, a1, x0
+	ret
+SYM_FUNC_END(test_kprobes_add)
+
+SYM_FUNC_START(test_kprobes_jal)
+	li a0, 0
+	mv a1, ra
+	.option push
+	.option norvc
+test_kprobes_jal_addr1:
+	jal x0, 2f
+	ret
+	.option pop
+1:	li a0, KPROBE_TEST_MAGIC_UPPER
+	ret
+	.option push
+	.option norvc
+test_kprobes_jal_addr2:
+2:	jal 1b
+	.option pop
+	li a2, KPROBE_TEST_MAGIC_LOWER
+	add a0, a0, a2
+	jr a1
+SYM_FUNC_END(test_kprobes_jal)
+
+SYM_FUNC_START(test_kprobes_jalr)
+	la a0, 1f
+	mv a1, ra
+	.option push
+	.option norvc
+test_kprobes_jalr_addr:
+	jalr a0
+	.option pop
+	li t0, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, t0
+	jr a1
+1:	li a0, KPROBE_TEST_MAGIC_LOWER
+	ret
+SYM_FUNC_END(test_kprobes_jalr)
+
+SYM_FUNC_START(test_kprobes_auipc)
+test_kprobes_auipc_addr:
+	auipc a0, KPROBE_TEST_MAGIC_LOWER
+	la a1, test_kprobes_auipc_addr
+	sub a0, a0, a1
+	srli a0, a0, 12
+	li a1, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, a1
+	ret
+SYM_FUNC_END(test_kprobes_auipc)
+
+SYM_FUNC_START(test_kprobes_branch)
+	.option push
+	.option norvc
+	li a0, 0
+	li a1, 1
+	li a2, 2
+test_kprobes_branch_addr1:
+	beqz a0, 1f
+	ret
+1:
+test_kprobes_branch_addr2:
+	beqz a1, 3f
+test_kprobes_branch_addr3:
+	bnez a0, 3f
+test_kprobes_branch_addr4:
+	bnez a2, 1f
+	ret
+1:
+test_kprobes_branch_addr5:
+	bge a1, a2, 3f
+test_kprobes_branch_addr6:
+	bge a2, a1, 2f
+	ret
+1:
+	li t0, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, t0
+	ret
+2:
+test_kprobes_branch_addr7:
+	blt a2, a1, 3f
+	li a0, KPROBE_TEST_MAGIC_LOWER
+test_kprobes_branch_addr8:
+	blt a1, a2, 1b
+3:
+	li a0, 0
+	ret
+	.option pop
+SYM_FUNC_END(test_kprobes_branch)
+
+#ifdef CONFIG_RISCV_ISA_C
+
+SYM_FUNC_START(test_kprobes_c_j)
+	li a0, 0
+test_kprobes_branch_c_j_addr1:
+	c.j 2f
+1:
+	li a1, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, a1
+	ret
+2:	li a0, KPROBE_TEST_MAGIC_LOWER
+test_kprobes_branch_c_j_addr2:
+	c.j 1b
+SYM_FUNC_END(test_kprobes_c_j)
+
+SYM_FUNC_START(test_kprobes_c_jr)
+	la a0, 2f
+test_kprobes_c_jr_addr1:
+	c.jr a0
+	ret
+1:	li a1, KPROBE_TEST_MAGIC_LOWER
+	add a0, a0, a1
+	ret
+2:
+	li a0, KPROBE_TEST_MAGIC_UPPER
+	la a1, 1b
+test_kprobes_c_jr_addr2:
+	c.jr a1
+SYM_FUNC_END(test_kprobes_c_jr)
+
+SYM_FUNC_START(test_kprobes_c_jalr)
+	mv a1, ra
+	la a0, 1f
+test_kprobes_c_jalr_addr:
+	c.jalr a0
+	li a2, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, a2
+	jr a1
+1:	li a0, KPROBE_TEST_MAGIC_LOWER
+	ret
+SYM_FUNC_END(test_kprobes_c_jalr)
+
+SYM_FUNC_START(test_kprobes_c_beqz)
+	li a0, 0
+	li a1, 1
+test_kprobes_c_beqz_addr1:
+	c.beqz a0, 2f
+	ret
+1:	li a1, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, a1
+	ret
+test_kprobes_c_beqz_addr2:
+2:	c.beqz a1, 3f
+	li a0, KPROBE_TEST_MAGIC_LOWER
+	mv a1, x0
+test_kprobes_c_beqz_addr3:
+	c.beqz a1, 1b
+3:	li a0, 0
+	ret
+SYM_FUNC_END(test_kprobes_c_beqz)
+
+SYM_FUNC_START(test_kprobes_c_bnez)
+	li a0, 0
+	li a1, 1
+test_kprobes_c_bnez_addr1:
+	c.bnez a1, 2f
+	ret
+1:	li a1, KPROBE_TEST_MAGIC_UPPER
+	add a0, a0, a1
+	ret
+test_kprobes_c_bnez_addr2:
+2:	c.bnez a0, 3f
+	li a0, KPROBE_TEST_MAGIC_LOWER
+test_kprobes_c_bnez_addr3:
+	c.bnez a0, 1b
+3:	li a0, 0
+	ret
+SYM_FUNC_END(test_kprobes_c_bnez)
+
+#endif /* CONFIG_RISCV_ISA_C */
+
+SYM_DATA_START(test_kprobes_addresses)
+	RISCV_PTR test_kprobes_add_addr1
+	RISCV_PTR test_kprobes_add_addr2
+	RISCV_PTR test_kprobes_jal_addr1
+	RISCV_PTR test_kprobes_jal_addr2
+	RISCV_PTR test_kprobes_jalr_addr
+	RISCV_PTR test_kprobes_auipc_addr
+	RISCV_PTR test_kprobes_branch_addr1
+	RISCV_PTR test_kprobes_branch_addr2
+	RISCV_PTR test_kprobes_branch_addr3
+	RISCV_PTR test_kprobes_branch_addr4
+	RISCV_PTR test_kprobes_branch_addr5
+	RISCV_PTR test_kprobes_branch_addr6
+	RISCV_PTR test_kprobes_branch_addr7
+	RISCV_PTR test_kprobes_branch_addr8
+#ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_branch_c_j_addr1
+	RISCV_PTR test_kprobes_branch_c_j_addr2
+	RISCV_PTR test_kprobes_c_jr_addr1
+	RISCV_PTR test_kprobes_c_jr_addr2
+	RISCV_PTR test_kprobes_c_jalr_addr
+	RISCV_PTR test_kprobes_c_beqz_addr1
+	RISCV_PTR test_kprobes_c_beqz_addr2
+	RISCV_PTR test_kprobes_c_beqz_addr3
+	RISCV_PTR test_kprobes_c_bnez_addr1
+	RISCV_PTR test_kprobes_c_bnez_addr2
+	RISCV_PTR test_kprobes_c_bnez_addr3
+#endif /* CONFIG_RISCV_ISA_C */
+	RISCV_PTR 0
+SYM_DATA_END(test_kprobes_addresses)
+
+SYM_DATA_START(test_kprobes_functions)
+	RISCV_PTR test_kprobes_add
+	RISCV_PTR test_kprobes_jal
+	RISCV_PTR test_kprobes_jalr
+	RISCV_PTR test_kprobes_auipc
+	RISCV_PTR test_kprobes_branch
+#ifdef CONFIG_RISCV_ISA_C
+	RISCV_PTR test_kprobes_c_j
+	RISCV_PTR test_kprobes_c_jr
+	RISCV_PTR test_kprobes_c_jalr
+	RISCV_PTR test_kprobes_c_beqz
+	RISCV_PTR test_kprobes_c_bnez
+#endif /* CONFIG_RISCV_ISA_C */
+	RISCV_PTR 0
+SYM_DATA_END(test_kprobes_functions)
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.c b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
new file mode 100644
index 000000000000..6f6cdfbf5a95
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.c
@@ -0,0 +1,56 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/kernel.h>
+#include <linux/kprobes.h>
+#include <kunit/test.h>
+#include "test-kprobes.h"
+
+static int kprobe_dummy_handler(struct kprobe *kp, struct pt_regs *regs)
+{
+	return 0;
+}
+
+static void test_kprobe_riscv(struct kunit *test)
+{
+	unsigned int num_kprobe = 0;
+	long (*func)(void);
+	struct kprobe *kp;
+	int i;
+
+	while (test_kprobes_addresses[num_kprobe])
+		num_kprobe++;
+
+	kp = kcalloc(num_kprobe, sizeof(*kp), GFP_KERNEL);
+	KUNIT_EXPECT_TRUE(test, kp);
+	if (!kp)
+		return;
+
+	for (i = 0; i < num_kprobe; ++i) {
+		kp[i].addr = test_kprobes_addresses[i];
+		kp[i].pre_handler = kprobe_dummy_handler;
+		KUNIT_EXPECT_EQ(test, 0, register_kprobe(&kp[i]));
+	}
+
+	for (i = 0;; ++i) {
+		func = test_kprobes_functions[i];
+		if (!func)
+			break;
+		KUNIT_EXPECT_EQ_MSG(test, KPROBE_TEST_MAGIC, func(), "function %d broken", i);
+	}
+
+	for (i = 0; i < num_kprobe; ++i)
+		unregister_kprobe(&kp[i]);
+	kfree(kp);
+}
+
+static struct kunit_case kprobes_testcases[] = {
+	KUNIT_CASE(test_kprobe_riscv),
+	{}
+};
+
+static struct kunit_suite kprobes_test_suite = {
+	.name = "kprobes_test_riscv",
+	.test_cases = kprobes_testcases,
+};
+
+kunit_test_suites(&kprobes_test_suite);
diff --git a/arch/riscv/kernel/tests/kprobes/test-kprobes.h b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
new file mode 100644
index 000000000000..3886ab491ecb
--- /dev/null
+++ b/arch/riscv/kernel/tests/kprobes/test-kprobes.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+#ifndef TEST_KPROBES_H
+#define TEST_KPROBES_H
+
+/*
+ * The magic value that all the functions in the test_kprobes_functions array return. The test
+ * installs kprobes into these functions, and verify that the functions still correctly return this
+ * value.
+ */
+#define KPROBE_TEST_MAGIC          0xcafebabe
+#define KPROBE_TEST_MAGIC_LOWER    0x0000babe
+#define KPROBE_TEST_MAGIC_UPPER    0xcafe0000
+
+#ifndef __ASSEMBLY__
+
+/* array of addresses to install kprobes */
+extern void *test_kprobes_addresses[];
+
+/* array of functions that return KPROBE_TEST_MAGIC */
+extern long (*test_kprobes_functions[])(void);
+
+#endif /* __ASSEMBLY__ */
+
+#endif /* TEST_KPROBES_H */
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
