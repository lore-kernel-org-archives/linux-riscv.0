Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CD6E7106A
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Sep 2023 12:55:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PLjAmeyG2Do1DvqI/JVe5VINdA1Tp6W+Pymw1Fo9jqw=; b=03lHE670Nfv/9N
	hlY/yIAxH28i+SS/cza9Wz3I4F5EJ7S8l6n5PI7Gi/AU1kT+w2nXIn6BNol2Sx0Vnsn/vxEWi9zDP
	bv/OcCLiPbEx4XEZ0SKzch/SOY/nl5wZhSlI4NeCZgu7zgqn1nyH+Ps/b9t7ysVnA7MD/c5VaaK9M
	GFkz9N1kxsmBIEk+G9EewsnzctnOPW7yl88QjexFom7a3o3jIiyUgQhsbsGHRU3hsC4gW0ckxC3bq
	dBBKXMgvsafcuiGqjYn+QTeWHgBpN/HUbyb0MYqwvzhnkSVXk/aCt2ATyK9rPxVd2FXpraQw3wknO
	6wGmhzN9xVkTUtW+0C0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDR-0064B5-0p;
	Thu, 21 Sep 2023 12:55:33 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjJDN-00649I-1N
	for linux-riscv@lists.infradead.org;
	Thu, 21 Sep 2023 12:55:31 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-31c5cac3ae2so876927f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 21 Sep 2023 05:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1695300925; x=1695905725; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+b2HiTvXqlhJ3BKT2MnKrXcpMlIy42BB1+QQ4n/q7Z4=;
        b=hXfqW/l5XZnnD4dBrufHQl4iLf5FlWkGPJODnmC5q4oJY78/QrZqGY9us+iYgb+bgN
         EW+VGtDZEFUF9ojLSyMqxHCY5zP4hTfiagAt8Gyk2fcfuCq2IjKCCpvLc6ERBrEkcUHv
         gAuGl0SKsa/KNG6wKFBripsj/XkvFfCHwkXC8XqMNp5rdCwSeupGHPwMcH26JT+SdhNI
         lQcJcgfclXe4PjHAXvI1aFKYuI8JL5qMZB8dr/+HhL4ES+lGrtSF4kbgNHkgRIYSvx4Z
         kLQ9ajv5i40yhjh9eBhs9N95U3iFOJuiJ+F8PaH3tHtI/nNI6Pd1Z371nSgXadFp4HM2
         RwRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695300926; x=1695905726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+b2HiTvXqlhJ3BKT2MnKrXcpMlIy42BB1+QQ4n/q7Z4=;
        b=N3mHWVJ+ZvKmaMaojTildEfnGwJsjW28pEWnjIaiSpqO40NKuG1ijYrfA6ZLhBekR7
         /mvizmj66Ec4Z1FxuXst7jM3rmBTMvfk2tmCeB73d78fX2shQaZV2RZJOggyU+8xgX1h
         MvCvOyG9DLdokILxR+3w1e3oTYAgcBBVvjzlvhyskGvO/s2CXEsC9D+8lTPNDanatD/W
         jQSpKCcVdmZKI8O4nHqRY46yOP2xPrGKb8RJbnNGqdjEe4tSNKm+JU1d9+bQk9h9QrUR
         gkryUwOX/vSmpOQ7wkVCK3Qzx79KI2BGfe+FQBtRF/U9DSphZmLtufpKIU6xroc4CUib
         543Q==
X-Gm-Message-State: AOJu0YyjVMAvizEq0xlcMfdGxf4IGCN58kGoMpNhf5dSA9epaHbxg31d
	WG/HVCmj9qomfnkTrY+C5U14wo1NZ193uZhVTBo=
X-Google-Smtp-Source: AGHT+IFbzB+WuZNNZwfYHjbQh1nmEjzffgC9uxWjYyjKwgdxR4XVnwUWvBqWM6FxRiU40VvLBaOonQ==
X-Received: by 2002:adf:fd92:0:b0:320:371:afbf with SMTP id d18-20020adffd92000000b003200371afbfmr4600955wrr.10.1695300925523;
        Thu, 21 Sep 2023 05:55:25 -0700 (PDT)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id x5-20020adfdcc5000000b0031c6581d55esm1714126wrm.91.2023.09.21.05.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Sep 2023 05:55:25 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com
Subject: [RFC PATCH 4/5] RISC-V: selftests: Add which-cpus hwprobe test
Date: Thu, 21 Sep 2023 14:55:23 +0200
Message-ID: <20230921125518.175428-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230921125518.175428-7-ajones@ventanamicro.com>
References: <20230921125518.175428-7-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_055529_465382_48ECA03E 
X-CRM114-Status: GOOD (  19.06  )
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

Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 .../testing/selftests/riscv/hwprobe/Makefile  |   5 +-
 .../selftests/riscv/hwprobe/which-cpus.c      | 156 ++++++++++++++++++
 2 files changed, 160 insertions(+), 1 deletion(-)
 create mode 100644 tools/testing/selftests/riscv/hwprobe/which-cpus.c

diff --git a/tools/testing/selftests/riscv/hwprobe/Makefile b/tools/testing/selftests/riscv/hwprobe/Makefile
index f224b84591fb..cec81610a5f2 100644
--- a/tools/testing/selftests/riscv/hwprobe/Makefile
+++ b/tools/testing/selftests/riscv/hwprobe/Makefile
@@ -4,7 +4,7 @@
 
 CFLAGS += -I$(top_srcdir)/tools/include
 
-TEST_GEN_PROGS := hwprobe cbo
+TEST_GEN_PROGS := hwprobe cbo which-cpus
 
 include ../../lib.mk
 
@@ -13,3 +13,6 @@ $(OUTPUT)/hwprobe: hwprobe.c sys_hwprobe.S
 
 $(OUTPUT)/cbo: cbo.c sys_hwprobe.S
 	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
+
+$(OUTPUT)/which-cpus: which-cpus.c sys_hwprobe.S
+	$(CC) -static -o$@ $(CFLAGS) $(LDFLAGS) $^
diff --git a/tools/testing/selftests/riscv/hwprobe/which-cpus.c b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
new file mode 100644
index 000000000000..83877a715b08
--- /dev/null
+++ b/tools/testing/selftests/riscv/hwprobe/which-cpus.c
@@ -0,0 +1,156 @@
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
+static void do_which_cpus(int argc, char **argv)
+{
+	struct riscv_hwprobe *pairs;
+	int nr_pairs = argc - 1;
+	cpu_set_t cpus;
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
+	CPU_ZERO(&cpus);
+	rc = riscv_hwprobe(pairs, nr_pairs, sizeof(cpu_set_t), (unsigned long *)&cpus, RISCV_HWPROBE_WHICH_CPUS);
+	assert(rc == 0);
+	print_cpulist(&cpus);
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
+	if (argc > 1) {
+		if (!strcmp(argv[1], "-h"))
+			help();
+		else
+			do_which_cpus(argc, argv);
+		return 0;
+	}
+
+	rc = sched_getaffinity(0, sizeof(cpu_set_t), &cpus_aff);
+	assert(rc == 0);
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
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
