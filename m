Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8682FCFB43C
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IO7eKtJBQ+GURQ8bLnpF9KpQ5UcimHuVAPKp0/7vpVE=; b=vtafeNsJa+KQa1
	fwDFlzxYTVKaKd9E0oZlmZbVv+kvImhG2nrwHgqduvbbtIwqEV2K0Ey/xgO1mY3M6oCok6GWtUkW9
	7J5UyMlecqEL4skRmti/pKTi4du2Swrk+C6yD+Ffm0w+YyQVODiWQPsZ6WTFhfK7Paz46fmqXPZQW
	Nuf8zwGox4LoV5H3gX9AF719+5uBXGvkYfxewUhfKXjDKxiEflsm1nlqis5TYefbOeQCSyORxf8Gs
	PnqjvRICf3VZdTTU/sSvfgvvzA2cw4tv1WJkrtfu9DHIb0b+8E4cD5b0W38enGaBpEDexIkTDp7bN
	8x4Hxne6+YgCckZ7iD0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxC9K-0000000FxqV-1s7h;
	Sat, 05 Oct 2024 21:17:14 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAt4-0000000Fq1p-11DT
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:24 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e0b3d35ccfbso3982019276.3
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158181; x=1728762981; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2weo1u6eJab13hudlOmWRO+RLXcMfS57bPP8mqYQr4Q=;
        b=rIlQzJl7yXL789UZDiQueL+3ZTZE6npwyHfaNtv75iZkO65a231UhfFa+30O7syExj
         YuQw+Z3KgUG6CPp3xQ0uJgBDU1sNCZtrTI36i+QIpg/zfSHAG/nVCEOLgwnXKPsgyDwm
         VZvQl9aAaXyoMYPLQthfA9/fLwR1K8dm4m1U83K8O03u+HDnVsIPjCJHw+Da3pddUf0M
         yEb8rLQZeey0Nt5XnFqEaifhBacw8Fa+IMbjByMRFRgaQFYobnj6NpMVP7QCyiqnNrQc
         3DVxdjaNyGImqdC5Hj6wf81frbAbzJF180too12d1Yab+vl/OYPBMR9jXzcc9E3W8u19
         fO6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158181; x=1728762981;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2weo1u6eJab13hudlOmWRO+RLXcMfS57bPP8mqYQr4Q=;
        b=VUkWNM4U+xpoweSVLXXWCygdzcAiyq/TrwMLhw7ul9LoTLEGriqo2IEnbnGU2798mP
         wwB3YQkgDyiPZAMh3lfdLUjo+D/2gUZzYVv764GEUPtMJLt6ZNo+8yGz8D0E8RtboBnW
         K2ziKK0C2YGEvYe6DOo5dFjVPUtBvWUSIKDZuEcMZRQabLV2FJ0F4ktfb6PXXX+3vqEC
         7oiD5RJBwTvxZDDjGVhPBp65KKbz1x4JeFeyPCrogmWRSyRPRa1BTmhD0xfC1iLYcfLL
         s/CSK9F2W241XyMDndnQLN8hNA9hoLF1Sdvuze155DtbNbNDmCCktckX9x7NszI+dZsc
         DeOw==
X-Forwarded-Encrypted: i=1; AJvYcCWIAUncOAQ2SohvK+e8GOOsXCyH95Jm6LOBDlIz7pBuZ/22MAMa9EJHM6lJhFaoxiIFgXJafGAfSoc+8g==@lists.infradead.org
X-Gm-Message-State: AOJu0YwjjZDo8Srg70ZyLxffOf1QVdnI3jZLOUSAkmmYijrkrIsXk9oQ
	IfGWMPW6cYCTl6SwEsVfqzEU2TgZZdVYIuHtj9VxdERENNj2G71wf3wO/IZ7HsDNbq57kakwG+8
	QvA0ueQ==
X-Google-Smtp-Source: AGHT+IGTVKp5glYfe2LcW/QBGKVgQh88dtHx+qbHTcL04F4exiXlFCRXn1VDeNIb6C1tqNw4F+4YBmNj+fNW
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:c54e:0:b0:e25:17cb:352e with SMTP id
 3f1490d57ef6-e2893939e1cmr3895276.9.1728158180743; Sat, 05 Oct 2024 12:56:20
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:20 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-11-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 10/31] perf build: Rename HAVE_DWARF_SUPPORT to HAVE_LIBDW_SUPPORT
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
	"Steven Rostedt (Google)" <rostedt@goodmis.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Guilherme Amadio <amadio@gentoo.org>, Changbin Du <changbin.du@huawei.com>, 
	Daniel Bristot de Oliveira <bristot@kernel.org>, Daniel Wagner <dwagner@suse.de>, 
	Aditya Gupta <adityag@linux.ibm.com>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Kajol Jain <kjain@linux.ibm.com>, 
	Huacai Chen <chenhuacai@kernel.org>, Bibo Mao <maobibo@loongson.cn>, 
	Anup Patel <anup@brainfault.org>, Atish Patra <atishp@rivosinc.com>, 
	Shenlin Liang <liangshenlin@eswincomputing.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Steinar H. Gunderson" <sesse@google.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Chen Pei <cp0613@linux.alibaba.com>, Dima Kogan <dima@secretsauce.net>, 
	Yury Norov <yury.norov@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241005_125622_348465_21AB569F 
X-CRM114-Status: GOOD (  17.09  )
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
index db79b25ada6f..9ed0909db170 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -556,7 +556,7 @@ ifndef NO_LIBELF
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
index 426cbc9110d1..13cc57e99d35 100644
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
@@ -1701,7 +1701,7 @@ int cmd_report(int argc, const char **argv)
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
index a17c9b8a7a79..fd94614a4022 100644
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
index f0149d72310c..b9a5afca4cc1 100644
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
