Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B069D64099
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Nov 2024 23:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GNf788E/aloCgBw3tcGI13W6dnuRyudHjA+ynd4ZKdQ=; b=gICVPesDtxR/du
	CU+VfgQ7oVF0xJTXWdbDXi9rrhdCp5H05WZnbGU4Z2D1bTC9gKWDJsVzyhf512lnwS9baSa6vXAY3
	H3T+pV++69fMxQiQacfEHyOLv8LmWBuLYRYPd6ZuLiL0IczyZ18Kx5iRGeIoTbLnMnruOBfTxg9bm
	YOPiRDuDcF922lg3AZKUum7afHKXo8u4h2V+GcsoKJy6GZb4gN6zaqdSoW7YUgGnWdpj15NEC1dSJ
	j6HgikwSxpX3MpPcdBZAAwxnUBTkmkFXHBuG470iscxipkpma4LroyLQWOVBCdCW6Ps0UA2k5MCnf
	UOABgi3ZCPnOtsDBtlqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YpC-0000000CHAD-1vbr;
	Fri, 08 Nov 2024 23:55:34 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9YgH-0000000CF0L-0HzP
	for linux-riscv@lists.infradead.org;
	Fri, 08 Nov 2024 23:46:22 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6ea863ecfe9so55455367b3.3
        for <linux-riscv@lists.infradead.org>; Fri, 08 Nov 2024 15:46:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1731109579; x=1731714379; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WqfEj71qwDvDkOaRaAnJba0Q5cD+cxzhGu3trqLHupE=;
        b=azYdCVqBaDFNkOh5mYKLC5GkOdB9efQZLx/lib795Mi7fJLF9UrpVuGrtwdaX3m/dm
         wPoFwkcDn3Z9jwAqawXfz1nyt5fMxjOlaIsJCxV3mbP43GGuarCAg5QSIu5LKj0nq6L/
         OCQkoIfz0pWNSZkD9fGrtL/q5c5uqrZdn9BzocV/YzWK8e3p+YX3dNnugRpClRnZMm/k
         oqCRfmJnOiUq9u7VU3xcK813zE6bB47yNovGIFU6qZDk1Mln/GblOiOiTbct76B8cHhg
         GBhN0Of9IERcM4KivXyTwt2+8HiNgbp9cgQtJtyHEeC4xsGg4J6iZ0BbOPfY3iBD8yK8
         MFjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731109579; x=1731714379;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WqfEj71qwDvDkOaRaAnJba0Q5cD+cxzhGu3trqLHupE=;
        b=NCAmQWVwqKWELmQocQAJZ0Uf9/mwhiBZpz6UYO9ED9CT45W3yepqi5c2Oq+szfHjcc
         67OwHkGz9lG9zeHN1pSTkHCtXddtkIpYzDPJdv5xMEmbD6i5Pe3Veq/R/RJrqfY3B9vh
         V+HwQ97fvMzk77NJJR8zaG4P5IUb3xP37BJqSul3/IwDeuLOyfaxM7AnonvAWly5CwFX
         iz27YJapIibiKMqIIcS9344JWQsd0AaYyLXsvdxV84vjwZImSOX+46vNbCndvPK/j1ei
         zMyG5SA9Pm/Zn0ZEAko+PqyG5Dc3b0ezJ+wOh+47pth5W1BR5Tj9BSusHCfv2UiZWLcF
         5O/Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBCnEASlWZJ4mrpHL29M8I4QBAD0yLwQNSCsvpBSGxqnvFxpCzYcdmS7uZv3SNPZ5KEa88ALr1NTZUiA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz3KhLwMvP9vzNH+HXJN2Hwjnr8Di5TYGGnK0GvFBBSMLElG3bl
	cyFNmbGSwFeDEBaD77pz3GCr1/Wpzgs5767vGE7PFzGogBrtt1ojPJ3QNt1EffphcMKCBn44xa+
	f7Z1ybQ==
X-Google-Smtp-Source: AGHT+IFG/coLtc60xe7I+tUPVMErNFQ95tPpAKZEYNJPxy2g446wDwL8CjW44zY00BE7dZq8D8riH1qdukJU
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:6fd2:1e36:6d8c:7c49])
 (user=irogers job=sendgmr) by 2002:a25:949:0:b0:e1d:912e:9350 with SMTP id
 3f1490d57ef6-e337f8beb2amr10471276.6.1731109579378; Fri, 08 Nov 2024 15:46:19
 -0800 (PST)
Date: Fri,  8 Nov 2024 15:45:49 -0800
In-Reply-To: <20241108234606.429459-1-irogers@google.com>
Message-Id: <20241108234606.429459-5-irogers@google.com>
Mime-Version: 1.0
References: <20241108234606.429459-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.277.g8800431eea-goog
Subject: [PATCH v4 04/20] perf disasm: Add e_machine/e_flags to struct arch
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
X-CRM114-CacheID: sfid-20241108_154621_154631_5427D720 
X-CRM114-Status: GOOD (  14.37  )
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

Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
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
2.47.0.277.g8800431eea-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
