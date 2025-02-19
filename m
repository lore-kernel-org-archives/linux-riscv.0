Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E97B1C021B0
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 18:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:From:Subject:References:Mime-Version
	:Message-Id:In-Reply-To:Date:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lpivmkVRi0KK6JAQkmIrtRkIPosSz/qP+PhlvTrtufg=; b=QPVMWrMAbXfOSg
	305ke/ZwVSlkC5v4onI1+DO4n03gU+hzXveI83JNjDQ5XQra72hgRcBOBWNPou6d17XFacTeZfSk7
	dBb65Hf9TKDbXgFpUpjoeJcS/3nQyARxyVETfYtgr1BnDUhQmAsJfqDRzBJ/GYhnbpPTPpCp+JWbp
	25PVKlrRg0TLi9abCKXSctFW4ekj5xlAwrbyHqXg4s/naGwr0yzNhGVRiClcA36iobBArgjXW5ILJ
	5ZmY+WHwi/nAKGHawXa2NZVOie01DaLoEPS0Wdd0x3h7RRTusRvgOLGMOoJRugCRIfz/iBkdswZV0
	1q73mH+IpCRCawa8c39Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpHR-0000000EUTn-3H1x;
	Wed, 19 Feb 2025 18:58:45 +0000
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkpFx-0000000ETu1-2duj
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 18:57:14 +0000
Received: by mail-yb1-xb49.google.com with SMTP id 3f1490d57ef6-e3a109984a5so183931276.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 10:57:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739991432; x=1740596232; darn=lists.infradead.org;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0bsoJDMKnAUZGWEn4OupAOH97fr8b6W+Og+QQZpJxU=;
        b=JNfzgDt9JidncFWzEWKFYTcy8h9scbP0tRCnhwUzS5Y9fbvV0B1dDOgpTdCpIZS4/N
         bi8NLgjqT70H2qBmmrthbYXxS1W7wvxvESOYbw3R2wKyKpAc5EWzCp6iU+9dqumVk6vp
         QaQdbummmgXzqjiNW1KyUU79Q/3p+WBvZxxXzfvuNutZkWb4Cvm9hnaqdobc0oTiNzSE
         JYIb9hcsavmwyIP2fGCunQ5GGZBoYtMc8CWdd/pKHvcHk03B4p3WTxL1HoW0XZrDEXJw
         SO5gK/KyGlY+aob7ZCMvRlDXrefBgfbEEuNnwSWwmdTB0utnuglh46/uj/UnA5osC4TP
         my8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739991432; x=1740596232;
        h=to:from:subject:references:mime-version:message-id:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s0bsoJDMKnAUZGWEn4OupAOH97fr8b6W+Og+QQZpJxU=;
        b=gwMcEF4FfviqWu1VC84PlBGSPDDbNO8Ha9Nx/tzGDJnS52cj5K32hz+UCOjbvlDOi+
         kxAKq4UJI9r6G98JSAsWNAQaPeRMhwi5BMXTBGIg5UWPnvQ2ayOAD09GWOxDaITK5XLh
         nPXBiM/ofx9l3dgNoxofcSakVXMbz2deuTsWXS2o9Zy1lQr94F3omAlV6zbUnDtKH7C4
         GeIGQWu/y+meZQnPl5XuCX1bkfgFts8O0f+L57187hrmRW92Ge0Ar/QESJMJnEVV598J
         yB2oQf15L8ADsyDDr6z+O/wXDf0WBmh5n0YDeTX26AWsTSSa8ULXvH9rAF82+uEbebfF
         0oHQ==
X-Forwarded-Encrypted: i=1; AJvYcCWUBqdvzlXanvHzIp4ahkqI4yU0q8075BW3jaQ9NrbaZ3KAHEKZjT/hGDFvNJS0d8RFcluVaJiAltE9+g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyUE/2Iy4EgCsaab2cgbQzDpXDWGNBt88d5DR47c37oFC74x8Ke
	6qCn11fvaZfslNX9u/SQjZtAbOzOxNzEpC+GSGmpRkSt3ukWomdO3QfzoLCJZOC8GWM/Dy6lrn3
	/TIpG4Q==
X-Google-Smtp-Source: AGHT+IGF51usFsQ9FNTzFoNRGh8XS+OYeljEd0FsqywFcj/FC4LqivZ9CcaSZ05HEZ2iLxCAbI37MGEuie6a
X-Received: from irogers.svl.corp.google.com ([2620:15c:2c5:11:c57b:86f0:c166:3061])
 (user=irogers job=sendgmr) by 2002:a25:aa45:0:b0:e5d:bc8e:cc92 with SMTP id
 3f1490d57ef6-e5dc91e9bafmr201196276.4.1739991432389; Wed, 19 Feb 2025
 10:57:12 -0800 (PST)
Date: Wed, 19 Feb 2025 10:56:50 -0800
In-Reply-To: <20250219185657.280286-1-irogers@google.com>
Message-Id: <20250219185657.280286-2-irogers@google.com>
Mime-Version: 1.0
References: <20250219185657.280286-1-irogers@google.com>
X-Mailer: git-send-email 2.48.1.601.g30ceb7b040-goog
Subject: [PATCH v3 1/8] perf syscalltble: Remove syscall_table.h
From: Ian Rogers <irogers@google.com>
To: Ian Rogers <irogers@google.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, guoren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	"=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?=" <bjorn@rivosinc.com>, Howard Chu <howardchu95@gmail.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	"linux-csky@vger.kernel.org" <linux-csky@vger.kernel.org>, linux-riscv@lists.infradead.org, 
	linux-mips@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_105713_669243_F9C5A1DC 
X-CRM114-Status: GOOD (  15.61  )
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

The definition of "static const char *const syscalltbl[] = {" is done
in a generated syscalls_32.h or syscalls_64.h that is architecture
dependent. In order to include the appropriate file a syscall_table.h
is found via the perf include path and it includes the syscalls_32.h
or syscalls_64.h as appropriate.

To support having multiple syscall tables, one for 32-bit and one for
64-bit, or for different architectures, an include path cannot be
used. Remove syscall_table.h because of this and inline what it does
into syscalltbl.c.

For architectures without a syscall_table.h this will cause a failure
to include either syscalls_32.h or syscalls_64.h rather than a failure
to include syscall_table.h. For architectures that only included one
or other, the behavior matches BITS_PER_LONG as previously done on
architectures supporting both syscalls_32.h and syscalls_64.h.

Signed-off-by: Ian Rogers <irogers@google.com>
Reviewed-by: Howard Chu <howardchu95@gmail.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 tools/perf/arch/alpha/include/syscall_table.h     | 2 --
 tools/perf/arch/arc/include/syscall_table.h       | 2 --
 tools/perf/arch/arm/include/syscall_table.h       | 2 --
 tools/perf/arch/arm64/include/syscall_table.h     | 8 --------
 tools/perf/arch/csky/include/syscall_table.h      | 2 --
 tools/perf/arch/loongarch/include/syscall_table.h | 2 --
 tools/perf/arch/mips/include/syscall_table.h      | 2 --
 tools/perf/arch/parisc/include/syscall_table.h    | 8 --------
 tools/perf/arch/powerpc/include/syscall_table.h   | 8 --------
 tools/perf/arch/riscv/include/syscall_table.h     | 8 --------
 tools/perf/arch/s390/include/syscall_table.h      | 2 --
 tools/perf/arch/sh/include/syscall_table.h        | 2 --
 tools/perf/arch/sparc/include/syscall_table.h     | 8 --------
 tools/perf/arch/x86/include/syscall_table.h       | 8 --------
 tools/perf/arch/xtensa/include/syscall_table.h    | 2 --
 tools/perf/util/syscalltbl.c                      | 8 +++++++-
 16 files changed, 7 insertions(+), 67 deletions(-)
 delete mode 100644 tools/perf/arch/alpha/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm/include/syscall_table.h
 delete mode 100644 tools/perf/arch/arm64/include/syscall_table.h
 delete mode 100644 tools/perf/arch/csky/include/syscall_table.h
 delete mode 100644 tools/perf/arch/loongarch/include/syscall_table.h
 delete mode 100644 tools/perf/arch/mips/include/syscall_table.h
 delete mode 100644 tools/perf/arch/parisc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/powerpc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/riscv/include/syscall_table.h
 delete mode 100644 tools/perf/arch/s390/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sh/include/syscall_table.h
 delete mode 100644 tools/perf/arch/sparc/include/syscall_table.h
 delete mode 100644 tools/perf/arch/x86/include/syscall_table.h
 delete mode 100644 tools/perf/arch/xtensa/include/syscall_table.h

diff --git a/tools/perf/arch/alpha/include/syscall_table.h b/tools/perf/arch/alpha/include/syscall_table.h
deleted file mode 100644
index b53e31c15805..000000000000
--- a/tools/perf/arch/alpha/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_64.h>
diff --git a/tools/perf/arch/arc/include/syscall_table.h b/tools/perf/arch/arc/include/syscall_table.h
deleted file mode 100644
index 4c942821662d..000000000000
--- a/tools/perf/arch/arc/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_32.h>
diff --git a/tools/perf/arch/arm/include/syscall_table.h b/tools/perf/arch/arm/include/syscall_table.h
deleted file mode 100644
index 4c942821662d..000000000000
--- a/tools/perf/arch/arm/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_32.h>
diff --git a/tools/perf/arch/arm64/include/syscall_table.h b/tools/perf/arch/arm64/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/arm64/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/csky/include/syscall_table.h b/tools/perf/arch/csky/include/syscall_table.h
deleted file mode 100644
index 4c942821662d..000000000000
--- a/tools/perf/arch/csky/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_32.h>
diff --git a/tools/perf/arch/loongarch/include/syscall_table.h b/tools/perf/arch/loongarch/include/syscall_table.h
deleted file mode 100644
index 9d0646d3455c..000000000000
--- a/tools/perf/arch/loongarch/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscall_table_64.h>
diff --git a/tools/perf/arch/mips/include/syscall_table.h b/tools/perf/arch/mips/include/syscall_table.h
deleted file mode 100644
index b53e31c15805..000000000000
--- a/tools/perf/arch/mips/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_64.h>
diff --git a/tools/perf/arch/parisc/include/syscall_table.h b/tools/perf/arch/parisc/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/parisc/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/powerpc/include/syscall_table.h b/tools/perf/arch/powerpc/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/powerpc/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/riscv/include/syscall_table.h b/tools/perf/arch/riscv/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/riscv/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/s390/include/syscall_table.h b/tools/perf/arch/s390/include/syscall_table.h
deleted file mode 100644
index b53e31c15805..000000000000
--- a/tools/perf/arch/s390/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_64.h>
diff --git a/tools/perf/arch/sh/include/syscall_table.h b/tools/perf/arch/sh/include/syscall_table.h
deleted file mode 100644
index 4c942821662d..000000000000
--- a/tools/perf/arch/sh/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_32.h>
diff --git a/tools/perf/arch/sparc/include/syscall_table.h b/tools/perf/arch/sparc/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/sparc/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/x86/include/syscall_table.h b/tools/perf/arch/x86/include/syscall_table.h
deleted file mode 100644
index 7ff51b783000..000000000000
--- a/tools/perf/arch/x86/include/syscall_table.h
+++ /dev/null
@@ -1,8 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/bitsperlong.h>
-
-#if __BITS_PER_LONG == 64
-#include <asm/syscalls_64.h>
-#else
-#include <asm/syscalls_32.h>
-#endif
diff --git a/tools/perf/arch/xtensa/include/syscall_table.h b/tools/perf/arch/xtensa/include/syscall_table.h
deleted file mode 100644
index 4c942821662d..000000000000
--- a/tools/perf/arch/xtensa/include/syscall_table.h
+++ /dev/null
@@ -1,2 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-#include <asm/syscalls_32.h>
diff --git a/tools/perf/util/syscalltbl.c b/tools/perf/util/syscalltbl.c
index 928aca4cd6e9..2f76241494c8 100644
--- a/tools/perf/util/syscalltbl.c
+++ b/tools/perf/util/syscalltbl.c
@@ -7,13 +7,19 @@
 
 #include "syscalltbl.h"
 #include <stdlib.h>
+#include <asm/bitsperlong.h>
 #include <linux/compiler.h>
 #include <linux/zalloc.h>
 
 #include <string.h>
 #include "string2.h"
 
-#include <syscall_table.h>
+#if __BITS_PER_LONG == 64
+  #include <asm/syscalls_64.h>
+#else
+  #include <asm/syscalls_32.h>
+#endif
+
 const int syscalltbl_native_max_id = SYSCALLTBL_MAX_ID;
 static const char *const *syscalltbl_native = syscalltbl;
 
-- 
2.48.1.601.g30ceb7b040-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
