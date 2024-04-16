Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0B5C19F4F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=k6F7ES5Cnf5AiZefV8wUqFzgdxhrF3FCz3V5DcVhvWU=; b=PjFSgWI7wHWIvc
	fNTZh6x890XWbMFkQcPvfVO9RhY3yqqoO2BtUmkUeAhLxW1xdOmZkXbcQ/b08omg7FTEFbGsIS99T
	0h3MNOC5haxq/+SFFQ2+4mKF0IEEBBLEdBLCUB9EqPxeX6q9xeTHeOz5lBwlTXAh6lOzaLWg6+Hmi
	ucZ/0Xg7BgRcZerSFg5SfqQawRJwrQYPQq12yMh+P/izxtX9TdPTb/XCJlYZLMiQal0OCk7Swf/0+
	SwZ5mE3ItSr9upecY6UodFiRZlBHLxMsgzCHK/92f6UIaFqL0+MfZTVKc1WV15NFB3AbFGkOcZj1w
	/5dxmN9SJcEfTWZQ81dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7c-0000000B2qM-2RSm;
	Tue, 16 Apr 2024 06:16:48 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7D-0000000B2U7-3urg
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:34 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcdc3db67f0so6419986276.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248182; x=1713852982; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yAZaI9XNl5kKuFXYgLfdboqZLBXY1vO78aqvi2rTEGA=;
        b=bqKlBsBzVbw6vQig65e3rBTwtK59eFgrq0bph/5MZAFwFo7iYBbhmMiMwvNtkuGMl4
         7DvyGVgJnLhY/Sa81cghniXPKecYAlTyz+qq5F1SQ/8v7VUcx4INZDSNZUN8/qZrzYQQ
         ItqpL6TI4mxcgvyr7qQHM/UehmHr5G7pzOhPcNZfeLMckSlmiUPUTD6ZYs+wEzc/hHr/
         6sTpO9r0Zn3rO+mLmueRItzCAKmKPWpmsGdP36Xhz1a8jeY3v5oBKgaz6219XZg8v4Jk
         TS6Hnt4EZMA1RhKqnjem1pTD+bRJPh+3zjXflDxvnmNnBmSXLi3WKAyy4fglyV0JNXyL
         pSSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248182; x=1713852982;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yAZaI9XNl5kKuFXYgLfdboqZLBXY1vO78aqvi2rTEGA=;
        b=weJpXlDxWrk3fC03i2b0YNUQssBQh+jsMYq9qnGNlMLWdE3CPioHOezo4THiYvJfpr
         cb8PUm7ffTV0PoPyYGc6ES3BTWupTsNxu4/04gz1XRtt/ZKGozmsj1bhAX6bh3jHLsG/
         WGf2csbV30yg+MeokzUC0f1NKtC73L4xGmBLg7bqZhHVKnfmldR4+JKYIBzwg8VRqBwu
         lTT1zyJIIyxeDOamA7rss8khXAuLZ/mLaS13QajMUgt748yrg9GVVtqmqIH72oWHMaUj
         mrXbMGM3R5D06bmZ2l2yb7vBbd1oRv8m5Z3rW6CABxTaQCfcjvrO/seO3TFrby5+Q3nS
         O/kA==
X-Forwarded-Encrypted: i=1; AJvYcCX6a40pVP0uwfkwuC+4ZPDsKe92ji2u8Ovj/rDIRtjg9gDc2hsJPMW6naHAq7bQDvL3ejDYKEn02n4p+Qgv8e6MT03oKZYvkXBJMAifWa70
X-Gm-Message-State: AOJu0Yw+f6bf7YAnwrgEOFFBEPahjCD1nSVTSLLO/lUbm3O8YjkUQZ+s
	MPRLaqxb3jqM9mMOKkaOqTw7U8g3Kybyja9YK0d8PxMlN2sV8fQ7LE4yxQL8/09pmwb3EvQg4VT
	WCTj2nw==
X-Google-Smtp-Source: AGHT+IHU62mxVZT/57o8lZIqos+5GU3yfPQj1+CocC7s8g9X2ZXqugU/fUPUNRs0dJBS3aK51ZiyqFZ/eNM7
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:154f:b0:dbe:d0a9:2be3 with SMTP
 id r15-20020a056902154f00b00dbed0a92be3mr573082ybu.3.1713248181960; Mon, 15
 Apr 2024 23:16:21 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:32 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-17-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 16/16] perf parse-events: Tidy the setting of the default
 event name
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
X-CRM114-CacheID: sfid-20240415_231624_472702_F4BE81AE 
X-CRM114-Status: GOOD (  17.91  )
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

Add comments. Pass ownership of the event name to save on a strdup.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c |  9 ++++++---
 tools/perf/util/parse-events.h |  2 +-
 tools/perf/util/parse-events.l |  5 +++++
 tools/perf/util/parse-events.y | 10 +++++++---
 4 files changed, 19 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 1c1b1bcb78e8..0f308b4db2b9 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1836,18 +1836,21 @@ int parse_events__modifier_event(struct parse_events_state *parse_state, void *l
 	return parse_events__modifier_list(parse_state, loc, list, mod, /*group=*/false);
 }
 
-int parse_events_name(struct list_head *list, const char *name)
+int parse_events__set_default_name(struct list_head *list, char *name)
 {
 	struct evsel *evsel;
+	bool used_name = false;
 
 	__evlist__for_each_entry(list, evsel) {
 		if (!evsel->name) {
-			evsel->name = strdup(name);
+			evsel->name = used_name ? strdup(name) : name;
+			used_name = true;
 			if (!evsel->name)
 				return -ENOMEM;
 		}
 	}
-
+	if (!used_name)
+		free(name);
 	return 0;
 }
 
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index 0bb5f0c80a5e..5695308efab9 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -207,7 +207,7 @@ int parse_events__modifier_event(struct parse_events_state *parse_state, void *l
 				 struct list_head *list, struct parse_events_modifier mod);
 int parse_events__modifier_group(struct parse_events_state *parse_state, void *loc,
 				 struct list_head *list, struct parse_events_modifier mod);
-int parse_events_name(struct list_head *list, const char *name);
+int parse_events__set_default_name(struct list_head *list, char *name);
 int parse_events_add_tracepoint(struct list_head *list, int *idx,
 				const char *sys, const char *event,
 				struct parse_events_error *error,
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 4aaf0c53d9b6..08ea2d845dc3 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -96,6 +96,11 @@ static int drv_str(yyscan_t scanner, int token)
 	return token;
 }
 
+/*
+ * Use yyless to return all the characaters to the input. Update the column for
+ * location debugging. If __alloc is non-zero set yylval to the text for the
+ * returned token's value.
+ */
 #define REWIND(__alloc)				\
 do {								\
 	YYSTYPE *__yylval = parse_events_get_lval(yyscanner);	\
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 6f1042272dda..68b3b06c7ff0 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -247,10 +247,14 @@ event_name
 event_name:
 PE_EVENT_NAME event_def
 {
-	int err;
+	/*
+	 * When an event is parsed the text is rewound and the entire text of
+	 * the event is set to the str of PE_EVENT_NAME token matched here. If
+	 * no name was on an event via a term, set the name to the entire text
+	 * taking ownership of the allocation.
+	 */
+	int err = parse_events__set_default_name($2, $1);
 
-	err = parse_events_name($2, $1);
-	free($1);
 	if (err) {
 		free_list_evsel($2);
 		YYNOMEM;
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
