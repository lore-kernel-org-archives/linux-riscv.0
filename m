Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 863CFCFB42B
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 20:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwDh1ERzpRIiMogyoNVnApQwPjLhNbjNy7q0wlxlNkk=; b=33iZRMKLkigfLt
	7vNEQkXNyUcxWBIVVC3gWQy4jDCBP0IiDOLiYMXJU+IAXjXra7zqrmf6rHIrzGsE0IzTVZrkgubxx
	ezZQCx2H51lhrzDy+F7AOeT2gpI5F2cobhyCk0DroEkrsdBYfhc09fAo6zpOQ30WeObd+YPCf7IcA
	60QS0bzFqVuPIwGc0be39lVkmYqrpIWFZxiz2A5Sp/KmDuxNk5SSlAAp1sRUzj4Xs1hgIyS610J3s
	0ffqdNDBGJ3/6ylhRbMh6Ejtd8ehyyQzZkAlYPTWr4R8yYZkwbiv3QV6ocLESq3vP5YxnvY3P0ZqZ
	kImzhCmtoVVyIYRRq+ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxB3I-0000000Fsd9-0Cm0;
	Sat, 05 Oct 2024 20:06:56 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAt2-0000000Fpzz-053i
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e251ba2243so39668367b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158178; x=1728762978; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YzgTBbpwVzkG0qTRW8O8JNshM/vLbNIleJGInfgSbFs=;
        b=SiBmPf1qoYEBhBNj7dBl85eSygkpaWIn+F2l0IjE+MXA+BLg/t6ND4Es7oTFWEz1H6
         GEXuJMJ71SKRtZziLO2PzzBhlYSHUJd+eLBCOMd+E5sTFasHT+TLcbecofvF30zQGEnV
         vQ131KO3G5uhFz6W2izVx/enD3Di4Yn0XTb31mp3cCoxZQMzJGp7UsXSKSuvs4M2m+m1
         LX+0fpmMDLIdlniS52+nijJYK3491jctOrZemlgHXOTW7+Ioq5Y9ByoAKG/MvsxZnnVC
         3YSyRiUhbHmP4p29+1joNVKgCNP9c0HH5WaRiy3ms/L8clBZ80cLoOL+8EKDxH2ksusm
         iXfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158178; x=1728762978;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YzgTBbpwVzkG0qTRW8O8JNshM/vLbNIleJGInfgSbFs=;
        b=vTsyaWNPxeOQvEq/B+E6SSFVNE19CAMXAvAljekr+CnhrCYfHNJLimfVd73YYSyTf2
         Z4XN3if0m9LSWJFLuB4y4h6X3NNcFKqyX+ANu3VzXzs96FZVRajvSj9iyWKQ3Qna3D3l
         FWuArn+iONNGVDfuQnBKyihA8S56szMWPIkNXR9S3Szu2dF9DFCAAbw7DERZpiNYvbXk
         AFTYYXUP7NzGAYDwqG+HHwn9PR+05sDBbGl1su37qJV4/x5XdzgPIntQAwE4NJ2AuGsH
         nVVsleQVxKk7d6GtJ6WQj+i6H7LynkPJEW6CIRqOHUwy5GbMmwWEy2cJZpxAVwdpWYe2
         msRQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJyakwvRPaXmAyDugEJlfa1jSrn1Ei9xblVv5G7XIZl/fnNlT+Dn/FdezPhSR13XKtFFXEn0EL/1D0oQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwV4UcNxveq00vsFmQEV8zY77y6v1s0W33rBOAKtxtr490n3Qt
	nK4nqC7pkxtPy3naRjxemh4aVZwSa0FS/vSgfYyGK5lq8eWe+3HDgLyQNr65LkIlFC/wpEtziAJ
	6khGsew==
X-Google-Smtp-Source: AGHT+IGiHdIsXBVB+WoPzuiIQsbR1+hzUkQk2RxCJMDxpuguCdw6JxvAyilmRvkhQaU4Z/U38KgUOt+3RklD
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:6683:b0:6be:523:af53 with SMTP id
 00721157ae682-6e2b53d68cemr3650767b3.3.1728158178502; Sat, 05 Oct 2024
 12:56:18 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:19 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-10-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 09/31] perf libdw: Remove unnecessary defines
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
X-CRM114-CacheID: sfid-20241005_125620_098068_3B3BB86C 
X-CRM114-Status: GOOD (  17.36  )
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

As HAVE_DWARF_GETLOCATIONS_SUPPORT and HAVE_DWARF_CFI_SUPPORT always
match HAVE_DWARF_SUPPORT remove the macros and use
HAVE_DWARF_SUPPORT. If building the file is guarded by CONFIG_DWARF
then remove all ifs.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Documentation/perf-check.txt |  2 +-
 tools/perf/Makefile.config              |  3 --
 tools/perf/builtin-annotate.c           |  2 +-
 tools/perf/builtin-check.c              |  2 +-
 tools/perf/builtin-report.c             |  2 +-
 tools/perf/util/dwarf-aux.c             |  6 ---
 tools/perf/util/dwarf-aux.h             | 54 -------------------------
 tools/perf/util/probe-finder.c          |  4 --
 8 files changed, 4 insertions(+), 71 deletions(-)

diff --git a/tools/perf/Documentation/perf-check.txt b/tools/perf/Documentation/perf-check.txt
index 10f69fb6850b..45101a8e4154 100644
--- a/tools/perf/Documentation/perf-check.txt
+++ b/tools/perf/Documentation/perf-check.txt
@@ -48,7 +48,7 @@ feature::
                 bpf_skeletons           /  HAVE_BPF_SKEL
                 debuginfod              /  HAVE_DEBUGINFOD_SUPPORT
                 dwarf                   /  HAVE_DWARF_SUPPORT
-                dwarf_getlocations      /  HAVE_DWARF_GETLOCATIONS_SUPPORT
+                dwarf_getlocations      /  HAVE_DWARF_SUPPORT
                 dwarf-unwind            /  HAVE_DWARF_UNWIND_SUPPORT
                 auxtrace                /  HAVE_AUXTRACE_SUPPORT
                 libaudit                /  HAVE_LIBAUDIT_SUPPORT
diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 9da0dc001d98..db79b25ada6f 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -463,9 +463,6 @@ else
         $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.157, disables dwarf support. Please install new elfutils-devel/libdw-dev)
         NO_LIBDW := 1
       endif
-    else
-      CFLAGS += -DHAVE_DWARF_GETLOCATIONS_SUPPORT
-      CFLAGS += -DHAVE_DWARF_CFI_SUPPORT
     endif # Dwarf support
   endif # libelf support
 endif # NO_LIBELF
diff --git a/tools/perf/builtin-annotate.c b/tools/perf/builtin-annotate.c
index 3dc6197ef3fa..04af13eb4a4c 100644
--- a/tools/perf/builtin-annotate.c
+++ b/tools/perf/builtin-annotate.c
@@ -840,7 +840,7 @@ int cmd_annotate(int argc, const char **argv)
 	}
 #endif
 
-#ifndef HAVE_DWARF_GETLOCATIONS_SUPPORT
+#ifndef HAVE_DWARF_SUPPORT
 	if (annotate.data_type) {
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		return -ENOTSUP;
diff --git a/tools/perf/builtin-check.c b/tools/perf/builtin-check.c
index 0b76b6e42b78..18c0a815243b 100644
--- a/tools/perf/builtin-check.c
+++ b/tools/perf/builtin-check.c
@@ -28,7 +28,7 @@ struct feature_status supported_features[] = {
 	FEATURE_STATUS("bpf_skeletons", HAVE_BPF_SKEL),
 	FEATURE_STATUS("debuginfod", HAVE_DEBUGINFOD_SUPPORT),
 	FEATURE_STATUS("dwarf", HAVE_DWARF_SUPPORT),
-	FEATURE_STATUS("dwarf_getlocations", HAVE_DWARF_GETLOCATIONS_SUPPORT),
+	FEATURE_STATUS("dwarf_getlocations", HAVE_DWARF_SUPPORT),
 	FEATURE_STATUS("dwarf-unwind", HAVE_DWARF_UNWIND_SUPPORT),
 	FEATURE_STATUS("auxtrace", HAVE_AUXTRACE_SUPPORT),
 	FEATURE_STATUS("libaudit", HAVE_LIBAUDIT_SUPPORT),
diff --git a/tools/perf/builtin-report.c b/tools/perf/builtin-report.c
index 5dc17ffee27a..426cbc9110d1 100644
--- a/tools/perf/builtin-report.c
+++ b/tools/perf/builtin-report.c
@@ -1701,7 +1701,7 @@ int cmd_report(int argc, const char **argv)
 		report.data_type = true;
 		annotate_opts.annotate_src = false;
 
-#ifndef HAVE_DWARF_GETLOCATIONS_SUPPORT
+#ifndef HAVE_DWARF_SUPPORT
 		pr_err("Error: Data type profiling is disabled due to missing DWARF support\n");
 		goto error;
 #endif
diff --git a/tools/perf/util/dwarf-aux.c b/tools/perf/util/dwarf-aux.c
index 92eb9c8dc3e5..559c953ca172 100644
--- a/tools/perf/util/dwarf-aux.c
+++ b/tools/perf/util/dwarf-aux.c
@@ -1182,7 +1182,6 @@ int die_get_varname(Dwarf_Die *vr_die, struct strbuf *buf)
 	return ret < 0 ? ret : strbuf_addf(buf, "\t%s", dwarf_diename(vr_die));
 }
 
-#if defined(HAVE_DWARF_GETLOCATIONS_SUPPORT) || defined(HAVE_DWARF_CFI_SUPPORT)
 static int reg_from_dwarf_op(Dwarf_Op *op)
 {
 	switch (op->atom) {
@@ -1245,9 +1244,7 @@ static bool check_allowed_ops(Dwarf_Op *ops, size_t nops)
 	}
 	return true;
 }
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT || HAVE_DWARF_CFI_SUPPORT */
 
-#ifdef HAVE_DWARF_GETLOCATIONS_SUPPORT
 /**
  * die_get_var_innermost_scope - Get innermost scope range of given variable DIE
  * @sp_die: a subprogram DIE
@@ -1697,9 +1694,7 @@ void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **var_types)
 
 	die_find_child(cu_die, __die_collect_global_vars_cb, (void *)var_types, &die_mem);
 }
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT */
 
-#ifdef HAVE_DWARF_CFI_SUPPORT
 /**
  * die_get_cfa - Get frame base information
  * @dwarf: a Dwarf info
@@ -1732,7 +1727,6 @@ int die_get_cfa(Dwarf *dwarf, u64 pc, int *preg, int *poffset)
 	}
 	return -1;
 }
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 
 /*
  * die_has_loclist - Check if DW_AT_location of @vr_die is a location list
diff --git a/tools/perf/util/dwarf-aux.h b/tools/perf/util/dwarf-aux.h
index 925a9bb9fb15..892c8c5c23fc 100644
--- a/tools/perf/util/dwarf-aux.h
+++ b/tools/perf/util/dwarf-aux.h
@@ -156,8 +156,6 @@ Dwarf_Die *die_get_member_type(Dwarf_Die *type_die, int offset, Dwarf_Die *die_m
 /* Return type info where the pointer and offset point to */
 Dwarf_Die *die_deref_ptr_type(Dwarf_Die *ptr_die, int offset, Dwarf_Die *die_mem);
 
-#ifdef HAVE_DWARF_GETLOCATIONS_SUPPORT
-
 /* Get byte offset range of given variable DIE */
 int die_get_var_range(Dwarf_Die *sp_die, Dwarf_Die *vr_die, struct strbuf *buf);
 
@@ -176,59 +174,7 @@ void die_collect_vars(Dwarf_Die *sc_die, struct die_var_type **var_types);
 /* Save all global variables in this CU */
 void die_collect_global_vars(Dwarf_Die *cu_die, struct die_var_type **var_types);
 
-#else /*  HAVE_DWARF_GETLOCATIONS_SUPPORT */
-#include <errno.h>
-
-static inline int die_get_var_range(Dwarf_Die *sp_die __maybe_unused,
-				    Dwarf_Die *vr_die __maybe_unused,
-				    struct strbuf *buf __maybe_unused)
-{
-	return -ENOTSUP;
-}
-
-static inline Dwarf_Die *die_find_variable_by_reg(Dwarf_Die *sc_die __maybe_unused,
-						  Dwarf_Addr pc __maybe_unused,
-						  int reg __maybe_unused,
-						  int *poffset __maybe_unused,
-						  bool is_fbreg __maybe_unused,
-						  Dwarf_Die *die_mem __maybe_unused)
-{
-	return NULL;
-}
-
-static inline Dwarf_Die *die_find_variable_by_addr(Dwarf_Die *sc_die __maybe_unused,
-						   Dwarf_Addr addr __maybe_unused,
-						   Dwarf_Die *die_mem __maybe_unused,
-						   int *offset __maybe_unused)
-{
-	return NULL;
-}
-
-static inline void die_collect_vars(Dwarf_Die *sc_die __maybe_unused,
-				    struct die_var_type **var_types __maybe_unused)
-{
-}
-
-static inline void die_collect_global_vars(Dwarf_Die *cu_die __maybe_unused,
-					   struct die_var_type **var_types __maybe_unused)
-{
-}
-
-#endif /* HAVE_DWARF_GETLOCATIONS_SUPPORT */
-
-#ifdef HAVE_DWARF_CFI_SUPPORT
-
 /* Get the frame base information from CFA */
 int die_get_cfa(Dwarf *dwarf, u64 pc, int *preg, int *poffset);
 
-#else /* HAVE_DWARF_CFI_SUPPORT */
-
-static inline int die_get_cfa(Dwarf *dwarf __maybe_unused, u64 pc __maybe_unused,
-			      int *preg __maybe_unused, int *poffset __maybe_unused)
-{
-	return -1;
-}
-
-#endif /* HAVE_DWARF_CFI_SUPPORT */
-
 #endif /* _DWARF_AUX_H */
diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 7434b38596b9..8019d232f515 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -602,7 +602,6 @@ static int call_probe_finder(Dwarf_Die *sc_die, struct probe_finder *pf)
 	ret = dwarf_getlocation_addr(&fb_attr, pf->addr, &pf->fb_ops, &nops, 1);
 	if (ret <= 0 || nops == 0) {
 		pf->fb_ops = NULL;
-#ifdef HAVE_DWARF_CFI_SUPPORT
 	} else if (nops == 1 && pf->fb_ops[0].atom == DW_OP_call_frame_cfa &&
 		   (pf->cfi_eh != NULL || pf->cfi_dbg != NULL)) {
 		if ((dwarf_cfi_addrframe(pf->cfi_eh, pf->addr, &frame) != 0 &&
@@ -613,7 +612,6 @@ static int call_probe_finder(Dwarf_Die *sc_die, struct probe_finder *pf)
 			free(frame);
 			return -ENOENT;
 		}
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 	}
 
 	/* Call finder's callback handler */
@@ -1138,7 +1136,6 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
 
 	pf->machine = ehdr.e_machine;
 
-#ifdef HAVE_DWARF_CFI_SUPPORT
 	do {
 		GElf_Shdr shdr;
 
@@ -1148,7 +1145,6 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
 
 		pf->cfi_dbg = dwarf_getcfi(dbg->dbg);
 	} while (0);
-#endif /* HAVE_DWARF_CFI_SUPPORT */
 
 	ret = debuginfo__find_probe_location(dbg, pf);
 	return ret;
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
