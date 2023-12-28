Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95AACC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 04:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uuBko7d/EucEic0jUzIh+VMoCFowt0rYpkxCf0Cn2yo=; b=OB0z5wGL0ZXNtv
	gzGBptr4g/zQdGSYCMLccspXT9jGHnX+TW+5jhGOCK/t6vqCWRSSelecAVBaTQLqFRGxSj1z6vHSx
	THUDcOVnuw3eoFIf7HxV4CrZgD4Tfxpf8gjv4pR0EAzG/eT9mQLRCuW0bRkwhs2rewj/eI7eJbKUC
	hDCr5JckFrv4/zmQi6pagOpN5OL5Ua85RfL8QTAQywHon0kX1INb4rz5NSKNkKq6B/pGQTPqxDyWS
	ZZXkk9KeG6pJkkhlm7cCTWB6GusP0zHiPt7+SoX5ijB96fzxnMJanfKksy4etinCjsXHx4qlfGLuZ
	7Vwoxg5Fdh3Uq4FzZ3sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIhZe-00G4aF-18;
	Thu, 28 Dec 2023 04:00:46 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ1-00Frwn-2f
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:46 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3ba14203a34so5720219b6e.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727760; x=1704332560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2e+fg9SOqP34XnXL5jU4pEY4/pq3fOIOqFLUTdc21ng=;
        b=TMpXNDhVvP9jno1PKkY+no1hMhhUSjEAv8PDXUO2bbtkG8oybpTGp+xBySzuob2yqd
         h26pfehuIP3QwlrPQd058UFUBe71FhqQYm5Cp58Vnv8J+uBlGZonNyqeC14wsgguej7Q
         13502b4MWn1UAGBjNGen/GAC+vcWq1kdUmry4qs4+hO1WuHRbd9yzytUY4dN1CruouLm
         /8Yw5cqGWO/irqG0JMqIMyxi2rDN+xEGtyM/UOjLKa+P3fGyd/D8T1f4SUaVsIWqYYzs
         +B7tvXP2AnDOpGbHUFl9pgv07Z0tkSthcYohT6NZNT8y6Hm8nQ8St1IbW0GYfQvEI1Ax
         L2Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727760; x=1704332560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2e+fg9SOqP34XnXL5jU4pEY4/pq3fOIOqFLUTdc21ng=;
        b=No7jFNdTKhDwze0ZtUGHiaXx6/XYvCz4tbYdDBQnwIFw3ZQcIy+1w6rTyoXOk7rIsW
         oqul2qgE6OdPxfoIVPdq34LCdlL1G278hFiqrTk8ARlewCkt/Nv3nrY7DZe64Jsu6u5b
         fmlWUYM8EIkkDdS1iXAeCbM0t85wYdMCGrR618Xm+U5zjzRVo/V3esYOGJAO1IjbokdD
         tfx/qkaPpoUYa4HOBm/k/bX7WO78W+/wErc7xPnPmvgLMmjIZaR6u4rvJQrLJBaKThsb
         0ireu3QPPslrfZ3qKkOhpVzn+oDRMnMZBShK3RqaqKtIjerbuFQgLe21PkXmRscVsf+M
         +N/g==
X-Gm-Message-State: AOJu0Yw7Cj2TIStwJVKykXHnje8pjsZIXUDKyau7WACDByd7rqIrUWGy
	zqwd3fTVVLsUm1d+tTJjNE2BekGMhVtKlQ==
X-Google-Smtp-Source: AGHT+IFlBstkCmb/D17edCTs8sY4vteYMNaBpcxdbvjkI2D4UtEwweJgmB+5F+NfpsSlT4ktPGSvhA==
X-Received: by 2002:a05:6808:159d:b0:3bb:76ca:f143 with SMTP id t29-20020a056808159d00b003bb76caf143mr11199985oiw.54.1703727760626;
        Wed, 27 Dec 2023 17:42:40 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:40 -0800 (PST)
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
Subject: [PATCH v2 14/14] selftests/fpu: Allow building on other architectures
Date: Wed, 27 Dec 2023 17:42:04 -0800
Message-ID: <20231228014220.3562640-15-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174241_918677_C925BC48 
X-CRM114-Status: GOOD (  15.56  )
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

Now that ARCH_HAS_KERNEL_FPU_SUPPORT provides a common way to compile
and run floating-point code, this test is no longer x86-specific.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 lib/Kconfig.debug   |  2 +-
 lib/Makefile        | 25 ++-----------------------
 lib/test_fpu_glue.c |  5 ++++-
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 4405f81248fb..4596100eeb14 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2918,7 +2918,7 @@ config TEST_FREE_PAGES
 
 config TEST_FPU
 	tristate "Test floating point operations in kernel space"
-	depends on X86 && !KCOV_INSTRUMENT_ALL
+	depends on ARCH_HAS_KERNEL_FPU_SUPPORT && !KCOV_INSTRUMENT_ALL
 	help
 	  Enable this option to add /sys/kernel/debug/selftest_helpers/test_fpu
 	  which will trigger a sequence of floating point operations. This is used
diff --git a/lib/Makefile b/lib/Makefile
index e7cbd54944a2..b9f28558c9bd 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -109,31 +109,10 @@ CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
 obj-$(CONFIG_FPROBE_SANITY_TEST) += test_fprobe.o
 obj-$(CONFIG_TEST_OBJPOOL) += test_objpool.o
 
-#
-# CFLAGS for compiling floating point code inside the kernel. x86/Makefile turns
-# off the generation of FPU/SSE* instructions for kernel proper but FPU_FLAGS
-# get appended last to CFLAGS and thus override those previous compiler options.
-#
-FPU_CFLAGS := -msse -msse2
-ifdef CONFIG_CC_IS_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
-#
-# The "-msse" in the first argument is there so that the
-# -mpreferred-stack-boundary=3 build error:
-#
-#  -mpreferred-stack-boundary=3 is not between 4 and 12
-#
-# can be triggered. Otherwise gcc doesn't complain.
-FPU_CFLAGS += -mhard-float
-FPU_CFLAGS += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
-endif
-
 obj-$(CONFIG_TEST_FPU) += test_fpu.o
 test_fpu-y := test_fpu_glue.o test_fpu_impl.o
-CFLAGS_test_fpu_impl.o += $(FPU_CFLAGS)
+CFLAGS_test_fpu_impl.o += $(CC_FLAGS_FPU)
+CFLAGS_REMOVE_test_fpu_impl.o += $(CC_FLAGS_NO_FPU)
 
 obj-$(CONFIG_TEST_LIVEPATCH) += livepatch/
 
diff --git a/lib/test_fpu_glue.c b/lib/test_fpu_glue.c
index 85963d7be826..eef282a2715f 100644
--- a/lib/test_fpu_glue.c
+++ b/lib/test_fpu_glue.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/debugfs.h>
-#include <asm/fpu/api.h>
+#include <linux/fpu.h>
 
 #include "test_fpu.h"
 
@@ -38,6 +38,9 @@ static struct dentry *selftest_dir;
 
 static int __init test_fpu_init(void)
 {
+	if (!kernel_fpu_available())
+		return -EINVAL;
+
 	selftest_dir = debugfs_create_dir("selftest_helpers", NULL);
 	if (!selftest_dir)
 		return -ENOMEM;
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
