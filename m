Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD15CD6E71
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Oct 2023 13:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wc8QbgBVIr/yR17lbh9WVn4cQNrhwkun/moyHSkYfKM=; b=I/5b89u9eXSOCX
	xk9NrO7mZnMW4sCBoVxmeJ2f/NVwKzqZiF/UHKyGmMyEQrt8AuN1+I8fpDqI7S+oj2uOuunK6li0S
	ukmnVajK3sqiIZBRl0CWobxzT3xaYerA7QFYsedaZu2IlNj7G5XAlDj9qUL4o6Qj2Tl/QLOY3AtA9
	KxUZXtnPn0YgAvfBLsOm5Ab0emwtopDWvgHViQ3mKzo2gPNJntKnHQxO4DI5XFliCMh8m+dEGP1+s
	poq0m6k0pbi/Mu94lOGnlcCUa0SwggYLVUiU+57pucHJpKbiIsEkb0iSxNsaO9r2I8D71IYVvnGRm
	Bc5NyNM8y7din0MMXDVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhM-00G22x-04;
	Wed, 11 Oct 2023 13:56:28 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqZhH-00G1yM-0L
	for linux-riscv@lists.infradead.org;
	Wed, 11 Oct 2023 13:56:25 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-32d569e73acso1449197f8f.1
        for <linux-riscv@lists.infradead.org>; Wed, 11 Oct 2023 06:56:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1697032579; x=1697637379; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0bGzpuc+yeHSXu2C5TVrGEmMMhHJkLHx0wMD8H+kEnQ=;
        b=lGN+Zc9lCy40Qf/zI/EutaRAhORrx48ZG2A4BC8+XaPeXBCBEuFOwEHdPZmwJTft4n
         02RDE8vbwn4ZpFD6qCP+CHZeEO5HHE1kS8yusEixeiA0t2iowOvz9bMzEW4WujxhYBUC
         kYs/izbSjXXXYgLsJNFt/Z+b6IqotyinmF8NKhg15sp6x7bI7MvC2MtTRrpujv2Q+ASX
         IFhma9h2GB9ZOQYSqweXWo+C3PJrwy9gWytQEr66vtNY8KznuVy8w+LT2cYd4PpyS5zS
         0lfpOUi1Qbspc8yhlITtV6bBn27pYGSlAozqNYDgqSDO9NCZSp5g4qLCkWmYnBkeGYfk
         abiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697032579; x=1697637379;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0bGzpuc+yeHSXu2C5TVrGEmMMhHJkLHx0wMD8H+kEnQ=;
        b=gmcZhWyaUMNXdkAM19zp8rTLfOvXcl3BgB3Ox4KMTerF3ypRaf46Jhlh+T9IrjZEc+
         b8V9ZaTqoWMKvXyV/eC98Td0doyXLde0w6ZZ5iSnQVLbi36D0XEGHgsQij4D262tooSH
         xJKSnqp1YqxAQITgDfJ3nHei2mWWeCY/3NsLclxb+6wHQUoX4cSiN51T2MAWTyCiwWta
         vto9Ol34WGtk/oNZdB3CzJ2xgONmXhI7A2m8bkXLYlSRtlgC2xq62tyGZAv21LtW8KnO
         NXOjq0AFUqgWLu6GuTX8zzhtMIjgKUM5brqh2K1JkhlfXwEaG2/I8OFZdS4ZuhD6/jTY
         DcyA==
X-Gm-Message-State: AOJu0YzKc1hjuRWfTqrFZrRCB7XU2PmZ2SZ120se9WYmxAWQfZ1a5VL1
	/drhTB9pxBcDjfReHNcaVcXykyojNYzxHU3W9Fo=
X-Google-Smtp-Source: AGHT+IHsNJXOzAS0Kp7T6qwcd+JiVj50QZ/pbJoy+Pc6WMV8M13OgKVio1C2mziFO40GFqwhfw+5GQ==
X-Received: by 2002:a5d:504e:0:b0:321:4c7e:45e3 with SMTP id h14-20020a5d504e000000b003214c7e45e3mr18490744wrt.11.1697032579350;
        Wed, 11 Oct 2023 06:56:19 -0700 (PDT)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id x11-20020a05600c21cb00b00405bbfd5d16sm17093633wmj.7.2023.10.11.06.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 06:56:18 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v1 6/6] RISC-V: selftests: Add which-cpus hwprobe test
Date: Wed, 11 Oct 2023 15:56:17 +0200
Message-ID: <20231011135610.122850-14-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231011135610.122850-8-ajones@ventanamicro.com>
References: <20231011135610.122850-8-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231011_065623_187181_97E2250C 
X-CRM114-Status: GOOD (  22.85  )
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

Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. The test also
has a command line interface in order to get the cpu list for
arbitrary hwprobe pairs.

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.c |  12 +-
 .../testing/selftests/riscv/hwprobe/hwprobe.h |  15 ++
 .../selftests/riscv/hwprobe/which-cpus.c      | 154 ++++++++++++++++++
 .../selftests/riscv/vector/vstate_prctl.c     |  10 +-
 5 files changed, 175 insertions(+), 21 deletions(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/hwprobe.h
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index 5f614c3ba598..210a8d7325b0 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -2,9 +2,12 @@
 # Copyright (C) 2021 ARM Limited
 # Originally tools/testing/arm64/abi/Makefile
 
-TEST_GEN_PROGS := hwprobe
+TEST_GEN_PROGS := hwprobe which-cpus
 
 include ../../lib.mk
 
 $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/hwprobe.c b/tools/testing/selftests/riscv/hwprobe/hwprobe.c
index 56cdca53f54a..d53e0889b59e 100644
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
index 000000000000..e3fccb390c4d
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
+		   size_t cpusetsize, unsigned long *cpus, unsigned int flags);
+
+#endif
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
new file mode 100644
index 000000000000..82c121412dfc
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -0,0 +1,154 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2023 Ventana Micro Systems Inc.
+ *
+ * Test the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe. Also provides a command
+ * line interface to get the cpu list for arbitrary hwprobe pairs.
+ */
+#define _GNU_SOURCE
+#include <stdio.h>
+#include <stdlib.h>
+#include <string.h>
+#include <sched.h>
+#include <unistd.h>
+#include <assert.h>
+
+#include "hwprobe.h"
+#include "../../kselftest.h"
+
+static void help(void)
+{
+	printf("\n"
+	       "which-cpus: [-h] [<key=value> [<key=value> ...]]\n\n"
+	       "   Without parameters, tests the RISCV_HWPROBE_WHICH_CPUS flag of hwprobe.\n"
+	       "   With parameters, where each parameter is a hwprobe pair written as\n"
+	       "   <key=value>, outputs the cpulist for cpus which all match the given set\n"
+	       "   of pairs.  'key' and 'value' should be in numeric form, e.g. 4=0x3b\n");
+}
+
+static void print_cpulist(cpu_set_t *cpus)
+{
+	int start = 0, end = 0;
+
+	if (!CPU_COUNT(cpus)) {
+		printf("cpus: None\n");
+		return;
+	}
+
+	printf("cpus:");
+	for (int i = 0, c = 0; i < CPU_COUNT(cpus); i++, c++) {
+		if (start != end && !CPU_ISSET(c, cpus))
+			printf("-%d", end);
+
+		while (!CPU_ISSET(c, cpus))
+			++c;
+
+		if (i != 0 && c == end + 1) {
+			end = c;
+			continue;
+		}
+
+		printf("%c%d", i == 0 ? ' ' : ',', c);
+		start = end = c;
+	}
+	if (start != end)
+		printf("-%d", end);
+	printf("\n");
+}
+
+static void do_which_cpus(int argc, char **argv, cpu_set_t *cpus)
+{
+	struct riscv_hwprobe *pairs;
+	int nr_pairs = argc - 1;
+	char *start, *end;
+	int rc;
+
+	pairs = malloc(nr_pairs * sizeof(struct riscv_hwprobe));
+	assert(pairs);
+
+	for (int i = 0; i < nr_pairs; i++) {
+		start = argv[i + 1];
+		pairs[i].key = strtol(start, &end, 0);
+		assert(end != start && *end == '=');
+		start = end + 1;
+		pairs[i].value = strtoul(start, &end, 0);
+		assert(end != start && *end == '\0');
+	}
+
+	rc = riscv_hwprobe(pairs, nr_pairs, sizeof(cpu_set_t), (unsigned long *)cpus, RISCV_HWPROBE_WHICH_CPUS);
+	assert(rc == 0);
+	print_cpulist(cpus);
+	free(pairs);
+}
+
+int main(int argc, char **argv)
+{
+	struct riscv_hwprobe pairs[2];
+	cpu_set_t cpus_aff, cpus;
+	__u64 ext0_all;
+	long rc;
+
+	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus_aff);
+	assert(rc == 0);
+
+	if (argc > 1) {
+		if (!strcmp(argv[1], "-h"))
+			help();
+		else
+			do_which_cpus(argc, argv, &cpus_aff);
+		return 0;
+	}
+
+	ksft_print_header();
+	ksft_set_plan(7);
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, };
+	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
+	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_BASE_BEHAVIOR &&
+	       pairs[0].value == RISCV_HWPROBE_BASE_BEHAVIOR_IMA);
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, };
+	rc = riscv_hwprobe(pairs, 1, 0, NULL, 0);
+	assert(rc == 0 && pairs[0].key == RISCV_HWPROBE_KEY_IMA_EXT_0);
+	ext0_all = pairs[0].value;
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	CPU_ZERO(&cpus);
+	rc = riscv_hwprobe(pairs, 1, 0, (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == -EINVAL, "no cpusetsize\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	rc = riscv_hwprobe(pairs, 1, sizeof(cpu_set_t), NULL, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == -EINVAL, "NULL cpus\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = 0xbadc0de, };
+	CPU_ZERO(&cpus);
+	rc = riscv_hwprobe(pairs, 1, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "unknown key\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	CPU_ZERO(&cpus);
+	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == 0, "duplicate keys\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	CPU_ZERO(&cpus);
+	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == sysconf(_SC_NPROCESSORS_ONLN), "set all cpus\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ext0_all, };
+	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
+	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == 0 && CPU_EQUAL(&cpus, &cpus_aff), "set all affinity cpus\n");
+
+	pairs[0] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_BASE_BEHAVIOR, .value = RISCV_HWPROBE_BASE_BEHAVIOR_IMA, };
+	pairs[1] = (struct riscv_hwprobe){ .key = RISCV_HWPROBE_KEY_IMA_EXT_0, .value = ~ext0_all, };
+	memcpy(&cpus, &cpus_aff, sizeof(cpu_set_t));
+	rc = riscv_hwprobe(pairs, 2, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	ksft_test_result(rc == 0 && CPU_COUNT(&cpus) == 0, "clear all cpus\n");
+
+	ksft_finished();
+}
diff --git a/tools/testing/selftests/riscv/vector/vstate_prctl.c b/tools/testing/selftests/riscv/vector/vstate_prctl.c
index b348b475be57..8dcd399ef7fc 100644
--- a/tools/testing/selftests/riscv/vector/vstate_prctl.c
+++ b/tools/testing/selftests/riscv/vector/vstate_prctl.c
@@ -1,20 +1,12 @@
 // SPDX-License-Identifier: GPL-2.0-only
 #include <sys/prctl.h>
 #include <unistd.h>
-#include <asm/hwprobe.h>
 #include <errno.h>
 #include <sys/wait.h>
 
+#include "../hwprobe/hwprobe.h"
 #include "../../kselftest.h"
 
-/*
- * Rather than relying on having a new enough libc to define this, just do it
- * ourselves.  This way we don't need to be coupled to a new-enough libc to
- * contain the call.
- */
-long riscv_hwprobe(struct riscv_hwprobe *pairs, size_t pair_count,
-		   size_t cpu_count, unsigned long *cpus, unsigned int flags);
-
 #define NEXT_PROGRAM "./vstate_exec_nolibc"
 static int launch_test(int test_inherit)
 {
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
