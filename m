Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 912A9C04FF9
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttsxRKmX0i4Nwr1v65N+HaXYOKgvPxYxmrbLaGP5L54=; b=OUrr6c66WnsJfa
	QuPnaigN1ecl1uVnD/ALrG37rvMI8AfBMebVniiLlIdtQLuydfOBqTxhTiip42v3MKhq8WqXZ4N0i
	cVvQ2oZuUpv98niddg2pzHsZB7ZQqERXI23sXQHUwFlb6jBnpWSHfcmTrYwJTW3lmmmFGy3UF0lsQ
	J6GGURK0sqlvbHeWQE2b2uHRXVRlrp1PFBbYSC4uISbzl+CN5l3OaaFqurZgDJPZtUSU5iCY2vAQi
	LqJmQzpf1U8qQMjkz12zKLCzDSFdXEDSs3Eu9a1+EvUVsP8HDgPctN2boKL2fC91x6TUNP73CAkXp
	9NVHyHyTYfoSehzoQ19g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxZ-00000007B9e-1lBM;
	Mon, 15 Apr 2024 06:36:57 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwFxO-00000007AzP-2OpT
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 06:36:49 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-dc64f63d768so5174063276.2
        for <linux-riscv@lists.infradead.org>; Sun, 14 Apr 2024 23:36:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713163002; x=1713767802; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJgB8sDKrPml3/XRc3D6gD41xE7ASJL2MP2+Oe/niCE=;
        b=oKuLxA4nCkF3s98kZEOABJQUEgS87N59U3lqUW1szyaEa3WOybNOxVn3ZQvYrOUE8M
         k8cpTbTFDoDWXEy1wSjgXRMYqlBdesAxI+iPppqIjsJDVcjiIe20MvxrnK/MiJdacpmN
         y3WJuVX0VDYi8BblPc0FdOY6Q+YuKiWLYaGBKkcWrZ5SQILufSSElSa4qE4LhMFIJVbZ
         BD8qW3uFPoCKbm5Dny35Ym9E6uo8c5pRXmaOtUNlLllwzyOaZ2btJ02E/UN4ud/QQ8wn
         0/TV8XGlfQGYbp1aCVkO1dgDVzDOUxe275/oHoS9rEpWpWdpt2+17RX5/vRtJ2kUr0c0
         bYUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713163002; x=1713767802;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJgB8sDKrPml3/XRc3D6gD41xE7ASJL2MP2+Oe/niCE=;
        b=KfNplt/rLZtZH2+i86dPv/aLoZM/mawe0Gk8/fyA1F8qbWH13sXbgRAu8Axtkzwv7U
         SuhKSVmIxNdPCBBdjfUK7R7wTo4PitecK/fFq8mqlcOccSirro/sPEqi8cgjgnkw/w1e
         QMpdmTIuw+2SDjmHTp/v/oaEF2S2FsYykvrwEuoQUUX1Dl26rnllXeEA8SDbroKUzlsC
         +uXyvyC9ycvIbcmxG8BPAFfw3t5S9x4L47EGO4DWPQiBjYzPvkrKy1DB7+EttDdQgyQZ
         LKh22YuLfOk5JP8t/0arXrjEn6pNfjwoo6TWIpdddC6q8uU6kMKH1/NxtMTmhN8mXx4F
         w+6w==
X-Forwarded-Encrypted: i=1; AJvYcCWEeeoIMldzOrYj3j/4y+/mn1tCKDVauWYn4/9juA13xnh/Ow737cvdDshet9bbdYybyIIq6GQkP/SzpqWSZmjtN1cYW1VgPXYzHNUojYUp
X-Gm-Message-State: AOJu0YzYq192wRhve6n07av34LBFxQqKU/CgjvABVFfZH6xueAmMcw7P
	88a/hVZkzpjKbJvOd1t+Bfqu+ayQV7f0+FlC+s8h47DS2ZmGc1p95tWT1xE4INQSQAP/wd2VbKL
	ZdpsDhw==
X-Google-Smtp-Source: AGHT+IEiiZuVjgyhNgTTLyZ6Sh7UYfcc0UNFuJ2n/bK+2GCusGz73ratukmMFcwYpUzQY+G7b8Ltwey08z2j
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:f304:d776:d707:4b57])
 (user=irogers job=sendgmr) by 2002:a05:6902:1549:b0:dc6:dfd9:d431 with SMTP
 id r9-20020a056902154900b00dc6dfd9d431mr2983520ybu.1.1713163002294; Sun, 14
 Apr 2024 23:36:42 -0700 (PDT)
Date: Sun, 14 Apr 2024 23:36:22 -0700
In-Reply-To: <20240415063626.453987-1-irogers@google.com>
Message-Id: <20240415063626.453987-6-irogers@google.com>
Mime-Version: 1.0
References: <20240415063626.453987-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v1 5/9] perf tests parse-events: Use branches rather than cache-references
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
X-CRM114-CacheID: sfid-20240414_233646_635606_6C90C3C5 
X-CRM114-Status: GOOD (  13.10  )
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

Switch from cache-references to branches in test as Intel has a sysfs
event for cache-references and changing the priority for sysfs over
legacy causes the test to fail.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/tests/parse-events.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/tools/perf/tests/parse-events.c b/tools/perf/tests/parse-events.c
index 0b70451451b3..993e482f094c 100644
--- a/tools/perf/tests/parse-events.c
+++ b/tools/perf/tests/parse-events.c
@@ -942,8 +942,8 @@ static int test__group2(struct evlist *evlist)
 			continue;
 		}
 		if (evsel->core.attr.type == PERF_TYPE_HARDWARE &&
-		    test_config(evsel, PERF_COUNT_HW_CACHE_REFERENCES)) {
-			/* cache-references + :u modifier */
+		    test_config(evsel, PERF_COUNT_HW_BRANCH_INSTRUCTIONS)) {
+			/* branches + :u modifier */
 			TEST_ASSERT_VAL("wrong exclude_user", !evsel->core.attr.exclude_user);
 			TEST_ASSERT_VAL("wrong exclude_kernel", evsel->core.attr.exclude_kernel);
 			TEST_ASSERT_VAL("wrong exclude_hv", evsel->core.attr.exclude_hv);
@@ -2032,7 +2032,7 @@ static const struct evlist_test test__events[] = {
 		/* 8 */
 	},
 	{
-		.name  = "{faults:k,cache-references}:u,cycles:k",
+		.name  = "{faults:k,branches}:u,cycles:k",
 		.check = test__group2,
 		/* 9 */
 	},
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
