Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F8EAC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqpkBQh7P6OAMV8M2M/Rhs7cQXrLcU3kHe5mls4pyMA=; b=ReNQWEwzv4l/4O
	nTK8vbLW0SOkZigYjgwgfPLE8UsBnhsOumI6dVIt7fDe7/ETdIooJ21DjGNW5CzjdTN5WnvyeR7gP
	ZDEEAK7bW4dgA3J6TJLhkf+QG/UtvyrntQHH4lMnpOf/igBFsAnPmtGMkPln9zUE0CmIMj1UAqB+8
	cA0WWQrkME5Egcx2ibw2Njzvf3d1TH5PoeAl6njqAPkvBWq+M+1+9unK5grvIX2EKTXhKPXQuuf1n
	t57fTFWKuGOiwb5ldVhbbrdKSWiY5K6wadOTEBadsLPJxpx7clawfknfw2+4ImBSfVroS963Gg497
	4IHzDrLJ9KJM/kt9kE2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxX-00000007B8b-2EF1;
	Mon, 15 Apr 2024 06:36:55 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxO-00000007Azl-0n0W
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:48 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b269686aso4160336276.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713163005; x=1713767805; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hx/Ta0rDGqfG4yTzEhISDdPx4oXkJbCeHRtXa2sGNYw=;
        b=M6DbR5UxZlnlT7NnQr6G36QdHCTbH6etSjR3v3guBxvjup7Kg6JwcepHU07i5Swh8Y
         5G0UEb69trnjtrsodm/+WthPUpt6uOPsLWTIGcbJEANbC3OTvbgnJ0v3/R9LhBjURnSB
         rVnJEDWAok8QMin0qYLcJkhkxHFayPP6VwbwE4o1zNLoG0qfoKa5Vv8d2CyuX7mds1Rk
         2f3RWE2Gx07X1F9+f20Wjn4WGvRAW5b/7xWODh+fI4oH4HuVczuqeYhh3W5ci+pSCpt/
         cN3/mmAFj5MsiZfmUM1oChaKuGt2sbPAwF1+cuxc39SMTu1IEd0ehRfAs8Gg3yukjC4T
         kdZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163005; x=1713767805;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hx/Ta0rDGqfG4yTzEhISDdPx4oXkJbCeHRtXa2sGNYw=;
        b=HvXha21QGAApHkQn8Nkk7m0MgQWnm+OVEPG+aC9QIhU7tNIN6V1Af8/kZWRxVOadzO
         9h2EkxXV4WwedNKNHZWgThyQ0nzUd9KRjSJAj4xxvOzY3G25+6BoGzWYFNNz0RVTXH1+
         4KlA6nIInAAJHijR8ZcjXJ49vPA6TC6zwCX7R6ygr1R5oyhgWr4OjtIYF8eEq/DElTKo
         /UTRKVk2UgeSBb6MwOTgFyw1kLeUf8vNzc9l6rt/U+maOYCIIKEGn+yR90QJ3jR8ZnDY
         8SjKoHI9w59U9s29NoknohHxZrqNrbCpy9uNYA8+ZHQ8B3OuWiiLtYCbLP+TXtomoPhn
         kWJg==
X-Forwarded-Encrypted: i=1; AJvYcCXhjNkVrL9bnwEinAsTa7Z0QzZTEkmLonZJqS0R/SYr7iC5vTm3VtVkbZBeXXI2jVi6GJJrhgZFUULGBxpSs3V6+f0E9znR37UOm3CTgqN5
X-Gm-Message-State: AOJu0YzSfiVbyoNDRR6xzrPNDInrmV8ThHUYXTRwadTy+DNEax7crVH7
	Pf2vtL6XOoXrUmJtgpQd18z3cX73bC9C0vOH8Rp4DLG4TymUzX2biZxAyG1IBd9x/yXvYfCxGW5
	DHQeFaQ==
X-Google-Smtp-Source: AGHT+IGKjbFopUbPAz4023seU2rQZ1FOntIZ8rt7x+OCB1yu2RcNgzS+jPNzrST2MfTWwwugdpm9slVKlTFo
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a05:6902:120b:b0:de0:ecc6:87b with SMTP id
 s11-20020a056902120b00b00de0ecc6087bmr742661ybu.1.1713163004978; Sun, 14 Apr
 2024 23:36:44 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:23 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-7-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 6/9] perf parse-events: Legacy cache names on all PMUs and
 lower priority
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
X-CRM114-CacheID: sfid-20240414_233646_324074_6EBC7A36 
X-CRM114-Status: GOOD (  18.49  )
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
 tools/perf/util/parse-events.c | 38 +++++++++++++++++++++++++++-------
 tools/perf/util/parse-events.h |  2 +-
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index f4de374dab59..f711ad9b18f0 100644
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
 
@@ -469,11 +491,11 @@ int parse_events_add_cache(struct list_head *list, int *idx, const char *name,
 
 		found_supported = true;
 
-		if (head_config) {
-			if (config_attr(&attr, head_config, parse_state->error, config_term_common))
+		if (parsed_terms) {
+			if (config_attr(&attr, parsed_terms, parse_state->error, config_term_common))
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
