Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64519C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 20:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m9tkO/ZWESrBKzxbquh/8UjqGWTdQ5PX6x/8dVq2ymM=; b=okZ6Xlwxj7pf35
	vR719+lBW0UH/hprtWJ0U2fOfFGs1x/BvDWW22akdGEjIZIUcKcl9I9e2B98AsBT7Mv/eIZozhPVR
	VNTM14FjTIrHZVzyU5jlEpDATynVS7H1D79kY2jFqNEp6T0iN/cO/ijE3GHSEuf3Nf5LmMI5phTXL
	EjLkNLKNlAU3l9gF37lSyoMGuDdLwsLENOXQtsnd6ZDXng45Qcx+3wm08WWRDnYsfK1pq+5FO5eoM
	c+dtHdZDeydR/9tjEie/5BVO/+zrzPw+HW1YqnG9XSbjqKfd7YBObzx7JQXdU7pt7bDuHVyiSqjJ/
	qt4ex3XcHuJKZLaTJEJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTf-0000000AuFX-0JZ4;
	Wed, 27 Mar 2024 20:02:27 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTM-0000000Atyj-21I3
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:10 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-1dff837d674so1880595ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569724; x=1712174524; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7YKNt/WF/wnD0YRJEikw0HuScFyU0745kXYQrNfvXV8=;
        b=GprbohSabvgchMd+FOe/dvV7fBhjiH3ql7xUrPhXY4/anvLqNFu7UxJDxH3Ke8GkHs
         A54JkV8o1U4xNC3spw1nH+q5q0FHPfMqdZOW+Wi9qhoF+akcl/5LppD0oLvalB/lVhsZ
         FgABW5AraZcRH44dYc01JvydNLkSZX1+OkhTEoqoT+syL+jMVD8Elnn+OVpHJ4r6ib3C
         KeMTWU+ws0Q65jT5iIKivwQfq7gBA6cTBksa9Km+f9L7+rRMsqlB9Ohg06/POMJ8zzNd
         TqJp0B0vv0sE0SrobM9XwwQTNscOCxeH8oyyHmMQmDQcVkdGxYrwuvlrADQ5zuggcRDq
         YIHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569724; x=1712174524;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7YKNt/WF/wnD0YRJEikw0HuScFyU0745kXYQrNfvXV8=;
        b=TrEU67ge1ryshgG2xdN3l5sbHDlIGL1X+G+2cN5/6Kp11tqvGy+cx1viZQmH8CQxb+
         qEtwouS7+o20h2BsHXu/f50llYw0cfn8xReZZOvJk+YWnnIKQEAb2yPO0j2FL2iJIp+0
         9K8Uz4RUDQfGqxiJHm73TY7IA9kygr31vJcVXP1nLLE6pqPFZ4azc3W30DTrXeQSLyqH
         fFFZ177NDPnPtQOTO4F1aQxsS0Ao7BZt7O0YAnM5XIistX8h4vAqtdwQ8UAPU6+KE0tT
         JoxQAQbQWGwl7IxgMWkB4r0zgTsKmOas6jB0nngzn+vDQd6UZTriCsVVUTvACgkpD82/
         5I3g==
X-Forwarded-Encrypted: i=1; AJvYcCUUYSeEJTVKe2U3fCpHftM6MazES/5RSGiy8mNPJTKiwSs7ficxzSza5Pivsq3flV4o8QUHXULvLG8kfCW7W9yYXbmj27ZCJRfkkVUmsmfx
X-Gm-Message-State: AOJu0YyqrHDPHm8QOeDVTMZrQBLqo25XMNFbWHZoZEpWkLRW4Ew2DiPD
	EabHv6ik/wP702E5Xp/f+0TIhRHHPjJHtqj8k6Yd4Fn+JcIa7vMSHr2InfcuTTmhshGIq0t6rZN
	m
X-Google-Smtp-Source: AGHT+IFfqF0zaQyhJG4fHFNgO9YCVd9dAMtKWVHSa8WQRo1J9B12INfMAAQOQNi7OQwx6x82eCY8tA==
X-Received: by 2002:a17:903:8c3:b0:1e0:b874:1e5f with SMTP id lk3-20020a17090308c300b001e0b8741e5fmr850196plb.65.1711569724329;
        Wed, 27 Mar 2024 13:02:04 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:03 -0700 (PDT)
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
Subject: [PATCH v3 04/14] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:35 -0700
Message-ID: <20240327200157.1097089-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_130208_734124_814C68B8 
X-CRM114-Status: GOOD (  14.69  )
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
