Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 967E2D5AE6B
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 07:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=El3LU8aAL5hFyUddrW29sI7YSwV6A/036V4gVsHFu4c=; b=J5RYVRDObSs8PY
	ythVJwnFK7e1GbMi6zjFq8JRKS+KgUjkrAz/uh+tT5hlwk5tVG2FGFRqmOx9oosEI26Ar8eKG6vBD
	iXQ13ZLPm3KsKP6AnAilTJ6S/cp/6oAkYa18D8CjLbk3Pg93Ei/OgJvvEEkOdGV8ovOoNxdxWnUwW
	c8BN/UkG1shJGwaeSqSz2uzftqTaiY88dC/QS4XAlOKOJuRd2lwbQamjjkZso8GfMOATMSz6w0be3
	Rj2hjco6jCKVXG7ar5kZK4dTYP0QIBOWGLoj+qxUCpVEL739/gJI6k0rfmRzXk1Wssa4XU2RscfoX
	4XuCNrK8j5Y+5fhxQ/pQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wrU-00000005yUm-2TBb;
	Thu, 07 Nov 2024 07:23:24 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8wkV-00000005wrb-39UX
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 07:16:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e330f65bcd9so1073598276.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Nov 2024 23:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730963770; x=1731568570; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cITlh9ATOoPVTRO1t6obQAYHyRTBK7FrpPuOEFqdekQ=;
        b=FHyPx+WjPGxzpvM91TEcf9/jNxK2u/GxZla4YKjoRdAbOqiVT1kFt0HeFWZQ4GSsal
         AXez4VPU9An85rvt+KxIMrSxuLhjKZoqsmKyUu0wI5ombB1MTYPYux/3ZXKkmoGjiO+z
         3j6c/03J7RLwfNmkPNDXs3Ioi8CGi2i4icnwFKteVnBsAgtKMn8Hra4oLBWQJtKnaUze
         mvloDJq9ViYPYILG3b3UsqN83d39+CeVTzm94GeWWCosQkHem0wD8kELSV//UFc0UpEn
         0QRQSbCNJJl5NSuAQdL67OzDb6qoFA+Fj0XfY+OF70B8TEHeu2ssfKX9cUPDvkKslzsz
         dGZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730963770; x=1731568570;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cITlh9ATOoPVTRO1t6obQAYHyRTBK7FrpPuOEFqdekQ=;
        b=lr+H52AesJv3Jj1/NgtXza4wt9jegE//NbU8D4A+2t9GRQ8C+he4H7XMTxp+Yv2tac
         9XzzBbVFNCtUgXp3iIUGDN4mOH4TI0RUGRk2cR3/OPcexrU+dDuyLpM2ij41A7t6caoR
         hVOuRtVG/y17CjcHIMBl4ViTIRsF1cLUEvnVmTknZSP+ggmZ2fxFUSvzNuAc5033C7UE
         J1FKgMLcX1ZmIOZ3cJGQZL7m3RtcPQy5cJLRT24/x0kn0c/iPoEOaN5BCOcKxvqL1QNw
         aZZmtP1x7+c06lHcrZuYPTJpGGWItDtvPeMjyiGmuwBVRmcGoMApPFyK4DzNOiJ60kLR
         cRHw==
X-Forwarded-Encrypted: i=1; AJvYcCXBuYqCz1o7VKn2u1AU9ID+c4lUbhSO/KgpIygZl3ZaeVLhaiEiQN3oszQ7RhNJW//XIO1zwZjer637+A==@lists.infradead.org
X-Gm-Message-State: AOJu0YyeR56Q9iMETRg3tDFNfvasZQnjhkSw+vHg3EhwoVAts6K0EPE+
	S8TKTL1ZBDRZHolavuwhcqntarlsF2NsAPQrmWQnf+0zVJ1W3wKcSQxQgq7Gu1qotBhfuP/ILhS
	yldx8Qw==
X-Google-Smtp-Source: AGHT+IG3hd8yCeGAX7h4k6RVex8boUD3HvG3dEWbSWvGpSoN2fs9Bh/9yh9W9X2pTJW73xmM0xEe1Jlq71HY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a25:901:0:b0:e2e:2c2e:277b with SMTP id
 3f1490d57ef6-e33691e2433mr5319276.3.1730963770308; Wed, 06 Nov 2024 23:16:10
 -0800 (PST)
Date: Wed,  6 Nov 2024 23:15:56 -0800
In-Reply-To: <20241107071600.9082-1-irogers@google.com>
Message-Id: <20241107071600.9082-4-irogers@google.com>
Mime-Version: 1.0
References: <20241107071600.9082-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v1 3/7] perf arm64 header: Use cpu argument in get_cpuid
From: Ian Rogers <irogers@google.com>
To: John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Ben Zong-You Xie <ben717@andestech.com>, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, Sandipan Das <sandipan.das@amd.com>, 
	Benjamin Gray <bgray@linux.ibm.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, 
	"=?UTF-8?q?Cl=C3=A9ment=20Le=20Goffic?=" <clement.legoffic@foss.st.com>, Yicong Yang <yangyicong@hisilicon.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Dima Kogan <dima@secretsauce.net>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, linux-arm-kernel@lists.infradead.org, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_231611_895629_FFCAB084 
X-CRM114-Status: GOOD (  18.87  )
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

Use the cpu to read the MIDR file requested. If the "any" value (-1)
is passed that keep the behavior of returning the first MIDR file that
can be read.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm64/util/header.c | 63 ++++++++++++++---------------
 tools/perf/util/header.h            |  1 +
 2 files changed, 31 insertions(+), 33 deletions(-)

diff --git a/tools/perf/arch/arm64/util/header.c b/tools/perf/arch/arm64/util/header.c
index 760c21784713..f0907daad3ae 100644
--- a/tools/perf/arch/arm64/util/header.c
+++ b/tools/perf/arch/arm64/util/header.c
@@ -14,55 +14,52 @@
 #define MIDR_REVISION_MASK      GENMASK(3, 0)
 #define MIDR_VARIANT_MASK	GENMASK(23, 20)
 
-static int _get_cpuid(char *buf, size_t sz, struct perf_cpu_map *cpus)
+static int _get_cpuid(char *buf, size_t sz, struct perf_cpu cpu)
 {
+	char path[PATH_MAX];
+	FILE *file;
 	const char *sysfs = sysfs__mountpoint();
-	struct perf_cpu cpu;
-	int idx, ret = EINVAL;
 
+	assert(cpu.cpu != -1);
 	if (!sysfs || sz < MIDR_SIZE)
 		return EINVAL;
 
-	perf_cpu_map__for_each_cpu(cpu, idx, cpus) {
-		char path[PATH_MAX];
-		FILE *file;
-
-		scnprintf(path, PATH_MAX, "%s/devices/system/cpu/cpu%d" MIDR,
-			  sysfs, cpu.cpu);
-
-		file = fopen(path, "r");
-		if (!file) {
-			pr_debug("fopen failed for file %s\n", path);
-			continue;
-		}
-
-		if (!fgets(buf, MIDR_SIZE, file)) {
-			fclose(file);
-			continue;
-		}
-		fclose(file);
+	scnprintf(path, PATH_MAX, "%s/devices/system/cpu/cpu%d" MIDR, sysfs, cpu.cpu);
 
-		/* got midr break loop */
-		ret = 0;
-		break;
+	file = fopen(path, "r");
+	if (!file) {
+		pr_debug("fopen failed for file %s\n", path);
+		return EINVAL;
 	}
 
-	return ret;
+	if (!fgets(buf, MIDR_SIZE, file)) {
+		pr_debug("Failed to read file %s\n", path);
+		fclose(file);
+		return EINVAL;
+	}
+	fclose(file);
+	return 0;
 }
 
-int get_cpuid(char *buf, size_t sz, struct perf_cpu cpu __maybe_unused)
+int get_cpuid(char *buf, size_t sz, struct perf_cpu cpu)
 {
-	struct perf_cpu_map *cpus = perf_cpu_map__new_online_cpus();
-	int ret;
+	struct perf_cpu_map *cpus;
+	int idx;
+
+	if (cpu.cpu != -1)
+		return _get_cpuid(buf, sz, cpu);
 
+	cpus = perf_cpu_map__new_online_cpus();
 	if (!cpus)
 		return EINVAL;
 
-	ret = _get_cpuid(buf, sz, cpus);
-
-	perf_cpu_map__put(cpus);
+	perf_cpu_map__for_each_cpu(cpu, idx, cpus) {
+		int ret = _get_cpuid(buf, sz, cpu);
 
-	return ret;
+		if (ret == 0)
+			return 0;
+	}
+	return EINVAL;
 }
 
 char *get_cpuid_str(struct perf_pmu *pmu)
@@ -78,7 +75,7 @@ char *get_cpuid_str(struct perf_pmu *pmu)
 		return NULL;
 
 	/* read midr from list of cpus mapped to this pmu */
-	res = _get_cpuid(buf, MIDR_SIZE, pmu->cpus);
+	res = get_cpuid(buf, MIDR_SIZE, perf_cpu_map__min(pmu->cpus));
 	if (res) {
 		pr_err("failed to get cpuid string for PMU %s\n", pmu->name);
 		free(buf);
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index b77f89de12dd..3bb768455a60 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -11,6 +11,7 @@
 #include <linux/types.h>
 #include "env.h"
 #include "pmu.h"
+#include <perf/cpumap.h>
 
 enum {
 	HEADER_RESERVED		= 0,	/* always cleared */
-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
