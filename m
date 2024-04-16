Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D3EC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 07:30:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ekDcgzrSjOrVWH/vJKKuCct7htu8RAlmlymtQSsy4PM=; b=pvxm+rDNpdYYXX
	8hnodeuNLqDXfsXEJUMIn1FND1vdP56BcJeHUAanBRr2vkaotk8raT7DWJXP8F9tFazyaS+df87HC
	xn357QwpnS5UdqcEerf+AdD9WT8hp2hJ4TVpHtcVEPr4ugEcjleDa7FArDaf3rI8myHo/mbfe7oTr
	9iTSOz9DjtqWmnctgtA6eOvxc2X3KB/3Q0o3gMGoG2eofLVpQslAFLiCPJbpP5YdUXVaOB3eLbMym
	uxPlRIERTNA8ze3Wk5nOttaD0mWIroOCu7U7HDRmJ+e13QkvN6FPjcxeNJ/czqXdKX389h8FB226Q
	93kTvGrfW104sl3LuQYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdH9-0000000BHID-35lT;
	Tue, 16 Apr 2024 07:30:43 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc78-0000000B2PF-2Rpy
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:24 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dd933a044baso5741140276.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248177; x=1713852977; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CS464tDCakpyTmrmcLFcR8YYU9aH6y31Ipzi53/1x7k=;
        b=SbTlRHspHhNc2BUJejNL4/d8bgLl68Ki9CwbC5E97b8T4UVkUzxMjY4xINKXz1FS0l
         yJ57E7NwaRr1zOW7JXMkXH4MgxS6+XCHiSdHRHs/B8jMABZOvhmC1aMyCN26t7bYX9sA
         RBrlVUTVvg8R6NVYzPMJMDNlXxac0GDoQ9A/CTkkiYCTUGFBoaw57jsTHe47n9mtEoLZ
         KG7I2aNwkbW0gZVfm01p5Sxz6qj+nr5jS8cDEmnEFHJ/afHnVZMy+bOgSYValKapra8B
         u+X+95G3t3kb3tZW8p4BzsCP4YwrYCRw72VAbC4BGBjhHGBEgXXhdIgHW9mKVBJPhf5k
         N47A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248177; x=1713852977;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CS464tDCakpyTmrmcLFcR8YYU9aH6y31Ipzi53/1x7k=;
        b=oO8b4DvsD1rwX1VZk715OX19qS+tN1WXzh4xqotPAkHGNaamd5DMh45XqLfok4hiRU
         XiOyLGULHTVitt0H5OuMc5wESwBZqPv6yULj5wIq+FPIXyaMIKEjkIttLq/O+9Edc9XY
         M9FD4KYk4pQmGQkfP36edUIerQxqqV5+Oxe4t33MBKJL1obpuCWMz61PH+6Wgqty4bqk
         rEs+Nm9ZU7FwBnRWLdkdYNOUdq8F8m4lBIkGiBFaboYa1HMIIvl8Hk8v2ZXxtLokOCis
         1fXOocKTW1MS9CvCOp+cVzyj5KNpv08JDmoXM9pzKqzcRK3x/bTTTBfc860h3dYdKGEO
         QDjA==
X-Forwarded-Encrypted: i=1; AJvYcCUoN1a8yzypXYaETtG4UniDGfr6uYsuu6h02R3YnqdfYDbMIKCtGs6UdEBBNY6BfXALI9aZCiWVeaxOi+DiO9PWcid1JZHaMd3LondirRtm
X-Gm-Message-State: AOJu0YwYd3d4/qcXNhwHwlyNJMhh/UTRU8VPrMUJ9cS4/XpIX9M3Rdxr
	tjiknt1J3DyV8ZUbAtfG/bzBRgyv5ASyrWbi+noTgN3d8lKHtyUzbCVrt7KJF0QvZjHnw+5e8Qm
	CpQYrbg==
X-Google-Smtp-Source: AGHT+IHO0Fo9+D3NBOjv38HGGbmFqRswvl8m/oJgT2uKaZFhVmwhvI9Qz+b/36nYjScIaD300oJtaekLWfEs
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:100d:b0:dbd:ee44:8908 with SMTP
 id w13-20020a056902100d00b00dbdee448908mr615874ybt.0.1713248177044; Mon, 15
 Apr 2024 23:16:17 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:30 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-15-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 14/16] perf parse-event: Constify event_symbol arrays
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
X-CRM114-CacheID: sfid-20240415_231619_138605_4366F770 
X-CRM114-Status: GOOD (  12.33  )
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

Moves 352 bytes from .data to .data.rel.ro.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 4 ++--
 tools/perf/util/parse-events.h | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 3ab533d0e653..8d3d692d219d 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -39,7 +39,7 @@ static int get_config_terms(const struct parse_events_terms *head_config,
 static int parse_events_terms__copy(const struct parse_events_terms *src,
 				    struct parse_events_terms *dest);
 
-struct event_symbol event_symbols_hw[PERF_COUNT_HW_MAX] = {
+const struct event_symbol event_symbols_hw[PERF_COUNT_HW_MAX] = {
 	[PERF_COUNT_HW_CPU_CYCLES] = {
 		.symbol = "cpu-cycles",
 		.alias  = "cycles",
@@ -82,7 +82,7 @@ struct event_symbol event_symbols_hw[PERF_COUNT_HW_MAX] = {
 	},
 };
 
-struct event_symbol event_symbols_sw[PERF_COUNT_SW_MAX] = {
+const struct event_symbol event_symbols_sw[PERF_COUNT_SW_MAX] = {
 	[PERF_COUNT_SW_CPU_CLOCK] = {
 		.symbol = "cpu-clock",
 		.alias  = "",
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index f104faef1a78..0bb5f0c80a5e 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -250,8 +250,8 @@ struct event_symbol {
 	const char	*symbol;
 	const char	*alias;
 };
-extern struct event_symbol event_symbols_hw[];
-extern struct event_symbol event_symbols_sw[];
+extern const struct event_symbol event_symbols_hw[];
+extern const struct event_symbol event_symbols_sw[];
 
 char *parse_events_formats_error_string(char *additional_terms);
 
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
