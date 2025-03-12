Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FCBC2BA1B
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 21:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=aDerGgnOQQgK5hUSWD7DOxZd4gkPBg2n9YNWmZq6vpc=; b=bZOz00c6Y5LLfK
	IhEmkm1TooMOt2JNhRHY5ZmfxWuPd4euJxA2Tx2N14sbNK7Ifsz8XAQ1FtqFk6qco0iwAK2Q7Gnh3
	pLgEyDS8bLxExkIAMgk55TgiIOx8c8cC5hfM+JBTk94L6Xxjt+4m6r/iCS7m2CGJwRMEarSz5wodM
	BWhk6kFgDdT2EldyV7lC4sKU8ncFTHcglLn0kgsm6z84DVhlNUhdPwFRAFUiE8RWPYIFif8iTolFF
	DeV7FPh4xXTNGLG2rJfiVI+2zVTbzD43JlDHul09fS07wwvyeXs8CNSNpFVUPOTFlihdfpGXhmqfg
	L4xfvDlvOc+4FIdSpLRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTRK-00000009WQz-0zdw;
	Wed, 12 Mar 2025 21:16:34 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTRH-00000009WPG-2m5L
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 21:16:32 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-225ab4b8fe9so4114795ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Mar 2025 14:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1741814190; x=1742418990; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Mtw5A6pnErP63NBf+2oMOxljRBPUk1W+HOiO6no4Q+Y=;
        b=R1RaM0XRcHM0Sc7+OQM9PzonfSbz09H1SNAHwv4OqmUdIql3PoW6WpfHE7n+8FPu0T
         QDCBLkm8AoDeTuVOA8JnF3x2BZSP7U6Ov8igQ7kDsq03g6ArtsOaR03bpyWgmRNyyTrN
         m5Mt571Qy61JGe8krM4hrjFM9hVetGmpm5HsnOA/Ly1cgUPwdP/Zp1CnKgqZvBXezLBS
         p4V0l6MMFyNANYWhnZ3MySBoL2sc5iiYDNGk5/UHkqbBeZwokj8zOgRUdU9DdrmnQMWt
         o1qFH3dZejtIAW/Xb1SPmXR+w+BDQR46zpEUex3dqOB0SKi+1kvZRJZ8tYKYKc2F+sB4
         so/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741814190; x=1742418990;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Mtw5A6pnErP63NBf+2oMOxljRBPUk1W+HOiO6no4Q+Y=;
        b=VqJZKAksT/Qa7jg9E7shviollgC/gOuSrQN2AjNc2eoFvnlPdjxoFuSdJj5w9okG8h
         i5LkfM0StxcYECsAWvo1J9p2sbEvgCgCwsxo19tdMh7BIx+5t/Yo7XI/8cYQvXeSifwi
         oQ4+x2VlsMr/giau0Aq2nQXYCgaDpjINIhawpfpzhLdGcZw18ONY1RKssRl0nMLBM7HR
         1FA4tomtuveWOIABsbO7esOM+ScaO18IQxUozHh7vW5BAKbyaDFo/W1MPkXqSntQDvgj
         uUx0b2qS0Ht8QxlBdNlnOTMO6VwuWV0lQp0qika83stzMjaZVVx2uiC+Vf4iOXTFagWI
         7r5Q==
X-Forwarded-Encrypted: i=1; AJvYcCU3JJWwhJz7miSSI4+E/HsaoRyuUnL4ArbYmcq7L+ZlOpsUK1HihZHyXZ2l+AwMQSqh0i2lkLXrwvAwrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMTidOWswjTTjpb5UZ4mlCVCVqvJsTwr3fw+tP3YKs+i+fpRz9
	PSX1DtODEt+IEQCvEY9MVXa93VWJOV1cML6Vxh/gUo83YpD1C3qpmIxtLWBA2NwVGt8hnV3eZ0D
	uEmO/Tg==
X-Google-Smtp-Source: AGHT+IE3fBCKu7LH5dWy4Mhc2DNcNCtpsN2q683UIyw1GVM1fMDJFk9jQ0EhTpT9uiJfq/9n5G9W16mHQqdN
X-Received: from plty2.prod.google.com ([2002:a17:902:8642:b0:220:c8cf:970c])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:da90:b0:223:5ada:891e
 with SMTP id d9443c01a7336-22592e201e3mr110847595ad.7.1741814190032; Wed, 12
 Mar 2025 14:16:30 -0700 (PDT)
Date: Wed, 12 Mar 2025 14:16:22 -0700
In-Reply-To: <20250312211623.2495798-1-irogers@google.com>
Mime-Version: 1.0
References: <20250312211623.2495798-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.rc0.332.g42c0ae87b1-goog
Message-ID: <20250312211623.2495798-2-irogers@google.com>
Subject: [PATCH v2 1/2] perf parse-events: Make legacy events always have
 priority over sysfs/json
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	James Clark <james.clark@linaro.org>, Dominique Martinet <asmadeus@codewreck.org>, 
	Yang Jihong <yangjihong@bytedance.com>, Yang Li <yang.lee@linux.alibaba.com>, 
	Weilin Wang <weilin.wang@intel.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Leo Yan <leo.yan@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_141631_702193_726C4B0B 
X-CRM114-Status: GOOD (  24.57  )
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

This reverts the behavior of commit a24d9d9dc096 ("perf parse-events:
Make legacy events lower priority than sysfs/JSON"). That commit
states:

  As part of that report Mark Rutland <mark.rutland@arm.com> requested
  that legacy events not be higher in priority when a PMU is specified
  reversing what has until this change been perf's default behavior.

with an Acked-by: Mark Rutland <mark.rutland@arm.com> tag. Mark
expresses this preference here:
https://lore.kernel.org/lkml/ZVzXjz_0nYbmSGPQ@FVFF77S0Q05N.cambridge.arm.com/
On an Alderlake this commit caused `cpu_core/instructions/` to be
encoded as:

  ------------------------------------------------------------
  perf_event_attr:
    type                             4 (cpu_core)
    size                             136
    config                           0xc0 (instructions)
    sample_type                      IDENTIFIER
    read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
    disabled                         1
    inherit                          1
    enable_on_exec                   1
    exclude_guest                    1
  ------------------------------------------------------------

While `instructions` would be encoded as:

  ------------------------------------------------------------
  perf_event_attr:
    type                             0 (PERF_TYPE_HARDWARE)
    size                             136
    config                           0x400000001
    sample_type                      IDENTIFIER
    read_format                      TOTAL_TIME_ENABLED|TOTAL_TIME_RUNNING
    disabled                         1
    inherit                          1
    enable_on_exec                   1
    exclude_guest                    1
  ------------------------------------------------------------

As the event parsing for legacy events uses parse_events_add_numeric,
rather than the more generic PMU handling case, we end up with the
same event name being encoded two ways. However, as instructions is
also a cpu_atom event on Alderlake, or any hybrid system, the PMU
prefixes are added in the stat output meaning instructions is reported
as cpu_core/instructions/ and cpu_atom/instructions/ even though those
events are encoded differently and potentially have different
behaviors. We shouldn't be having the same event with two different
encodings and I followed up the commit with changing the
prioritization of legacy events also when no PMU is specified in
commit 617824a7f0f7 ("perf parse-events: Prefer sysfs/JSON hardware
events over legacy").

RISC-V have been asking that legacy events also be a lower priority
than sysfs/json to avoid driver complexity. They've since had to work
around this issue meaning it isn't a necessity:

  If the overriding legacy with JSON is available, each future vendor
  may just provide the json file instead of modifying the driver.
  However, it will be a matter of convenience and clutter free future
  rather than a necessity at this point.

https://lists.riscv.org/g/sig-perf-analysis/topic/110906276#msg458

Landing the commit making encoding consistent and having sysfs/json a
priority has been pushed back against by Namhyung Kim, Arnaldo
Carvalho de Melo and James Clark. James assert the ARM drivers are now
fixed and don't need the prioritization. RISC-V's interests have been
ignored. The fact that legacy events are antiquated, imprecise in
meaning, brittle, misleading and don't give us a way to fix kernel
issues in software, have also been ignored:
https://lore.kernel.org/lkml/Z8sMcta0zTWeOso4@x1/

Given the push back against sysfs/json being a priority, contrary to
Mark Rutland's insistence this was the sensible way to do things,
contrary to RISC-V's wishes, and contrary to my own preference that
legacy events do become legacy, this patch changes the priority back
to legacy events being the priority consistently - that is
instructions and cpu_core/instructions/ are both encoded using legacy
events. It isn't a straight revert as clean-ups/refactorings are kept
in place.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/parse-events.c | 13 +++----------
 tools/perf/util/parse-events.c  | 26 +++++++++-----------------
 2 files changed, 12 insertions(+), 27 deletions(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 5ec2e5607987..78e8ae825bf8 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -162,16 +162,9 @@ static int test__checkevent_numeric(struct evlist *evlist)
 
 static int assert_hw(struct perf_evsel *evsel, enum perf_hw_id id, const char *name)
 {
-	struct perf_pmu *pmu;
-
-	if (evsel->attr.type == PERF_TYPE_HARDWARE) {
-		TEST_ASSERT_VAL("wrong config", test_perf_config(evsel, id));
-		return 0;
-	}
-	pmu = perf_pmus__find_by_type(evsel->attr.type);
-
-	TEST_ASSERT_VAL("unexpected PMU type", pmu);
-	TEST_ASSERT_VAL("PMU missing event", perf_pmu__have_event(pmu, name));
+	TEST_ASSERT_VAL("wrong type", PERF_TYPE_HARDWARE == evsel->attr.type);
+	TEST_ASSERT_VAL("wrong config", test_perf_config(evsel, id));
+	TEST_ASSERT_VAL("wrong name", !strcmp(evsel__hw_names[id], name));
 	return 0;
 }
 
diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 35e48fe56dfa..04bb70ba4292 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1023,12 +1023,10 @@ static int config_term_pmu(struct perf_event_attr *attr,
 			return -EINVAL;
 		}
 		/*
-		 * Rewrite the PMU event to a legacy cache one unless the PMU
-		 * doesn't support legacy cache events or the event is present
-		 * within the PMU.
+		 * Rewrite the PMU event to a legacy cache one as legacy events
+		 * take priority over sysfs/json.
 		 */
-		if (perf_pmu__supports_legacy_cache(pmu) &&
-		    !perf_pmu__have_event(pmu, term->config)) {
+		if (perf_pmu__supports_legacy_cache(pmu)) {
 			attr->type = PERF_TYPE_HW_CACHE;
 			return parse_events__decode_legacy_cache(term->config, pmu->type,
 								 &attr->config);
@@ -1049,19 +1047,13 @@ static int config_term_pmu(struct perf_event_attr *attr,
 			return -EINVAL;
 		}
 		/*
-		 * If the PMU has a sysfs or json event prefer it over
-		 * legacy. ARM requires this.
+		 * Rewrite the PMU event to a legacy cache one as legacy events
+		 * take priority over sysfs/json.
 		 */
-		if (perf_pmu__have_event(pmu, term->config)) {
-			term->type_term = PARSE_EVENTS__TERM_TYPE_USER;
-			term->no_value = true;
-			term->alternate_hw_config = true;
-		} else {
-			attr->type = PERF_TYPE_HARDWARE;
-			attr->config = term->val.num;
-			if (perf_pmus__supports_extended_type())
-				attr->config |= (__u64)pmu->type << PERF_PMU_TYPE_SHIFT;
-		}
+		attr->type = PERF_TYPE_HARDWARE;
+		attr->config = term->val.num;
+		if (perf_pmus__supports_extended_type())
+			attr->config |= (__u64)pmu->type << PERF_PMU_TYPE_SHIFT;
 		return 0;
 	}
 	if (term->type_term == PARSE_EVENTS__TERM_TYPE_USER ||
-- 
2.49.0.rc0.332.g42c0ae87b1-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
