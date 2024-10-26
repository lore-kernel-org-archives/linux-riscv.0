Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B00D10BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Laj2jIY0nvsIzoGVcnj7u3gHuBpKsXtro2PTQ/c/r20=; b=yXUpF61TsfM8IK
	6IjVgldrWeACVp/IVJomMOG87gBcFf1N5bA8hZsga5zG3WZM4GlBvtUCb1n/zHr29jzAp53URTCys
	lJSW3UhpqWlrdr8JsZaDr+BIbUGuPZ1Io7Pca2MOuLx1Vj4b15LN6TAjQLRTtpvsr6ZYaR8S0/JPS
	h1FHTfkmaYCLm8ecj+zLoynYSNZOo+43zAKQ3Yig2z4Qjnjh7fCxc3TdtCgSKecVa8FOZpDNejytJ
	LPQwozP2ztkHt8ay8Zg0x6YIP5umbgtPzhM0lQ67rbEicUy+yfFDIzXaggeA9dFr++Ddbma321Ij2
	9ASKUdL3Qyso3fO4z7DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkF-00000006abk-2nUe;
	Sat, 26 Oct 2024 12:18:15 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkA-00000006aYd-3Zlk
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:12 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e35bdb6a31so56986887b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 05:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729945089; x=1730549889; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7F7PVEl1yMjHz9vox0k4Hp07MzhtEZCh12BPQyxhhQY=;
        b=zb9sXg2EYcHd4HHEMB00xPuI89srnkwjHhv85t7/EolKEmnOqwut+JT1DoPiEs4AuX
         L5ziEhB/Bhn9Ob4aEA7gVJH18QFyCa6fPlpIkJD1ZRraEwIpCx+DGS0O6K6FXAuEVIp3
         yyvCgVtrbYdlHqJ6rDYg5QIdYEMaUz17lzBuCNrbNLsEctFRH/Y/WDqjh+QG4nufchh4
         v5vOvsnNeUSX7Kum1YQIRW5NghtQFRUGi7u7TL+aqYdddOgCTcNYn2K9gv+nBFIOJpb9
         iw/PLXM/aCiGGexU5JBSiW5otUdK4OaELIh7uPxU21wgm5zmmWRCN1ZXtZg22vk5iYDb
         akHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945089; x=1730549889;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7F7PVEl1yMjHz9vox0k4Hp07MzhtEZCh12BPQyxhhQY=;
        b=QUOuORHocBpn2qxKsD6zCpQEfDD0BHeF2J6LliHoG6ai9gsYR+N0hc5MYGEcVK9sCe
         jFHpn3o5M+TdRBqfx3lbsUUk1kSieJ/dBObVHqoceXz95KcF0bCsWT1GbL4EDieT7QqF
         gSK0rDVG6xwguG3fUy/40VloGiB7Q1oPD6BBnLFGSEHU3PcS+LWaOw2+8fPDmNJq8k1y
         GNTQkTZGAI88snvSVqApOMPKIx6lCzETeqaLgs4SGMBHVxKHgC7iIjMSClINGPaZNqjt
         DrDPhgUnUe7ZgB2hnrUZqhYOXRLMArhhR4KXUuJRp2Sfk0B+sfW6Ns8ljX26/BXvuMCF
         hCWQ==
X-Forwarded-Encrypted: i=1; AJvYcCUarXegNAWPAAD4XL5aGFvbeOgyofSXsW/8cijCUmPbuRKAO/JmRqBqmG6F6Y1ahHHic1U9QH7VA8PGng==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxat33Myq7N+K9SdYBNbRkQqtfxSK1Sbxb7YK2Zjf7HvRznHPbq
	vUiHCUPd/ncv+iopu5RjbCXIXVd2RDFiW0r4Jb4bHyf2UgPl1mmSBslEylb1k8ucH8nBOX3Nibz
	klno7ow==
X-Google-Smtp-Source: AGHT+IGokN+iNYXdGTM/m8jAXY+rBHKDjwssa4ELvzrrAB/oAfWnGPy244qe6dALscEwgMiTq4roYYY/2wDq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:4bc4:f7cc:83b4:dece])
 (user=irogers job=sendgmr) by 2002:a05:690c:3607:b0:68d:52a1:be9 with SMTP id
 00721157ae682-6e9d88b0b4cmr691497b3.1.1729945088518; Sat, 26 Oct 2024
 05:18:08 -0700 (PDT)
Date: Sat, 26 Oct 2024 05:17:56 -0700
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
Message-Id: <20241026121758.143259-3-irogers@google.com>
Mime-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v1 2/4] perf stat: Fix find_stat for mixed legacy/non-legacy events
From: Ian Rogers <irogers@google.com>
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Ben Gainey <ben.gainey@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Junhao He <hejunhao3@huawei.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_051810_925885_47FCA23A 
X-CRM114-Status: GOOD (  15.70  )
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

Legacy events typically don't have a PMU when added leading to
mismatched legacy/non-legacy cases in find_stat. Use evsel__find_pmu
to make sure the evsel PMU is looked up. Update the evsel__find_pmu
code to look for the PMU using the extended config type or, for legacy
hardware/hw_cache events on non-hybrid systems, just use the core PMU.

Before:
```
$ perf stat -e cycles,cpu/instructions/ -a sleep 1
 Performance counter stats for 'system wide':

       215,309,764      cycles
        44,326,491      cpu/instructions/

       1.002555314 seconds time elapsed
```
After:
```
$ perf stat -e cycles,cpu/instructions/ -a sleep 1

 Performance counter stats for 'system wide':

       990,676,332      cycles
     1,235,762,487      cpu/instructions/                #    1.25  insn per cycle

       1.002667198 seconds time elapsed
```

Fixes: 3612ca8e2935 ("perf stat: Fix the hard-coded metrics
calculation on the hybrid")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/pmus.c        | 20 +++++++++++++++++---
 tools/perf/util/stat-shadow.c |  3 ++-
 2 files changed, 19 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/pmus.c b/tools/perf/util/pmus.c
index 107de86c2637..8d8eeeb28868 100644
--- a/tools/perf/util/pmus.c
+++ b/tools/perf/util/pmus.c
@@ -708,11 +708,25 @@ char *perf_pmus__default_pmu_name(void)
 struct perf_pmu *evsel__find_pmu(const struct evsel *evsel)
 {
 	struct perf_pmu *pmu = evsel->pmu;
+	bool legacy_core_type;
 
-	if (!pmu) {
-		pmu = perf_pmus__find_by_type(evsel->core.attr.type);
-		((struct evsel *)evsel)->pmu = pmu;
+	if (pmu)
+		return pmu;
+
+	pmu = perf_pmus__find_by_type(evsel->core.attr.type);
+	legacy_core_type =
+		evsel->core.attr.type == PERF_TYPE_HARDWARE ||
+		evsel->core.attr.type == PERF_TYPE_HW_CACHE;
+	if (!pmu && legacy_core_type) {
+		if (perf_pmus__supports_extended_type()) {
+			u32 type = evsel->core.attr.config >> PERF_PMU_TYPE_SHIFT;
+
+			pmu = perf_pmus__find_by_type(type);
+		} else {
+			pmu = perf_pmus__find_core_pmu();
+		}
 	}
+	((struct evsel *)evsel)->pmu = pmu;
 	return pmu;
 }
 
diff --git a/tools/perf/util/stat-shadow.c b/tools/perf/util/stat-shadow.c
index ada787947e16..f6d34e12e65c 100644
--- a/tools/perf/util/stat-shadow.c
+++ b/tools/perf/util/stat-shadow.c
@@ -151,6 +151,7 @@ static double find_stat(const struct evsel *evsel, int aggr_idx, enum stat_type
 {
 	struct evsel *cur;
 	int evsel_ctx = evsel_context(evsel);
+	struct perf_pmu *evsel_pmu = evsel__find_pmu(evsel);
 
 	evlist__for_each_entry(evsel->evlist, cur) {
 		struct perf_stat_aggr *aggr;
@@ -177,7 +178,7 @@ static double find_stat(const struct evsel *evsel, int aggr_idx, enum stat_type
 		 * Except the SW CLOCK events,
 		 * ignore if not the PMU we're looking for.
 		 */
-		if ((type != STAT_NSECS) && (evsel->pmu != cur->pmu))
+		if ((type != STAT_NSECS) && (evsel_pmu != evsel__find_pmu(cur)))
 			continue;
 
 		aggr = &cur->stats->aggr[aggr_idx];
-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
