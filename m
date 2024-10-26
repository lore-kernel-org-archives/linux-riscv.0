Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F8ECD10BF6
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Oct 2024 12:20:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:References:
	Mime-Version:Message-Id:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ZehwSG6F3ydAYg72Iq4KfH6kIE05pdefOvmUbX7XraA=; b=cjlm1KhVBmiQa4OGI38LyK5GxG
	Zb8nwffXdUYLZH0sq3+vDleh6Q1crcNdiXCpCEmrPLDQvC2K5vTxfC8PkUiwk7EzGDu+3XwVDADW6
	PcUR6C/LHj3NP9icV+cjd7OqCuYf0SWKqyWlZpXLKAAwopBUkvxBLYEIoZulzjFsAYp1HfMis5Dw6
	AsWqs7EBO+5vJvL8LlEB9BoiJCdXYahMQEWqtki+VDu8sSkHq6CU/lcOI8XlVH1ynJMDuMS+jOPlu
	GJKtSdMBAY3bPPRh1y6/qQpaJhE71yNnN4ShiFYnYMptbMMufL1kLLW8bzplSmHYledl9HtuEY4QX
	2KMhJc0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4flz-00000006bBF-390C;
	Sat, 26 Oct 2024 12:20:03 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4fkF-00000006abQ-2Jl5
	for linux-riscv@lists.infradead.org;
	Sat, 26 Oct 2024 12:18:17 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e6101877abso56313587b3.0
        for <linux-riscv@lists.infradead.org>; Sat, 26 Oct 2024 05:18:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729945094; x=1730549894; darn=lists.infradead.org;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8ftEzJasNCcJeexyNkoSNB0nrv0LAFiVNEIp4ZCHsL8=;
        b=xeR+op/RK6bqY1A5v8r/tjHnaQUpQZxAVderAK0wpa2ds/bYQlsWvFoYH1v+CgSvlJ
         5XFI3WPM2lc2JKI2xHLERVabcRkUtaGIYLLJKP/2vgG4hJHR/89Xy+nG5gTM7CXiaWmX
         IyMSXz5udChfFXoavP6HNiVTmcGvp6IJQBvzzfuc9WyhJC8J+ytb1HTy89mrESjzUrDQ
         yNIrPjehHb0SC9IhoRXcZZcmtUpF+RNZgpaEOGznqNh7mHUXZIRSWSlwOpYbyd31Uojn
         S0wd5stjxpLfhoSA1gJ/DsnhQcZfLYaVWC5ULl1xfDPMOrwQgBNZqCpHdOGg9j8bPCr3
         tSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729945094; x=1730549894;
        h=cc:to:from:subject:references:mime-version:message-id:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8ftEzJasNCcJeexyNkoSNB0nrv0LAFiVNEIp4ZCHsL8=;
        b=fbY7CGsiAEB/pc4sNQPpHtBE9sZRJI/BsBpNTsLwLclrG2/dprYD6o2l/XOiyV4AUY
         zlp/WDiQLikddyzl7JId1GeAjTCOcPhaJZ9vRf2VN+ZzLi3wMPmLO6ZV1D3c+p332Pjn
         SLjSRpKuszo5Rh4PehQY0if7X7dh4JeTKAnBsrk4xI3HJ81nB7jpGrmyD0x8GbhzRblh
         rwNoEsRD2MRTT0I/iB6Qean6ibHZPqyw7Ayv+N8vmcjY1XwSaCLC7CFR4XOy5Ca56jSh
         ljC0H1HM2fr3stUufwbe5noQm3quH4VnJDnnmiWcaWsL3JDVj4Ajz8JMRhI7p3l42+OY
         6jHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUj6z2ItKb6S+qAxtfkj2swOISusruw1TGa+1fyKB90JsH9+50SDmMrRi2QTu9iuTewUWh+y/cLLosytA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx/VvhgUuhBPhg5wmq0nNxFSGDey1PaO+hGyGEEwH3ZUChTmrqK
	7zQW04E42qhK91aFWjbRY5Wo5cXli5NCn/HjjVQEU34EtiauYmbiR7HdAtDPtyDQjIoT26SPEm+
	6xDVj+g==
X-Google-Smtp-Source: AGHT+IHmk4Q/fZtmN2eUzccfLQakc3cAXpk/ynFpwayBUM5Y5EEsq3lkcnBI6nYhMBXQ3rLpM35yhZFd6bmv
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:4bc4:f7cc:83b4:dece])
 (user=irogers job=sendgmr) by 2002:a05:6902:4ca:b0:e2e:4391:67cc with SMTP id
 3f1490d57ef6-e3087a65968mr8121276.4.1729945093900; Sat, 26 Oct 2024 05:18:13
 -0700 (PDT)
Date: Sat, 26 Oct 2024 05:17:58 -0700
In-Reply-To: <20241026121758.143259-1-irogers@google.com>
Message-Id: <20241026121758.143259-5-irogers@google.com>
Mime-Version: 1.0
References: <20241026121758.143259-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.163.g1226f6d8fa-goog
Subject: [PATCH v1 4/4] perf parse-events: Reapply "Prefer sysfs/JSON hardware
 events over legacy"
From: Ian Rogers <irogers@google.com>
To: Atish Patra <atishp@rivosinc.com>, linux-riscv@lists.infradead.org, 
	beeman@rivosinc.com, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, James Clark <james.clark@linaro.org>, 
	Ze Gao <zegao2021@gmail.com>, Weilin Wang <weilin.wang@intel.com>, 
	Ben Gainey <ben.gainey@arm.com>, Dominique Martinet <asmadeus@codewreck.org>, 
	Junhao He <hejunhao3@huawei.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Cc: James Clark <james.clark@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_051815_730456_27974B8D 
X-CRM114-Status: GOOD (  20.75  )
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

Originally posted and merged from:
https://lore.kernel.org/r/20240416061533.921723-10-irogers@google.com
This reverts commit 4f1b067359ac8364cdb7f9fda41085fa85789d0f although
the patch is now smaller due to related fixes being applied in commit
22a4db3c3603 ("perf evsel: Add alternate_hw_config and use in
evsel__match").
The original commit message was:

It was requested that RISC-V be able to add events to the perf tool so
the PMU driver didn't need to map legacy events to config encodings:
https://lore.kernel.org/lkml/20240217005738.3744121-1-atishp@rivosinc.com/

This change makes the priority of events specified without a PMU the
same as those specified with a PMU, namely sysfs and JSON events are
checked first before using the legacy encoding.

The hw_term is made more generic as a hardware_event that encodes a
pair of string and int value, allowing parse_events_multi_pmu_add to
fall back on a known encoding when the sysfs/JSON adding fails for
core events. As this covers PE_VALUE_SYM_HW, that token is removed and
related code simplified.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Kan Liang <kan.liang@linux.intel.com>
Tested-by: Atish Patra <atishp@rivosinc.com>
Cc: Adrian Hunter <adrian.hunter@intel.com>
Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: Beeman Strong <beeman@rivosinc.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Clark <james.clark@arm.com>
Cc: Jiri Olsa <jolsa@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/perf/util/parse-events.c | 26 +++++++++---
 tools/perf/util/parse-events.l | 76 +++++++++++++++++-----------------
 tools/perf/util/parse-events.y | 60 ++++++++++++++++++---------
 3 files changed, 98 insertions(+), 64 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index afeb8d815bbf..fd33e2b4860b 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1549,8 +1549,8 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 	struct list_head *list = NULL;
 	struct perf_pmu *pmu = NULL;
 	YYLTYPE *loc = loc_;
-	int ok = 0;
-	const char *config;
+	int ok = 0, core_ok = 0;
+	const char *tmp;
 	struct parse_events_terms parsed_terms;
 
 	*listp = NULL;
@@ -1563,15 +1563,15 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			return ret;
 	}
 
-	config = strdup(event_name);
-	if (!config)
+	tmp = strdup(event_name);
+	if (!tmp)
 		goto out_err;
 
 	if (parse_events_term__num(&term,
 				   PARSE_EVENTS__TERM_TYPE_USER,
-				   config, /*num=*/1, /*novalue=*/true,
+				   tmp, /*num=*/1, /*novalue=*/true,
 				   loc, /*loc_val=*/NULL) < 0) {
-		zfree(&config);
+		zfree(&tmp);
 		goto out_err;
 	}
 	list_add_tail(&term->list, &parsed_terms.terms);
@@ -1602,6 +1602,8 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 			pr_debug("%s -> %s/%s/\n", event_name, pmu->name, sb.buf);
 			strbuf_release(&sb);
 			ok++;
+			if (pmu->is_core)
+				core_ok++;
 		}
 	}
 
@@ -1618,6 +1620,18 @@ int parse_events_multi_pmu_add(struct parse_events_state *parse_state,
 		}
 	}
 
+	if (hw_config != PERF_COUNT_HW_MAX && !core_ok) {
+		/*
+		 * The event wasn't found on core PMUs but it has a hardware
+		 * config version to try.
+		 */
+		if (!parse_events_add_numeric(parse_state, list,
+						PERF_TYPE_HARDWARE, hw_config,
+						const_parsed_terms,
+						/*wildcard=*/true))
+			ok++;
+	}
+
 out_err:
 	parse_events_terms__exit(&parsed_terms);
 	if (ok)
diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 14e5bd856a18..7c2641cf9b79 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -113,12 +113,12 @@ do {								\
 	yyless(0);						\
 } while (0)
 
-static int sym(yyscan_t scanner, int type, int config)
+static int sym(yyscan_t scanner, int config)
 {
 	YYSTYPE *yylval = parse_events_get_lval(scanner);
 
-	yylval->num = (type << 16) + config;
-	return type == PERF_TYPE_HARDWARE ? PE_VALUE_SYM_HW : PE_VALUE_SYM_SW;
+	yylval->num = config;
+	return PE_VALUE_SYM_SW;
 }
 
 static int term(yyscan_t scanner, enum parse_events__term_type type)
@@ -129,13 +129,13 @@ static int term(yyscan_t scanner, enum parse_events__term_type type)
 	return PE_TERM;
 }
 
-static int hw_term(yyscan_t scanner, int config)
+static int hw(yyscan_t scanner, int config)
 {
 	YYSTYPE *yylval = parse_events_get_lval(scanner);
 	char *text = parse_events_get_text(scanner);
 
-	yylval->hardware_term.str = strdup(text);
-	yylval->hardware_term.num = PERF_TYPE_HARDWARE + config;
+	yylval->hardware_event.str = strdup(text);
+	yylval->hardware_event.num = config;
 	return PE_TERM_HW;
 }
 
@@ -323,16 +323,16 @@ percore			{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_PERCORE); }
 aux-output		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_AUX_OUTPUT); }
 aux-sample-size		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_AUX_SAMPLE_SIZE); }
 metric-id		{ return term(yyscanner, PARSE_EVENTS__TERM_TYPE_METRIC_ID); }
-cpu-cycles|cycles				{ return hw_term(yyscanner, PERF_COUNT_HW_CPU_CYCLES); }
-stalled-cycles-frontend|idle-cycles-frontend	{ return hw_term(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND); }
-stalled-cycles-backend|idle-cycles-backend	{ return hw_term(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_BACKEND); }
-instructions					{ return hw_term(yyscanner, PERF_COUNT_HW_INSTRUCTIONS); }
-cache-references				{ return hw_term(yyscanner, PERF_COUNT_HW_CACHE_REFERENCES); }
-cache-misses					{ return hw_term(yyscanner, PERF_COUNT_HW_CACHE_MISSES); }
-branch-instructions|branches			{ return hw_term(yyscanner, PERF_COUNT_HW_BRANCH_INSTRUCTIONS); }
-branch-misses					{ return hw_term(yyscanner, PERF_COUNT_HW_BRANCH_MISSES); }
-bus-cycles					{ return hw_term(yyscanner, PERF_COUNT_HW_BUS_CYCLES); }
-ref-cycles					{ return hw_term(yyscanner, PERF_COUNT_HW_REF_CPU_CYCLES); }
+cpu-cycles|cycles				{ return hw(yyscanner, PERF_COUNT_HW_CPU_CYCLES); }
+stalled-cycles-frontend|idle-cycles-frontend	{ return hw(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND); }
+stalled-cycles-backend|idle-cycles-backend	{ return hw(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_BACKEND); }
+instructions					{ return hw(yyscanner, PERF_COUNT_HW_INSTRUCTIONS); }
+cache-references				{ return hw(yyscanner, PERF_COUNT_HW_CACHE_REFERENCES); }
+cache-misses					{ return hw(yyscanner, PERF_COUNT_HW_CACHE_MISSES); }
+branch-instructions|branches			{ return hw(yyscanner, PERF_COUNT_HW_BRANCH_INSTRUCTIONS); }
+branch-misses					{ return hw(yyscanner, PERF_COUNT_HW_BRANCH_MISSES); }
+bus-cycles					{ return hw(yyscanner, PERF_COUNT_HW_BUS_CYCLES); }
+ref-cycles					{ return hw(yyscanner, PERF_COUNT_HW_REF_CPU_CYCLES); }
 r{num_raw_hex}		{ return str(yyscanner, PE_RAW); }
 r0x{num_raw_hex}	{ return str(yyscanner, PE_RAW); }
 ,			{ return ','; }
@@ -376,28 +376,28 @@ r0x{num_raw_hex}	{ return str(yyscanner, PE_RAW); }
 <<EOF>>			{ BEGIN(INITIAL); }
 }
 
-cpu-cycles|cycles				{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_CPU_CYCLES); }
-stalled-cycles-frontend|idle-cycles-frontend	{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND); }
-stalled-cycles-backend|idle-cycles-backend	{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_STALLED_CYCLES_BACKEND); }
-instructions					{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_INSTRUCTIONS); }
-cache-references				{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_CACHE_REFERENCES); }
-cache-misses					{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_CACHE_MISSES); }
-branch-instructions|branches			{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_BRANCH_INSTRUCTIONS); }
-branch-misses					{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_BRANCH_MISSES); }
-bus-cycles					{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_BUS_CYCLES); }
-ref-cycles					{ return sym(yyscanner, PERF_TYPE_HARDWARE, PERF_COUNT_HW_REF_CPU_CYCLES); }
-cpu-clock					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CPU_CLOCK); }
-task-clock					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_TASK_CLOCK); }
-page-faults|faults				{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_PAGE_FAULTS); }
-minor-faults					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_PAGE_FAULTS_MIN); }
-major-faults					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_PAGE_FAULTS_MAJ); }
-context-switches|cs				{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CONTEXT_SWITCHES); }
-cpu-migrations|migrations			{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CPU_MIGRATIONS); }
-alignment-faults				{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_ALIGNMENT_FAULTS); }
-emulation-faults				{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_EMULATION_FAULTS); }
-dummy						{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_DUMMY); }
-bpf-output					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_BPF_OUTPUT); }
-cgroup-switches					{ return sym(yyscanner, PERF_TYPE_SOFTWARE, PERF_COUNT_SW_CGROUP_SWITCHES); }
+cpu-cycles|cycles				{ return hw(yyscanner, PERF_COUNT_HW_CPU_CYCLES); }
+stalled-cycles-frontend|idle-cycles-frontend	{ return hw(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_FRONTEND); }
+stalled-cycles-backend|idle-cycles-backend	{ return hw(yyscanner, PERF_COUNT_HW_STALLED_CYCLES_BACKEND); }
+instructions					{ return hw(yyscanner, PERF_COUNT_HW_INSTRUCTIONS); }
+cache-references				{ return hw(yyscanner, PERF_COUNT_HW_CACHE_REFERENCES); }
+cache-misses					{ return hw(yyscanner, PERF_COUNT_HW_CACHE_MISSES); }
+branch-instructions|branches			{ return hw(yyscanner, PERF_COUNT_HW_BRANCH_INSTRUCTIONS); }
+branch-misses					{ return hw(yyscanner, PERF_COUNT_HW_BRANCH_MISSES); }
+bus-cycles					{ return hw(yyscanner, PERF_COUNT_HW_BUS_CYCLES); }
+ref-cycles					{ return hw(yyscanner, PERF_COUNT_HW_REF_CPU_CYCLES); }
+cpu-clock					{ return sym(yyscanner, PERF_COUNT_SW_CPU_CLOCK); }
+task-clock					{ return sym(yyscanner, PERF_COUNT_SW_TASK_CLOCK); }
+page-faults|faults				{ return sym(yyscanner, PERF_COUNT_SW_PAGE_FAULTS); }
+minor-faults					{ return sym(yyscanner, PERF_COUNT_SW_PAGE_FAULTS_MIN); }
+major-faults					{ return sym(yyscanner, PERF_COUNT_SW_PAGE_FAULTS_MAJ); }
+context-switches|cs				{ return sym(yyscanner, PERF_COUNT_SW_CONTEXT_SWITCHES); }
+cpu-migrations|migrations			{ return sym(yyscanner, PERF_COUNT_SW_CPU_MIGRATIONS); }
+alignment-faults				{ return sym(yyscanner, PERF_COUNT_SW_ALIGNMENT_FAULTS); }
+emulation-faults				{ return sym(yyscanner, PERF_COUNT_SW_EMULATION_FAULTS); }
+dummy						{ return sym(yyscanner, PERF_COUNT_SW_DUMMY); }
+bpf-output					{ return sym(yyscanner, PERF_COUNT_SW_BPF_OUTPUT); }
+cgroup-switches					{ return sym(yyscanner, PERF_COUNT_SW_CGROUP_SWITCHES); }
 
 {lc_type}			{ return str(yyscanner, PE_LEGACY_CACHE); }
 {lc_type}-{lc_op_result}	{ return str(yyscanner, PE_LEGACY_CACHE); }
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index f888cbb076d6..d2ef1890007e 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -55,7 +55,7 @@ static void free_list_evsel(struct list_head* list_evsel)
 %}
 
 %token PE_START_EVENTS PE_START_TERMS
-%token PE_VALUE PE_VALUE_SYM_HW PE_VALUE_SYM_SW PE_TERM
+%token PE_VALUE PE_VALUE_SYM_SW PE_TERM
 %token PE_EVENT_NAME
 %token PE_RAW PE_NAME
 %token PE_MODIFIER_EVENT PE_MODIFIER_BP PE_BP_COLON PE_BP_SLASH
@@ -65,11 +65,9 @@ static void free_list_evsel(struct list_head* list_evsel)
 %token PE_DRV_CFG_TERM
 %token PE_TERM_HW
 %type <num> PE_VALUE
-%type <num> PE_VALUE_SYM_HW
 %type <num> PE_VALUE_SYM_SW
 %type <mod> PE_MODIFIER_EVENT
 %type <term_type> PE_TERM
-%type <num> value_sym
 %type <str> PE_RAW
 %type <str> PE_NAME
 %type <str> PE_LEGACY_CACHE
@@ -85,6 +83,7 @@ static void free_list_evsel(struct list_head* list_evsel)
 %type <list_terms> opt_pmu_config
 %destructor { parse_events_terms__delete ($$); } <list_terms>
 %type <list_evsel> event_pmu
+%type <list_evsel> event_legacy_hardware
 %type <list_evsel> event_legacy_symbol
 %type <list_evsel> event_legacy_cache
 %type <list_evsel> event_legacy_mem
@@ -102,8 +101,8 @@ static void free_list_evsel(struct list_head* list_evsel)
 %destructor { free_list_evsel ($$); } <list_evsel>
 %type <tracepoint_name> tracepoint_name
 %destructor { free ($$.sys); free ($$.event); } <tracepoint_name>
-%type <hardware_term> PE_TERM_HW
-%destructor { free ($$.str); } <hardware_term>
+%type <hardware_event> PE_TERM_HW
+%destructor { free ($$.str); } <hardware_event>
 
 %union
 {
@@ -118,10 +117,10 @@ static void free_list_evsel(struct list_head* list_evsel)
 		char *sys;
 		char *event;
 	} tracepoint_name;
-	struct hardware_term {
+	struct hardware_event {
 		char *str;
 		u64 num;
-	} hardware_term;
+	} hardware_event;
 }
 %%
 
@@ -264,6 +263,7 @@ PE_EVENT_NAME event_def
 event_def
 
 event_def: event_pmu |
+	   event_legacy_hardware |
 	   event_legacy_symbol |
 	   event_legacy_cache sep_dc |
 	   event_legacy_mem sep_dc |
@@ -306,24 +306,45 @@ PE_NAME sep_dc
 	$$ = list;
 }
 
-value_sym:
-PE_VALUE_SYM_HW
+event_legacy_hardware:
+PE_TERM_HW opt_pmu_config
+{
+	/* List of created evsels. */
+	struct list_head *list = NULL;
+	int err = parse_events_multi_pmu_add(_parse_state, $1.str, $1.num, $2, &list, &@1);
+
+	free($1.str);
+	parse_events_terms__delete($2);
+	if (err)
+		PE_ABORT(err);
+
+	$$ = list;
+}
 |
-PE_VALUE_SYM_SW
+PE_TERM_HW sep_dc
+{
+	struct list_head *list;
+	int err;
+
+	err = parse_events_multi_pmu_add(_parse_state, $1.str, $1.num, NULL, &list, &@1);
+	free($1.str);
+	if (err)
+		PE_ABORT(err);
+	$$ = list;
+}
 
 event_legacy_symbol:
-value_sym '/' event_config '/'
+PE_VALUE_SYM_SW '/' event_config '/'
 {
 	struct list_head *list;
-	int type = $1 >> 16;
-	int config = $1 & 255;
 	int err;
-	bool wildcard = (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE);
 
 	list = alloc_list();
 	if (!list)
 		YYNOMEM;
-	err = parse_events_add_numeric(_parse_state, list, type, config, $3, wildcard);
+	err = parse_events_add_numeric(_parse_state, list,
+				/*type=*/PERF_TYPE_SOFTWARE, /*config=*/$1,
+				$3, /*wildcard=*/false);
 	parse_events_terms__delete($3);
 	if (err) {
 		free_list_evsel(list);
@@ -332,18 +353,17 @@ value_sym '/' event_config '/'
 	$$ = list;
 }
 |
-value_sym sep_slash_slash_dc
+PE_VALUE_SYM_SW sep_slash_slash_dc
 {
 	struct list_head *list;
-	int type = $1 >> 16;
-	int config = $1 & 255;
-	bool wildcard = (type == PERF_TYPE_HARDWARE || type == PERF_TYPE_HW_CACHE);
 	int err;
 
 	list = alloc_list();
 	if (!list)
 		YYNOMEM;
-	err = parse_events_add_numeric(_parse_state, list, type, config, /*head_config=*/NULL, wildcard);
+	err = parse_events_add_numeric(_parse_state, list,
+				/*type=*/PERF_TYPE_SOFTWARE, /*config=*/$1,
+				/*head_config=*/NULL, /*wildcard=*/false);
 	if (err)
 		PE_ABORT(err);
 	$$ = list;
-- 
2.47.0.163.g1226f6d8fa-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
