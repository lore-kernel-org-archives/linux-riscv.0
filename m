Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 768BAC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ukvnKKfEjw5puQUWJp5ZY6e0aEUvTAbuumnXClMizhY=; b=18MHmiAnqCRS4U
	4HL6IDNHI66uH64qxAf7OePouDoLs6ZpNgcFixDj3py+NVakwBd4+K7Z+/wZFsApiOv3h/M30IeQb
	TlNZKQuLeAqVTLamiZAyaNU2oNyTDRy3maqZyG/4bdwTNW3QmNdB6A99YT8M7PZvXnirquBa9mL4u
	Vo2dEyTrxk9Z3wlu5D3BYVM7QpZLPS+sxs9HENRBrljSnKLypJcOshQHTEkcpqhOwlgSiDSDQC5GP
	huMezo5gHBjyaLe5d9UCwmVvcElEktNjpZ3c8y7xlnGOCm2vlE1G81zKeg+ENK6d2L9wArfECLDlg
	f9dRzSUdfV52P760w9FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxh-00000007BGl-3avY;
	Mon, 15 Apr 2024 06:37:05 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxT-00000007B4S-1DoW
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:54 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dc6b26ce0bbso5618521276.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713163010; x=1713767810; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SsM8Y1cj6kmrsHpwiXYtXKur/DOQuLkG4gE86ZL8CEk=;
        b=lrAhcTzIVFa2IhY/3lNsD5EZQTqj7Un/a96EF4crV0Ba8aETXMKn+TU8NkHl4HinT+
         00Bi8Ts1eONjtZDSJVVC+h24zP9XRx1F+40oAf8/OaMqY+kqJb+0eKmA/4go1+Je9K55
         4Ekyvdkn+CPwdKZ9AuJh78Zo3c4BJPrFrUG2TV5NY4JpNq/S5slMFAOfi8ZfJPYBKClq
         vXhrllmC73RzsjkEUaU++zizETN64VcEMk0IZKqDNDzij7+pXbARfDOxs7crbT5GJLFm
         oasPPUVgZ9rKUkc56AuphJA42oevXpIvmOMf2cL0kr0ygASSmhqFozcadsVaSYy9SDEk
         m4Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163010; x=1713767810;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SsM8Y1cj6kmrsHpwiXYtXKur/DOQuLkG4gE86ZL8CEk=;
        b=DPCpqBOgbV9/ikn4mLj6CVqirNoikkkFB75f9egOrrfieID7w/eOfMbod0L23DoQ+r
         YUebPFFt1LZd2VxcTmZRuZeh0jGSOQoQnE3XdP/6SK5tWKqxxHuQX6I8cHAEbHnifNwg
         Y4wlvUAnYAZT/bNNopVW2Zhs/rEdLh5OA3Fi5Q7nvvcRiC8nl48sfbiQjAIFYuvKtgB/
         5THPtjU5yzrRt02Ft8rXqMTil49Giq8o3AEH/XkCUQrB5BRmsADA2cCvw7zjsPs3QD7v
         O+qLtIlujpE7fjHAeJY1yES8Q8EPxulH7O1/ghx/LAJJ10R2/ZE5tBB0GWBTj7FiS96L
         bMvg==
X-Forwarded-Encrypted: i=1; AJvYcCVnCXrZhWcYmWqdJigxBxpDoE9icF9PxojtSog3Z8c49a2pHjpZmdXYrbDef5PdcRo61rI8ymhh3pxFnSL+fBKUb8+RToabuG1XJp2KP/zH
X-Gm-Message-State: AOJu0YwXB+sC1j0CxZBQtm0vo6KyBOrbQ3q+tbgkGBQjtb9XoHf4OSY+
	lyhGxMuFZlruh3EfGL8m2J+urH+LLG41MMKyC5jDfuqG3UWlGLe2IH3pH6ZgVDj+Iwicl6IkuE6
	AXZcHbg==
X-Google-Smtp-Source: AGHT+IGgmCtdEtZrTu/VTbHRcGxy01TSWSnKf6exxI0DVUKXLBA7LgeFtUQlO61tu+Bc2rAGxXCSISNxPEr+
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a05:6902:1549:b0:dc6:dfd9:d431 with SMTP
 id r9-20020a056902154900b00dc6dfd9d431mr2983582ybu.1.1713163009901; Sun, 14
 Apr 2024 23:36:49 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:25 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-9-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 8/9] perf parse-events: Constify parse_events_add_numeric
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
X-CRM114-CacheID: sfid-20240414_233651_653533_8807A504 
X-CRM114-Status: GOOD (  11.22  )
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
index f711ad9b18f0..50c4012c737e 100644
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
 
@@ -1107,7 +1108,7 @@ static int config_term_tracepoint(struct perf_event_attr *attr,
 #endif
 
 static int config_attr(struct perf_event_attr *attr,
-		       struct parse_events_terms *head,
+		       const struct parse_events_terms *head,
 		       struct parse_events_error *err,
 		       config_term_func_t config_term)
 {
@@ -1120,7 +1121,8 @@ static int config_attr(struct perf_event_attr *attr,
 	return 0;
 }
 
-static int get_config_terms(struct parse_events_terms *head_config, struct list_head *head_terms)
+static int get_config_terms(const struct parse_events_terms *head_config,
+			    struct list_head *head_terms)
 {
 #define ADD_CONFIG_TERM(__type, __weak)				\
 	struct evsel_config_term *__t;			\
@@ -1324,7 +1326,7 @@ int parse_events_add_tracepoint(struct list_head *list, int *idx,
 static int __parse_events_add_numeric(struct parse_events_state *parse_state,
 				struct list_head *list,
 				struct perf_pmu *pmu, u32 type, u32 extended_type,
-				u64 config, struct parse_events_terms *head_config)
+				u64 config, const struct parse_events_terms *head_config)
 {
 	struct perf_event_attr attr;
 	LIST_HEAD(config_terms);
@@ -1360,7 +1362,7 @@ static int __parse_events_add_numeric(struct parse_events_state *parse_state,
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
