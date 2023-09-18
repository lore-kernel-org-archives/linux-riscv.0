Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18425C46CA1
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Sep 2023 13:15:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UtgnsQld673VK8FhdPJCQdbB+nkhwd+YB4U+leRoZfk=; b=AxWNXOi5bAZfan
	+VLegOY9nE4c7DdegJh4IbpazHov95yi0UOD4SszNqM5tuWLCX2MPhzfzfzlVpLgMcVR+DwKfi449
	LhbMWbCbYFfLKPAkZJbLpqJxajTkFsBay1MI0Jf2lTS2lJHoyDX1gB/KZJzEvu+SoBDbk6/w3y7NS
	uZw0ALmnB6/6e5dTGbZqLdBnMSv7iXhbK7dsn+xUmDSSwogPtwwS7mYO7S2fTZTKlNc0VqwI4EpYG
	GEj/JvtVwSjY4FvuUGgeXtZBFG3savFHPSkZu6LKMT7JYt2fpL2EpBwVXvdYpHBQcID9KgEpLxm+Y
	9ga/BlZHgNESl1P3vo1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE6B-00FVnf-0R;
	Mon, 18 Sep 2023 13:15:35 +0000
Received: from mail-ej1-x634.google.com ([2a00:1450:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qiE65-00FVko-32
	for linux-riscv@lists.infradead.org;
	Mon, 18 Sep 2023 13:15:31 +0000
Received: by mail-ej1-x634.google.com with SMTP id a640c23a62f3a-9936b3d0286so602360666b.0
        for <linux-riscv@lists.infradead.org>; Mon, 18 Sep 2023 06:15:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695042927; x=1695647727; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MaxBL4GVnBdz2YK7yA8HCSEthbSs3QSGku6gLlvI2Hc=;
        b=M4OEwiu5pfEIM2T8D8pMVHySLcKQzC7jZ0viSkO4pwZRMQStfAxeLpJoYsIk76BhpF
         ORZcQRwNjsePeRFtxZvrXckQjDW5dEUTjdzYv+h6EGvlGsTbklDQKu8Plp4JhNHo7ukT
         al4sWp+OAzzzkV0QH8aNQGyg+xwSUCh+xKRjGaepRCVcRepeLSbycvSaFJsuf8o8x6pO
         enyWFMakTvhIntIsXgEx65/DzO486DjgmRtQ8sx7iUxR9j1Cq7SJUh3shG1ngfnxVK5W
         x+pbVrXikvVkJWq+ExfkwxT+Dtd3/nJZPk50IKmJsuXPxurw5Px0g5BMPQSgbaC3EsQS
         0Opg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695042927; x=1695647727;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MaxBL4GVnBdz2YK7yA8HCSEthbSs3QSGku6gLlvI2Hc=;
        b=xKtziwDoQcm8+IJ28Q94tK/jDUVcAyXUtJQLNxwdPGJtpJWmCP0fXM1x8oRFLJvF3P
         6Mzltn+shM9LZZdZQMq/6r2wkVs/GXDBBr3vqr77ACQ5LLzFmAih97ahxcVmJZGIKP6u
         jaB+E0cXdk8w2d3DeSb5f2UYyHWxd9Djiz1ejRB5aX4hpx8fx0CLJCdN9ee02KNOWi3X
         lAMliUivF6wirL7GskRBwbnCu6l3hAm6fHJJO6395aUWzSHaYSnnuBJ14lnztk6b3OHc
         cl7umwxKOTGi5UIbfosW23iwEpj561TseO/rNOMLaBGhR/1igazzP+AbZgcY1cf6VdQr
         7MTw==
X-Gm-Message-State: AOJu0Yyd+hrYECquvoRk+v324CvMlfIEaRT3TdvWYT/4Iyc6nBrESSwZ
	9K+yWk9YPGew5u2MjbQDvtcuO3OtVP5vvKo9doU=
X-Google-Smtp-Source: AGHT+IFTKd5g6iODtSVuoqtLamfHZBvarOjCJbfeK0jn/Im200pq7+VzrJt5e3uU2mSbXDrqMVuYkw==
X-Received: by 2002:a17:906:20a:b0:9a5:ac56:3b63 with SMTP id 10-20020a170906020a00b009a5ac563b63mr7405232ejd.63.1695042927591;
        Mon, 18 Sep 2023 06:15:27 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id xj7-20020a170906db0700b009adc77330ebsm5392748ejb.199.2023.09.18.06.15.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Sep 2023 06:15:27 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	xiao.w.wang@intel.com
Subject: [PATCH v4 6/6] RISC-V: selftests: Add CBO tests
Date: Mon, 18 Sep 2023 15:15:25 +0200
Message-ID: <20230918131518.56803-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918131518.56803-8-ajones@ventanamicro.com>
References: <20230918131518.56803-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230918_061529_978536_3F0F5B80 
X-CRM114-Status: GOOD (  26.81  )
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
provide a command line option that enables testing that the Zicbom
instructions cause SIGILL and also that cbo.zero causes SIGILL when
Zicboz it's not present. The SIGILL tests require "opt-in" with a
command line option because the RISC-V ISA does not require
unimplemented standard opcodes to issue illegal-instruction
exceptions (but hopefully most platforms do).

Pinning the test to a subset of cpus with taskset will also restrict
the hwprobe calls to that set.

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/riscv/hwprobe/Makefile  |   7 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 228 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 4 files changed, 250 insertions(+), 12 deletions(-)
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
index 000000000000..50a2cc8aef38
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -0,0 +1,228 @@
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
+#include <string.h>
+#include <sched.h>
+#include <signal.h>
+#include <assert.h>
+#include <linux/compiler.h>
+#include <linux/kernel.h>
+#include <asm/ucontext.h>
+
+#include "hwprobe.h"
+#include "../../kselftest.h"
+
+#define MK_CBO(fn) cpu_to_le32((fn) << 20 | 10 << 15 | 2 << 12 | 0 << 7 | 15)
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
+static void test_no_zicbom(void *arg)
+{
+	ksft_print_msg("Testing Zicbom instructions remain privileged\n");
+
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
+static void test_no_zicboz(void *arg)
+{
+	ksft_print_msg("No Zicboz, testing cbo.zero remains privileged\n");
+
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
+static void test_zicboz(void *arg)
+{
+	struct riscv_hwprobe pair = {
+		.key = RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE,
+	};
+	cpu_set_t *cpus = (cpu_set_t *)arg;
+	__u64 block_size;
+	int i, j;
+	long rc;
+
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)cpus, 0);
+	block_size = pair.value;
+	ksft_test_result(rc == 0 && pair.key == RISCV_HWPROBE_KEY_ZICBOZ_BLOCK_SIZE &&
+			 is_power_of_2(block_size), "Zicboz block size\n");
+	ksft_print_msg("Zicboz block size: %ld\n", block_size);
+
+	illegal_insn = false;
+	cbo_zero(&mem[block_size]);
+	ksft_test_result(!illegal_insn, "cbo.zero\n");
+
+	if (illegal_insn || !is_power_of_2(block_size)) {
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
+static void check_no_zicboz_cpus(cpu_set_t *cpus)
+{
+	struct riscv_hwprobe pair = {
+		.key = RISCV_HWPROBE_KEY_IMA_EXT_0,
+	};
+	cpu_set_t one_cpu;
+	int i = 0, c = 0;
+	long rc;
+
+	while (i++ < CPU_COUNT(cpus)) {
+		while (!CPU_ISSET(c, cpus))
+			++c;
+
+		CPU_ZERO(&one_cpu);
+		CPU_SET(c, &one_cpu);
+
+		rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&one_cpu, 0);
+		assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
+
+		if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ)
+			ksft_exit_fail_msg("Zicboz is only present on a subset of harts.\n"
+					   "Use taskset to select a set of harts where Zicboz\n"
+					   "presence (present or not) is consistent for each hart\n");
+		++c;
+	}
+}
+
+enum {
+	TEST_ZICBOZ,
+	TEST_NO_ZICBOZ,
+	TEST_NO_ZICBOM,
+};
+
+static struct test_info {
+	bool enabled;
+	unsigned int nr_tests;
+	void (*test_fn)(void *arg);
+} tests[] = {
+	[TEST_ZICBOZ]		= { .nr_tests = 3, test_zicboz },
+	[TEST_NO_ZICBOZ]	= { .nr_tests = 1, test_no_zicboz },
+	[TEST_NO_ZICBOM]	= { .nr_tests = 3, test_no_zicbom },
+};
+
+int main(int argc, char **argv)
+{
+	struct sigaction act = {
+		.sa_sigaction = &sigill_handler,
+		.sa_flags = SA_SIGINFO,
+	};
+	struct riscv_hwprobe pair;
+	unsigned int plan = 0;
+	cpu_set_t cpus;
+	long rc;
+	int i;
+
+	if (argc > 1 && !strcmp(argv[1], "--sigill")) {
+		rc = sigaction(SIGILL, &act, NULL);
+		assert(rc == 0);
+		tests[TEST_NO_ZICBOZ].enabled = true;
+		tests[TEST_NO_ZICBOM].enabled = true;
+	}
+
+	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus);
+	assert(rc == 0);
+
+	ksft_print_header();
+
+	pair.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+	rc = riscv_hwprobe(&pair, 1, sizeof(cpu_set_t), (unsigned long *)&cpus, 0);
+	if (rc < 0)
+		ksft_exit_fail_msg("hwprobe() failed with %d\n", rc);
+	assert(rc == 0 && pair.key == RISCV_HWPROBE_KEY_IMA_EXT_0);
+
+	if (pair.value & RISCV_HWPROBE_EXT_ZICBOZ) {
+		tests[TEST_ZICBOZ].enabled = true;
+		tests[TEST_NO_ZICBOZ].enabled = false;
+	} else {
+		check_no_zicboz_cpus(&cpus);
+	}
+
+	for (i = 0; i < ARRAY_SIZE(tests); ++i)
+		plan += tests[i].enabled ? tests[i].nr_tests : 0;
+
+	if (plan == 0)
+		ksft_print_msg("No tests enabled.\n");
+	else
+		ksft_set_plan(plan);
+
+	for (i = 0; i < ARRAY_SIZE(tests); ++i) {
+		if (tests[i].enabled)
+			tests[i].test_fn(&cpus);
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
