Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5235EC10F16
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=43Egkws8LVe+3PfxLnJ03l9oqvErSLJV2W+pkPhTPzU=; b=N+2DDoeZgW9fSl
	Es+F3UHo2XRuevZ9/cp+leJMBlm5VyAaS4//E6ThgrkZTGG/Rzgn39T5CuR22c4T0bXpdbksdz6dV
	B/iCFY5U+7HplmFhbIVnXYvmAEkxFWNl3NUTeEOMTHgXVF19+swJUfo+kVirGTVrwS9ppcCIU5m74
	mK1BaHTq2A/aM2idV93avEMpyBcP07aqpi1V/bKYXttsAL1IL2DMLTkL8wc6LvHGwc6MhLlEtB84M
	gj6TiQPflpMQqwozz3d7jyKwszM0a9eVJnTZogRgV0F8QY3E8Mw6LEOZIis5UV/r0djhorLTiWmci
	L2CXZDkl3gehJ+rDI/Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7B-0000000B2Tb-2uDj;
	Tue, 16 Apr 2024 06:16:22 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6z-0000000B2H5-1siK
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:11 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61891efba06so53600927b3.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248168; x=1713852968; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+PPi7agW0cdqI/eav98kRS0rctCNoN8MXcmmiJuSnV8=;
        b=WoCZhCrmzaCrlJ0+cRwetl6CotEJ5wZWX8tskEbU3E4SI2u0QpK5iVkRFocu9qRNfp
         h+sxLG1ZkpYQx+pB80T8641bltwpQeAP35dsIWToIobcnVfLFnBxEAldxQ5srcNDijmj
         tkHcw4PIuNgkfmbjdat+VqVhpVdFVNLowimYE/qIjAaiPSSLW5jh/f25dkqv8Dz/aML5
         CElv46XzhdO55XoXUd3/LG7lKcmgYUPDseMYkYpuC1P90atyHTA67akpdidL9x1jjLxc
         zigA+2oU9m4hh0+bw7KGrHZABVtE+VbK4kXKWKE/3KrtD5NczcYAqfC9v4GjuUMf04qR
         iDnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248168; x=1713852968;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+PPi7agW0cdqI/eav98kRS0rctCNoN8MXcmmiJuSnV8=;
        b=DnNyQdIDYycrad9kfBt9sdqlK9MJYvOx8I+2CijerNmRSKJlTH79n/MWpAhZlsvz2K
         x+1/aZTy5G+LdO9Wcv6exlKJok8qxuipVrQW+8k6Zz7cwWBg2WOMqK69fP8ug2FWlfz2
         ekiKIdN6cPj/Aj/c97HsHZQNjJll/uNy8cjj4GEeKMf1k3Bm0iux2rh57ymb1WTotmm0
         C+zSHJyXo8nnhb/qiUYMWLC3UYotO+98lBPAfms41jbqmM/cIxcorwue5gpnyUNB/pyO
         ZiKHKw59Yr8pSbHDBnwwXfcGB6W0Uy307nwffJ7j5YOdm3aIvzk1buwokg+ZdE24p+/S
         PpBw==
X-Forwarded-Encrypted: i=1; AJvYcCV3bXHAeWli/tPAMyvrwW/KDTWIniQwQUmYxstsBM+Xlv/PV+iNLNDtxqyxpT8MiUzEE1S3O84KqSompn5x9sntgh6gtTWfA3hY8MBLSKtT
X-Gm-Message-State: AOJu0Yznlg4JXqI6nNyYBS0mUEBVwf8XCvqP+X95r5DpwZy5fUl9N50x
	rpNf29En9vZ/VCGfVaCrjQwc9rXDt2D1IINcq835NuuDDg0o/7adz1gVQkmNp5O5DSRlmek5jy/
	AWREyeA==
X-Google-Smtp-Source: AGHT+IH2niG4HLP7/x+KA0mPGPOc5Cee9M3cvuF12USU8FSK8dwpi2y2t4/mArka5E1ZbdSzG8VUZRYDDFLw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:1501:b0:dd9:1b94:edb5 with SMTP
 id q1-20020a056902150100b00dd91b94edb5mr1355225ybu.10.1713248167928; Mon, 15
 Apr 2024 23:16:07 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:26 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-11-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 10/16] perf parse-events: Inline parse_events_update_lists
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
X-CRM114-CacheID: sfid-20240415_231609_642608_808422C8 
X-CRM114-Status: GOOD (  16.76  )
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

The helper function just wraps a splice and free. Making the free
inline removes a comment, so then it just wraps a splice which we can
make inline too.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 13 -----------
 tools/perf/util/parse-events.h |  2 --
 tools/perf/util/parse-events.y | 41 +++++++++++++++++++++-------------
 3 files changed, 25 insertions(+), 31 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 805872c90a3e..7eba714f0d73 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1720,19 +1720,6 @@ void parse_events__set_leader(char *name, struct list_head *list)
 	leader->group_name = name;
 }
 
-/* list_event is assumed to point to malloc'ed memory */
-void parse_events_update_lists(struct list_head *list_event,
-			       struct list_head *list_all)
-{
-	/*
-	 * Called for single event definition. Update the
-	 * 'all event' list, and reinit the 'single event'
-	 * list, for next event definition.
-	 */
-	list_splice_tail(list_event, list_all);
-	free(list_event);
-}
-
 struct event_modifier {
 	int eu;
 	int ek;
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 7e5afad3feb8..e8f2aebea10f 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -226,8 +226,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 					void *loc_);
 
 void parse_events__set_leader(char *name, struct list_head *list);
-void parse_events_update_lists(struct list_head *list_event,
-			       struct list_head *list_all);
 void parse_events_evlist_error(struct parse_events_state *parse_state,
 			       int idx, const char *str);
 
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 31fe8cf428ff..51490f0f8c50 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -125,6 +125,10 @@ static void free_list_evsel(struct list_head* list_evsel)
 }
 %%
 
+ /*
+  * Entry points. We are either parsing events or terminals. Just terminal
+  * parsing is used for parsing events in sysfs.
+  */
 start:
 PE_START_EVENTS start_events
 |
@@ -132,31 +136,36 @@ PE_START_TERMS  start_terms
 
 start_events: groups
 {
+	/* Take the parsed events, groups.. and place into parse_state. */
+	struct list_head *groups  = $1;
 	struct parse_events_state *parse_state = _parse_state;
 
-	/* frees $1 */
-	parse_events_update_lists($1, &parse_state->list);
+	list_splice_tail(groups, &parse_state->list);
+	free(groups);
 }
 
-groups:
+groups: /* A list of groups or events. */
 groups ',' group
 {
-	struct list_head *list  = $1;
-	struct list_head *group = $3;
+	/* Merge group into the list of events/groups. */
+	struct list_head *groups  = $1;
+	struct list_head *group  = $3;
 
-	/* frees $3 */
-	parse_events_update_lists(group, list);
-	$$ = list;
+	list_splice_tail(group, groups);
+	free(group);
+	$$ = groups;
 }
 |
 groups ',' event
 {
-	struct list_head *list  = $1;
+	/* Merge event into the list of events/groups. */
+	struct list_head *groups  = $1;
 	struct list_head *event = $3;
 
-	/* frees $3 */
-	parse_events_update_lists(event, list);
-	$$ = list;
+
+	list_splice_tail(event, groups);
+	free(event);
+	$$ = groups;
 }
 |
 group
@@ -206,12 +215,12 @@ PE_NAME '{' events '}'
 events:
 events ',' event
 {
+	struct list_head *events  = $1;
 	struct list_head *event = $3;
-	struct list_head *list  = $1;
 
-	/* frees $3 */
-	parse_events_update_lists(event, list);
-	$$ = list;
+	list_splice_tail(event, events);
+	free(event);
+	$$ = events;
 }
 |
 event
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
