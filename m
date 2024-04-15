Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5203CC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6IxuwOJ0BtfMSvmyRcJhZxv2c1zWVWom9waZmIFHibg=; b=MACncIr14+7IL0
	GtL6WobXqWLda7JkrH4ukhyr6xD7xNTPEXI51mnL50K7fxRJmpyTHXvupbOPHIbeo6MGPTp5g+8Fn
	+h9fqhR5g2/98dOSkRRfXnnvhw5yROBAWejLYoyLO7AELdfThA+RTWEbuw08bmdatOECelWM+5j8B
	eQyI59FoOTCXXG13rLs/Or/axTBQuVO71q4pvK2D08lZlW0HpbVCZDoKQyAtxRYoOb98a9Boadd1w
	mUUPcITuu1Gill7cXUyeCOnIHYbyiyyxUdn//bpqO/ajfzthMZaW65lRW+7dq3bjrO/qA/wkEL2GX
	6ZMp+YCv1l0HH8+wsHPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxb-00000007BAw-06IE;
	Mon, 15 Apr 2024 06:36:59 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxR-00000007B1j-1iMo
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:52 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6150e36ca0dso42463777b3.1
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713163007; x=1713767807; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t6u9K3gcjLrMHLCFAhYLG4bnVQmGcLUFFxbpFKDU6RA=;
        b=DsRTP3OX3kH3LoSMK2VkA52/jvVgTgPqqcfX+uGo7ATFjtoj60itQUXW6ijRz5f5LR
         V5939r8rVNV7NhGY4o14RxevR2PgfWqncQ3qk6/PxODx6Q3XbaHdRXmFyC3SFwHues6A
         6etH5CuvbeMpMqSCy7DQwHDwd8OmHclJ1OBEwAtWHTVqFfxhuybOugRtPyQqlvSXBop1
         Uc59U8lc2eOorrMSOvHXPD95XxPa9COyLrtIgJu/gp2pfBMT0fnS1ijbaoRokShI+W0V
         2kiMdk3R1De7U6Msk71/RKXMcvVy8kvtRb0nfUJ5xnOuJWkU3pQ87oCGKLTcTZfjcTCQ
         VO2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163007; x=1713767807;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t6u9K3gcjLrMHLCFAhYLG4bnVQmGcLUFFxbpFKDU6RA=;
        b=cn373DbOTpvROatvCFQZDwFlBzgzPmE+c7Fyp79GMWDwk4U+graSjgVVlazvY2xdTz
         +g2gFN43F0AOVxQxUOgucG4DRrW/4YTcxeBDr7TCmJdenaUYmwCuS3f7Ko+GjnradMT8
         5D8Mz0aumgiK5/pmfzHhS1ir9D1j3gm2zUyO71yIvgK4NDatRyI38pD3+L3HlI5iMZQW
         wBSexfo17nLD1gn5hXJVW3mGagfOtD5934Vk+qRTABKknwRW2JGfQW6hYIf9xR6lPiiq
         k1gF7/dBqVQ2NHNZTwYQEgh5C0UKf/83EvFNdRHdD9ibLSxM8M/p/iF+4V0OB0oi0B+W
         inPA==
X-Forwarded-Encrypted: i=1; AJvYcCXXJoZv1FbFA0EohgwWNHemcxtMjBrD8rat+OoXbJLF4eoN55B8YajLZH8/sQUPTd8F7Xm7e6aMj065s+i73/M+xY9xDqS1Eu+0q6EMmJ7G
X-Gm-Message-State: AOJu0YxpdTWP9fyOnssx2QYXqQLlfEyxLG7vSvjLqqXWQFy37b7+h2pK
	PzdJqQmomTu1AQHu9cY2+lpkyulcMXtLdFD5TOnmH/6VnxwPMapSAGyA2VG3h79TUeIeIAbt9LX
	g6DHLlw==
X-Google-Smtp-Source: AGHT+IG8RJ4TxbVqnYh/ZFFdHmJfxbpZPCmfmXJfgiLHBndDiPsUAFRcqUnZUMNnHTZLEpylkDO/67CKESCA
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a05:690c:64c7:b0:61a:c98c:c2a3 with SMTP
 id ht7-20020a05690c64c700b0061ac98cc2a3mr623165ywb.10.1713163007703; Sun, 14
 Apr 2024 23:36:47 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:24 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-8-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 7/9] perf parse-events: Handle PE_TERM_HW in name_or_raw
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
X-CRM114-CacheID: sfid-20240414_233649_689166_B7C75B74 
X-CRM114-Status: UNSURE (   9.49  )
X-CRM114-Notice: Please train this message.
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

Avoid duplicate logic for name_or_raw and PE_TERM_HW by having a rule
to turn PE_TERM_HW into a name_or_raw.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.y | 31 +++++--------------------------
 1 file changed, 5 insertions(+), 26 deletions(-)

diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 14175eee9489..bb9bee5c8a2b 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -605,6 +605,11 @@ event_term
 }
 
 name_or_raw: PE_RAW | PE_NAME | PE_LEGACY_CACHE
+|
+PE_TERM_HW
+{
+	$$ = $1.str;
+}
 
 event_term:
 PE_RAW
@@ -646,20 +651,6 @@ name_or_raw '=' PE_VALUE
 	$$ = term;
 }
 |
-name_or_raw '=' PE_TERM_HW
-{
-	struct parse_events_term *term;
-	int err = parse_events_term__str(&term, PARSE_EVENTS__TERM_TYPE_USER,
-					 $1, $3.str, &@1, &@3);
-
-	if (err) {
-		free($1);
-		free($3.str);
-		PE_ABORT(err);
-	}
-	$$ = term;
-}
-|
 PE_LEGACY_CACHE
 {
 	struct parse_events_term *term;
@@ -712,18 +703,6 @@ PE_TERM '=' name_or_raw
 	$$ = term;
 }
 |
-PE_TERM '=' PE_TERM_HW
-{
-	struct parse_events_term *term;
-	int err = parse_events_term__str(&term, $1, /*config=*/NULL, $3.str, &@1, &@3);
-
-	if (err) {
-		free($3.str);
-		PE_ABORT(err);
-	}
-	$$ = term;
-}
-|
 PE_TERM '=' PE_TERM
 {
 	struct parse_events_term *term;
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
