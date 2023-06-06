Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F6C1C77B73
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 01:47:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tGYCyXZc3nAHbEunqYnSebIawZUp18KQM9LooeX6ThU=; b=zyN/Bf030zjWy0
	kxqCzcmR4dH7AhdODZYDjtCFUjBgZwi0EUaTrrrytMs9ZlofXhyEp7FO6AqfhHAlfjqwnIUY0uBaP
	lPrB10mo10V9N5WBmEpN45zY1GLhrX7sKFFriOZ+Vn8JwID6IRsDnyamOhS2VMjMSQH9MYbiKh3JZ
	iyGxFxswgRI9IiwmTLd7g0hkgUR33S92vUuS7ud+qvfmC7yQX64sOnaTqGzZ2Kv2+XMJBfMBgAtw+
	bMogkeso8QLbzojqTbtZXTXkYPN5vG/0K3q7ycThjlEruy7qDqw3iybA4Cc8S5FcW9Ktuhn13Hars
	ORs5xulItbH92PyktkfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ln6-00HMsq-2S;
	Tue, 06 Jun 2023 01:47:20 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6Ln3-00HMpg-1Z
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 01:47:19 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-53f8da65701so2938029a12.1
        for <linux-riscv@lists.infradead.org>; Mon, 05 Jun 2023 18:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686016037; x=1688608037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N+507jsXO1BnVewAsLkwzOZpkiaji1CsapmTp9yyUaM=;
        b=dIxbCIi0rJbSLxPR/xfTQsCM+M6jm4HaUgLS+0uDUowhc7bgpH7HzmYEH+r/3F82JE
         Z+O3HYuNoF2wk2r9DwHjkLbLwlRLhDt+FqAxsOa7YI8yuTuFwhnDia/M0RW/UrEz/F6J
         4G8Sdh6Fyn7qpG7+jlBs2DbK1WO3e5X/djFyNZcEXfSjPg5M84z/JXAOY+gosf0ZlzSO
         ditxWwuhEnAQlT77aoag2kWVU7cff8H/I6VbV+AQTQkBqaLDQzZQE+2ES1eN4vZ80B36
         MtBklXlYuEq6QxkzSfoIRdvmKuFnkis40PTVm8FiOR+8o5Mxjj3q2zYJL2L5xPFGbThz
         0ohg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686016037; x=1688608037;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N+507jsXO1BnVewAsLkwzOZpkiaji1CsapmTp9yyUaM=;
        b=cRQbcBGQZQOrPDDGiycyzAUugvD5zDuDiVURsD4Fmi8WVafuDqBp18ycXKwAX5Jq1k
         DrMyykEsL8cKalrdDxb4Y6niwQiFbn7Hi92AyK6VjwqEwP+Kkhhiz9fLrmjRdvWvPJwd
         QzEKNXwfpSjSsLDuzxJBN0XylWgozg4RlMYMqhcMCOCxe0iQMfyp+pePtEPnzYaKCaJF
         qPrnHjz8S5GjsvDRyUZxZNrdEJvpcy0MfaYak9WODf7jYqFKeVr2hPMlLJ4cFAznfSxY
         1pazyZ6UQKlY7GL0GfLC9qjRFlzMFs0jYZN5wNm+LkHDQs70oH2ztct746RBm7GgCbMv
         Xzow==
X-Gm-Message-State: AC+VfDziaOKkTOiK0RnCYCNh7ltBVUmiHhbvZKzPvrLJYVXzI1GRUK11
	tFBYE5u7mUFEe4E2vXTG51AAqw==
X-Google-Smtp-Source: ACHHUZ5wNp+vHV2+xqeEpakEuvMMeVGxroHVvlVQpo9lYy5LiPQ7V3r7CA3CKHEXyKL2AYHAW29eDA==
X-Received: by 2002:a05:6a20:549c:b0:116:9255:88eb with SMTP id i28-20020a056a20549c00b00116925588ebmr602780pzk.46.1686016036830;
        Mon, 05 Jun 2023 18:47:16 -0700 (PDT)
Received: from leoy-huanghe.lan ([240e:389:8603:ad00:6600:a29f:6ab:1788])
        by smtp.gmail.com with ESMTPSA id s10-20020a170902a50a00b001a64851087bsm7197805plq.272.2023.06.05.18.47.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Jun 2023 18:47:16 -0700 (PDT)
From: Leo Yan <leo.yan@linaro.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>,
	John Garry <john.g.garry@oracle.com>,
	Will Deacon <will@kernel.org>,
	James Clark <james.clark@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ming Wang <wangming01@loongson.cn>,
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Sandipan Das <sandipan.das@amd.com>,
	Ivan Babrou <ivan@cloudflare.com>,
	Fangrui Song <maskray@google.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v2 6/6] perf parse-regs: Move out arch specific header from util/perf_regs.h
Date: Tue,  6 Jun 2023 09:45:59 +0800
Message-Id: <20230606014559.21783-7-leo.yan@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230606014559.21783-1-leo.yan@linaro.org>
References: <20230606014559.21783-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_184717_539785_67A80DCA 
X-CRM114-Status: GOOD (  14.59  )
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

util/perf_regs.h includes another perf_regs.h:

  #include <perf_regs.h>

Here it includes architecture specific header, for example, if we build
arm64 target, the header tools/perf/arch/arm64/include/perf_regs.h is
included.

We use this implicit way to include architecture specific header, which
is not directive; furthermore, util/perf_regs.c is coupled with the
architecture specific definitions.

This patch moves out arch specific header from util/perf_regs.h for
generalizing the 'util' folder, as a result, the source files in 'arch'
folder explicitly include architecture's perf_regs.h.

Signed-off-by: Leo Yan <leo.yan@linaro.org>
---
 tools/perf/arch/arm/util/perf_regs.c          | 1 +
 tools/perf/arch/arm/util/unwind-libdw.c       | 1 +
 tools/perf/arch/arm64/util/machine.c          | 1 +
 tools/perf/arch/arm64/util/perf_regs.c        | 1 +
 tools/perf/arch/arm64/util/unwind-libdw.c     | 1 +
 tools/perf/arch/csky/util/perf_regs.c         | 1 +
 tools/perf/arch/csky/util/unwind-libdw.c      | 1 +
 tools/perf/arch/loongarch/util/perf_regs.c    | 1 +
 tools/perf/arch/loongarch/util/unwind-libdw.c | 1 +
 tools/perf/arch/mips/util/perf_regs.c         | 1 +
 tools/perf/arch/powerpc/util/perf_regs.c      | 1 +
 tools/perf/arch/powerpc/util/unwind-libdw.c   | 1 +
 tools/perf/arch/riscv/util/perf_regs.c        | 1 +
 tools/perf/arch/riscv/util/unwind-libdw.c     | 1 +
 tools/perf/arch/s390/util/perf_regs.c         | 1 +
 tools/perf/arch/s390/util/unwind-libdw.c      | 1 +
 tools/perf/arch/x86/util/perf_regs.c          | 1 +
 tools/perf/arch/x86/util/unwind-libdw.c       | 1 +
 tools/perf/util/perf_regs.h                   | 2 --
 19 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index d9d4777bf7f9..2c56e8b56ddf 100644
--- a/tools/perf/arch/arm/util/perf_regs.c
+++ b/tools/perf/arch/arm/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/arm/util/unwind-libdw.c b/tools/perf/arch/arm/util/unwind-libdw.c
index 1834a0cd9ce3..4e02cef461e3 100644
--- a/tools/perf/arch/arm/util/unwind-libdw.c
+++ b/tools/perf/arch/arm/util/unwind-libdw.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../../util/unwind-libdw.h"
 #include "../../../util/perf_regs.h"
 #include "../../../util/sample.h"
diff --git a/tools/perf/arch/arm64/util/machine.c b/tools/perf/arch/arm64/util/machine.c
index 235a0a1e1ec7..ba1144366e85 100644
--- a/tools/perf/arch/arm64/util/machine.c
+++ b/tools/perf/arch/arm64/util/machine.c
@@ -6,6 +6,7 @@
 #include "debug.h"
 #include "symbol.h"
 #include "callchain.h"
+#include "perf_regs.h"
 #include "record.h"
 #include "util/perf_regs.h"
 
diff --git a/tools/perf/arch/arm64/util/perf_regs.c b/tools/perf/arch/arm64/util/perf_regs.c
index 76e2e30702cd..1b79d8eab22f 100644
--- a/tools/perf/arch/arm64/util/perf_regs.c
+++ b/tools/perf/arch/arm64/util/perf_regs.c
@@ -6,6 +6,7 @@
 #include <linux/kernel.h>
 #include <linux/zalloc.h>
 
+#include "perf_regs.h"
 #include "../../../perf-sys.h"
 #include "../../../util/debug.h"
 #include "../../../util/event.h"
diff --git a/tools/perf/arch/arm64/util/unwind-libdw.c b/tools/perf/arch/arm64/util/unwind-libdw.c
index 09385081bb03..e056d50ab42e 100644
--- a/tools/perf/arch/arm64/util/unwind-libdw.c
+++ b/tools/perf/arch/arm64/util/unwind-libdw.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../../util/unwind-libdw.h"
 #include "../../../util/perf_regs.h"
 #include "../../../util/sample.h"
diff --git a/tools/perf/arch/csky/util/perf_regs.c b/tools/perf/arch/csky/util/perf_regs.c
index b17fc30abb29..c0877c264d49 100644
--- a/tools/perf/arch/csky/util/perf_regs.c
+++ b/tools/perf/arch/csky/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/csky/util/unwind-libdw.c b/tools/perf/arch/csky/util/unwind-libdw.c
index 4bb4a06776e4..79df4374ab18 100644
--- a/tools/perf/arch/csky/util/unwind-libdw.c
+++ b/tools/perf/arch/csky/util/unwind-libdw.c
@@ -2,6 +2,7 @@
 // Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd.
 
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../util/unwind-libdw.h"
 #include "../../util/perf_regs.h"
 #include "../../util/event.h"
diff --git a/tools/perf/arch/loongarch/util/perf_regs.c b/tools/perf/arch/loongarch/util/perf_regs.c
index d9d4777bf7f9..2c56e8b56ddf 100644
--- a/tools/perf/arch/loongarch/util/perf_regs.c
+++ b/tools/perf/arch/loongarch/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/loongarch/util/unwind-libdw.c b/tools/perf/arch/loongarch/util/unwind-libdw.c
index a9415385230a..7b3b9a4b21f8 100644
--- a/tools/perf/arch/loongarch/util/unwind-libdw.c
+++ b/tools/perf/arch/loongarch/util/unwind-libdw.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2020-2023 Loongson Technology Corporation Limited */
 
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../util/unwind-libdw.h"
 #include "../../util/perf_regs.h"
 #include "../../util/sample.h"
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index b17fc30abb29..c0877c264d49 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index 1d264bf55955..b38aa056eea0 100644
--- a/tools/perf/arch/powerpc/util/perf_regs.c
+++ b/tools/perf/arch/powerpc/util/perf_regs.c
@@ -4,6 +4,7 @@
 #include <regex.h>
 #include <linux/zalloc.h>
 
+#include "perf_regs.h"
 #include "../../../util/perf_regs.h"
 #include "../../../util/debug.h"
 #include "../../../util/event.h"
diff --git a/tools/perf/arch/powerpc/util/unwind-libdw.c b/tools/perf/arch/powerpc/util/unwind-libdw.c
index e616642c754c..e9a5a8bb67d9 100644
--- a/tools/perf/arch/powerpc/util/unwind-libdw.c
+++ b/tools/perf/arch/powerpc/util/unwind-libdw.c
@@ -1,6 +1,7 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
 #include <linux/kernel.h>
+#include "perf_regs.h"
 #include "../../../util/unwind-libdw.h"
 #include "../../../util/perf_regs.h"
 #include "../../../util/sample.h"
diff --git a/tools/perf/arch/riscv/util/perf_regs.c b/tools/perf/arch/riscv/util/perf_regs.c
index b17fc30abb29..c0877c264d49 100644
--- a/tools/perf/arch/riscv/util/perf_regs.c
+++ b/tools/perf/arch/riscv/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/riscv/util/unwind-libdw.c b/tools/perf/arch/riscv/util/unwind-libdw.c
index 54a198714eb8..5c98010d8b59 100644
--- a/tools/perf/arch/riscv/util/unwind-libdw.c
+++ b/tools/perf/arch/riscv/util/unwind-libdw.c
@@ -2,6 +2,7 @@
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../util/unwind-libdw.h"
 #include "../../util/perf_regs.h"
 #include "../../util/sample.h"
diff --git a/tools/perf/arch/s390/util/perf_regs.c b/tools/perf/arch/s390/util/perf_regs.c
index b17fc30abb29..c0877c264d49 100644
--- a/tools/perf/arch/s390/util/perf_regs.c
+++ b/tools/perf/arch/s390/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/s390/util/unwind-libdw.c b/tools/perf/arch/s390/util/unwind-libdw.c
index 7d92452d5287..f50fb6dbb35c 100644
--- a/tools/perf/arch/s390/util/unwind-libdw.c
+++ b/tools/perf/arch/s390/util/unwind-libdw.c
@@ -5,6 +5,7 @@
 #include "../../util/event.h"
 #include "../../util/sample.h"
 #include "dwarf-regs-table.h"
+#include "perf_regs.h"
 
 
 bool libdw__arch_set_initial_registers(Dwfl_Thread *thread, void *arg)
diff --git a/tools/perf/arch/x86/util/perf_regs.c b/tools/perf/arch/x86/util/perf_regs.c
index 218747a8b039..b813502a2727 100644
--- a/tools/perf/arch/x86/util/perf_regs.c
+++ b/tools/perf/arch/x86/util/perf_regs.c
@@ -5,6 +5,7 @@
 #include <linux/kernel.h>
 #include <linux/zalloc.h>
 
+#include "perf_regs.h"
 #include "../../../perf-sys.h"
 #include "../../../util/perf_regs.h"
 #include "../../../util/debug.h"
diff --git a/tools/perf/arch/x86/util/unwind-libdw.c b/tools/perf/arch/x86/util/unwind-libdw.c
index ef71e8bf80bf..edb77e20e083 100644
--- a/tools/perf/arch/x86/util/unwind-libdw.c
+++ b/tools/perf/arch/x86/util/unwind-libdw.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 #include <elfutils/libdwfl.h>
+#include "perf_regs.h"
 #include "../../../util/unwind-libdw.h"
 #include "../../../util/perf_regs.h"
 #include "util/sample.h"
diff --git a/tools/perf/util/perf_regs.h b/tools/perf/util/perf_regs.h
index 8583c52572b1..4f6a3c1ba901 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -30,8 +30,6 @@ uint64_t arch__user_reg_mask(void);
 #ifdef HAVE_PERF_REGS_SUPPORT
 extern const struct sample_reg sample_reg_masks[];
 
-#include <perf_regs.h>
-
 #define DWARF_MINIMAL_REGS(arch)	\
 	((1ULL << perf_arch_reg_ip(arch)) | (1ULL << perf_arch_reg_sp(arch)))
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
