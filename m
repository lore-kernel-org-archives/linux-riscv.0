Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDC5C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x191tfTG/oEWq7MRXhQYcjHfIS/HCFqH/eZskRnbLEY=; b=n+XtdPHDoCZeIb
	Chlq276qnuHFfGPohj1JOOV5nOuBbvKCMa/HpVlsfLJhWryQiYRpPXKvkuVPj5EIxwy87PrG4D1P1
	JZHBb0ZjKfJa1jXovoHHvPjikCZOzY5GMll3bLgUJS9z0ebOkadfyLcS42t5ryauty8rsHTLoravq
	EirBveV49fguIoVYOStyUirwcA9oX2GvJyZ9wvAUS6qCWh5qPqKSrvkWeyxsCnJSvBoHf+XgadWRE
	EjDQ1QztoF2H4q1Nm/N8SxZ844jyKdyL59VqC3EMAGHk+mjJ+iHeNm1quMhyG5YJOeJomNPdad/Bb
	jPADz9/wpiB6H9tb3Oqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTqF-00EoN7-2q;
	Fri, 08 Dec 2023 05:56:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpl-00Ensx-2y
	for linux-riscv@bombadil.infradead.org;
	Fri, 08 Dec 2023 05:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=pcpcBg9iqyFf2P75H/RgUfyoTRLcpINzc/uQQUbU4hE=; b=Mo5M77j28u/tg+qyQPuS2awBmN
	RBIe31XCZh8GRKrtRCMoZzAjB4Fq2Im6II8aDJTwZOQLyS50Lu+mGBc4epCtAGe7POhMuZOSLpLZA
	BqAj/SBmJFTscAsFPLSQjI1QwS0cAJ02RdNWYIqVT5GptutoiBG08IqTZCWS3qVqYg7VYSTdqAdRx
	H7MGh9WzKILoIez08JXgM+dtYRInSUdh5JLwKpzYFHhR4qtGbG+yDu8Nh6c3Ks6Xpb0jAZ1IlanUc
	e28mCTENzWijspXuRhd6/ayiqwCctTOfUPj31MB5m8IpLo6D4KHzJI8xEotJAT14PLNo2gKwqwX4C
	GoQGTJhg==;
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpb-006Uoo-2g
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:32 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1d2e6e14865so6660275ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014917; x=1702619717; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcpcBg9iqyFf2P75H/RgUfyoTRLcpINzc/uQQUbU4hE=;
        b=ai5IzG8YAbXGVl86WPkJudzCq0qGuyICFGeVTyGcyM8VzGYhneVqsGKEBzJ3thfyc4
         Oz6al7Abi3EQsG4I2fzgsaLYVecyWUb0cx9jhP1R2Er5uNFRj/48o1eeXDnx6QdLVeZ7
         AepZAMu1u7mfb32QLR2+u6tqraX4npORP2LvXEXUJfVBCKAXHWM3S+11xr8sEkscbFEp
         x4F7sRe94oTm8mMgfh0xKER9YmC4bGWuCcKPFD0AtXTA8NbXNj7SUsx39ytKQt5j0ex4
         is8mUoL05wQOCtnqGzq3+i66aHNjPaiwTZIkv2ebZp1h7t+Ydaas+DSIQslxMqyZkqek
         kpEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014917; x=1702619717;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pcpcBg9iqyFf2P75H/RgUfyoTRLcpINzc/uQQUbU4hE=;
        b=Htd18D7ADeyjwbODvN1UE0FTyLOGBl8d6DbSOHdiKq0/zwbjyekplfGdXlKnvkNxag
         N4Imss4dWxDHZYZVpdyL3pEeq3XDS+nqxmrIMUFxFqQ4ot4m1jIzR9okyog8v2K+w2kG
         4mBk4F4MOYS6aXRRosiZrFycQMOXwvCoA4itUgNQcczvisMC3YZHa/MZQUEcHiFn08rh
         Dawp9ZOYBJfclswWQBgYdQpUB/5atzImAzta3ghfCKpyOdHgHUd8nNDG0mvAR9t3SH4u
         /yURLf6S0kbWsNE+5S9b3XKmnih8xMn33Pw9kffDhct5YJ2Nt8j/dzzOdHfyqJziYfqm
         txkw==
X-Gm-Message-State: AOJu0YxIQV0z6PRQeBwr3aCJHLkfSMVEauGU9Ik/BAYJM8KLUCcwHRHb
	8lLMfhoT084ytgA8z8w9mrVeAQ==
X-Google-Smtp-Source: AGHT+IEd1Q8NqQMc7dge0J/g+8VD/1S9VTAlw4GMwW5YWZLRIvv4qPwcnwD5N+VJxlW0x3wmr8JadA==
X-Received: by 2002:a17:902:ab0f:b0:1d2:eee7:2a7e with SMTP id ik15-20020a170902ab0f00b001d2eee72a7emr114365plb.61.1702014917640;
        Thu, 07 Dec 2023 21:55:17 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:17 -0800 (PST)
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
Subject: [RFC PATCH 12/12] selftests/fpu: Allow building on other architectures
Date: Thu,  7 Dec 2023 21:54:42 -0800
Message-ID: <20231208055501.2916202-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_055524_518301_A4B91345 
X-CRM114-Status: GOOD (  15.68  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 lib/Kconfig.debug   |  2 +-
 lib/Makefile        | 25 ++-----------------------
 lib/test_fpu_glue.c |  5 ++++-
 3 files changed, 7 insertions(+), 25 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cc7d53d9dc01..bbab0b054e09 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -2933,7 +2933,7 @@ config TEST_FREE_PAGES
 
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
index 2761b51117b0..2e0b4027a5e3 100644
--- a/lib/test_fpu_glue.c
+++ b/lib/test_fpu_glue.c
@@ -17,7 +17,7 @@
 #include <linux/module.h>
 #include <linux/kernel.h>
 #include <linux/debugfs.h>
-#include <asm/fpu/api.h>
+#include <asm/fpu.h>
 
 int test_fpu(void);
 
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
