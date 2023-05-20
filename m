Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F169C7EE23
	for <linux-riscv@archiver.kernel.org>; Sat, 20 May 2023 02:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JzEPkXYDWxNqgKDZsthRK1ou4XZMjsbgJO9Z0SxxMek=; b=rAOps+VXczIumf
	lsIZPRuz5iwKAzYyemjDGpILCi75kv1n/QizU8a15O6xOrT4xCWtEaREYC16TgS6uCvjwQ50Rf0mZ
	UmgXsjrSQgPt4RcrNtiT3zZjSMVaKSW1fAm2gyFD1ESl8C3nFWzADcXt9WPIbNmUMm7mVRv5no6mZ
	cmKK75NrQYlL8nmQ8V1e2wOZy8WAdF5/3zBbmXwPfJyUT40OCy+qstXG5gxVg+LGp0+8wX3vyQSp9
	pnBWWd1YNqrBWne4bm8ts0mebZKbHcNyQaLCvLuXHAHXbzkDUEkTD/tBTJrp8Edjj4+tWmnzpXOxW
	5QUNdPmjFn8cc7ESnMUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Clu-000VZt-0V;
	Sat, 20 May 2023 02:56:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Cls-000VYx-2U
	for linux-riscv@bombadil.infradead.org;
	Sat, 20 May 2023 02:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4I7s+qmJYBYI1fLm0w6VOesYnXvgxr3WYm7dFpfRIoU=; b=j9VXqZwVVoigeFPsDS2ye6tG4w
	2zFX9Hm5ohyIlD2Gs9H/XoyJXPMnxv6kAePpwHlxdsL9v+75a3dmEUOTgbq+vVINzUg2MZCwT45zL
	YFU80rtzDvm1thjNXk5ftoDPX4C4UzXgSeYB+dZZkIOhU/u2mK/AIC+XLl14Bd5RzFDuGVvo/Bske
	A3L+HZRk1ebhsNUqPv0SpGS8VCpn0SZU9g8AA66M5zcQ71+2B/28ZmFhKJP7C9mCEdFrEtItQDkzf
	nVMSKgNVHpCPbBH3Bm+Jan7KdfpPuKVBpQMcs5yVRjbWD8TK1JW3pMP7uugYvZKJU6mwWUs2dKCEM
	V9ZexacA==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q0Cll-00GPQd-0I
	for linux-riscv@lists.infradead.org;
	Sat, 20 May 2023 02:56:39 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1ae875bf125so7935045ad.1
        for <linux-riscv@lists.infradead.org>; Fri, 19 May 2023 19:56:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684551385; x=1687143385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4I7s+qmJYBYI1fLm0w6VOesYnXvgxr3WYm7dFpfRIoU=;
        b=GCAPdZ64C9vz5vLjvuX58OXtcTqkVp7vX2LVP76fRYGBO/USp71ZN11auaLU36sJ7D
         +9LLOmiMn8Y959F+0BSy0/1mt6LWtr8yX/dsuOQ/lcwtz1FFfZj7W859vBKqYpVkSCOI
         8+XyziEcN8cSDayn+wAAjqdSc1eWgUPgbQDYACljd7eX0XPt1fPzsisb5jwua8lhoMWR
         GtH6XUPkDCWisAQ8PpFhVA4wuJNuwUS1dvtzl1RWdot/8ZyQrck3imUpJlfK1AxOWNFr
         SdvuDz65YrxKJebJqcbEExPeqbJSeBppuKXvV+u22U6duOdxLE8X/H95etP3ffr8DuvQ
         70Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684551385; x=1687143385;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4I7s+qmJYBYI1fLm0w6VOesYnXvgxr3WYm7dFpfRIoU=;
        b=URKVRwWMn13G1JqLdoPhS9gGLtAs6kSmdsW4kHSF2TzNgwPPyadZehQBTiLqcswvgo
         NJ81Z2zJlux+eYWiWxWpLWw/z238yYhtOUENoolV9lFID4JUl34HUMO2JWiEFXRZfU01
         z22dyKoWA1L6oMMskBOVjsjDFcvT0DAwAkbv6gvD5v7J7+Ovj+xEw5Gq8OYBBQrqC6hh
         ivbQjurWxit+dz8KwKsxD5LzurkNFO7UAUk8aco1mNehBXQAya6dgljAPjdK+9bHWYtp
         gL55dV3QBKx8U2BzJC8GMkL8+/AtUBdSNBukeukKDgKZPSUSu/e+m0Umnls/1ZKCXcbN
         FSWg==
X-Gm-Message-State: AC+VfDzdN4aiaMmwCEpE05QYmkzgwGN189zjCz/2zQEPNcRm897ZPRwb
	IHq9dwSNXmYzztKfU0L6XC6iEA==
X-Google-Smtp-Source: ACHHUZ4QDSj1/rLx/gOlwRttNzGb9xSN5ZInrcrrf5vrh7TbdtA881pKAdo5H+DQDVa7+Xrlnixa/A==
X-Received: by 2002:a17:902:d34a:b0:1a9:f425:5409 with SMTP id l10-20020a170902d34a00b001a9f4255409mr3590297plk.49.1684551385369;
        Fri, 19 May 2023 19:56:25 -0700 (PDT)
Received: from leoy-yangtze.lan ([156.59.236.113])
        by smtp.gmail.com with ESMTPSA id b6-20020a170902d50600b001a95aef9728sm346100plg.19.2023.05.19.19.56.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 May 2023 19:56:24 -0700 (PDT)
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
	Eric Lin <eric.lin@sifive.com>,
	Kan Liang <kan.liang@linux.intel.com>,
	Qi Liu <liuqi115@huawei.com>,
	Sandipan Das <sandipan.das@amd.com>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-perf-users@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Leo Yan <leo.yan@linaro.org>
Subject: [PATCH v1 5/5] perf parse-regs: Move out arch specific header from util/perf_regs.h
Date: Sat, 20 May 2023 10:55:37 +0800
Message-Id: <20230520025537.1811986-6-leo.yan@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230520025537.1811986-1-leo.yan@linaro.org>
References: <20230520025537.1811986-1-leo.yan@linaro.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230520_035635_483760_7ACDF5D3 
X-CRM114-Status: GOOD (  13.92  )
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
 tools/perf/arch/arm/util/perf_regs.c        | 1 +
 tools/perf/arch/arm/util/unwind-libdw.c     | 1 +
 tools/perf/arch/arm64/util/machine.c        | 1 +
 tools/perf/arch/arm64/util/perf_regs.c      | 1 +
 tools/perf/arch/arm64/util/unwind-libdw.c   | 1 +
 tools/perf/arch/csky/util/perf_regs.c       | 1 +
 tools/perf/arch/csky/util/unwind-libdw.c    | 1 +
 tools/perf/arch/mips/util/perf_regs.c       | 1 +
 tools/perf/arch/powerpc/util/perf_regs.c    | 1 +
 tools/perf/arch/powerpc/util/unwind-libdw.c | 1 +
 tools/perf/arch/riscv/util/perf_regs.c      | 1 +
 tools/perf/arch/riscv/util/unwind-libdw.c   | 1 +
 tools/perf/arch/s390/util/perf_regs.c       | 1 +
 tools/perf/arch/s390/util/unwind-libdw.c    | 1 +
 tools/perf/arch/x86/util/perf_regs.c        | 1 +
 tools/perf/arch/x86/util/unwind-libdw.c     | 1 +
 tools/perf/util/perf_regs.h                 | 2 --
 17 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/tools/perf/arch/arm/util/perf_regs.c b/tools/perf/arch/arm/util/perf_regs.c
index 0d669dba08c4..244c1d0a46ac 100644
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
index 4490c1b5ea51..34d957c750f7 100644
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
index 35755811316e..053ecbbc7b2f 100644
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
diff --git a/tools/perf/arch/mips/util/perf_regs.c b/tools/perf/arch/mips/util/perf_regs.c
index 2d2bfbb96182..751413b86ebf 100644
--- a/tools/perf/arch/mips/util/perf_regs.c
+++ b/tools/perf/arch/mips/util/perf_regs.c
@@ -1,4 +1,5 @@
 // SPDX-License-Identifier: GPL-2.0
+#include "perf_regs.h"
 #include "../../util/perf_regs.h"
 
 const struct sample_reg sample_reg_masks[] = {
diff --git a/tools/perf/arch/powerpc/util/perf_regs.c b/tools/perf/arch/powerpc/util/perf_regs.c
index e48622d1bc59..3d0f7c238a33 100644
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
index a2aaa46ef741..7b8fafd0598a 100644
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
index 8d79f8c50f4c..0a6358cedb93 100644
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
index a7e21f2a8964..aaf7f606606b 100644
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
index 43b5a6d40e58..894d527edebe 100644
--- a/tools/perf/util/perf_regs.h
+++ b/tools/perf/util/perf_regs.h
@@ -32,8 +32,6 @@ uint64_t arch__reg_sp(void);
 #ifdef HAVE_PERF_REGS_SUPPORT
 extern const struct sample_reg sample_reg_masks[];
 
-#include <perf_regs.h>
-
 #define DWARF_MINIMAL_REGS ((1ULL << arch__reg_ip()) | (1ULL << arch__reg_sp()))
 
 const char *perf_reg_name(int id, const char *arch);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
