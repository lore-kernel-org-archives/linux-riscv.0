Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43140C83F15
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Aug 2023 16:50:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=joYdSjD0Y7VzTjB2PBHfeXIYIAtcfMFG3XX6ECEwLd8=; b=LB/2nsHQVIcWYy
	rOMLj0WKr8v6mH2PGXMhfxYX9nkPN5fp2Fsb/1Psy6Zu5HiL1BqrPEuldSgnduwYgromqeyfRAdYx
	Bl5qZZOWDSYIQhlQCIE7L/3RRcW2ZdX7oUG2YeCJdaeuWfLcjJbKOgjGHiO3q7zzZ5eQSSYvh+LX9
	6x6idRwN2NpPNHNZ6e0pQU6YKbywWZnm8Qc7hoyAiWz0utX0XjN4CfTbZbdzZuKzbDHCr/IPlTLhw
	QBJwKuhsMC5/plrpXCRUO+eNRmfIkfX8Ruog4VreYjOFGsqsaCwxMNCzNa8keaky4TH4naA64b/o+
	c2I0xmWwsgUGws/LX+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOV-00DscL-3B;
	Wed, 30 Aug 2023 16:50:15 +0000
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qbOOM-00DsXO-1W
	for linux-riscv@lists.infradead.org;
	Wed, 30 Aug 2023 16:50:08 +0000
Received: by mail-wm1-x341.google.com with SMTP id 5b1f17b1804b1-401da71b7faso18071675e9.2
        for <linux-riscv@lists.infradead.org>; Wed, 30 Aug 2023 09:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693414205; x=1694019005; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dUWkByLESV4XmLGBN0UYME2Jpxt98+gDc9eu4lhtaLU=;
        b=QWXMaPpdZgJtiNjOKojgNnjQm3zNnMq6nhLLiX51NYOe7vTJoaIWlRAsVM4oTmCeqU
         N4MZHA0z0c9PO8pRLtZQnrPZ8cgzt4vHM4sv6/ukg3FLYrwtXwmCAk94hjM49wmviHro
         KKmg95MRA0qPPPp2g3V2ktmshrSShgE9r//rUcLt8ayKspl5XPblSfCy182VAQ/EanGQ
         DNHqXoajcZgooK5Qg1O6FEmHZj0LvrktIZ/rcHB44R+ANPb4+bP7NeOvT5G3ah3+VuMq
         ZQy9MByHgJu78omRM60cro7K4vLtWFP3y2FGQAzc2CY4u7fc8ZtiJey9U0AjY9SwGVpF
         Z6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693414205; x=1694019005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dUWkByLESV4XmLGBN0UYME2Jpxt98+gDc9eu4lhtaLU=;
        b=Ju17graDLusMNAe2NZ4ESRDREtNXKdzlzO0Z9MI72PR0Trsqk0zU8kvBx/3PAdps9S
         /938ihky8rqQOPS8g5TkOGkhVQl1/sonlh6tYS+hnI65ZKlPjtG2ysno4Ye2Kgjw+LFN
         62ZW2a4QS22Ap6BTNkC+R/M0QmPcdgvRLzuL4ZKnG/6YxLmE6jR8qg6J5Dr0o+TqLa8V
         Hpw0WEZF0oi3TYUSNnM1lqnqN7g6U3Kbuz/WMpAug9l7KziW2zgP7f1f0N5+5D095BK6
         hjTdk/9WkmfydsWtz+wMvPN3GTcdqBoCwCJ68teUM3msO4o5iJCisuotbM2+K4Vr+/l9
         Tgng==
X-Gm-Message-State: AOJu0YwP47umtogvXAK3POldvhuzwrmhFZA10P/TX5AMIkRYviuVTVv3
	bT6gOA4umDJR0ViTL6cEd06yv9FR3xmvuatnKHiO5g4n
X-Google-Smtp-Source: AGHT+IFEMqxZsWmtUsEZzIaesb8ObOXGvIgPxblPF0JZgDEym48NTFRJoJBxtwXHltNmYkm0QtTAeA==
X-Received: by 2002:a7b:ce16:0:b0:3fb:e356:b60d with SMTP id m22-20020a7bce16000000b003fbe356b60dmr2569921wmc.38.1693414204632;
        Wed, 30 Aug 2023 09:50:04 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id n14-20020a5d51ce000000b0031ad5470f89sm17160367wrv.18.2023.08.30.09.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Aug 2023 09:50:04 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v2 6/6] RISC-V: selftests: Add CBO tests
Date: Wed, 30 Aug 2023 18:50:01 +0200
Message-ID: <20230830164954.91987-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230830164954.91987-8-ajones@ventanamicro.com>
References: <20230830164954.91987-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230830_095006_508103_CDD33945 
X-CRM114-Status: GOOD (  23.50  )
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

Add hwprobe test for Zicboz and its block size. Also, when Zicboz is
present, test that cbo.zero may be issued and works. Additionally
test that the Zicbom instructions cause SIGILL and also that cbo.zero
causes SIGILL when Zicboz is not present. Pinning the test to a subset
of cpus with taskset will also restrict the hwprobe calls to that set.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 162 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 4 files changed, 184 insertions(+), 12 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index 5f614c3ba598..f224b84591fb 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -2,9 +2,14 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := hwprobe
+CFLAGS += -I$(top_srcdir)/tools/include
+
+TEST_GEN_PROGS := hwprobe cbo
 
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/cbo: cbo.c sys_hwprobe.S
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
new file mode 100644
index 000000000000..920abfaa10c2
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -0,0 +1,162 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Run with 'taskset -c <cpu-list> cbo' to only execute hwprobe on a
+ * subset of cpus, as well as only executing the tests on those cpus.
+ */
+#define _GNU_SOURCE
+#include <stdbool.h>
+#include <stdint.h>
+#include <sched.h>
+#include <signal.h>
+#include <assert.h>
+#include <linux/compiler.h>
+#include <asm/ucontext.h>
+
+#include "hwprobe.h"
+#include "../../kselftest.h"
+
+static char mem[4096] __aligned(4096) = { [0 ... 4095] = 0xa5 };
+
+static bool illegal_insn;
+
+static void sigill_handler(int sig, siginfo_t *info, void *context)
+{
+	unsigned long *regs = (unsigned long *)&((ucontext_t *)context)->uc_mcontext;
+	uint32_t insn = *(uint32_t *)regs[0];
+
+	assert(insn >> 20 == regs[11] &&
+	       (insn & ((1 << 20) - 1)) == (10 << 15 | 2 << 12 | 0 << 7 | 15));
+
+	illegal_insn = true;
+	regs[0] += 4;
+}
+
+static void cbo_insn(int fn, char *base)
+{
+	asm volatile(
+	"mv	a0, %0\n"
+	"li	a1, %1\n"
+	".4byte	%1 << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15\n"
+	: : "r" (base), "i" (fn) : "a0", "a1", "memory");
+}
+
+static void cbo_inval(char *base) { cbo_insn(0, base); }
+static void cbo_clean(char *base) { cbo_insn(1, base); }
+static void cbo_flush(char *base) { cbo_insn(2, base); }
+static void cbo_zero(char *base)  { cbo_insn(4, base); }
+
+static void test_no_zicbom(void)
+{
+	illegal_insn = false;
+	cbo_clean(&mem[0]);
+	ksft_test_result(illegal_insn, "No cbo.clean\n");
+
+	illegal_insn = false;
+	cbo_flush(&mem[0]);
+	ksft_test_result(illegal_insn, "No cbo.flush\n");
+
+	illegal_insn = false;
+	cbo_inval(&mem[0]);
+	ksft_test_result(illegal_insn, "No cbo.inval\n");
+}
+
+static void test_no_zicboz(void)
+{
+	illegal_insn = false;
+	cbo_clean(&mem[0]);
+	ksft_test_result(illegal_insn, "No cbo.zero\n");
+}
+
+static bool is_power_of_2(__u64 n)
+{
+	return n != 0 && (n & (n - 1)) == 0;
+}
+
+static void test_zicboz(__u64 block_size)
+{
+	int i, j;
+
+	illegal_insn = false;
+	cbo_zero(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.zero\n");
+
+	if (!is_power_of_2(block_size)) {
+		ksft_test_result_skip("cbo.zero check\n");
+		return;
+	}
+
+	assert(block_size <= 1024);
+
+	for (i = 0; i < 4096 / block_size; ++i) {
+		if (i % 2)
+			cbo_zero(&mem[i * block_size]);
+	}
+
+	for (i = 0; i < 4096 / block_size; ++i) {
+		char expected = i % 2 ? 0x0 : 0xa5;
+
+		for (j = 0; j < block_size; ++j) {
+			if (mem[i * block_size + j] != expected) {
+				ksft_test_result_fail("cbo.zero check\n");
+				ksft_print_msg("cbo.zero check: mem[%d] != 0x%x\n",
+					       i * block_size + j, expected);
+				return;
+			}
+		}
+	}
+
+	ksft_test_result_pass("cbo.zero check\n");
+}
+
+int main(int argc, char **argv)
+{
+	struct sigaction act = {
+		.sa_sigaction = &sigill_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+	bool has_zicboz = false;
+	struct riscv_hwprobe pair;
+	cpu_set_t cpus;
+	size_t nr_cpus;
+	long rc;
+
+	rc = sigaction(SIGILL, &act, NULL);
+	assert(rc == 0);
+
+	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
+	assert(rc == 0);
+	nr_cpus = CPU_COUNT(&cpus);
+
+	ksft_print_header();
+
+	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+	rc = riscv_hwprobe(&pair, 1, nr_cpus, (unsigned long *)&cpus, 0);
+	if (rc < 0)
+		ksft_exit_fail_msg("hwprobe() failed with %d\n", rc);
+
+	if (pair.key != -1 && (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)) {
+		has_zicboz = true;
+		ksft_set_plan(6);
+	} else {
+		ksft_print_msg("No Zicboz, testing cbo.zero remains privileged\n");
+		ksft_set_plan(4);
+	}
+
+	/* Ensure zicbom instructions remain privileged */
+	test_no_zicbom();
+
+	if (has_zicboz) {
+		pair.key = RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE;
+		rc = riscv_hwprobe(&pair, 1, nr_cpus, (unsigned long *)&cpus, 0);
+		ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE &&
+				 is_power_of_2(pair.value), "Zicboz block size\n");
+		ksft_print_msg("Zicboz block size: %ld\n", pair.value);
+		test_zicboz(pair.value);
+	} else {
+		test_no_zicboz();
+	}
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 4f15f1f3b4c3..c474891df307 100644
--- a/tools/testing/selftests/riscv/hwprobe/hwprobe.c
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
@@ -1,17 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0-only
-#include <stddef.h>
-#include <asm/hwprobe.h>
-
+#include "hwprobe.h"
 #include "../../kselftest.h"
 
-/*
- * Rather than relying on having a new enough libc to define this, just do it
- * ourselves.  This way we don't need to be coupled to a new-enough libc to
- * contain the call.
- */
-long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
-
 int main(int argc, char **argv)
 {
 	struct riscv_hwprobe pairs[8];
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.h b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
new file mode 100644
index 000000000000..721b0ce73a56
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/hwprobe.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef SELFTEST_RISCV_HWPROBE_H
+#define SELFTEST_RISCV_HWPROBE_H
+#include <stddef.h>
+#include <asm/hwprobe.h>
+
+/*
+ * Rather than relying on having a new enough libc to define this, just do it
+ * ourselves.  This way we don't need to be coupled to a new-enough libc to
+ * contain the call.
+ */
+long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
+		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
+
+#endif
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
