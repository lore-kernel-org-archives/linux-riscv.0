Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5317BC04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:36:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9/Xp/nEPtB6KQG2asW6J+tGpEjfRxApEyATNrELhqk=; b=m2rpAt1h0HW4SU
	jAXM4y0i1smsVa9vOtdlwAWdU7XMYrxdpPhhOkTcqpLyCCFN6N7aipDtF7GlKvG9Mto9h8Dg5CFem
	S02PhkCHeEbHf5rmWfqkWLKGVkiC7MqZP3bS+uE9g/GlauWqfX/YvTpwtyyr+9dz1Vkim0lUszsy2
	2uySjGKhXeHPLSmhdLidXXgwqwTIzRXVvXLjQ27kz2yo5vNFC8rACpL1eV0KjN63heMm1UJUt9/4o
	8lOmA6M1P1KenZ1+DIjPdVXgCnyyCC7GzVm0y6WH9SOBKXqHadark9eMeUpqPV4JN5Q0W58TdvKEn
	/O4fBxkYzL9oVJ2UQi7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxJ-00000007AzM-3yaU;
	Mon, 15 Apr 2024 06:36:45 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxH-00000007Axk-13Cj
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:40 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dcc05887ee9so3511758276.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713162997; x=1713767797; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+gciuZSLFdHIk1i0SV08AyznRpAEm+5KjCzM2jFJbc=;
        b=o2JHHHgup4hS74w9wUKF0OtCsbxhbQJ5pocFjD2/1JS2j4EJsUHR0cooVj/PIKIEWS
         UZn0BNx8mCNi/cqYKG+V29f/AsnMdrLEw08FIbClgnQmAG0rvaktCtpS0KFGqUoM5hAT
         6X6tVPbPjx3VJsip6VASpi4apfifw8ZEmwQ8kQLCJiVN9CO/CFQXDVoHjxfl4dQZW51o
         PlLnDyd28Zb8RptNO8E1fPTodpcfMi3XxQ2QUrtcrtAzIG7hjUZ3r68yMCmySYOnOouH
         F7L6mvxHkbsZcnI5TtFL+pnftri4QmDEojbW2dV7P3lNHoRc+3rOloDB4IZ06KwwzExi
         uYtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713162997; x=1713767797;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=p+gciuZSLFdHIk1i0SV08AyznRpAEm+5KjCzM2jFJbc=;
        b=p3CLZ+gF/maEoqLLM76cGLVE2LaPwq/8ceHqVrcVQ75zR1yvEiHDRH3H/a5vKICAnr
         zSKdKJWOzESp+88sN7cAmkCl8ursanK2nLUVdYw24a0Lwdtx5o5ctYhYD0TGxaTe/zCA
         rZlSBP72XS7SlcZg8f8uxya02hBXp5r1hS2i6y99A94+FoMj0DGYsyJSxME3qj4yM5gs
         rO2GnWyE4skO1yTiujT3bVzL+Q9CV8hOhOS1HjbS/2CyeslE+yvIZF3M2Hm3OX1J80AV
         7iFmLfWR/yb3mZhL87jMa9loDbEb8xLuQJFQhh0kaJHw5LKhNROzM1NCJCnK+Gdbjan7
         dAgw==
X-Forwarded-Encrypted: i=1; AJvYcCUv4bG4YP8l4Q5z1nEsJLUg0Yt2vCewMMsSp5lPLkgWyUBjBdAxKvUHBs/BHTpvCv2ewvU0AGNIbrg7mo3Ld28B3oqCJrhDWDtogpxSeKp/
X-Gm-Message-State: AOJu0Yw6BN4g3QB9dSMZmp5Dhh+I97s0g6cgqGHDVMboytqcdGiRgg/v
	iifQ/rt8ojRdOjpfX2Xe5NXgzIxMKsJwUxnOeodNcYRnUZJedyV4pRpro5S0ht6bPwiTK7DPgSx
	ySzEnvA==
X-Google-Smtp-Source: AGHT+IFL+Tvkj6R3nO3XnJ0ewuekhH4PPx8UF3ahuI3cz/n03WZ3OYIbXOAvlx9w1Oc053fj9XHZnbkS+UNY
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a25:b21b:0:b0:dda:c566:dadd with SMTP id
 i27-20020a25b21b000000b00ddac566daddmr529521ybj.4.1713162997423; Sun, 14 Apr
 2024 23:36:37 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:20 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-4-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 3/9] perf parse-events: Avoid copying an empty list
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
X-CRM114-CacheID: sfid-20240414_233639_314489_2FF303A3 
X-CRM114-Status: GOOD (  12.56  )
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

In parse_events_add_pmu, delay copying the list of terms until it is
known the list contains terms.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index bc4a5e3c6c21..7e23168deeb9 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1398,29 +1398,20 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 	struct parse_events_terms parsed_terms;
 	bool alias_rewrote_terms = false;
 
-	parse_events_terms__init(&parsed_terms);
-	if (const_parsed_terms) {
-		int ret = parse_events_terms__copy(const_parsed_terms, &parsed_terms);
-
-		if (ret)
-			return ret;
-	}
-
 	if (verbose > 1) {
 		struct strbuf sb;
 
 		strbuf_init(&sb, /*hint=*/ 0);
-		if (pmu->selectable && list_empty(&parsed_terms.terms)) {
+		if (pmu->selectable && const_parsed_terms && list_empty(&const_parsed_terms->terms)) {
 			strbuf_addf(&sb, "%s//", pmu->name);
 		} else {
 			strbuf_addf(&sb, "%s/", pmu->name);
-			parse_events_terms__to_strbuf(&parsed_terms, &sb);
+			parse_events_terms__to_strbuf(const_parsed_terms, &sb);
 			strbuf_addch(&sb, '/');
 		}
 		fprintf(stderr, "Attempt to add: %s\n", sb.buf);
 		strbuf_release(&sb);
 	}
-	fix_raw(&parsed_terms, pmu);
 
 	memset(&attr, 0, sizeof(attr));
 	if (pmu->perf_event_attr_init_default)
@@ -1428,7 +1419,7 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 
 	attr.type = pmu->type;
 
-	if (list_empty(&parsed_terms.terms)) {
+	if (!const_parsed_terms || list_empty(&const_parsed_terms->terms)) {
 		evsel = __add_event(list, &parse_state->idx, &attr,
 				    /*init_attr=*/true, /*name=*/NULL,
 				    /*metric_id=*/NULL, pmu,
@@ -1437,6 +1428,15 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 		return evsel ? 0 : -ENOMEM;
 	}
 
+	parse_events_terms__init(&parsed_terms);
+	if (const_parsed_terms) {
+		int ret = parse_events_terms__copy(const_parsed_terms, &parsed_terms);
+
+		if (ret)
+			return ret;
+	}
+	fix_raw(&parsed_terms, pmu);
+
 	/* Configure attr/terms with a known PMU, this will set hardcoded terms. */
 	if (config_attr(&attr, &parsed_terms, parse_state->error, config_term_pmu)) {
 		parse_events_terms__exit(&parsed_terms);
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
