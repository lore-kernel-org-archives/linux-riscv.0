Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F0ACFB43F
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QHDeWNvgDwCb8HZQJ9q1ynFPopaAbKey4P1kAT09+gY=; b=uhXuaNE85IqiLe
	mgCjkZvKtWmgPKkSgUCOgCb+sCZZCHhgWl4myN7TqDLRolDuc0QuFEECgt3IXdL6BC3IkALxb73oQ
	WsHMPlLGRVrVOYUw3uXpLabgrLZ+71wfMXak2EoK89NYRetT0BxBqXPwsb1qR4OLMwSh0eVFL2IsW
	aKc0zdauH4D9SB8RVrlzRFNvW7VKR1t13xXSESaTAOmKbHzBbPixCZdRhKZCXgki8FGfWdl6eWeR0
	zrVswlhjv5p5ZFEp26H+w2dy8bePoZ7uv3deslIvFeZvSG2H560U/jPGk8C1TCh7vpDnfw68a9Bxh
	MCyr/bgzG6ZbLCbZmfKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCNz-0000000Fz5u-07lV;
	Sat, 05 Oct 2024 21:32:23 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtd-0000000FqMs-44ZF
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:59 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e260b122770so4965127276.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158217; x=1728763017; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=l/F9b72Zkf2GsIFu+2DXDg5IeMJO1DkrHhzQ8sRYn1M=;
        b=Lc+fUxbHBBHd9blU976kOG0y9hfc8T41ttrdhC+sskDMqskI9tRBU2Za08NdHvTQJD
         WGNNy5nE5tI1cmgZAqrLfI2+44QgJP7NR5sfaxxVW6/63TDd6XurcJQwRQTZqV2p/KxJ
         NuyaDu3AED0FAmSHjk0bMmllHV21Worfy4EZSgXSSTnmmwup8LhYvrSYTTFMoZ+cZ9VN
         98YHtgwnewIk8A1jPQfnfBmrBj8vVr5FuVJYyRx765gjVlGD6PWjJQ3D/SiNEOARX/EO
         N6jZx9L12UX97c4bLC2WA8uLjVgqUXD715fcNdqNyBsYG8Q/eNacm+BDDmhFO/RSQaEQ
         lbLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158217; x=1728763017;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=l/F9b72Zkf2GsIFu+2DXDg5IeMJO1DkrHhzQ8sRYn1M=;
        b=anfXZ+hcbjtzQGxJJ+W7In6Um6b6MCIA0B5VIG0H3iPV06AoLvr8h3mN5Gwn+NbVUW
         DfqF8Kxd3EFU2vPfSuxinRI2+eNNNm6aVg8jb+k5CGBlXIm2LZbpAwTC6MVJlJiP6Df6
         31Bu6Fj38DxRMLmptCnSn4QCG3NllWK9aWxPTymDgd9YV3cTZF2AxFKiegPmbJ63vXPn
         3SMQBoVIIB2B5ZuGLjPdrSgXKetXYrHiNqEbF8QK1ycKVKxn5SYHvMY1eDOYZGYu0ADV
         cTPRzJGyAbB/YjzqrXbOLfbtFAWSOb5J0af6oKidhYFn5iQU2br9zr/jkzS8mGb6qWi3
         q81w==
X-Forwarded-Encrypted: i=1; AJvYcCV534CItJuBftDLMlWr9iAu5JjcsezCOr4jwYaT8IGTbaGGDwM2nmTkxDKlikL0Hb6tbd7qYxhgCpeERQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyMf2LqrS+YtzziF3R91OQv2kqu84cM4Aw6kpQNO2RzNoR39qKr
	jPYLgr8KBg5PK2PieYkquuUbShbiTr7ciT2VMR5w8z9A7s8niLTkRMHS3FJa16GW3Mp+ZYjweHZ
	vYB1lqw==
X-Google-Smtp-Source: AGHT+IEj5O0gwc8Gc93w9xy2xazDNAARz52y6kjE2x/HhCkqgnOqkwvm6mvHCmrWAxypq0YrA/EuiMHDARCd
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:7488:0:b0:e16:51f9:59da with SMTP id
 3f1490d57ef6-e289391f800mr15573276.6.1728158216595; Sat, 05 Oct 2024 12:56:56
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:36 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-27-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 26/31] perf s390: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241005_125658_041882_E7155AEE 
X-CRM114-Status: GOOD (  16.16  )
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
the function can never be called. So remove as dead code. Tidy up the
EM_NONE cases for s390 in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/s390/util/Build        |  1 -
 tools/perf/arch/s390/util/dwarf-regs.c | 16 ----------------
 tools/perf/util/dwarf-regs.c           |  4 ++--
 tools/perf/util/include/dwarf-regs.h   |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 tools/perf/arch/s390/util/dwarf-regs.c

diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/Build
index 787410f99bb3..736c0ad09194 100644
--- a/tools/perf/arch/s390/util/Build
+++ b/tools/perf/arch/s390/util/Build
@@ -2,7 +2,6 @@ perf-util-y += header.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
 perf-util-y += machine.o
diff --git a/tools/perf/arch/s390/util/dwarf-regs.c b/tools/perf/arch/s390/util/dwarf-regs.c
deleted file mode 100644
index 5bcf3192623a..000000000000
--- a/tools/perf/arch/s390/util/dwarf-regs.c
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright IBM Corp. 2010, 2017
- * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
- *
- */
-
-#include <linux/kernel.h>
-#include "dwarf-regs-table.h"
-
-const char *get_arch_regstr(unsigned int n)
-{
-	return (n >= ARRAY_SIZE(s390_dwarf_regs)) ? NULL : s390_dwarf_regs[n];
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 2c6b197556dd..1649fc07f4f5 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -34,7 +34,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
     || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV
+    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -43,7 +43,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
     && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV
+    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 35f4f33205da..25f3d6b90f10 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -81,7 +81,7 @@
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
     && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__) && !defined(__riscv__)
+    && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
