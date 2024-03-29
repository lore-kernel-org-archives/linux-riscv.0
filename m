Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 513CCCD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pNl/KlbSdJZsbBq590BoCDQ0VwRqeTXyh5FtmD+ZwBk=; b=J/90eFJ4ZtPe95
	uChQ/mShzG5GFvKGPC93QaLnvSOal+/q4hWwRbti3wg3zdbPGRRtF9Q2D8V3+pMLvd6ZNBw9moj4t
	rOJWcyFduRcM3oW2nNuItohi+CJucpa8xMFb0eRtjSdlZua+EnKNa0YswxU8Tii32kqwmOVEnIYID
	BKLgVsd2TA4qeMEw5NRCBdWAHpZV6lFoGadXUPVmEtnE5WEdDJfVBYDbaOaNwbrL5gMWq0vJfDadK
	h4mKKMTenRQGKxLzgLJQW90Y2CPoxy6YLWZqRbe0O+SV+RhXLCgQ/jj3uGyjpzWnSGwjpGs35RMrq
	kU39ixPcllsNt5j8IOkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7gt-0000000HKmt-2Elx;
	Fri, 29 Mar 2024 08:34:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6c1-0000000H8rZ-3SRQ
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=wd7UwvCa9oMHOiIEhQpk6/wRs60SiO2oLPgpnvXy/o4=; b=ZUH26nmEJTy5+EBj3hfulXlsht
	Z9t/QFYovH1LtmxVHm/z07YMnTmsbSWcuAYp+ogGhzt4RbfQ2eBgEA7J3wmaMZPCpO8mbSU6IIXB4
	+tw3JyQXsPJ6QMJ2YxrjRwcxpH1rh70RiAzMX6tPm6Hy8dShiXQ9p829UfTTuAZxqzTBKeE5pRVO6
	N9y/drcevrl2EBqivwKRmsN/YjCwbl9hu0THSvO28/A/aCJTnqDJtfUuu5UY1B/+18VH+KnALKthF
	5BSm2kCg4loFBqWa75dENp7g/r4dtmU2Ff7DGQeah15E6R/0G2e8U7MUR0wBkhcmq4A6s10xAUcwv
	t5ijV/1Q==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bx-00000008HGW-2pYn
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:16 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-2a0782f0da5so2028219a91.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697108; x=1712301908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wd7UwvCa9oMHOiIEhQpk6/wRs60SiO2oLPgpnvXy/o4=;
        b=HSEoPipNiMwVjGHb7t/2whWCkVmKFf7S32P71S7NTvEUqD7HL/IQs4vWzH939IS52R
         v3mQJYToSzTXfQRAGx7pTKD31s3TsFoVmspvF7yzY+cHz1fiViBacwWKKMEwpkHPXiei
         qO28B/8cajgyNedKEd+e+43GvJ3TZjIrLP76ubJkPcvCVOnAZ1qX+bBPxlYXJfdUsHrk
         KDfFNCYnXc3zzyguYZf3reSRQmYZ1RRlJhklR5h96DF4y9sceVNXk1cLA7hHHq5OBHAy
         aCmSmBYQPUR65VGPHFMALtg8ycucpLD6HuuOOFCZuuJtmPLX7fdhLCrT3WSxUmAkaCeV
         /5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697108; x=1712301908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wd7UwvCa9oMHOiIEhQpk6/wRs60SiO2oLPgpnvXy/o4=;
        b=PjTr2fwA7selLnaBXd6uHKZEufHmSqJa9Tes0FnuQgGZuFUG0yRSkO59A+QRGzOAyM
         Vk5ZSeerkNP+RQ/9zHt2Zem83Pr4/nJzkkmQv5AA0K4Q0wl40AAQhko5G3zbrrri5eJT
         ymxV+IVvN8DvJD99AgooMdemUhKvHit4ID0H5283S1tUeon0ybk0tP/Hqn2JK2lkr6fL
         MLgajdyuU8GfEodlRWmwSrf3rSiiA7RU+Su+F6v/g43p22L0remc0xf8UvRVz44k3HYu
         W6/1dsCjaPGgeJs0IQDR+PySNc+R+w1cve4is+AU7SLsJrf69z3RWaHZ4gftwUQYYQ0t
         4cDg==
X-Forwarded-Encrypted: i=1; AJvYcCXqB/T01hzyZxG6geLLdvNuLWBZ3WVfY57zKYQPS63YMQHU4w/WNYr8z05BrRUN6srV3BNO4hqIdoyD8AkYTCTmt3l6obx4MPOUJGzfzjeR
X-Gm-Message-State: AOJu0Yxqrtjiq3sSIPO6QXiCFd1xJzVivNWvH47NlHsvFfmQjheELwr8
	B0H4a6Oi+kXe7+NE3PVOk3Lx8tEEBMPXppcVnPLsKIt4qj9j2nuAeLm8NfjYeUM=
X-Google-Smtp-Source: AGHT+IHxypVhChIzRiQ/e47hMPrNYQnLhNujXyM1QCssN6f6ZMhSHIBGzyaKpY86BExy9FwELnwgHw==
X-Received: by 2002:a17:90b:1c06:b0:29d:f52c:5d40 with SMTP id oc6-20020a17090b1c0600b0029df52c5d40mr2496570pjb.15.1711697107768;
        Fri, 29 Mar 2024 00:25:07 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.25.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:25:07 -0700 (PDT)
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
Subject: [PATCH v4 15/15] selftests/fpu: Allow building on other architectures
Date: Fri, 29 Mar 2024 00:18:30 -0700
Message-ID: <20240329072441.591471-16-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072513_882474_D9FEA298 
X-CRM114-Status: GOOD (  15.77  )
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
index c63a5fbf1f1c..f93e778e0405 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2890,7 +2890,7 @@ config TEST_FREE_PAGES
 
 config TEST_FPU
 	tristate "Test floating point operations in kernel space"
-	depends on X86 && !KCOV_INSTRUMENT_ALL
+	depends on ARCH_HAS_KERNEL_FPU_SUPPORT && !KCOV_INSTRUMENT_ALL
 	help
 	  Enable this option to add /sys/kernel/debug/selftest_helpers/test_fpu
 	  which will trigger a sequence of floating point operations. This is used
diff --git a/lib/Makefile b/lib/Makefile
index fcb35bf50979..e44ad11f77b5 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -110,31 +110,10 @@ CFLAGS_test_fprobe.o += $(CC_FLAGS_FTRACE)
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
 
 # Some KUnit files (hooks.o) need to be built-in even when KUnit is a module,
 # so we can't just use obj-$(CONFIG_KUNIT).
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
