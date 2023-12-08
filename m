Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23BF6C10F09
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=O2u6igZCQx3yHYIJK77PTM+vv/vx6sY/mMhbqyMZq+Q=; b=HmTA4YDbl/utUJ
	Tz23XQnUl6IA/wHRYbjR26f8Bssfg8K/GAEDmPin9GQC/3ZNWuKtqGjwlIkOkYCwJeh7xuOJY4Uyt
	vXFvl+fzubwRVE5pGPBpJhlB6knf/qf+SYAHkQOrCyP28sdqWr+rl/OKQ+EkDM2hO4DOmLAMA+hKv
	LfCXlaghstnI6yDj3Vf9E6UxPrr0oxL3GMmbTOc0Z1IzdDup2WqunC8M6SilHtIWH59shldTO8jJU
	dxTEfi/MlYN6LTQQ35JooUQDJdTiCA4jIPfhYCrgtrFlmYuyxoYQ1TH/cvr7UpmA4iNpNIj2amrUh
	9m/W60F95MNJ7/IjFVOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpc-00Eniv-0A;
	Fri, 08 Dec 2023 05:55:24 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpM-00EnQV-34
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:11 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ce28faa92dso12880055ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014908; x=1702619708; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y10I6kBvaoBdzCYCMFFIBpivZ4OdHpoiZkoWcSRPSMo=;
        b=ihAzJkk1CpMOsE8CwCCHPo6ViaiJB4JJcWi8p8hMefoECJPC+TzA/x1aPFN0CC82yl
         qtXmvgdUZxgAlP4AC00vPtWdyLsoJjOIXsebFXmxVaJoRmoZTybBArDYvT+Bc7HkeogE
         JJFX+thnd/89OCp7ZbDBXMf1QUcD/wSP5PSU4eU07pODSJqCodrwY0Jp9LPWlDBBtol1
         MeTG8QnCGYQiWTYiiOjrhxw6Sd2dL/Si0eEw4kN9dvzAF6h9OHJKfpzy9CXagRRJ+EuC
         1iQXoKhs8O8QXADOLlUHDysxv8sOw55jyc7pqFZScVlEER7BMd/QZU0dR8Iyya8IB9CY
         PGBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014908; x=1702619708;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=y10I6kBvaoBdzCYCMFFIBpivZ4OdHpoiZkoWcSRPSMo=;
        b=JobOw+RRhXgYGZ5uFTU4XfRjwT+RzNj8wNh/rANKlPgaPcxdud5gJJTDKWVR0Gx1th
         dimNI9ORagsmnWuiolovQ3RwbFpVqAl43DCMVwTa859qnSJxWxbJtGwvXZP6wy2zH6GM
         KLr6QEVHz0rUac2+cF6BGFhr3wF7hVhfJTVJGNml79cAMGZyq4aLECDciwI4aAE+sV0S
         pWDwiUv6Q0q39YQV/49gvbGlJelI+GbRY16Yg+c6A2FU+rLDGCBynADm+56YQprpGbvp
         dVj2+4wrOPlE346TQeb4Gc0jly4lIcKjanWAqZN6Yh169PZ8zhtngq1KCuWQih9q6JNr
         yWnw==
X-Gm-Message-State: AOJu0YwhjFq4V3UwpoZOiuzPHseJ/G40Tmyrdlh934CDCcJAGiqgaqKx
	cPYg8jjvqIav0rHld0ys6fFGow==
X-Google-Smtp-Source: AGHT+IEV61WWeWMu7V3217Zpahk/hLH31IwX3YH3+NDaZQD5K6JU/sf2eERQjPEIU9FeQqZ//wlz9w==
X-Received: by 2002:a17:903:983:b0:1d0:bba1:57c1 with SMTP id mb3-20020a170903098300b001d0bba157c1mr3658032plb.78.1702014907827;
        Thu, 07 Dec 2023 21:55:07 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:07 -0800 (PST)
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
Subject: [RFC PATCH 04/12] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:34 -0800
Message-ID: <20231208055501.2916202-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215508_989771_2EEC430E 
X-CRM114-Status: GOOD (  12.84  )
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

arm64 provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 17 +++++++++++++++++
 3 files changed, 26 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b071a00425d..485ac389ac11 100644
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -30,6 +30,7 @@ config ARM64
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
index 9a2d3723cd0f..4a65f24c7998 100644
--- a/arch/arm64/Makefile
+++ b/arch/arm64/Makefile
@@ -36,7 +36,14 @@ ifeq ($(CONFIG_BROKEN_GAS_INST),y)
 $(warning Detected assembler with broken .inst; disassembly will be unreliable)
 endif
 
-KBUILD_CFLAGS	+= -mgeneral-regs-only	\
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_NO_FPU	:= -mgeneral-regs-only
+
+KBUILD_CFLAGS	+= $(CC_FLAGS_NO_FPU) \
 		   $(compat_vdso) $(cc_has_k_constraint)
 KBUILD_CFLAGS	+= $(call cc-disable-warning, psabi)
 KBUILD_AFLAGS	+= $(compat_vdso)
diff --git a/arch/arm64/include/asm/fpu.h b/arch/arm64/include/asm/fpu.h
new file mode 100644
index 000000000000..664c0a192ab1
--- /dev/null
+++ b/arch/arm64/include/asm/fpu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * linux/arch/arm64/include/asm/fpu.h
+ *
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef __ASM_FPU_H
+#define __ASM_FPU_H
+
+#include <asm/neon.h>
+
+#define kernel_fpu_available()	cpu_has_neon()
+#define kernel_fpu_begin()	kernel_neon_begin()
+#define kernel_fpu_end()	kernel_neon_end()
+
+#endif /* ! __ASM_FPU_H */
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
