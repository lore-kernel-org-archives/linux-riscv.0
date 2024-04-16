Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC11C04FF6
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 07:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wCd6acGlK6ealGwKLG+pecN+wHS5kPXT9pbjCqXjxtM=; b=VMEtmX5TJBO924
	W3eH1wzPDIdwzjqXpVYWeeVb3nBcuLfsIN6SkvbioOsLSzdvJTOdFg8i7N1aEQaIIpYt+dmn1hlia
	PeQ/TXw1kOLunGG9s4hvDxVBLBu4dJMe5kBbb/51FrxKXSd8vrB8vqWhkgB8TmR2pm/UEolKuJuOP
	U4Crek83flSMHJ/RbuaXGZmFKb220cJC/A3PYIq3TKZvZ5EGPCgCm8GBy20qfm3y1IBgyrSjyv1q2
	rOkQROo0n/nwt8o6rKPYwmFZQ4NC7mJdlKoSb0ntiosvKRRYibUOBYsekA6O9D6uyjyz/YCoF/jDP
	DUgKvyiLjeWZ3lezjEDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwdH9-0000000BHHq-09wE;
	Tue, 16 Apr 2024 07:30:43 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc73-0000000B2LK-2oAv
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:16 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6167463c60cso48407627b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248172; x=1713852972; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+hPbZ7lnhh9QoC+3t1lsGMaRdpOWz8T0ZMfEFKF068g=;
        b=qHd5QIDBRKc1PiWpBZlNX32VdVHO0nepPyGuRT2UwKdVXO9B0LJBe5gp5FvP/vsD8N
         /nTBI6QQNXdN3lacQupbEJxcMyA5qoQrKgAnYxWo6/Ar5Z9zafhyEQ+gV4naamm7bTYz
         H8u6QSaE4tOUGC6KqyIopAWFcuk8sLVmQI0C7Wh4WXtTGGj/aV11NSzqNu/2yfbocdvb
         41ESxXclzzEV7evlxydHUweBciMFqVPiKFoM/1JznpREpfXtuSC5U5yWEUtcIIHs3RzM
         mOR0q9yuSRQwbp/Xf1cW4IMPeDTvMvBo0z4wE9/y1aPuJwcegzynTfDR8hv1SOerHApw
         jGaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248172; x=1713852972;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+hPbZ7lnhh9QoC+3t1lsGMaRdpOWz8T0ZMfEFKF068g=;
        b=mpGp2aNGx4DqgzV2X2F7mr7UEqK/xl3dKDCBKryar5QL8ZVWtNr8iQwnxriahACEkk
         khEDpgZh3JIz/0zn46g94bFwVeGwSsgEzT7fjz67cDN+vi0c6EpUk8pKi34xhLxjtRtW
         qhxuUEeHX9ikbgB1cLpNqGR3+W1vAkZfAw3OAN/+lPVTAfp7Q5v4hw38+UeYK1T+G23b
         pPsjI7i4SXpw87D/zBQmnL7ZNKxKRzy6MLO88ye48Om/3uXxi8DubNRGv4mzL3dScMRu
         oXQ2mrHp6GpXwhif5f7lbL+VCJ3BNmOt27E0d9B4HUaO8S/6KjsABV5XE4vOp08B2gN0
         D19w==
X-Forwarded-Encrypted: i=1; AJvYcCUGuVj8TUFBg2Fd6WEj61CRjaPCM5ldUmpWQZ0m+H7T1BM0d0uRcWby2PctXV9Ldh9PyjpR2thGC6L7whIGRiDUugQSO4AWbhEdV/rv09B6
X-Gm-Message-State: AOJu0YyZl4/iw7FM1UMeRcJZl4m+ZANXO14bnml46M5bVuuesAwc2KY4
	6peeH2FPPO+y64AEher2Hink+1PcCms8Ljojci9zGExEGRoXW7scK5sa6zfNnQ3nV8eo7nxq0q6
	CDkfGZA==
X-Google-Smtp-Source: AGHT+IH09dNa2Ep6hGWotz5Z/1B2yBTk2hy320YLi4pZ6NH6aEgIxJHZyqUteQDBUak/iqd6skeTLPOdRDRw
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a81:8309:0:b0:618:308f:e418 with SMTP id
 t9-20020a818309000000b00618308fe418mr489314ywf.4.1713248172501; Mon, 15 Apr
 2024 23:16:12 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:28 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-13-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 12/16] perf parse-events: Inline parse_events_evlist_error
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
X-CRM114-CacheID: sfid-20240415_231613_961769_3C607E99 
X-CRM114-Status: GOOD (  12.09  )
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

Inline parse_events_evlist_error that is only used in
parse_events_error. Modify parse_events_error to not report a parser
error unless errors haven't already been reported. Make it clearer
that the latter case only happens for unrecognized input.

Before:
```
$ perf stat -e 'cycles/period=99999999999999999999/' true
event syntax error: 'cycles/period=99999999999999999999/'
                                  \___ parser error

event syntax error: '..les/period=99999999999999999999/'
                                  \___ Bad base 10 number "99999999999999999999"
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
$ perf stat -e 'cycles:xyz' true
event syntax error: 'cycles:xyz'
                           \___ parser error
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
```

After:
```
$ perf stat -e 'cycles/period=99999999999999999999/xyz' true
event syntax error: '..les/period=99999999999999999999/xyz'
                                  \___ Bad base 10 number "99999999999999999999"
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
$ perf stat -e 'cycles:xyz' true
event syntax error: 'cycles:xyz'
                           \___ Unrecognized input
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c |  9 ---------
 tools/perf/util/parse-events.h |  2 --
 tools/perf/util/parse-events.y | 10 ++++++++--
 3 files changed, 8 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 7eba714f0d73..ebada37ef98a 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -2760,15 +2760,6 @@ int parse_events_terms__to_strbuf(const struct parse_events_terms *terms, struct
 	return 0;
 }
 
-void parse_events_evlist_error(struct parse_events_state *parse_state,
-			       int idx, const char *str)
-{
-	if (!parse_state->error)
-		return;
-
-	parse_events_error__handle(parse_state->error, idx, strdup(str), NULL);
-}
-
 static void config_terms_list(char *buf, size_t buf_sz)
 {
 	int i;
diff --git a/tools/perf/util/parse-events.h b/tools/perf/util/parse-events.h
index e8f2aebea10f..290ae6c72ec5 100644
--- a/tools/perf/util/parse-events.h
+++ b/tools/perf/util/parse-events.h
@@ -226,8 +226,6 @@ int parse_events_multi_pmu_add_or_add_pmu(struct parse_events_state *parse_state
 					void *loc_);
 
 void parse_events__set_leader(char *name, struct list_head *list);
-void parse_events_evlist_error(struct parse_events_state *parse_state,
-			       int idx, const char *str);
 
 struct event_symbol {
 	const char	*symbol;
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 51490f0f8c50..2c4817e126c1 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -790,9 +790,15 @@ sep_slash_slash_dc: '/' '/' | ':' |
 
 %%
 
-void parse_events_error(YYLTYPE *loc, void *parse_state,
+void parse_events_error(YYLTYPE *loc, void *_parse_state,
 			void *scanner __maybe_unused,
 			char const *msg __maybe_unused)
 {
-	parse_events_evlist_error(parse_state, loc->last_column, "parser error");
+	struct parse_events_state *parse_state = _parse_state;
+
+	if (!parse_state->error || !list_empty(&parse_state->error->list))
+		return;
+
+	parse_events_error__handle(parse_state->error, loc->last_column,
+				   strdup("Unrecognized input"), NULL);
 }
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
