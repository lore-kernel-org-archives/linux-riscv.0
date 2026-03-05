Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D66F513E1
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Mar 2026 22:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:From:Subject:Message-ID:
	References:Mime-Version:In-Reply-To:Date:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=XsufuF3YPa7JncgM6VQrhO72d7tZkIGEIVBCKS6nPjY=; b=wc7Bc+SDr/NKFa32z9kELweMAe
	XKQIKpDE7u8n0ozt3nm4OYG5YhBI6aCKVaVwtLH+TuBm0ppVlrSoeTXHerrjgou8K8IwkIv5Iy14x
	/91Rl2zTCB4ZBDtG1wnPxbCQTb7oVcA9PbmAlA1DRqDKNVOCaIK6DawZ/Y8Qe4dfU1iUzs6ec0Lu+
	OJWtbfgZvPjIyDZyhxyU/JyJS3vPxjLt4iyMw0JFqTcRTvqi0yPwA+F3qmy/Tb3kojXzSkboKPzAN
	qZ1pXofcH1GR47AwN3h4RVDTmxwsM3CCBUSAgvn5eIeX8rbq1Q1vMOIEZZIos9BkafMHSwnczRNkP
	k/fdZ3eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2m-00000002eGX-2kmw;
	Thu, 05 Mar 2026 22:19:44 +0000
Received: from mail-dl1-x124a.google.com ([2607:f8b0:4864:20::124a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyH2k-00000002eFK-1nDu
	for linux-riscv@lists.infradead.org;
	Thu, 05 Mar 2026 22:19:43 +0000
Received: by mail-dl1-x124a.google.com with SMTP id a92af1059eb24-128ba70cc99so1962739c88.0
        for <linux-riscv@lists.infradead.org>; Thu, 05 Mar 2026 14:19:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1772749181; x=1773353981; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=V/5FsEHMS6n6PE3kEHPdT1dcIRmDeXw08dhLTo8bgaQ=;
        b=N3PqVz7M75ExeU5BMOm4IJNyWTFtJPEydoBIJv57s/IB6f+uy0xQppHZIgghbJ2SWe
         tO1hhNAIcmJ6ietJOzvtRfJx/PKyR0Aw1mh/0pquzYW3tu0qB1+6q3PNr2uoBHphPeCy
         6II7pEh0IIZ5s8sGb814guu3Ro6i7O7te/Swv/yWiXQAfyXIIl5LZUqunhNuB43Xh9BD
         2qzGUFSMmb4HDuMwTsdP5SpGIknADJeaaA8me9AKjb6NI4zZBAmybN0mLjvG3mQQYAJN
         ekVuoUdR0IdpUzCEopYp5qSp27/oc4rT+QpRw/fqOiVxamiVT65vBa4/yTErGfJBULze
         gigQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772749181; x=1773353981;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=V/5FsEHMS6n6PE3kEHPdT1dcIRmDeXw08dhLTo8bgaQ=;
        b=bKR459GqeSMFWvndwx+Kd3UfODEOWWHQqDs66jsIbwFTfGSfl7utEkNNQ44ehH5lzk
         zYUkabrXSi7HGQ1A0gL+wSf1MEAfIvJ7RxdnFJR8/qhAybhcS88QYjor3EdJhIDHyM6Z
         z8rodQGTjdxjTzXe5eVmkSmXqJsqp6x+T0ciE4cWsFEjxTXfbH1DLHQbwB3dAu+c27Ag
         lcCIX0qiEmgeUm9eSoZ0+CpK2ZCZAYjU7AtENl5CqlgYCh7hJLZlT9OrK2MmBy8AuMfP
         fHTHJJtCz9azGZYTMUYKSaW8W5inAReF9Nrl8FJHn+wgoZNttZ0TNSz/5ze4rbqWF/8j
         etcg==
X-Forwarded-Encrypted: i=1; AJvYcCXgS2BpFAXQ4jKWtmoWnBATTuUGc5zA0u61DM58BkHglhF5sYH09/NADlNq5vnCnKvEfNErF1dMbhXy3w==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz+DHA8GWMvujLzocVuFUVP/QzNnRyDVWgDFPfoef+deRJghq8j
	IW8Yuedyu/fFgmbAfK2vPulRGn4/9RsCyc6DHorQEtkRnL/BKSHAO9O9/gti9ylMvVIslgoPhlO
	SLUnJhBTzUg==
X-Received: from dlbvv5.prod.google.com ([2002:a05:7022:5f05:b0:128:bb47:9b7])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7022:518:b0:127:5c54:a124
 with SMTP id a92af1059eb24-128c2e8efdbmr5925c88.31.1772749181224; Thu, 05 Mar
 2026 14:19:41 -0800 (PST)
Date: Thu,  5 Mar 2026 14:19:20 -0800
In-Reply-To: <20260305221927.3237145-1-irogers@google.com>
Mime-Version: 1.0
References: <CAP-5=fWVU3ktkGAnZQrjQJf+Z5AtQo73BVUhj-nr3H95GdcEJQ@mail.gmail.com>
 <20260305221927.3237145-1-irogers@google.com>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
Message-ID: <20260305221927.3237145-2-irogers@google.com>
Subject: [PATCH v2 1/8] perf unwind: Refactor get_entries to allow dynamic
 libdw/libunwind selection
From: Ian Rogers <irogers@google.com>
To: irogers@google.com
Cc: 9erthalion6@gmail.com, acme@kernel.org, adrian.hunter@intel.com, 
	alex@ghiti.fr, alexander.shishkin@linux.intel.com, 
	andrew.jones@oss.qualcomm.com, aou@eecs.berkeley.edu, atrajeev@linux.ibm.com, 
	blakejones@google.com, ctshao@google.com, dapeng1.mi@linux.intel.com, 
	howardchu95@gmail.com, james.clark@linaro.org, john.g.garry@oracle.com, 
	jolsa@kernel.org, leo.yan@linux.dev, libunwind-devel@nongnu.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-riscv@lists.infradead.org, 
	mingo@redhat.com, namhyung@kernel.org, palmer@dabbelt.com, 
	peterz@infradead.org, pjw@kernel.org, shimin.guo@skydio.com, 
	tglozar@redhat.com, tmricht@linux.ibm.com, will@kernel.org, yuzhuo@google.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260305_141942_478593_FB94E681 
X-CRM114-Status: GOOD (  26.58  )
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

Currently, both libdw and libunwind define 'unwind__get_entries'. This
causes a duplicate symbol build failure when both are compiled into
perf.

This commit refactors the DWARF unwind post-processing to be
configurable at runtime via the .perfconfig file option
'unwind.style', or using the argument '--unwind-style' in the commands
'perf report', 'perf script' and 'perf inject', in a similar manner to
the addr2line or the disassembler style.

The file 'tools/perf/util/unwind.c' adds the top-level dispatch
function 'unwind__get_entries'. The backend implementations are
renamed to 'libdw__get_entries' and 'libunwind__get_entries'. Both are
attempted as fallbacks if not configured, or if the primary backend
fails.

Fixes: 2e9191573a69 ("perf build: Remove NO_LIBDW_DWARF_UNWIND option")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/builtin-inject.c        |   4 ++
 tools/perf/builtin-report.c        |   4 ++
 tools/perf/builtin-script.c        |   4 ++
 tools/perf/util/Build              |   1 +
 tools/perf/util/symbol_conf.h      |  15 +++++
 tools/perf/util/unwind-libdw.c     |   2 +-
 tools/perf/util/unwind-libunwind.c |   2 +-
 tools/perf/util/unwind.c           | 102 +++++++++++++++++++++++++++++
 tools/perf/util/unwind.h           |  40 +++++------
 9 files changed, 149 insertions(+), 25 deletions(-)
 create mode 100644 tools/perf/util/unwind.c

diff --git a/tools/perf/builtin-inject.c b/tools/perf/builtin-inject.c
index 5b29f4296861..9ad681b3c0dc 100644
--- a/tools/perf/builtin-inject.c
+++ b/tools/perf/builtin-inject.c
@@ -26,6 +26,7 @@
 #include "util/synthetic-events.h"
 #include "util/thread.h"
 #include "util/namespaces.h"
+#include "util/unwind.h"
 #include "util/util.h"
 #include "util/tsc.h"
 
@@ -2539,6 +2540,9 @@ int cmd_inject(int argc, const char **argv)
 		OPT_STRING(0, "guestmount", &symbol_conf.guestmount, "directory",
 			   "guest mount directory under which every guest os"
 			   " instance has a subdir"),
+		OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+			     "unwind styles (libdw,libunwind)",
+			     unwind__option),
 		OPT_BOOLEAN(0, "convert-callchain", &inject.convert_callchain,
 			    "Generate callchains using DWARF and drop register/stack data"),
 		OPT_END()
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 3b81f4b3dc49..ae20c0679990 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -48,6 +48,7 @@
 #include "util/time-utils.h"
 #include "util/auxtrace.h"
 #include "util/units.h"
+#include "util/unwind.h"
 #include "util/util.h" // perf_tip()
 #include "ui/ui.h"
 #include "ui/progress.h"
@@ -1455,6 +1456,9 @@ int cmd_report(int argc, const char **argv)
 	OPT_CALLBACK(0, "addr2line-style", NULL, "addr2line style",
 		     "addr2line styles (libdw,llvm,libbfd,addr2line)",
 		     report_parse_addr2line_config),
+	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+		     "unwind styles (libdw,libunwind)",
+		     unwind__option),
 	OPT_BOOLEAN(0, "demangle", &symbol_conf.demangle,
 		    "Symbol demangling. Enabled by default, use --no-demangle to disable."),
 	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
diff --git a/tools/perf/builtin-script.c b/tools/perf/builtin-script.c
index 9f8b0fd27a0a..b6c7c164d02d 100644
--- a/tools/perf/builtin-script.c
+++ b/tools/perf/builtin-script.c
@@ -63,6 +63,7 @@
 #include <linux/err.h>
 #include "util/dlfilter.h"
 #include "util/record.h"
+#include "util/unwind.h"
 #include "util/util.h"
 #include "util/cgroup.h"
 #include "util/annotate.h"
@@ -4164,6 +4165,9 @@ int cmd_script(int argc, const char **argv)
 			"Enable symbol demangling"),
 	OPT_BOOLEAN(0, "demangle-kernel", &symbol_conf.demangle_kernel,
 			"Enable kernel symbol demangling"),
+	OPT_CALLBACK(0, "unwind-style", NULL, "unwind style",
+		     "unwind styles (libdw,libunwind)",
+		     unwind__option),
 	OPT_STRING(0, "addr2line", &symbol_conf.addr2line_path, "path",
 			"addr2line binary to use for line numbers"),
 	OPT_STRING(0, "time", &script.time_str, "str",
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index bcccad7487a9..6190a8f5b0fa 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -218,6 +218,7 @@ ifndef CONFIG_SETNS
 perf-util-y += setns.o
 endif
 
+perf-util-y += unwind.o
 perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/util/symbol_conf.h b/tools/perf/util/symbol_conf.h
index 71bb17372a6c..25d92bbbfee7 100644
--- a/tools/perf/util/symbol_conf.h
+++ b/tools/perf/util/symbol_conf.h
@@ -9,6 +9,19 @@
 struct strlist;
 struct intlist;
 
+enum unwind_style {
+
+	UNWIND_STYLE_UNKNOWN = 0,
+
+	UNWIND_STYLE_LIBDW,
+
+	UNWIND_STYLE_LIBUNWIND,
+
+};
+
+#define MAX_UNWIND_STYLE (UNWIND_STYLE_LIBUNWIND + 1)
+
+
 enum a2l_style {
 	A2L_STYLE_UNKNOWN = 0,
 	A2L_STYLE_LIBDW,
@@ -80,6 +93,7 @@ struct symbol_conf {
 			*bt_stop_list_str;
 	const char		*addr2line_path;
 	enum a2l_style	addr2line_style[MAX_A2L_STYLE];
+	enum unwind_style unwind_style[MAX_UNWIND_STYLE];
 	unsigned long	time_quantum;
        struct strlist	*dso_list,
 			*comm_list,
@@ -103,3 +117,4 @@ struct symbol_conf {
 extern struct symbol_conf symbol_conf;
 
 #endif // __PERF_SYMBOL_CONF
+
diff --git a/tools/perf/util/unwind-libdw.c b/tools/perf/util/unwind-libdw.c
index 05e8e68bd49c..d8a5b7d54192 100644
--- a/tools/perf/util/unwind-libdw.c
+++ b/tools/perf/util/unwind-libdw.c
@@ -339,7 +339,7 @@ frame_callback(Dwfl_Frame *state, void *arg)
 	       DWARF_CB_ABORT : DWARF_CB_OK;
 }
 
-int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
+int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data,
 			int max_stack,
diff --git a/tools/perf/util/unwind-libunwind.c b/tools/perf/util/unwind-libunwind.c
index cb8be6acfb6f..a0016b897dae 100644
--- a/tools/perf/util/unwind-libunwind.c
+++ b/tools/perf/util/unwind-libunwind.c
@@ -79,7 +79,7 @@ void unwind__finish_access(struct maps *maps)
 		ops->finish_access(maps);
 }
 
-int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
+int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			 struct thread *thread,
 			 struct perf_sample *data, int max_stack,
 			 bool best_effort)
diff --git a/tools/perf/util/unwind.c b/tools/perf/util/unwind.c
new file mode 100644
index 000000000000..9ae7d5ad246d
--- /dev/null
+++ b/tools/perf/util/unwind.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "debug.h"
+#include "symbol_conf.h"
+#include "unwind.h"
+#include <linux/string.h>
+#include <string.h>
+#include <stdlib.h>
+
+int unwind__get_entries(unwind_entry_cb_t cb __maybe_unused, void *arg __maybe_unused,
+			struct thread *thread __maybe_unused,
+			struct perf_sample *data __maybe_unused,
+			int max_stack __maybe_unused,
+			bool best_effort __maybe_unused)
+{
+	int ret = 0;
+
+#if defined(HAVE_LIBDW_SUPPORT) || defined(HAVE_LIBUNWIND_SUPPORT)
+	if (symbol_conf.unwind_style[0] == UNWIND_STYLE_UNKNOWN) {
+		int i = 0;
+#ifdef HAVE_LIBDW_SUPPORT
+		symbol_conf.unwind_style[i++] = UNWIND_STYLE_LIBDW;
+#endif
+#ifdef HAVE_LIBUNWIND_SUPPORT
+		symbol_conf.unwind_style[i++] = UNWIND_STYLE_LIBUNWIND;
+#endif
+	}
+#endif //defined(HAVE_LIBDW_SUPPORT) || defined(HAVE_LIBUNWIND_SUPPORT)
+
+	for (size_t i = 0; i < ARRAY_SIZE(symbol_conf.unwind_style); i++) {
+		switch (symbol_conf.unwind_style[i]) {
+		case UNWIND_STYLE_LIBDW:
+#ifdef HAVE_LIBDW_SUPPORT
+			ret = libdw__get_entries(cb, arg, thread, data, max_stack, best_effort);
+#endif
+			break;
+		case UNWIND_STYLE_LIBUNWIND:
+#ifdef HAVE_LIBUNWIND_SUPPORT
+			ret = libunwind__get_entries(cb, arg, thread, data, max_stack, best_effort);
+#endif
+			break;
+		case UNWIND_STYLE_UNKNOWN:
+		default:
+#if !defined(HAVE_LIBDW_SUPPORT) && !defined(HAVE_LIBUNWIND_SUPPORT)
+			pr_warning_once(
+				"Error: dwarf unwinding not supported, build perf with libdw or libunwind.\n");
+#endif
+			ret = -1;
+			break;
+		}
+		if (ret == 0)
+			break;
+	}
+	return ret;
+}
+
+int unwind__configure(const char *var, const char *value, void *cb __maybe_unused)
+{
+	static const char * const unwind_style_names[] = {
+		[UNWIND_STYLE_LIBDW] = "libdw",
+		[UNWIND_STYLE_LIBUNWIND] = "libunwind",
+		NULL
+	};
+	char *s, *p, *saveptr;
+	size_t i = 0;
+
+	if (strcmp(var, "unwind.style"))
+		return 0;
+
+	if (!value)
+		return -1;
+
+	s = strdup(value);
+	if (!s)
+		return -1;
+
+	p = strtok_r(s, ",", &saveptr);
+	while (p && i < ARRAY_SIZE(symbol_conf.unwind_style)) {
+		bool found = false;
+		char *q = strim(p);
+
+		for (size_t j = UNWIND_STYLE_LIBDW; j < MAX_UNWIND_STYLE; j++) {
+			if (!strcasecmp(q, unwind_style_names[j])) {
+				symbol_conf.unwind_style[i++] = j;
+				found = true;
+				break;
+			}
+		}
+		if (!found)
+			pr_warning("Unknown unwind style: %s\n", q);
+		p = strtok_r(NULL, ",", &saveptr);
+	}
+
+	free(s);
+	return 0;
+}
+
+int unwind__option(const struct option *opt __maybe_unused,
+		   const char *arg,
+		   int unset __maybe_unused)
+{
+	return unwind__configure("unwind.style", arg, NULL);
+}
diff --git a/tools/perf/util/unwind.h b/tools/perf/util/unwind.h
index 9f7164c6d9aa..581d042e170a 100644
--- a/tools/perf/util/unwind.h
+++ b/tools/perf/util/unwind.h
@@ -7,6 +7,7 @@
 #include "util/map_symbol.h"
 
 struct maps;
+struct option;
 struct perf_sample;
 struct thread;
 
@@ -26,7 +27,9 @@ struct unwind_libunwind_ops {
 			   struct perf_sample *data, int max_stack, bool best_effort);
 };
 
-#ifdef HAVE_DWARF_UNWIND_SUPPORT
+int unwind__configure(const char *var, const char *value, void *cb);
+int unwind__option(const struct option *opt, const char *arg, int unset);
+
 /*
  * When best_effort is set, don't report errors and fail silently. This could
  * be expanded in the future to be more permissive about things other than
@@ -36,8 +39,20 @@ int unwind__get_entries(unwind_entry_cb_t cb, void *arg,
 			struct thread *thread,
 			struct perf_sample *data, int max_stack,
 			bool best_effort);
-/* libunwind specific */
+
+#ifdef HAVE_LIBDW_SUPPORT
+int libdw__get_entries(unwind_entry_cb_t cb, void *arg,
+		       struct thread *thread,
+		       struct perf_sample *data, int max_stack,
+		       bool best_effort);
+#endif
+
 #ifdef HAVE_LIBUNWIND_SUPPORT
+/* libunwind specific */
+int libunwind__get_entries(unwind_entry_cb_t cb, void *arg,
+			   struct thread *thread,
+			   struct perf_sample *data, int max_stack,
+			   bool best_effort);
 #ifndef LIBUNWIND__ARCH_REG_ID
 #define LIBUNWIND__ARCH_REG_ID(regnum) libunwind__arch_reg_id(regnum)
 #endif
@@ -57,26 +72,5 @@ static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
 static inline void unwind__flush_access(struct maps *maps __maybe_unused) {}
 static inline void unwind__finish_access(struct maps *maps __maybe_unused) {}
 #endif
-#else
-static inline int
-unwind__get_entries(unwind_entry_cb_t cb __maybe_unused,
-		    void *arg __maybe_unused,
-		    struct thread *thread __maybe_unused,
-		    struct perf_sample *data __maybe_unused,
-		    int max_stack __maybe_unused,
-		    bool best_effort __maybe_unused)
-{
-	return 0;
-}
-
-static inline int unwind__prepare_access(struct maps *maps __maybe_unused,
-					 struct map *map __maybe_unused,
-					 bool *initialized __maybe_unused)
-{
-	return 0;
-}
 
-static inline void unwind__flush_access(struct maps *maps __maybe_unused) {}
-static inline void unwind__finish_access(struct maps *maps __maybe_unused) {}
-#endif /* HAVE_DWARF_UNWIND_SUPPORT */
 #endif /* __UNWIND_H */
-- 
2.53.0.473.g4a7958ca14-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
