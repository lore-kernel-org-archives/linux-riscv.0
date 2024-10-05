Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ED8CCFB43F
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G2TqDlRtj2G/lF69PQsyUSxgMv6bsISMK6Nig781AM4=; b=VJ1jbiXYttWlpy
	ROFlLZXIXQffs9Tl/wq50iWjzWWI4zTYUb7/F6PUDHRkxa2PGHbRZqGp6NroBAoh0bHPxOJpV2lSH
	WQETPhuNBBGWwek6bwmUT4zSlHF8mXxRFFYavuEMmC33vk3m0BoyJGUrahbRMpkJzQPxe51Pm0cZ6
	CslE2A54LX+fJqd6WKdv7YCcS7cBDpWny8pilUdZLIOvLwAjAydIo1Z3+OZq4v1M/RqBrPHww6aFb
	WAmsjJCwyFz+EEtLzJcg2LmMfblx6BS7rVZ0/fzpGvnrQiiZQazjfPc/AfmYaI667Yayf+wvgudso
	a9nycafvy8tjTxOk9xyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxC9O-0000000Fxr1-2J1C;
	Sat, 05 Oct 2024 21:17:18 +0000
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAtH-0000000Fq9Y-3xjz
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:37 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e22f8dc491so58945637b3.1
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158194; x=1728762994; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i2ESjB2YIGNr0kAF0x/rOVXxJN2WJ7SSqyQKEEmQuJA=;
        b=gpdiRRm/ausCNHVNBy8LWvUmv5D9/qXdSkZjJTtehpkz8Sr3z5x0Dz0CqWAN6RwCPB
         Fb67xP+qD6GN/MoGzLbVETouXpOe6oR/2Z/iedZu0CB/yEKpLVwT3BI2LIxEDbWywuRt
         VfnsUvim06Q5Onu8aqlOe0bSH2E1okc962oyyULHTKOP5VJ5turzYCcyRwNqXJBr/WaN
         v6C7PFCVIcBTOev9VU188rXjSr2aRveTQlVpG8L+UDfYYyQdlUwsALXc8I+L1Z21j1Oi
         AOh1ZGCKjEtcVRSWpj6nwW430iZ0wk5WsCgints8B94MSzxZUo7c4oxFsIIMAsBGQV0i
         9yRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158194; x=1728762994;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=i2ESjB2YIGNr0kAF0x/rOVXxJN2WJ7SSqyQKEEmQuJA=;
        b=DLfyXX/aIkEZM91gA71opCQpkIAH1bQibFQTco4clm8wDUI5jlVTPgPWwOnl5EU+d7
         9CQrLwNLdAVg/r8qjYIX804q5OF1cXLqECH+JZKBXBZEheqcHrTzzmOZSHapjYGKM7eA
         ufr4dDXZJ4JtQXLQovTE4raDlJKNJFUVxOH7yLaGjEKUFGuUskHspA/Ivc4X4qkFQnoL
         omzGBhaM7ir9J8vAnb87v4tZ528vscOkcVw9ea5/040/6wIoWfU/x5xOpCqUTMUW/Hk2
         BzzaywGAesZHhKBs+4esXGC64WIyYfjgfQHug1lJNo4+xhggRIZn3hi+8wPGSixjy65J
         a9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA6ReyVf3Ir78cV3vHWC+9itl+kpcTO/K3ZUnYeaQjtajDzq186YeeyG00qn9SgCX6NKei1ZKZ0TuBrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzkLpJku+XHO2uXG7AKkl1wAvAHqfk5/PgHjROBU7WJyfX+l/Mf
	p0hEEvQx0dAJnAffTVcmsSBlfRUVyVFb/9tF4BpCyWEnHyICivygFywKGGqF6cAf2qU+ay+Nnw4
	55B/PEg==
X-Google-Smtp-Source: AGHT+IHEbD4MRwZ2PKCjAUCVKxtlz40qrMSN6DbbdIeVTb8C/0Bd+XGDjYe2Dr3Ix5YBR4/AVrrPnEznaGld
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a25:c512:0:b0:e28:8f62:e735 with SMTP id
 3f1490d57ef6-e28936c055bmr5227276.1.1728158193972; Sat, 05 Oct 2024 12:56:33
 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:26 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-17-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 16/31] perf dwarf-regs: Pass accurate disassembly machine
 to get_dwarf_regnum
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
X-CRM114-CacheID: sfid-20241005_125636_078706_DB61D887 
X-CRM114-Status: GOOD (  15.13  )
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

Rather than pass 0/EM_NONE, use the value computed in the disasm
struct arch. Switch the EM_NONE case to EM_HOST, rewriting EM_NONE if
it were passed to get_dwarf_regnum. Pass a flags value as
architectures like csky need the flags to determine the ABI variant.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate.c           | 6 +++---
 tools/perf/util/dwarf-regs.c         | 8 ++++++--
 tools/perf/util/include/dwarf-regs.h | 5 +++--
 3 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
index 37ce43c4eb8f..b1d98da79be8 100644
--- a/tools/perf/util/annotate.c
+++ b/tools/perf/util/annotate.c
@@ -2292,7 +2292,7 @@ static int extract_reg_offset(struct arch *arch, const char *str,
 	if (regname == NULL)
 		return -1;
 
-	op_loc->reg1 = get_dwarf_regnum(regname, 0);
+	op_loc->reg1 = get_dwarf_regnum(regname, arch->e_machine, arch->e_flags);
 	free(regname);
 
 	/* Get the second register */
@@ -2305,7 +2305,7 @@ static int extract_reg_offset(struct arch *arch, const char *str,
 		if (regname == NULL)
 			return -1;
 
-		op_loc->reg2 = get_dwarf_regnum(regname, 0);
+		op_loc->reg2 = get_dwarf_regnum(regname, arch->e_machine, arch->e_flags);
 		free(regname);
 	}
 	return 0;
@@ -2405,7 +2405,7 @@ int annotate_get_insn_location(struct arch *arch, struct disasm_line *dl,
 				return -1;
 
 			if (*s == arch->objdump.register_char)
-				op_loc->reg1 = get_dwarf_regnum(s, 0);
+				op_loc->reg1 = get_dwarf_regnum(s, arch->e_machine, arch->e_flags);
 			else if (*s == arch->objdump.imm_char) {
 				op_loc->offset = strtol(s + 1, &p, 0);
 				if (p && p != s + 1)
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 7c01bc4d7e5b..1321387f6948 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -70,7 +70,7 @@ __weak int get_arch_regnum(const char *name __maybe_unused)
 }
 
 /* Return DWARF register number from architecture register name */
-int get_dwarf_regnum(const char *name, unsigned int machine)
+int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags __maybe_unused)
 {
 	char *regname = strdup(name);
 	int reg = -1;
@@ -84,8 +84,12 @@ int get_dwarf_regnum(const char *name, unsigned int machine)
 	if (p)
 		*p = '\0';
 
+	if (machine == EM_NONE) {
+		/* Generic arch - use host arch */
+		machine = EM_HOST;
+	}
 	switch (machine) {
-	case EM_NONE:	/* Generic arch - use host arch */
+	case EM_HOST:
 		reg = get_arch_regnum(regname);
 		break;
 	default:
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index f4f87ded5e3d..ee0a734564c7 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -93,12 +93,13 @@ int get_arch_regnum(const char *name);
  * name: architecture register name
  * machine: ELF machine signature (EM_*)
  */
-int get_dwarf_regnum(const char *name, unsigned int machine);
+int get_dwarf_regnum(const char *name, unsigned int machine, unsigned int flags);
 
 #else /* HAVE_LIBDW_SUPPORT */
 
 static inline int get_dwarf_regnum(const char *name __maybe_unused,
-				   unsigned int machine __maybe_unused)
+				   unsigned int machine __maybe_unused,
+				   unsigned int flags __maybe_unused)
 {
 	return -1;
 }
-- 
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
