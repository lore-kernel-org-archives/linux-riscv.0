Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B9DCCFB441
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Oct 2024 21:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQnr8etFqDxfhGxThrHW7vMPMOvi9lNvThBOKTy2haA=; b=A1W+ybgwPuk+jV
	sAlNPjCjZEuh8WyMEWFCBXLK3QvjRufq/RDM/Ss74b0HqJTkIFg9HAaHEXmSn3xeK2C2aFiQaBVwc
	vmWb55cUGrQaAUcsTpvOhwtQAXbcdtT5SrbynyA07WjURZOGtY732pwZXBG1zaymUYz4pW2/QOf6a
	BIggm4lrQmr15W2DKiRqO0ITFeTu/vKNEnvTFyxzyEAd6tdtHam9vrjvqXDBg0w//6ZuT0icp2gB1
	7ByzrjekUQHIzlDvgY/jUTDTNfSQRB/xhKEhjb8FZD9W3Gs2qtihInlt3rQatqW5lvkF/pgf52fOS
	UCpz9/1Wwu6+BphF6CWA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sxC9M-0000000Fxqn-341R;
	Sat, 05 Oct 2024 21:17:16 +0000
Received: from mail-yw1-x1149.google.com ([2607:f8b0:4864:20::1149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sxAt9-0000000Fq4J-0gME
	for linux-riscv@lists.infradead.org;
	Sat, 05 Oct 2024 19:56:28 +0000
Received: by mail-yw1-x1149.google.com with SMTP id 00721157ae682-6e278b2a5c4so58287407b3.2
        for <linux-riscv@lists.infradead.org>; Sat, 05 Oct 2024 12:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1728158185; x=1728762985; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=h/3DcHqmbVdZp4yWyNeZgt8hRC6twmBuki9IOXFR1Fk=;
        b=hiUQv17J3KZTNEV4O3pCDHCzSCoa5fWflKJVdY3OjSc/+EDxvupK0ukPj3dvQA7zw1
         imFBrEhsQj1g/uSj0HP8vkO4nbz8YNKjIADrXh8qI+yg0uqoI0N5KY1wSQnGAKs0OAUG
         Z03Npd5oHNpFWeUPZYLv/tqZT4tuM0W+eUYalXQZARFYEE1Y0zqQi55PosUd8Sxk69fd
         PjOKMl6erfgL/LYqZdF4aUZx9PdlyA/Vxpw+uMBJbSTpFWAIaz3Eil1RtXURgnf91kyZ
         xfcmaU3XGvhDdPWJXjKk7w0vWE0Nec8RuUYZ1EpbW4maKgsmgCQ3eejGFuTmWJa3LCnG
         mwjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728158185; x=1728762985;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h/3DcHqmbVdZp4yWyNeZgt8hRC6twmBuki9IOXFR1Fk=;
        b=piyCNIQCe4dV2W55HyoZubDqrPDhTF78vUy+6WvJJ/Idg3anyOpiEjZu84WRnH6i2t
         wO8pZ3Kiv+z+MZY8wkRc/ixXSzg9vExYGerQNz+yo9xo4jf90YbP4//ygi36S+/pL86X
         Sh2vuqv26rNvOQWpHKhhcXVTX96Sw30Z3u5ICHCYN+dNTG4zl6pf/W7otCWRo9UXQ1Bk
         A3KNU9fIYsR3Fw+86xrXwEeggISLfav9OB49C/2GuLaekt3mYzm5t35mtoIc/QUZWXJh
         2h8yadwAG3pl+torleYZ/uGzKRgERKAkBQec3aLmHpf714ainhJt83GRbAaqcp4nJh3u
         WbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWTlfpSdCesJBTDPzSLVjxxpmk7igTj9Dcv4DTVuLtVYLIWffg8rCRyEBreUak+vDRYv0CeLbMmUKXJFA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy4Bv5LJ0VEGB4mj4uID16mY+I42X7vcXadeOZ85uIHZ0aTRFwk
	+AXU93mSLtxWOYPzqXRb5QKYEvNlJlJGVYQLxD4SPEjWfdtjp+SMKr4sxDWq6AL2hUL8s2zZX77
	21/hUUw==
X-Google-Smtp-Source: AGHT+IFisEJrumnwhsHUHkUR8QAhAmeXxmT2VH1277V55Dcfln2xbxOQ1sJmjrLj9pgNFaHmZqxuL/PfQjiy
X-Received: from irogers.svl.corp.google.com ([2620:15c:2a3:200:4c2:5b4d:8797:7249])
 (user=irogers job=sendgmr) by 2002:a05:690c:f8b:b0:6e2:ef1:2551 with SMTP id
 00721157ae682-6e2c72af775mr523117b3.8.1728158185409; Sat, 05 Oct 2024
 12:56:25 -0700 (PDT)
Date: Sat,  5 Oct 2024 12:55:22 -0700
In-Reply-To: <20241005195541.380070-1-irogers@google.com>
Message-Id: <20241005195541.380070-13-irogers@google.com>
Mime-Version: 1.0
References: <20241005195541.380070-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.rc0.187.ge670bccf7e-goog
Subject: [PATCH v2 12/31] perf bpf-prologue: Remove unused file
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
X-CRM114-CacheID: sfid-20241005_125627_277116_98C5B52B 
X-CRM114-Status: GOOD (  10.36  )
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
2.47.0.rc0.187.ge670bccf7e-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
