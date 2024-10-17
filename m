Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B23ED2F7DA
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 01:46:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z4ojiUr2pgMksK2lrjioZhELyT4jHmjOf0kagpjlvXU=; b=qV+I0uR1Mo1rVo
	51Gt2dByJkvUAGo+sB86l/9IqmALL8WfOHOlPzlDPCCVSyeZ9wUENg0opxIYNOqQm6/ezrnve6G7X
	xoTw0Q9MEsJ+PTyrKPyseEnHLOgn8PM61dyW8iAHZGLDFcUCTfWdlt07LNmA0DVeEA6fvj1TW9J0H
	UgI6/qw5F6uITHjiEFopgXHA7bydrlTgwYwEl0fT2jDapXKH7i6DwjhmCcmlCcS8lSQ6trVVq9E/F
	NrI8r3O/RnqX64lNzD/2/YQWQUcyXMWZ40Aw4dhweq7Ux1DhIoCbbWghxpVodj7TKWRyz5iMCM8gj
	DwOp3obZ6VUUzAL5s4KA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1FaN-0000000DTGL-0YR4;
	Thu, 17 Oct 2024 01:45:55 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9t-0000000DIJZ-12iE
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:31 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e1fbe2a6b1so8999487b3.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124068; x=1729728868; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1qh2zjK+x7XBUWzGHdV6OoNs12UKt+cT6XlR5rxtiUA=;
        b=SMS36TFtPfnQTTmcPihiaD+CkePksGHXeXSoc79Fvl06hwBjXX01J/YTZ45Ej129o6
         2uK5T9hF1O/V+eHSV39eEXDZrCsCBCcM5BgDSAHE6fk4Fyfymv/sGe/Z41Vi1GP7/dCb
         LeY0LxkutD62cfgaTBRGR9jnriLSGC95XdmPaiVkHtnjACkv92oZt/Hs7AYod2uKSjcU
         gEPZDel8m9xo6NdOxoNI3sS03iyoffa1Ma9mvDVcViT0wuc57E1IziGqf5KT12/6Z5Y3
         GoP6uITa+WwaJalQJ6HTXDofecPuIkJ/pX8781izHPbmByxlRRrgwg+0F25Av6Kt06RW
         8ADw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124068; x=1729728868;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1qh2zjK+x7XBUWzGHdV6OoNs12UKt+cT6XlR5rxtiUA=;
        b=jBZXn4FZeoR7cHg8g0L87nYdpq4IHeOqikV/SFi4TgH4Vk7BVK9p2yJrVjR5ejDF1L
         1q4SvBVRPayp91XeybCosyLihHlGgTe19lUjWZo1c0qNjqdj4Zip7oLuv6CWP2DBhINN
         QDCjJ3qP6hcj4LJ6ZTUsKH9Hnjl1kaA4jOyMFg1f9eJ67L3G9AxSJXPM+P7+ivhMYTGp
         kBXdm472H2QoiR2WsnmjzA32CNWlm1SpFogqneWoholApWuV9hsD6glmJXb7AY5Tygbo
         O/GwS3xNcNtBoB+ylz4UseT5ODUN0lcMR3bQ1DO6d8tXO74Wm3Nx03mMVIZ7D1XuBxV5
         yj9w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ1KRX983spZyP0/pQhRQgrMPAfUEAyJo4dA4OHTvm+kk0ouruIS9kWscZO3wSC/z2JfC01+AIu/4IJA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxpTkT2iivnRLypKUNeMYy+cormAPOWbTwqSjKvjmLJGkZybZrA
	iN91S2r36OVJODOSih9tUHzKJG+dHrxs1l9+xsI8ILHZAXlsD6psHxHiI8H5s/ZhcUtCAqo9ZGV
	rh4PZ4w==
X-Google-Smtp-Source: AGHT+IHtAAWEjwLOSRrE8Z0h7hca1srTS54pxI+wryyHRm20lJxdMRhTmhsocAjNM1mA5T35yVe/pOVDJqw6
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:824f:0:b0:e29:b6d7:20e2 with SMTP id
 3f1490d57ef6-e29b704e8e4mr4569276.0.1729124067417; Wed, 16 Oct 2024 17:14:27
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:53 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-11-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 10/11] perf build: Rename HAVE_DWARF_SUPPORT to HAVE_LIBDW_SUPPORT
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Kan Liang <kan.liang@linux.intel.com>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, James Clark <james.clark@linaro.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nick Terrell <terrelln@fb.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Changbin Du <changbin.du@huawei.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yang Jihong <yangjihong@bytedance.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Atish Patra <atishp@rivosinc.com>, Shenlin Liang <liangshenlin@eswincomputing.com>, 
	Anup Patel <anup@brainfault.org>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, "David S. Miller" <davem@davemloft.net>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_171429_310183_CC709091 
X-CRM114-Status: GOOD (  17.52  )
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

In Makefile.config for unwinding the name dwarf implies either
libunwind or libdw. Make it clearer that HAVE_DWARF_SUPPORT is really
just defined when libdw is present by renaming to HAVE_LIBDW_SUPPORT.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-check.txt         |  6 +++---
 tools/perf/Makefile.config                      |  2 +-
 tools/perf/arch/powerpc/annotate/instructions.c |  4 ++--
 tools/perf/arch/x86/annotate/instructions.c     |  2 +-
 tools/perf/builtin-annotate.c                   |  2 +-
 tools/perf/builtin-check.c                      |  6 +++---
 tools/perf/builtin-probe.c                      | 12 ++++++------
 tools/perf/builtin-report.c                     |  4 ++--
 tools/perf/util/annotate-data.h                 |  8 ++++----
 tools/perf/util/debuginfo.h                     |  6 +++---
 tools/perf/util/disasm.c                        |  4 ++--
 tools/perf/util/disasm.h                        |  4 ++--
 tools/perf/util/genelf.c                        |  4 ++--
 tools/perf/util/genelf.h                        |  2 +-
 tools/perf/util/include/dwarf-regs.h            |  6 +++---
 tools/perf/util/probe-event.c                   |  4 ++--
 tools/perf/util/probe-finder.h                  |  4 ++--
 17 files changed, 40 insertions(+), 40 deletions(-)

diff --git a/tools/perf/Documentation/perf-check.txt b/tools/perf/Documentation/perf-check.txt
index 45101a8e4154..31741499e786 100644
--- a/tools/perf/Documentation/perf-check.txt
+++ b/tools/perf/Documentation/perf-check.txt
@@ -47,15 +47,15 @@ feature::
                 bpf                     /  HAVE_LIBBPF_SUPPORT
                 bpf_skeletons           /  HAVE_BPF_SKEL
                 debuginfod              /  HAVE_DEBUGINFOD_SUPPORT
-                dwarf                   /  HAVE_DWARF_SUPPORT
-                dwarf_getlocations      /  HAVE_DWARF_SUPPORT
+                dwarf                   /  HAVE_LIBDW_SUPPORT
+                dwarf_getlocations      /  HAVE_LIBDW_SUPPORT
                 dwarf-unwind            /  HAVE_DWARF_UNWIND_SUPPORT
                 auxtrace                /  HAVE_AUXTRACE_SUPPORT
                 libaudit                /  HAVE_LIBAUDIT_SUPPORT
                 libbfd                  /  HAVE_LIBBFD_SUPPORT
                 libcapstone             /  HAVE_LIBCAPSTONE_SUPPORT
                 libcrypto               /  HAVE_LIBCRYPTO_SUPPORT
-                libdw-dwarf-unwind      /  HAVE_DWARF_SUPPORT
+                libdw-dwarf-unwind      /  HAVE_LIBDW_SUPPORT
                 libelf                  /  HAVE_LIBELF_SUPPORT
                 libnuma                 /  HAVE_LIBNUMA_SUPPORT
                 libopencsd              /  HAVE_CSTRACE_SUPPORT
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 7dbcf8394f3d..d0ad2919983c 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -559,7 +559,7 @@ ifndef NO_LIBELF
       $(warning DWARF register mappings have not been defined for architecture $(SRCARCH), DWARF support disabled)
       NO_LIBDW := 1
     else
-      CFLAGS += -DHAVE_DWARF_SUPPORT $(LIBDW_CFLAGS)
+      CFLAGS += -DHAVE_LIBDW_SUPPORT $(LIBDW_CFLAGS)
       LDFLAGS += $(LIBDW_LDFLAGS)
       EXTLIBS += ${DWARFLIBS}
       $(call detected,CONFIG_DWARF)
diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index ede9eeade0ab..54478cf5cccc 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -255,7 +255,7 @@ static struct ins_ops *check_ppc_insn(struct disasm_line *dl)
  * is moved to r31. update_insn_state_powerpc tracks these state
  * changes
  */
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 static void update_insn_state_powerpc(struct type_state *state,
 		struct data_loc_info *dloc, Dwarf_Die * cu_die __maybe_unused,
 		struct disasm_line *dl)
@@ -300,7 +300,7 @@ static void update_insn_state_powerpc(struct type_state *state,
 			insn_offset, src->reg1, dst->reg1);
 	pr_debug_type_name(&tsr->type, tsr->kind);
 }
-#endif /* HAVE_DWARF_SUPPORT */
+#endif /* HAVE_LIBDW_SUPPORT */
 
 static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index 5caf5a17f03d..c869abe3c31d 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -207,7 +207,7 @@ static int x86__annotate_init(struct arch *arch, char *cpuid)
 	return err;
 }
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 static void update_insn_state_x86(struct type_state *state,
 				  struct data_loc_info *dloc, Dwarf_Die *cu_die,
 				  struct disasm_line *dl)
diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 04af13eb4a4c..bb87e6e7687d 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -840,7 +840,7 @@ int cmd_annotate(int argc, const char **argv)
 	}
 #endif
 
-#ifndef HAVE_DWARF_SUPPORT
+#ifndef HAVE_LIBDW_SUPPORT
 	if (annotate.data_type) {
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		return -ENOTSUP;
diff --git a/tools/perf/builtin-check.c b/tools/perf/builtin-check.c
index 18c0a815243b..2346536a5ee1 100644
--- a/tools/perf/builtin-check.c
+++ b/tools/perf/builtin-check.c
@@ -27,15 +27,15 @@ struct feature_status supported_features[] = {
 	FEATURE_STATUS("bpf", HAVE_LIBBPF_SUPPORT),
 	FEATURE_STATUS("bpf_skeletons", HAVE_BPF_SKEL),
 	FEATURE_STATUS("debuginfod", HAVE_DEBUGINFOD_SUPPORT),
-	FEATURE_STATUS("dwarf", HAVE_DWARF_SUPPORT),
-	FEATURE_STATUS("dwarf_getlocations", HAVE_DWARF_SUPPORT),
+	FEATURE_STATUS("dwarf", HAVE_LIBDW_SUPPORT),
+	FEATURE_STATUS("dwarf_getlocations", HAVE_LIBDW_SUPPORT),
 	FEATURE_STATUS("dwarf-unwind", HAVE_DWARF_UNWIND_SUPPORT),
 	FEATURE_STATUS("auxtrace", HAVE_AUXTRACE_SUPPORT),
 	FEATURE_STATUS("libaudit", HAVE_LIBAUDIT_SUPPORT),
 	FEATURE_STATUS("libbfd", HAVE_LIBBFD_SUPPORT),
 	FEATURE_STATUS("libcapstone", HAVE_LIBCAPSTONE_SUPPORT),
 	FEATURE_STATUS("libcrypto", HAVE_LIBCRYPTO_SUPPORT),
-	FEATURE_STATUS("libdw-dwarf-unwind", HAVE_DWARF_SUPPORT),
+	FEATURE_STATUS("libdw-dwarf-unwind", HAVE_LIBDW_SUPPORT),
 	FEATURE_STATUS("libelf", HAVE_LIBELF_SUPPORT),
 	FEATURE_STATUS("libnuma", HAVE_LIBNUMA_SUPPORT),
 	FEATURE_STATUS("libopencsd", HAVE_CSTRACE_SUPPORT),
diff --git a/tools/perf/builtin-probe.c b/tools/perf/builtin-probe.c
index 91672bb3047c..69800e4d9530 100644
--- a/tools/perf/builtin-probe.c
+++ b/tools/perf/builtin-probe.c
@@ -229,7 +229,7 @@ static int opt_set_target_ns(const struct option *opt __maybe_unused,
 
 /* Command option callbacks */
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 static int opt_show_lines(const struct option *opt,
 			  const char *str, int unset __maybe_unused)
 {
@@ -505,7 +505,7 @@ static int perf_del_probe_events(struct strfilter *filter)
 	return ret;
 }
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 #define PROBEDEF_STR	\
 	"[EVENT=]FUNC[@SRC][+OFF|%return|:RL|;PT]|SRC:AL|SRC;PT [[NAME=]ARG ...]"
 #else
@@ -521,7 +521,7 @@ __cmd_probe(int argc, const char **argv)
 		"perf probe [<options>] --add 'PROBEDEF' [--add 'PROBEDEF' ...]",
 		"perf probe [<options>] --del '[GROUP:]EVENT' ...",
 		"perf probe --list [GROUP:]EVENT ...",
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 		"perf probe [<options>] --line 'LINEDESC'",
 		"perf probe [<options>] --vars 'PROBEPOINT'",
 #endif
@@ -545,7 +545,7 @@ __cmd_probe(int argc, const char **argv)
 		"\t\tFUNC:\tFunction name\n"
 		"\t\tOFF:\tOffset from function entry (in byte)\n"
 		"\t\t%return:\tPut the probe at function return\n"
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 		"\t\tSRC:\tSource code path\n"
 		"\t\tRL:\tRelative line number from function entry.\n"
 		"\t\tAL:\tAbsolute line number in file.\n"
@@ -612,7 +612,7 @@ __cmd_probe(int argc, const char **argv)
 	set_option_flag(options, 'd', "del", PARSE_OPT_EXCLUSIVE);
 	set_option_flag(options, 'D', "definition", PARSE_OPT_EXCLUSIVE);
 	set_option_flag(options, 'l', "list", PARSE_OPT_EXCLUSIVE);
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 	set_option_flag(options, 'L', "line", PARSE_OPT_EXCLUSIVE);
 	set_option_flag(options, 'V', "vars", PARSE_OPT_EXCLUSIVE);
 #else
@@ -694,7 +694,7 @@ __cmd_probe(int argc, const char **argv)
 		if (ret < 0)
 			pr_err_with_code("  Error: Failed to show functions.", ret);
 		return ret;
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 	case 'L':
 		ret = show_line_range(&params->line_range, params->target,
 				      params->nsi, params->uprobes);
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 2251aa61ea53..45304ee5537c 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -455,7 +455,7 @@ static int report__setup_sample_type(struct report *rep)
 	if (!(evlist__combined_branch_type(session->evlist) & PERF_SAMPLE_BRANCH_ANY))
 		rep->nonany_branch_mode = true;
 
-#if !defined(HAVE_LIBUNWIND_SUPPORT) && !defined(HAVE_DWARF_SUPPORT)
+#if !defined(HAVE_LIBUNWIND_SUPPORT) && !defined(HAVE_LIBDW_SUPPORT)
 	if (dwarf_callchain_users) {
 		ui__warning("Please install libunwind or libdw "
 			    "development packages during the perf build.\n");
@@ -1705,7 +1705,7 @@ int cmd_report(int argc, const char **argv)
 		report.data_type = true;
 		annotate_opts.annotate_src = false;
 
-#ifndef HAVE_DWARF_SUPPORT
+#ifndef HAVE_LIBDW_SUPPORT
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		goto error;
 #endif
diff --git a/tools/perf/util/annotate-data.h b/tools/perf/util/annotate-data.h
index 8ac0fd94a0ba..98c80b2268dd 100644
--- a/tools/perf/util/annotate-data.h
+++ b/tools/perf/util/annotate-data.h
@@ -9,7 +9,7 @@
 #include "dwarf-regs.h"
 #include "annotate.h"
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 #include "debuginfo.h"
 #endif
 
@@ -165,7 +165,7 @@ struct annotated_data_stat {
 };
 extern struct annotated_data_stat ann_data_stat;
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 /*
  * Type information in a register, valid when @ok is true.
  * The @caller_saved registers are invalidated after a function call.
@@ -244,7 +244,7 @@ bool get_global_var_info(struct data_loc_info *dloc, u64 addr,
 				const char **var_name, int *var_offset);
 void pr_debug_type_name(Dwarf_Die *die, enum type_state_kind kind);
 
-#else /* HAVE_DWARF_SUPPORT */
+#else /* HAVE_LIBDW_SUPPORT */
 
 static inline struct annotated_data_type *
 find_data_type(struct data_loc_info *dloc __maybe_unused)
@@ -276,7 +276,7 @@ static inline int hist_entry__annotate_data_tty(struct hist_entry *he __maybe_un
 	return -1;
 }
 
-#endif /* HAVE_DWARF_SUPPORT */
+#endif /* HAVE_LIBDW_SUPPORT */
 
 #ifdef HAVE_SLANG_SUPPORT
 int hist_entry__annotate_data_tui(struct hist_entry *he, struct evsel *evsel,
diff --git a/tools/perf/util/debuginfo.h b/tools/perf/util/debuginfo.h
index ad6422c3f8ca..a52d69932815 100644
--- a/tools/perf/util/debuginfo.h
+++ b/tools/perf/util/debuginfo.h
@@ -5,7 +5,7 @@
 #include <errno.h>
 #include <linux/compiler.h>
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 
 #include "dwarf-aux.h"
 
@@ -25,7 +25,7 @@ void debuginfo__delete(struct debuginfo *dbg);
 int debuginfo__get_text_offset(struct debuginfo *dbg, Dwarf_Addr *offs,
 			       bool adjust_offset);
 
-#else /* HAVE_DWARF_SUPPORT */
+#else /* HAVE_LIBDW_SUPPORT */
 
 /* dummy debug information structure */
 struct debuginfo {
@@ -49,7 +49,7 @@ static inline int debuginfo__get_text_offset(struct debuginfo *dbg __maybe_unuse
 	return -EINVAL;
 }
 
-#endif /* HAVE_DWARF_SUPPORT */
+#endif /* HAVE_LIBDW_SUPPORT */
 
 #ifdef HAVE_DEBUGINFOD_SUPPORT
 int get_source_from_debuginfod(const char *raw_path, const char *sbuild_id,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 2c8063660f2e..aef06a36bf40 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -151,14 +151,14 @@ static struct arch architectures[] = {
 			.memory_ref_char = '(',
 			.imm_char = '$',
 		},
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 		.update_insn_state = update_insn_state_x86,
 #endif
 	},
 	{
 		.name = "powerpc",
 		.init = powerpc__annotate_init,
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 		.update_insn_state = update_insn_state_powerpc,
 #endif
 	},
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index f56beedeb9da..486c269b29ba 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -4,7 +4,7 @@
 
 #include "map_symbol.h"
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 #include "dwarf-aux.h"
 #endif
 
@@ -39,7 +39,7 @@ struct arch {
 		char memory_ref_char;
 		char imm_char;
 	} objdump;
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 	void		(*update_insn_state)(struct type_state *state,
 				struct data_loc_info *dloc, Dwarf_Die *cu_die,
 				struct disasm_line *dl);
diff --git a/tools/perf/util/genelf.c b/tools/perf/util/genelf.c
index c8f6bee1fa61..cdce7f173d00 100644
--- a/tools/perf/util/genelf.c
+++ b/tools/perf/util/genelf.c
@@ -16,7 +16,7 @@
 #include <inttypes.h>
 #include <fcntl.h>
 #include <err.h>
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 #include <dwarf.h>
 #endif
 
@@ -499,7 +499,7 @@ jit_write_elf(int fd, uint64_t load_addr, const char *sym,
 	shdr->sh_size = sizeof(bnote);
 	shdr->sh_entsize = 0;
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 	if (debug && nr_debug_entries) {
 		retval = jit_add_debug_info(e, load_addr, debug, nr_debug_entries);
 		if (retval)
diff --git a/tools/perf/util/genelf.h b/tools/perf/util/genelf.h
index 4e2e4f40e134..9f0b875d6548 100644
--- a/tools/perf/util/genelf.h
+++ b/tools/perf/util/genelf.h
@@ -8,7 +8,7 @@
 int jit_write_elf(int fd, uint64_t code_addr, const char *sym,
 		  const void *code, int csize, void *debug, int nr_debug_entries,
 		  void *unwinding, uint64_t unwinding_header_size, uint64_t unwinding_size);
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 /* genelf_debug.c */
 int jit_add_debug_info(Elf *e, uint64_t code_addr, void *debug, int nr_debug_entries);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 75b28dcc8317..29a7d0546b82 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -6,7 +6,7 @@
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 const char *get_arch_regstr(unsigned int n);
 /*
  * get_dwarf_regstr - Returns ftrace register string from DWARF regnum
@@ -23,7 +23,7 @@ int get_arch_regnum(const char *name);
  */
 int get_dwarf_regnum(const char *name, unsigned int machine);
 
-#else /* HAVE_DWARF_SUPPORT */
+#else /* HAVE_LIBDW_SUPPORT */
 
 static inline int get_dwarf_regnum(const char *name __maybe_unused,
 				   unsigned int machine __maybe_unused)
@@ -32,7 +32,7 @@ static inline int get_dwarf_regnum(const char *name __maybe_unused,
 }
 #endif
 
-#if !defined(__powerpc__) || !defined(HAVE_DWARF_SUPPORT)
+#if !defined(__powerpc__) || !defined(HAVE_LIBDW_SUPPORT)
 static inline void get_powerpc_regs(u32 raw_insn __maybe_unused, int is_source __maybe_unused,
 		struct annotated_op_loc *op_loc __maybe_unused)
 {
diff --git a/tools/perf/util/probe-event.c b/tools/perf/util/probe-event.c
index 698a92875374..1e6628ebd25b 100644
--- a/tools/perf/util/probe-event.c
+++ b/tools/perf/util/probe-event.c
@@ -342,7 +342,7 @@ static char *find_module_name(const char *module)
 	return mod_name;
 }
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 
 static int kernel_get_module_dso(const char *module, struct dso **pdso)
 {
@@ -1250,7 +1250,7 @@ int show_available_vars(struct perf_probe_event *pevs, int npevs,
 	return ret;
 }
 
-#else	/* !HAVE_DWARF_SUPPORT */
+#else	/* !HAVE_LIBDW_SUPPORT */
 
 static void debuginfo_cache__exit(void)
 {
diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
index 5ced3b058fd8..dfcf8cdd9e8d 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -21,7 +21,7 @@ static inline int is_c_varname(const char *name)
 	return isalpha(name[0]) || name[0] == '_';
 }
 
-#ifdef HAVE_DWARF_SUPPORT
+#ifdef HAVE_LIBDW_SUPPORT
 
 #include "dwarf-aux.h"
 #include "debuginfo.h"
@@ -102,6 +102,6 @@ struct line_finder {
 	int			found;
 };
 
-#endif /* HAVE_DWARF_SUPPORT */
+#endif /* HAVE_LIBDW_SUPPORT */
 
 #endif /*_PROBE_FINDER_H */
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
