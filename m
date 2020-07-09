Return-Path: <SRS0=n+Lk=AU=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1279AC433E3
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:35 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0384207DF
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2020 20:08:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iidjQ6kR";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="QIHl7zMI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D0384207DF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:To:From:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=RbenvoeQd1N53TBHq4F73fpXhoiOG5jSenVs3wExg3w=; b=iidjQ6kRm2SchP+kRDGnzumHV
	SH/NbfyCb1r3fgUIAVldajnOvZ+/Lg09z0AqrVGEY+fkyX6c6IURiIA5m2qgSEa25nT+Gdu1U6IeT
	lr0yU45drby8K5mhP9lyFc4sODJRN97ynu0uhIqQL6r+OS+STxNxD9U2pBmmJ5MPNm7o8JhXwNKsa
	7tzFIhB7LwL2wCwlZEjPAyGoAqZzwnOepmL+ijm6arIxatvW9wFIlPi5QtW36LTJPY1aHu1jOEyaP
	tEoJkQvpqcDJQieIRYHUwHYeKDR1Nj7ptpFogy22pVbSC3TDBGJCL8uHDBAQ+aiySfFIzSwVWvIQj
	XKG6cmH6Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jtcqG-00042k-Cu; Thu, 09 Jul 2020 20:08:24 +0000
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jtcq7-0003uD-Sp
 for linux-riscv@lists.infradead.org; Thu, 09 Jul 2020 20:08:21 +0000
Received: by mail-pj1-x1041.google.com with SMTP id cv18so3666968pjb.1
 for <linux-riscv@lists.infradead.org>; Thu, 09 Jul 2020 13:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding:cc:from:to;
 bh=IQHnIdNal54sm3+jz3EltBqGOpDb3rbWGPv97/p+Pks=;
 b=QIHl7zMIw3dGasAbWEpkiyTYrYO/wW+l27wwB2XS1xUbnpHgx9zs6JtenqDqkpFTuq
 eCkf3uIP50+24+GxlZMW2r/IL4C8lmNDNgpgQHKbEYpia+1x2q4JN22cCh/q8nXMXf0c
 bfBKLWiVEqeplwEg2MJFhCy+LGqQxDsSaGtdlvfSZQLOoHU/T57UWg358fw2aWi+k2PR
 AfBBxfay/L20rPj575Em3qZoddhy8cgVjGtIDXokMV8CYV+3PVPSVQ1O13LYohVu3Q+1
 xw1fGKsO5788ubA6PWyHLy4K+K1g36JOri9y/1vX4o+bBywOQVgLBRxlb3/hcPTuAmlt
 U2hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding:cc:from:to;
 bh=IQHnIdNal54sm3+jz3EltBqGOpDb3rbWGPv97/p+Pks=;
 b=ouPLQzCyhyTaD02I+K60QU/pVWVTVXN2z5bj6NVM8XZmmx+AWL1vjB+Wird96tpYDx
 MJkJd70oefgH4r02nGLhcBfVBglJnEYd/QiVDinZc2R/KwS/BSEOARv4e070Wf6g6pJz
 P/sMHr3fkUlE3JYawFpu1aLDyDBun8alRrTjVKxOfg3sU0bh3+SNosJLMhamq/CFYkbj
 aZBInBT/hD9PI110WW3eL1UTl43HwMjY8a25DYTDaM5kRkSzk7oVtk4RCvMjr6tACTOX
 WhrRu2AYxCo/GiBMY5BOSzuweq7wh5J7gw5BeHhCTxPTprsuOAKStZbmy37esxM2Jd/z
 GKhQ==
X-Gm-Message-State: AOAM532GhcRXd67zxzMejXX+re1KUli6iiKKF8cTHl1c48i0oJSXc0PI
 psDubI6gV408kTjQB297KCeABg==
X-Google-Smtp-Source: ABdhPJwd1DAa2K1UIdVt7iL6iamwAYF1TNfLnv3LuSla0FowJ3LMBrvCDu1SaUFZ2GKjnTk7/YE82w==
X-Received: by 2002:a17:902:c405:: with SMTP id
 k5mr40035169plk.233.1594325293632; 
 Thu, 09 Jul 2020 13:08:13 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id m3sm4030032pfk.171.2020.07.09.13.08.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jul 2020 13:08:13 -0700 (PDT)
Subject: [PATCH 1/5] lib: Add a generic version of devmem_is_allowed()
Date: Thu,  9 Jul 2020 13:05:48 -0700
Message-Id: <20200709200552.1910298-2-palmer@dabbelt.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
In-Reply-To: <20200709200552.1910298-1-palmer@dabbelt.com>
References: <20200709200552.1910298-1-palmer@dabbelt.com>
MIME-Version: 1.0
From: Palmer Dabbelt <palmer@dabbelt.com>
To: linux-riscv@lists.infradead.org, zong.li@sifive.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200709_160816_006679_9DCF138D 
X-CRM114-Status: GOOD (  19.77  )
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
Cc: mark.rutland@arm.com, steve@sk2.org, davidgow@google.com, ardb@kernel.org,
 catalin.marinas@arm.com, linus.walleij@linaro.org,
 Palmer Dabbelt <palmerdabbelt@google.com>, elver@google.com, glider@google.com,
 willy@infradead.org, mchehab+samsung@kernel.org,
 linux-riscv@lists.infradead.org, alex.shi@linux.alibaba.com, will@kernel.org,
 dan.j.williams@intel.com, linux-arch@vger.kernel.org, uwe@kleine-koenig.org,
 alex@ghiti.fr, takahiro.akashi@linaro.org, paulmck@kernel.org,
 masahiroy@kernel.org, linux@armlinux.org.uk, krzk@kernel.org,
 rppt@linux.ibm.com, bgolaszewski@baylibre.com, james.morse@arm.com,
 kernel-team@android.com, pmladek@suse.com, zaslonko@linux.ibm.com,
 aou@eecs.berkeley.edu, keescook@chromium.org, Arnd Bergmann <arnd@arndb.de>,
 rostedt@goodmis.org, broonie@kernel.org, matti.vaittinen@fi.rohmeurope.com,
 gregory.0xf0@gmail.com, Paul Walmsley <paul.walmsley@sifive.com>,
 tglx@linutronix.de, andriy.shevchenko@linux.intel.com, gxt@pku.edu.cn,
 linux-arm-kernel@lists.infradead.org, rdunlap@infradead.org,
 Nick Desaulniers <ndesaulniers@google.com>, linux-kernel@vger.kernel.org,
 mcgrof@kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, mhiramat@kernel.org,
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
 lib/Kconfig              |  4 ++++
 lib/Makefile             |  2 ++
 lib/devmem_is_allowed.c  | 27 +++++++++++++++++++++++++++
 4 files changed, 37 insertions(+)
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
index df3f3da95990..3b1b6481e073 100644
--- a/lib/Kconfig
+++ b/lib/Kconfig
@@ -676,3 +676,7 @@ config GENERIC_LIB_CMPDI2
 
 config GENERIC_LIB_UCMPDI2
 	bool
+
+config GENERIC_LIB_DEVMEM_IS_ALLOWED
+	bool
+	select ARCH_HAS_DEVMEM_IS_ALLOWED
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
