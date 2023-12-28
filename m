Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7FBDC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 04:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YLWRVHe08Yg+lAVDeD0KZ6fYPYwDo3jL3UU3DHwOQ5s=; b=rTfWGtlsKwqgpA
	rk+nti50dffJmU4ktcZon3JpL87quR+WPWYlX/4ex+uBFfVjB4a4O/O0W+ApcjhDSAhJRI6jqEvdA
	Ufn81FeYC+k1mCOBf2hTREBZ0CoU/gxhxii+2uCRwqypDqmeyuoI8CDqgjBRV/OMLmoF56UWdQq7u
	dNs3VEIfrSGJE4Z1m99Nm8YaOGmR1PHF1exzZSHIBmodBfrEafO1KI8x+oNIJ4IH7sQ5tkfZvbAmt
	XUIZWLk4N6v8L0Jxc6uoPRR7J+ZjLStgUhfm97UvX1ihBAMVzAK3xOBhtpBX8xJtokJeLiWbx8NXy
	RZV7Uk4GxLYysWtp+M2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIhZd-00G4a5-0s;
	Thu, 28 Dec 2023 04:00:45 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPz-00FruL-28
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:44 +0000
Received: by mail-pf1-x42e.google.com with SMTP id d2e1a72fcca58-6d9af1f12d5so2545808b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727758; x=1704332558; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C2MND6WwIohPzgleMTaIy0ci/VPA95sqr1KaUSNr79k=;
        b=DJpcFVGjswsCSgoSDOPkOsmE/zIdxhLZai1PF06W6h9okoxJxhIjfVouzE1BvTDPpG
         rrLgGZbkL7YJSLs3TIk99BtcSQPuq63unZUzfU6U5kUSzTK17z2Waho2BjnIlRjEVpAD
         5kQnH4eTVAcZD+WWben71kLehKx0ipxRpHFG5T2gkiPLeVtTkXRuLqH+h7szZHhk+TeU
         nrgkiytOpHyctZzdona15Va8BzB5TWmgzjKjjkPVqg+whMbyhRXhbsf70pVd4S891cfT
         lAZ5BCwJBuzj7HREM4LGl+o76zXaBnmgnajyLtPGmqYZDxEMDhT4BHcSs+tNls6v4XYV
         mCWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727758; x=1704332558;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C2MND6WwIohPzgleMTaIy0ci/VPA95sqr1KaUSNr79k=;
        b=FxiAkkDuY5yksTeV0ojc1AGYh2MDG5/b2b6II9NGtPfLoezC7OF4F3gqUG9OXPVmn7
         MHOOxaoTYHzA6n07o+qjZX+E+5oNyVuTIqowiwEbdPWk+i89R5OLDtS3SEnqcJfkNvV0
         WuQv1zexY3GUyVSkSPeLkfUGX9DsF3I48oZfZd3d1RhIS6etUf0h+aZloeNNhpZCgLc2
         +9HMhA8nMzqLxxbikZozwTbzUXm0cRS0i2uinngRjVn2QyU8Rh6OzLcllhRu5Dqb0eiK
         fV4T/vqHcRRvV4XbwGaZHWepXGP0s42WA+vRAffRf8wUnpOLJJYSaKYdtNANSq59zyCQ
         Wtxg==
X-Gm-Message-State: AOJu0YwYUvpuXplbcRtcAtih2rRU5OufPAjxsfwAT8+++e4w6cwNVqjc
	Oe0L7HP46+KKnBZrKNtKUtjsYK38D/2dKw==
X-Google-Smtp-Source: AGHT+IH4D4FaW8lrpY0h3DIECH6biPm9X1kKWi/cQ/HZeBKv8oGcxXHDhKYBxQb0RNGiiNPH0EgWyA==
X-Received: by 2002:a05:6a20:7fa9:b0:195:105d:f40f with SMTP id d41-20020a056a207fa900b00195105df40fmr11064267pzj.81.1703727758078;
        Wed, 27 Dec 2023 17:42:38 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:37 -0800 (PST)
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
Subject: [PATCH v2 12/14] drm/amd/display: Use ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:42:02 -0800
Message-ID: <20231228014220.3562640-13-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174239_723845_2E857636 
X-CRM114-Status: GOOD (  12.91  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

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
index 554c39024a40..be15d366b786 100644
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
