Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E3ACC071DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=90MsWhqdZLEx7PrkYSY/vLVyC4xlCIqdpE9Plxj3s0g=; b=Ig6Jg+Wg873dkX
	eT8dLbCUQSjDclC0BOMx2BD6uT3o2QtbuhqiXP3bJS1yNAC38P3grqaerTYednwEWnKzbv/ALYx0M
	C4US60NiTSjMPfPaHe1IiAD+4CnqykVxSHRFe5KDzsIeooTxvd4Lf2h67ECrFvhXv0cTlWbktHnZk
	yS5qOhCG7694dVn9Bqy5ptHZAVgCkWeIIZQP077i7PKTR7ddIVk6uSKBREqCnHbaEBr9eo3FyzPTG
	gumPf9uOK7bIg5Gawet6tHhsGfQBeva4xOx1zL/Be+HMc5YUdwoPutHVsdhMF8rQWF6qk/iXN/OqW
	qc7gP4gNcCGaPeMpi3zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6j-0000000B25v-1cpY;
	Tue, 16 Apr 2024 06:15:53 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6g-0000000B24p-0YRj
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:15:51 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-615073c8dfbso84496197b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248149; x=1713852949; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ISxoCTVYs/kboJSJHGYt4b3mBkGEF06zZpMTEp5MU3o=;
        b=FaNQ48UKpkTS2R1dSU07LUlceNKhWlhtwoTDxoQR8+jyMlC8BkJZlHkEIb94FJwVmP
         xGnozab9Zq6lH2shDvXLBx0s4Effjer7+7OkM0Le9o1PFl9dlxlrguKUyPUB3iYzCx2N
         j7jJyJNUsgffgdLIdyMFjJSZasO4uIQ28EQrRUoneeUc1ccywvC3WIIzu2Y1BCBGnygH
         QTYReUXhMLROoYBqgV09qy3j2XBqNR896rAEYJEmgr1Ay4054LaD/25xMyxQE2VAPQLa
         4JCJp6TKFXykrdlSy2TSwnQmhtmE0hDvPmMuoQLhDUdS0aMVSNVt4XmgRywlZDe0cOX3
         REGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248149; x=1713852949;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ISxoCTVYs/kboJSJHGYt4b3mBkGEF06zZpMTEp5MU3o=;
        b=CkzvoVDewfMWMGku3TPGloXsF8XmLZwsKWM0u2Prm0gyehuvvhYgzpEVMJcC2bE4xA
         i5b0+bo8WiQq3MB+rdtHudNzPv4SZcdQig/fBcIoTWOmHpVK59Car4lvjqSssyQZr3iw
         bOCrk5NXNC92/mx2oZNtrA/KejWNxoiATkdZZM2Ap/VbcXN0ZdwIPxOJSFOMmCR1Unz6
         bNi49gwW0Oqgq1cKLj7rCq5WmI65oGx/UzdZyI87WEd9Rvvdn5L1s9DXMmzw1/C8ExYV
         rbl8A/dVAGmjz2PGQMqUfropznHruNrx40YCRxyh3DWmFfc+WRNVUhZvEbi88yZBxYGd
         QKqw==
X-Forwarded-Encrypted: i=1; AJvYcCVlGkwRSvxg+u1K8OVzW1adkHHQnlK+RPP9yJL7p0+XoERexVhzGff/RBGW9C2j1UQg/K+F27Qc6ic0qppxnM7gGO/rgElrXzrEbV5vvOAp
X-Gm-Message-State: AOJu0YxZcSpnMIevYdqyim1EdfCgdknxSMzfwkGIc81qol0t5n3Io1Cy
	EbqVZO6O9tBTF+lPa28D5zTEy6133It9jd7aYpFISqBkyzCATLAGeOMrCVz335/wFtnR3X25Awc
	Ytnl7VA==
X-Google-Smtp-Source: AGHT+IF5Mb5jcMAhhRkK6u6Kb3obJDXY76FnyOuX7taBUES+/AUIezgqNp2zlhbtwtn4M0p3sfRXH6RFeieK
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a5b:352:0:b0:dc6:44d4:bee0 with SMTP id
 q18-20020a5b0352000000b00dc644d4bee0mr1409504ybp.7.1713248149135; Mon, 15 Apr
 2024 23:15:49 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:18 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-3-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 02/16] perf parse-events: Directly pass PMU to parse_events_add_pmu
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
X-CRM114-CacheID: sfid-20240415_231550_247574_9D632693 
X-CRM114-Status: GOOD (  16.54  )
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
index a6f71165ee1a..2d5a275dd257 100644
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
@@ -1660,9 +1648,9 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 		    !perf_pmu__match(pattern, pmu->alias_name, event_or_pmu)) {
 			bool auto_merge_stats = perf_pmu__auto_merge_stats(pmu);
 
-			if (!parse_events_add_pmu(parse_state, *listp, pmu->name,
+			if (!parse_events_add_pmu(parse_state, *listp, pmu,
 						  const_parsed_terms,
-						  auto_merge_stats, loc)) {
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
