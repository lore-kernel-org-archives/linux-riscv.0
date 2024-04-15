Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCB38C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=w3i9ZzfrJ3O43zXjy1sYxfnKNsTugbyGVl1E+4XnhYw=; b=SRRGJeafqQvZ2a
	E6+o6vk6x+HcG7Vle/FtTlD4audl+ZzZNl+7Eb/bje6LRcajkv34m9wigdtAZJGvQEySSFzVaGmNp
	subSMPVJUdXvf26f9/ufbnzMKCpCfnQygq6+mWzAn16Oh3mfk1JDjL/SYy7OmAhEMvtZVuETEDYYf
	pzovkCCPLj+QPFZyFLDzIJSMEYyyM9XXx1WjAQVKvfuOVbUGN+bRgqKXwtfJ1tAdlQ4qQGCv6wzEd
	QWO1OWuJMjyL1hLZWq6J85mlkkrxSm/1HolzkeuwsChKlcCYBQB5pE3O7pQ5ghx6t6hpHB6962iY6
	5hne8GVQjONDGBftJF0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxR-00000007B3G-0Ec8;
	Mon, 15 Apr 2024 06:36:49 +0000
Received: from mail-pj1-x1049.google.com ([2607:f8b0:4864:20::1049])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxN-00000007AyX-0OoK
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:47 +0000
Received: by mail-pj1-x1049.google.com with SMTP id 98e67ed59e1d1-2a4b60f8806so3202224a91.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713163000; x=1713767800; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Vbu7aFj7CDfYjc9NaQu8KLUrRIg296ZgDVYr3Mka6h8=;
        b=KTm8Izn8dd8YxNd1U0YEhiyuBqqnBoRpfFSXz9YzEZVK/JCEPY/rnd1QzIJvkNH1Ye
         vh3EkwCS9rXCxIZxUeCihX6NSLoC+TscsqkBf4AcRBUE9L34owQu9gvrsNTrzbLoaiyO
         x+kr/TzX7vg7vURPyBAaoUpTi0RqfoSVlsDBhXwtE/agClNXqt7kF7baf1Pzk3wy2N+g
         5HYBtKp8d9eCOnYAOX+0BmCm+NhBJHwZY0zI+POkfDtSC141g1HA9mpr7MxI+EeE95S3
         yXUpF0He9N8aNWnJARrsZb9SUEmTC2lHl9R5ktnl7D6hPAAHtBKzex1HGfDURiFfGlzZ
         cZsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163000; x=1713767800;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Vbu7aFj7CDfYjc9NaQu8KLUrRIg296ZgDVYr3Mka6h8=;
        b=Ps15jZ4Ea5xdoVk0mg4mucXxtQkCC4FS9S3SkIM4xUk+pzsz+XJxhgrLpn+fJ7lZ9f
         vAfSIW3vU0rGURjakSQUfSW994BAud8+7aLya3x3oYvp0QGFGnpE+3iejs882Vlk3ACI
         sxM6uxbezwQpx/8xsbUkO5hTHKohOZPCd9vjKtqnmiVTu9RPdazP6ldJ5LZG7KPOCeP+
         GeTObEgxeN0bMqbscIcyf1OZu7lSEV49lmbgHWJhAK9pCTd7g/ipEMoUku98zHy943UB
         2cBkQRZ8iBo88r8rNIrd+gPJ9/BEXFZBhKkpfUTI+ZptTgwtrhkg941CWVgTii58OKU3
         L9lQ==
X-Forwarded-Encrypted: i=1; AJvYcCViORxRE/IF7tPgSHnmVUTw2GT24Gcefhwm0++oYQYZnL0KUWrrz7SgUFBQKwVzBBhsLPo/vMFn9UTrIdFGyGkzRZ6fZ6GegrzG6WheXxAl
X-Gm-Message-State: AOJu0YzjD/byAtgma4VGur5+5db/d5dNd3bzN4SeEX/rMFV4pjA40aNB
	8fDn3+3/PocpcjWSvK4NRD0QrfOrpj6/OlT14ZkxGymwdSPLdH4pVUbwCSvUM4Q8v8ExFamxWmV
	kqnZkcg==
X-Google-Smtp-Source: AGHT+IF81B9h9k2M6zDz/afTJ7Wc9UGW5/Q0UBXG/tDqklKUIScYFFrhSUp9FPvMgq45GrANH22AdKOozLUh
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a17:90a:f287:b0:29b:f937:cc00 with SMTP id
 fs7-20020a17090af28700b0029bf937cc00mr27827pjb.7.1713162999848; Sun, 14 Apr
 2024 23:36:39 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:21 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-5-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 4/9] perf pmu: Refactor perf_pmu__match
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
X-CRM114-CacheID: sfid-20240414_233645_996914_591969CB 
X-CRM114-Status: GOOD (  13.29  )
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
index 7e23168deeb9..f4de374dab59 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1610,7 +1610,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 					struct list_head **listp,
 					void *loc_)
 {
-	char *pattern = NULL;
 	YYLTYPE *loc = loc_;
 	struct perf_pmu *pmu;
 	int ok = 0;
@@ -1630,22 +1629,9 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 
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
 
 			if (!parse_events_add_pmu(parse_state, *listp, pmu, const_parsed_terms,
@@ -1655,7 +1641,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
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
