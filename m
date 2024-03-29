Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92C71CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lswGEibikxrNB3zxR4L//JxUhypvxzEUiyaF1doQjuA=; b=exHqf2jGQW0Awc
	TB00KQ4yN/mF4cMofx8fovDHC8AfAtTcHIYqCI+D3DDPIltalJ4BIcXY+JEt15caTGQMlDM7a+ZPs
	VV+eCjg0etoyB5/d1pcSnPJPrPZhyW61RWtg86j0WCOy1yDZvPr0WJ4LNTB+WEgDkH5r6vYJb2Esx
	h1m+z9NHh9jiA4r++mz+dhG38QPbpzsfE+zE0WW20Ixl7JOHpMmjFHmCTq+HAYshqc09V7CU7Pmtn
	YIkReVWkAgHEb6PduTRMxAdCqBvOSFGc+eV4dNlp7pfGx2+QW0D7hJCMj2TRD93+xC36AmbvfO8rs
	vMXW4YevkJYrcKUhhMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6di-0000000HA1b-1nTJ;
	Fri, 29 Mar 2024 07:27:02 +0000
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bs-0000000H8kD-231g
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:10 +0000
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-5d8b70b39efso1400274a12.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697106; x=1712301906; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IERaZRfF/9oogZdizMupzfKIm+UO6QVYkIeFwIsamZU=;
        b=NVMQ6Sri7O55r+h4zmsIlvECjSh9BcLjrKKnd4MDecZZRZJ8i0Zl5SCVzQFlB61dld
         OpZDFyQ1wCocePmiPaibwG7WmPn1tmrDzTtRP63eeqkF8A+fytPWHYXDv2qH6i8rWTn0
         F87KB2aOIDU4jKitqrhYnzeks7i2pY4vX+ZbI6wfeG30v0TDvsivLA9AbQ5dH5iB6mgK
         MgDI4N7gwWhZg1jvZ/t46PqPjijyEKTApe5PlFqJgsqh3GJ/J64k16sHdHE44eRtgqf4
         K2ziwSCCOWx/E0b3FjgvBn7r/pu3RR87X2V+ijT7mZ6d8LGTQSVZQUpIm7VrXb9ksQm7
         hmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697106; x=1712301906;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IERaZRfF/9oogZdizMupzfKIm+UO6QVYkIeFwIsamZU=;
        b=TkAvAC8A2UPSJASbRe+bimhXWc489GDqMMjwUBusCjHpbQH1LelqWviGdYVzakO9Wo
         fdcNeORreiiA7zuI11ufa8fJ6W0K5ojxS4Y8vCZVmkqsXuD9U0ojGYTC8LjW0kbUBsoV
         BYOPRaR+W9S/5WlpOl+c3UroUsW1LidDaBFBKE1OoJqa6aKBjTQLPZwrmn0ETFw/49qf
         7kfbl2YX2vVVJiocycxyuRlMZIP/Y0kpRHg97nbR046WN+HppthuDmtKLBlxzMinnJeF
         QLLBleFQiNFsrvieVwP00YENqjl0HQs1SdkBdQb5MMB1NZJ4vLtHxqgCxEgiYxD0vgei
         yViA==
X-Forwarded-Encrypted: i=1; AJvYcCVEQLEhDBjmVrKjSms/q16ln+o6SDM+9BL1RrKOdndpILAenRs5cebLSkTTJK2/TF8ypQG1k5CGpnzW2hEC62bEFnkHgvzKbLv9WrXKnVlO
X-Gm-Message-State: AOJu0YzKuO5zthTSJQ/ojigOi4fFC2k918afAUt1wPzz62QQ1rkpH2/4
	sqdIsm+rqXdGJkY9LHtMawOcWEyRXGGHe0Okt/C5BqCF8OpIWRAkb538R39o1Do=
X-Google-Smtp-Source: AGHT+IEgFbP2oHNJWaGrzpoC9/WKXB2wk7z5kOFJSRoINaDHcY2EGHO1B7+JnkXlN7mfRYkSUpJEAg==
X-Received: by 2002:a17:90a:3ee6:b0:2a0:3a16:7489 with SMTP id k93-20020a17090a3ee600b002a03a167489mr1460482pjc.44.1711697106489;
        Fri, 29 Mar 2024 00:25:06 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:06 -0700 (PDT)
From: Samuel Holland <samuel.holland@sifive.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-arm-kernel@lists.infradead.org,
	x86@kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>,
	loongarch@lists.linux.dev,
	amd-gfx@lists.freedesktop.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v4 14/15] selftests/fpu: Move FP code to a separate translation unit
Date: Fri, 29 Mar 2024 00:18:29 -0700
Message-ID: <20240329072441.591471-15-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_002508_589725_27612BAF 
X-CRM114-Status: GOOD (  18.97  )
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

This ensures no compiler-generated floating-point code can appear
outside kernel_fpu_{begin,end}() sections, and some architectures
enforce this separation.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Declare test_fpu() in a header

 lib/Makefile                        |  3 ++-
 lib/test_fpu.h                      |  8 +++++++
 lib/{test_fpu.c => test_fpu_glue.c} | 32 +------------------------
 lib/test_fpu_impl.c                 | 37 +++++++++++++++++++++++++++++
 4 files changed, 48 insertions(+), 32 deletions(-)
 create mode 100644 lib/test_fpu.h
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

diff --git a/lib/Makefile b/lib/Makefile
index ffc6b2341b45..fcb35bf50979 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -133,7 +133,8 @@ FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-st
 endif
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
-CFLAGS_test_fpu.o += $(FPU_CFLAGS)
+test_fpu-y := test_fpu_glue.o test_fpu_impl.o
+CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
 
 # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
 # so we can't just use obj-$(CONFIG_KUNIT).
diff --git a/lib/test_fpu.h b/lib/test_fpu.h
new file mode 100644
index 000000000000..4459807084bc
--- /dev/null
+++ b/lib/test_fpu.h
@@ -0,0 +1,8 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+
+#ifndef _LIB_TEST_FPU_H
+#define _LIB_TEST_FPU_H
+
+int test_fpu(void);
+
+#endif
diff --git a/lib/test_fpu.c b/lib/test_fpu_glue.c
similarity index 71%
rename from lib/test_fpu.c
rename to lib/test_fpu_glue.c
index e82db19fed84..85963d7be826 100644
--- a/lib/test_fpu.c
+++ b/lib/test_fpu_glue.c
@@ -19,37 +19,7 @@
 #include <linux/debugfs.h>
 #include <asm/fpu/api.h>
 
-static int test_fpu(void)
-{
-	/*
-	 * This sequence of operations tests that rounding mode is
-	 * to nearest and that denormal numbers are supported.
-	 * Volatile variables are used to avoid compiler optimizing
-	 * the calculations away.
-	 */
-	volatile double a, b, c, d, e, f, g;
-
-	a = 4.0;
-	b = 1e-15;
-	c = 1e-310;
-
-	/* Sets precision flag */
-	d = a + b;
-
-	/* Result depends on rounding mode */
-	e = a + b / 2;
-
-	/* Denormal and very large values */
-	f = b / c;
-
-	/* Depends on denormal support */
-	g = a + c * f;
-
-	if (d > a && e > a && g > a)
-		return 0;
-	else
-		return -EINVAL;
-}
+#include "test_fpu.h"
 
 static int test_fpu_get(void *data, u64 *val)
 {
diff --git a/lib/test_fpu_impl.c b/lib/test_fpu_impl.c
new file mode 100644
index 000000000000..777894dbbe86
--- /dev/null
+++ b/lib/test_fpu_impl.c
@@ -0,0 +1,37 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/errno.h>
+
+#include "test_fpu.h"
+
+int test_fpu(void)
+{
+	/*
+	 * This sequence of operations tests that rounding mode is
+	 * to nearest and that denormal numbers are supported.
+	 * Volatile variables are used to avoid compiler optimizing
+	 * the calculations away.
+	 */
+	volatile double a, b, c, d, e, f, g;
+
+	a = 4.0;
+	b = 1e-15;
+	c = 1e-310;
+
+	/* Sets precision flag */
+	d = a + b;
+
+	/* Result depends on rounding mode */
+	e = a + b / 2;
+
+	/* Denormal and very large values */
+	f = b / c;
+
+	/* Depends on denormal support */
+	g = a + c * f;
+
+	if (d > a && e > a && g > a)
+		return 0;
+	else
+		return -EINVAL;
+}
-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
