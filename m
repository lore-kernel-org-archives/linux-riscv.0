Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CF3ED64076
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 23:59:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EpjIXQMlYodo3gM2ICj/8RklnisMm+hW+kN89DERbkU=; b=naI27jM4FKqKAS
	JDWxg4h/C/mWKlT0gPTF8U5CiOuC+sy9uhS26jOl1tvNA8jKtVkWgvZ5aLHy0meck3TKb8mgFlHML
	m2pZWkJK41fCgJprypagUDABmIj4gDMEdJjxOEpcdcmfIW2rr9fT0n1Ctwv1DW+ESSDM/AM2hkcEm
	/7J7uQt8/aX5YN9162nFZHOPGWHpJTjRr1S07KgWJVlK3aXiOTND9Pf5jPdiKaQBB9/5xm1pHgDb9
	QZN/2ScnTmBRNub2DXkEOtK6FqPybadEDKcmdL6KKc6OWL7dmdUrXeQnklJDs9mZshtu5RRaWeATz
	v3JoiEOntX7KnmGx6KSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Yst-0000000CHbj-29bR;
	Fri, 08 Nov 2024 23:59:23 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgN-0000000CF4c-3jAO
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:29 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e0b8fa94718so4900090276.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109586; x=1731714386; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oow4OtdyMh21LhDXWHu2ONlu9AVRg6bZvmdssdGNUzo=;
        b=JgaVYXzQRgb7SXd8IACMCfOC+aiLomU9ppEh1ajuRvL3jxXnxRCwOhQqSAB5d3MX8f
         /+hOttm3wt2sYmyUrNE+RvRdr69VIxYroNmmLgd8REUd+mLeecUES1g4ag59lms7HAwa
         QYG6Wm51sgz1GvdQmP8JTodgl3+MHNvsVdz96DFxlQmSOgu/5MBY1F5wcBoJY51+tYYM
         3SETERaNjqSLlcfRbPqgb5sfacjtDI4whmwxMtSlVS2IyWuZoW60Ozgwj1TDK7PDQpNE
         dLgg6hkB4HxLTi5elegR3rpm2mTHvLQ4XqU/EzWqwdOInTIuIprKZThuKTHBrDcDgbDQ
         8H1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109586; x=1731714386;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oow4OtdyMh21LhDXWHu2ONlu9AVRg6bZvmdssdGNUzo=;
        b=v3JG/3Qlds5eSRg6ElycNuqpZl8hFJD6rGoRcXdbUZDLlLZsnzDt8EWDQseYJ8QwXA
         4ElhkNIHL+tf8dEe+0xNCk8lRQ3j9NaNyKNCKxHMCAfvrC7G/NWGUQ5maugNZUACn9lY
         I5nat3Rs10Oj1NQBOtH0MVzJgGriwFxSnsFL7byUcBG+bhM+HIDmVYGdcFlcvHy970RD
         UNHHI/t0ay3zW9AHhkojv9ki8px89CQLJxU7TGJqjYnMDfpN/VBuu86ZoK7xq3yAET3/
         /f+LgbhAqaU36KvDA1UZfLCUNXfRQqgIkvW5yLdjjNnUqLhBs1+1Ax/fiNRfO0R8xmog
         iTfw==
X-Forwarded-Encrypted: i=1; AJvYcCUbu+pCbrkvj9b61mfIHgogUxaTPVZdhsJaD13VX6wET+seWo33orYuRhw0tjXx4V8arFC/EGYXhN7NTQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwhHZf2nAFIwL04ZTBnRgdMtO6446n9vMG+dXIDEI9Aeo5WFV3u
	pfw2eW4FW18oRrHZqvldDJk9Mk1ysqOf4u9aKfMsFbC4DdRrvTzRnORA51IHhImYXV63eJZw/my
	jg8S47g==
X-Google-Smtp-Source: AGHT+IHKhqVSgLqE3aKoJujJ2ynMX9CVA4id4xj8yQcV+relp1ZbhH/KTZnsnSlV1M1UfS+yayKDorj3sbkk
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a5b:70a:0:b0:e28:e6a1:fc53 with SMTP id
 3f1490d57ef6-e337f8c6c5dmr11688276.5.1731109586518; Fri, 08 Nov 2024 15:46:26
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:52 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-8-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 07/20] perf dwarf-regs: Move x86 dwarf-regs out of arch
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
X-CRM114-CacheID: sfid-20241108_154628_024596_6D4F4086 
X-CRM114-Status: GOOD (  15.40  )
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

Move arch/x86/util/dwarf-regs.c to util/dwarf-regs-x86.c and compile
in unconditionally. To avoid get_arch_regnum being duplicated, rename
to get_x86_regnum and add to get_dwarf_regnum switch.

For get_arch_regstr, this was unused on x86 unless the machine type
was EM_NONE. Map that case to EM_HOST and remove get_arch_regstr from
dwarf-regs-x86.c.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/x86/util/Build                |  3 ---
 tools/perf/util/Build                         |  1 +
 .../dwarf-regs.c => util/dwarf-regs-x86.c}    | 24 +------------------
 tools/perf/util/dwarf-regs.c                  | 17 +++++++++++++
 tools/perf/util/include/dwarf-regs.h          |  8 +++++++
 5 files changed, 27 insertions(+), 26 deletions(-)
 rename tools/perf/{arch/x86/util/dwarf-regs.c => util/dwarf-regs-x86.c} (77%)

diff --git a/tools/perf/arch/x86/util/Build b/tools/perf/arch/x86/util/Build
index bc56a8e70f34..848327378694 100644
--- a/tools/perf/arch/x86/util/Build
+++ b/tools/perf/arch/x86/util/Build
@@ -11,9 +11,6 @@ perf-util-y += mem-events.o
 perf-util-y += evsel.o
 perf-util-y += iostat.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
-perf-util-$(CONFIG_BPF_PROLOGUE) += dwarf-regs.o
-
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
diff --git a/tools/perf/util/Build b/tools/perf/util/Build
index 1eedead5f2f2..4c615611b9d7 100644
--- a/tools/perf/util/Build
+++ b/tools/perf/util/Build
@@ -203,6 +203,7 @@ endif
 perf-util-$(CONFIG_LIBDW) += probe-finder.o
 perf-util-$(CONFIG_LIBDW) += dwarf-aux.o
 perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
+perf-util-$(CONFIG_LIBDW) += dwarf-regs-x86.o
 perf-util-$(CONFIG_LIBDW) += debuginfo.o
 perf-util-$(CONFIG_LIBDW) += annotate-data.o
 
diff --git a/tools/perf/arch/x86/util/dwarf-regs.c b/tools/perf/util/dwarf-regs-x86.c
similarity index 77%
rename from tools/perf/arch/x86/util/dwarf-regs.c
rename to tools/perf/util/dwarf-regs-x86.c
index 530905118cd4..7a55c65e8da6 100644
--- a/tools/perf/arch/x86/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs-x86.c
@@ -11,28 +11,6 @@
 #include <linux/kernel.h> /* for ARRAY_SIZE */
 #include <dwarf-regs.h>
 
-#define DEFINE_DWARF_REGSTR_TABLE 1
-#include "dwarf-regs-table.h"
-
-/* Return architecture dependent register string (for kprobe-tracer) */
-const char *get_arch_regstr(unsigned int n)
-{
-#if defined(__i386__)
-	size_t len = ARRAY_SIZE(x86_32_regstr_tbl);
-#else
-	size_t len = ARRAY_SIZE(x86_64_regstr_tbl);
-#endif
-
-	if (n >= len)
-		return NULL;
-
-#if defined(__i386__)
-	return x86_32_regstr_tbl[n];
-#else
-	return x86_64_regstr_tbl[n];
-#endif
-}
-
 struct dwarf_regs_idx {
 	const char *name;
 	int idx;
@@ -58,7 +36,7 @@ static const struct dwarf_regs_idx x86_regidx_table[] = {
 	{ "rip", DWARF_REG_PC },
 };
 
-int get_arch_regnum(const char *name)
+int get_x86_regnum(const char *name)
 {
 	unsigned int i;
 
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 86b3ef638fbb..eac99a246737 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,9 +32,17 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 			     unsigned int flags __maybe_unused)
 {
+#if EM_HOST == EM_X86_64 || EM_HOST == EM_386
+	if (machine == EM_NONE) {
+		/* Generic arch - use host arch */
+		machine = EM_HOST;
+	}
+#endif
 	switch (machine) {
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
+#endif
 	case EM_386:
 		return __get_dwarf_regstr(x86_32_regstr_tbl, n);
 	case EM_X86_64:
@@ -65,10 +73,12 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 	return NULL;
 }
 
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
 __weak int get_arch_regnum(const char *name __maybe_unused)
 {
 	return -ENOTSUP;
 }
+#endif
 
 /* Return DWARF register number from architecture register name */
 int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
@@ -90,9 +100,16 @@ int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags
 		machine = EM_HOST;
 	}
 	switch (machine) {
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386
 	case EM_HOST:
 		reg = get_arch_regnum(regname);
 		break;
+#endif
+	case EM_X86_64:
+		fallthrough;
+	case EM_386:
+		reg = get_x86_regnum(regname);
+		break;
 	default:
 		pr_err("ELF MACHINE %x is not supported.\n", machine);
 	}
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 0ef428d07bcc..6aa66c375942 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -89,7 +89,10 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
+#if !defined(__x86_64__) && !defined(__i386__)
 const char *get_arch_regstr(unsigned int n);
+#endif
+
 /**
  * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
  * @n: DWARF register number.
@@ -98,7 +101,12 @@ const char *get_arch_regstr(unsigned int n);
  */
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
 
+int get_x86_regnum(const char *name);
+
+#if !defined(__x86_64__) && !defined(__i386__)
 int get_arch_regnum(const char *name);
+#endif
+
 /*
  * get_dwarf_regnum - Returns DWARF regnum from register name
  * name: architecture register name
-- 
2.47.0.277.g8800431eea-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
