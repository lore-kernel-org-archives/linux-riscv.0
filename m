Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459EBC07C79
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ttsxRKmX0i4Nwr1v65N+HaXYOKgvPxYxmrbLaGP5L54=; b=Pnxc9S4gHi5Vs6
	YPkMDAi4ym9hquTT9+riN7L0b3c+FX6QCctGv2OwIXAnj07t0KVeu6WWelLViLSmnlwples9+ABdm
	BgKW1nZmUIH6R5xNYStV0sb2nFEtWRAOMKbQJkic5ovgOshUZyPdbKCGzm1S2DSFfV4B1aKwkUSue
	qz6qNQZLCkABuaJhmVk3zsSg+YLm69XCri64yTPuzkGWHWrfGBYZjEjGA5FdMeP1lixHV/tiz7WU8
	rd6FFMChdgEM19iGA63VsvWCWWft3JVFruwruah9E+fQgaWm5V5r1RsIL0A6wlyt2LWX5GWEn3fIF
	huHuzh1GYVX00i+LnObg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6s-0000000B2CA-2uqV;
	Tue, 16 Apr 2024 06:16:02 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc6n-0000000B27f-0ndw
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:15:58 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61892d91207so52179167b3.3
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248156; x=1713852956; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=UJgB8sDKrPml3/XRc3D6gD41xE7ASJL2MP2+Oe/niCE=;
        b=jweJZypQ0vWnsId80IEs6Q9po/q2dM9U0Qk/qWQKSGD4TV4JFObP2xJmWOC9M+bSx6
         yswUIRCpRxzaR7jhvNua9UaCCP14UbBVTe3s9zsVXJUYkN/dMPy++RjuEb0vez54iRgF
         lUCX1IM82IagLf2i4nEiI6p4OmOugqI/tZDpooP1Elc+vvkTTEBG0BZHguOzJlQt5q6i
         93+00svtjSFFPfd7CxIbMeJk0tFP/C8Ece/hgbhE6D22i4RGzM/GxEOoT9vDnQW5TWGB
         7nKuWR+B2Mg2C/ljtGXIdKPqQd23yuAfI0Dk437ILvqCNOFjfeLAPa/eNf1daAazKHix
         NVRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248156; x=1713852956;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=UJgB8sDKrPml3/XRc3D6gD41xE7ASJL2MP2+Oe/niCE=;
        b=YhwAn8jS0hoQz9w75jEZDS0O4RakVQMVwSZEcBy1fS8/x4GCfNTxSCg2nbmBxPkc31
         f50k43itU1XyE+aIttrgKxvnV0bZ/DREQcMve/R6X9B01AJvqSVmQnyCTW+AdxpRgfT9
         jomrgdSDRR0WgEVYFS4h/G+htmQnOTdTR9Jvoe3y9XG5vc+4P/vuHj4R8ABfpMWrWD0a
         td84ZZE4otzq1cffHZiZx46Qh2IPY3SIlIDCe+dBsOK3z39Ztlv3utdYOLwTUOAwQP8b
         TYP/4iYDQ3XPUK60GeMayreuQ7NHu7D/340EPDKu40rGOnFuY0eZBRDinNEeqQ66XHBy
         6eMw==
X-Forwarded-Encrypted: i=1; AJvYcCXPzmxpDpfYA1quPUyiHHks0K0L+ZXqEkXGuXSFSxZRvSwWmbBSdxDlZOoYKtICjKlP273lW/aG1+BWu0TgfZYkLv9dLq1T/CfpzSCFU/RB
X-Gm-Message-State: AOJu0YxC0daR+7Y6fmWd9Z8+I7B1wkuTwww2xiswOx+T9e6SMDeyyPfu
	Wbsu1rIbtVdM2VR0wPy+BzTwq35tWsJYN1Ya/Z6as8lKpES9y0ZRi89TJWXHqDCyCvi/FMJOTaS
	oMQwvMw==
X-Google-Smtp-Source: AGHT+IFvz2/ElMb8sqisE4iRWPUFBqPFEJev0kX5N83qt2rasL8K27n6w9ssQTNUocmaX8KnE4uhTcFVZFa+
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a05:6902:1509:b0:dc2:398d:a671 with SMTP
 id q9-20020a056902150900b00dc2398da671mr3887166ybu.10.1713248155750; Mon, 15
 Apr 2024 23:15:55 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:21 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-6-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 05/16] perf tests parse-events: Use branches rather than cache-references
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
X-CRM114-CacheID: sfid-20240415_231557_253888_BE32C040 
X-CRM114-Status: GOOD (  13.48  )
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
