Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A20AE87852
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:27:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=ucZqGQR5ItzHDgagtjcQjdjJPEZxqEBYGUVMMvHWUUg=; b=3dt1J/JG0Wz6P8p0T/60EFszpF
	8M+P1rD3N4fTtCRZuJTLVv8LBWUCsjN1cRj41DtJCzNvFXVJekISw9rFv3GKR1U/Ye0WPDAKs/a3R
	mPHw39A5xK/vvbOiLLy04kMkUyDQl6iZsB8AjHsa2ovW+ve4ezry0z3sK2rEQfbgBC9hVB7fbUwzW
	SgvaDx4RBzcPUaSwel4vj0Xj6yAMuqLcs7sqSY/ji3XtbYrcpSAWcncy4bBW3OX3w2coJC9YRZxUL
	9miGSyRGo/cSiZ1/PUxIbGkDk/yNNXWs17DSKdvzyQY0wouej2GwH1TG5gYf/SFDEg8h/2+UbbuJn
	cu57y5OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7P-000000078UV-49VT;
	Tue, 03 Feb 2026 18:27:20 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7O-000000078Sa-1AyN
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:27:19 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-124a978ba9bso7055498c88.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 10:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770143237; x=1770748037; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ/mKH6xXSRuds8KmNTYjhBcMp07hv028GEXnHNtdUs=;
        b=pERitHlI7T6G3BB3UdN3LuM93ebzTQZt251F25mcoNDZQfhhOebTZ5Xl3AEoG2TwDx
         MPCI2aZPjH+lPuFR2KLZXaa9AFrgSh5PNoPu099hvGHNADSV8NDnIrOnGJmatAAA4mw1
         NST+CFUVBpuuRn6OaHEK4Eky2+wUmUgVe3gneSbgnqHi+Opqb5IZ0hLQ1v/l1HBljxtR
         J6SncbiqT3b79retPwjpl/RVgUYOI8Dtu3yxWr4OkNxGWwD8Pp0iOjV0mb99kmGXzjhL
         m/4qLCxrazC7ksJcxcKFUsx8vuP+60wO5r3XIHQR18c1kiHfmv1ta2Wcq753kOgXoYAN
         ivlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143237; x=1770748037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IQ/mKH6xXSRuds8KmNTYjhBcMp07hv028GEXnHNtdUs=;
        b=FlhsqcxPx1zqAyaf7u0npMWECi312dz22LOLoXzXpZ0eIx0iOC8eXNNlibufkB7JAz
         SXaKXOJiSRb+57rMT3zBAW7CqR2z77FpmE8PIPkYkLrt+WjWeasLFcWd4YQiwbnsAxSR
         sid00WZVBonOsrVyBip+sXELuCBHjOBYZYonzdj6ySWVkr2ZoKLjU51csw97m3rJBYAa
         mJsG1yzIaiv3yKw8orHTycF/+ucdT6SOYJrWhyx46l0m9wEUzsEzUbo0aTnpolaJWfrP
         7AHM4RPEnxiz8iOEtQQDH/ZyX2/yg86b5A3aGeKV9fX1HVUBY2OZXl0w1OLCOjfLRaR2
         bbTA==
X-Forwarded-Encrypted: i=1; AJvYcCW7bk+i5INgW87me88DaxwdHkdieVmQ8/UodpvHdDnGqotx2nWjnT5rDBOkc8jLofsXY9hyBQwhv5k13w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyT7miT/44EBicORGmUkODl/lFnzXkaJWlKcZuQ90Uj0vJs9UlS
	Nxf0i1RtkD1a7VTDruRgpBJRwcroLfP+UGa2hAlcPxouads6WHmhH+/AFRFU/cHqVVYpRvYm4YV
	c+cnb5aQAYQ==
X-Received: from dlboy9.prod.google.com ([2002:a05:7022:1289:b0:124:9d31:3581])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:b81:b0:119:e56b:989b
 with SMTP id a92af1059eb24-126f4780cc5mr128964c88.2.1770143236840; Tue, 03
 Feb 2026 10:27:16 -0800 (PST)
Date: Tue,  3 Feb 2026 10:26:38 -0800
In-Reply-To: <20260203182640.3911987-1-irogers@google.com>
Mime-Version: 1.0
References: <aYIOMWb2sijXzSDm@x1> <20260203182640.3911987-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203182640.3911987-4-irogers@google.com>
Subject: [PATCH v3 3/5] perf session: Add e_flags to the e_machine helper
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
X-CRM114-CacheID: sfid-20260203_102718_327625_12980F3B 
X-CRM114-Status: GOOD (  19.32  )
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

Allow e_flags as well as e_machine to be computed using the e_machine
helper. This isn't currently used, the argument is always NULL, but it
will be used for a new header feature.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-kvm.c    |  9 +++++----
 tools/perf/builtin-report.c |  4 ++--
 tools/perf/builtin-script.c |  6 ++++--
 tools/perf/util/evsel.c     |  6 +++---
 tools/perf/util/evsel.h     |  2 +-
 tools/perf/util/kvm-stat.c  | 12 ++++++++---
 tools/perf/util/session.c   | 40 +++++++++++++++++++++++++++----------
 tools/perf/util/session.h   |  2 +-
 8 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/tools/perf/builtin-kvm.c b/tools/perf/builtin-kvm.c
index 93ba07c58290..0c5e6b3aac74 100644
--- a/tools/perf/builtin-kvm.c
+++ b/tools/perf/builtin-kvm.c
@@ -902,7 +902,7 @@ static bool handle_end_event(struct perf_kvm_stat *kvm,
 
 	if (kvm->duration && time_diff > kvm->duration) {
 		char decode[KVM_EVENT_NAME_LEN];
-		uint16_t e_machine = perf_session__e_machine(kvm->session);
+		uint16_t e_machine = perf_session__e_machine(kvm->session, /*e_flags=*/NULL);
 
 		kvm->events_ops->decode_key(kvm, &event->key, decode);
 		if (!skip_event(e_machine, decode)) {
@@ -1187,7 +1187,7 @@ static int cpu_isa_config(struct perf_kvm_stat *kvm)
 		return -EINVAL;
 	}
 
-	e_machine = perf_session__e_machine(kvm->session);
+	e_machine = perf_session__e_machine(kvm->session, /*e_flags=*/NULL);
 	err = cpu_isa_init(kvm, e_machine, cpuid);
 	if (err == -ENOTSUP)
 		pr_err("CPU %s is not supported.\n", cpuid);
@@ -1549,7 +1549,7 @@ static int kvm_live_open_events(struct perf_kvm_stat *kvm)
 static int read_events(struct perf_kvm_stat *kvm)
 {
 	int ret;
-
+	uint16_t e_machine;
 	struct perf_data file = {
 		.path  = kvm->file_name,
 		.mode  = PERF_DATA_MODE_READ,
@@ -1574,7 +1574,8 @@ static int read_events(struct perf_kvm_stat *kvm)
 		goto out_delete;
 	}
 
-	if (!register_kvm_events_ops(kvm, perf_session__e_machine(kvm->session))) {
+	e_machine = perf_session__e_machine(kvm->session, /*e_flags=*/NULL);
+	if (!register_kvm_events_ops(kvm, e_machine)) {
 		ret = -EINVAL;
 		goto out_delete;
 	}
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 810ffd66b11c..3b81f4b3dc49 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -448,7 +448,7 @@ static int report__setup_sample_type(struct report *rep)
 		}
 	}
 
-	callchain_param_setup(sample_type, perf_session__e_machine(session));
+	callchain_param_setup(sample_type, perf_session__e_machine(session, /*e_flags=*/NULL));
 
 	if (rep->stitch_lbr && (callchain_param.record_mode != CALLCHAIN_LBR)) {
 		ui__warning("Can't find LBR callchain. Switch off --stitch-lbr.\n"
@@ -1296,7 +1296,7 @@ static int process_attr(const struct perf_tool *tool __maybe_unused,
 	 */
 	sample_type = evlist__combined_sample_type(*pevlist);
 	session = (*pevlist)->session;
-	callchain_param_setup(sample_type, perf_session__e_machine(session));
+	callchain_param_setup(sample_type, perf_session__e_machine(session, /*e_flags=*/NULL));
 	return 0;
 }
 
diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index c7d5a325b5cb..14c6f6c3c4f2 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -2818,6 +2818,7 @@ static int process_attr(const struct perf_tool *tool, union perf_event *event,
 	struct perf_script *scr = container_of(tool, struct perf_script, tool);
 	struct evlist *evlist;
 	struct evsel *evsel, *pos;
+	uint16_t e_machine;
 	u64 sample_type;
 	int err;
 
@@ -2859,7 +2860,8 @@ static int process_attr(const struct perf_tool *tool, union perf_event *event,
 	 * on events sample_type.
 	 */
 	sample_type = evlist__combined_sample_type(evlist);
-	callchain_param_setup(sample_type, perf_session__e_machine(evsel__session(evsel)));
+	e_machine = perf_session__e_machine(evsel__session(evsel), /*e_flags=*/NULL);
+	callchain_param_setup(sample_type, e_machine);
 
 	/* Enable fields for callchain entries */
 	if (symbol_conf.use_callchain &&
@@ -3834,7 +3836,7 @@ static void script__setup_sample_type(struct perf_script *script)
 	struct perf_session *session = script->session;
 	u64 sample_type = evlist__combined_sample_type(session->evlist);
 
-	callchain_param_setup(sample_type, perf_session__e_machine(session));
+	callchain_param_setup(sample_type, perf_session__e_machine(session, /*e_flags=*/NULL));
 
 	if (script->stitch_lbr && (callchain_param.record_mode != CALLCHAIN_LBR)) {
 		pr_warning("Can't find LBR callchain. Switch off --stitch-lbr.\n"
diff --git a/tools/perf/util/evsel.c b/tools/perf/util/evsel.c
index 848d0faf6698..aff44ffd3ff1 100644
--- a/tools/perf/util/evsel.c
+++ b/tools/perf/util/evsel.c
@@ -1008,11 +1008,11 @@ int evsel__group_desc(struct evsel *evsel, char *buf, size_t size)
 	return ret;
 }
 
-uint16_t evsel__e_machine(struct evsel *evsel)
+uint16_t evsel__e_machine(struct evsel *evsel, uint32_t *e_flags)
 {
 	struct perf_session *session = evsel__session(evsel);
 
-	return session ? perf_session__e_machine(session) : EM_HOST;
+	return perf_session__e_machine(session, e_flags);
 }
 
 static void __evsel__config_callchain(struct evsel *evsel, struct record_opts *opts,
@@ -1050,7 +1050,7 @@ static void __evsel__config_callchain(struct evsel *evsel, struct record_opts *o
 
 	if (param->record_mode == CALLCHAIN_DWARF) {
 		if (!function) {
-			uint16_t e_machine = evsel__e_machine(evsel);
+			uint16_t e_machine = evsel__e_machine(evsel, /*e_flags=*/NULL);
 
 			evsel__set_sample_bit(evsel, REGS_USER);
 			evsel__set_sample_bit(evsel, STACK_USER);
diff --git a/tools/perf/util/evsel.h b/tools/perf/util/evsel.h
index eefb5d569971..a3d754c029a0 100644
--- a/tools/perf/util/evsel.h
+++ b/tools/perf/util/evsel.h
@@ -546,7 +546,7 @@ static inline bool evsel__is_dummy_event(struct evsel *evsel)
 
 struct perf_session *evsel__session(struct evsel *evsel);
 struct perf_env *evsel__env(struct evsel *evsel);
-uint16_t evsel__e_machine(struct evsel *evsel);
+uint16_t evsel__e_machine(struct evsel *evsel, uint32_t *e_flags);
 
 int evsel__store_ids(struct evsel *evsel, struct evlist *evlist);
 
diff --git a/tools/perf/util/kvm-stat.c b/tools/perf/util/kvm-stat.c
index 858b5dbd39f6..27f16810498c 100644
--- a/tools/perf/util/kvm-stat.c
+++ b/tools/perf/util/kvm-stat.c
@@ -6,15 +6,19 @@
 
 bool kvm_exit_event(struct evsel *evsel)
 {
-	return evsel__name_is(evsel, kvm_exit_trace(evsel__e_machine(evsel)));
+	uint16_t e_machine = evsel__e_machine(evsel, /*e_flags=*/NULL);
+
+	return evsel__name_is(evsel, kvm_exit_trace(e_machine));
 }
 
 void exit_event_get_key(struct evsel *evsel,
 			struct perf_sample *sample,
 			struct event_key *key)
 {
+	uint16_t e_machine = evsel__e_machine(evsel, /*e_flags=*/NULL);
+
 	key->info = 0;
-	key->key  = evsel__intval(evsel, sample, kvm_exit_reason(evsel__e_machine(evsel)));
+	key->key  = evsel__intval(evsel, sample, kvm_exit_reason(e_machine));
 }
 
 
@@ -31,7 +35,9 @@ bool exit_event_begin(struct evsel *evsel,
 
 bool kvm_entry_event(struct evsel *evsel)
 {
-	return evsel__name_is(evsel, kvm_entry_trace(evsel__e_machine(evsel)));
+	uint16_t e_machine = evsel__e_machine(evsel, /*e_flags=*/NULL);
+
+	return evsel__name_is(evsel, kvm_entry_trace(e_machine));
 }
 
 bool exit_event_end(struct evsel *evsel,
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index d0053618f540..72e8bb67d740 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2964,27 +2964,47 @@ struct perf_env *perf_session__env(struct perf_session *session)
 	return &session->header.env;
 }
 
-static int perf_session__e_machine_cb(struct thread *thread,
-				      void *arg __maybe_unused)
+struct perf_session__e_machine_cb_args {
+	uint32_t e_flags;
+	uint16_t e_machine;
+	bool need_e_flags;
+};
+
+static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 {
-	uint16_t *result = arg;
+	struct perf_session__e_machine_cb_args *args = _args;
 	struct machine *machine = maps__machine(thread__maps(thread));
 
-	*result = thread__e_machine(thread, machine, /*e_flags=*/NULL);
-	return *result != EM_NONE ? 1 : 0;
+	args->e_machine = thread__e_machine(thread, machine,
+					    args->need_e_flags ? &args->e_flags : NULL);
+	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
 /*
  * Note, a machine may have mixed 32-bit and 64-bit processes and so mixed
  * e_machines. Use thread__e_machine when this matters.
  */
-uint16_t perf_session__e_machine(struct perf_session *session)
+uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags)
 {
-	uint16_t e_machine = EM_NONE;
+	struct perf_session__e_machine_cb_args args = {
+		.e_machine = EM_NONE,
+		.need_e_flags = e_flags != NULL,
+	};
+
+	if (!session) {
+		/* Default to assuming a host machine. */
+		if (e_flags)
+			*e_flags = EF_HOST;
+
+		return EM_HOST;
+	}
 
 	machines__for_each_thread(&session->machines,
-					 perf_session__e_machine_cb,
-					 &e_machine);
+				  perf_session__e_machine_cb,
+				  &args);
+
+	if (e_flags)
+		*e_flags = args.e_flags;
 
-	return e_machine == EM_NONE ? EM_HOST : e_machine;
+	return args.e_machine == EM_NONE ? EM_HOST : args.e_machine;
 }
diff --git a/tools/perf/util/session.h b/tools/perf/util/session.h
index eddc4c630b33..f05f0d4a6c23 100644
--- a/tools/perf/util/session.h
+++ b/tools/perf/util/session.h
@@ -211,6 +211,6 @@ int perf_event__process_finished_round(const struct perf_tool *tool,
 				       struct ordered_events *oe);
 
 struct perf_env *perf_session__env(struct perf_session *session);
-uint16_t perf_session__e_machine(struct perf_session *session);
+uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags);
 
 #endif /* __PERF_SESSION_H */
-- 
2.53.0.rc2.204.g2597b5adb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
