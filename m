Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CE6C48BF5
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 00:59:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=s0Mpx0PSqZzSoqslfPkmXW90qgEQC+X832U17xShqGo=; b=oGnRSjb8w0Gjrq
	cVAvY4S66m07+SjWa5+ipcRrr9meNZpKWtPwOdhznWLOwjRJltho6AvTZSQLzMqgJk8YRb/EwzXqC
	LgqLmEAL7pcLGO/5J04Aqmjc7jofjL5eAZTudqzPZXVysUBW4PVrOnci6y9rKTn2ggtxkDk5Scd0L
	/3bjb5O9m93XHpBdnp2w5Gw2MHATX0WfEfFbaE0RuLLVfteGAhozfKq/0RhK83eCjg6oKE9GTTwwK
	iTgYHp/zxq+G5l/91yG2IzICm0I1gKGhQT3FXXWF8KtnndOJx8UmtaUSYapvTHrLk+Ca/f4Dgbx6m
	9G5gKBP0hP9nfFY8Ye8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb93U-00000004JD5-1ODQ;
	Sat, 17 Feb 2024 00:59:48 +0000
Received: from mail-io1-f52.google.com ([209.85.166.52])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rb92p-00000004Iag-4392
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 00:59:17 +0000
Received: by mail-io1-f52.google.com with SMTP id ca18e2360f4ac-7bf2c826a5aso115220639f.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Feb 2024 16:59:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1708131546; x=1708736346; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lkx6F3sDxrDVxzkfg/gwx98H53iZQ+xAtDorLNCTdGY=;
        b=HuGVz15gExGvwJvMgHvmFAX9S/BRCszgJwRICSADzwOKCxOoGv4MZ2e7tR1rzkN5Xk
         YGuHSX1harOSIXitTQaEeHteUB0uTNc4qiyASh80Rg/W0uKpc7e2OdLgY1NxMCNth7yy
         nTYwAsBlyLMRFj+OPsqBc88Hw0SxvmmJxlsaJ4Ig50ZBTmL4En36kBQwu11Xpd62T3JE
         WHQM+jiDBivXTXnufNJgidD/2kEgYLx+TXxedWfLtLlWAFOb+FqUJ7etSxV4l6ZOYmjg
         ztRBCk7PAFXlS1cJmrXS8Yx238BH/J9XPCGKnmvYCm2JA9MR7DqmwSZk4S7b1dEj1A1g
         f/Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708131546; x=1708736346;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Lkx6F3sDxrDVxzkfg/gwx98H53iZQ+xAtDorLNCTdGY=;
        b=um2ifuDUwJWAz2fOOvtJ7FXnWsGXIp9XnxvuPEmHK8pRDJJoAzMcMS7LR5wO+ClLwj
         i3qjrKD9DtMJEqChOTMbs5dv3Zs4wInovfA1vsrR/CaeIDdhR1JCN0Bwev1yVLbO9IWM
         uV1biXvT6UGeaVNTgrsVNnTBj0z4WIEYozhErzu2PzP5qVYtkWPS2ukgQTLXmdFZYvuf
         NrhhXI0u6mVvxyKg69Yd8t1EINNm5OARPQhMmlAcN9eZCipPOcs5y90Xru94D+pECA49
         cNkV46YAVMe0WcEouZKC49WnSz3Ky9RG1MAVqPRVABIvde0vG6GKg6VPeOxPc27Z/OQw
         jMRg==
X-Forwarded-Encrypted: i=1; AJvYcCVF8cwKGgQTLFMeCXjK6OP2yIpS3+3Yvm4G3UsBMnpN3MX9wdCLoLWGMJJj30wDNaFGxfkNcYEbb1rvZsdnoQEx5IRzpeGnHOXnUu0tblZf
X-Gm-Message-State: AOJu0YzCu3Zh2QgMkrnV2+6jlWr2HUWK/3Y3c2su2PgjEG9ABq73EeUI
	MZQ6EpO0jEj0LWQGvHt20jQCAm+yIGoj/+pWaZK5JpcsfzCN+H3L03bdBQ1S4Ok=
X-Google-Smtp-Source: AGHT+IEe3ejDyxspMJxarQru2mpOZGVU3gTQalogFZ4IV/qmTtJpwp0XG9IR02+mun9kkUrwLV3/Rw==
X-Received: by 2002:a05:6602:2766:b0:7c4:9618:5fcb with SMTP id l6-20020a056602276600b007c496185fcbmr7195778ioe.8.1708131546705;
        Fri, 16 Feb 2024 16:59:06 -0800 (PST)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d188-20020a6336c5000000b005dc89957e06sm487655pga.71.2024.02.16.16.59.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Feb 2024 16:59:06 -0800 (PST)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atishp@rivosinc.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Anup Patel <anup@brainfault.org>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Atish Patra <atishp@atishpatra.org>,
	Christian Brauner <brauner@kernel.org>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	devicetree@vger.kernel.org,
	Evan Green <evan@rivosinc.com>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Ian Rogers <irogers@google.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Clark <james.clark@arm.com>,
	Jing Zhang <renyu.zj@linux.alibaba.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>,
	John Garry <john.g.garry@oracle.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Kan Liang <kan.liang@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	Ley Foon Tan <leyfoon.tan@starfivetech.com>,
	linux-doc@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>,
	Namhyung Kim <namhyung@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Rob Herring <robh+dt@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Weilin Wang <weilin.wang@intel.com>,
	Will Deacon <will@kernel.org>,
	kaiwenxue1@gmail.com,
	Yang Jihong <yangjihong1@huawei.com>
Subject: [PATCH RFC 20/20] tools/perf: Detect if platform supports counter delegation
Date: Fri, 16 Feb 2024 16:57:38 -0800
Message-Id: <20240217005738.3744121-21-atishp@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240217005738.3744121-1-atishp@rivosinc.com>
References: <20240217005738.3744121-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240216_165908_375949_9398806D 
X-CRM114-Status: GOOD (  21.17  )
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

The perf tool currently remap the standard events to the encoding
specified by the platform in the json file. We need that only if
the counter delegation extension is present. Otherwise, SBI PMU
interface is used which defines the encoding for all standard
events.

The hwprobe mechanism can be used to detect the presence of these
extensions and remap the encoding space only in that case.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 tools/perf/arch/riscv/util/Build    |  1 +
 tools/perf/arch/riscv/util/evlist.c |  3 ++-
 tools/perf/arch/riscv/util/pmu.c    | 41 +++++++++++++++++++++++++++++
 tools/perf/arch/riscv/util/pmu.h    | 11 ++++++++
 4 files changed, 55 insertions(+), 1 deletion(-)
 create mode 100644 tools/perf/arch/riscv/util/pmu.c
 create mode 100644 tools/perf/arch/riscv/util/pmu.h

diff --git a/tools/perf/arch/riscv/util/Build b/tools/perf/arch/riscv/util/Build
index b581fb3d8677..2358f0666e8d 100644
--- a/tools/perf/arch/riscv/util/Build
+++ b/tools/perf/arch/riscv/util/Build
@@ -1,6 +1,7 @@
 perf-y += perf_regs.o
 perf-y += header.o
 perf-y += evlist.o
+perf-y += pmu.o
 
 perf-$(CONFIG_DWARF) += dwarf-regs.o
 perf-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
diff --git a/tools/perf/arch/riscv/util/evlist.c b/tools/perf/arch/riscv/util/evlist.c
index 9ad287c6f396..aa7eef7280ca 100644
--- a/tools/perf/arch/riscv/util/evlist.c
+++ b/tools/perf/arch/riscv/util/evlist.c
@@ -6,6 +6,7 @@
 #include "util/parse-events.h"
 #include "util/event.h"
 #include "evsel.h"
+#include "pmu.h"
 
 static int pmu_update_cpu_stdevents_callback(const struct pmu_event *pe,
 					     const struct pmu_events_table *table __maybe_unused,
@@ -41,7 +42,7 @@ int arch_evlist__override_default_attrs(struct evlist *evlist, const char *pmu_n
 							  "iTLB-load-misses"};
 	unsigned int i, len = sizeof(overriden_event_arr) / sizeof(char *);
 
-	if (!pmu)
+	if (!pmu || !perf_pmu_riscv_cdeleg_present())
 		return 0;
 
 	for (i = 0; i < len; i++) {
diff --git a/tools/perf/arch/riscv/util/pmu.c b/tools/perf/arch/riscv/util/pmu.c
new file mode 100644
index 000000000000..79f0974e27f8
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.c
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Copyright Rivos Inc 2024
+ * Author(s): Atish Patra <atishp@rivosinc.com>
+ */
+
+#include <string.h>
+#include <stdio.h>
+#include <asm/hwprobe.h>
+#include <unistd.h>
+#include <sys/syscall.h>
+
+#include "pmu.h"
+
+static bool counter_deleg_present;
+
+bool perf_pmu_riscv_cdeleg_present(void)
+{
+	return counter_deleg_present;
+}
+
+void perf_pmu__arch_init(struct perf_pmu *pmu __maybe_unused)
+{
+	struct riscv_hwprobe isa_ext;
+	int ret;
+
+	isa_ext.key = RISCV_HWPROBE_KEY_IMA_EXT_0;
+
+	ret = syscall(__NR_riscv_hwprobe, &isa_ext, 1, 0, NULL, 0);
+	if (ret)
+		return;
+
+	if (isa_ext.key < 0)
+		return;
+
+	if ((isa_ext.value & RISCV_HWPROBE_EXT_SSCSRIND) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SMCDELEG) &&
+	    (isa_ext.value & RISCV_HWPROBE_EXT_SSCCFG))
+		counter_deleg_present = true;
+}
diff --git a/tools/perf/arch/riscv/util/pmu.h b/tools/perf/arch/riscv/util/pmu.h
new file mode 100644
index 000000000000..21f33f7d323d
--- /dev/null
+++ b/tools/perf/arch/riscv/util/pmu.h
@@ -0,0 +1,11 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __RISCV_UTIL_PMU_H
+#define __RISCV_UTIL_PMU_H
+
+#include "../../../util/pmu.h"
+
+
+bool perf_pmu_riscv_cdeleg_present(void);
+
+#endif
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
