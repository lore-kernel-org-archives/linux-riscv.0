Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80F2FD2F7D8
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:32:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o1REMZzbuvsCVUCxZPeDp/MWi4OEnAaIqLnQLIESW+I=; b=0b6p+EAVuQ/TJN
	VIiHlEtfm9Yx7eyzruzFv8FADBKKJ6edpL3dRw/QIfPsDm2teKgc+X7ypqN0Kyhly0aNxc3DyZqmb
	aXQgRtVQKb3ih6O3s76PIfATgSXdN3/yht/7EGpAO10fdSz2ELCqIi+ad/CGbZ/dybzQuj3gy77dR
	yKRrE9iPD4wfgBJnJL+94C6CNewg5q0FPs2kDewDkrPznPQJEku2BkTEexOVhhcdXhQQtoseZTRow
	UgyvlB4244jnS5R6yWgX1dJPwTLlFM0I2fnsl9aDs8srez4BYg9PqmfmjaJjhe7tPqgOOGndt6gSl
	6AlMUT7TyBvg2JCYC2dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ERP-0000000DM3w-1OPz;
	Thu, 17 Oct 2024 00:32:35 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1E9Z-0000000DIAj-2rE9
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:14:11 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e2971589916so683466276.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124048; x=1729728848; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GHSqjk9ZRfPn8FVBcSh8Ry5Cr0JpG8eM+bHfnQinYnA=;
        b=tX9+KMoY4MEcD+pZBcfHV7833q/00Suwe1Wqd7+y1E3MBWckCn+rZJtMfOLDo2cFjl
         B6si34TfyHNc2mfv1wcavk0jY8m/7rB4kJ4hGSpLI8EspSY3w6OVzA/IVx9k7pnlovwX
         mtKCj1knX+bhie1T2X3CdWv6REadhge8q5Yv6TYPIvp1mqrqjmw2FQaULRXuw5JU5YPa
         To2Zc+CMpfMu/XlhA+xMhbQogaUTAps3lCh8KF+LT+UJh6SR6qfwtC/xigWQGWrkU6Sq
         QaaaEI0crxSuNKMOrLfm8boGz9z1tRV57efelj9UUYtFAVRy0KnbYhUwCVSBoXS1EZ1u
         VdAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124048; x=1729728848;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GHSqjk9ZRfPn8FVBcSh8Ry5Cr0JpG8eM+bHfnQinYnA=;
        b=p61bia6x4wWAJVIfNpavwvWyAoj62WxTixgXUgd9UTmlZparWgq6a0grnknOmsAdY/
         ryKOBWWUX55r9BR4PBo5EHK+Ro5NuhgQbsMHpR4MHek9LZug+frVir/9rSuu4VCl1m3W
         6wBpFhYna2cjkMVAq7IrAEN2hHANSk6Q0C6nbJBiy3DONSKakA1g7/gnd1ILUajlQjLG
         vaQBPihkFSljl1P6DgiDYofENBrYLNzbxr/0uN5uEWbF6oPiN0eNGJ5t5Y6NsT5iLjl6
         H+gZqlFSFdkPjXKjuI0wwGhQMR4+ibuLGB5sO5jgw4bT87G5oMaMaSbhcr8PX27w7m6v
         B9jg==
X-Forwarded-Encrypted: i=1; AJvYcCVvyqJkZVX4ZXbuYVv7xPjMBxqx2r5ldhyrHazX5Eg+zfQpVjUVbfJA3MdvsCitwcDMdZOqzjzdO8AY8Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx5XLbKfV7hzZy3rdEx7jkncWUW9thkBWw9rqJJ39xyZo1NW04z
	cvR6XbYBqpQ6UPBuCIfvwXraMC3tbhKFSu1CEp8Q5hFG/Y1vTr3oDW+OcuDjFgZ5AtYnXDWs7cw
	sVUkg4Q==
X-Google-Smtp-Source: AGHT+IGqr9sQBXM3adIskS2P6qVNnIou3eo2nhdUZf1EX7Ra7XEm1CDhhAwb4OEVcH7WjrUyRdtR/4pRk5N1
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:dc41:0:b0:e20:298c:541 with SMTP id
 3f1490d57ef6-e297857270cmr2711276.9.1729124048178; Wed, 16 Oct 2024 17:14:08
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:13:45 -0700
In-Reply-To: <20241017001354.56973-1-irogers@google.com>
Message-Id: <20241017001354.56973-3-irogers@google.com>
Mime-Version: 1.0
References: <20241017001354.56973-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 02/11] perf build: Rename NO_DWARF to NO_LIBDW
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
X-CRM114-CacheID: sfid-20241016_171409_741958_EF70A3DF 
X-CRM114-Status: GOOD (  12.71  )
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

NO_DWARF could mean more than NO_LIBDW support, in particular no
libunwind support. Rename to be more intention revealing.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/Makefile.config         | 16 ++++++++--------
 tools/perf/Makefile.perf           |  2 +-
 tools/perf/arch/arm/Makefile       |  2 +-
 tools/perf/arch/arm64/Makefile     |  2 +-
 tools/perf/arch/csky/Makefile      |  2 +-
 tools/perf/arch/loongarch/Makefile |  2 +-
 tools/perf/arch/mips/Makefile      |  2 +-
 tools/perf/arch/powerpc/Makefile   |  2 +-
 tools/perf/arch/riscv/Makefile     |  2 +-
 tools/perf/arch/s390/Makefile      |  2 +-
 tools/perf/arch/sh/Makefile        |  2 +-
 tools/perf/arch/sparc/Makefile     |  2 +-
 tools/perf/arch/x86/Makefile       |  2 +-
 tools/perf/arch/xtensa/Makefile    |  2 +-
 tools/perf/builtin-probe.c         |  2 +-
 15 files changed, 22 insertions(+), 22 deletions(-)

diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
index c1c7c25887a7..cc2cfc3aab40 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -432,7 +432,7 @@ ifeq ($(feature-file-handle), 1)
 endif
 
 ifdef NO_LIBELF
-  NO_DWARF := 1
+  NO_LIBDW := 1
   NO_LIBUNWIND := 1
   NO_LIBDW_DWARF_UNWIND := 1
   NO_LIBBPF := 1
@@ -474,9 +474,9 @@ else
       endif
     endif
     ifneq ($(feature-dwarf), 1)
-      ifndef NO_DWARF
+      ifndef NO_LIBDW
         $(warning No libdw.h found or old libdw.h found or elfutils is older than 0.138, disables dwarf support. Please install new elfutils-devel/libdw-dev)
-        NO_DWARF := 1
+        NO_LIBDW := 1
       endif
     else
       ifneq ($(feature-dwarf_getlocations), 1)
@@ -499,7 +499,7 @@ ifeq ($(feature-libaio), 1)
   endif
 endif
 
-ifdef NO_DWARF
+ifdef NO_LIBDW
   NO_LIBDW_DWARF_UNWIND := 1
 endif
 
@@ -577,17 +577,17 @@ ifndef NO_LIBELF
     endif
   endif
 
-  ifndef NO_DWARF
+  ifndef NO_LIBDW
     ifeq ($(origin PERF_HAVE_DWARF_REGS), undefined)
       $(warning DWARF register mappings have not been defined for architecture $(SRCARCH), DWARF support disabled)
-      NO_DWARF := 1
+      NO_LIBDW := 1
     else
       CFLAGS += -DHAVE_DWARF_SUPPORT $(LIBDW_CFLAGS)
       LDFLAGS += $(LIBDW_LDFLAGS)
       EXTLIBS += ${DWARFLIBS}
       $(call detected,CONFIG_DWARF)
     endif # PERF_HAVE_DWARF_REGS
-  endif # NO_DWARF
+  endif # NO_LIBDW
 
   ifndef NO_LIBBPF
     ifeq ($(feature-bpf), 1)
@@ -636,7 +636,7 @@ ifdef PERF_HAVE_JITDUMP
 endif
 
 ifeq ($(SRCARCH),powerpc)
-  ifndef NO_DWARF
+  ifndef NO_LIBDW
     CFLAGS += -DHAVE_SKIP_CALLCHAIN_IDX
   endif
 endif
diff --git a/tools/perf/Makefile.perf b/tools/perf/Makefile.perf
index 9dd2e8d3f3c9..a144bfaf8aeb 100644
--- a/tools/perf/Makefile.perf
+++ b/tools/perf/Makefile.perf
@@ -40,7 +40,7 @@ include ../scripts/utilities.mak
 #
 # Define EXTRA_PERFLIBS to pass extra libraries to PERFLIBS.
 #
-# Define NO_DWARF if you do not want debug-info analysis feature at all.
+# Define NO_LIBDW if you do not want debug-info analysis feature at all.
 #
 # Define WERROR=0 to disable treating any warnings as errors.
 #
diff --git a/tools/perf/arch/arm/Makefile b/tools/perf/arch/arm/Makefile
index 1d88fdab13bf..9b164d379548 100644
--- a/tools/perf/arch/arm/Makefile
+++ b/tools/perf/arch/arm/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/arch/arm64/Makefile b/tools/perf/arch/arm64/Makefile
index 5735ed4479bb..8a5ffbfe809f 100644
--- a/tools/perf/arch/arm64/Makefile
+++ b/tools/perf/arch/arm64/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_JITDUMP := 1
diff --git a/tools/perf/arch/csky/Makefile b/tools/perf/arch/csky/Makefile
index 88c08eed9c7b..119b06a64bed 100644
--- a/tools/perf/arch/csky/Makefile
+++ b/tools/perf/arch/csky/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
diff --git a/tools/perf/arch/loongarch/Makefile b/tools/perf/arch/loongarch/Makefile
index c89d6bb6b184..1cc5eb01f32b 100644
--- a/tools/perf/arch/loongarch/Makefile
+++ b/tools/perf/arch/loongarch/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
diff --git a/tools/perf/arch/mips/Makefile b/tools/perf/arch/mips/Makefile
index cd0b011b3be5..733f7b76f52d 100644
--- a/tools/perf/arch/mips/Makefile
+++ b/tools/perf/arch/mips/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 
diff --git a/tools/perf/arch/powerpc/Makefile b/tools/perf/arch/powerpc/Makefile
index bf6d323574f6..7672d555f6cd 100644
--- a/tools/perf/arch/powerpc/Makefile
+++ b/tools/perf/arch/powerpc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 
diff --git a/tools/perf/arch/riscv/Makefile b/tools/perf/arch/riscv/Makefile
index 90c3c476a242..4664a78a1afd 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -1,4 +1,4 @@
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 PERF_HAVE_ARCH_REGS_QUERY_REGISTER_OFFSET := 1
diff --git a/tools/perf/arch/s390/Makefile b/tools/perf/arch/s390/Makefile
index 56994e63b43a..3f66e2ede3f7 100644
--- a/tools/perf/arch/s390/Makefile
+++ b/tools/perf/arch/s390/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 HAVE_KVM_STAT_SUPPORT := 1
diff --git a/tools/perf/arch/sh/Makefile b/tools/perf/arch/sh/Makefile
index 88c08eed9c7b..119b06a64bed 100644
--- a/tools/perf/arch/sh/Makefile
+++ b/tools/perf/arch/sh/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
diff --git a/tools/perf/arch/sparc/Makefile b/tools/perf/arch/sparc/Makefile
index 4031db72ba71..7741184894c8 100644
--- a/tools/perf/arch/sparc/Makefile
+++ b/tools/perf/arch/sparc/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 
diff --git a/tools/perf/arch/x86/Makefile b/tools/perf/arch/x86/Makefile
index 67b4969a6738..9aa58acb5564 100644
--- a/tools/perf/arch/x86/Makefile
+++ b/tools/perf/arch/x86/Makefile
@@ -1,5 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
 HAVE_KVM_STAT_SUPPORT := 1
diff --git a/tools/perf/arch/xtensa/Makefile b/tools/perf/arch/xtensa/Makefile
index 88c08eed9c7b..119b06a64bed 100644
--- a/tools/perf/arch/xtensa/Makefile
+++ b/tools/perf/arch/xtensa/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0-only
-ifndef NO_DWARF
+ifndef NO_LIBDW
 PERF_HAVE_DWARF_REGS := 1
 endif
diff --git a/tools/perf/builtin-probe.c b/tools/perf/builtin-probe.c
index 003a3bcebfdf..91672bb3047c 100644
--- a/tools/perf/builtin-probe.c
+++ b/tools/perf/builtin-probe.c
@@ -616,7 +616,7 @@ __cmd_probe(int argc, const char **argv)
 	set_option_flag(options, 'L', "line", PARSE_OPT_EXCLUSIVE);
 	set_option_flag(options, 'V', "vars", PARSE_OPT_EXCLUSIVE);
 #else
-# define set_nobuild(s, l, c) set_option_nobuild(options, s, l, "NO_DWARF=1", c)
+# define set_nobuild(s, l, c) set_option_nobuild(options, s, l, "NO_LIBDW=1", c)
 	set_nobuild('L', "line", false);
 	set_nobuild('V', "vars", false);
 	set_nobuild('\0', "externs", false);
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
