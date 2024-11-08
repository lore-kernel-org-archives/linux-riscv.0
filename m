Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C45D64076
	for <linux-riscv@archiver.kernel.org>; Sat,  9 Nov 2024 00:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Mz4mgUE+bHONr2EVMAYtDfhNl2fQLzU5CdDAJUFNq+A=; b=PwVJlsJAC0sHHi
	3CUgLu07D3WzBRO8xWhR3EtUNMIEqti6wmrKAVLMqdgBw7MXKOcXOaIS5jVWQ41yN+/fIv2U8xZvh
	GjiL6XeKZlcMOdLiW8pNbPQ+3rAOAVc0G69UB/44FQRHj3O/zpwe3nb50O2P39EFPKrRSmqfgYQ8V
	vA84xMZO96ha85BqoNa9MmqQrlC/ndgFnGIfxhZK+8mHOkvwtzsUL5vbnl7zgODqn2hqaPLeNyGNQ
	0uzEdutbPk6Q7XEsdXGxhcPWMDWgEx3vY49Mk7miSKa8EjxA+wQYiOnwAdv00tPzcVJ7xdVGdofUb
	InYieCh8g0IxFv7M1Xag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9ZDq-0000000CKTX-1mXP;
	Sat, 09 Nov 2024 00:21:02 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9Ygs-0000000CFMH-2AOY
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:47:00 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e30cf121024so4596640276.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109617; x=1731714417; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OKslcm2V1UHcqGqqi4FAiYTJwpOr2SEQn/AjeUS4EGg=;
        b=lyGP876ixL622dd51iVDMXFdM2R5KKIIZaDuEAC+vHoQkRQ5xKYKry3+B8afNVtFdz
         zVOuAB9ec0Yv36Fpxjm3DnKHxwlpUFth1N7J6KDTLtZVp2E95UG1fiKWRzpQQU/jvZmc
         yqf16O6jL5FR+PYBMeFAdVEaF0f3sc/8HMxvfpMTE9lSZy68uL9WGllqmmVpUNvbpWQ3
         L+hW/oov0ru5mZsczstZYbHGWLvh5NgtcM6xb4ofmSrVNa5dn/GlP6bohpJaHA9yLL8h
         DkAQuSj+WtMCxIAkrw/F0E7TYf04hx3rdR2WUrOw3WqCMM0Xk1/Mvd4fjEr7TgFamO/k
         n9bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109617; x=1731714417;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKslcm2V1UHcqGqqi4FAiYTJwpOr2SEQn/AjeUS4EGg=;
        b=Vil5OloYMkjsRYw+Oc222qsDC0Xt0xCbb/xLjVnzy7NffysUimMy+1Im1DfU98f9E5
         4Jlg2CKl47TjQ2iZWZKhFk6i7M29vGf7tjR2syvmForghkD4IQv2+VcIC8ga8WaM49pF
         an7TviN+DHRPA3pE0xXhbphi2Yz56nFiEibIb8hZBKAG2ofMP3Z6ZEMH0R2kDA9rLNh3
         sUlgnOovKmhVpVH21U42PPcmMW/YGKZjxBPOlgk+65aNzdpP8bIokJymi4yZERX3q5r9
         qoPtmCDw5bRBqSbJqwxWZ+a0wL2B56GQM4FRvlCNb2hbJegXkb/N3nbrjfEJvl/ZVOiI
         An3w==
X-Forwarded-Encrypted: i=1; AJvYcCW8BaKH8RCafYQiCGaE5Xjoh49pE0aRmryy9sLnvCVwDpD7k1jEIFRhDvz45i18++3pTWd/sbWWfpBE9g==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaQghUDl7vo8sJzH3Hi1m0+mj5TuQJNO/+K8cLz2ae80gaKInT
	Jf54AqchzNRXIN1Z7BYsKDD/XPzslS6nUNjLYI79SrKEl8kplIAspyQ8yPy4MswvHoc5I8/A23c
	IEeer5w==
X-Google-Smtp-Source: AGHT+IG1zx26qQHAzqiLBUtrRzJXR+kqfJstP7FYSoC2xoOMAWBu+eO7OrTp0s/Fw2wwPvD/OOi7YEUCvyL0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a25:ae63:0:b0:e11:639b:6428 with SMTP id
 3f1490d57ef6-e337f77f713mr8790276.0.1731109617162; Fri, 08 Nov 2024 15:46:57
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:46:05 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-21-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 20/20] perf build: Remove PERF_HAVE_DWARF_REGS
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
X-CRM114-CacheID: sfid-20241108_154658_729602_B6A5F009 
X-CRM114-Status: GOOD (  15.35  )
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

PERF_HAVE_DWARF_REGS was true when an architecture had a dwarf-regs.c
file. There are no more architecture dwarf-regs.c files, selection is
done using constants from the ELF file rather than conditional
compilation. When removing PERF_HAVE_DWARF_REGS was the only variable
in the Makefile, remove the Makefile.

Add missing SPDX for RISC-V Makefile.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config         | 13 ++++---------
 tools/perf/arch/arm/Makefile       |  3 ---
 tools/perf/arch/arm64/Makefile     |  3 ---
 tools/perf/arch/csky/Makefile      |  4 ----
 tools/perf/arch/loongarch/Makefile |  3 ---
 tools/perf/arch/mips/Makefile      |  4 ----
 tools/perf/arch/powerpc/Makefile   |  4 ----
 tools/perf/arch/riscv/Makefile     |  4 +---
 tools/perf/arch/s390/Makefile      |  3 ---
 tools/perf/arch/sh/Makefile        |  4 ----
 tools/perf/arch/sparc/Makefile     |  4 ----
 tools/perf/arch/x86/Makefile       |  3 ---
 tools/perf/arch/xtensa/Makefile    |  4 ----
 13 files changed, 5 insertions(+), 51 deletions(-)
 delete mode 100644 tools/perf/arch/csky/Makefile
 delete mode 100644 tools/perf/arch/sh/Makefile
 delete mode 100644 tools/perf/arch/xtensa/Makefile

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index 52a216df9e2a..2916d59c88cd 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -559,15 +559,10 @@ ifndef NO_LIBELF
   endif
 
   ifndef NO_LIBDW
-    ifeq ($(origin PERF_HAVE_DWARF_REGS), undefined)
-      $(warning DWARF register mappings have not been defined for architecture $(SRCARCH), DWARF support disabled)
-      NO_LIBDW := 1
-    else
-      CFLAGS += -DHAVE_LIBDW_SUPPORT $(LIBDW_CFLAGS)
-      LDFLAGS += $(LIBDW_LDFLAGS)
-      EXTLIBS += ${DWARFLIBS}
-      $(call detected,CONFIG_LIBDW)
-    endif # PERF_HAVE_DWARF_REGS
+    CFLAGS += -DHAVE_LIBDW_SUPPORT $(LIBDW_CFLAGS)
+    LDFLAGS += $(LIBDW_LDFLAGS)
+    EXTLIBS += ${DWARFLIBS}
+    $(call detected,CONFIG_LIBDW)
   endif # NO_LIBDW
 
   ifndef NO_LIBBPF
diff --git a/tools/perf/arch/arm/Makefile b/tools/perf/arch/arm/Makefile
index 9b164d379548..8b59ce8efb89 100644
--- a/tools/perf/arch/arm/Makefile
+++ b/tools/perf/arch/arm/Makefile
@@ -1,5 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
 PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/arch/arm64/Makefile b/tools/perf/arch/arm64/Makefile
index ca2e35961287..91570d5d428e 100644
--- a/tools/perf/arch/arm64/Makefile
+++ b/tools/perf/arch/arm64/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
diff --git a/tools/perf/arch/csky/Makefile b/tools/perf/arch/csky/Makefile
deleted file mode 100644
index 119b06a64bed..000000000000
--- a/tools/perf/arch/csky/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
diff --git a/tools/perf/arch/loongarch/Makefile b/tools/perf/arch/loongarch/Makefile
index 79b432744296..52544d59245b 100644
--- a/tools/perf/arch/loongarch/Makefile
+++ b/tools/perf/arch/loongarch/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index 733f7b76f52d..827168f1077a 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
-
 # Syscall table generation for perf
 out    := $(OUTPUT)arch/mips/include/generated/asm
 header := $(out)/syscalls_n64.c
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index ae05727835d8..dc8f4fb8e324 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -1,8 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
-
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
 
diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index d83e0f32f3a8..18ad078000e2 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -1,6 +1,4 @@
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
+# SPDX-License-Identifier: GPL-2.0
 PERF_HAVE_JITDUMP := 1
 HAVE_KVM_STAT_SUPPORT := 1
 
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 58e79f5b67a4..c431c21b11ef 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
 
diff --git a/tools/perf/arch/sh/Makefile b/tools/perf/arch/sh/Makefile
deleted file mode 100644
index 119b06a64bed..000000000000
--- a/tools/perf/arch/sh/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
diff --git a/tools/perf/arch/sparc/Makefile b/tools/perf/arch/sparc/Makefile
index 7741184894c8..8b59ce8efb89 100644
--- a/tools/perf/arch/sparc/Makefile
+++ b/tools/perf/arch/sparc/Makefile
@@ -1,6 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
-
 PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index 51cf267f4d85..a6b6e0a9308a 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -1,7 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
 HAVE_KVM_STAT_SUPPORT := 1
 PERF_HAVE_JITDUMP := 1
 
diff --git a/tools/perf/arch/xtensa/Makefile b/tools/perf/arch/xtensa/Makefile
deleted file mode 100644
index 119b06a64bed..000000000000
--- a/tools/perf/arch/xtensa/Makefile
+++ /dev/null
@@ -1,4 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_LIBDW
-PERF_HAVE_DWARF_REGS := 1
-endif
-- 
2.47.0.277.g8800431eea-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
