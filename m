Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B771CD1283
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:18:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OSnSA+eqdXOS4K08MAwYxIaXb8wMdGgCYBAy/j73/yQ=; b=xshf/Bje3hu2vj
	qO1S0hzCAOt7iAOnnOpwVgE5WPfBhCd1RxZIAifIfOnzCQaoEa7IEccNO0LcOgMq7PLmUrHXgVaV7
	AvHkK7L04qFSNFQNlilr2XidapiI8zLJUng7pB1Y1aRo2sCDf4rSs10PzjQZyLe6QVK5WWVhQXehH
	UYzFXDjwmIpcXQwiDhM2RDQ93A/a/uHUB5qmBSJm5YmZyvrl5PMN6SOMASFE72QvyZDlHy9awqFBi
	eJ/W9/Mcg/THcJbFOG6FEo1RtRlTkmeuZapq/gvO0Lyu9UyBtSKzTu/5KcbLfuSyo2C+ps/FTEMHb
	B6sYF1ytOivFby/hAAvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpafH-0000000BBF0-1tQD;
	Wed, 27 Mar 2024 21:18:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTZ-0000000AuBp-3HZ7
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=WUVdv0rxxPa8lHoyIaYtKDRoPzXAvzEPK1q3j7PbRrc=; b=fBc6aU5/SbgERnzpSK11zxPZnS
	3rmYTBgq0NrXeooDO/LjsOIo0xeTcfPm6rXFMC+NRg/NLlf3U7HpiXVOZ7ZuXI+VcXDcDUEU+SRq9
	mFN4zMzIG7c8a2lOhfCLBTXwuotHACwKkhgBLxhyFYCBXMk/MWD5X1mUoqAu8yh5WjbQYPVkMchJF
	lHeVywbbJ6ltE7zbTFxEgKfdO8yJ1bCe/qSkmd6qTnOsKL69unBlXP+WBfMlLYcFUvgow7cemW8D3
	af2F2i5gZJxmSdaKARWch4VMad6B1QACWhIuc8Tf8iFBR02NR//bPJiPRkkdtN1F4EV3GLJ05VGn6
	2dwaWMJQ==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-00000000WtA-489q
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:20 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1e0000cdf99so2222915ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569736; x=1712174536; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUVdv0rxxPa8lHoyIaYtKDRoPzXAvzEPK1q3j7PbRrc=;
        b=NmuFCOjS7HV6MI5lwJDAeIFXCbldxwTAH9UI9d22wz22em8lOkT6H2gBv8DCFvvRYA
         p3Ug/MiMV9K0QiotO4XkdqEdeiJJhvKIBjM2UxcFzISmrPk0OsvKzNq2/J7OsSCpmNey
         iprL5u0hgJo/T/Kz7JBh9m6hWVqnM0v/tFMi0IVli/DkRzUecGooLnGekK12CXPtjEyd
         RUvyotExY6Hip20+cjPrjTNEGafcRhSUcQPxPjTAzFrOusiNMcDZDngqertRIpYf68JK
         ZZcUT7213NZadtj8sZKip7tKvcVWrZ7/OhuyCLynv2HNtq+ywwEWS+3VSan61GhWI1Y3
         td4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569736; x=1712174536;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WUVdv0rxxPa8lHoyIaYtKDRoPzXAvzEPK1q3j7PbRrc=;
        b=S1PqlK35c028e8YYQCflx2tNI6PCVRqAtzC76W758nW9UatJskIBfPRQSk5ELyRucO
         hN9G8E7LVGonf1DsjWJ0NVHJiqtY58oQiABPEfDizg2BUHGzfnuU8pBu4WISmCUfRfUN
         Uk63tXNorUoTC9kRYz7T482SPF3E4rRxMy3cdS1GUt+c+fuHs//xGdbMuOm3PUurkQvQ
         gl+b8TZIfnfxHghDDrdd+i2qtddoDC2aksizL/Rak+oY23U653P0HA3+H9c15p0H4+sg
         /AMXN1S9jfzkEm55ZtBmuHc5mIw1S5OWAFjKqdMFxGiICYpX8dfC/UnNSn8k0sv75epi
         d2gQ==
X-Forwarded-Encrypted: i=1; AJvYcCWDy7he9PJQ1BggNb3Bvj4Exrn+I7b8ROb/W9gb/fPAHkltccQxWEyyhgrNKTvPhkYu6JlGIeVRJtLox0rjXVpFFrHy02or2xADaBO7YBfM
X-Gm-Message-State: AOJu0YxQecVNZ3jbNWRyhstGi12UO6ySq/2YcwSA1pGkTN3Ht0BzsAn8
	UZRz3KhiU2CsBWahlapRCJa8VLTmkaj7x4aSeyWNbKeW3kT6+iYweoSHZH+oyN0=
X-Google-Smtp-Source: AGHT+IElWB3obfH3WLoSJnhNdDLs9puYhG8ITpGoTToOUpNvi6XoJmk6eGirKGJFaRPnDc33GdSn9w==
X-Received: by 2002:a17:902:b28c:b0:1e0:e85b:2d30 with SMTP id u12-20020a170902b28c00b001e0e85b2d30mr669199plr.42.1711569736542;
        Wed, 27 Mar 2024 13:02:16 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:16 -0700 (PDT)
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
Subject: [PATCH v3 13/14] selftests/fpu: Move FP code to a separate translation unit
Date: Wed, 27 Mar 2024 13:00:44 -0700
Message-ID: <20240327200157.1097089-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200218_298745_315E2BAF 
X-CRM114-Status: GOOD (  19.04  )
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
