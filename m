Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52B54CFB441
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=syDEWAm9mJ/xmLQ1K8YY/mUwsOWYw1vRzGQkGWP53Xw=; b=G3ogn6l0fLcLHO
	cojh17FqjZwm0Y7wM3p2ZvtXXuJjskziFkEm62OK2Qv9A0m+UebTFJ5C7Y5CyvA7PR2N594xHHVnM
	svJY1Um86Wx1bz6eIs3mtbQ2BSPcI+Vbm38Ja1fxaiz8PAoTgxxa2qrJpr2cdy6he5Mxr/I23RrBQ
	i7RaCZmB5cuM3h5P3FyoD9yGUDFHwtjjmJI4q6sp+0cfOA1TebDPFvtWMQ58jtoCCXKhoSVdeBk6X
	AilukjrvGQ7QL/+duDPJOIUHe5TSEOGntD4zpIEnr1xqOpQ6q1DpCyUNNgdhCbaott44+++sruW6P
	Xiflv7Mpyjs+yHO5Fh6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxCNt-0000000Fz18-0WBg;
	Sat, 05 Oct 2024 21:32:17 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtR-0000000FqEl-1enK
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:47 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e2261adfdeso53826097b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158203; x=1728763003; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VHudwD3HxqIE2xCZ8D7KanMs36PPvPHIODUgdbqENmk=;
        b=D7whxyezQ6uwI5bPaXlUugtbWfRDuvMgfwZBcOM2TBPBeAfoy0UkfNubSb7KEefBUz
         gIinnmPItbtSS55xJLIAzJcKtYoOUvlQezrJvALLYClaouyMUTvfmrjBXUUoxuPCcMqb
         quh9BHLBZUJVUSK1pmyqJ2K+hmUe/98oTGMv3eszBEEPSBhKNEkQZFKU07X37Ii3HB3Z
         a8O1fjqNf2M21p/jhDtSv+Oy2Moz4ukNw1a2QRIMvu7JmuxXS2In9SuITPdr8Gy5hAzJ
         oHoVu4Eq2lnrhQfTG6agl1UnOmJIJUIB+9kB7gk+C3ubgHOyLNQywPZVzi+5g1lHoI/c
         GMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158203; x=1728763003;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VHudwD3HxqIE2xCZ8D7KanMs36PPvPHIODUgdbqENmk=;
        b=ViLIpUVKPhvU+ksdyWobXlqtZIQc+QCJSC0KuQr4Ndzn/3D2x/9VYQrUORie31g7TK
         31gLwv18NtxVo4iFb/PEe7ijfCkdQvAl2dxDMLNMdibgbO5RXk1/kf+gpRGRTC/WIYYn
         KzPUiw+sa5HzN+VVf8Kubjf+7ltsyvDz7sxx5Z8Vrf1iLFRbb04oxjM3cPu0FQc1pzXZ
         kOdYaAGE30Cg5U6izSx+gggLGyN8Pps5D7Ywy7/wAatqsr98dkds9/pdUqBcdhPLhxQF
         A56FGJnU1xtsDPTx+PlfLR/7RALtUiYyABT9GM6nRGRnB+Clt2glIDo3Ew6Gn0GzlIYA
         CW0Q==
X-Forwarded-Encrypted: i=1; AJvYcCUHSJKlhSCn8JNZvTuDGymB4GoVoGTOHmx9MoWRMxgEAFoRlyqDrqoJhCwEUptjb5Ru7Jeq1weQBGwb+w==@lists.infradead.org
X-Gm-Message-State: AOJu0YxGA/jUIDNi1ZJEiS4ygqrqby29k8hp8Qj+VgDZM71m1FYCGOCD
	SSCOK2JoePQmola6+VhXA53wIspm9kHwVzzSZa1/iBxkROQnnX6v546Qwsx3Bng5uwhNcSkuXfE
	CWxbQuQ==
X-Google-Smtp-Source: AGHT+IGeOfTmumngcabHRBihmvSKyViFpRQ89UdAfehUtwMJwCeL6FioC5a/4B+7LmCwWalq3BF9Zy/Nx0rQ
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:61c8:b0:6e2:e462:e191 with SMTP
 id 00721157ae682-6e2e462e214mr604667b3.6.1728158203030; Sat, 05 Oct 2024
 12:56:43 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:30 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-21-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 20/31] perf arm: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241005_125645_537159_AF4C5478 
X-CRM114-Status: GOOD (  18.86  )
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
EM_NONE cases for arm in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arm/util/Build        |  2 -
 tools/perf/arch/arm/util/dwarf-regs.c | 61 ---------------------------
 tools/perf/util/dwarf-regs.c          |  4 +-
 tools/perf/util/include/dwarf-regs.h  |  2 +-
 4 files changed, 3 insertions(+), 66 deletions(-)
 delete mode 100644 tools/perf/arch/arm/util/dwarf-regs.c

diff --git a/tools/perf/arch/arm/util/Build b/tools/perf/arch/arm/util/Build
index e06fea1ea8ff..f7a8b37d1c68 100644
--- a/tools/perf/arch/arm/util/Build
+++ b/tools/perf/arch/arm/util/Build
@@ -1,7 +1,5 @@
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
-
 perf-util-$(CONFIG_LOCAL_LIBUNWIND)    += unwind-libunwind.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
diff --git a/tools/perf/arch/arm/util/dwarf-regs.c b/tools/perf/arch/arm/util/dwarf-regs.c
deleted file mode 100644
index fc5f71c91802..000000000000
--- a/tools/perf/arch/arm/util/dwarf-regs.c
+++ /dev/null
@@ -1,61 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright (C) 2010 Will Deacon, ARM Ltd.
- */
-
-#include <stddef.h>
-#include <linux/stringify.h>
-#include <dwarf-regs.h>
-
-struct pt_regs_dwarfnum {
-	const char *name;
-	unsigned int dwarfnum;
-};
-
-#define REG_DWARFNUM_NAME(r, num) {.name = r, .dwarfnum = num}
-#define GPR_DWARFNUM_NAME(num) \
-	{.name = __stringify(%r##num), .dwarfnum = num}
-#define REG_DWARFNUM_END {.name = NULL, .dwarfnum = 0}
-
-/*
- * Reference:
- * http://infocenter.arm.com/help/topic/com.arm.doc.ihi0040a/IHI0040A_aadwarf.pdf
- */
-static const struct pt_regs_dwarfnum regdwarfnum_table[] = {
-	GPR_DWARFNUM_NAME(0),
-	GPR_DWARFNUM_NAME(1),
-	GPR_DWARFNUM_NAME(2),
-	GPR_DWARFNUM_NAME(3),
-	GPR_DWARFNUM_NAME(4),
-	GPR_DWARFNUM_NAME(5),
-	GPR_DWARFNUM_NAME(6),
-	GPR_DWARFNUM_NAME(7),
-	GPR_DWARFNUM_NAME(8),
-	GPR_DWARFNUM_NAME(9),
-	GPR_DWARFNUM_NAME(10),
-	REG_DWARFNUM_NAME("%fp", 11),
-	REG_DWARFNUM_NAME("%ip", 12),
-	REG_DWARFNUM_NAME("%sp", 13),
-	REG_DWARFNUM_NAME("%lr", 14),
-	REG_DWARFNUM_NAME("%pc", 15),
-	REG_DWARFNUM_END,
-};
-
-/**
- * get_arch_regstr() - lookup register name from it's DWARF register number
- * @n:	the DWARF register number
- *
- * get_arch_regstr() returns the name of the register in struct
- * regdwarfnum_table from it's DWARF register number. If the register is not
- * found in the table, this returns NULL;
- */
-const char *get_arch_regstr(unsigned int n)
-{
-	const struct pt_regs_dwarfnum *roff;
-	for (roff = regdwarfnum_table; roff->name != NULL; roff++)
-		if (roff->dwarfnum == n)
-			return roff->name;
-	return NULL;
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 18e916c8e993..fd21f9e90e40 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -32,14 +32,14 @@
 const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
 			     unsigned int flags __maybe_unused)
 {
-#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64
+#if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
 	}
 #endif
 	switch (machine) {
-#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64
+#if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index e640657f69c8..0b533409d82a 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -79,7 +79,7 @@
 #define DWARF_REG_FB  0xd3affb /* random number */
 
 #ifdef HAVE_LIBDW_SUPPORT
-#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__)
+#if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
