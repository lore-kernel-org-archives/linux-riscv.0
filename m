Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 194BBC61DA7
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Nov 2023 16:47:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NUjH/xvfJQ6zek06FaW2TifHv/u08YQ3/WGV2fSA2SU=; b=jEa20/cFTs5NRK
	rkOnNaLrbvxSbIhiQM+trcqnIkdet7vJbLiy5yUyyJkgFQhFMo9qc/AOBRAAmmoOSQCwbkCRMQKsN
	a5X0t2Rr0B5/y+/oyaeWlGProgGc6/TuC9v5ej4wC0uJvuMjmmSnpTqr3vv/mUI4Z+LL56f0CaTq8
	uBGwjQYv6TfcFNp+4EJgDY2SniB6ydeEocK0bW0KEvxNPvitTMGYyRVT3I7fxGf6e20hsGWuo90sw
	f+kloaclLcUfuNOnBqHLmQ1TgbxXOr3tRf+7xQ0XzGJcWayaQt0fQB0ADyKinUTpeN5H4NKwOhasE
	IDaqR1pSMW+ngivf0qSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNg-002YN7-1Z;
	Wed, 22 Nov 2023 16:47:16 +0000
Received: from mail-ed1-x536.google.com ([2a00:1450:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r5qNb-002YJA-0k
	for linux-riscv@lists.infradead.org;
	Wed, 22 Nov 2023 16:47:13 +0000
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-54a94e68fb1so464207a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Nov 2023 08:47:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1700671627; x=1701276427; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xW5hnIOVFV1bNWsYO0Gvhpn28ZI+z4I4pvjLzlVdAYE=;
        b=YUUdyAM2T/b4BUGS50K9ujBJghi7SfT3HpfpjWKAKY8fgyZlQlkb25BZsd+TYpeLh+
         EI6PdpZEIBiEAvgkihExPengGiipeAug2Tk3C1+EfM6GKZYvUuF9wAx2Rtv3P3hbSCt8
         FDN4Dre+A5cGDVFmPwX2G7TXdbpdhpxvcsz+3CZeXvLmDpe9Z8aNXRzT11FlhG2k2D3R
         Y0/RxMB4AcPu0D+k3wFtbPaJMMvMGlwnosTZAPOcuGqUqu9daTGUnhWfCHroBHLu84rp
         ttCe4z8Wll4og7vYsfFPrA5oh4LvFVZNO8m/kQ7KVwwr4WE+O2RGd6dBoPhJnfBnlSxT
         /LoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700671627; x=1701276427;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xW5hnIOVFV1bNWsYO0Gvhpn28ZI+z4I4pvjLzlVdAYE=;
        b=HO/khQ7RwzrTT/XQIaU9BG3OR4gWYrkXwqeRMjdQKLO4ASoRysfUebtIq+nkj4w5SJ
         pXJM/JQD4+k0JFSvWTojiIZZqWDSfhuND7+q97y64vQu/H0sFQQ47EBS/TZI/z1ZHyBE
         +ca/DnqUDx5ADC/JqjxljAN+c5tlg4Lm85a4LoLjA3GqB+71K9a/uaDuCfIsNvbT7RHn
         D4xZmMlrQ0z8QlwfhgqFc23+bWW47+s8A2ovlZg1yqMHLshiUCk3DYa781NOP8wVHWHU
         1GWJ/jO54Llw/DwZVJ70/WOHRiKNovTpsmtM/swjeQQKXrbAg+xzayU5BaLaz7UUV0h2
         06tw==
X-Gm-Message-State: AOJu0YyoTeEkslQYEJhJqrvZtrdi2EUqObEGT9+cXoGL+uAzqxAbgSJW
	I9biuybQKP9dJ2zGgGcMbFncWbld6re+fnb//P8=
X-Google-Smtp-Source: AGHT+IFKs3iNkpIg+1vd+99yodiRa+SNjk5MLZ/jiQPZwJK8EMei4JyXrGKBfj2tPDDq8dYnP+ZZ3Q==
X-Received: by 2002:a17:906:224c:b0:9e5:1db7:3199 with SMTP id 12-20020a170906224c00b009e51db73199mr30956ejr.4.1700671627374;
        Wed, 22 Nov 2023 08:47:07 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id k21-20020a1709063e1500b009fd4583851esm4584602eji.178.2023.11.22.08.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Nov 2023 08:47:07 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	evan@rivosinc.com,
	conor.dooley@microchip.com,
	apatel@ventanamicro.com,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: [PATCH v3 4/4] RISC-V: selftests: Add which-cpus hwprobe test
Date: Wed, 22 Nov 2023 17:47:05 +0100
Message-ID: <20231122164700.127954-10-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231122164700.127954-6-ajones@ventanamicro.com>
References: <20231122164700.127954-6-ajones@ventanamicro.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231122_084711_285282_DE9A94F5 
X-CRM114-Status: GOOD (  18.72  )
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
 .../selftests/riscv/hwprobe/which-cpus.c      | 154 ++++++++++++++++++
 2 files changed, 158 insertions(+), 1 deletion(-)
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
-- 
2.41.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
