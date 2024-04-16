Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22E10C0650F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MlN8sBAqoQp/EBerIKUilhX2Or+OpbLWO9uUIzHl0dE=; b=EnvcO5aHw1h6Lp
	vNNlW5k6cAlv7lihbt+fDxjKXXcsxqWoefnvo2HYtpg2DVwPb7Mocl+DdIpE61FOr0IKyCjGsIZSW
	zFZThmTwVpDrjvO1xF222/3YXXNGqVxiLJgSp/iCHIlPFVAerXx3m/1+8aVpoW2dKobP0wzyu0V4I
	Z1LolKF8M6IRWI+Qc9bKzrPm1L8hR37okBECmyf0Hl+VOdl+fA2bG8Q5bGxgKXbPtdXLE6FCsbtZf
	4C0F6OwOI0cGekyjU/lfcO0ZepVA/c5Gtg7lSvD67pYNdrUtlZyDeUySQEdfN5a4tg1bs7m1CwTRL
	/FNvzukZjmODDhjEyd/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6p-0000000B29T-09Of;
	Tue, 16 Apr 2024 06:15:59 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6j-0000000B25S-1MPi
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:15:55 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-dd0ae66422fso7990533276.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248151; x=1713852951; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=trVc8Z3cM9HfuUa79775aNx5De/ILl71mqLeEIudwkY=;
        b=CkDHblc9/tPE4VIdExUX0DWYwmMItWVIYFguec/jQ26eEeQPtFK6K7SfW7xGxjqZx7
         W/vFvGdrqzBZfd5iM8q5XW2Y+ixgM7kw21R8NeodwMd5mi4Rdvk0gUvCnOfAOsSnpkv3
         ghW58Sxwe35vwaLC90QwXxt8YI36Y2Ae2HdS8gVshO6yiA2RIVj4UYEfop/bdwX9O8WL
         LhotEhA1oNOR2dUQq1c+vLorVgyzOLHIY8jzu2tEWKAheXUngMZdicutJcJ6Jjyn2Zmz
         f6/KGkX00+uEEOnyY2y1PtTLU33jcvYRLLmk4+8ITH/yAzYKe9sPh51fLAu6h2Yg1C8H
         FbvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248151; x=1713852951;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=trVc8Z3cM9HfuUa79775aNx5De/ILl71mqLeEIudwkY=;
        b=JSE6Zcw5rNsKc7n+8H25JY2JmG5tnogEgLPWF3zDGLSSNFXusix1ffoP7tWAZlvM/g
         rn9i+hkuW4JqQRKJfxhxXs5fSxQ8+MePOC8PLtJiXrAwZaF/HL+oKqwqxBrDcJGAEW2c
         DhcxyFmHN772rRUc+rIyqJ850SN2mABHWJZlZZwocQeekvd4J7Q8mOB6XbJ5MYNV2SU9
         0KYHobk6PbdRAuMh1y9Gl/Utw8BUgOeNo8RIySBJOFTJ8FUrdDpwccq/tM7A5AgM/Mp+
         ZPw1aHwUanSZVlHoMItncM4pd5RMWV+ykj5UfYEvcfi4mOzv6018IfYb2tnofvBSacZv
         s8IQ==
X-Forwarded-Encrypted: i=1; AJvYcCU1Kmdgjkoztp/n9I4EPDNDprPsNlXtpQ+C+66xU848vGbrmoPjkYoOJIDnUQPdt7STwgpG5aA37+kw23gYw2fJoxolThZORnAonA27ymSH
X-Gm-Message-State: AOJu0YyGvK9cB4TnCji2/32ltlosqifODH3Xx4UmYqUn+ZBbUNVYkN4a
	fFK689pBvzm3oMJZeAxwAK5ZtOmp0Luj1woNR95IBl1VKZyWE/Aw/+IMg7clDSzjM55XWYkcbqS
	F0+mtfw==
X-Google-Smtp-Source: AGHT+IHbe1DxlHRAKrzSKiVOtakxA6Q18A5QeFHX1nkM8ma5D0AnWniiwkUYIfGXxIcoemP4HQq1Zn/FTkGf
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:100d:b0:dbd:ee44:8908 with SMTP
 id w13-20020a056902100d00b00dbdee448908mr615704ybt.0.1713248151392; Mon, 15
 Apr 2024 23:15:51 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:19 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-4-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 03/16] perf parse-events: Avoid copying an empty list
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
X-CRM114-CacheID: sfid-20240415_231553_443697_D31F2916 
X-CRM114-Status: GOOD (  12.97  )
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
 tools/perf/util/parse-events.c | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 2d5a275dd257..3b1f767039fa 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1398,29 +1398,21 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
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
+		if (pmu->selectable && const_parsed_terms &&
+		    list_empty(&const_parsed_terms->terms)) {
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
@@ -1428,7 +1420,7 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
 
 	attr.type = pmu->type;
 
-	if (list_empty(&parsed_terms.terms)) {
+	if (!const_parsed_terms || list_empty(&const_parsed_terms->terms)) {
 		evsel = __add_event(list, &parse_state->idx, &attr,
 				    /*init_attr=*/true, /*name=*/NULL,
 				    /*metric_id=*/NULL, pmu,
@@ -1437,6 +1429,15 @@ static int parse_events_add_pmu(struct parse_events_state *parse_state,
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
