Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9925EC83F3F
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Sep 2023 17:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MOwpLknrUHqtIb3d2aY6RW2mX+z3m7WZ36ZggFFOfZ4=; b=f65Zm/Kj4ByH9b
	RJ99174Z3aBwbtDFT8ZS8Ez8bQbmu/RI2AaP9yuh89Qte/pWg/rKvHN0s0H+eAulqc36YoYGuG3A6
	z0k8UOnwcPZUU8Gho1FX6gM08agKagpCVnpmQkSdva0BX6g9Jr503o6YFb349u372+sVtZag/9BjM
	Vmo3mMKym8r7xo+wbJxCR6mGZnXi1D19V2std1AdrB96NHPGcg4nkZRVEfrbKAIDOeevMpI6Eni7p
	Z1HwOR8zXxHkrokUpnp+b0pug4Fmh0+AeFCRqytF/su7q1ulmF2M4RtB7R3SuJX21TUWe8MobLUp6
	qXx1Z+D7swXJ/X5KvrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCyE-004UWr-1S;
	Mon, 04 Sep 2023 17:02:38 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qdCyA-004UUs-1E
	for linux-riscv@lists.infradead.org;
	Mon, 04 Sep 2023 17:02:36 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-9a5be3166a2so228565466b.1
        for <linux-riscv@lists.infradead.org>; Mon, 04 Sep 2023 10:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1693846950; x=1694451750; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=918hReRS1244m65PXzMbDZxLuNIQHVhIeUFwPCIAHI8=;
        b=oMf4TGV9wY7lbNHnXgxzXkzhnMhWR8JkIHVfmUy+QoGggkdDmpbNRS8Gk4cSqhwGPA
         khCOzdDtxIaLCCe//R0rV2qltViJYEnErd8Mzndqd87qUFknDrewCp/yn3Qq/DIq9lWF
         bxzPIKqFF1SUFJt9dQ813OdRZlDE2k8YdecnnF5QdLA0+j/HFT1308cCJbrbotN3vsTE
         3iB6qMChC+TDwQQFBBNPJoikcuysOmKh3UhX7K8DsyvZGQKdGxKTpBC3vaCGGHZK4nPJ
         UTYLezI6UGO2LY2mklQ6a8UfoiUU2JT3R1ur+PyoibVSLGle5t9jweSxzla5L2I1JnCw
         tKkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693846950; x=1694451750;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=918hReRS1244m65PXzMbDZxLuNIQHVhIeUFwPCIAHI8=;
        b=fuPB/SC/O59Ij3hMOusgHMjh/zLuRDd18sLHiV6j/za3+oXTaXYcPbet7+p0JsgM9A
         Gjnh22+PHHAa48bsazrCrZz6Drr/EpUOjr+u7R4GhqThtLyU0mVlzqq30OL8arHKKr12
         0UZHP94iVyJ7hAH0cPrIJ/9um3sCGzMECAqIN1Xc73vGe6K5RUatBy0LJLLbJ3dk+zGD
         bkxsmEvtG/adN+BIpII2a1pUsaAMfZa97jt8dGB0PStVN1OfGVyZqQuNVEgKk5ZlDcWz
         qKHaj9HklNeLl0E41rog1sYzifxMdE4Fgmb9Wt3RH5M1MS1h8WrP1GkXUUgRMTjbOTX1
         w2mA==
X-Gm-Message-State: AOJu0YyFB37BfzvO0nPYuKkAbzQ9OTj6v7w2K1AGW3cht12qXpzWrOJY
	DGqWYrW39uFCngm+94Mnuq9AVoYcwPZjVhVpFAQiLwz4
X-Google-Smtp-Source: AGHT+IEMH9Di0fLj333wBZKiDQxl21h4AhMB4fchumt/BAm9VOPSi+nSt6cMoF7V+pdz08QwFfrcdg==
X-Received: by 2002:a17:906:cc5a:b0:9a1:bfdc:2d5d with SMTP id mm26-20020a170906cc5a00b009a1bfdc2d5dmr7072325ejb.41.1693846950771;
        Mon, 04 Sep 2023 10:02:30 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id f22-20020a170906495600b0098e2eaec395sm6417584ejt.130.2023.09.04.10.02.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 04 Sep 2023 10:02:30 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH v3 6/6] RISC-V: selftests: Add CBO tests
Date: Mon,  4 Sep 2023 19:02:27 +0200
Message-ID: <20230904170220.167816-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230904170220.167816-8-ajones@ventanamicro.com>
References: <20230904170220.167816-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230904_100234_419737_053F8C0D 
X-CRM114-Status: GOOD (  23.60  )
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
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 170 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 4 files changed, 192 insertions(+), 12 deletions(-)
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
index 000000000000..50e85f31a2c7
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -0,0 +1,170 @@
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
+#define MK_CBO(fn) ((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
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
+	assert(insn == MK_CBO(regs[11]));
+
+	illegal_insn = true;
+	regs[0] += 4;
+}
+
+static void cbo_insn(char *base, int fn)
+{
+	uint32_t insn = MK_CBO(fn);
+
+	asm volatile(
+	"mv	a0, %0\n"
+	"li	a1, %1\n"
+	".4byte	%2\n"
+	: : "r" (base), "i" (fn), "i" (insn) : "a0", "a1", "memory");
+}
+
+static void cbo_inval(char *base) { cbo_insn(base, 0); }
+static void cbo_clean(char *base) { cbo_insn(base, 1); }
+static void cbo_flush(char *base) { cbo_insn(base, 2); }
+static void cbo_zero(char *base)  { cbo_insn(base, 4); }
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
+	cbo_zero(&mem[0]);
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
+	if (!is_power_of_2(block_size)) {
+		ksft_test_result_skip("cbo.zero check\n");
+		return;
+	}
+
+	assert(block_size <= 1024);
+
+	illegal_insn = false;
+	cbo_zero(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.zero\n");
+
+	if (illegal_insn) {
+		ksft_test_result_skip("cbo.zero check\n");
+		return;
+	}
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
+	/* Ensure Zicbom instructions remain privileged */
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
