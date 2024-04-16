Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81490C18E72
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 06:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UQ99ya58VYDbZYE6qNE/+kxH4PkPXnZp/jALsNhrd/4=; b=iGSXyQ3vpg7Rq4
	L4dVyb7UDKs71GSPenobgbEQj3DTf4z51SIczERbltduwC1Inq0CcF05doSKBBmGoI6umpYyY2kyN
	wCrKVdoAoaM5ej40yKB9xjceHs9AzMczo8YbRlM9Q+BAtgyKy3EVldt/o789NN1Gdjzr4n/GSVc0J
	bKioGWr73+62BVhDbQnWpiHQ8eWigs4yOHUhhj6I3rVLCx+y/CNhtDJuSwCFsWQeF9oFIt4E/lmF5
	J+AoJmyOHGZrhjDzuiWFPsbs7rt2vnXao4gcLp9BQV/s8B9ucil6Mze/41cHlXhzb531Y/aqfV+GN
	J0J9Hpk3LptUmT+3Q9tQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7a-0000000B2p0-3P7K;
	Tue, 16 Apr 2024 06:16:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7J-0000000B2aK-3Qgn
	for linux-riscv@bombadil.infradead.org;
	Tue, 16 Apr 2024 06:16:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9VrQN7n3xmbjqa9xka2YhMJJYnp++PDb8jkPaxpbY/Q=; b=qeaQrWVPA8gFv6pol6vQ03Ahdu
	iwZUQPvyTj5M/Nn7BNIdWnc8grJY1su/ax9QLq4W8hl9/X8byie+IQ2ruKCa8iH3Yom2VPvv0hexC
	kKCiDikXRlsgUHUXQUutyK9vRuQnNgR77R3MDLJLkNIKEtHZoOLMUs1AWmSwfjRnmRXiK7zSpOLH+
	LOMwORqPtmTrvfBjfH+acM8/x0sGll8i7XRU90eGCu261v+3A5OgMizV6033kJG3TSxp58V/dwlG/
	b/Lv53iSq2IUiNu/BPxYqcgZIwEjsafGpdgjS3yBRPjaxjDxO+i4/7Ys3f0mLm6h9mm4ednGKMi+B
	N1mkBz/Q==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwc7D-0000000Aw4N-2aMO
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 06:16:28 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-61acc68c1bdso16320867b3.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 23:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713248179; x=1713852979; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9VrQN7n3xmbjqa9xka2YhMJJYnp++PDb8jkPaxpbY/Q=;
        b=vp9DpbszfNz6gRxGbImGVpmB+IUFANVDhliKQk00TPQjPO5iSGa9ByQlgIBJzVxkuN
         FYTXbZcQrulc9Ghu/LNMSSjCExcOZi+dinw/x59tegDr5HyCai/hXmvmQzCUoTNpq0ee
         SxSfSCTaFmqZeUeBxg1FHp9B7gp9KeJtWk+avBFDDqavoFsiW06KSoECAeKKz5Y8ZLNT
         Tvinmuro4d6/f1eSuALptktWRSzZaax2HQQql4AmG5aldq2o7as0HJU66wHhpWxSEoDc
         NV4G6LSdqX7lrhBQ2/i/8vhvmsWceqTtw5cXxKd4ATi9Ab02Vt22GWtxnCNVQWZcs7Ux
         nRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713248179; x=1713852979;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VrQN7n3xmbjqa9xka2YhMJJYnp++PDb8jkPaxpbY/Q=;
        b=J6qmuPXq7MzHOl58T8OdvvVInRu2ZuTS40RfqNGXhogqNV/gakJh5ttK4FL07bfO5k
         vJPTx5tIe0UU47k5wFKfsSR9lwBd2M264tsujupmaT151sCusj3sux5BDgHp3PqPn297
         4uBmMh97Cp74g9b4GqlXqg3NSU0Voy7gZ2nzS0yQLHoXS1HAFOWX3ebm8oL0ZXuYx4II
         r432UaviHfPa8jzcCjl3J7XGDxLfdEnOPp4dLDOHjqBJN2voVdihfG8Rn/BZUG2LqV3y
         M8rgyGchmHq6FHMaGkGF+KGHjEdYPpwZfzX5uxtg6y/m8OPxDaZhZvgBDRKMG9czQ1oJ
         IcxA==
X-Forwarded-Encrypted: i=1; AJvYcCW1+bc4aFk7HTsV9H99Qea1ngUnLoXjVtAf7dqO4wmXCxYaEOjrMU1elGCdMlg7HNs8SaRaNmE1qu/Cill8tXkVcVOZ9w9CHh+L7Km+M+TB
X-Gm-Message-State: AOJu0Yw2znAwBO4+sURkZ4kZadJzg9QbJhUTODCmSG7lXSlycgJ14bGK
	OsuuipySjjJSMT+6acqFI9656ETL/K1hFkgAvxNWBJjEFOuz45/d1sz1Zrip407tRrpAhJ/sTl9
	wHE07Uw==
X-Google-Smtp-Source: AGHT+IERSGPTpkVgBfw9PFFOt/D0ky1G3+P1qSBu4bKGGyUriqoLEpK5IFzVUX9JSbM2dKNl22D4bBUM9mgq
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:30c8:f541:acad:b4f7])
 (user=irogers job=sendgmr) by 2002:a25:2054:0:b0:dc6:b7c2:176e with SMTP id
 g81-20020a252054000000b00dc6b7c2176emr369458ybg.4.1713248179377; Mon, 15 Apr
 2024 23:16:19 -0700 (PDT)
Date: Mon, 15 Apr 2024 23:15:31 -0700
In-Reply-To: <20240416061533.921723-1-irogers@google.com>
Message-Id: <20240416061533.921723-16-irogers@google.com>
Mime-Version: 1.0
References: <20240416061533.921723-1-irogers@google.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Subject: [PATCH v2 15/16] perf parse-events: Minor grouping tidy up
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
X-CRM114-CacheID: sfid-20240416_071624_301703_3D64FCC4 
X-CRM114-Status: GOOD (  13.34  )
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

Add comments. Ensure leader->group_name is freed before overwriting
it.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/parse-events.c | 1 +
 tools/perf/util/parse-events.y | 6 +++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/tools/perf/util/parse-events.c b/tools/perf/util/parse-events.c
index 8d3d692d219d..1c1b1bcb78e8 100644
--- a/tools/perf/util/parse-events.c
+++ b/tools/perf/util/parse-events.c
@@ -1711,6 +1711,7 @@ void parse_events__set_leader(char *name, struct list_head *list)
 
 	leader = list_first_entry(list, struct evsel, core.node);
 	__perf_evlist__set_leader(list, &leader->core);
+	zfree(&leader->group_name);
 	leader->group_name = name;
 }
 
diff --git a/tools/perf/util/parse-events.y b/tools/perf/util/parse-events.y
index 79f254189be6..6f1042272dda 100644
--- a/tools/perf/util/parse-events.y
+++ b/tools/perf/util/parse-events.y
@@ -193,7 +193,10 @@ PE_NAME '{' events '}'
 {
 	struct list_head *list = $3;
 
-	/* Takes ownership of $1. */
+	/*
+	 * Set the first entry of list to be the leader. Set the group name on
+	 * the leader to $1 taking ownership.
+	 */
 	parse_events__set_leader($1, list);
 	$$ = list;
 }
@@ -202,6 +205,7 @@ PE_NAME '{' events '}'
 {
 	struct list_head *list = $2;
 
+	/* Set the first entry of list to be the leader clearing the group name. */
 	parse_events__set_leader(NULL, list);
 	$$ = list;
 }
-- 
2.44.0.683.g7961c838ac-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
