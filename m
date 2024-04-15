Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B9CBC04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BSos8lRVoJKNaz+gvZ85AqTXQw26bZqI5DJlgiS+dEI=; b=YRLYaV/5GT//hw
	aY4Dk6oCjW35adqhcBuIwO+jB2wPtegaB7a/HVI4X2pHBElajuJHA5oKCNBNsf4dHrGVbDbSwGjM7
	PTEA5qpg/+i60peZxDQAp8vbnnegb3bhwqEI8p9YPamBvPr7BRXOeEc5bzkzq0itLB6gb5bYpUwK4
	F76Bu8ixv00fB0/0YkAY2U2IWu2n+E4dfDy1Q6fXpi5fIWyw7yTvxCakoLCmtYlCYLnvzAyKiWGh/
	0z1qFP3ezqNcX/s/txSwK/w560YXlHEaOs/uvqcV9KKuDfq72pcDFmBNyuSE5mAgavKfFO6XaEHWj
	nz4w1x5SooJuTRw8Xy+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxE-00000007Awp-33tJ;
	Mon, 15 Apr 2024 06:36:36 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxB-00000007AvT-2FXD
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:34 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6183c4a6d18so44839727b3.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713162992; x=1713767792; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3/UXsGbRM4hk6gURXUv3cQgeMnu1X8cp+uoMKx5i54A=;
        b=4YKKudxn329RztacrcnsOv+Xxv42kYgFsCDoMwSJ600t+2kWxBiGtWhfRpMrgvsdHX
         UjvJHm5VXNsG1kKVZzqav+Uy9R7cuoSbHv5blWbXZUZvFQGT3Ro0UJP4Dg+dhM6TyrIh
         S+0WtVphSMaVhK3L0u9uHABO828A//jWAS1KUZOu/AhpClTpReoN04mNxKjHFIGhZHr6
         Klf0gdUOXUIDiT34BSYEJr5lSaPFUqw+hEpEklDJG2LC05x4J2WaGfQEa74a9gQvQER3
         8Fx0fQDInEVoQgSoZvNkLaGbmtb/fbu9R4wLkC+WbRlEjf6v6ItYi2ykdBoBUTly6SW6
         laAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162992; x=1713767792;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3/UXsGbRM4hk6gURXUv3cQgeMnu1X8cp+uoMKx5i54A=;
        b=CN+Ov9rhenqGLoVSzcI9A/AYt8jAMSpU/13OiU9sWoHH2GkW5UfcgLO5OoJoZtBg57
         8pjzJBb+P1IXx/pr89GewXbpLIL9IIMpfJk1DZS3LB2Hk3dWF3b7if025aUdLZBXHSfh
         4ra8AEwZTPwUjBfhlKxLYhI3q4kb2PBq6a5yY1ZVmPaot0NRB6IW1mJBUtyFJrKgl9FO
         WDhHNCeSdL5B2KEr7Dl4h5rdKO0elhMTvkR1G9zRckRbaOO4q7gzgvcyiTxTrWb67P3M
         n42XyoTdYMmr/6/gbWr3S39ifnYjDvwXMN4H4OBBUmsFQabOkHZk5peSRgs/D2cg3LoB
         /pjg==
X-Forwarded-Encrypted: i=1; AJvYcCUqaSIeKR5HoCnCjTX01dO3ujiUYkvz5sTX1qb8znvA5Ej9u67yk0PIy6e4TDbI9N+i2IqbChXpxGVb1ZGLwEmFg827tD4bRPispDjneuRG
X-Gm-Message-State: AOJu0Ywj866/xV9GQTdxwp0NRkbNgYTMv9rb7NKOvIEzmqf2fV46JqjY
	rqrp0p/eXVCQpNqY4QpDl91+j1aVILlUUzzOnvzU8Mj0fIuTNX5cTp/GkaCd+OnswgGD7q9MPZQ
	xw4ZDug==
X-Google-Smtp-Source: AGHT+IEpPwiuctvi4YKU+jbWzpMd0bbjy29hbZCztwCayE2Xpwu2Te6+qRZrYddkUXa58px17V/U1JOs3MD6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a0d:c241:0:b0:615:80c8:94eb with SMTP id
 e62-20020a0dc241000000b0061580c894ebmr2287735ywd.10.1713162992269; Sun, 14
 Apr 2024 23:36:32 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:18 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-2-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 1/9] perf parse-events: Factor out '<event_or_pmu>/.../' parsing
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
X-CRM114-CacheID: sfid-20240414_233633_604169_36B196E8 
X-CRM114-Status: GOOD (  18.01  )
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

Factor out the case of an event or PMU name followed by a slash based
term list. This is with a view to sharing the code with new legacy
hardware parsing. Use early return to reduce indentation in the code.
Make parse_events_add_pmu static now it doesn't need sharing with
parse-events.y.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 69 +++++++++++++++++++++++++++++++-
 tools/perf/util/parse-events.h | 10 +++--
 tools/perf/util/parse-events.y | 73 +++-------------------------------
 3 files changed, 80 insertions(+), 72 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 6f8b0fa17689..b16c75bf5580 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1385,7 +1385,7 @@ static bool config_term_percore(struct list_head *config_terms)
 	return false;
 }
 
-int parse_events_add_pmu(struct parse_events_state *parse_state,
+static int parse_events_add_pmu(struct parse_events_state *parse_state,
 			 struct list_head *list, const char *name,
 			 const struct parse_events_terms *const_parsed_terms,
 			 bool auto_merge_stats, void *loc_)
@@ -1618,6 +1618,73 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 	return ok ? 0 : -1;
 }
 
+int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state,
+					const char *event_or_pmu,
+					const struct parse_events_terms *const_parsed_terms,
+					struct list_head **listp,
+					void *loc_)
+{
+	char *pattern = NULL;
+	YYLTYPE *loc = loc_;
+	struct perf_pmu *pmu = NULL;
+	int ok = 0;
+	char *help;
+
+	*listp = malloc(sizeof(**listp));
+	if (!*listp)
+		return -ENOMEM;
+
+	INIT_LIST_HEAD(*listp);
+
+	/* Attempt to add to list assuming event_or_pmu is a PMU name. */
+	if (!parse_events_add_pmu(parse_state, *listp, event_or_pmu, const_parsed_terms,
+					/*auto_merge_stats=*/false, loc))
+		return 0;
+
+	/* Failed to add, try wildcard expansion of event_or_pmu as a PMU name. */
+	if (asprintf(&pattern, "%s*", event_or_pmu) < 0) {
+		zfree(listp);
+		return -ENOMEM;
+	}
+
+	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
+		const char *name = pmu->name;
+
+		if (parse_events__filter_pmu(parse_state, pmu))
+			continue;
+
+		if (!strncmp(name, "uncore_", 7) &&
+		    strncmp(event_or_pmu, "uncore_", 7))
+			name += 7;
+		if (!perf_pmu__match(pattern, name, event_or_pmu) ||
+		    !perf_pmu__match(pattern, pmu->alias_name, event_or_pmu)) {
+			bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
+
+			if (!parse_events_add_pmu(parse_state, *listp, pmu->name, const_parsed_terms,
+						  auto_merge_stats, loc)) {
+				ok++;
+				parse_state->wild_card_pmus = true;
+			}
+		}
+	}
+	zfree(&pattern);
+	if (ok)
+		return 0;
+
+	/* Failure to add, assume event_or_pmu is an event name. */
+	zfree(listp);
+	if (!parse_events_multi_pmu_add(parse_state, event_or_pmu, const_parsed_terms, listp, loc))
+		return 0;
+
+	if (asprintf(&help, "Unable to find PMU or event on a PMU of '%s'", event_or_pmu) < 0)
+		help = NULL;
+	parse_events_error__handle(parse_state->error, loc->first_column,
+				strdup("Bad event or PMU"),
+				help);
+	zfree(listp);
+	return -EINVAL;
+}
+
 int parse_events__modifier_group(struct list_head *list,
 				 char *event_mod)
 {
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 809359e8544e..a331b9f0da2b 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -209,10 +209,6 @@ int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 				struct list_head *list,
 				u64 addr, char *type, u64 len,
 				struct parse_events_terms *head_config);
-int parse_events_add_pmu(struct parse_events_state *parse_state,
-			 struct list_head *list, const char *name,
-			 const struct parse_events_terms *const_parsed_terms,
-			bool auto_merge_stats, void *loc);
 
 struct evsel *parse_events__add_event(int idx, struct perf_event_attr *attr,
 				      const char *name, const char *metric_id,
@@ -223,6 +219,12 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			       const struct parse_events_terms *const_parsed_terms,
 			       struct list_head **listp, void *loc);
 
+int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state,
+					const char *event_or_pmu,
+					const struct parse_events_terms *const_parsed_terms,
+					struct list_head **listp,
+					void *loc_);
+
 void parse_events__set_leader(char *name, struct list_head *list);
 void parse_events_update_lists(struct list_head *list_event,
 			       struct list_head *list_all);
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index d70f5d84af92..14175eee9489 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -273,78 +273,17 @@ event_def: event_pmu |
 event_pmu:
 PE_NAME opt_pmu_config
 {
-	struct parse_events_state *parse_state = _parse_state;
 	/* List of created evsels. */
 	struct list_head *list = NULL;
-	char *pattern = NULL;
-
-#define CLEANUP						\
-	do {						\
-		parse_events_terms__delete($2);		\
-		free(list);				\
-		free($1);				\
-		free(pattern);				\
-	} while(0)
+	int err = parse_events_multi_pmu_add_or_add_pmu(_parse_state, $1, $2, &list, &@1);
 
-	list = alloc_list();
-	if (!list) {
-		CLEANUP;
+	parse_events_terms__delete($2);
+	free($1);
+	if (err == -ENOMEM)
 		YYNOMEM;
-	}
-	/* Attempt to add to list assuming $1 is a PMU name. */
-	if (parse_events_add_pmu(parse_state, list, $1, $2, /*auto_merge_stats=*/false, &@1)) {
-		struct perf_pmu *pmu = NULL;
-		int ok = 0;
-
-		/* Failure to add, try wildcard expansion of $1 as a PMU name. */
-		if (asprintf(&pattern, "%s*", $1) < 0) {
-			CLEANUP;
-			YYNOMEM;
-		}
-
-		while ((pmu = perf_pmus__scan(pmu)) != NULL) {
-			const char *name = pmu->name;
-
-			if (parse_events__filter_pmu(parse_state, pmu))
-				continue;
-
-			if (!strncmp(name, "uncore_", 7) &&
-			    strncmp($1, "uncore_", 7))
-				name += 7;
-			if (!perf_pmu__match(pattern, name, $1) ||
-			    !perf_pmu__match(pattern, pmu->alias_name, $1)) {
-				bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
-
-				if (!parse_events_add_pmu(parse_state, list, pmu->name, $2,
-							  auto_merge_stats, &@1)) {
-					ok++;
-					parse_state->wild_card_pmus = true;
-				}
-			}
-		}
-
-		if (!ok) {
-			/* Failure to add, assume $1 is an event name. */
-			zfree(&list);
-			ok = !parse_events_multi_pmu_add(parse_state, $1, $2, &list, &@1);
-		}
-		if (!ok) {
-			struct parse_events_error *error = parse_state->error;
-			char *help;
-
-			if (asprintf(&help, "Unable to find PMU or event on a PMU of '%s'", $1) < 0)
-				help = NULL;
-			parse_events_error__handle(error, @1.first_column,
-						   strdup("Bad event or PMU"),
-						   help);
-			CLEANUP;
-			YYABORT;
-		}
-	}
+	if (err)
+		YYABORT;
 	$$ = list;
-	list = NULL;
-	CLEANUP;
-#undef CLEANUP
 }
 |
 PE_NAME sep_dc
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
