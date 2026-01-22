Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43207D3EE96
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 16:55:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKf/dnwKhyHgvwksp3rRg/tprgmqdtJMfl4QKx6Dzkk=; b=iFW7yfXLFFS4Pd
	B9/UFCVsSi0cLcAmit5QpOzsTCtTBT+Giry8nkvZmi7m8HEh9Ivq8IIyibX00KepeSMRpmavyvfbL
	wtmCydA1uLGUsmtgG5Muuxu0K5OdtGXprkmbEiUDK0P60rPVlhlDFYR/j2j1LDRhyMu51RaDHFNuu
	ec+Lm5es/Ir1UdxyEMntFoYmV9C01h0yMFACh/n6LBN7OxqSWgtIdlSNqErWP7AttY2eqfsXGGxye
	x/u9OIAbfcqIuQzt8gO5qtGBa0J535E4KPfYOTqzrWDV8ycGVm+9wtxH9/jOcpD8BXy7kRgTgYYy7
	GU1c4f11KFDkA4XxXFbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixxI-00000007U2y-1lIS;
	Thu, 22 Jan 2026 16:54:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixx6-00000007Tp5-0gTe
	for linux-riscv@bombadil.infradead.org;
	Thu, 22 Jan 2026 16:54:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=; b=YL6i9+8dklZeEkI8gtX5CAZ0ju
	471hJiXJvKqHrQRPLmbr2tQ0hW+GLPHrF7/6xvFsO2AfnKUfl4LmL0GFmzwQYhvpOfG9tsZs9yW5w
	0u+zJW170DvOJtjgT7Or6VZKOek3oikefme1QF9NBxOkXWEmUDiEOm1hOwX9tsC4g0lYOp2VPp+7Y
	nmPnJ+oxHGJHDfFi/ZnfsYLGNWfZl2YM97uNeibVdtYqJNCIBIil+dbx5ve3SfG8OymbhDbcInML8
	z4o3TJ4Iz8hAwfbVJfW+Fg6jwZXFcCjb7bbnCd/f8UAxXCAe/G53nL4E1ZQXOFkxqPH14pQm+yDbC
	XxudfHPQ==;
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixx3-00000000oXs-0cX1
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 16:54:35 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b6f0b345e3so6300377eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 08:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769100871; x=1769705671; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=zkSPCYfDGFlpHVxnPmAook9iknvv/+7FZ9SL4Jrr67FX8bEKGqeIyhmb4LVC4YIK0A
         AxeeoGD+nL19U2jL9dHB3TgXpXtxDW2PBmc0PVlb4+Zs8Wp0rpw7lyOxLOceV3bOOZLc
         VKU3B9KJC9mr7iOTFLxA1lBivB1+xV0XGQSWBwIQzRJeUUaeJ1RVT/c5KBHtLLemFtL6
         3/f8SZDcgylxD6mNGnY17a4BHv2iwbr6Z253beDaie68ICfxMOAQxEpA05aKaDOpWFwL
         MeZWMaKai/duZ+xVZKzV/py6SIDBLIbsOKX/AAR6OY/5GQUVzIKOgP5piie/gYCZcG+u
         ZU9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769100871; x=1769705671;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=Uu9zKDwf7ZS2LBduhla5HEuqPzLdLs2roEhc9ROuLEZ1QiPD9a2Klfr1f9R5SPJPxX
         SEkSJxGlJlMvBCBSojjsTybjaiAFZ797U1GqQdgFVTPO7JpLytQHQqVpDjYWMxkr9/AT
         VGUSZDnec7wrGAu+wydAeVIVaRBuxzp2zeYE1Q8Yis9atx1O3x3+xs7ClUdyydUKLYjT
         GEmfM4+2Qc8lPNgZ6zNeSS3nfv7SuEYTM45EzvTwVEgdGpYv5FaGgsQw628DPpPJyfny
         XyRqtm3K8L3f1Qt2wbmi7M40q1MIlojWuLVh608tpzuW1V0ZH1sbn4f65Q4ZDQzTKeI3
         4b5w==
X-Forwarded-Encrypted: i=1; AJvYcCXAlf4vXWEyhqgNaOao+4AYTNoooSO2wr/qPiQAolPj0/PJn63a+uNk2i2N+pXSevPvmIIGBBiRob9Ybw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx13XdmOG5I/crGtEF85upsZZ6UMNcf+FbKTM10wk36Tz0eYkg9
	urDQYk5oBdhTitwkQkg8L9g6em6agG39g4iXczKgKs8pQ/gvC+bXKZTaKNslgzVCB8jtI2uT3Kz
	PzsTv07irFQ==
X-Received: from dyer16.prod.google.com ([2002:a05:7300:2310:b0:2b0:6a03:e2bb])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:1291:b0:2b7:1744:725e
 with SMTP id 5a478bee46e88-2b7397a364dmr12071eec.0.1769100871210; Thu, 22 Jan
 2026 08:54:31 -0800 (PST)
Date: Thu, 22 Jan 2026 08:54:04 -0800
In-Reply-To: <20260122165407.561888-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122165407.561888-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122165407.561888-10-irogers@google.com>
Subject: [PATCH v2 09/12] perf disasm: Refactor ins__is_call/jump to avoid
 exposing arch ins_ops
From: Ian Rogers <irogers@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, John Garry <john.g.garry@oracle.com>, 
	Will Deacon <will@kernel.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Zecheng Li <zecheng@google.com>, 
	Tianyou Li <tianyou.li@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Julia Lawall <Julia.Lawall@inria.fr>, Suchit Karunakaran <suchitkarunakaran@gmail.com>, 
	Athira Rajeev <atrajeev@linux.ibm.com>, Aditya Bodkhe <aditya.b1@linux.ibm.com>, 
	Howard Chu <howardchu95@gmail.com>, 
	"=?UTF-8?q?Krzysztof=20=C5=81opatowski?=" <krzysztof.m.lopatowski@gmail.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Shimin Guo <shimin.guo@skydio.com>, 
	Sergei Trofimovich <slyich@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-csky@vger.kernel.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_165433_599359_A1E1E48E 
X-CRM114-Status: GOOD (  11.78  )
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

Add booleans indicating whether and ins_ops are call or jump and
return it. This avoids exposing loongarch and s390 ins_ops for the
sake of matching.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/annotate-arch/annotate-loongarch.c | 6 ++++--
 tools/perf/util/annotate-arch/annotate-s390.c      | 3 ++-
 tools/perf/util/disasm.c                           | 6 ++++--
 tools/perf/util/disasm.h                           | 5 ++---
 4 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/tools/perf/util/annotate-arch/annotate-loongarch.c b/tools/perf/util/annotate-arch/annotate-loongarch.c
index 32df10f6fed5..79dc116ade2f 100644
--- a/tools/perf/util/annotate-arch/annotate-loongarch.c
+++ b/tools/perf/util/annotate-arch/annotate-loongarch.c
@@ -57,9 +57,10 @@ static int loongarch_call__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_call_ops = {
+static const struct ins_ops loongarch_call_ops = {
 	.parse	   = loongarch_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *ops,
@@ -106,9 +107,10 @@ static int loongarch_jump__parse(const struct arch *arch, struct ins_operands *o
 	return 0;
 }
 
-const struct ins_ops loongarch_jump_ops = {
+static const struct ins_ops loongarch_jump_ops = {
 	.parse	   = loongarch_jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 static
diff --git a/tools/perf/util/annotate-arch/annotate-s390.c b/tools/perf/util/annotate-arch/annotate-s390.c
index 81db102b3e15..7b2d27b62e6b 100644
--- a/tools/perf/util/annotate-arch/annotate-s390.c
+++ b/tools/perf/util/annotate-arch/annotate-s390.c
@@ -57,9 +57,10 @@ static int s390_call__parse(const struct arch *arch, struct ins_operands *ops,
 	return 0;
 }
 
-const struct ins_ops s390_call_ops = {
+static const struct ins_ops s390_call_ops = {
 	.parse	   = s390_call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 static int s390_mov__parse(const struct arch *arch __maybe_unused,
diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
index 845c2d0f39b1..8c3e9094600a 100644
--- a/tools/perf/util/disasm.c
+++ b/tools/perf/util/disasm.c
@@ -315,11 +315,12 @@ int call__scnprintf(const struct ins *ins, char *bf, size_t size,
 const struct ins_ops call_ops = {
 	.parse	   = call__parse,
 	.scnprintf = call__scnprintf,
+	.is_call   = true,
 };
 
 bool ins__is_call(const struct ins *ins)
 {
-	return ins->ops == &call_ops || ins->ops == &s390_call_ops || ins->ops == &loongarch_call_ops;
+	return ins->ops && ins->ops->is_call;
 }
 
 /*
@@ -469,11 +470,12 @@ const struct ins_ops jump_ops = {
 	.free	   = jump__delete,
 	.parse	   = jump__parse,
 	.scnprintf = jump__scnprintf,
+	.is_jump   = true,
 };
 
 bool ins__is_jump(const struct ins *ins)
 {
-	return ins->ops == &jump_ops || ins->ops == &loongarch_jump_ops;
+	return ins->ops && ins->ops->is_jump;
 }
 
 static int comment__symbol(char *raw, char *comment, u64 *addrp, char **namep)
diff --git a/tools/perf/util/disasm.h b/tools/perf/util/disasm.h
index 83503c5075f9..b6a2a30fdf27 100644
--- a/tools/perf/util/disasm.h
+++ b/tools/perf/util/disasm.h
@@ -93,6 +93,8 @@ struct ins_ops {
 			struct disasm_line *dl);
 	int (*scnprintf)(const struct ins *ins, char *bf, size_t size,
 			 struct ins_operands *ops, int max_ins_name);
+	bool is_jump;
+	bool is_call;
 };
 
 struct annotate_args {
@@ -139,9 +141,6 @@ bool ins__is_fused(const struct arch *arch, const char *ins1, const char *ins2);
 bool ins__is_ret(const struct ins *ins);
 bool ins__is_lock(const struct ins *ins);
 
-extern const struct ins_ops s390_call_ops;
-extern const struct ins_ops loongarch_call_ops;
-extern const struct ins_ops loongarch_jump_ops;
 const struct ins_ops *check_ppc_insn(struct disasm_line *dl);
 
 struct disasm_line *disasm_line__new(struct annotate_args *args);
-- 
2.52.0.457.g6b5491de43-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
