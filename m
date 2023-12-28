Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B9C2C47073
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:42:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H+r1E9cg9UYnhtZ4d54rZC+qI5GW148S8VkO1lmockg=; b=fk2CwSwoWJkb7V
	0YK/9iIX4NwX3wb5oeKuTh1MAEE1oDwT5rwpZDTae5+9LmZ5x0f3ZBOZ6GnQ0bc/UjTuOra401yNG
	8DYgvW0xhgLwNc/UcBqUhbjQFhPFQJ9crLv3dk+NI01oSmt2ZhyhNQS97JqdMqFx6nUxh1Wbx1cLE
	A+tshCiwmr/vc9IMWAWs3LDvQzHMlkFuKB1YzrzpyJfDtDLOrn5hu1GkeFezmaImxmKJ/xeqBNTSa
	7yLMCLhWnvd04LxhLSho1cVwGUL0uPTZzvrP6BOzLFtW9u9YqNHHZIVE1ZAA7De6bGxrsQiqGlue5
	PUoqeLCqEeQsaxT51zrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ9-00Fs4u-2s;
	Thu, 28 Dec 2023 01:42:49 +0000
Received: from mail-oi1-x233.google.com ([2607:f8b0:4864:20::233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPo-00FrkP-0s
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:30 +0000
Received: by mail-oi1-x233.google.com with SMTP id 5614622812f47-3bbd11b2f95so106927b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727747; x=1704332547; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UB0U1us+sHbYZzCVyIg23Xjh36gyEMV3F74ABUc7NA8=;
        b=ey0B73bLGs8CdoU++1wQWZFhrq8xrnaNLQthryOblS1nrKtPrRTwlLyohU7WhErmIs
         bpDhVIEnEwzaUmlskzNaMnM8a2aCpp331gei4ymDrT4WSIAb96NMXZivOOIu4CHoG+Ge
         O/BwdLsobS70Udz4D3oCBXj3xz5msOTFcJAB7bDW09PC7FXGK7bma6NJY9C+Nouu/8N4
         j3Po+TQcI9NJCvyG8AV/koplndX6gs6Eq01KRDAzrR5aEioB7aQGRLMZqEAsEo09BQoT
         U049oqGbQOwz0iHUoejbpLuSfokfsgymNZbL1TAjeq4etYa4dbngbgL+uL7v6uGqb7aN
         +4zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727747; x=1704332547;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UB0U1us+sHbYZzCVyIg23Xjh36gyEMV3F74ABUc7NA8=;
        b=Z8blNSOBxwo3vz0xmIkwWf9WfqkH9LrxqT0h3V1bSGmh04sw21c4xL+aO0iMXDpXcs
         aoNaFJlG5Y+jp1Hm9F1zeNNI9IGxMOWp4FVicmw0v1qFKKysTJGAiPCPJizWbXqTJy2/
         HnC3mXefrnkJwJNG9ZgdKmxBBTeMquoXNX79nRFlXEHCVDgdfDoG35XHI39FOCIle0wB
         Y+AjU84BbOysubQea5ldaRhXAm4LdgTmAaliDVJRrEI3tRVQuvETgoLzAtPYW7rWSouJ
         soyoNxvmhCFqhQat4Jh97Df8QCKxbC8nxboORzs6wqnVgiWNXddtI/Ec/ByV4DlM0DY2
         IYXQ==
X-Gm-Message-State: AOJu0Yxud2LuF0Dg8gph9l/NOK/9scP3EWQlcUgm72iijXt634BDfDu0
	PQ7+Em7jpsu+AHjq25xRxkAowTM8ZsbCRg==
X-Google-Smtp-Source: AGHT+IGpivtFhMAB3UbcfS1StWXrUWSkj+hLT17JMH2Q4rov0k82hYGdvWTiR/shQbloO22mN5mO3A==
X-Received: by 2002:a05:6808:148e:b0:3bb:c453:df38 with SMTP id e14-20020a056808148e00b003bbc453df38mr2614480oiw.60.1703727747728;
        Wed, 27 Dec 2023 17:42:27 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:27 -0800 (PST)
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
Subject: [PATCH v2 04/14] arm64: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:54 -0800
Message-ID: <20231228014220.3562640-5-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174228_336282_196FF010 
X-CRM114-Status: GOOD (  13.47  )
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

Changes in v2:
 - Remove file name from header comment

 arch/arm64/Kconfig           |  1 +
 arch/arm64/Makefile          |  9 ++++++++-
 arch/arm64/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 24 insertions(+), 1 deletion(-)
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
