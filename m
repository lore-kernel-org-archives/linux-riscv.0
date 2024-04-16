Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5158FC10F19
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jftd+5WuxA/tiMPJcPZsXYaMAz6G4fc6/cV6HoUP1xA=; b=ZP7b1j1SgMpeiE
	IbfRObDCUAkodKGGKUSYauKuZjZh+it0XomLJal83X9oMCnd8iCF3DsmMxDfgzbe8d08V0L/aDn7x
	EHB2xiUid9SWLI4OZX2uuC3Q6jG9o4zDbmRnBBPO0lxoI9vde4XoA3WWuIwGwgKlCA2IcPaAR9Gin
	6pH+Q5T5HHElou9Ye2dqFPhRexZAIHTSsJeo9EeSZ+5T/zTPxPmu+z3MgISYoYwLqkeeFVLplufAN
	mTjoGoA8qFC/In5J6AGDU+cB0nlx1Rh2XNa5pU2oADvP62Dn6WQbrV5DJsRlrloN7OxBoz5ZlqYN9
	c2tG2LH2KEuOllGWqBHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7F-0000000B2X3-2ALt;
	Tue, 16 Apr 2024 06:16:25 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc72-0000000B2JQ-0WOn
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dccc49ef73eso5959133276.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248170; x=1713852970; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=boFz9eIMJ+Fb11V/P0+sRNFH04HSu2tXThEFb/mBZSs=;
        b=ZyC+BnvhYOaXri0hi30BhlElh2L/+5PZYed9emEkaWKS+WceUYP+OzuaRIeFSEGaTr
         JwDGGnrggWabPFZnEdWQDZvttSOCPu/peiPgke1GCJ7AhJxOWtvqKRmSP/3FRAK84Qwo
         IP0gPIzBdNMHS8dnI7oG90dKIH7Ri/IgrE12Q8i8tJgsy6RybevgVBI0tw6tbsAMZ3dt
         niIQqR19GuQFvxPuxcA+e0vPWOv2XzmWrTTNs/iooxmTvPrIuJuM9lGBLhJ3+dGu7ADu
         h52R137Ssqe5OyFIx8OzPaU91JRXybiBvnPX4/tFUDaZI7aHxNy8nx8LAv5ZMV7vEueF
         VsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248170; x=1713852970;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=boFz9eIMJ+Fb11V/P0+sRNFH04HSu2tXThEFb/mBZSs=;
        b=Yjkspxj/UeQeGP3Z+WXomarb/7qhXf/zu9OF572cW7BmRhwsqGMdPQ6XM81tihVXdy
         a/k+iH6KQzJVDeQhKD5oHMwIZkC/GLzbjKDlcBD4ldBRoo/9h7zT352Noq5zhOB3an1U
         94HwkruNQKlK7WVbS1waPiVtnrc6gDKgEsEcIEHQsR26S01AePP5JqvrzGtLbYcFU64K
         FVE7mkmNfcZ41fw1KjB2UZSf9LvfM7+2/8shvgvrZQSQcceTg355aKKIMuVSu5UeHowL
         s89rRUeij7wzK/bY823qyZcHubSDDtb1kmuWe0kGAAch7dIfdkzZXXBG49pPGgWn+wZJ
         NG4w==
X-Forwarded-Encrypted: i=1; AJvYcCW5Xr/t/TxcBQc0rguTaDxooqwMO8+xkcVFWR0nMoBiI1FfxOb6//n1YJ9u8sqEJtuvsDkOJuq785P38e0g9SM/c5ChZiEcW/SPFuhdcEY7
X-Gm-Message-State: AOJu0YwYKZ4pnxnL4S4yTDIOx56shTT7Tv2U/EKjXMXuGtgZ6r/dKbNU
	ICYnHFL9uLYxdUqlqnlVDqi4GJcxYlVtmkNW7utv8KHBLF8vP/yo/eamkm5STthUHry08CXsGsi
	1PFHBzQ==
X-Google-Smtp-Source: AGHT+IHd9B6qnuS0vDMu71FLmzqF2ZG7fcWnX6FbkHfRo5r1HZC5wXOQPvp4ubEYNvo/IQi3a4rVn7px521z
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:c07:b0:dbe:a0c2:df25 with SMTP id
 fs7-20020a0569020c0700b00dbea0c2df25mr1501367ybb.8.1713248170374; Mon, 15 Apr
 2024 23:16:10 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:27 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-12-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 11/16] perf parse-events: Improve error message for bad numbers
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
X-CRM114-CacheID: sfid-20240415_231612_698869_10324FB1 
X-CRM114-Status: GOOD (  13.32  )
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

Use the error handler from the parse_state to give a more informative
error message.

Before:
```
$ perf stat -e 'cycles/period=99999999999999999999/' true
event syntax error: 'cycles/period=99999999999999999999/'
                                  \___ parser error
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
```

After:
```
$ perf stat -e 'cycles/period=99999999999999999999/' true
event syntax error: 'cycles/period=99999999999999999999/'
                                  \___ parser error

event syntax error: '..les/period=99999999999999999999/'
                                  \___ Bad base 10 number "99999999999999999999"
Run 'perf list' for a list of valid events

 Usage: perf stat [<options>] [<command>]

    -e, --event <event>   event selector. use 'perf list' to list available events
```

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.l | 40 ++++++++++++++++++++--------------
 1 file changed, 24 insertions(+), 16 deletions(-)

diff --git a/tools/perf/util/parse-events.l b/tools/perf/util/parse-events.l
index 6fe37003ab7b..0cd68c9f0d4f 100644
--- a/tools/perf/util/parse-events.l
+++ b/tools/perf/util/parse-events.l
@@ -18,26 +18,34 @@
 
 char *parse_events_get_text(yyscan_t yyscanner);
 YYSTYPE *parse_events_get_lval(yyscan_t yyscanner);
+int parse_events_get_column(yyscan_t yyscanner);
+int parse_events_get_leng(yyscan_t yyscanner);
 
-static int __value(YYSTYPE *yylval, char *str, int base, int token)
+static int get_column(yyscan_t scanner)
 {
-	u64 num;
-
-	errno = 0;
-	num = strtoull(str, NULL, base);
-	if (errno)
-		return PE_ERROR;
-
-	yylval->num = num;
-	return token;
+	return parse_events_get_column(scanner) - parse_events_get_leng(scanner);
 }
 
-static int value(yyscan_t scanner, int base)
+static int value(struct parse_events_state *parse_state, yyscan_t scanner, int base)
 {
 	YYSTYPE *yylval = parse_events_get_lval(scanner);
 	char *text = parse_events_get_text(scanner);
+	u64 num;
 
-	return __value(yylval, text, base, PE_VALUE);
+	errno = 0;
+	num = strtoull(text, NULL, base);
+	if (errno) {
+		struct parse_events_error *error = parse_state->error;
+		char *help = NULL;
+
+		if (asprintf(&help, "Bad base %d number \"%s\"", base, text) > 0)
+			parse_events_error__handle(error, get_column(scanner), help , NULL);
+
+		return PE_ERROR;
+	}
+
+	yylval->num = num;
+	return PE_VALUE;
 }
 
 static int str(yyscan_t scanner, int token)
@@ -283,8 +291,8 @@ r0x{num_raw_hex}	{ return str(yyscanner, PE_RAW); }
 	 */
 "/"/{digit}		{ return PE_BP_SLASH; }
 "/"/{non_digit}		{ BEGIN(config); return '/'; }
-{num_dec}		{ return value(yyscanner, 10); }
-{num_hex}		{ return value(yyscanner, 16); }
+{num_dec}		{ return value(_parse_state, yyscanner, 10); }
+{num_hex}		{ return value(_parse_state, yyscanner, 16); }
 	/*
 	 * We need to separate 'mem:' scanner part, in order to get specific
 	 * modifier bits parsed out. Otherwise we would need to handle PE_NAME
@@ -330,8 +338,8 @@ cgroup-switches					{ return sym(yyscanner, PERF_COUNT_SW_CGROUP_SWITCHES); }
 {lc_type}-{lc_op_result}-{lc_op_result}	{ return str(yyscanner, PE_LEGACY_CACHE); }
 mem:			{ BEGIN(mem); return PE_PREFIX_MEM; }
 r{num_raw_hex}		{ return str(yyscanner, PE_RAW); }
-{num_dec}		{ return value(yyscanner, 10); }
-{num_hex}		{ return value(yyscanner, 16); }
+{num_dec}		{ return value(_parse_state, yyscanner, 10); }
+{num_hex}		{ return value(_parse_state, yyscanner, 16); }
 
 {modifier_event}	{ return str(yyscanner, PE_MODIFIER_EVENT); }
 {name}			{ return str(yyscanner, PE_NAME); }
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
