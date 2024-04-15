Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6D9C4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G1NWcWhbpHvDMWNWHD649xzZT+hHzDD+jpX2iCjh8B8=; b=FsxscZg63kbpT4
	afZKcc4FQWrdiqe4Nd6w+S0BJcws/+psy+eDMr0jtz9AMWuESNKe3TSmVHdR/UHbbz1LuXyh9ZGTj
	9hjv/eqF5s1WBeR7wQmqdQXP90pz88QEWq65OH0KOprcGcbw2ESiaAaIF/bRQmEEp+oO+u0IoKEdI
	c1IJMF2ii0YpVcL1+/sCTwRQA5AkmG8PYI9ctrCC4tRx/rqgKqXjOxZrN+EUUWGYMEJKGEKQq6fTa
	1bJYyjaMfZb8f3B7p5dyn5dgWxlvltS8oJ4IEUs7NpCqBLBJNFa3S/5JFHgcjjWINHuHjRXFPKW6+
	9Y85M7OfFBz+Aw2nDysA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxI-00000007Ayc-2qWe;
	Mon, 15 Apr 2024 06:36:40 +0000
Received: from mail-pg1-x54a.google.com ([2607:f8b0:4864:20::54a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxE-00000007AwP-3ioG
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:38 +0000
Received: by mail-pg1-x54a.google.com with SMTP id 41be03b00d2f7-5d8dd488e09so3129697a12.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713162995; x=1713767795; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=cBIPczyGmK1H1pt2G8mgcHP61YsaqzYuWfuwlwliFdk=;
        b=LMS/94jkE00QuEXq/Xkc59BZ5l5ew0/cDJMMSwcO8MwHDqDoH9SpQ63YhDqASeZdqu
         kSRRQYdWNjR07yH+bD6rhT/Vhvn+L06sRVd6//LZu5LxwcsJTzpyT2xgFppTeK5yc4AC
         3z0p31Qe01Wl3kTbcQIQgdZ4GGYJ2Qdt1j4E91hnuN+8UXe6JjBCevLZFGhcbd+yHvBN
         /i1hvyhTYLGLF/7hi+KUZQIYlFusamQ9TegPHUsqTMYbHqspV6WYAxVRGJ0h/AwoYwBk
         Xnt6n4qoongYAPKXY1i/NKmJP6FYjf1wVu/hUEYbJHxbS11diP0OqQXMS53OF/Jn6EF0
         c1eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162995; x=1713767795;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=cBIPczyGmK1H1pt2G8mgcHP61YsaqzYuWfuwlwliFdk=;
        b=f4q2QlSFWXloIvsrjVU27Nv1gmPAm4N11ZVDs45LHT1Z36hjzs3e7MhNGWYkqe/Bfr
         ddjzHoJiQPHyT60mO6JPGCRBUuxE8L8LW9FbpDNPIliJR6YRj3OR5JUvkZYX0Lc8kmKX
         HJM1/3gGZT42n1SQqvIk43A5ZKX6+xkhZgQZcFDwCNzZXAh0L2h0hFdWH5pillvtCKs6
         tSTfWVtyLq40hrtnI/qJLw/jdwkj1EvjNnou3rru2gGkZe3fnFm2cfPHdqoe634OqXH9
         dP05NPDw0+GpMBl9yTlk1GFQuumZbl7CJse18jVFsuqwl2AiWCQY1deoAXiK/Tcm6tUb
         H/sA==
X-Forwarded-Encrypted: i=1; AJvYcCVQg3p1OJlZ0PoAY85DHqVIjjnoTPTA4j3sBb38+OemiIpE2vE1Afaupn7HCBgp2LsJ2ztc8z1z942TZZXk9/jtxdOc3EUTGCrRUBTwg8tV
X-Gm-Message-State: AOJu0YwZ5O4YYuOnkRTI1a1QP6EhiYflUsWb0WiJy2kMwQKIJzGpAiE6
	80CtonMCb3R77JP+Qe4ll3U35ZI7tSVEQ+xkUWtJ+o3nbv9Z4BHZhWyMKUggoBqBPPYkxcec+d/
	pKvyiAw==
X-Google-Smtp-Source: AGHT+IHksE11INoODcmfSA8PUTVNGXIlCH66XxnH2VvOntZKJzWoEyBWTiUDIjjhs1caK8c5pV3a1jp10fJX
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a63:f919:0:b0:5db:edca:d171 with SMTP id
 h25-20020a63f919000000b005dbedcad171mr25389pgi.6.1713162994834; Sun, 14 Apr
 2024 23:36:34 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:19 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-3-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 2/9] perf parse-events: Directly pass PMU to parse_events_add_pmu
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
X-CRM114-CacheID: sfid-20240414_233636_971919_0807B72D 
X-CRM114-Status: GOOD (  15.99  )
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

Avoid passing the name of a PMU then finding it again, just directly
pass the PMU. parse_events_multi_pmu_add_or_add_pmu is the only
version that needs to find a PMU, so move the find there. Remove the
error message as parse_events_multi_pmu_add_or_add_pmu will given an
error at the end when a name isn't either a PMU name or event
name. Without the error message being created the location in the
input parameter (loc) can be removed.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 46 +++++++++++++---------------------
 1 file changed, 17 insertions(+), 29 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index b16c75bf5580..bc4a5e3c6c21 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1386,32 +1386,18 @@ static bool config_term_percore(struct list_head *config_terms)
 }
 
 static int parse_events_add_pmu(struct parse_events_state *parse_state,
-			 struct list_head *list, const char *name,
-			 const struct parse_events_terms *const_parsed_terms,
-			 bool auto_merge_stats, void *loc_)
+				struct list_head *list, struct perf_pmu *pmu,
+				const struct parse_events_terms *const_parsed_terms,
+				bool auto_merge_stats)
 {
 	struct perf_event_attr attr;
 	struct perf_pmu_info info;
-	struct perf_pmu *pmu;
 	struct evsel *evsel;
 	struct parse_events_error *err = parse_state->error;
-	YYLTYPE *loc = loc_;
 	LIST_HEAD(config_terms);
 	struct parse_events_terms parsed_terms;
 	bool alias_rewrote_terms = false;
 
-	pmu = parse_state->fake_pmu ?: perf_pmus__find(name);
-
-	if (!pmu) {
-		char *err_str;
-
-		if (asprintf(&err_str,
-				"Cannot find PMU `%s'. Missing kernel support?",
-				name) >= 0)
-			parse_events_error__handle(err, loc->first_column, err_str, NULL);
-		return -EINVAL;
-	}
-
 	parse_events_terms__init(&parsed_terms);
 	if (const_parsed_terms) {
 		int ret = parse_events_terms__copy(const_parsed_terms, &parsed_terms);
@@ -1425,9 +1411,9 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 
 		strbuf_init(&sb, /*hint=*/ 0);
 		if (pmu->selectable && list_empty(&parsed_terms.terms)) {
-			strbuf_addf(&sb, "%s//", name);
+			strbuf_addf(&sb, "%s//", pmu->name);
 		} else {
-			strbuf_addf(&sb, "%s/", name);
+			strbuf_addf(&sb, "%s/", pmu->name);
 			parse_events_terms__to_strbuf(&parsed_terms, &sb);
 			strbuf_addch(&sb, '/');
 		}
@@ -1469,7 +1455,7 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 
 		strbuf_init(&sb, /*hint=*/ 0);
 		parse_events_terms__to_strbuf(&parsed_terms, &sb);
-		fprintf(stderr, "..after resolving event: %s/%s/\n", name, sb.buf);
+		fprintf(stderr, "..after resolving event: %s/%s/\n", pmu->name, sb.buf);
 		strbuf_release(&sb);
 	}
 
@@ -1583,8 +1569,8 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			continue;
 
 		auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
-		if (!parse_events_add_pmu(parse_state, list, pmu->name,
-					  &parsed_terms, auto_merge_stats, loc)) {
+		if (!parse_events_add_pmu(parse_state, list, pmu,
+					  &parsed_terms, auto_merge_stats)) {
 			struct strbuf sb;
 
 			strbuf_init(&sb, /*hint=*/ 0);
@@ -1596,8 +1582,8 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 	}
 
 	if (parse_state->fake_pmu) {
-		if (!parse_events_add_pmu(parse_state, list, event_name, &parsed_terms,
-					  /*auto_merge_stats=*/true, loc)) {
+		if (!parse_events_add_pmu(parse_state, list, parse_state->fake_pmu, &parsed_terms,
+					  /*auto_merge_stats=*/true)) {
 			struct strbuf sb;
 
 			strbuf_init(&sb, /*hint=*/ 0);
@@ -1626,7 +1612,7 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 {
 	char *pattern = NULL;
 	YYLTYPE *loc = loc_;
-	struct perf_pmu *pmu = NULL;
+	struct perf_pmu *pmu;
 	int ok = 0;
 	char *help;
 
@@ -1637,10 +1623,12 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 	INIT_LIST_HEAD(*listp);
 
 	/* Attempt to add to list assuming event_or_pmu is a PMU name. */
-	if (!parse_events_add_pmu(parse_state, *listp, event_or_pmu, const_parsed_terms,
-					/*auto_merge_stats=*/false, loc))
+	pmu = parse_state->fake_pmu ?: perf_pmus__find(event_or_pmu);
+	if (pmu && !parse_events_add_pmu(parse_state, *listp, pmu, const_parsed_terms,
+					/*auto_merge_stats=*/false))
 		return 0;
 
+	pmu = NULL;
 	/* Failed to add, try wildcard expansion of event_or_pmu as a PMU name. */
 	if (asprintf(&pattern, "%s*", event_or_pmu) < 0) {
 		zfree(listp);
@@ -1660,8 +1648,8 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 		    !perf_pmu__match(pattern, pmu->alias_name, event_or_pmu)) {
 			bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
 
-			if (!parse_events_add_pmu(parse_state, *listp, pmu->name, const_parsed_terms,
-						  auto_merge_stats, loc)) {
+			if (!parse_events_add_pmu(parse_state, *listp, pmu, const_parsed_terms,
+						  auto_merge_stats)) {
 				ok++;
 				parse_state->wild_card_pmus = true;
 			}
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
