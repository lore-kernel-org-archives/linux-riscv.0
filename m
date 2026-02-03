Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43C0AE87852
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Feb 2026 18:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=hxmU/4EVgLYHeG5s72UoPGl86rFksC4epHgUtIF9tFM=; b=Z/C1TnTQkxoYZ7cqAaLfDaPomn
	BnSH5PvsG35Yne/v8SMlo9n0Umif9De/KFUIeEOG5hmAQArT/Oebtj5hUEECdOGh5YSZXYIXq1+B9
	ot//2znWyOfTFOZiqkZUgqThfR4l4eVnTkD0pELVITYxslwmKnLJtf/Gcm2ZrVVU7A3vmZuxEXD2m
	Eff3gwRcKeWyArYrGjZdPCwJYNTle7F65AaqYKxEzjjGKYFrKOnm1Zu8z3mwqJllKm5imoExcsqV4
	Zqa9kfEVqTUb4ih1DfzAVLcooOYV75S7NbrAE1QJiYkMBUJdSHSY2O49M2aN0gqpwdlNejX5eJAt0
	qlc1h2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7V-000000078Zm-0wec;
	Tue, 03 Feb 2026 18:27:25 +0000
Received: from mail-dy1-x134a.google.com ([2607:f8b0:4864:20::134a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnL7T-000000078Wv-0cV9
	for linux-riscv@lists.infradead.org;
	Tue, 03 Feb 2026 18:27:24 +0000
Received: by mail-dy1-x134a.google.com with SMTP id 5a478bee46e88-2b7eddde359so3667565eec.0
        for <linux-riscv@lists.infradead.org>; Tue, 03 Feb 2026 10:27:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770143242; x=1770748042; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yIM5+Of9W90WeHpl1KAdtOvtvkuL79tdVDHtpDNPDbc=;
        b=oVabcAYlgngTPTlhsmtFHQVtMTxmn9aB3mjtBaf2BEyjutTvk/wTii11sXLM4hiUEd
         NdSUrFMPqqAMlxUHRxVXu8vqPhS1CivRnEj9OQx2dkWmvkRk+ppdEFrxlRJebAhAS3y5
         CfoMoAswevQaQ/oTjCjPXtegLlb/3kTrsM+0Xzz0fMzzSTLOCVhSpjSKhSDzwFx3hL4y
         iDXgH9qE9kgfScFRFYIdu46PbV2y7sRQrq+y/L/cWqT6u6+/rfxIKsK/1aYSaIkcGXCe
         Rdt+cJ9VRQBLDwJ6QIS4RHKgNMgAwiwX5wXGay69p1t4G2b/bot1O83zQ5I7zw6gVz51
         LBgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770143242; x=1770748042;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yIM5+Of9W90WeHpl1KAdtOvtvkuL79tdVDHtpDNPDbc=;
        b=DZVIcQu167jK4Ww9tqQkoimV0Tz7DPOPzEbuCu3vuIOnePBJ+sMsI/6pD0tdW8MPK2
         hcirF2HSCcWJ4zLDxlVUM/u5gf8lt/pdbc5U8pyll4hiGR07qC/rHPnH/gNareTfETu4
         UjtVXtW5o8G2bsGlVkiTLcOPyArZmoCd0mYmHn+fL/tLWXcSqL0rmxMfvu+vXQXEuLda
         A/MyQ6zA38z4g9RmM/DOUFQtR1iH1NxxQkMXHQELu+VGrZ7qT/DxVMtpIjIXAth9Ax+a
         xgOOqCYQ8GbWjBEemoEcAHk87yzRYHtUWJbekc+cBlSWqLxnco9WZiiesLkETXiDfzou
         FqiQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBiUGnlvkDGI9K6EP9G0zWPzxZe0Le6Zp/uHD+Fc+j0n3a5t3AnLBpRCjq5YqbCerCGGr2hPo6sFTKgg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxj7sCPiwdBgwb2KowQsPrgKUT8otuPySv+DKTvuns0OLktOGb/
	NKMm141Q8GZ6q4+FYEQz6e3c6xhARRbigDn6gMeM5VeYdZ/bkPNS2EUe7o9rnHyFoDoPFs9Pj8O
	qH0ni4e8iXA==
X-Received: from dyaw27-n1.prod.google.com ([2002:a05:693c:415b:10b0:2b0:5041:8a8b])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:7bc2:b0:2b7:18eb:a0b9
 with SMTP id 5a478bee46e88-2b8329b3935mr163770eec.43.1770143242111; Tue, 03
 Feb 2026 10:27:22 -0800 (PST)
Date: Tue,  3 Feb 2026 10:26:39 -0800
In-Reply-To: <20260203182640.3911987-1-irogers@google.com>
Mime-Version: 1.0
References: <aYIOMWb2sijXzSDm@x1> <20260203182640.3911987-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.rc2.204.g2597b5adb4-goog
Message-ID: <20260203182640.3911987-5-irogers@google.com>
Subject: [PATCH v3 4/5] perf header: Add e_machine/e_flags to the header
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
X-CRM114-CacheID: sfid-20260203_102723_190615_5499675D 
X-CRM114-Status: GOOD (  19.67  )
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

Add 64-bits of feature data to record the ELF machine and flags. This
allows readers to initialize based on the data. For example, `perf kvm
stat` wants to initialize based on the kind of data to be read, but at
initialization time there are no threads to base this data upon and
using the host means cross platform support won't work. The values in
the perf_env also act as a cache for these within the session.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/env.h     |  3 +++
 tools/perf/util/header.c  | 33 +++++++++++++++++++++++++++++++++
 tools/perf/util/header.h  |  1 +
 tools/perf/util/session.c | 33 +++++++++++++++++++++++++++------
 4 files changed, 64 insertions(+), 6 deletions(-)

diff --git a/tools/perf/util/env.h b/tools/perf/util/env.h
index 76ba1a36e9ff..a4501cbca375 100644
--- a/tools/perf/util/env.h
+++ b/tools/perf/util/env.h
@@ -74,6 +74,9 @@ struct perf_env {
 	char			*os_release;
 	char			*version;
 	char			*arch;
+	/* e_machine expanded from 16 to 32-bits for alignment. */
+	u32			e_machine;
+	u32			e_flags;
 	int			nr_cpus_online;
 	int			nr_cpus_avail;
 	char			*cpu_desc;
diff --git a/tools/perf/util/header.c b/tools/perf/util/header.c
index 31c3bab1b10a..9142a8ba4019 100644
--- a/tools/perf/util/header.c
+++ b/tools/perf/util/header.c
@@ -379,6 +379,21 @@ static int write_arch(struct feat_fd *ff,
 	return do_write_string(ff, uts.machine);
 }
 
+static int write_e_machine(struct feat_fd *ff,
+			   struct evlist *evlist __maybe_unused)
+{
+	/* e_machine expanded from 16 to 32-bits for alignment. */
+	uint32_t e_flags;
+	uint32_t e_machine = perf_session__e_machine(evlist->session, &e_flags);
+	int ret;
+
+	ret = do_write(ff, &e_machine, sizeof(e_machine));
+	if (ret)
+		return ret;
+
+	return do_write(ff, &e_flags, sizeof(e_flags));
+}
+
 static int write_version(struct feat_fd *ff,
 			 struct evlist *evlist __maybe_unused)
 {
@@ -1785,6 +1800,12 @@ static void print_arch(struct feat_fd *ff, FILE *fp)
 	fprintf(fp, "# arch : %s\n", ff->ph->env.arch);
 }
 
+static void print_e_machine(struct feat_fd *ff, FILE *fp)
+{
+	fprintf(fp, "# e_machine : %u\n", ff->ph->env.e_machine);
+	fprintf(fp, "#   e_flags : %u\n", ff->ph->env.e_flags);
+}
+
 static void print_cpudesc(struct feat_fd *ff, FILE *fp)
 {
 	fprintf(fp, "# cpudesc : %s\n", ff->ph->env.cpu_desc);
@@ -2612,6 +2633,17 @@ FEAT_PROCESS_STR_FUN(arch, arch);
 FEAT_PROCESS_STR_FUN(cpudesc, cpu_desc);
 FEAT_PROCESS_STR_FUN(cpuid, cpuid);
 
+static int process_e_machine(struct feat_fd *ff, void *data __maybe_unused)
+{
+	int ret;
+
+	ret = do_read_u32(ff, &ff->ph->env.e_machine);
+	if (ret)
+		return ret;
+
+	return do_read_u32(ff, &ff->ph->env.e_flags);
+}
+
 #ifdef HAVE_LIBTRACEEVENT
 static int process_tracing_data(struct feat_fd *ff, void *data)
 {
@@ -3730,6 +3762,7 @@ const struct perf_header_feature_ops feat_ops[HEADER_LAST_FEATURE] = {
 	FEAT_OPN(HYBRID_TOPOLOGY,	hybrid_topology,	true),
 	FEAT_OPR(PMU_CAPS,	pmu_caps,	false),
 	FEAT_OPR(CPU_DOMAIN_INFO,	cpu_domain_info,	true),
+	FEAT_OPR(E_MACHINE,	e_machine,	false),
 };
 
 struct header_print_data {
diff --git a/tools/perf/util/header.h b/tools/perf/util/header.h
index 36cc74e2d14d..cc40ac796f52 100644
--- a/tools/perf/util/header.h
+++ b/tools/perf/util/header.h
@@ -54,6 +54,7 @@ enum {
 	HEADER_HYBRID_TOPOLOGY,
 	HEADER_PMU_CAPS,
 	HEADER_CPU_DOMAIN_INFO,
+	HEADER_E_MACHINE,
 	HEADER_LAST_FEATURE,
 	HEADER_FEAT_BITS	= 256,
 };
diff --git a/tools/perf/util/session.c b/tools/perf/util/session.c
index 72e8bb67d740..53f51c3f9603 100644
--- a/tools/perf/util/session.c
+++ b/tools/perf/util/session.c
@@ -2967,7 +2967,6 @@ struct perf_env *perf_session__env(struct perf_session *session)
 struct perf_session__e_machine_cb_args {
 	uint32_t e_flags;
 	uint16_t e_machine;
-	bool need_e_flags;
 };
 
 static int perf_session__e_machine_cb(struct thread *thread, void *_args)
@@ -2975,8 +2974,7 @@ static int perf_session__e_machine_cb(struct thread *thread, void *_args)
 	struct perf_session__e_machine_cb_args *args = _args;
 	struct machine *machine = maps__machine(thread__maps(thread));
 
-	args->e_machine = thread__e_machine(thread, machine,
-					    args->need_e_flags ? &args->e_flags : NULL);
+	args->e_machine = thread__e_machine(thread, machine, &args->e_flags);
 	return args->e_machine != EM_NONE ? 1 : 0;
 }
 
@@ -2988,8 +2986,8 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 {
 	struct perf_session__e_machine_cb_args args = {
 		.e_machine = EM_NONE,
-		.need_e_flags = e_flags != NULL,
 	};
+	struct perf_env *env;
 
 	if (!session) {
 		/* Default to assuming a host machine. */
@@ -2999,12 +2997,35 @@ uint16_t perf_session__e_machine(struct perf_session *session, uint32_t *e_flags
 		return EM_HOST;
 	}
 
+	env = perf_session__env(session);
+	if (env && env->e_machine != EM_NONE) {
+		if (e_flags)
+			*e_flags = env->e_flags;
+
+		return env->e_machine;
+	}
+
 	machines__for_each_thread(&session->machines,
 				  perf_session__e_machine_cb,
 				  &args);
 
+	if (args.e_machine != EM_NONE) {
+		if (env) {
+			env->e_machine = args.e_machine;
+			env->e_flags = args.e_flags;
+		}
+		if (e_flags)
+			*e_flags = args.e_flags;
+
+		return args.e_machine;
+	}
+
+	/*
+	 * Couldn't determine from the perf_env or current set of
+	 * threads. Default to the host.
+	 */
 	if (e_flags)
-		*e_flags = args.e_flags;
+		*e_flags = EF_HOST;
 
-	return args.e_machine == EM_NONE ? EM_HOST : args.e_machine;
+	return EM_HOST;
 }
-- 
2.53.0.rc2.204.g2597b5adb4-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
