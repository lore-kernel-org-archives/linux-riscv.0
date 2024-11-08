Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEA2ED64099
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 23:53:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n/NQ4XP7KjEW+QRuBU4Sp8tsFfKduJo8Jc/DDKocmAM=; b=pwh90S1hQFxIf5
	jZBeigj28BSpINZgAAQieCIe1DlRc0Gw2VVwJqDu8VAczOcDyr9fGtJKAy+esiJ2HwIo6qGdSHDgU
	+jH6NPhovgcuTbfNEVYxmWi0dza/gNZ46CbRrbrK2q2kniizpdDjGE5ffSnV+TdtuK3lWvDj2SlQl
	FAicQiD8d88G6dHiJK2wgg7DCUD4dFA2etCrLbNSir6Nk6EEJ0f6E3ZzIjtNgJDHQpbqBxAP7tE1K
	nmgeO/BTicxzDIn//4e/3wel4T77TzgNaDNNDDSMqBHuz0/bU2S7zOeSxGYHw+1bKoU+WtnSjOTlj
	TtIzbDKaTKwPUSo6Y/kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YnT-0000000CGuy-2jJF;
	Fri, 08 Nov 2024 23:53:47 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgE-0000000CEzB-21IK
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:20 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea95f530fdso51639087b3.1
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:46:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109577; x=1731714377; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=g82RToWDBgAxXg56Q2NaJKBXk5A1APOL73D1eJS6XJQ=;
        b=03x+JYIbeBGXBuNuBo4fCgUBnFXOe0Se5ROEZPU85QlKyNzMGwzfDayTurh3Ic3Wl7
         g6t5RkUZKp9YTbw2tsbOUMwMqXAe9ElWEU0NqQVaeNm1eHvxqOTMec2wjAk/WXtCrLXs
         fjk9z9LN+3X4f3JtJocjzvakkBlpJvxPSBrXOaULxczw20DY7+ACzVhhCavzX1edKX5T
         GTzlbnn8WEqQ1bvGoJGrPVsDlgZGAFfOof5pjGLt3xtx1Wa9wutgnXrPquSv+QEH/G1E
         RjKaHM0iO92O4bZHBfQPRB8ENm9Bro4oiqV5qP46A+cpoZFom5AxCZkq6cjC8n21YzS2
         IXbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109577; x=1731714377;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g82RToWDBgAxXg56Q2NaJKBXk5A1APOL73D1eJS6XJQ=;
        b=uxTvZ3tKBsmwR7UCD2CfHOz6QKRCq9YlmtmC5tZVojxQZc0ipJzCZdkAPfzK4JX7I9
         d7FpH+4j8B9ef2eXZVLecJaxVsxeuGRd8HMxxoEG3J+uBbCQdSK9GjIEnk6zY+1709Ku
         I4Xu+d0bz9Xt1uH20UgU2PEaEDsBY8jTOY+k+BFSsOmoJv+bEx3QOGDVLTXVF0eQgbUo
         RegfJNJMNQ5yS1LPih4NuScn6vAg7KG1ld9wu9ZQPXjZH4Ir6F4d8SaMYKcYRHqlhLUh
         ObzYqXyyOMiKNaSEmRJUKGflFIooYkUKVRT36+uzt70id4gB8uQOqMhoZTRlFgJnuA+0
         EioA==
X-Forwarded-Encrypted: i=1; AJvYcCUzxcRWvXyWjMiIT7D6a91WQmyl94E63XHEnN7hY22hnacIhDwejkGU4QKqDPqBeGgr6ZQ37uY2BqSirg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVi0B0lgUYzwNyuXhTyLbXpS5Zhvs8Rtwz3M92zJfhArVghBha
	QlEHcjankTqIwp+yHcj0/GyYzPGoVDsXwJ6Sotjf2X+fGvqHv3h8Vkc07iy3QZ+29mn+4f9iloE
	YIEcMOg==
X-Google-Smtp-Source: AGHT+IElDJGck4lM83rJ1PEL9nymEB4MsWS2o56lAC0eXJqXdZF9OIb7Wse2J+4ISIY+n+Ta53vUnbF5wBR0
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a5b:142:0:b0:e29:6df8:ef58 with SMTP id
 3f1490d57ef6-e337f861ec6mr5903276.4.1731109576800; Fri, 08 Nov 2024 15:46:16
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:48 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-4-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 03/20] perf dwarf-regs: Add EM_HOST and EF_HOST defines
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
X-CRM114-CacheID: sfid-20241108_154618_640090_D4294B06 
X-CRM114-Status: GOOD (  14.24  )
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

Computed from the build architecture defines, EM_HOST and EF_HOST give
values that can be used in dwarf register lookup. Place in
dwarf-regs.h so the value can be shared. Move some dwarf-regs.c
constants used for EM_HOST to dwarf-regs.h. Add CSky constants that
may be missing.

In disasm.c add an include of dwarf-regs.h as the included
arch/*/annotate/instructions.c files make use of the constants and we
want the elf.h/dwarf-regs.h dependency to be explicit.

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/disasm.c             |  1 +
 tools/perf/util/dwarf-regs.c         |  8 ---
 tools/perf/util/include/dwarf-regs.h | 82 ++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index bd98fec903f7..a525b80b934f 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -18,6 +18,7 @@
 #include "disasm.h"
 #include "disasm_bpf.h"
 #include "dso.h"
+#include "dwarf-regs.h"
 #include "env.h"
 #include "evsel.h"
 #include "map.h"
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 5b7f86c0063f..7c01bc4d7e5b 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -13,14 +13,6 @@
 #include <errno.h>
 #include <linux/kernel.h>
 
-#ifndef EM_AARCH64
-#define EM_AARCH64	183  /* ARM 64 bit */
-#endif
-
-#ifndef EM_LOONGARCH
-#define EM_LOONGARCH	258 /* LoongArch */
-#endif
-
 /* Define const char * {arch}_register_tbl[] */
 #define DEFINE_DWARF_REGSTR_TABLE
 #include "../arch/x86/include/dwarf-regs-table.h"
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index fbdd7307e0c2..ce9f10b3282d 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -2,6 +2,88 @@
 #ifndef _PERF_DWARF_REGS_H_
 #define _PERF_DWARF_REGS_H_
 #include "annotate.h"
+#include <elf.h>
+
+#ifndef EM_AARCH64
+#define EM_AARCH64	183  /* ARM 64 bit */
+#endif
+
+#ifndef EM_CSKY
+#define EM_CSKY		252  /* C-SKY */
+#endif
+#ifndef EF_CSKY_ABIV1
+#define EF_CSKY_ABIV1	0X10000000
+#endif
+#ifndef EF_CSKY_ABIV2
+#define EF_CSKY_ABIV2	0X20000000
+#endif
+
+#ifndef EM_LOONGARCH
+#define EM_LOONGARCH	258 /* LoongArch */
+#endif
+
+/* EM_HOST gives the ELF machine for host, EF_HOST gives additional flags. */
+#if defined(__x86_64__)
+  #define EM_HOST EM_X86_64
+#elif defined(__i386__)
+  #define EM_HOST EM_386
+#elif defined(__aarch64__)
+  #define EM_HOST EM_AARCH64
+#elif defined(__arm__)
+  #define EM_HOST EM_ARM
+#elif defined(__alpha__)
+  #define EM_HOST EM_ALPHA
+#elif defined(__arc__)
+  #define EM_HOST EM_ARC
+#elif defined(__AVR__)
+  #define EM_HOST EM_AVR
+#elif defined(__AVR32__)
+  #define EM_HOST EM_AVR32
+#elif defined(__bfin__)
+  #define EM_HOST EM_BLACKFIN
+#elif defined(__csky__)
+  #define EM_HOST EM_CSKY
+  #if defined(__CSKYABIV2__)
+    #define EF_HOST EF_CSKY_ABIV2
+  #else
+    #define EF_HOST EF_CSKY_ABIV1
+  #endif
+#elif defined(__cris__)
+  #define EM_HOST EM_CRIS
+#elif defined(__hppa__) // HP PA-RISC
+  #define EM_HOST EM_PARISC
+#elif defined(__loongarch__)
+  #define EM_HOST EM_LOONGARCH
+#elif defined(__mips__)
+  #define EM_HOST EM_MIPS
+#elif defined(__m32r__)
+  #define EM_HOST EM_M32R
+#elif defined(__microblaze__)
+  #define EM_HOST EM_MICROBLAZE
+#elif defined(__MSP430__)
+  #define EM_HOST EM_MSP430
+#elif defined(__powerpc64__)
+  #define EM_HOST EM_PPC64
+#elif defined(__powerpc__)
+  #define EM_HOST EM_PPC
+#elif defined(__riscv)
+  #define EM_HOST EM_RISCV
+#elif defined(__s390x__)
+  #define EM_HOST EM_S390
+#elif defined(__sh__)
+  #define EM_HOST EM_SH
+#elif defined(__sparc64__) || defined(__sparc__)
+  #define EM_HOST EM_SPARC
+#elif defined(__xtensa__)
+  #define EM_HOST EM_XTENSA
+#else
+  /* Unknown host ELF machine type. */
+  #define EM_HOST EM_NONE
+#endif
+
+#if !defined(EF_HOST)
+  #define EF_HOST 0
+#endif
 
 #define DWARF_REG_PC  0xd3af9c /* random number */
 #define DWARF_REG_FB  0xd3affb /* random number */
-- 
2.47.0.277.g8800431eea-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
