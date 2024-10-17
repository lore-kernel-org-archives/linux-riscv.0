Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8D3ED2F7E0
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JZuLa8tXRglbiYKS9Euwdoq29qey78Y2iehc6pFBJsU=; b=ZKWPmOm68ZKYSE
	C2Vk2g/JIi/CywUvnx0cfdUP5n7uc67p3wk5Y2GyYcnSQ3q/ARXLl31kSxmuDxK6eLfG2cPlMVJwe
	Bn79v2IHXYAuqeHhXwARA5+++V6xWXEoTCXpAFgelxIkUe/GI5TDVttJeOOXa80y51oVyzq8otR6t
	7Chen5LdKJadNJTSsW30WXZBbb8MkqEySrxs0O/qPuZJEZDRjFfW3c/Yc6Uor+LYWsHA4kD840/v2
	vidzm/BXc9GTBGMcoydMlbIp++olicBI0kuaol3y1kHuXglkXXwCQgEZawBdhuf7SlaEJecxctTSJ
	rXGVUfzKHFo7bfqXBrHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1G3W-0000000DWz9-3Dzt;
	Thu, 17 Oct 2024 02:16:02 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ELM-0000000DKUt-1xqb
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:26:22 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e29135d1d0cso753117276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124779; x=1729729579; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SquaAPD0AcQIjNNI8ogmi7jeRDo2TBHiGE7l1NG90xo=;
        b=VGOPM7WyvG0hGyo4Jy8JxI8ZIzcZucSIKfztHfcm1DV22k2TPe6JXu/vcv1AeuCL2f
         A1rBJbYG5Q2WYt9MT7RY3X5Bq5/RhgG7g37LD8PS9rARE+QSoBWgCBrJbbCE2ySTj3yu
         YwOYL2AADLCDwYj/5RZmc8Rgcc/EsKDf3d0gGVTX9rzRJlxuf1SV622SNkB98mPFiejB
         KFmTr8DqZZB7SyOieW56XZvv56FPRU6M9oPh2QO3NhuGyovEJD2GXvNkEaVMOg8/v8N0
         UFwOs6uAy7VxVak50ZCr6nyOcv25Q9A4w7ePfhSPwYv9fDL6ue2TVSjhDCLVbL4hUXYx
         V0og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124779; x=1729729579;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SquaAPD0AcQIjNNI8ogmi7jeRDo2TBHiGE7l1NG90xo=;
        b=aDaa0zRaUFvE+aseniLc6+rxYvpRF1Mt3spPCTeEN1VtXmGMJzcZDYdSKI71fQ9yj7
         SqGaoP3ItQI4w6m9fU+laPTxtDvfNSdzNE53tMOmjXAq+hpOI1Op64LPhKFrpGGN4rTl
         0Q5k8Jmg+1whRA63+NsPf/wp9Og1gyrJxNxbBNZJO6LpD29WcTt0t1xcgy93ljzRDdaT
         BOAHpy+kqDcVP0KNdrIH2yH3d/djDrQZfmVOa/g2GrEYoGO9H/Gwta6eq8MoFRzUmh04
         UdSionJL/K+N8I13D7ujwAgQ58JScJ2S9KO51j7s0k1MpvVjhHCVxsLg5AC5C4ICQwvD
         7//Q==
X-Forwarded-Encrypted: i=1; AJvYcCVWJasmJ4HrR4xR/y7VD1YjEzwXOWoAjYE1K99OXVSGmPuLxPWONK8RPLxeIPbEF568uwGo18h9g//0Dg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzbrG3NAhJ9jMj6HZbVlDbkmgqe+k9Uqlr7+35b0mANmmgdmvfG
	ZkBL8zopa+iyr/8ev6PnlInjTQtYKvP8xLt9JuHlEBF5z2CHlXU43//eAhSGaSYBzthEoMyUQwr
	asHJf5g==
X-Google-Smtp-Source: AGHT+IGs4WdpXIM0biaGJT8f6W/Ar64INlqNJ5uuSoIpjWhZg3wOMLE81Q/Ij8NPQT52fZqpf6BkfGWtnGFO
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:26c4:0:b0:e28:ef6f:3624 with SMTP id
 3f1490d57ef6-e2978319b29mr3216276.5.1729124778489; Wed, 16 Oct 2024 17:26:18
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:20 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-21-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 20/20] perf build: Remove PERF_HAVE_DWARF_REGS
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
X-CRM114-CacheID: sfid-20241016_172620_566691_4448EB4E 
X-CRM114-Status: GOOD (  15.31  )
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
index 1d3f7dcc6b66..87dae64c0501 100644
--- a/tools/perf/Makefile.config
+++ b/tools/perf/Makefile.config
@@ -551,15 +551,10 @@ ifndef NO_LIBELF
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
index f01ab2171fd0..087e099fb453 100644
--- a/tools/perf/arch/riscv/Makefile
+++ b/tools/perf/arch/riscv/Makefile
@@ -1,5 +1,3 @@
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
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
