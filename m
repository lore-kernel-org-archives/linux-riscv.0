Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DB58CD1288
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 07:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CM93jGH0h5XmfTJj2bolxbvWOwYlPbKq/aVtHE7X8VU=; b=MtaBXAyPV8lQgm
	vitXyrLLOxtUZ6Op3sCK0WBN4oTcTjDST2EDEtTN/Y2KZUB8WDAIVuxNJjWWE5bvn2A5yyP6a+Qyz
	rnq8U6AfUvoq38LNtqlRc6sAeJ8Wmfb7na1dHkO3RTJ6xoVokBcfLQ0IybBYKPiyFN9VtiC0nyH/p
	cfIG3ggjQ/vQZvUWc2srQ8PRziEnaSYAguvpsqgiRlGDvbssqDmgMvimY877wvmbLdrwSCBKuwaim
	bgJbIBHEPbUm8Yv8x3Ma7zn7tFwTbZtTcsnAm8cxht2qZs2nau9XoNFmAJl+gmjKb6nEXCfgl2DUl
	yPo/bKmYKqNN0jVSMW9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6c9-0000000H8y5-1w5b;
	Fri, 29 Mar 2024 07:25:25 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bZ-0000000H8YQ-3Hdb
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:24:52 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-6eac64f2205so1527615b3a.2
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697088; x=1712301888; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=ZugzDHWi72bp8dMq8uf7hcbekD7WVZIoSRbr70Hw/XPdrL2rBm0TRvz2oleMasTWli
         H9xVOe1azIHr59bZQhfSyM6fat7SbFMZCyzNFFMk1WIpKp7y6sbJ5myUWsh6NszUauFE
         q83X2SIAUVwicHLO54XORC2vqoNWwReO03lLxMgvK/FIk3oFl28BJU7kab7Y6SLmLOQW
         u75bTI0gyL0+eG+YI78+k1sEysRtwqZVEmOy9cKR02fButWs7tiPqUyI80YYHmCQupOX
         Xiq0kxZ3ac3j0uMmPcG6rJMeB+t+qDKZ+W65WMDuekBi84mcNUBbUjk1CIsDbH9f9CSY
         OGkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697088; x=1712301888;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BaG/5r11zMVVbJK9XMgdhlmzZC0nXZGHxxAlEP5YrDw=;
        b=oAlIEmyl89pz7amzEDI9eE5FooSpV1PER3itq4kbvnwc4Wi1hXErpHOl6sjDpkRrL3
         87nXjVVELtOO1nnRjsGaBbMTqTZ0aHzwR/ISBzONqgF1/09f9fpZx5tslknLOjqu26lc
         bo+zART7uB73acabzmbe1KfCKAcUuCR+Tc1t6il+TNdPhkkPwW6wSXW01c8yvqXPD8uV
         G1z7UzAKNKlC8+BU52ifJ4/aBcrE6tYwJjALXT50KjIvtYh/tR7n/bAyJYZrW2nZmIOE
         Kj1XlaitSH3H6UaFRZWp7ACykRcaAbCY/fd7nCxzCryg00hshrvhPaYkaW9rMpe32wXG
         n7/g==
X-Forwarded-Encrypted: i=1; AJvYcCXuHi5HSoFtBJXMOl6Z4f8wTctN2eGeNKqwmKnNvAXdFIsQFsegJ/hycIG8BgXTklhed+Ulgl4mZXlj0jeiMvrGSEdLkjxUzkoytI0DZAcs
X-Gm-Message-State: AOJu0YzkOLgS4JGqslCOSRuidJkQHs1CskKaU3q8SAOvWAnXDqhBnJ+N
	N0sEidnoYZXDsavotCJH155yjmS/XQF8Jnvp5CiM2AZqZRki97oTmbaiUyxbM20=
X-Google-Smtp-Source: AGHT+IHyYuok2TNfdiOcE/l5igRa3fLGWQKdU9IqGK1Jb+NsKkae7YWqfCeB+c37aWtPbJ/1sA02qQ==
X-Received: by 2002:a05:6a21:6d9f:b0:1a3:55d2:1489 with SMTP id wl31-20020a056a216d9f00b001a355d21489mr1432790pzb.7.1711697088383;
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:48 -0700 (PDT)
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
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v4 04/15] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:19 -0700
Message-ID: <20240329072441.591471-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_002450_154891_6A90A9BF 
X-CRM114-Status: GOOD (  14.60  )
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm64/include/asm/fpu.h

diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
index 7b11c98b3e84..67f0d3b5b7df 100644
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
index 0e075d3c546b..3e863e5b0169 100644
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
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm64/include/asm/fpu.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
