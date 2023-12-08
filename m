Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D29C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Kldoqnegt0LOyfW+5dt9uYit+6eQUv25VhmwwiVGKRY=; b=FI1COWFPZkcTFw
	QOYE0GcoPOToE0PSuWHa+qvW1Qq4K/hhxVw+PJ0FOCb+iAAuWnkKq0rXllmNUSeIztxuou6kB5RFu
	qpYBKJJ8453OROO4M3jeWEluLherql5txKZWCH70WqQxKt1v0RlO9Y10U5AwSAl3yWzGat4iNDwgj
	rajxHXeURaM2nCOogOdvrAgL6b2bDABwIKmTFx2FgTp09aiCWmVdjQAxIgtQ7JEBlvJtZ0lkhR3Jp
	axNDtEONV5R0Jm5BmRwY8RCA5fJuSNjXaNUfXJmxIE/045GQ/2Exp/lRo79e1MD1bVw5q/oBhHJv3
	RLYOjN0O8CICcq8RrMhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpm-00EnvA-2k;
	Fri, 08 Dec 2023 05:55:34 +0000
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpS-00EnYj-1H
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:19 +0000
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1d05212a7c5so13052275ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014914; x=1702619714; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YYvZSY93/xrjeeL5ETwAXbtukKNXxCCQ4+T0woOWU40=;
        b=G5Q93xIFpJD7J173VGxTNQpO2GeiRevGG3aj+vPSj5YabG6GtzlW8hMcOdOAIaoPAL
         ydHm8T1Yrbu5jbTWMP0K6F9TBTy1QKBkqr+z/B7MsObiiaGSqrnhasxp1AlLouZypaS/
         85RH2/8Yjci+p6wUpRezSVlemCghv6rX5Lif6ihs/Ahzh3bPYr0SUvs3pAMJgliNIZvv
         AAXH/TmR5EFR1KLVFRT11oObBmFRTAVqnTwn6hPruy5xGeuXb/j1KB3SBmPgAJxUcbmO
         iHtruB5zn40R0aq7d5mClZVDpJI2D59SOpGbTf+54JvIuXAQYqMBoixmCzfOhddp1NNE
         3gRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014914; x=1702619714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YYvZSY93/xrjeeL5ETwAXbtukKNXxCCQ4+T0woOWU40=;
        b=Mwdxot6ATCtD2tUFPU5oarv2DMedXhylI4E5RPw2yEPGTbFENqgoYdxSDhxtBFKJdH
         kx7bFtn6t8HyCk2IL/pmIMMYBAtp4HpP8vlnSyXW1rjHlPIQvwDTf+stXYKkVhHiIaoT
         QbRQWbM/KKwe07q7s+4aQ3x3VHnDgpDCCbRxy8ndg4Ujw8T41r22ZJjoZ+mSIcFpUfDb
         jZJMmfWfSG4uIqRsN7f1OPn3ZFtXUiR1NyscmGH3fpFkIqGL5T3YDlWPDOA46ZS4UTiX
         i0DB9N06el1tMZ5tZmVOeK5vft47yd1QJLEKjbqMkM+mbHR85sRkA84b6q1WNyHokd9z
         9gwQ==
X-Gm-Message-State: AOJu0Yyb7Q7wbNgcdKPCFDNT1yx21GjyNwdFt6UawEE/33UMoNNeXoOq
	eyRUK6tYjmdo3XWwDpVtPRdb3A==
X-Google-Smtp-Source: AGHT+IEX6fsur3fhby/cWKLu/7STh1pjdXEZxMWOcghK1shSxSRPNcFQAcmIt0ejFquarrBp9mMVPA==
X-Received: by 2002:a17:902:e541:b0:1d0:a084:affd with SMTP id n1-20020a170902e54100b001d0a084affdmr3001010plf.73.1702014913936;
        Thu, 07 Dec 2023 21:55:13 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:13 -0800 (PST)
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
Subject: [RFC PATCH 09/12] riscv: Add support for kernel-mode FPU
Date: Thu,  7 Dec 2023 21:54:39 -0800
Message-ID: <20231208055501.2916202-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215514_474833_8042DE5D 
X-CRM114-Status: GOOD (  15.43  )
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

This is motivated by the amdgpu DRM driver, which needs floating-point
code to support recent hardware. That code is not performance-critical,
so only provide a minimal non-preemptible implementation for now.

Use a similar trick as ARM to force placing floating-point code in a
separate translation unit, so it is not possible for compiler-generated
floating-point code to appear outside kernel_fpu_{begin,end}().

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/riscv/Kconfig                  |  1 +
 arch/riscv/Makefile                 |  3 +++
 arch/riscv/include/asm/fpu.h        | 26 ++++++++++++++++++++++++++
 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/kernel_mode_fpu.c | 28 ++++++++++++++++++++++++++++
 5 files changed, 59 insertions(+)
 create mode 100644 arch/riscv/include/asm/fpu.h
 create mode 100644 arch/riscv/kernel/kernel_mode_fpu.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..cf0967928e6d 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,6 +27,7 @@ config RISCV
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_GIGANTIC_PAGE
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if FPU
 	select ARCH_HAS_MMIOWB
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PMEM_API
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..2e719c369210 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -81,6 +81,9 @@ KBUILD_CFLAGS += -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64i
 
 KBUILD_AFLAGS += -march=$(riscv-march-y)
 
+# For C code built with floating-point support, exclude V but keep F and D.
+CC_FLAGS_FPU  := -march=$(shell echo $(riscv-march-y) | sed -E 's/(rv32ima|rv64ima)([^v_]*)v?/\1\2/')
+
 KBUILD_CFLAGS += -mno-save-restore
 KBUILD_CFLAGS += -DCONFIG_PAGE_OFFSET=$(CONFIG_PAGE_OFFSET)
 
diff --git a/arch/riscv/include/asm/fpu.h b/arch/riscv/include/asm/fpu.h
new file mode 100644
index 000000000000..8cd027acc015
--- /dev/null
+++ b/arch/riscv/include/asm/fpu.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_RISCV_FPU_H
+#define _ASM_RISCV_FPU_H
+
+#include <asm/switch_to.h>
+
+#define kernel_fpu_available()	has_fpu()
+
+#ifdef __riscv_f
+
+#define kernel_fpu_begin() \
+	static_assert(false, "floating-point code must use a separate translation unit")
+#define kernel_fpu_end() kernel_fpu_begin()
+
+#else
+
+void kernel_fpu_begin(void);
+void kernel_fpu_end(void);
+
+#endif
+
+#endif /* ! _ASM_RISCV_FPU_H */
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index fee22a3d1b53..662c483e338d 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -62,6 +62,7 @@ obj-$(CONFIG_MMU) += vdso.o vdso/
 
 obj-$(CONFIG_RISCV_MISALIGNED)	+= traps_misaligned.o
 obj-$(CONFIG_FPU)		+= fpu.o
+obj-$(CONFIG_FPU)		+= kernel_mode_fpu.o
 obj-$(CONFIG_RISCV_ISA_V)	+= vector.o
 obj-$(CONFIG_SMP)		+= smpboot.o
 obj-$(CONFIG_SMP)		+= smp.o
diff --git a/arch/riscv/kernel/kernel_mode_fpu.c b/arch/riscv/kernel/kernel_mode_fpu.c
new file mode 100644
index 000000000000..9b2024cc056b
--- /dev/null
+++ b/arch/riscv/kernel/kernel_mode_fpu.c
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: GPL-2.0-or-later
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#include <linux/export.h>
+#include <linux/preempt.h>
+
+#include <asm/csr.h>
+#include <asm/fpu.h>
+#include <asm/processor.h>
+#include <asm/switch_to.h>
+
+void kernel_fpu_begin(void)
+{
+	preempt_disable();
+	fstate_save(current, task_pt_regs(current));
+	csr_set(CSR_SSTATUS, SR_FS);
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_begin);
+
+void kernel_fpu_end(void)
+{
+	csr_clear(CSR_SSTATUS, SR_FS);
+	fstate_restore(current, task_pt_regs(current));
+	preempt_enable();
+}
+EXPORT_SYMBOL_GPL(kernel_fpu_end);
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
