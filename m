Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDF4DC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:56:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pQpUa3aMGzfwy7p1nM10TX5hgADcQtwJiWkCkZbBHPs=; b=N9dYePRuldGl+Z
	1fFK5hgYwhtgoH7Rob0jNZ/e2TmkRDoia7PxfzTOYH0BvW3nVV6eThS3NBVNMOx3uTxKhAvhmMq7h
	p38sxmyEUiIxLilMbP/W+sSJuiaMT11ZsRHEoJwHVWesapMaKlH3cP3e1cwAZ6/6z7lRIabSOu8x5
	9vRnG59flZjPz5Z7xa14qumEDrRze3zHIl0vz1dKVA2K0nhySY8Oe3ib1AaE6urJC5G3oZVdLisSb
	W8aQJe8Qp5KcWTbEvqPTl3rWJtbHVAxQUv9LRFoGiSVMdgEv+IERjtB8kty4/CSU2lxbsQqZKiVme
	qUoGbueBr2a8ryjEJbOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTq6-00EoDc-28;
	Fri, 08 Dec 2023 05:55:54 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpU-00EnbJ-2h
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:22 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1d0ccda19eeso14604865ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014916; x=1702619716; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jlkhIfYEZ3lvxXxXZeJnWgi8rztsMBcyR5bRnlna3ss=;
        b=GqtFeIFWpOmY4GYXQcv1dhgPyXwHpXOcQR++aVxXQWmk7Qbr7mDbVuZgL7ff+1iy5p
         CfppDYOSWJOZNBZ8XjzPn64Kl9bLQX0CNgm80QmRFEPo794ZOtTkOZSswAzbf8gQEX7E
         BIJCmsNfeokzHftLKcl7Tp3+6JI34VwZD1ibY5xMFzFVz8o+PeGnjQm+yvmsyr2WulEc
         twfeK5H6twFwzljDqpINBJJMGMP2IBt88MdqBOZNJawzUj6OmqN1fR+wP1K9Ge2x6wNj
         zNA+STp1Hiwh1OT4Th9Roabq3mwdD+qfx0yR14c4VjGiPVBDwqTyQpEIV3T8nyx2g9d6
         oBwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014916; x=1702619716;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jlkhIfYEZ3lvxXxXZeJnWgi8rztsMBcyR5bRnlna3ss=;
        b=oNlWOQxsBZ+qkIr1lQeJwH603HvZm1WRmQISa90lY+r1sZolmbVvTRFO1H3SXdeKYE
         2IbE4kV/W3pK5w/otGXLnjxVjsxdIxlTzjRYxAqZwfJg5fmBgPX+qcreNwbyilNMkxcY
         cJbsDaleKRPW8S+HDVO+DWA/x7EIaEXrNFZwVVpPCNfnB4/qEUx4/8NFxODGh2TowuVd
         rbEMmr8Kd+e2SAz54w22CfhUjv6i4YbvuXQWl2KuEyQDVmTvAyOA61Gb8Bah62JGBj30
         MgIr7hU31+IPtD5IiwAAxWl2/s6D0AqnbQCWvGK5Q4nUxVeRvo8YtW4UFlYNtZ3WPEiA
         nXfg==
X-Gm-Message-State: AOJu0YxLW6/4kx7J27FTL5VvZstjnqQXY9692Pn+A5yevhZocjmtIVjN
	qIuRUHMnjcXQjax0u8Z36pPSxA==
X-Google-Smtp-Source: AGHT+IFq3S7FmJealx+s/zAc0NWuz2K3VM/cjjAkpGlz2K3tHlLviwkN/+BPcQyJZRioERW0JqTrBw==
X-Received: by 2002:a17:902:b60f:b0:1d0:c7e0:c82c with SMTP id b15-20020a170902b60f00b001d0c7e0c82cmr2930083pls.8.1702014916347;
        Thu, 07 Dec 2023 21:55:16 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:16 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@infradead.org>
Cc: linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [RFC PATCH 11/12] selftests/fpu: Move FP code to a separate translation unit
Date: Thu,  7 Dec 2023 21:54:41 -0800
Message-ID: <20231208055501.2916202-12-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215516_899319_C0F4F04C 
X-CRM114-Status: GOOD (  16.46  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/Makefile                        |  3 ++-
 lib/{test_fpu.c => test_fpu_glue.c} | 32 +-------------------------
 lib/test_fpu_impl.c                 | 35 +++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 32 deletions(-)
 rename lib/{test_fpu.c => test_fpu_glue.c} (71%)
 create mode 100644 lib/test_fpu_impl.c

diff --git a/lib/Makefile b/lib/Makefile
index 6b09731d8e61..e7cbd54944a2 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -132,7 +132,8 @@ FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-st
 endif
 
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
-CFLAGS_test_fpu.o += $(FPU_CFLAGS)
+test_fpu-y := test_fpu_glue.o test_fpu_impl.o
+CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
diff --git a/lib/test_fpu.c b/lib/test_fpu_glue.c
similarity index 71%
rename from lib/test_fpu.c
rename to lib/test_fpu_glue.c
index e82db19fed84..2761b51117b0 100644
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
+int test_fpu(void);
 
 static int test_fpu_get(void *data, u64 *val)
 {
diff --git a/lib/test_fpu_impl.c b/lib/test_fpu_impl.c
new file mode 100644
index 000000000000..2ff01980bc22
--- /dev/null
+++ b/lib/test_fpu_impl.c
@@ -0,0 +1,35 @@
+// SPDX-License-Identifier: GPL-2.0+
+
+#include <linux/errno.h>
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
