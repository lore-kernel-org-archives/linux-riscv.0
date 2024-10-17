Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C02E6D2F7DD
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WPoildXVPZQE80SZtJlw1zgUUq1UpGJfuBL95wEnZFU=; b=rGGEwQ8fgBFqNz
	E1ai0kHOBHYFiIVCUxnkUXVIVu8wZgjIx3NgAln7ukjxAcagZGCL8/vSPH0UnRRXQxqlvZiSyES7d
	HUbDqDV+rj92veJMeOqKFko/6lTn3SPQCe7FQoKOpR2TGpftYifrqGyt/I3Y7hX6lDjfjDDZrmv69
	P9OECjl6O5NNdBZh091qSSup/egmUeMlmO7X4XaIYqrzeNvctgDusm8iwpg3EewXY5Qu3fGOZ5s3w
	THXcWzU4ojWJv3vvfvs3jvGmTlbZEeG116tVgS9HDOCwijhp4lXO/q2IhjL/Oi4BpKnPG7m0gUD7c
	wrBovRa098sTDnqzZayg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Fow-0000000DVKe-00Ou;
	Thu, 17 Oct 2024 02:00:58 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EKl-0000000DKCF-3kUo
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:25:45 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e2971589916so698754276.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124742; x=1729729542; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=izrYBPhm17udGFGkR4Iwcv4Dc//bGf094GyDIT7L4tU=;
        b=rHjGYbSR2ZnVEXQF19bnGw66X0MoQQba8UIErk+4CCgXTCTgDcaW7bKENxSnkX9ro5
         CkSTcmlnZcO6jf5+Xd4zlBJDaG/FoAKUHoDYOwq9Y/ZsNh45zgi/uG23CeaKSTMAdv/X
         sIL/TOy6NAMbq9O2XntA7n5aDGHCaXL4k9rWjS4lyLb5xMQw/bb9AriRKkf7lgoKTSjG
         6zQ9ExQ6lriNkT8R4JY0475jMeDG4vemX8zxnQqpP3rPk4S42+iEcFnWE95G2tsdZNRf
         XyM/OoMY3IdmUXA/ugQ4JRoE86NC9JfJpzPAdRJhHdyxVNHinAlJOuoNV7jJt4OsXk2g
         0MDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124742; x=1729729542;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=izrYBPhm17udGFGkR4Iwcv4Dc//bGf094GyDIT7L4tU=;
        b=KN6almvsTt6NZ9OhBTYE7V2NCNYN9S9LWbqCxOz2k0z8R92KYs+d2FuFC0P6H2ujq6
         d1JYukgDyMXMMnoesULckpZsD8l+/1zstt+dAxvomwO3SlhJgoDKJKrJTl8hZU6PoLIj
         Oi/N5AR1biVs6yLqnSxB9V3AJn9woFONXuKrxkA1daYO3lMSJnhad2AfiWXwVxpVnLOs
         6tBnCpRmTQ1q+U7qKpgbF3sFk9w8GBbiAAHy0NmZJpt8AokzIZT6MXCNbYHtL0vfEtBE
         7BzLT77GqvUxBRc16IGIXX9ecfZiZIvulPFJxO02sMKD5iGXztIQTkkn0jRq4NX5qioV
         X9zw==
X-Forwarded-Encrypted: i=1; AJvYcCWO543UhC6Hz6oy2LIKSwGFhhvy1/a16IYl5ka5onJxq58jOVmqafgoR4432ZAj5zD4fInKONVDaj4OrQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw+DvOZijVUaYMl8ggjY1AI/qTkBENay/V4rq0aImjBk05s5fx7
	u6oIY9XJwFiNJB76aqtlmCbJO4K7fSM44HAFZl/AvjvUFn/SRBnbRwhxRRStTe4EvnkowyWAkHN
	yyWMZoA==
X-Google-Smtp-Source: AGHT+IGe0qtX+nrFLCMypOG0orC3BMXFb6Kx9df1N+z/dKs05V2ms0PPErMRkoeQh6CQMoXF8+l+PYfUhcwf
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a25:aaa3:0:b0:e20:25f5:a889 with SMTP id
 3f1490d57ef6-e29783030e0mr3217276.5.1729124742291; Wed, 16 Oct 2024 17:25:42
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:06 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-7-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 06/20] perf dwarf-regs: Pass ELF flags to get_dwarf_regstr
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
X-CRM114-CacheID: sfid-20241016_172544_027625_1AD0F2B2 
X-CRM114-Status: GOOD (  18.09  )
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

Pass a flags value as architectures like csky need the flags to
determine the ABI variant.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/dwarf-regs.c         |  3 ++-
 tools/perf/util/include/dwarf-regs.h | 11 ++++++-----
 tools/perf/util/probe-finder.c       | 13 +++++++------
 tools/perf/util/probe-finder.h       |  3 ++-
 4 files changed, 17 insertions(+), 13 deletions(-)

diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 1321387f6948..86b3ef638fbb 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -29,7 +29,8 @@
 #define __get_dwarf_regstr(tbl, n) (((n) < ARRAY_SIZE(tbl)) ? (tbl)[(n)] : NULL)
 
 /* Return architecture dependent register string (for kprobe-tracer) */
-const char *get_dwarf_regstr(unsigned int n, unsigned int machine)
+const char *get_dwarf_regstr(unsigned int n, unsigned int machine,
+			     unsigned int flags __maybe_unused)
 {
 	switch (machine) {
 	case EM_NONE:	/* Generic arch - use host arch */
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index ee0a734564c7..925525405e2d 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -80,12 +80,13 @@
 
 #ifdef HAVE_LIBDW_SUPPORT
 const char *get_arch_regstr(unsigned int n);
-/*
- * get_dwarf_regstr - Returns ftrace register string from DWARF regnum
- * n: DWARF register number
- * machine: ELF machine signature (EM_*)
+/**
+ * get_dwarf_regstr() - Returns ftrace register string from DWARF regnum.
+ * @n: DWARF register number.
+ * @machine: ELF machine signature (EM_*).
+ * @flags: ELF flags for things like ABI differences.
  */
-const char *get_dwarf_regstr(unsigned int n, unsigned int machine);
+const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int flags);
 
 int get_arch_regnum(const char *name);
 /*
diff --git a/tools/perf/util/probe-finder.c b/tools/perf/util/probe-finder.c
index 8ea15a2a4397..8a932cc2f63d 100644
--- a/tools/perf/util/probe-finder.c
+++ b/tools/perf/util/probe-finder.c
@@ -56,7 +56,7 @@ static struct probe_trace_arg_ref *alloc_trace_arg_ref(long offs)
  */
 static int convert_variable_location(Dwarf_Die *vr_die, Dwarf_Addr addr,
 				     Dwarf_Op *fb_ops, Dwarf_Die *sp_die,
-				     unsigned int machine,
+				     const struct probe_finder *pf,
 				     struct probe_trace_arg *tvar)
 {
 	Dwarf_Attribute attr;
@@ -166,7 +166,7 @@ static int convert_variable_location(Dwarf_Die *vr_die, Dwarf_Addr addr,
 	if (!tvar)
 		return ret2;
 
-	regs = get_dwarf_regstr(regn, machine);
+	regs = get_dwarf_regstr(regn, pf->e_machine, pf->e_flags);
 	if (!regs) {
 		/* This should be a bug in DWARF or this tool */
 		pr_warning("Mapping for the register number %u "
@@ -451,7 +451,7 @@ static int convert_variable(Dwarf_Die *vr_die, struct probe_finder *pf)
 		 dwarf_diename(vr_die));
 
 	ret = convert_variable_location(vr_die, pf->addr, pf->fb_ops,
-					&pf->sp_die, pf->machine, pf->tvar);
+					&pf->sp_die, pf, pf->tvar);
 	if (ret == -ENOENT && pf->skip_empty_arg)
 		/* This can be found in other place. skip it */
 		return 0;
@@ -1134,7 +1134,8 @@ static int debuginfo__find_probes(struct debuginfo *dbg,
 	if (gelf_getehdr(elf, &ehdr) == NULL)
 		return -EINVAL;
 
-	pf->machine = ehdr.e_machine;
+	pf->e_machine = ehdr.e_machine;
+	pf->e_flags = ehdr.e_flags;
 
 	do {
 		GElf_Shdr shdr;
@@ -1171,7 +1172,7 @@ static int copy_variables_cb(Dwarf_Die *die_mem, void *data)
 	    (tag == DW_TAG_variable && vf->vars)) {
 		if (convert_variable_location(die_mem, vf->pf->addr,
 					      vf->pf->fb_ops, &pf->sp_die,
-					      pf->machine, NULL) == 0) {
+					      pf, /*tvar=*/NULL) == 0) {
 			vf->args[vf->nargs].var = (char *)dwarf_diename(die_mem);
 			if (vf->args[vf->nargs].var == NULL) {
 				vf->ret = -ENOMEM;
@@ -1402,7 +1403,7 @@ static int collect_variables_cb(Dwarf_Die *die_mem, void *data)
 	    tag == DW_TAG_variable) {
 		ret = convert_variable_location(die_mem, af->pf.addr,
 						af->pf.fb_ops, &af->pf.sp_die,
-						af->pf.machine, NULL);
+						&af->pf, /*tvar=*/NULL);
 		if (ret == 0 || ret == -ERANGE) {
 			int ret2;
 			bool externs = !af->child;
diff --git a/tools/perf/util/probe-finder.h b/tools/perf/util/probe-finder.h
index dfcf8cdd9e8d..be7b46ea2460 100644
--- a/tools/perf/util/probe-finder.h
+++ b/tools/perf/util/probe-finder.h
@@ -68,7 +68,8 @@ struct probe_finder {
 	/* Call Frame Information from .debug_frame. Not owned. */
 	Dwarf_CFI		*cfi_dbg;
 	Dwarf_Op		*fb_ops;	/* Frame base attribute */
-	unsigned int		machine;	/* Target machine arch */
+	unsigned int		e_machine;	/* ELF target machine arch */
+	unsigned int		e_flags;	/* ELF target machine flags */
 	struct perf_probe_arg	*pvar;		/* Current target variable */
 	struct probe_trace_arg	*tvar;		/* Current result variable */
 	bool			skip_empty_arg;	/* Skip non-exist args */
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
