Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68299D2F7DA
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Oct 2024 02:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=t6oIZKkNrioFQwMW23ZyA7PNVtsVKGYbs+6nnOkCWP0=; b=Gs/3TB1ccbsg7p
	MC6kn6vuodAeEsybchDSIgwP0dv7xIzRJSixa8TUwD+uICuVrda4FjLILR8aIUMluf+7gS2oZP2g2
	BnW/Vg5lk8KzIVM0K2Ue/dNp6mbDqi9wMbRE0ZIIu30q/NVzaAtclyaU8LOYcyrrjwIAvV8pf4QvC
	PKufqd4VHdzTvLQYE1qzL1I4tg8VjUlQhRSyULSty6Xm5azMAO3Ez6JALtAlz42lGo7URi4VFD80K
	rbOHBtQzgj+FZ2um6h7Y2/AjaIz2TTQAC//BcyyR8I5mgJ4xuCGg61cl8LbJeuATx3/KYySvJ4nim
	m8JBjTYo9S/XhlmSu+GA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t1G3T-0000000DWw3-30yK;
	Thu, 17 Oct 2024 02:15:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1ELG-0000000DKS2-3TOW
	for linux-riscv@bombadil.infradead.org;
	Thu, 17 Oct 2024 00:26:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:To:From:Subject:
	References:Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+vS3pAQ+haKP/8iv+6aAP7RJEQP9tkb6yzoJLAeVBwY=; b=My2EIkwtL2wHsBOgv5u4ggavbn
	a/SgfEQBEMZqILSxefmYuIfH0lCiZZYr5N4QgkvnqhJJczEcMK/QUD8S7oTRsheHHKgDCuuNmbVZh
	YdUJF8Wi5eAT/nD0CVQ5J8xozTLbgjmE6BnfveRL3/ikTd3Y6KaozR70keT6QKKAajxfUaWj/IjBr
	Y1GaR+7as6c+xeHwb9sx/QUXjQpZGxOahDTsJ9QGeFI7EQB8bwTusFto2BmrFpYLfz1pKEqS5EmSi
	2rFhN9jFdQXCe4YqbDr3VitEKo4EBKtiO5iFTP2qqOdx5aqvnd3hlO4d8F3tmX4vgbJWdIpPVLzbx
	yXFhBkfQ==;
Received: from mail-yw1-x114a.google.com ([2607:f8b0:4864:20::114a])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t1EL9-00000006yKu-4BgJ
	for linux-riscv@lists.infradead.org;
	Thu, 17 Oct 2024 00:26:12 +0000
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-6e3705b2883so10392777b3.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 17:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1729124765; x=1729729565; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+vS3pAQ+haKP/8iv+6aAP7RJEQP9tkb6yzoJLAeVBwY=;
        b=JlLUJdNR6Gj7mo+IzAgXwHyclcDChaKIEuERfSvb85iLLEMWC7w95BKJzB+3o51mnC
         FXHpzr7FUQ3os8403lYKvGMjbOCfalpfzlL+y7uX/yKN7Fq/MQ8rgS1eSeCFpP5Q+zvt
         JzoJVXRFuJYdf/uWN2PlGAjIZjPt0wTqUAxCM+G0uMzkpDrc97Mk8ZfTFPMOFnsM6X2l
         JaypoQ7DEzqKYpgoWPWW+qmDzwdXfVpuv77TZhPc6/NRplqCTZeRelbCSlPm7ww61v/b
         Xa01olxLF1G93Gc3Ly76eMUzZeZWdIalWlCKPXjx1mdEIPG9KV7X7AVk6QQIbVpEOz5K
         4QEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729124765; x=1729729565;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+vS3pAQ+haKP/8iv+6aAP7RJEQP9tkb6yzoJLAeVBwY=;
        b=SyH5GObMY0YO1XZUt4aW6cCxZM+EPJwoEplwa3q3rAx6UtIfJYcQE9ownDjC6IY7OA
         cfNJyd4HBTo46XI1zH7YzPIgQMfGqJr635AcL8ieckGvchvh4I5JsmrHKRQ5uRPgfRIU
         i4HzVya4Db31rkZ8giEYsSsVubGKIGwKDpUtUiyhVAUIpcs8aeDIWO81fyWxv8DILtjZ
         FXxoMKm+NEhWFJXbeBzikxx/VogNGKtTjoYtraFtvsfMOsTF41e6odNJxPoXaAoXsYU9
         0+KBwRC3+hl26nCuN26a0I+g29TgeELbgnId0kXYqsDOb2xyNNExbPiCIItS+bJc4hW+
         l3Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXrRkkpj69x79R2TXbEbYDwvPpQ8CVgshB4IGIBzzoZq8nedgNXsrVUHGDWvA6MPnNLsJRWPHf3VlEiMg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzlhQyjl4fhLPcb2yC+suviebocNNn7GLpb5iimk6e3ByGvfkna
	ulPHlu5+Kfb+I7q8eXvxatx7xSZdv0KgnBUKEId7UGTZ//evQODe8QCBfUVbOGNjmxG8rrvNtpt
	wFzGYRw==
X-Google-Smtp-Source: AGHT+IHww5hKkYtrtEd7xFxuwiqgL1g9EP1jrDvOSFsM0YJ3aBoaypiL1q7z5gT/re1gw8cKAYiVLMh2TMTK
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:a00a:f237:9bc0:79c])
 (user=irogers job=sendgmr) by 2002:a05:690c:9a84:b0:6e3:19d7:382a with SMTP
 id 00721157ae682-6e3d3f7f52fmr1338867b3.1.1729124764951; Wed, 16 Oct 2024
 17:26:04 -0700 (PDT)
Date: Wed, 16 Oct 2024 17:25:15 -0700
In-Reply-To: <20241017002520.59124-1-irogers@google.com>
Message-Id: <20241017002520.59124-16-irogers@google.com>
Mime-Version: 1.0
References: <20241017002520.59124-1-irogers@google.com>
X-Mailer: git-send-email 2.47.0.105.g07ac214952-goog
Subject: [PATCH v3 15/20] perf s390: Remove dwarf-regs.c
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
X-CRM114-CacheID: sfid-20241017_012610_869136_0FCB893B 
X-CRM114-Status: GOOD (  16.54  )
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
EM_NONE cases for s390 in dwarf-regs.c.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/perf/arch/s390/util/Build        |  1 -
 tools/perf/arch/s390/util/dwarf-regs.c | 16 ----------------
 tools/perf/util/dwarf-regs.c           |  4 ++--
 tools/perf/util/include/dwarf-regs.h   |  2 +-
 4 files changed, 3 insertions(+), 20 deletions(-)
 delete mode 100644 tools/perf/arch/s390/util/dwarf-regs.c

diff --git a/tools/perf/arch/s390/util/Build b/tools/perf/arch/s390/util/Build
index 787410f99bb3..736c0ad09194 100644
--- a/tools/perf/arch/s390/util/Build
+++ b/tools/perf/arch/s390/util/Build
@@ -2,7 +2,6 @@ perf-util-y += header.o
 perf-util-$(CONFIG_LIBTRACEEVENT) += kvm-stat.o
 perf-util-y += perf_regs.o
 
-perf-util-$(CONFIG_LIBDW) += dwarf-regs.o
 perf-util-$(CONFIG_LIBDW_DWARF_UNWIND) += unwind-libdw.o
 
 perf-util-y += machine.o
diff --git a/tools/perf/arch/s390/util/dwarf-regs.c b/tools/perf/arch/s390/util/dwarf-regs.c
deleted file mode 100644
index 5bcf3192623a..000000000000
--- a/tools/perf/arch/s390/util/dwarf-regs.c
+++ /dev/null
@@ -1,16 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Mapping of DWARF debug register numbers into register names.
- *
- * Copyright IBM Corp. 2010, 2017
- * Author(s): Hendrik Brueckner <brueckner@linux.vnet.ibm.com>
- *
- */
-
-#include <linux/kernel.h>
-#include "dwarf-regs-table.h"
-
-const char *get_arch_regstr(unsigned int n)
-{
-	return (n >= ARRAY_SIZE(s390_dwarf_regs)) ? NULL : s390_dwarf_regs[n];
-}
diff --git a/tools/perf/util/dwarf-regs.c b/tools/perf/util/dwarf-regs.c
index 2c6b197556dd..1649fc07f4f5 100644
--- a/tools/perf/util/dwarf-regs.c
+++ b/tools/perf/util/dwarf-regs.c
@@ -34,7 +34,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 {
 #if EM_HOST == EM_X86_64 || EM_HOST == EM_386 || EM_HOST == EM_AARCH64 || EM_HOST == EM_ARM \
     || EM_HOST == EM_CSKY || EM_HOST == EM_LOONGARCH || EM_HOST == EM_MIPS || EM_HOST == EM_PPC \
-    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV
+    || EM_HOST == EM_PPC64 || EM_HOST == EM_RISCV || EM_HOST == EM_S390
 	if (machine == EM_NONE) {
 		/* Generic arch - use host arch */
 		machine = EM_HOST;
@@ -43,7 +43,7 @@ const char *get_dwarf_regstr(unsigned int n, unsigned int machine, unsigned int
 	switch (machine) {
 #if EM_HOST != EM_X86_64 && EM_HOST != EM_386 && EM_HOST != EM_AARCH64 && EM_HOST != EM_ARM \
     && EM_HOST != EM_CSKY && EM_HOST != EM_LOONGARCH && EM_HOST != EM_MIPS && EM_HOST != EM_PPC \
-    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV
+    && EM_HOST != EM_PPC64 && EM_HOST != EM_RISCV && EM_HOST != EM_S390
 	case EM_NONE:	/* Generic arch - use host arch */
 		return get_arch_regstr(n);
 #endif
diff --git a/tools/perf/util/include/dwarf-regs.h b/tools/perf/util/include/dwarf-regs.h
index 35f4f33205da..25f3d6b90f10 100644
--- a/tools/perf/util/include/dwarf-regs.h
+++ b/tools/perf/util/include/dwarf-regs.h
@@ -81,7 +81,7 @@
 #ifdef HAVE_LIBDW_SUPPORT
 #if !defined(__x86_64__) && !defined(__i386__) && !defined(__aarch64__) && !defined(__arm__) \
     && !defined(__loongarch__) && !defined(__mips__) && !defined(__powerpc__) \
-    && !defined(__powerpc64__) && !defined(__riscv__)
+    && !defined(__powerpc64__) && !defined(__riscv__) && !defined(__s390x__)
 const char *get_arch_regstr(unsigned int n);
 #endif
 
-- 
2.47.0.105.g07ac214952-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
