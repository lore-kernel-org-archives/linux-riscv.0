Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86E26C46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PR6QOkuzefZMD+HUhwdVQPewwqj4Hoat6qe368HycYA=; b=HhMhBNqchsqMRB
	S0nLSW/n/d9TPpHbUBW4useFUwo3nYjuXpZSL7hyp90fdXO4KvxEZbyns6uLlSf7lXOKx8hdCFCob
	1uGV1A4posPiD3JTe1VrB3PVFITqiZzl95ZYUrDt7/gqGqa7FKAqaOq3qmkigVEluxr/K7vJlQ9YR
	sBFAZqkQ6SdWoOSDqbLXH0u7dVg4V593qMbo02TKf0UWgELflMVaqZCzvV6T/XsNHWUVmRmMv12uw
	/G3IebJeX9GMpJdM6q8OXp2ikBITrQHm67u4kpq6oKatgoA3/gmPneRwf+uPTCgXUb9Ck3MoxydYr
	Bnnxy2RXvZ+SGfSpsLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfRJ-00Fsx3-1I;
	Thu, 28 Dec 2023 01:44:01 +0000
Received: from mail-oo1-xc36.google.com ([2607:f8b0:4864:20::c36])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ0-00FrvR-29
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:43 +0000
Received: by mail-oo1-xc36.google.com with SMTP id 006d021491bc7-593f420187aso3618208eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727759; x=1704332559; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cNUGRAFHmKzY6lG9DcfUZlQ4QTwCBjkCL5t9hP4xKAE=;
        b=H66MLoC+5OApqRJxufPGLfaVx6v0l4D4mf28XHrnDm00rY5DjjRV1DcifWZJ1ZUmGX
         AE3TGSzUzElAVUFGVmcjdJ3bbk0T+XwGPbY39kv43Fhg4rERuYPtr1xilumStCEfxrBU
         if6h3+R/645DgHXhzcfGT1y/oGLIqQmGMEYiXZVwg1hsM5sp2NLpudu5+gfOhC717VHC
         9NO/ivePkqVPYFXxAX86wK+JOvhHrOY3wAEnDf2R3BuRFTomqg92y0Ip0htbqJZh5/Gj
         mEh0X+wF6fgA2Ry8sPCiqHGAg6LkgD77rGcnY89u98TB9OMiGcTla/YR0U6/q4RlTgjr
         3wlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727759; x=1704332559;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cNUGRAFHmKzY6lG9DcfUZlQ4QTwCBjkCL5t9hP4xKAE=;
        b=CkPh0xahS84HhSaBOd4W4LTl6M3PHM5Kppus/kJo1qfcz6NX9sahyYvCWgXz4mAT09
         eH8fESIpyaCJ5vfaErm6urwxy58L7ihH2YnYCxxAbZ+ON+U7XlB7SCjZ2b4xXsfrN+7s
         7po5qtPyxD2RotTKX0QeJu/h5rR6XsjAekIv8ysLVTDpz7HhBQXWrOJ3j944EDywfo0T
         Ap/5TLieZ72Im6jWhAt3+rc3rMHs3RZH+5MiDyZ9SnrCclXXEhQKwldGruJtaVFaxVvL
         3tkpPZ1W7kdtRclLkR9yi/xtHYYrzqt37yYYH5HAbZRXTGZQuBq3nOF0NbbcZW9e5dGA
         0bcQ==
X-Gm-Message-State: AOJu0Yzey6wNEX+I7Pr3xOWRikNS92SWMlfdGy0+//I3aO5MwEbjnfBR
	FCwuk8Hun1JdVGPhCfsIoshFgubjm+R2iaSLtmB1UaOs6zs=
X-Google-Smtp-Source: AGHT+IGvfqTB3x7wwPMxp1qNsfQvBXkwAH7kyz4he4Bu1Z+L46cvb1psldcQ6vV6De8969ozhHXwqQ==
X-Received: by 2002:a05:6358:3a1b:b0:172:c06c:fce3 with SMTP id g27-20020a0563583a1b00b00172c06cfce3mr5190091rwe.58.1703727759326;
        Wed, 27 Dec 2023 17:42:39 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:39 -0800 (PST)
From: Samuel Holland <samuel.holland@sifive.com>
To: linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Christoph Hellwig <hch@lst.de>
Cc: loongarch@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	linux-arch@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 13/14] selftests/fpu: Move FP code to a separate translation unit
Date: Wed, 27 Dec 2023 17:42:03 -0800
Message-ID: <20231228014220.3562640-14-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174240_709295_7C849055 
X-CRM114-Status: GOOD (  16.98  )
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
