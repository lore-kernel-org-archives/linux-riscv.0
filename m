Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FF86C46CD4
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9zGI6GXLue/Boj1hO+3GLqFs5IamccTnsTs08E2+pm0=; b=iHKlzoZrMEGPci
	tr4bovnhzbjPVLRFbvydCKoL7fhDe31DzyA9WE1v9aukqZzdGQnkqAEJzZhbPKBrrx7NduaX+O9Rb
	0o4CPn1ho4tHeX+StdFR9goWmcSuAE1WawHxqY7jpE6l9SA8QRy2mTv0R8pd6ZoU9ps7KEs2PRY3D
	2b0cf7EqQDU70+caD4Mx8YaFWcs8+1woCZYqMgVJCi2cZxUuDHZ5igUtP6AWB2WNyus/P/HquF6pi
	BeD3j6ssmTuLmsMj26jAxZ9X6+PfeAjXpSP2jpds7EfiIHxzaGabLX31FSJbdfytdpCEVIVb58DKp
	9SuP3Xk3k4GiTQkYqbPg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ8-00Fs3q-0u;
	Thu, 28 Dec 2023 01:42:48 +0000
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPm-00Frix-0r
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:28 +0000
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-6da16ec9be4so289625b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727745; x=1704332545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xuiZ+dA63qa6KuTRM/9EMSF12UiDXQURMhZ59hCd4g8=;
        b=i0ZJrEcWVZ2b9s/k/IDsBo+7cIOn5R+cQDjkZ0Qfm/Qw0xGZKjDjlK3ls5nTzePgJ/
         uX5bkfEAWuQK7BPtK2B2SXIbk4l1A9jSYk3ePfHSOPvsyZ4iBEoU2a9RVMMsWOEaBXeF
         jlVnm4kHsTOl+GiAu2FNhGHnWF1ultowha33N1ZCHYa9VA9vfeUOVqFNUXwyfgoV3Qp3
         653f7FOQRx+fTv59jZAQLYXydAKUGxe1Iekh1t9rrF0EJaf8Dz53F5NG7LUJwIP9Gj1n
         ZIIXg3xoyRZvAEgoBnJjk+r/UlnSxJSB3J8Yoqq0ge1eFLLlhYbfiKUBHavh+4CGDWOr
         1OQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727745; x=1704332545;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xuiZ+dA63qa6KuTRM/9EMSF12UiDXQURMhZ59hCd4g8=;
        b=dbPxynoGtf8r8mZEPA1ltdzNLneyW94btYdL79tGW2SQOOVpZt3oXtUp5bop1JQUCT
         YMu8KAER30EjBJXbRXehtHeY+frMJcFT6OOgOvCCyNdkMwTlOzYyEI+y+5/+qlN84n+t
         2evxQOTsN1nSsdohinvccjmXaLCbeMW7tdYm24rlUzhHLvQwW70L2kb1WgXW2y95Lmq+
         f78QjJKiVG/Tk5OqsaC6cH2lgGo30vW3qyrDt0Zy3vqo98eIdb2HzviM5wB7zWP4qnQx
         7MXHsDVzPDRn8ZAAfcTBpOTsY70Ha4sUvZpgIiaohD9b3tOuYKifpLlSA0AAJGYrBbIw
         tKDA==
X-Gm-Message-State: AOJu0YywnwUdQ6vplzus/wRi3kx3xBcN8q4k3PBNaLXsqyFCpBl1/jUh
	SyM3Iv+H8K5ROlxa3qHbkzDhvUebGYKtZA==
X-Google-Smtp-Source: AGHT+IEILlR72JmnZxJTq7QER4Rq98IUb8qZ6aLblKynPh8gjQmZYjrM9YnZu6dduDjff4jpI/ud3w==
X-Received: by 2002:aa7:9142:0:b0:6d9:cbb1:7818 with SMTP id 2-20020aa79142000000b006d9cbb17818mr4021989pfi.20.1703727745150;
        Wed, 27 Dec 2023 17:42:25 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:24 -0800 (PST)
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
Subject: [PATCH v2 02/14] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:52 -0800
Message-ID: <20231228014220.3562640-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174226_346569_49710186 
X-CRM114-Status: GOOD (  14.06  )
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

ARM provides an equivalent to the common kernel-mode FPU API, but in a
different header and using different function names. Add a wrapper
header, and export CFLAGS adjustments as found in lib/raid6/Makefile.

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

Changes in v2:
 - Remove file name from header comment

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm/include/asm/fpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index f8567e95f98b..92e21a4a2903 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -14,6 +14,7 @@ config ARM
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index 5ba42f69f8ce..1dd860dba5f5 100644
--- a/arch/arm/Makefile
+++ b/arch/arm/Makefile
@@ -130,6 +130,13 @@ endif
 # Accept old syntax despite ".syntax unified"
 AFLAGS_NOWARN	:=$(call as-option,-Wa$(comma)-mno-warn-deprecated,-Wa$(comma)-W)
 
+# The GCC option -ffreestanding is required in order to compile code containing
+# ARM/NEON intrinsics in a non C99-compliant environment (such as the kernel)
+CC_FLAGS_FPU	:= -ffreestanding
+# Enable <arm_neon.h>
+CC_FLAGS_FPU	+= -isystem $(shell $(CC) -print-file-name=include)
+CC_FLAGS_FPU	+= -march=armv7-a -mfloat-abi=softfp -mfpu=neon
+
 ifeq ($(CONFIG_THUMB2_KERNEL),y)
 CFLAGS_ISA	:=-Wa,-mimplicit-it=always $(AFLAGS_NOWARN)
 AFLAGS_ISA	:=$(CFLAGS_ISA) -Wa$(comma)-mthumb
diff --git a/arch/arm/include/asm/fpu.h b/arch/arm/include/asm/fpu.h
new file mode 100644
index 000000000000..2ae50bdce59b
--- /dev/null
+++ b/arch/arm/include/asm/fpu.h
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
