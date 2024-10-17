Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89729D2F7D7
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 00:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MYcBSaB503xXn+wU1B6W9TlesS51cC0T7urXBdxB7Hk=; b=qXfj4Telenc5GE
	bD3gGj144y8+8qHzcglE0IDT42Ep2poUAJ5eXCG7nU8amoI1LUktS4KFGgn/JoiyX9i+DQdZ+rT/8
	ww7CrT1sJd56m8nY/j5g0eZnFUK/lzGJ4+sZbJiVfachblYPAZ/hi+hL6tE2fEbI8d9DF+X3MR0AS
	i6e/Swipi2JONoWWJ2LilJOwL8JKCA/GaLAn3lnZTIuFQ2o8m88TyfRhs8wu16fV5XclNPH56wFul
	yeWhDtIMdT5L6+OXBUMdjFAsKRyvlc5KLzllHp5XlkdP4QL/EJ3V25S9zY5o8gxej7IrZPZK2EqSA
	MKBbj59yT2jXDexHx9BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1Eo3-0000000DOpz-21JU;
	Thu, 17 Oct 2024 00:55:59 +0000
Received: from mail-yb1-xb4a.google.com ([2607:f8b0:4864:20::b4a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EKZ-0000000DK5t-375a
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:25:32 +0000
Received: by mail-yb1-xb4a.google.com with SMTP id 3f1490d57ef6-e293150c2c6so814614276.1
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124730; x=1729729530; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mFoNBRLqrUgqoIcVjkPQD2Pr1/YcjMFPTvmF3zk2fK4=;
        b=DKrTBCBHPRm2Vf3vJPq8x4VXldbYLqH8PpND4AKcCc5pYVkrtdiW+BKHtfa2139/zP
         O4hS7G5Z0FrNpKOP//20do1i4eqjDu0nXMJ3x+7pR1OVupuEDBA37nnPC4+8T+YPa9pc
         V1FSwTkyBL2MqdzlaExPRjV/iwFbLtj+GcMoOMR+cHsuqjxBy9Da59MUufstwU70Up1O
         xUheCGW2kI+uphcySGmQE1Ebve+k+KeJNSmmNEvstEktquhjDM1kT0YtfPUlYod2rIOW
         AqBejBvGOnG/B03hpZTicSIVL0hnAXqQQ7SPXmhzf0x+0lBIt1P14wYHT4q2PkoYIUbH
         5KCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124730; x=1729729530;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mFoNBRLqrUgqoIcVjkPQD2Pr1/YcjMFPTvmF3zk2fK4=;
        b=GBY51ZLObuPN1RgHHt+sStw582zx0XyVS8y4eSPPoJpeACqYS5mE7ObJtGzKKuQDU7
         G/gQBU7aaN2JaoFOV8p4zyMqplZNcv8YEmelVwJtyk2l/H+AW3wXLnZy2WmpbFSYeoqa
         BMyph2y2Z1qDIGal937GQfiO5OIoyLzVyeSPgvO9HydYA5Cc2SeTkuTrKigoNpWkmVxR
         K5Brc/QmYOcN6ZjL0juwutncjwF3pHtWSRgj0A3agY6N3dN1R4XPQ2pBzUZf8gjTjbKU
         0M+IpZsH0BhvoRw5TZB+rWTuS1WQfpi+OCymbQeUcFxJNIQkmNN9j9nWGAwjpRnEkDdx
         zS7w==
X-Forwarded-Encrypted: i=1; AJvYcCX88FSpfwU37Z3H1yQ4eBIrHZtl9lgeVdrJOJ7CR8GAJl//4y2VC8yOb0fYSjY8ayq7sU0a5c5qhrTIlA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyf2uWSvDUuPp0KaSI1kdOY9kGK1DWTrNJ8cevRY7l8qJi9p52d
	nSE60DGU+M+YvuNIiRqxR4Xak1gKdhqypo3/7FKpwk9/Reu9cWnuZxW3P+266+3pChu8JIljXOO
	jvrMLug==
X-Google-Smtp-Source: AGHT+IH7A47NlLkmI7JyY+lLOU6RNU024zTixWHwEAwzVgMoGJoUi31CPQwu7Zqb3utm3XVl/ZEc2m8pfELj
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a05:6902:50d:b0:e28:eee0:aaa1 with SMTP id
 3f1490d57ef6-e29782e9f6fmr3106276.4.1729124729872; Wed, 16 Oct 2024 17:25:29
 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:01 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-2-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 01/20] perf bpf-prologue: Remove unused file
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
X-CRM114-CacheID: sfid-20241016_172531_787728_586BF831 
X-CRM114-Status: GOOD (  10.87  )
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

Commit 4a73fca22692 ("perf bpf-prologue: Remove unused file") missed
cleaning up the header file. The code was unnecessary as Commit
3d6dfae88917 ("perf parse-events: Remove BPF event support") removed
building bpf-prologue.c.

Fixes: 4a73fca22692 ("perf bpf-prologue: Remove unused file")
Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/util/bpf-prologue.h | 37 ----------------------------------
 1 file changed, 37 deletions(-)
 delete mode 100644 tools/perf/util/bpf-prologue.h

diff --git a/tools/perf/util/bpf-prologue.h b/tools/perf/util/bpf-prologue.h
deleted file mode 100644
index 66dcf751ef65..000000000000
--- a/tools/perf/util/bpf-prologue.h
+++ /dev/null
@@ -1,37 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2015, He Kuang <hekuang@huawei.com>
- * Copyright (C) 2015, Huawei Inc.
- */
-#ifndef __BPF_PROLOGUE_H
-#define __BPF_PROLOGUE_H
-
-struct probe_trace_arg;
-struct bpf_insn;
-
-#define BPF_PROLOGUE_MAX_ARGS 3
-#define BPF_PROLOGUE_START_ARG_REG BPF_REG_3
-#define BPF_PROLOGUE_FETCH_RESULT_REG BPF_REG_2
-
-#ifdef HAVE_BPF_PROLOGUE
-int bpf__gen_prologue(struct probe_trace_arg *args, int nargs,
-		      struct bpf_insn *new_prog, size_t *new_cnt,
-		      size_t cnt_space);
-#else
-#include <linux/compiler.h>
-#include <errno.h>
-
-static inline int
-bpf__gen_prologue(struct probe_trace_arg *args __maybe_unused,
-		  int nargs __maybe_unused,
-		  struct bpf_insn *new_prog __maybe_unused,
-		  size_t *new_cnt,
-		  size_t cnt_space __maybe_unused)
-{
-	if (!new_cnt)
-		return -EINVAL;
-	*new_cnt = 0;
-	return -ENOTSUP;
-}
-#endif
-#endif /* __BPF_PROLOGUE_H */
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
