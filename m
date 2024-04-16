Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 085B4C07E8E
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UmjuFGAuL5ww/+RKX39ShhX1SHs9Gq53HHohbLX6Moo=; b=x5vAko4FA890et
	VVG9JYJvcsxo3ow0kfbDpwETcn7QHsTU2AiQbRC4kXhvMH4+fO4HFl8zJZue1XW8hx+iVF9J9p636
	YbcqIcCDpK5Uf0W0OQls9RDiIi/iXk3f5N7EFIfwgnzPoTfCkNXguz0GI3LRTPwpdmCu+1RNamI+T
	9FSd79ebyEUxTQmsfIEluinODTnb2A9o/ZYcJNTuJ8dCMhMfbTtXP/Fn43HH5IQ8Fa8Q1AfCRwS69
	NEYjipIOEsovaPb1D0buSWMW1eEA053PRMc7TeuNHKB1IMFRkNJ9gWMX5f7Ix3+xwytl6xSi93fmA
	ugJlvDNuQbuB53cZWLdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6x-0000000B2GQ-28CW;
	Tue, 16 Apr 2024 06:16:07 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6p-0000000B28v-4AFW
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:02 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-61891efba06so53599147b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248158; x=1713852958; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=k83zolc/tumM7XBpJQ8EaNI+D4ORxoBWKEwoUmDFaek=;
        b=BeMBa6cwbUIDzeNskpWPiOO95FrL9QW/zWHr6SSmbtqidJRRiF5Nb6LXlXKCeKljVc
         vlM1mU1iYHfyOTtm2JRQnW8flDRgR+ii7ZXLT0tuQq9mMxjLFF+mbRVFbdPS3uQdTZnb
         CXi13Mofm4H/2h/sMAS5OikjglVyNGlokGTEw/H5R/89gtz4fse7Xi3Hv8n5ZBYA2kFV
         cICV6HUkYNZML8xRdTRkVxQQmbK5ax1JNh2zzcP/+UKkuOq8wFVo6WJz5jkcQq7lVrcI
         v58uM/1ZcA88oEhPNWUhLI42DJbDekyAcAaau4yrXVzDU8acokRVtnRlZnX7plhDgQk6
         7Eaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248158; x=1713852958;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=k83zolc/tumM7XBpJQ8EaNI+D4ORxoBWKEwoUmDFaek=;
        b=h1BN4EHX0MmLLb+Wx4nWQqLI7XGr4lSSDhTs6wxWoJPug7vZAgBdzSODVlPnVCB9OT
         /JtJSfeR0d4dzNzy25wQOzxR1V9aA3Jnir2/ViTyMniOcUj+Yddl9xa4uQs+z0pz2gmn
         WKOeSjYGR7fFY3gRW6iZMxjuocdvQ0xKMC4C4kVJwFzUWuPeRyX1E9xCfZ8q5qe5JKUE
         JiqQM6Dusm5GZ/kzQJD94lYGGpTrj8T/VXG/998PKZCn+sZkMIRj1WUAKCG4y7T0ImPb
         LP0RgWgRVd42ZC0nnsfqRIyTO07Jc2H+M60R8OhZa1McfKwv/LltyYBw0cAGkuQasDVQ
         hF6A==
X-Forwarded-Encrypted: i=1; AJvYcCWjid1u9emmgrDJvLNBZXJSpybYmyQZ6qdCsZlKfXko7veCsaLbQ61sWmyPmn2E+Th2cFYOmMOOAdKOaWCtQCNDthf87zlrpYqq+VNolHnl
X-Gm-Message-State: AOJu0YyahrjOXmZmMVCwZhv/8VGhiIgpadYbb2Pr55vWw0+9Es939ReK
	W77UJ+HxTyaeo3mcN3P+Xg+Hqetd3CvlE3SscPt19FzqP3tGnRJoYNKfua3HPVqPlWLP0SI/x5n
	svJvXQw==
X-Google-Smtp-Source: AGHT+IEpN/W9bPJeui69q0ZUQ4qSKte3BSaEqlY+RZGoPcSYQ+AbbeHfa7sJctYDOzeLW8y3VSjctuWlZy+r
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a0d:ca07:0:b0:615:27b6:7624 with SMTP id
 m7-20020a0dca07000000b0061527b67624mr3084038ywd.6.1713248158096; Mon, 15 Apr
 2024 23:15:58 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:22 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-7-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 06/16] perf parse-events: Legacy cache names on all PMUs
 and lower priority
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
X-CRM114-CacheID: sfid-20240415_231600_215599_DD9C5AEF 
X-CRM114-Status: GOOD (  18.88  )
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

Prior behavior is to not look for legacy cache names in sysfs/json and
to create events on all core PMUs. New behavior is to look for
sysfs/json events first on all PMUs, for core PMUs add a legacy event
if the sysfs/json event isn't present.

This is done so that there is consistency with how event names in
terms are handled and their prioritization of sysfs/json over
legacy. It may make sense to use a legacy cache event name as an event
name on a non-core PMU so we should allow it.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 39 +++++++++++++++++++++++++++-------
 tools/perf/util/parse-events.h |  2 +-
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 39548ec645ec..1440a3b4b674 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -442,17 +442,21 @@ bool parse_events__filter_pmu(const struct parse_events_state *parse_state,
 	return strcmp(parse_state->pmu_filter, pmu->name) != 0;
 }
 
+static int parse_events_add_pmu(struct parse_events_state *parse_state,
+				struct list_head *list, struct perf_pmu *pmu,
+				const struct parse_events_terms *const_parsed_terms,
+				bool auto_merge_stats);
+
 int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 			   struct parse_events_state *parse_state,
-			   struct parse_events_terms *head_config)
+			   struct parse_events_terms *parsed_terms)
 {
 	struct perf_pmu *pmu = NULL;
 	bool found_supported = false;
-	const char *config_name = get_config_name(head_config);
-	const char *metric_id = get_config_metric_id(head_config);
+	const char *config_name = get_config_name(parsed_terms);
+	const char *metric_id = get_config_metric_id(parsed_terms);
 
-	/* Legacy cache events are only supported by core PMUs. */
-	while ((pmu = perf_pmus__scan_core(pmu)) != NULL) {
+	while ((pmu = perf_pmus__scan(pmu)) != NULL) {
 		LIST_HEAD(config_terms);
 		struct perf_event_attr attr;
 		int ret;
@@ -460,6 +464,24 @@ int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 		if (parse_events__filter_pmu(parse_state, pmu))
 			continue;
 
+		if (perf_pmu__have_event(pmu, name)) {
+			/*
+			 * The PMU has the event so add as not a legacy cache
+			 * event.
+			 */
+			ret = parse_events_add_pmu(parse_state, list, pmu,
+						   parsed_terms,
+						   perf_pmu__auto_merge_stats(pmu));
+			if (ret)
+				return ret;
+			continue;
+		}
+
+		if (!pmu->is_core) {
+			/* Legacy cache events are only supported by core PMUs. */
+			continue;
+		}
+
 		memset(&attr, 0, sizeof(attr));
 		attr.type = PERF_TYPE_HW_CACHE;
 
@@ -469,11 +491,12 @@ int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 
 		found_supported = true;
 
-		if (head_config) {
-			if (config_attr(&attr, head_config, parse_state->error, config_term_common))
+		if (parsed_terms) {
+			if (config_attr(&attr, parsed_terms, parse_state->error,
+					config_term_common))
 				return -EINVAL;
 
-			if (get_config_terms(head_config, &config_terms))
+			if (get_config_terms(parsed_terms, &config_terms))
 				return -ENOMEM;
 		}
 
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index a331b9f0da2b..db47913e54bc 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -203,7 +203,7 @@ int parse_events_add_tool(struct parse_events_state *parse_state,
 			  int tool_event);
 int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 			   struct parse_events_state *parse_state,
-			   struct parse_events_terms *head_config);
+			   struct parse_events_terms *parsed_terms);
 int parse_events__decode_legacy_cache(const char *name, int pmu_type, __u64 *config);
 int parse_events_add_breakpoint(struct parse_events_state *parse_state,
 				struct list_head *list,
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
