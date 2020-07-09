Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA1B1C433DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:36 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7331720674
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 21:20:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="1pAX8rYp";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="ijCLadg9"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7331720674
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=T6/uLuDJI+QMsbb6yAuRpV12zyMQhXwuVLq33uO3QzY=; b=1pAX8rYpNnwMovOVqPJucwE1X
	mal6aKhmenA6AEwnyI4nqMQp6f5YTVXHTMWU2tHE3aJWVXlmWbWwcoL2OW/MwCp2D0+nuzIy3wykA
	DmOzi5RLTzolGq/VxpFW7+UOsgFbzqiYi9g8oG0Qf8lwzQ5y9CkNDnCpyQ7EcERjm3kwGMyfoae63
	RqQ/PSvjQdqtAHLsM8xD0dszuliJ5X7oJmMD+o53ndDEXPSI89AYWkbA5uhFVXs+7nks3CmQszDl6
	8gj4SPyAsI6dbGWJCKf1WUEuk+9ICOTkiIMkPOPPvRBWUN1Iko8SVJJsz1uz3ji/fc+lNDPfQrDXF
	0YVn2mHPA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtdy0-00031c-JQ; Thu, 09 Jul 2020 21:20:28 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtdxw-0002y5-Aa
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 21:20:26 +0000
Received: by mail-pf1-x444.google.com with SMTP id s26so1554824pfm.4
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 14:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=IoN0ofJwh1UdSJZrG45poUEEL9eQbsw5TN4BhVO7rUY=;
 b=ijCLadg9/ywJgYDUZqhO3CFLNawUC9PQK9RzC6EyRKl2ut1Vh9Uxbrdp1zG7Q8BvY1
 IT8TiNV+TsZuyWgrpBEacDVdjLu1TPLlrz3KzY5jrMzdqg5Sbytd4xxQ20Jszm8pVAB2
 LakCgriDdNDsAO70ZnOLmP2nxUnBDqqs6ih9dyf4ggAoV5z8ckv+C547SZ5jfXTKiBjS
 4pwltn9B48cUQA4Z1i+OKH6ln2q4v0SjhHxelg81ixJy8IsVk6+XECL8J/57OvLmbW8/
 imi9BIpHW0J4ubt5btaR+daergvWv/CQxwQGqAwLrskAeGFHmPZYAh5hKHa9RBpXlueC
 PF8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=IoN0ofJwh1UdSJZrG45poUEEL9eQbsw5TN4BhVO7rUY=;
 b=rcr58AqCSupiU5V0CdBOsFCDMeTtsJ36zLorxqEKhtuGIZzwKg2Jh47NT41jRUvhiR
 yP3oIkOxsapppXYs3dK/5WrfmtvEtCpLIS0UIv+48gGpV9Ha+nQXdh9u8w/kA4yUY2vt
 wGMWqp7z9t6udY7Yl/Bw/xfASfLGUpDt8ex0Y8p3HU1U/4a1oYZ/B5Jxqrru7u/e+s5X
 +vepr+xUlM/1d2BFdKYgX5LDe/8EEpxygLtNAbIYHdVK8+W59JeTTX3XdeRfiW27IWkJ
 FYmmlDvt2FQf0DzwbEnRBghaCehx2y3SkV84bDqQO9nVrsbvB57lt+WXPErAdn4OwiNl
 Ej3w==
X-Gm-Message-State: AOAM531CHX/FNoYyJxW6dFh4ikZwVzka3RVLtvW2/B0wlur771TBAjEx
 1dsgyHL5EQ9wCB41JCn5QVzdKA==
X-Google-Smtp-Source: ABdhPJwwZl7/EtcLQREAQXnTMvumd9EZSkHCBnUnrvBquqmgBqsvZpoFn2PoSIK4sKtFnT11ZlUVDw==
X-Received: by 2002:aa7:988e:: with SMTP id r14mr51501165pfl.35.1594329622094; 
 Thu, 09 Jul 2020 14:20:22 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id nl8sm3801559pjb.13.2020.07.09.14.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 14:20:20 -0700 (PDT)
Subject: [PATCH v2 1/5] lib: Add a generic version of devmem_is_allowed()
Date: Thu,  9 Jul 2020 14:19:21 -0700
Message-Id: <20200709211925.1926557-2-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709211925.1926557-1-palmer@dabbelt.com>
References: <20200709211925.1926557-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zong.li@sifive.com, linux-riscv@lists.infradead.org, rppt@linux.ibm.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_172024_498638_F0B883D3 
X-CRM114-Status: GOOD (  21.61  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, brendanhiggins@google.com,
 elver@google.com, glider@google.com, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org, ardb@kernel.org,
 bgolaszewski@baylibre.com, clabbe@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, Greg KH <gregkh@linuxfoundation.org>,
 rdunlap@infradead.org, Nick Desaulniers <ndesaulniers@google.com>,
 linux-kernel@vger.kernel.org, changbin.du@intel.com, mcgrof@kernel.org,
 Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
 akpm@linux-foundation.org, davem@davemloft.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Palmer Dabbelt <palmerdabbelt@google.com>

As part of adding support for STRICT_DEVMEM to the RISC-V port, Zong
provided a devmem_is_allowed() implementation that's exactly the same as
all the others I checked.  Instead I'm adding a generic version, which
will soon be used.

Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 include/asm-generic/io.h |  4 ++++
 lib/Kconfig              |  3 +++
 lib/Kconfig.debug        |  2 +-
 lib/Makefile             |  2 ++
 lib/devmem_is_allowed.c  | 27 +++++++++++++++++++++++++++
 5 files changed, 37 insertions(+), 1 deletion(-)
 create mode 100644 lib/devmem_is_allowed.c

diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
index 8b1e020e9a03..69e3db65fba0 100644
--- a/include/asm-generic/io.h
+++ b/include/asm-generic/io.h
@@ -1122,6 +1122,10 @@ static inline void memcpy_toio(volatile void __iomem *addr, const void *buffer,
 }
 #endif
 
+#ifndef CONFIG_GENERIC_DEVMEM_IS_ALLOWED
+extern int devmem_is_allowed(unsigned long pfn);
+#endif
+
 #endif /* __KERNEL__ */
 
 #endif /* __ASM_GENERIC_IO_H */
diff --git a/lib/Kconfig b/lib/Kconfig
index df3f3da95990..610c16ecbb7c 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -676,3 +676,6 @@ config GENERIC_LIB_CMPDI2
 
 config GENERIC_LIB_UCMPDI2
 	bool
+
+config GENERIC_LIB_DEVMEM_IS_ALLOWED
+	bool
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index 9ad9210d70a1..e095bd631ba1 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -1577,7 +1577,7 @@ config ARCH_HAS_DEVMEM_IS_ALLOWED
 config STRICT_DEVMEM
 	bool "Filter access to /dev/mem"
 	depends on MMU && DEVMEM
-	depends on ARCH_HAS_DEVMEM_IS_ALLOWED
+	depends on ARCH_HAS_DEVMEM_IS_ALLOWED || GENERIC_LIB_DEVMEM_IS_ALLOWED
 	default y if PPC || X86 || ARM64
 	help
 	  If this option is disabled, you allow userspace (root) access to all
diff --git a/lib/Makefile b/lib/Makefile
index b1c42c10073b..554ef14f9be5 100644
--- a/lib/Makefile
+++ b/lib/Makefile
@@ -318,3 +318,5 @@ obj-$(CONFIG_OBJAGG) += objagg.o
 # KUnit tests
 obj-$(CONFIG_LIST_KUNIT_TEST) += list-test.o
 obj-$(CONFIG_LINEAR_RANGES_TEST) += test_linear_ranges.o
+
+obj-$(CONFIG_GENERIC_LIB_DEVMEM_IS_ALLOWED) += devmem_is_allowed.o
diff --git a/lib/devmem_is_allowed.c b/lib/devmem_is_allowed.c
new file mode 100644
index 000000000000..c0d67c541849
--- /dev/null
+++ b/lib/devmem_is_allowed.c
@@ -0,0 +1,27 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * A generic version of devmem_is_allowed.
+ *
+ * Based on arch/arm64/mm/mmap.c
+ *
+ * Copyright (C) 2020 Google, Inc.
+ * Copyright (C) 2012 ARM Ltd.
+ */
+
+#include <linux/mm.h>
+#include <linux/ioport.h>
+
+/*
+ * devmem_is_allowed() checks to see if /dev/mem access to a certain address
+ * is valid. The argument is a physical page number.  We mimic x86 here by
+ * disallowing access to system RAM as well as device-exclusive MMIO regions.
+ * This effectively disable read()/write() on /dev/mem.
+ */
+int devmem_is_allowed(unsigned long pfn)
+{
+	if (iomem_is_exclusive(pfn << PAGE_SHIFT))
+		return 0;
+	if (!page_is_ram(pfn))
+		return 1;
+	return 0;
+}
-- 
2.27.0.383.g050319c2ae-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
