Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD176C07E8F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uPN2vEm5i9TBBGBm0zFQWqJ4+Leh+a9y1uZ0i+WbAQs=; b=1pD62DcKP8pFdT
	NtB0ztWrvo2dYeckFUJ9P2Po2vcGDzuL27LJ1OrkC1k3fVjvwiWyjmiQf6VqrkPkxYlS5QGx5uu1p
	7iRRxwQjCmCwfjDPeaZyTnIf6NmEZsig2bBO4ovREVDC/mBe3pSjuGf4q+pjYvlt+sCJvq9I0UOG1
	WuSkugYMHpQ1SFCx+iMcIAnE4KH9dpnf9eCghOloQKrCThyEyb7ssVpw/DrhZ0I8jDpiPexyzTE99
	WGdInwh4co2fkCm/+LTImQDr5w7ch/Eu2VCuD6kZN30Rj41JuHLd0WlyQ4MEywpJ4Xzm74LalQIcB
	A/PmjG23Ls7d3XtHuDyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6y-0000000B2HA-31gL;
	Tue, 16 Apr 2024 06:16:08 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6s-0000000B2B9-1ghB
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:04 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6150e36ca0dso59251547b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248160; x=1713852960; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ykRC4diMMUuCn1traUy9Psb15efHJHW4XPDrKAUvlVg=;
        b=jVaaWBuLASV2HTwbp1zD96/yHxIij65Y9ofFR7gTe92IyRecBiCJKzIqY7fualpQAj
         MPLiVdlIwGFsTPx+ynxLUCfp3XMUXfmva4Pakd/EDxj3PuN8FPjCv1h49AUSLng4uGka
         3FSaociqF7JpLwCrVFNdRLummVLbgawxp5DZXP0oVnejbdJ69xmKFRsy5aKCj6SMFaH6
         Ysq1AxMDABvBwbuG9ZDO491sxqfM5WfufhnsYAnCFA1N+n/s3v7rSrq1jL3Eq1dtfyHw
         PA/KPAycPUlkAl2cLIbepMvoasp72USeykksFZJrm3bvPt8Klu/PP3e3PtlO02h+XzAD
         eOoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248160; x=1713852960;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ykRC4diMMUuCn1traUy9Psb15efHJHW4XPDrKAUvlVg=;
        b=Owna9+9tOHEIBtdk1lzM6/t/RtLlPR6iHRK1scoV9KfNoOP+k0kWiHbmZC4+yXkpFP
         l/BlsUhhe4HkpAlRo8XGTdnmN+8fxV20YE7aeXOvWEwb/iAjqORfbTjI5ek2/YRi/sTC
         ILCa4yDG3b5LCPUWbg6kXDkpxbX0xnhaR09CMy0jbegFAm6mzscmNl+gDxNuk6zUw+gV
         6ZAwzqD6y5n9/qBaOj6AjeMsTf621TqPu3OnErhsmCBXNaPmnhBVdRlIL0iIF6LmM/dN
         iJC2BOzQ96XNnevyZsWDyWA3lqzDKCdZzPzuDYhvWFyz0mzwApiMdNX4ro1nDqkygOcw
         Cfkg==
X-Forwarded-Encrypted: i=1; AJvYcCVhC/sshgoY2r9VpF6yUwH3d+rCqHWZR973yln/gDWOLnNYYyjzESQ0TVEP86eTLsPgr+Wlb9t6PoMB2+udkSTUt5ReFv7Gs53Ld0UcFOgN
X-Gm-Message-State: AOJu0YwbWZ1y7iGe4ikE+g0tUlqMeWJ87JEqNk0n65nNKH9uacHyaV5V
	qy1JjMZTI6GXsU3bibhFOjkVNdDD6oSwY0BwQ2foJkmHKvBc7iLW0kdGjY6EVSGdXrxQyrCGn5Q
	cwpeYkA==
X-Google-Smtp-Source: AGHT+IE1BkM8u1uMxF/LJ+oAvk+/Ck61XwF1nrFOd9+nZTm6s22+JsAiR5ckes/nbIKLU3LTA7VFsn18XwaJ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a0d:d44e:0:b0:61a:d0d2:b31 with SMTP id
 w75-20020a0dd44e000000b0061ad0d20b31mr1012904ywd.3.1713248160541; Mon, 15 Apr
 2024 23:16:00 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:23 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-8-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 07/16] perf parse-events: Handle PE_TERM_HW in name_or_raw
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
X-CRM114-CacheID: sfid-20240415_231602_700524_F65C29BF 
X-CRM114-Status: GOOD (  10.07  )
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
index 7764e5895210..254f8aeca461 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -603,6 +603,11 @@ event_term
 }
 
 name_or_raw: PE_RAW | PE_NAME | PE_LEGACY_CACHE
+|
+PE_TERM_HW
+{
+	$$ = $1.str;
+}
 
 event_term:
 PE_RAW
@@ -644,20 +649,6 @@ name_or_raw '=' PE_VALUE
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
@@ -710,18 +701,6 @@ PE_TERM '=' name_or_raw
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
