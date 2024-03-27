Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 006CECD1283
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7N0uAWP6S1hZXt5KmcennQk/CpaGR5JE83XnxVSJvkY=; b=2UsVRmLN7UIkpq
	wR1AewLYr/8N2J6G5+haCwEg38wxSfcr0HASnr4gJbD6FBw9N0cRpElZXRXvH+gBaVaGEI3fWfSjd
	Vzy68GJnLzfYsFXUyrxwwU9uRs329Ll+7FhrZsN90680MEqh+80vZt1qDVoGLinzq9Wa9vi89Mz/A
	5ZsqnCayJCCaDQhzUI1n2f+qS4YMAejA0GaLIFzzbRl7nbP9IfrolwdLPp6NCQG1uHohglo4+SfKt
	1l6rLgs1AlN6SRHu6VQc3CLSvlHxI6AYzsGXiSf+YP3xsuBFuu/A0uwUyhtahMfPdSec3DTUOrfGA
	RddPFG1FDT46Th7M7mzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpafL-0000000BBIU-3oge;
	Wed, 27 Mar 2024 21:18:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTc-0000000AuDP-3XWK
	for linux-riscv@bombadil.infradead.org;
	Wed, 27 Mar 2024 20:02:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bM3Hi+5Alr7tzqsz3KXbQamZzAJvK/Ux1AY7aws8WNM=; b=LLAGcoIs4FdL57UaK0OvBj5v6H
	dzJrvMnY2W2xMBOorGLertr4o9LSoIbPH1Qrtag8i2yho+P+r2RzYU7LRtai1L9FZkJHuPX0K59Kd
	WyDPYF9ealodYaK8aY5x7FcInCE+MMCt2aVwhd/YMpB9QAwWf78yK9TBFqEYHmDDAmNLkQZgKAyHt
	lmZ/aKr4CjpX1qDO9Vi9Sg1eG4P1wbKMMAGb+t+GaBZYUhRMMn34UyelILteiVWZXZk/+RQwutNI6
	RxpLzUIO7c1CiraSJY3ZPmyQnuO83mhetEmt9u/Xw+M1I8w6tnmkZ4X8Tqe1Zf25g4RsP32zWcNu5
	3YNm9+tw==;
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by casper.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTV-00000004drY-3cqK
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:23 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1e0f0398553so2230365ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569735; x=1712174535; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bM3Hi+5Alr7tzqsz3KXbQamZzAJvK/Ux1AY7aws8WNM=;
        b=c0Tr1jz6pD+05G33eYCqoDyEeFR5V6ijP8roRvF3jZRZKm9Ere1OYjdJVjzFP2UEkT
         ZZVdY43ys172TqCktKquCZrRnD0/xvyGIVmwYaQsFVDgAvFCWOZ40ETL7uI8UqJHiQZc
         2BuwXsnaVy9VGc1mYRBxo36u/ljpdYKhJDL0FfTd1DOQPRXyQuhSt7J/WTsGI0wC148i
         9UJe7OpqCyFB6MSwDt+7llJUAT41+7C9ILt16IODWtHYpqKGnjRPVAonpNI8AJwiBdvk
         IYonwECkIpl9ZRHv+IFBmrPEg8D5owGwnZywL3lxDp0JbVmA216Vok0NjpXhD1z39c24
         LKHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569735; x=1712174535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bM3Hi+5Alr7tzqsz3KXbQamZzAJvK/Ux1AY7aws8WNM=;
        b=nOKfIDuNicNPOgh4QXtbZqc++F/YJh7orsmVYY/ltI5O82p4l5OlT2Wl2BSq319KPV
         Y6v5TkfhhSbaYEAtISKi5/k6ikjc/1GenZODm74YXk238wfEJCDa2atQL+ltROvw7pfx
         82vUVTRRbWztvKbhsrv1c9FPMCm9sapgY3p59bWRRVYWh8vZVEkd9DWtr60S1mL0zA9b
         hsZAIfpG1UsZUERH+w+d0yzeAN/DUqHH+j13YwBNSkFv0TLbKjkxuNgr9rZk8Drhu4lF
         /2FmwGzgI8sFnJlBWx0vWMKQaZzQRHaqhZWMVjSva8J3yEYgG6zJLHRWilgLzzau4cDo
         5LUw==
X-Forwarded-Encrypted: i=1; AJvYcCUFmgsNmV2r3hoQRHbN8DKgVX5WCygtClwan9RFYJk/pTsKxh+KtOv4G3AVHHTQsUwkJUYCZk5QEdz7FetsCBLeSGFpk2IFuL1vQmulzuG7
X-Gm-Message-State: AOJu0Yy0JLmF5vPZNSwzQpqkynIpXW/t+50VhXYjEupNHzAlODCaq+sD
	JQ2Qksx2o501BddMBQtacw7/KZJXDoeg0ZPHGWNS8DlzUih6T2aVEGmj7u1Tf64=
X-Google-Smtp-Source: AGHT+IFj0bwxlMv24MtX2R4pKVUBPTEZabeDrpj2jWHiUrD8cnm8OWyltVVZB2eEjF0aA2RcWrF1Pw==
X-Received: by 2002:a17:902:e5c1:b0:1e0:c91d:4487 with SMTP id u1-20020a170902e5c100b001e0c91d4487mr958029plf.43.1711569735358;
        Wed, 27 Mar 2024 13:02:15 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:14 -0700 (PDT)
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
	Alex Deucher <alexander.deucher@amd.com>
Subject: [PATCH v3 12/14] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:43 -0700
Message-ID: <20240327200157.1097089-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_200217_970668_3869F30A 
X-CRM114-Status: GOOD (  14.29  )
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

Now that all previously-supported architectures select
ARCH_HAS_KERNEL_FPU_SUPPORT, this code can depend on that symbol instead
of the existing list of architectures. It can also take advantage of the
common kernel-mode FPU API and method of adjusting CFLAGS.

Acked-by: Alex Deucher <alexander.deucher@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Split altivec removal to a separate patch
 - Use linux/fpu.h instead of asm/fpu.h in consumers

 drivers/gpu/drm/amd/display/Kconfig           |  2 +-
 .../gpu/drm/amd/display/amdgpu_dm/dc_fpu.c    | 27 ++------------
 drivers/gpu/drm/amd/display/dc/dml/Makefile   | 36 ++-----------------
 drivers/gpu/drm/amd/display/dc/dml2/Makefile  | 36 ++-----------------
 4 files changed, 7 insertions(+), 94 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/Kconfig b/drivers/gpu/drm/amd/display/Kconfig
index 901d1961b739..5fcd4f778dc3 100644
--- a/drivers/gpu/drm/amd/display/Kconfig
+++ b/drivers/gpu/drm/amd/display/Kconfig
@@ -8,7 +8,7 @@ config DRM_AMD_DC
 	depends on BROKEN || !CC_IS_CLANG || ARM64 || RISCV || SPARC64 || X86_64
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	# !CC_IS_CLANG: https://github.com/ClangBuiltLinux/linux/issues/1752
-	select DRM_AMD_DC_FP if (X86 || LOONGARCH || (PPC64 && ALTIVEC) || (ARM64 && KERNEL_MODE_NEON && !CC_IS_CLANG))
+	select DRM_AMD_DC_FP if ARCH_HAS_KERNEL_FPU_SUPPORT && (!ARM64 || !CC_IS_CLANG)
 	help
 	  Choose this option if you want to use the new display engine
 	  support for AMDGPU. This adds required support for Vega and
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
index 0de16796466b..e46f8ce41d87 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/dc_fpu.c
@@ -26,16 +26,7 @@
 
 #include "dc_trace.h"
 
-#if defined(CONFIG_X86)
-#include <asm/fpu/api.h>
-#elif defined(CONFIG_PPC64)
-#include <asm/switch_to.h>
-#include <asm/cputable.h>
-#elif defined(CONFIG_ARM64)
-#include <asm/neon.h>
-#elif defined(CONFIG_LOONGARCH)
-#include <asm/fpu.h>
-#endif
+#include <linux/fpu.h>
 
 /**
  * DOC: DC FPU manipulation overview
@@ -87,16 +78,9 @@ void dc_fpu_begin(const char *function_name, const int line)
 	WARN_ON_ONCE(!in_task());
 	preempt_disable();
 	depth = __this_cpu_inc_return(fpu_recursion_depth);
-
 	if (depth == 1) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
+		BUG_ON(!kernel_fpu_available());
 		kernel_fpu_begin();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			enable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_begin();
-#endif
 	}
 
 	TRACE_DCN_FPU(true, function_name, line, depth);
@@ -118,14 +102,7 @@ void dc_fpu_end(const char *function_name, const int line)
 
 	depth = __this_cpu_dec_return(fpu_recursion_depth);
 	if (depth == 0) {
-#if defined(CONFIG_X86) || defined(CONFIG_LOONGARCH)
 		kernel_fpu_end();
-#elif defined(CONFIG_PPC64)
-		if (!cpu_has_feature(CPU_FTR_FPU_UNAVAILABLE))
-			disable_kernel_fp();
-#elif defined(CONFIG_ARM64)
-		kernel_neon_end();
-#endif
 	} else {
 		WARN_ON_ONCE(depth < 0);
 	}
diff --git a/drivers/gpu/drm/amd/display/dc/dml/Makefile b/drivers/gpu/drm/amd/display/dc/dml/Makefile
index 59d3972341d2..a94b6d546cd1 100644
--- a/drivers/gpu/drm/amd/display/dc/dml/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml/Makefile
@@ -25,40 +25,8 @@
 # It provides the general basic services required by other DAL
 # subcomponents.
 
-ifdef CONFIG_X86
-dml_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml_ccflags := $(dml_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml_ccflags := -mfpu=64
-dml_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifneq ($(call gcc-min-version, 70100),y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml_ccflags += -mpreferred-stack-boundary=4
-else
-dml_ccflags += -msse2
-endif
-endif
+dml_ccflags := $(CC_FLAGS_FPU)
+dml_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
diff --git a/drivers/gpu/drm/amd/display/dc/dml2/Makefile b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
index 7b51364084b5..4f6c804a26ad 100644
--- a/drivers/gpu/drm/amd/display/dc/dml2/Makefile
+++ b/drivers/gpu/drm/amd/display/dc/dml2/Makefile
@@ -24,40 +24,8 @@
 #
 # Makefile for dml2.
 
-ifdef CONFIG_X86
-dml2_ccflags-$(CONFIG_CC_IS_GCC) := -mhard-float
-dml2_ccflags := $(dml2_ccflags-y) -msse
-endif
-
-ifdef CONFIG_PPC64
-dml2_ccflags := -mhard-float
-endif
-
-ifdef CONFIG_ARM64
-dml2_rcflags := -mgeneral-regs-only
-endif
-
-ifdef CONFIG_LOONGARCH
-dml2_ccflags := -mfpu=64
-dml2_rcflags := -msoft-float
-endif
-
-ifdef CONFIG_CC_IS_GCC
-ifeq ($(call cc-ifversion, -lt, 0701, y), y)
-IS_OLD_GCC = 1
-endif
-endif
-
-ifdef CONFIG_X86
-ifdef IS_OLD_GCC
-# Stack alignment mismatch, proceed with caution.
-# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
-# (8B stack alignment).
-dml2_ccflags += -mpreferred-stack-boundary=4
-else
-dml2_ccflags += -msse2
-endif
-endif
+dml2_ccflags := $(CC_FLAGS_FPU)
+dml2_rcflags := $(CC_FLAGS_NO_FPU)
 
 ifneq ($(CONFIG_FRAME_WARN),0)
 ifeq ($(filter y,$(CONFIG_KASAN)$(CONFIG_KCSAN)),y)
-- 
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
