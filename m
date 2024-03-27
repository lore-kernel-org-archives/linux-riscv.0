Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767C5C47DD9
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fFWb9t1sbr25t3tpRDaSXGYnc66GSNcqDZVCIlwiQSA=; b=Qhc+i9cOZmajjy
	jXJBCGCNlO9itF9EC+VEZvEKjWByfPKh9Dmzk0/ElSz/I2MixNJjHOMVdd7SgtiqFw4Vlvw6nVKOs
	vlh9/bZCOCAQcHvi6qV21Mh0rSnT/vR7I+ugTgNU1Ae/6PAF8az0sWBgIUt93skgbdSzHSHVGWBIW
	+1jvfJHQzCD2pAG6Is0kncwFbHHu5yzr8NSGdD4NUm0lqxTt7r696QT3s6ehD237I3kaK0HNF+su6
	0l5ebBrMTsDfofUSCCM/ZQzVYMBuWm/9kSCfWl8BNNr3L1d2Bf5NmVC2M/IX+D6XxMbe6BT8StE/A
	OSXlSQGzyXF2pgeXSSmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpafK-0000000BBHU-2UlJ;
	Wed, 27 Mar 2024 21:18:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTc-0000000AuDK-2ZMD
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1KPYCb9S3Soscoa7gVsLkBiv/vc0d18dY2Lykf0pkTk=; b=Bn6ZTRfdseQ7Td/6DtgL8Pe7JO
	89jH5YC/RJe7mtijzXubAE82Z3e4gGuOKC/TRKEmo3uLp0JgurmFaG5HJPN4kPKGa7LcVth0MSt2P
	XjqPImZSOykVus/1qwoSKd6PPpRjV6Uw1vvU3O6cZYSoGe4a7TzSgGy8gcISUTt8Pmte9bsu430Np
	lKQ54YOyC3sb5u08tuXT+TavibJXWg5oFaFM4deVZouZrllTLbHO6mvwrxmoBdzXT6jtBLLc8JTHB
	OviCdDeVIV0Cx5ToaUtkMh0heoGBo4MxbEhBP+35Vj0aVbLJxwUWQdIvscgk8JzzigBntsNnFQ98I
	9AFo1t8A==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTY-00000000WuO-0hyL
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:22 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1e0b889901bso2372345ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569738; x=1712174538; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1KPYCb9S3Soscoa7gVsLkBiv/vc0d18dY2Lykf0pkTk=;
        b=Wend+BTNhAl3h/Y0T94rZgzWTH0wMSQCtZ2HraTwh7VSARwbCS8n58t+wfn2VXqZBB
         lJfvxLCmDME3VcUIzGOcGDjCVaEOcYOQe82uOKbwXFylxDgG8xZ1/k1fV/DdUaVsGsou
         +LwoCHWopObqD/vaiRjSrMDIPDKl0b9OHJgnxEBuSir5GFWDQ4ZRkNDvKW8tqK9LSdHK
         M/7Gn9jpbN54cgqC5cMPCCy4zD/BJfvrD7n1cByIE2JLqVIHQFlGPWa/Ty5zxIMNlp2E
         BNNE1hyvr660V0JQYnPLN60q+m8SzISrBfvWZFgr78+MkSFx+6Sy7G5+cFHEe0X5b6Tv
         fbwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569738; x=1712174538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1KPYCb9S3Soscoa7gVsLkBiv/vc0d18dY2Lykf0pkTk=;
        b=iJUWtJFK/2VFUUm9ikWLFw9OXTg9Yc2WXRnr3+whqhZkoSAfTLFdVP0TGsrbPdSFxN
         mLP5fKHGOBRgNUdzm9o9qR4vSa0fzivPQ8tfxvTZxZ+teahavRTKZcyaw1wkQE6iDZnF
         Odz84pKyi2fhGNGNJMPjrn7f+zKjRXETwwDOkJbkcfRD0JrRzfEjYrPNaJ8GGRx+KJss
         gOtHi88DmWSsBLDAoVMrhItee4xwCgW8yaMnnkJCe0kz1Q9qiXwgetXaZWlUKq8r1vNO
         2qonXD5DhY4U6w4V2Heb3S6dyCIYE6b/xwlENaQ8qKNgQzX19XAOsuziH+v+yXV2EsSa
         WG+g==
X-Forwarded-Encrypted: i=1; AJvYcCVksk/b0divdKEqYQZjM+OKj3453UEtDdUHz6RwwwsN1L9MNRdwD4KhLBs6ofAQ2qhiLGQ9xa3wG9dYixYITtE/2SIOJ3VERjLX0JbAFPY0
X-Gm-Message-State: AOJu0YxzJDHxJZ79oCOGHFuV0tIlNSzzPoS8/XYGh+BMlQQab5ZbEe7U
	T3YU44KTVGxwAjhTsYNL9tWH0uV1AylIecN0QVp1bqgHuR8CI36Dy/4MQCg80Zc=
X-Google-Smtp-Source: AGHT+IHiVrJt14UyveizhwLAq9XPpEU6ZyZvDdQzDZe0rjNysh7dZh6CYDZhY9eiiH2RA2j+uTxBcQ==
X-Received: by 2002:a17:902:ec8b:b0:1e0:1f1d:bd38 with SMTP id x11-20020a170902ec8b00b001e01f1dbd38mr622795plg.7.1711569737898;
        Wed, 27 Mar 2024 13:02:17 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:17 -0700 (PDT)
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
Subject: [PATCH v3 14/14] selftests/fpu: Allow building on other architectures
Date: Wed, 27 Mar 2024 13:00:45 -0700
Message-ID: <20240327200157.1097089-15-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200220_650046_0BFA513D 
X-CRM114-Status: GOOD (  17.30  )
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
