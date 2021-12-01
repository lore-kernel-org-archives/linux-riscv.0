Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11EDFC433EF
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Dec 2021 12:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/OJXzgdqLYIYcvLl6ARFVniJ0ej1jEUk2R6+ArqQbmo=; b=MlTR9tvVMgSjOf
	YoMvCKabAgzwciqdWcC0SR2pOjppS3wlDZEgKdc2Wy8ozhcktzgBPhlZHo/CCB9Ab6Q7NdUWwV3nX
	picUstNbCthBHPgYsGYDipUskCFrV8Pj7/hZ9/IRnaaJToYgqjrweAG356ZWLbaG8K3+Qd+toayDX
	MGBhS3riTN7kPBAZFAv47LBBkDaDzgiNF2NZxSh/WpidIu2xIlRRSJjxxZMealG3UZ6yNWx1SNWJM
	F8ll6lMXDQ0y+PPcqr+leryjjvLKIVDQktFZmOH1WY4CRDhPGQeXJA3htq/mimkRpEIWi/gy7Gz9N
	ZeHm6ulQKY09qDtVfoNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1msOp1-008U2r-7P; Wed, 01 Dec 2021 12:34:51 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1msOoQ-008To0-Mr; Wed, 01 Dec 2021 12:34:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EEEDA147A;
 Wed,  1 Dec 2021 04:34:13 -0800 (PST)
Received: from e127744.cambridge.arm.com (e127744.cambridge.arm.com
 [10.1.32.151])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id A76BF3F7D7;
 Wed,  1 Dec 2021 04:34:10 -0800 (PST)
From: German Gomez <german.gomez@arm.com>
To: linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 acme@kernel.org
Cc: German Gomez <german.gomez@arm.com>, John Garry <john.garry@huawei.com>,
 Will Deacon <will@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@redhat.com>, Namhyung Kim <namhyung@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v1 2/4] perf script: Add "struct machine" parameter to
 process_event callback
Date: Wed,  1 Dec 2021 12:33:30 +0000
Message-Id: <20211201123334.679131-3-german.gomez@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211201123334.679131-1-german.gomez@arm.com>
References: <20211201123334.679131-1-german.gomez@arm.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211201_043414_875728_024A784B 
X-CRM114-Status: GOOD (  12.49  )
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

Include a "struct machine*" parameter to the process_event callback in
the scripting layer. This will allow access to the perf_env from within
this callback.

Followup patches will build on top of this to report the correct name of
the registers in a perf.data file, consistently with the architecture
the file was recorded in.

Signed-off-by: German Gomez <german.gomez@arm.com>
---
 tools/perf/builtin-script.c                   |  2 +-
 .../util/scripting-engines/trace-event-perl.c |  3 ++-
 .../scripting-engines/trace-event-python.c    | 23 +++++++++++--------
 tools/perf/util/trace-event-scripting.c       |  3 ++-
 tools/perf/util/trace-event.h                 |  3 ++-
 5 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 9434367af..711132f0b 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2256,7 +2256,7 @@ static int process_sample_event(struct perf_tool *tool,
 				thread__resolve(al.thread, &addr_al, sample);
 			addr_al_ptr = &addr_al;
 		}
-		scripting_ops->process_event(event, sample, evsel, &al, addr_al_ptr);
+		scripting_ops->process_event(event, sample, evsel, &al, addr_al_ptr, machine);
 	} else {
 		process_event(scr, sample, evsel, &al, &addr_al, machine);
 	}
diff --git a/tools/perf/util/scripting-engines/trace-event-perl.c b/tools/perf/util/scripting-engines/trace-event-perl.c
index 32a721b3e..6017c4660 100644
--- a/tools/perf/util/scripting-engines/trace-event-perl.c
+++ b/tools/perf/util/scripting-engines/trace-event-perl.c
@@ -454,7 +454,8 @@ static void perl_process_event(union perf_event *event,
 			       struct perf_sample *sample,
 			       struct evsel *evsel,
 			       struct addr_location *al,
-			       struct addr_location *addr_al)
+			       struct addr_location *addr_al,
+			       struct machine *machine __maybe_unused)
 {
 	scripting_context__update(scripting_context, event, sample, evsel, al, addr_al);
 	perl_process_tracepoint(sample, evsel, al);
diff --git a/tools/perf/util/scripting-engines/trace-event-python.c b/tools/perf/util/scripting-engines/trace-event-python.c
index c0c010350..e164f8d00 100644
--- a/tools/perf/util/scripting-engines/trace-event-python.c
+++ b/tools/perf/util/scripting-engines/trace-event-python.c
@@ -708,7 +708,8 @@ static void regs_map(struct regs_dump *regs, uint64_t mask, char *bf, int size)
 
 static void set_regs_in_dict(PyObject *dict,
 			     struct perf_sample *sample,
-			     struct evsel *evsel)
+			     struct evsel *evsel,
+			     struct machine *machine __maybe_unused)
 {
 	struct perf_event_attr *attr = &evsel->core.attr;
 
@@ -776,6 +777,7 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 					 struct evsel *evsel,
 					 struct addr_location *al,
 					 struct addr_location *addr_al,
+					 struct machine *machine,
 					 PyObject *callchain)
 {
 	PyObject *dict, *dict_sample, *brstack, *brstacksym;
@@ -849,7 +851,7 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 			PyLong_FromUnsignedLongLong(sample->cyc_cnt));
 	}
 
-	set_regs_in_dict(dict, sample, evsel);
+	set_regs_in_dict(dict, sample, evsel, machine);
 
 	return dict;
 }
@@ -857,7 +859,8 @@ static PyObject *get_perf_sample_dict(struct perf_sample *sample,
 static void python_process_tracepoint(struct perf_sample *sample,
 				      struct evsel *evsel,
 				      struct addr_location *al,
-				      struct addr_location *addr_al)
+				      struct addr_location *addr_al,
+				      struct machine *machine)
 {
 	struct tep_event *event = evsel->tp_format;
 	PyObject *handler, *context, *t, *obj = NULL, *callchain;
@@ -964,7 +967,7 @@ static void python_process_tracepoint(struct perf_sample *sample,
 		PyTuple_SetItem(t, n++, dict);
 
 	if (get_argument_count(handler) == (int) n + 1) {
-		all_entries_dict = get_perf_sample_dict(sample, evsel, al, addr_al,
+		all_entries_dict = get_perf_sample_dict(sample, evsel, al, addr_al, machine,
 			callchain);
 		PyTuple_SetItem(t, n++,	all_entries_dict);
 	} else {
@@ -1366,7 +1369,8 @@ static int python_process_call_return(struct call_return *cr, u64 *parent_db_id,
 static void python_process_general_event(struct perf_sample *sample,
 					 struct evsel *evsel,
 					 struct addr_location *al,
-					 struct addr_location *addr_al)
+					 struct addr_location *addr_al,
+					 struct machine *machine)
 {
 	PyObject *handler, *t, *dict, *callchain;
 	static char handler_name[64];
@@ -1388,7 +1392,7 @@ static void python_process_general_event(struct perf_sample *sample,
 
 	/* ip unwinding */
 	callchain = python_process_callchain(sample, evsel, al);
-	dict = get_perf_sample_dict(sample, evsel, al, addr_al, callchain);
+	dict = get_perf_sample_dict(sample, evsel, al, addr_al, machine, callchain);
 
 	PyTuple_SetItem(t, n++, dict);
 	if (_PyTuple_Resize(&t, n) == -1)
@@ -1403,7 +1407,8 @@ static void python_process_event(union perf_event *event,
 				 struct perf_sample *sample,
 				 struct evsel *evsel,
 				 struct addr_location *al,
-				 struct addr_location *addr_al)
+				 struct addr_location *addr_al,
+				 struct machine *machine)
 {
 	struct tables *tables = &tables_global;
 
@@ -1411,14 +1416,14 @@ static void python_process_event(union perf_event *event,
 
 	switch (evsel->core.attr.type) {
 	case PERF_TYPE_TRACEPOINT:
-		python_process_tracepoint(sample, evsel, al, addr_al);
+		python_process_tracepoint(sample, evsel, al, addr_al, machine);
 		break;
 	/* Reserve for future process_hw/sw/raw APIs */
 	default:
 		if (tables->db_export_mode)
 			db_export__sample(&tables->dbe, event, sample, evsel, al, addr_al);
 		else
-			python_process_general_event(sample, evsel, al, addr_al);
+			python_process_general_event(sample, evsel, al, addr_al, machine);
 	}
 }
 
diff --git a/tools/perf/util/trace-event-scripting.c b/tools/perf/util/trace-event-scripting.c
index 7172ca052..089a2c905 100644
--- a/tools/perf/util/trace-event-scripting.c
+++ b/tools/perf/util/trace-event-scripting.c
@@ -51,7 +51,8 @@ static void process_event_unsupported(union perf_event *event __maybe_unused,
 				      struct perf_sample *sample __maybe_unused,
 				      struct evsel *evsel __maybe_unused,
 				      struct addr_location *al __maybe_unused,
-				      struct addr_location *addr_al __maybe_unused)
+				      struct addr_location *addr_al __maybe_unused,
+				      struct machine *machine __maybe_unused)
 {
 }
 
diff --git a/tools/perf/util/trace-event.h b/tools/perf/util/trace-event.h
index 640981105..6f5b1a6d5 100644
--- a/tools/perf/util/trace-event.h
+++ b/tools/perf/util/trace-event.h
@@ -81,7 +81,8 @@ struct scripting_ops {
 			       struct perf_sample *sample,
 			       struct evsel *evsel,
 			       struct addr_location *al,
-			       struct addr_location *addr_al);
+			       struct addr_location *addr_al,
+			       struct machine *machine);
 	void (*process_switch)(union perf_event *event,
 			       struct perf_sample *sample,
 			       struct machine *machine);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
