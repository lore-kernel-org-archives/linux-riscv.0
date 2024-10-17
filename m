Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79DA0D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:56:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1HIlKWNFlA8mSN31XHuEtSC29xjxJ2AjNquSNdpfQXM=; b=EAl2zR6YecAIWW
	MqbCg7Jg9laUEIBrTkdq/gWNGTRJ00Z/xcJHkLz2qWC3o/UOBDPw9i53X87RHmnguhfEufAXa4Grc
	Zb/qZuqdRQnCOmc54mQ7zh0ISknQG88fsdfVeatvbdn6k6yF3560F8fSsRJEtiBB8ZLlvomQUcDMp
	iVmRdzJQC964PsZsV/61xbsiNC9nY+gKpRT+Gds1uY/wV+Q0JDOHDQR3+3nr3AxePkDbSIN1rP9il
	pXMUweOUE9aYhgbb6knxDiOe/n+5EPd/a6kQcGU9SfX/ecOaGwkn3HUCZRTvGEsbKG1wQ61AZQXvd
	PYLzWKyBpMFs2ZByIniw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EoO-0000000DOvg-0XTy;
	Thu, 17 Oct 2024 00:56:20 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EKh-0000000DK8y-0bMu
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:25:40 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2974759f5fso519240276.0
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124738; x=1729729538; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KMncvSxke+r4vucw8oUD2KkaxOVK5uFPUegLmuP56t0=;
        b=omyJaILZrN2IWrn9gfEHJvLqTE/l3gaKeXvcfsdrh3Ln65FK1gzn+tw8Txn0In5ktJ
         AOgLPsVgAbmnLyhYoU8dEhFxJplEMjY8do6uCAf8Nrrt/ChUamJxt6WIDpIJX5SC2tkX
         YuW0YZw604f9TSx8XM5RTjjWsOhmDaK9nRSrPqQStYDSM2bOhE8F3CzeG9z2DpsTVp/7
         yrSjG6AfnPI40pYrIB+s1P2f4tCKFODJoI3d75GC447286do5vMplTxAMfNaBPIyiIt4
         aX92pfszEKs+1iZduxsuXHtwWn0rC7jCzDZn445UbGQCLedY/OdyJYcG82dGL017opoS
         UiRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124738; x=1729729538;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KMncvSxke+r4vucw8oUD2KkaxOVK5uFPUegLmuP56t0=;
        b=YMbddnwikl2zAwaRfvX8XNey3K6vVFNSOtmkmd1ymOjLgkOq9Dsdnbh0hRAoQ8/mwn
         Ru6lFGCo2BsYLa3ePoZfxPad4cD2WeShBuFui2T1nE4yDl4tCCaqJORdDFDBBrAV+YgV
         36S54mmyVqv+Pt2PerBwhEzZfswaXRMQqWhpP1ILFTUBMDR4pMxD3jI8lN4W+HTsPOdm
         UT7Bd3ykXNXNIjj4U13nGtMfpSoFLyLMWxelLxkUO4EvK6D1DYXqcB9lEO+WrtmoQc2A
         AFOsvMVF0VjUicrMxpQbRyMU6iRQu/eB7bN/jP3feJQD0z+wBC+NfAdEL0Se9v00A3+f
         JXAw==
X-Forwarded-Encrypted: i=1; AJvYcCWs1cEaQ+61LJekc0GNNCO6reInco14EZubTOo3ZONCvij05ik4s7k2Owb1gJzpVoWHqWjh1+QM+z//cQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPNq5R/M+qeZx2RIf+NIIQBo0rhBtlJUj/deJmFje1AbptfeaB
	ZM2nX4ngg6n19Aw6CDOoRJpGA0ImOycUMGIfCCsXdjdxfrdy0NAIvuFRV1/5ZqT1FtRlcYHL0Ql
	X+DdqaQ==
X-Google-Smtp-Source: AGHT+IHnKt+0wOaTE7zUTQI2rphyZXnAK5a4MY8raKX1baBAVylSM1xTDZRcbIFg3cQETXVoUICk0Kp05Tww
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:aa0c:0:b0:e1c:ffab:a801 with SMTP id
 3f1490d57ef6-e2b9ce000a9mr1691276.2.1729124737505; Wed, 16 Oct 2024 17:25:37
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:04 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-5-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 04/20] perf disasm: Add e_machine/e_flags to struct arch
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
X-CRM114-CacheID: sfid-20241016_172539_220455_903B6312 
X-CRM114-Status: GOOD (  14.22  )
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

Currently functions like get_dwarf_regnum only work with the host
architecture. Carry the elf machine and flags in struct arch so that
in disassembly these can be used to allow cross platform disassembly.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/arc/annotate/instructions.c       | 2 ++
 tools/perf/arch/arm/annotate/instructions.c       | 2 ++
 tools/perf/arch/arm64/annotate/instructions.c     | 2 ++
 tools/perf/arch/csky/annotate/instructions.c      | 7 ++++++-
 tools/perf/arch/loongarch/annotate/instructions.c | 2 ++
 tools/perf/arch/mips/annotate/instructions.c      | 2 ++
 tools/perf/arch/powerpc/annotate/instructions.c   | 2 ++
 tools/perf/arch/riscv64/annotate/instructions.c   | 2 ++
 tools/perf/arch/s390/annotate/instructions.c      | 2 ++
 tools/perf/arch/sparc/annotate/instructions.c     | 2 ++
 tools/perf/arch/x86/annotate/instructions.c       | 3 ++-
 tools/perf/util/disasm.h                          | 4 ++++
 12 files changed, 30 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arc/annotate/instructions.c b/tools/perf/arch/arc/annotate/instructions.c
index 2f00e995c7e3..e5619770a1af 100644
--- a/tools/perf/arch/arc/annotate/instructions.c
+++ b/tools/perf/arch/arc/annotate/instructions.c
@@ -5,5 +5,7 @@ static int arc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 {
 	arch->initialized = true;
 	arch->objdump.comment_char = ';';
+	arch->e_machine = EM_ARC;
+	arch->e_flags = 0;
 	return 0;
 }
diff --git a/tools/perf/arch/arm/annotate/instructions.c b/tools/perf/arch/arm/annotate/instructions.c
index 2ff6cedeb9c5..cf91a43362b0 100644
--- a/tools/perf/arch/arm/annotate/instructions.c
+++ b/tools/perf/arch/arm/annotate/instructions.c
@@ -53,6 +53,8 @@ static int arm__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 	arch->associate_instruction_ops   = arm__associate_instruction_ops;
 	arch->objdump.comment_char	  = ';';
 	arch->objdump.skip_functions_char = '+';
+	arch->e_machine = EM_ARM;
+	arch->e_flags = 0;
 	return 0;
 
 out_free_call:
diff --git a/tools/perf/arch/arm64/annotate/instructions.c b/tools/perf/arch/arm64/annotate/instructions.c
index f86d9f4798bd..d465d093e7eb 100644
--- a/tools/perf/arch/arm64/annotate/instructions.c
+++ b/tools/perf/arch/arm64/annotate/instructions.c
@@ -113,6 +113,8 @@ static int arm64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 	arch->associate_instruction_ops   = arm64__associate_instruction_ops;
 	arch->objdump.comment_char	  = '/';
 	arch->objdump.skip_functions_char = '+';
+	arch->e_machine = EM_AARCH64;
+	arch->e_flags = 0;
 	return 0;
 
 out_free_call:
diff --git a/tools/perf/arch/csky/annotate/instructions.c b/tools/perf/arch/csky/annotate/instructions.c
index 5337bfb7d5fc..14270311d215 100644
--- a/tools/perf/arch/csky/annotate/instructions.c
+++ b/tools/perf/arch/csky/annotate/instructions.c
@@ -43,6 +43,11 @@ static int csky__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 	arch->initialized = true;
 	arch->objdump.comment_char = '/';
 	arch->associate_instruction_ops = csky__associate_ins_ops;
-
+	arch->e_machine = EM_CSKY;
+#if defined(__CSKYABIV2__)
+	arch->e_flags = EF_CSKY_ABIV2;
+#else
+	arch->e_flags = EF_CSKY_ABIV1;
+#endif
 	return 0;
 }
diff --git a/tools/perf/arch/loongarch/annotate/instructions.c b/tools/perf/arch/loongarch/annotate/instructions.c
index ab43b1ab51e3..70262d5f1444 100644
--- a/tools/perf/arch/loongarch/annotate/instructions.c
+++ b/tools/perf/arch/loongarch/annotate/instructions.c
@@ -131,6 +131,8 @@ int loongarch__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->associate_instruction_ops = loongarch__associate_ins_ops;
 		arch->initialized = true;
 		arch->objdump.comment_char = '#';
+		arch->e_machine = EM_LOONGARCH;
+		arch->e_flags = 0;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/mips/annotate/instructions.c b/tools/perf/arch/mips/annotate/instructions.c
index 340993f2a897..b50b46c613d6 100644
--- a/tools/perf/arch/mips/annotate/instructions.c
+++ b/tools/perf/arch/mips/annotate/instructions.c
@@ -40,6 +40,8 @@ int mips__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->associate_instruction_ops = mips__associate_ins_ops;
 		arch->initialized = true;
 		arch->objdump.comment_char = '#';
+		arch->e_machine = EM_MIPS;
+		arch->e_flags = 0;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/powerpc/annotate/instructions.c b/tools/perf/arch/powerpc/annotate/instructions.c
index 54478cf5cccc..ca567cfdcbdb 100644
--- a/tools/perf/arch/powerpc/annotate/instructions.c
+++ b/tools/perf/arch/powerpc/annotate/instructions.c
@@ -309,6 +309,8 @@ static int powerpc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->associate_instruction_ops = powerpc__associate_instruction_ops;
 		arch->objdump.comment_char      = '#';
 		annotate_opts.show_asm_raw = true;
+		arch->e_machine = EM_PPC;
+		arch->e_flags = 0;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/riscv64/annotate/instructions.c b/tools/perf/arch/riscv64/annotate/instructions.c
index 869a0eb28953..55cf911633f8 100644
--- a/tools/perf/arch/riscv64/annotate/instructions.c
+++ b/tools/perf/arch/riscv64/annotate/instructions.c
@@ -28,6 +28,8 @@ int riscv64__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->associate_instruction_ops = riscv64__associate_ins_ops;
 		arch->initialized = true;
 		arch->objdump.comment_char = '#';
+		arch->e_machine = EM_RISCV;
+		arch->e_flags = 0;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/s390/annotate/instructions.c b/tools/perf/arch/s390/annotate/instructions.c
index eeac25cca699..c61193f1e096 100644
--- a/tools/perf/arch/s390/annotate/instructions.c
+++ b/tools/perf/arch/s390/annotate/instructions.c
@@ -166,6 +166,8 @@ static int s390__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 			if (s390__cpuid_parse(arch, cpuid))
 				err = SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING;
 		}
+		arch->e_machine = EM_S390;
+		arch->e_flags = 0;
 	}
 
 	return err;
diff --git a/tools/perf/arch/sparc/annotate/instructions.c b/tools/perf/arch/sparc/annotate/instructions.c
index 2614c010c235..68c31580ccfc 100644
--- a/tools/perf/arch/sparc/annotate/instructions.c
+++ b/tools/perf/arch/sparc/annotate/instructions.c
@@ -163,6 +163,8 @@ static int sparc__annotate_init(struct arch *arch, char *cpuid __maybe_unused)
 		arch->initialized = true;
 		arch->associate_instruction_ops = sparc__associate_instruction_ops;
 		arch->objdump.comment_char = '#';
+		arch->e_machine = EM_SPARC;
+		arch->e_flags = 0;
 	}
 
 	return 0;
diff --git a/tools/perf/arch/x86/annotate/instructions.c b/tools/perf/arch/x86/annotate/instructions.c
index c869abe3c31d..ae94b1f0b9cc 100644
--- a/tools/perf/arch/x86/annotate/instructions.c
+++ b/tools/perf/arch/x86/annotate/instructions.c
@@ -202,7 +202,8 @@ static int x86__annotate_init(struct arch *arch, char *cpuid)
 		if (x86__cpuid_parse(arch, cpuid))
 			err = SYMBOL_ANNOTATE_ERRNO__ARCH_INIT_CPUID_PARSING;
 	}
-
+	arch->e_machine = EM_X86_64;
+	arch->e_flags = 0;
 	arch->initialized = true;
 	return err;
 }
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 486c269b29ba..c135db2416b5 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -44,6 +44,10 @@ struct arch {
 				struct data_loc_info *dloc, Dwarf_Die *cu_die,
 				struct disasm_line *dl);
 #endif
+	/** @e_machine: ELF machine associated with arch. */
+	unsigned int e_machine;
+	/** @e_flags: Optional ELF flags associated with arch. */
+	unsigned int e_flags;
 };
 
 struct ins {
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
