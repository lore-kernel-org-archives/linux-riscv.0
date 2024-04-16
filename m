Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9087C071FD
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuai/WAd79hs28iiuBLCyeoqCFM4AapI9V3p/5zoeLI=; b=mxgEkMJrRJWBq9
	0PcxyHacHFDWcGPJWakMX3EyJscvQXZ2yY22QE6Qu0mk90gIQ/aoaZIlW0+QTjgpeNgkCJtbdpdrS
	7scMOvJHV+splArtYXQzA2uvMj8xNLORnEevBJkjVFN3vX8V2uKKLHz1R/1pQ8TjRdC9/50wdhah8
	BTJdHQEnn4Et47a0PDP1EJ3VqgltBTOrlhMCi6hvYoCq5ZuGCG5dd68IqF+WDHBmARPB2Ihp4IFh2
	c+GYmE1X67q99KI5YitqjcJLO2uUp8H2wZuhBErhTSG1CoVT+DptrOPUq5+KbYb91sxuJuW/5/9LX
	zCAaaQQD+t0Pp+AJ4ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6w-0000000B2FB-0sZn;
	Tue, 16 Apr 2024 06:16:06 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6m-0000000B26a-3qFZ
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:00 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dd944567b6cso5270667276.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248153; x=1713852953; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OoQwW/NovL7e2tX2zfVq3KY3APeKDAqGoyhJSMq8amM=;
        b=kWMijL5SOucXML4TtLbQVStkWdaNmMH83+eAkx16gXjm7CWEn9Jrv0ms5vVA0yy+Kz
         tvgXtGadKER7AWVVqs36fkPv0Du5ulcYUtnc9OCEUVFkFEu+Zv0X+MjCfE6xQt8llhEd
         yIeOcO8I4dNX2qZKEaGjRt+5qUrRqUAMCs1IXvXEcbQPO4D7a/tRESpHtjLr+i26ZgHt
         08F+qpJ0Qxhc1HvRDcLbwOR/QfXAkmW0Hx25NY46EqC5l3kjtcCxJHfzbpu7bEGUfLDD
         m1OS1SL5FueK2L+KPZ2GycV2S/jcM4BKa8EcWRCuDCWv0lRIZfW5tWNxlRx67QVFhoog
         y3/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248153; x=1713852953;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OoQwW/NovL7e2tX2zfVq3KY3APeKDAqGoyhJSMq8amM=;
        b=RSx/MT01a/6Q8JV5JuV8SoY7+n6smOChjqJm9vNmCDOlP8PgiALKTHp/p/6OITSAXD
         KVCeyvFkte2D2RIgPKsBWikRuF0ZE2VmLqMprfBe4eQzZA6d4APl0gaHkm+p3DSzU2dJ
         UCHJHHHSv8MqqqhjNS1G1LLjJR+Xwh7pil2JmnJACJaDl/G33pWqYGxBrHnuJNyCEAFM
         DldRPVsP3EdlpHnJ/0TK+6YN/ChdSx260VoaUrxIlCabf8O9WkPYK+6jmX0AY63wsKJy
         yqoZLGHx/KxeR6ioW2gWvZtd+ocOBKeoWDcyFjDBJLRDLN7hEKP3gEr5G62Rulu4bJHx
         NmhA==
X-Forwarded-Encrypted: i=1; AJvYcCWwmmva6dSXlLxHKcNjSh6WTYT4NYgGU7dbvXEy1VR+kW4qCW64t/v9VNi6gADnFcKtSKcZZJPbx4dCksIvuB3nEmtMF9UiBbow1W86VQU9
X-Gm-Message-State: AOJu0YwZ9ZVKbHgJIzbx7lN+p+onSAvUwniYEZeXruyGfbwZfCvkVFTv
	UzO9BIBN6mFC2TZYjtGC8gCTK1x+STDgO8+rNBhRWf3k9OtbORWSv9d+bw8e74rkOdSj4hepFdb
	7yvFM/w==
X-Google-Smtp-Source: AGHT+IHOfFNw3FUspTDzag8H1Vs2s4R7H3wtDbw+0o1oktnOEpdBiBC3Jt+NP9eC79ubMPCeMtZbdbJRfZUt
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:1027:b0:dc6:dfd9:d423 with SMTP
 id x7-20020a056902102700b00dc6dfd9d423mr968428ybt.3.1713248153495; Mon, 15
 Apr 2024 23:15:53 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:20 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-5-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 04/16] perf pmu: Refactor perf_pmu__match
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@arm.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	bpf@vger.kernel.org, Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	Beeman Strong <beeman@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_231557_057927_89436C55 
X-CRM114-Status: GOOD (  13.86  )
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

Move all implementation to pmu code. Don't allocate a fnmatch wildcard
pattern, matching ignoring the suffix already handles this, and only
use fnmatch if the given PMU name has a '*' in it.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 19 ++-----------------
 tools/perf/util/pmu.c          | 27 +++++++++++++++++++--------
 tools/perf/util/pmu.h          |  2 +-
 3 files changed, 22 insertions(+), 26 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 3b1f767039fa..39548ec645ec 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1611,7 +1611,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 					struct list_head **listp,
 					void *loc_)
 {
-	char *pattern = NULL;
 	YYLTYPE *loc = loc_;
 	struct perf_pmu *pmu;
 	int ok = 0;
@@ -1631,22 +1630,9 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 
 	pmu = NULL;
 	/* Failed to add, try wildcard expansion of event_or_pmu as a PMU name. */
-	if (asprintf(&pattern, "%s*", event_or_pmu) < 0) {
-		zfree(listp);
-		return -ENOMEM;
-	}
-
 	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
-		const char *name = pmu->name;
-
-		if (parse_events__filter_pmu(parse_state, pmu))
-			continue;
-
-		if (!strncmp(name, "uncore_", 7) &&
-		    strncmp(event_or_pmu, "uncore_", 7))
-			name += 7;
-		if (!perf_pmu__match(pattern, name, event_or_pmu) ||
-		    !perf_pmu__match(pattern, pmu->alias_name, event_or_pmu)) {
+		if (!parse_events__filter_pmu(parse_state, pmu) &&
+		    perf_pmu__match(pmu, event_or_pmu)) {
 			bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
 
 			if (!parse_events_add_pmu(parse_state, *listp, pmu,
@@ -1657,7 +1643,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 			}
 		}
 	}
-	zfree(&pattern);
 	if (ok)
 		return 0;
 
diff --git a/tools/perf/util/pmu.c b/tools/perf/util/pmu.c
index ce72c99e4f61..d7521d84fe4a 100644
--- a/tools/perf/util/pmu.c
+++ b/tools/perf/util/pmu.c
@@ -2073,18 +2073,29 @@ void perf_pmu__warn_invalid_config(struct perf_pmu *pmu, __u64 config,
 		   name ?: "N/A", buf, config_name, config);
 }
 
-int perf_pmu__match(const char *pattern, const char *name, const char *tok)
+bool perf_pmu__match(const struct perf_pmu *pmu, const char *tok)
 {
-	if (!name)
-		return -1;
+	const char *name = pmu->name;
+	bool need_fnmatch = strchr(tok, '*') != NULL;
 
-	if (fnmatch(pattern, name, 0))
-		return -1;
+	if (!strncmp(tok, "uncore_", 7))
+		tok += 7;
+	if (!strncmp(name, "uncore_", 7))
+		name += 7;
 
-	if (tok && !perf_pmu__match_ignoring_suffix(name, tok))
-		return -1;
+	if (perf_pmu__match_ignoring_suffix(name, tok) ||
+	    (need_fnmatch && !fnmatch(tok, name, 0)))
+		return true;
 
-	return 0;
+	name = pmu->alias_name;
+	if (!name)
+		return false;
+
+	if (!strncmp(name, "uncore_", 7))
+		name += 7;
+
+	return perf_pmu__match_ignoring_suffix(name, tok) ||
+		(need_fnmatch && !fnmatch(tok, name, 0));
 }
 
 double __weak perf_pmu__cpu_slots_per_cycle(void)
diff --git a/tools/perf/util/pmu.h b/tools/perf/util/pmu.h
index 152700f78455..93d03bd3ecbe 100644
--- a/tools/perf/util/pmu.h
+++ b/tools/perf/util/pmu.h
@@ -263,7 +263,7 @@ void perf_pmu__warn_invalid_config(struct perf_pmu *pmu, __u64 config,
 				   const char *config_name);
 void perf_pmu__warn_invalid_formats(struct perf_pmu *pmu);
 
-int perf_pmu__match(const char *pattern, const char *name, const char *tok);
+bool perf_pmu__match(const struct perf_pmu *pmu, const char *tok);
 
 double perf_pmu__cpu_slots_per_cycle(void);
 int perf_pmu__event_source_devices_scnprintf(char *pathname, size_t size);
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
