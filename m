Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D2FDC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:02:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rFYPceOYWxI9YLje9KWVwqNZYkF/MiZLYpSNuxkroyQ=; b=IA0PL4yvcCHn85
	PTPeu7Nao9EqqBVy/TKt1yFxIlf4RwHqnEQ7i/XTaHzvkF1CgOEVqZuCReeciBYo/z8lNZiy6RHKV
	E1fQl3SbsxpGKW8LGi3ZWzZBHT8MwaFriV9aeSo7qwZnqQJ8QYuPzNd3ZED1J2hUPt9FqD70zsrN9
	bjrNem1/pMd+lSaQmiLlhHEu4NuxOMaFchLyOlnzYUWrucRKUayqHTxckHKaXIbAO1hOLVF09MOQT
	X4JIFQAJHcjwrKA8YJxmombd+wP5LrcEHZaCGnU8Rlnzy3TWoqnA2b3a9hir1Ztqfg6lCJda9rY7N
	MkmMQWT6qfpnAejOx9+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZU1-0000000AuSv-0sRK;
	Wed, 27 Mar 2024 20:02:49 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTO-0000000Au2w-0acN
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:14 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0511a4383so2188895ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569729; x=1712174529; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m88RK+Z/il7UccpWfFZJ13Lz8O1oGIqhXeprohKD33g=;
        b=FekRvyettbsSu2/ywpxT75sDgBSfTPaVHuovDO6Or+coKxJwJWm9E3S8mROINkQxdV
         M+Q7+4uA2IopB5g1P4s3PO9gmvQChdo2VrZmZMyRD3OxFBW2PO0sp5Y7h8O366bgPWNd
         ympZi2xAUSF/Ns15AMCDRKXP3Cn4tj4vXElxbcJglTr0jfpqIgbGcbaa98/VWjLBinvb
         QhbvdtwXK4aqq3A1EU4TG7UD3s2t9WfCz5t5XFFt4dUzRF5hCYDGZZIrTfs+6TZwN0/S
         NL7BiccjDk5j1uQn0K79dcOrW37zIkHpqc7JSMnbavZkI9yD3Rekm+NPHWZrQcVhSr25
         i4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569729; x=1712174529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=m88RK+Z/il7UccpWfFZJ13Lz8O1oGIqhXeprohKD33g=;
        b=QxPShAiA/xDBon0Jmi7orsJPrbWRBrUiZ/2UKsOkq3cSJgy8wsDLnBBnw/i49YWTM+
         IRlNno7ANTynKnS877GsU0ueNCjStTZoxxS3EgXBZEd1ixCUtugov1Zx3u56f2h/ry/K
         27i59iw81tQ9ZT5K06HQ4LJiVdkyTtWHFuVeelsF6mfN6sXeOsPz+VwcltlXDlgy17ns
         UBGqbrRzVqP1R/yIl7nESC0T8p8SsKkyKgatzcwN2LGz7PzColQ0TTLv6kV1LFPWbLqi
         2Acadx+Hq2c8IzMSui5MzbDo4IChNnun2LKAzFtNlzsFBxs/sOYw+9JvGdd207CMDIdW
         Hegw==
X-Forwarded-Encrypted: i=1; AJvYcCVuYgYErqst/fuTkI5NkPSMsLq8FRKi7FxAL+zkqu2CpBu6Pu2/VAJNXMpnLk1BZJM609G6UGHH6YvO9JnWPb7REn6ZGFXaWFfaUYcEFP+c
X-Gm-Message-State: AOJu0YyOPsq1Q6sp2U6DyYeK9Kh7ZL7vf+znQUVIN3WedDEHZ2V1kC5q
	VwNstaRgLxrW5JRb8/ZcV+m5r3IEGxC2bXdfo+BJH0u1hSJHMjQuerHTUcpk1cU=
X-Google-Smtp-Source: AGHT+IH0VAZKrv/13SGM5UcmUSkWC7Cq+3cYLh6cyOWJKLLcWVjV8z3mPcOJjmVufYLvLYoh5WS5fQ==
X-Received: by 2002:a17:903:245:b0:1e0:e70:4264 with SMTP id j5-20020a170903024500b001e00e704264mr785470plh.33.1711569729552;
        Wed, 27 Mar 2024 13:02:09 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:09 -0700 (PDT)
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
	Samuel Holland <samuel.holland@sifive.com>,
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v3 08/14] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:39 -0700
Message-ID: <20240327200157.1097089-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_130210_335317_28522B27 
X-CRM114-Status: GOOD (  14.18  )
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

PowerPC provides an equivalent to the common kernel-mode FPU API, but in
a different header and using different function names. The PowerPC API
also requires a non-preemptible context. Add a wrapper header, and
export the CFLAGS adjustments.

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/Makefile          |  5 ++++-
 arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/fpu.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..c42a57b6839d 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -137,6 +137,7 @@ config PPC
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_HUGEPD			if HUGETLB_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT	if PPC_FPU
 	select ARCH_HAS_MEMBARRIER_CALLBACKS
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_MEMREMAP_COMPAT_ALIGN	if PPC_64S_HASH_MMU
diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
index 65261cbe5bfd..93d89f055b70 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -153,6 +153,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
@@ -174,7 +177,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
 KBUILD_AFLAGS	+= $(AFLAGS-y)
-KBUILD_CFLAGS	+= $(call cc-option,-msoft-float)
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU)
 KBUILD_CFLAGS	+= $(CFLAGS-y)
 CPP		= $(CC) -E $(KBUILD_CFLAGS)
 
diff --git a/arch/powerpc/include/asm/fpu.h b/arch/powerpc/include/asm/fpu.h
new file mode 100644
index 000000000000..ca584e4bc40f
--- /dev/null
+++ b/arch/powerpc/include/asm/fpu.h
@@ -0,0 +1,28 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_POWERPC_FPU_H
+#define _ASM_POWERPC_FPU_H
+
+#include <linux/preempt.h>
+
+#include <asm/cpu_has_feature.h>
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	(!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
+
+static inline void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	enable_kernel_fp();
+}
+
+static inline void kernel_fpu_end(void)
+{
+	disable_kernel_fp();
+	preempt_enable();
+}
+
+#endif /* ! _ASM_POWERPC_FPU_H */
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
