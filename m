Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB87D4337D
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Nov 2024 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6uetRBzbM6Iu98VeJo9cwh60U5VwIwace2LxNojm2cU=; b=N5B/FKMU4mVMNA
	N8O4Areau/NZAE/nwpcoTfnSQqa9Sailks+rzwOJc7iEVMTAVZCm4NbkNxdv8xdc06SxUPrWD4H4y
	+qykSH+XhNlCkCE2ofoIJTCZX/+ZiMRxC/u+Scb87FSKEst09dnFd4XhiUCgF751Gj3BjqpxY8x/S
	qzl91f/m74K77sss8V/KTH5Ldk01otBTZV/9Wu+ce2K1Cp7NanRv9q8r4S7FWwI4c2YJQXK9IEbhK
	me6FD06PkW0nbBCHNRZw0zVxElUtOAM+vGB3ytwppEW63Vjsl5DZkfuLCIh5jU9XMlrs3OE7pVuzq
	f1BsOvlfUwHipTxIzuCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t95iH-00000007hpo-2EOO;
	Thu, 07 Nov 2024 16:50:29 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t95Fh-00000007biX-2qWe
	for linux-riscv@lists.infradead.org;
	Thu, 07 Nov 2024 16:20:58 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea7c5805ccso18656827b3.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Nov 2024 08:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730996456; x=1731601256; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OmDxOz/jwQKQ9IxxvIQzkp5N2zsrObhsgCU4K9BCHGc=;
        b=KDXwsM7jgSJjbctjwIXwh3BrPphJMkXwt5Ce9ZQ2kQVJ9Abwz3u1K8mbQ3MW4DY3K7
         WQJN+PORMyvUTQ8Nx9ZYN3ChdW7PNe02SoPlm2jNxOuMbLffEdgJQm4QivT2ZkN2tZVh
         4CwWKTvdkX+V8+7xaPKB8iYILfx3oFveswSqJ+2RKoyQ+dX79652Z+X/Rvo0WHAxTuAS
         SO8dcgAz13RNnqctoz//oHQ+LBOhym8p9q/MIwTYeDXbmxOrWeaCVK0mqv4M8D16BTSK
         9QGwuvOsYPtah0U4jgQdbHYs1G3223a6P6ptoAPggSSNTuveyAuj4RSLmFujt1Jg+kJ0
         hVrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730996456; x=1731601256;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OmDxOz/jwQKQ9IxxvIQzkp5N2zsrObhsgCU4K9BCHGc=;
        b=xNv6+yX0AoSgN9Ih8p8OaoL4+ojXhOfxCJTmcJTtmfxK83TuIaQBv+m6mlz85M+v1T
         D/PlFWd3Veyd16aEV8uV1e+CSjcnGlqVJ37lt0L2NlhE3UVeY7qS7LTxclsvPod5fL1b
         kHVV+zgTFoimv1hrb0rOJd/OMQjcjavj68rhDdjKr3f+eHEw9+47fkKunJ20ZFWs6GOj
         DEuEsN8gjC93BBLIay3c/jRMqZ55jj6M+M0bEnS/Th1S4C35Hs177wymv/UjHJT9IqwU
         6TtFfkyoWlHIKQeIcKo0m0ZV0A6uR4DY6Pgr76liTp6ZbRFCWmUaQsytyCLJw9jHvgu7
         QDaQ==
X-Forwarded-Encrypted: i=1; AJvYcCWH9bO6XKnnXKTUQtd6ZALC5fA10ZDqMzAMC1/QToiaZbmKnb2Nw7wCn4s1ZrzT84rKCOOFRRyBi9NEfw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzXJ77UlWe1GNelCUhZCVAaxyY8AeD4rIUSCXwGS10UKkGSC8HD
	dLRD0F7j+lFInrbDqLAr3JJw6X4kMeCw3UaIgwzT40E8iqQrSLVfWTMxHSFkNRxjUmKkQhialFr
	sQGwhlQ==
X-Google-Smtp-Source: AGHT+IHCkQtw3cbe4yQXJVnOkaPBqQ3DtdlxV254RMwS9iWgJ8X5235+bgRmL2AfqDh6oANhnB+TqaB5uCbI
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:acc7:bda:7167:18d8])
 (user=irogers job=sendgmr) by 2002:a81:de03:0:b0:6e2:371f:4aef with SMTP id
 00721157ae682-6eadaf980f4mr79097b3.3.1730996456017; Thu, 07 Nov 2024 08:20:56
 -0800 (PST)
Date: Thu,  7 Nov 2024 08:20:34 -0800
In-Reply-To: <20241107162035.52206-1-irogers@google.com>
Message-Id: <20241107162035.52206-8-irogers@google.com>
Mime-Version: 1.0
References: <20241107162035.52206-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.199.ga7371fff76-goog
Subject: [PATCH v2 7/8] perf jevents: Add map_for_cpu
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
X-CRM114-CacheID: sfid-20241107_082057_782670_30389353 
X-CRM114-Status: GOOD (  12.86  )
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

The PMU is no longer part of the map finding process and for metrics
doesn't make sense as they lack a PMU.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/pmu-events/empty-pmu-events.c | 20 +++++++++++++-------
 tools/perf/pmu-events/jevents.py         | 20 +++++++++++++-------
 2 files changed, 26 insertions(+), 14 deletions(-)

diff --git a/tools/perf/pmu-events/empty-pmu-events.c b/tools/perf/pmu-events/empty-pmu-events.c
index 51ca8d61c15d..17306e316a3c 100644
--- a/tools/perf/pmu-events/empty-pmu-events.c
+++ b/tools/perf/pmu-events/empty-pmu-events.c
@@ -503,11 +503,11 @@ int pmu_metrics_table__for_each_metric(const struct pmu_metrics_table *table,
         return 0;
 }
 
-static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
+static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 {
         static struct {
                 const struct pmu_events_map *map;
-                struct perf_pmu *pmu;
+                struct perf_cpu cpu;
         } last_result;
         static struct {
                 const struct pmu_events_map *map;
@@ -515,15 +515,12 @@ static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
         } last_map_search;
         static bool has_last_result, has_last_map_search;
         const struct pmu_events_map *map = NULL;
-        struct perf_cpu cpu = {-1};
         char *cpuid = NULL;
         size_t i;
 
-        if (has_last_result && last_result.pmu == pmu)
+        if (has_last_result && last_result.cpu.cpu == cpu.cpu)
                 return last_result.map;
 
-        if (pmu)
-                cpu = perf_cpu_map__min(pmu->cpus);
         cpuid = get_cpuid_allow_env_override(cpu);
 
         /*
@@ -555,12 +552,21 @@ static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
                has_last_map_search = true;
         }
 out_update_last_result:
-        last_result.pmu = pmu;
+        last_result.cpu = cpu;
         last_result.map = map;
         has_last_result = true;
         return map;
 }
 
+static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
+{
+        struct perf_cpu cpu = {-1};
+
+        if (pmu)
+                cpu = perf_cpu_map__min(pmu->cpus);
+        return map_for_cpu(cpu);
+}
+
 const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 {
         const struct pmu_events_map *map = map_for_pmu(pmu);
diff --git a/tools/perf/pmu-events/jevents.py b/tools/perf/pmu-events/jevents.py
index b5ff872e2beb..e44b72e56ac3 100755
--- a/tools/perf/pmu-events/jevents.py
+++ b/tools/perf/pmu-events/jevents.py
@@ -1019,11 +1019,11 @@ int pmu_metrics_table__for_each_metric(const struct pmu_metrics_table *table,
         return 0;
 }
 
-static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
+static const struct pmu_events_map *map_for_cpu(struct perf_cpu cpu)
 {
         static struct {
                 const struct pmu_events_map *map;
-                struct perf_pmu *pmu;
+                struct perf_cpu cpu;
         } last_result;
         static struct {
                 const struct pmu_events_map *map;
@@ -1031,15 +1031,12 @@ static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
         } last_map_search;
         static bool has_last_result, has_last_map_search;
         const struct pmu_events_map *map = NULL;
-        struct perf_cpu cpu = {-1};
         char *cpuid = NULL;
         size_t i;
 
-        if (has_last_result && last_result.pmu == pmu)
+        if (has_last_result && last_result.cpu.cpu == cpu.cpu)
                 return last_result.map;
 
-        if (pmu)
-                cpu = perf_cpu_map__min(pmu->cpus);
         cpuid = get_cpuid_allow_env_override(cpu);
 
         /*
@@ -1071,12 +1068,21 @@ static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
                has_last_map_search = true;
         }
 out_update_last_result:
-        last_result.pmu = pmu;
+        last_result.cpu = cpu;
         last_result.map = map;
         has_last_result = true;
         return map;
 }
 
+static const struct pmu_events_map *map_for_pmu(struct perf_pmu *pmu)
+{
+        struct perf_cpu cpu = {-1};
+
+        if (pmu)
+                cpu = perf_cpu_map__min(pmu->cpus);
+        return map_for_cpu(cpu);
+}
+
 const struct pmu_events_table *perf_pmu__find_events_table(struct perf_pmu *pmu)
 {
         const struct pmu_events_map *map = map_for_pmu(pmu);
-- 
2.47.0.199.ga7371fff76-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
