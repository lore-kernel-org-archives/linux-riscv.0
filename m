Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E6DC04E69
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Aug 2023 11:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0tcxUgjXh+i4W7VlpXvnMgUoyYCTvQ7nRLEFZFpr8Ps=; b=CmZO4vmLR8+ofV
	iUNdETEvtuGIZCJ6zHIsSV4kmimJr2ol8v0IcSmcKwXsalTqTD8bTRv/gYYJ4euk7M7MIT3ql1nUw
	19DkCBnQ8Yg9W01oWL1qaWvOXrW5XL5myw3Rej988Ram7iEZi6GwIm4YtyhB97tUZWM+hOWfCOX3R
	07Kjo44E1zEGWrutyQ4xz0twPKfu/y7NeXzvZ09yzSckvdDPW7Fwfmp/+VPyYZw5lTEoqncyVIybG
	dF1Wfr2OW0bDKG2rE3YTj7XNqJkS8XStUVVom12F1oA2A3afwpj8DBOFL1xDzRh/8QFV8v4r5on+t
	8TgD6tkyOxuHnHzsQO4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qThml-004pdl-1p;
	Wed, 09 Aug 2023 11:55:31 +0000
Received: from mail-ej1-x643.google.com ([2a00:1450:4864:20::643])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qThmg-004pak-1B
	for linux-riscv@lists.infradead.org;
	Wed, 09 Aug 2023 11:55:28 +0000
Received: by mail-ej1-x643.google.com with SMTP id a640c23a62f3a-9923833737eso934584966b.3
        for <linux-riscv@lists.infradead.org>; Wed, 09 Aug 2023 04:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691582125; x=1692186925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pzukxesZyeAGqiMp1/lJmbX9ehoU1fuGdrPKFB3HIzs=;
        b=lVMZxniFqhms8vc/qD4QTxtVjaVCz2uFdPynHQaxG7Dqjm+aQLaB891aAT65L23Kqr
         oPnlpNTDnpOA5jqmFba7ZrdlTe0wo+UNRjTYDAFay/0BnOAqpBwbrVBYycrq/2i4UpUL
         z+vLWBKwsk0MpEYDdhlOVqrrNAhO8NCqGb9vXB6a6xQW7xBoUz9080X4UmXTZq4zxHGm
         /w8Ou3n9F9cCnoA5WofjAi2I/19OF8d+pQmqvNQ+CyY2nO/UdmrCoKZu6Sy420EXosHW
         ZB0z0mWTvcqw0RSXcLu5OuFofaaFJ2N0guCwiPDCGOQLjVOL9YCjg+wPBJaenzVavpNF
         YiRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691582125; x=1692186925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pzukxesZyeAGqiMp1/lJmbX9ehoU1fuGdrPKFB3HIzs=;
        b=BTzsc+1OgxfGoGgD3WSeV6sxGPPPMJFbygJ3D08Z4j0ZLUE7zrgbVPpy1aumAmTdoo
         MPOOvcNY3Co5VCjhIvrl8QrZjC6MdgpT2ObLwiAinAbrpVGEAY1IuMoIH6FV1RR9DeNi
         VR4G4FwD0cXuX1hPj5JH4M7Iz/9FjMcVacc4IWqcfIyKT3+aay6zB5JJDPTjzpejmHoS
         +Bq/6tNJ96TFLEOn16dIJfyWQIccyy3qZJjgNAxy5NYuFsumJPv6mMPXreCMAmR0JBNh
         waDzK+lXzdugyVsmsY5B8AvBPyZNZr2ImDt1IuD3yRdvxzobUWKia1RtjSd4OmqWqE5i
         gNCA==
X-Gm-Message-State: AOJu0YzVpp1VEECn0OpVThy4rpK0SIB0ka8715jv9G+Zw3eWmM2TqbMw
	qqsumc0a1vVkUV7+5iKgHpHoG36Eyd0I4kPulI22Lxqc/iI=
X-Google-Smtp-Source: AGHT+IEK6C8NPd6lvm5X2uClqSrQECngKkWVS/Tx2TFiDd8R4o5OzU/GMCNFIC9Nhfl5Wza+/fMZrg==
X-Received: by 2002:a17:906:5304:b0:99b:f3ef:f088 with SMTP id h4-20020a170906530400b0099bf3eff088mr2249480ejo.69.1691582124904;
        Wed, 09 Aug 2023 04:55:24 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id lr4-20020a170906fb8400b0098748422178sm7840535ejb.56.2023.08.09.04.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 04:55:24 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [PATCH 6/6] RISC-V: selftests: Add CBO tests
Date: Wed,  9 Aug 2023 13:55:23 +0200
Message-ID: <20230809115516.214537-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230809115516.214537-8-ajones@ventanamicro.com>
References: <20230809115516.214537-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230809_045526_424739_DF387063 
X-CRM114-Status: GOOD (  24.01  )
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
 tools/testing/selftests/riscv/Makefile        |   2 +-
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 tools/testing/selftests/riscv/hwprobe/cbo.c   | 160 ++++++++++++++++++
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 5 files changed, 181 insertions(+), 13 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/cbo.c
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h

diff --git a/tools/testing/selftests/riscv/Makefile b/tools/testing/selftests/riscv/Makefile
index f4b3d5c9af5b..7bbeec48292d 100644
--- a/tools/testing/selftests/riscv/Makefile
+++ b/tools/testing/selftests/riscv/Makefile
@@ -16,7 +16,7 @@ CFLAGS := -Wall -O2 -g
 top_srcdir = $(realpath ../../../../)
 
 # Additional include paths needed by kselftest.h and local headers
-CFLAGS += -I$(top_srcdir)/tools/testing/selftests/
+CFLAGS += -I$(top_srcdir)/tools/testing/selftests/ -I$(top_srcdir)/tools/include
 
 CFLAGS += $(KHDR_INCLUDES)
 
diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index 5f614c3ba598..56e54d66df7e 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -2,9 +2,12 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := hwprobe
+TEST_GEN_PROGS := hwprobe cbo
 
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/cbo: cbo.c sys_hwprobe.S
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/cbo.c b/tools/testing/selftests/riscv/hwprobe/cbo.c
new file mode 100644
index 000000000000..6fa01e4cec99
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/cbo.c
@@ -0,0 +1,160 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
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
