Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C32E0E8784C
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=rNDNvvNL9rG8AEtdc4nn1xDxhY+mXqtekL09AuCG3kQ=; b=M/KPjNA0rAlBuQUDPzHArO5MXZ
	rLeadirMhwZQqc8rsSB9SsbgSMhG1MMhiScZfhV+QXxMsV15kgpEet7vD52L+QXaOlN7X/l8E6wgw
	FhqInAu4dYdjEs6YFWNhSquTIMxvz3kVlPlMxpPXjoXT+3K4lw6/i0K6haLa8lq+Bi6DMwp58TtTM
	eQuUvvhT625mjpqfLPg+bb9SclCZKZRLpB6PrHeMbt4wSEjX48LkiGe4r0usniItiIwhJHmSOnd4f
	sMBGXKesD+069gpoSTsi6+VZ2NBFUVLPcV3hEFOu9fGQUQopyOixpmmWMzE0LsGdz3lQxLUkOVFHL
	SpQ0b0kw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7d-000000078kP-3Lae;
	Tue, 03 Feb 2026 18:27:33 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7Z-000000078eA-1OnN
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:27:31 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b75222e9easo13362372eec.1
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 10:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770143248; x=1770748048; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Lo69Fl4f1ujd/UcQ8IKUv7cnjD0QPa0txh8j6kiRg=;
        b=j7LfkICwLXBj+glKfU/3csrxTHWlnBWNTQ2ZWvS2w2IjTrYPFGdTzejgr5uHLaLcWb
         yXCqxy+s5OsNbBzsThPS6YRTW7gbJRLVbbO3+1rWj2eEJXARTCnOich2nLSlqiLiVAUm
         ZTNGWar0QP4use4XIJiGYC8r/Xeb0R3iL1yDopP83q5E3/KuureCkv9GtDek53sj12r9
         EQVmPWC1BQK5K1+T3T698eEcLIaV/jWC2DnHY1lEHNk1YLHLwMUEx8pa0gMc8DN1fkEd
         TG23/9pMcXdb7XtBvRLRbBeUMw35KPEIR/amEQzb2sVjR57VZZ9J+Z+dxdZvAabe2/IY
         lOVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143248; x=1770748048;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=b4Lo69Fl4f1ujd/UcQ8IKUv7cnjD0QPa0txh8j6kiRg=;
        b=jfns0q2E8n4D5gNi+UITi24+Xne+NWrBjz5Bm5gV27rAbR4ff+gTAIa6jIsk05Avf3
         rJqC+rxR+Zg+cQKxZAwES5+ICIOM00IuNEnnrgLp7w56H7FSZp/4KrM1Idd7K7ayR8bZ
         2Zdf5PUXP9T+vD/qpEtB3rtAH1V+SggAXoDQNgK4gS9CyYp49OUqve6MJnWzCQk5SafL
         PcgthBxTsFe84dYYtKivQwFLC43j0jbwbtkrTdAXm8yoikUM4Pif6A5fGBm6toPI8m8B
         XiWXm2yrT+N/zkavTO1soALZBq604VwcwHtCYYx266/tNX5pVEgi4v1gGA9QJitoPnPX
         Ct5Q==
X-Forwarded-Encrypted: i=1; AJvYcCVrTn7hNEEywgFaFFXMu+g87lf179czq+Lo1Gs4BK6yx3/SpXBhbfg0sLKq4OrFs59/dRvmGeGr51pcCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkqS1t5glotQrJX5y83UPhSVWY0gjcI8Ysm3Yrt8cLBFslRS7r
	oMQi5mZ+fGx5n0dJiNl55U+D8+Y+vDE7DsgVJfwJiuU4jCe/saw4TPDq0Um2AHXHVjbafOznHpG
	ss4pxIwVCDA==
X-Received: from dybmd11.prod.google.com ([2002:a05:7301:180b:b0:2a4:6ffc:87c9])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7300:a287:b0:2b7:f522:9964
 with SMTP id 5a478bee46e88-2b83296f2f4mr186503eec.7.1770143247875; Tue, 03
 Feb 2026 10:27:27 -0800 (PST)
Date: Tue,  3 Feb 2026 10:26:40 -0800
In-Reply-To: <20260203182640.3911987-1-irogers@google.com>
Mime-Version: 1.0
References: <aYIOMWb2sijXzSDm@x1> <20260203182640.3911987-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203182640.3911987-6-irogers@google.com>
Subject: [PATCH v3 5/5] perf thread: Don't require machine to compute the e_machine
From: Ian Rogers <irogers@google.com>
To: acme@kernel.org
Cc: aditya.b1@linux.ibm.com, adrian.hunter@intel.com, ajones@ventanamicro.com, 
	ak@linux.intel.com, alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, ashelat@redhat.com, 
	atrajeev@linux.ibm.com, blakejones@google.com, ctshao@google.com, 
	dapeng1.mi@linux.intel.com, dvyukov@google.com, howardchu95@gmail.com, 
	irogers@google.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-riscv@lists.infradead.org, mingo@redhat.com, namhyung@kernel.org, 
	palmer@dabbelt.com, peterz@infradead.org, pjw@kernel.org, 
	shimin.guo@skydio.com, swapnil.sapkal@amd.com, thomas.falcon@intel.com, 
	will@kernel.org, ysk@kzalloc.com, zhouquan@iscas.ac.cn
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260203_102729_385537_BB07567A 
X-CRM114-Status: GOOD (  11.84  )
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
2.53.0.rc2.204.g2597b5adb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
