Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6277E7C6E0
	for <linux-riscv@archiver.kernel.org>; Sat, 31 Jan 2026 20:03:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLHAy1736B2ZGfIvmhSYp2i8iKzUBtSoPGnxNhs+fzY=; b=Os5/Vs8VUhXs/D
	vCdLmzDQ+mvpHueNe3na7lXchpAlZ+3mSlFbfLlRhZ+Gkm2In7dk3VmZU6SdFkvOnrQAjjkmZ2vb4
	InfwFb3vNWK04iDr/ozxs1V97lCFiiTpdR3dVpx+RgDLcSLBcT/thMMR+DpkxD1vcAu6/d9f0Xrqq
	PYdL3x6mZ5pNJqds6iTGTi+HRYqpjr3vJPr3q8Dee5ZAJlfc2O5H4e4YZHte8J4NI1OPmt2Ry7SFT
	hmG7MuER3NsNtrLRnQLucOiRj5KpkjSSNjkWLzm+0zHKJWetLYmOH43yig0S/TbyTEgn1RjLqmPW4
	wwR/pVDCvaeuoZUKeRnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHBY-00000002wvs-190N;
	Sat, 31 Jan 2026 20:03:12 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vmHB4-00000002wWc-2ZGn
	for linux-riscv@lists.infradead.org;
	Sat, 31 Jan 2026 20:02:44 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b724ff60e6so3679629eec.0
        for <linux-riscv@lists.infradead.org>; Sat, 31 Jan 2026 12:02:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769889761; x=1770494561; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yU/No/CiRXNK30X5BW5gARgpwLegeQsixxR3xJoI9G0=;
        b=2ilZim0JawgMUwbqE7I/ciKOgY5DkfZiWDBE9g0LuJ3f8cr0bWyS+Kt0JnG7vSWYe/
         tYOoM1QOr7c+oP5cbIiN+qAIKqfMU35TCL52oofE+YcwV6ZTicxPBJjQ7PM+Qor80avR
         2n3YlyDCCT1omfGs1+nlfmG+4GiiNKIr7xCfzWdrGzRezAsJndwl+KMN1y/HwUipfEfC
         Hj+89mR0BWnlqBuK8qBOXAuN+Sm7nezBq3tL4blsc9CbTwH7K2d5zBIU2bL2kDM6PDcu
         OjPVp25feXnX+onMTEobBlShi0NI8KWY2p01UOq71Kv/zz2DGUAJFcpVqFPZL3YuUt/y
         gaug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769889761; x=1770494561;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yU/No/CiRXNK30X5BW5gARgpwLegeQsixxR3xJoI9G0=;
        b=ihAWK9RwK3tUIamNirkta/kVfoL7VDkLmhmOCKtVEa4wOTEEjdYOapjYrj8a0NPNk4
         NZB30h9VNdob7xDN2wi3prWD5pnF3U28V4LZEf3VYV2OYiIkfygG/9Yrgym91nsADmof
         5TWwGCysPJ/IhdJk0GU1q9zB9iloN8TFqo06I/7S3cMGHWHlvzen4ID01tnno3f5ihPI
         Ay++o2KgcoCm3/r/8aOPQpS4eXfUu501HFHHdJIykmntMLc6lMlSSSxCjmpl2ItjSiEy
         aa2Bc1DTdqIdiVacKkT5jBrlHSK5cy+1xKM19sPB4cmkp+0yeg3UG8I6oYUrd+XqDUEc
         HbCA==
X-Forwarded-Encrypted: i=1; AJvYcCUk13+KrYy3A7+NCFaprQLdvdSeAntUirGnrv0JSlkjV5qjJ1aSovsu33PutExkaPCtlPOfcaaR37wDdA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw6fyn/ovw0L9qAmZ522JXZQqP6KWLECYuKOj4NuaUdtHaNnwCf
	gOUmWt9+G2/W99KRxI+uPIkVwYmvuqpUff1I/XXh6Lbt1cAQfiIXrzJ9waXR981zXmkEGA7rhLy
	UHtyNTwzpkA==
X-Received: from dyek9.prod.google.com ([2002:a05:7300:6409:b0:2b7:4867:6bd0])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:2b13:b0:2ae:614a:330e
 with SMTP id 5a478bee46e88-2b7c8943db0mr3682412eec.41.1769889761125; Sat, 31
 Jan 2026 12:02:41 -0800 (PST)
Date: Sat, 31 Jan 2026 12:02:24 -0800
In-Reply-To: <20260131200224.1296136-1-irogers@google.com>
Mime-Version: 1.0
References: <20260131200224.1296136-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <20260131200224.1296136-7-irogers@google.com>
Subject: [PATCH v2 6/6] perf thread: Don't require machine to compute the e_machine
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Shimin Guo <shimin.guo@skydio.com>, Yunseong Kim <ysk@kzalloc.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Quan Zhou <zhouquan@iscas.ac.cn>, 
	Andrew Jones <ajones@ventanamicro.com>, Anup Patel <anup@brainfault.org>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Blake Jones <blakejones@google.com>, Swapnil Sapkal <swapnil.sapkal@amd.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Howard Chu <howardchu95@gmail.com>, 
	Anubhav Shelat <ashelat@redhat.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Chun-Tse Shao <ctshao@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260131_120242_680614_0975FF18 
X-CRM114-Status: GOOD (  13.19  )
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

The machine can be calculated from a thread via its maps. Don't
require the machine argument to simplify callers and also to delay
computing the machine until a little later.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/scripting-engines/trace-event-python.c | 8 +++-----
 tools/perf/util/session.c                              | 3 +--
 tools/perf/util/thread.c                               | 5 +++++
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index 62c9c73daef5..2b0df7bd9a46 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -837,7 +837,6 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 					 PyObject *callchain)
 {
 	PyObject *dict, *dict_sample, *brstack, *brstacksym;
-	struct machine *machine;
 	uint16_t e_machine = EM_HOST;
 	uint32_t e_flags = EF_HOST;
 
@@ -926,10 +925,9 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 			PyLong_FromUnsignedLongLong(sample->cyc_cnt));
 	}
 
-	if (al->thread) {
-		machine = maps__machine(thread__maps(al->thread));
-		e_machine = thread__e_machine(al->thread, machine, &e_flags);
-	}
+	if (al->thread)
+		e_machine = thread__e_machine(al->thread, /*machine=*/NULL, &e_flags);
+
 	if (set_regs_in_dict(dict, sample, evsel, e_machine, e_flags))
 		Py_FatalError("Failed to setting regs in dict");
 
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 53f51c3f9603..4b465abfa36c 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2972,9 +2972,8 @@ struct perf_session__e_machine_cb_args {
 static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 {
 	struct perf_session__e_machine_cb_args *args = _args;
-	struct machine *machine = maps__machine(thread__maps(thread));
 
-	args->e_machine = thread__e_machine(thread, machine, &args->e_flags);
+	args->e_machine = thread__e_machine(thread, /*machine=*/NULL, &args->e_flags);
 	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
index 618f29afb160..22be77225bb0 100644
--- a/tools/perf/util/thread.c
+++ b/tools/perf/util/thread.c
@@ -499,6 +499,11 @@ uint16_t thread__e_machine(struct thread *thread, struct machine *machine, uint3
 		return e_machine;
 	}
 
+	if (machine == NULL) {
+		struct maps *maps = thread__maps(thread);
+
+		machine = maps__machine(maps);
+	}
 	tid = thread__tid(thread);
 	pid = thread__pid(thread);
 	if (pid != tid) {
-- 
2.53.0.rc1.225.gd81095ad13-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
