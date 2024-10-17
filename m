Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB2ED2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 01:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2Epp79r5N53OPcn2UWmSUyij9QxkqKZpNsczuT6BcA4=; b=dnFpTwVYThNUse
	RFligjwZ22G9GizZqofwAGMqvTrpWPHdt7pV5wn0GHVEsF+2CkVC5e0KVCmrzWv/9F6DB3Es6ApAL
	WGZXvnDEvv0mzyufI5MaJWQjlm6aQ31idtjwjC8uQV/KXBUJad1pjAR31B30WbPjjZ3jtgr6s9dRe
	nwL1JcViegx4F2i8qxmwQ+wg2FrU/Wpvy1zlbsTFoesMi0wpq6FPSYbB5OpWi7g/Hc1oKutlK813q
	6MDw7YyCSqaRiBBA1LQUqydcdywzV8W0PXmRYm8SvT+jQhZmu/CePfBqxpVok3QuMqbg4HEcx/L5D
	XMwC+wZWGz4IEOcn26+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EyT-0000000DQCB-3S6M;
	Thu, 17 Oct 2024 01:06:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ELK-0000000DKTc-0ID8
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:26:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=uq9AxXLwl+md7pGfplbuMGPRmw11SaZaUSrHTUrrfs0=; b=m09i8OCyaW8dHmw8FNS9G2R92Y
	rKSk7WMym9MxmYGJvnEgJuoQMz4Wq47MIpldNdbCM8AOSDIfeu4MYKnKuhEJ5fztX1PhBQ9hpmEED
	LsQBTj4jUzWB4rGfL5MzUH1dhr61H+qMT75Zv05WPmRNVxav/G7XJMg25ovOb0umtFMUoSJa6138y
	Pz5b7qZ3ecULzImWnOuyLxgEWbKNGL14gg4K8sYd+LUtxiouqF1cogMu+OZrW1exW6J/kje42gXPV
	MYlwpuu2OLxUl2zfLo19PmcLUNXyWlc2MUq7cGxAokdP8vd2FM9LbCjs/q77wSDpJySF5c4uXxI9V
	ssPJR4XQ==;
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ELG-00000006yLm-2zoH
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:26:16 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e17bb508bb9so616688276.2
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124773; x=1729729573; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uq9AxXLwl+md7pGfplbuMGPRmw11SaZaUSrHTUrrfs0=;
        b=hZTPf3wjZo5gv0SwMD1K7wwNrMmvax9ObdMPWMxgIBKZ8s+mfmi+LGYIks2dGnxPEF
         PnUsflblAob9ceohQFH1aAH4EI9ZU/UpFUfW6O2MQHAMcFjsIQodWV2MYOSJF+hCgtGY
         D8TsfT9GhThm5NscGnel2bD3+M1ztgTuPLHnxmtslq4ARQhMf37wQa+H3af6DI2hLNpj
         cmwTJwT1Nqqorpm8cRlxdGO0IO6jlMnYw/7b5nstqKuho9f7dPg4FbjR6oo39rUG4eqp
         gzWdiupdf9WroQ8ufq8m8IrrGbokSoUqHAJt9roFgx9t8+QS8PNXtbR05sJpqjx9QIul
         SeeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124773; x=1729729573;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uq9AxXLwl+md7pGfplbuMGPRmw11SaZaUSrHTUrrfs0=;
        b=Xu9HCgpuJmocg2yYtzRRK41Pp3KleKP3FZdPeaV0D7SsO63Op26C1hRGPJizPQ9P6l
         aVn1eoHHZFtBcGQHz9LPw6C6mHknatD4futVJufn483T4YBMZEMCZMEuIcYLcSl0AAt/
         8M4VDR2aOzI0zm99TTT/oF0ExsLMOVPL+aTdv+sWggNY2zyD41v4CSdJVcN564UgEb4f
         5Q2CpulH+6SDyZRMlvCCqk5nJHBhDJG46BGoOkA6oAOFXzyYovuWT/7LhmmxeGUghDmn
         zHB/By8kTMvDGGsJGKZttlHAn3Uny/kfBySOc6Iqzpa3JSHbInx5i8uSWXb2pHDGYEvd
         dvNA==
X-Forwarded-Encrypted: i=1; AJvYcCU8/UB933A9ajZk3gQlCfd6KYHCrnYkS4p3mA/PW7v69a90GvqM0LTLFFpfv7lQcxT8bqGmgTQ75pL0AA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfYuG0mp9em6LTK+06EmvJomyUE9how/gs9f1uwGlJqPjmXHQ6
	f8+tBSTbJPaVsf+170ThsHSc3cRWj8w0DLWNZXwBMSaCsGaxKsYvTGGmTX6JnATJaqRvaX9RkFO
	uyemTBA==
X-Google-Smtp-Source: AGHT+IFblE5b3blF81m60FrHwxXihWa7btaVQayshFuqPR503LpiCQwiOp0I0Sdca5Yyel3RIIDwjSVp3STP
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:7e04:0:b0:e25:fcb:3205 with SMTP id
 3f1490d57ef6-e29785695e6mr5028276.8.1729124772530; Wed, 16 Oct 2024 17:26:12
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:18 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-19-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 18/20] perf xtensa: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241017_012615_115890_BC51A034 
X-CRM114-Status: GOOD (  17.56  )
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

The file just provides the function get_arch_regstr, however, if in
the only caller get_dwarf_regstr EM_HOST is used for the EM_NONE case
the function can never be called. So remove as dead code. As this is
the only file in the arch/xtensa/util clean up Build files. Tidy up the
EM_NONE cases for xtensa in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/xtensa/Build             |  1 -
 tools/perf/arch/xtensa/util/Build        |  1 -
 tools/perf/arch/xtensa/util/dwarf-regs.c | 21 ---------------------
 tools/perf/util/dwarf-regs.c             |  4 ++--
 tools/perf/util/include/dwarf-regs.h     |  2 +-
 5 files changed, 3 insertions(+), 26 deletions(-)
 delete mode 100644 tools/perf/arch/xtensa/Build
 delete mode 100644 tools/perf/arch/xtensa/util/Build
 delete mode 100644 tools/perf/arch/xtensa/util/dwarf-regs.c

diff --git a/tools/perf/arch/xtensa/Build b/tools/perf/arch/xtensa/Build
deleted file mode 100644
index e63eabc2c8f4..000000000000
--- a/tools/perf/arch/xtensa/Build
+++ /dev/null
@@ -1 +0,0 @@
-perf-util-y += util/
diff --git a/tools/perf/arch/xtensa/util/Build b/tools/perf/arch/xtensa/util/Build
deleted file mode 100644
index 2d1a48696ad9..000000000000
--- a/tools/perf/arch/xtensa/util/Build
+++ /dev/null
@@ -1 +0,0 @@
-perf-$(CONFIG_LIBDW) += dwarf-regs.o
diff --git a/tools/perf/arch/xtensa/util/dwarf-regs.c b/tools/perf/arch/xtensa/util/dwarf-regs.c
deleted file mode 100644
index 12f5457300f5..000000000000
--- a/tools/perf/arch/xtensa/util/dwarf-regs.c
+++ /dev/null
@@ -1,21 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (c) 2015 Cadence Design Systems Inc.
- */
-
-#include <stddef.h>
-#include <dwarf-regs.h>
-
-#define XTENSA_MAX_REGS 16
-
-const char *xtensa_regs_table[XTENSA_MAX_REGS] = {
-	"a0", "a1", "a2", "a3", "a4", "a5", "a6", "a7",
-	"a8", "a9", "a10", "a11", "a12", "a13", "a14", "a15",
-};
-
-const char *get_arch_regstr(unsigned int n)
-{
-	return n < XTENSA_MAX_REGS ? xtensa_regs_table[n] : NULL;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index a0bcc2529cb0..05fff75a8f59 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -35,7 +35,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
     || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
     || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390 || EM_HOST == EM_SH \
-    || EM_HOST == EM_SPARC || EM_HOST == EM_SPARCV9
+    || EM_HOST == EM_SPARC || EM_HOST == EM_SPARCV9 || EM_HOST == EM_XTENSA
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -45,7 +45,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
     && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
     && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390 && EM_HOST != EM_SH \
-    && EM_HOST != EM_SPARC && EM_HOST != EM_SPARCV9
+    && EM_HOST != EM_SPARC && EM_HOST != EM_SPARCV9 && EM_HOST != EM_XTENSA
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index b2cf7d9e4785..9dfc9abfdddd 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -82,7 +82,7 @@
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
     && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
     && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__) && !defined(__sh__) \
-    && !defined(__sparc64__) && !defined(__sparc__)
+    && !defined(__sparc64__) && !defined(__sparc__) && !defined(__xtensa__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
