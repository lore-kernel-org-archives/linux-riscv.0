Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F50FD6CFA4
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Jan 2026 21:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:Message-ID:References:
	Mime-Version:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HKf/dnwKhyHgvwksp3rRg/tprgmqdtJMfl4QKx6Dzkk=; b=KPiqPYRhA6fodW
	fuEqjF2EnZyJQDauI9GFhUlOoSiJfs4/x0gIp2MFKtvvt1R/m1wqhqnEHeH+JA/Zs9xy8yi8mdUw9
	DTEPYUsdsWV6eyPUhXjBaXg2LlGBKr4EXsxE0NiwpqKEXsUJpWPFAFpUoQNgzjjzayYQbBTK9ok8v
	GOAbbX4HLPeDSamK9jNoHChhdu+XyuNSybJ/OVqhOWoWTDj+rO87uEi9cbklt1Z4yRtjqKIO3NXf2
	ZSLZWH/Vh20YIeBtN77MB7+lZg0y6ND5G0L7qIudoU8A4YXQ2hPyuDuo2q1LQnK+Jqyp6JV/SoJPx
	prAx15opgUEo67P07GhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2LM-00000007mWh-1NH2;
	Thu, 22 Jan 2026 21:35:56 +0000
Received: from mail-dy1-x1349.google.com ([2607:f8b0:4864:20::1349])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vj2L8-00000007mP0-0ajV
	for linux-riscv@lists.infradead.org;
	Thu, 22 Jan 2026 21:35:43 +0000
Received: by mail-dy1-x1349.google.com with SMTP id 5a478bee46e88-2b72a9a9715so4557740eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 22 Jan 2026 13:35:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769117741; x=1769722541; darn=lists.infradead.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=i5GqIncXj45/38tHZN+1uL3tOf3RMALtO8ehBgHmU513M3GULQm3/T6QpqZ7mX5oXB
         qbiC5e33JIZ5tbRpqsCyYyqfGPtkaQkIp5EI/4e6FUxCeMl/APDAVjFm3O4sUuXJHIEO
         6yfBGuclzmmNpxGx0y+rGiJ4bPkGfbvLj9RPBnDyi1fLP40jLTrvRr7REhjInoOrRs7m
         9KYAM09fRIUmK70zetXBKY3rMZJneJAkrkc//3KVJEVh5YVLByzRfExqpH7kpbMIcCj3
         0nEI89SE8YR3jofppcBOtOD3izpLG++2uMjXMafJyD4YH+0yuJhk1eDa+B4IKGpv4LqT
         eFxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769117741; x=1769722541;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xlxy7gGNB7fnsuI8qX0WFdpap2bNeW5xmXABoxpIzho=;
        b=pkbmuC+Ho0SVbYKNT4D1v6L55bemfk8r8UreB3O8bWdW2J1fg9Yyt/ERAa4Tca+TH6
         gGc3bRGiB4DV08ws815Jf8Wa6RmXjGty3F8ArfT0+J7tYc0Y3Vquoz2porf/OXmNJJt6
         OsRWz+hSD8tWrcjtd5QLWoXIWC3xcwrx2WdoqazJnNnbW+LrJUBPq3FkumU5+5mYBNyp
         IIob/sDP2WOwAOLyV3otR+vz8F/FeDKc1/+blMPJtFNypG3W6gAmkemQPhIXp46Rh059
         n1WcvE210q4XPbqAxWv4gWx+0/WMmGp0Z9VaU7mT+WJFq54WKZTG7qLQHsFU41ZFmZN+
         wdZw==
X-Forwarded-Encrypted: i=1; AJvYcCUWzDtzgeGIy5RTtIgkUnc+5ImJRt+bD6QtbUp9jUjhR8jMoeqJZsOXOS+SVZ0G3e2lEiH3iSELNs1m+A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywz7Dv0jBMAANAZJbAj5fao0O66C/i2SCR6aaEsIN5WLEaZOkP0
	iZaIQLmHh2F6U8yajuOqEOywM+bO94z4YIJGMcUXXMGpUIWQc6N4vNFlnDf6y9QRFlX7jGTAv7a
	5ZVCqkQ82Yw==
X-Received: from dybqo12.prod.google.com ([2002:a05:7301:678c:b0:2b6:b6b8:7fee])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a05:7301:578e:b0:2ae:53da:9787
 with SMTP id 5a478bee46e88-2b739beb0bamr355131eec.40.1769117740757; Thu, 22
 Jan 2026 13:35:40 -0800 (PST)
Date: Thu, 22 Jan 2026 13:35:13 -0800
In-Reply-To: <20260122213516.671089-1-irogers@google.com>
Mime-Version: 1.0
References: <20260122213516.671089-1-irogers@google.com>
X-Mailer: git-send-email 2.52.0.457.g6b5491de43-goog
Message-ID: <20260122213516.671089-10-irogers@google.com>
Subject: [PATCH v3 09/12] perf disasm: Refactor ins__is_call/jump to avoid
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
X-CRM114-CacheID: sfid-20260122_133542_179371_9F96B541 
X-CRM114-Status: GOOD (  11.83  )
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
