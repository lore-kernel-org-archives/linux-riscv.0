Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2060C10F15
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0yIo59XdGygvrXjsyGPCv2QTH6M9v+Xw9LtkYmuJFP8=; b=yQoE65c7LbyUwq
	k3NYEVmcvk/oFT03jKxzQAR1533hqO9O9gMcfc4jzCuwjyxPojCBQKQCrnhDATzxpD68SvC1sZz7b
	2fvx7YW02+HPxtGPEdH1j5nDHspdUUOyjAN/MHeOYq9KbrcRnRqAy5OturrxRRCgFqS9HBpXF/w9O
	TOCR/jbpvssPDpAaiNMzHIF0a4y1B5pXfpVIVBqxUa74lOKIQASZ1Ri4N8z+lVe7fuqgBKgN4Fvtm
	V9yxSUs1QMpjKwO/u/iGz3axmlyK/EZIBS9Lu5vs1LGkEjazuihiRkAvPCH8Chv4iCAOWMRu3qsGs
	eQCU4ARr+ILmtzFYKkCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc76-0000000B2Nz-0bYn;
	Tue, 16 Apr 2024 06:16:16 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6u-0000000B2D6-2Afb
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:05 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dd0ae66422fso7990639276.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248163; x=1713852963; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OT8KC34fIpe9dV5ekpHBVAc8u9M7U+9LMtZzVFuRsJU=;
        b=H0k5KT1985Fepp05LCOpCUD9dcZP91w1NthfjhDoKquL4v773+HuHgpx7kEunOI4bm
         sIDVSGKsWR6jdsv3crVRm9DmCiZnwNb1JuSwUKMxN3oNy2zj2S8NTE9UMQYZmDydw+Ta
         L7AvxZ+VtEf1hAluJ420DKVCEhaiGbhzNCDlc4G1o5/s/dIGN85PH5sMrChgXVRDu70f
         i1b+MCssIo7brfz0qNbFmeCpZLlotTb5QZKdeTh3iz0hMmt+K9K1pzPOEz0SUehMdm+c
         TiNzKzuxnf7SrSz0yT3UCcJcxvRi45gpXSsMFJItSiuFkNt6EAlaNiyXW7UrazOA+pIJ
         3skQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248163; x=1713852963;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OT8KC34fIpe9dV5ekpHBVAc8u9M7U+9LMtZzVFuRsJU=;
        b=GdlL0uy5eSSddV9mTvGEyGNE7SLg8Ack7PHuU4BhFZflzQrSokd8QYQ5H6ayNHuYSg
         cva8vT05LtT2MoIZSkwzkjj3XHkauuhTUezDAX8ha3VwHy0qmsKYRYPOGBW+w3zo2Kjz
         4THzmvj031MRifehVXX2BhOweN4HeoY8MjSfay2hD3wkIt7QlSExeSzy7U0wFJum4umR
         K1I37IRauKqBHOWNDFGfnzA55AXrPO5YCji6lYeHFeBrcn/XGp00/KOxJUOaqaAc9lkg
         5y+M4/3dSRTKQDw2s4tRqQYYR6C96xU4RfOGzYvLshPgEcJoB19hAQYQMpN5BdUjB39b
         YLAA==
X-Forwarded-Encrypted: i=1; AJvYcCWWHsQO4HUdO0jGlTmR7I9YnUJgFFpRG6fS2s2Z9bjMeVDKUnIT7YNk2H9Alh0Mf64OlYjx8haJbN/9ktAJxZqA28RyeLZqYPX8k/iXLnaa
X-Gm-Message-State: AOJu0YyDH9X+Ue2VMYgNTHzT4aWV9YETB/I24td0+SVxUbfxAFglF9U+
	RJVjJu++bbu8rKFeDtw20WfhphJkI0SBdANY/gUgODLC1cZ6gi7OeIRQJNq10ZlJiG2FPAuja4L
	QXCUpYg==
X-Google-Smtp-Source: AGHT+IFBtPJYigu1UNX+GxG1HR1ZdO9/jLJVgWPHL5U4mEa5M4iyJ8CDK6Wzt09A6xnIJAoSUf1Qycy+LsVf
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:c0c:b0:dd9:20c1:85b6 with SMTP id
 fs12-20020a0569020c0c00b00dd920c185b6mr576115ybb.2.1713248162866; Mon, 15 Apr
 2024 23:16:02 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:24 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-9-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 08/16] perf parse-events: Constify parse_events_add_numeric
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
X-CRM114-CacheID: sfid-20240415_231604_680897_41E61748 
X-CRM114-Status: GOOD (  11.89  )
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

Allow the term list to be const so that other functions can pass const
term lists. Add const as necessary to called functions.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 20 +++++++++++---------
 tools/perf/util/parse-events.h |  2 +-
 2 files changed, 12 insertions(+), 10 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 1440a3b4b674..1b408e3dccc7 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -34,7 +34,8 @@
 #ifdef PARSER_DEBUG
 extern int parse_events_debug;
 #endif
-static int get_config_terms(struct parse_events_terms *head_config, struct list_head *head_terms);
+static int get_config_terms(const struct parse_events_terms *head_config,
+			    struct list_head *head_terms);
 static int parse_events_terms__copy(const struct parse_events_terms *src,
 				    struct parse_events_terms *dest);
 
@@ -154,7 +155,7 @@ const char *event_type(int type)
 	return "unknown";
 }
 
-static char *get_config_str(struct parse_events_terms *head_terms,
+static char *get_config_str(const struct parse_events_terms *head_terms,
 			    enum parse_events__term_type type_term)
 {
 	struct parse_events_term *term;
@@ -169,12 +170,12 @@ static char *get_config_str(struct parse_events_terms *head_terms,
 	return NULL;
 }
 
-static char *get_config_metric_id(struct parse_events_terms *head_terms)
+static char *get_config_metric_id(const struct parse_events_terms *head_terms)
 {
 	return get_config_str(head_terms, PARSE_EVENTS__TERM_TYPE_METRIC_ID);
 }
 
-static char *get_config_name(struct parse_events_terms *head_terms)
+static char *get_config_name(const struct parse_events_terms *head_terms)
 {
 	return get_config_str(head_terms, PARSE_EVENTS__TERM_TYPE_NAME);
 }
@@ -358,7 +359,7 @@ static int config_term_common(struct perf_event_attr *attr,
 			      struct parse_events_term *term,
 			      struct parse_events_error *err);
 static int config_attr(struct perf_event_attr *attr,
-		       struct parse_events_terms *head,
+		       const struct parse_events_terms *head,
 		       struct parse_events_error *err,
 		       config_term_func_t config_term);
 
@@ -1108,7 +1109,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 #endif
 
 static int config_attr(struct perf_event_attr *attr,
-		       struct parse_events_terms *head,
+		       const struct parse_events_terms *head,
 		       struct parse_events_error *err,
 		       config_term_func_t config_term)
 {
@@ -1121,7 +1122,8 @@ static int config_attr(struct perf_event_attr *attr,
 	return 0;
 }
 
-static int get_config_terms(struct parse_events_terms *head_config, struct list_head *head_terms)
+static int get_config_terms(const struct parse_events_terms *head_config,
+			    struct list_head *head_terms)
 {
 #define ADD_CONFIG_TERM(__type, __weak)				\
 	struct evsel_config_term *__t;			\
@@ -1325,7 +1327,7 @@ int parse_events_add_tracepoint(struct list_head *list, int *idx,
 static int __parse_events_add_numeric(struct parse_events_state *parse_state,
 				struct list_head *list,
 				struct perf_pmu *pmu, u32 type, u32 extended_type,
-				u64 config, struct parse_events_terms *head_config)
+				u64 config, const struct parse_events_terms *head_config)
 {
 	struct perf_event_attr attr;
 	LIST_HEAD(config_terms);
@@ -1361,7 +1363,7 @@ static int __parse_events_add_numeric(struct parse_events_state *parse_state,
 int parse_events_add_numeric(struct parse_events_state *parse_state,
 			     struct list_head *list,
 			     u32 type, u64 config,
-			     struct parse_events_terms *head_config,
+			     const struct parse_events_terms *head_config,
 			     bool wildcard)
 {
 	struct perf_pmu *pmu = NULL;
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index db47913e54bc..5005782766e9 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -196,7 +196,7 @@ int parse_events_add_tracepoint(struct list_head *list, int *idx,
 int parse_events_add_numeric(struct parse_events_state *parse_state,
 			     struct list_head *list,
 			     u32 type, u64 config,
-			     struct parse_events_terms *head_config,
+			     const struct parse_events_terms *head_config,
 			     bool wildcard);
 int parse_events_add_tool(struct parse_events_state *parse_state,
 			  struct list_head *list,
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
