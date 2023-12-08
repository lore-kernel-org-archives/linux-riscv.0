Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67952C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rE9UI8Eo0P39O8YmrFG3xhYEgEgfzizDhmlJnlMtqxc=; b=RNvNv1XVzWBaQr
	TRh1fbVqjJ+Cdk41hgrhPJtUpINiQb5RIjMf5/CY+HJGBIwipq7y8pcu1i1hGoTivj7NCPp7oI5Bk
	vEbG9uwEEUB4H6lLx5+TE27Edo4/IV04ogJwrY6+LFridYgExqmDwd6qKBs1l+QXeUTv+097VvAtG
	yHSPcCF6bbmlZgOdo1Xagiej6Vixk+v0hR5BEJsewhLj0awEHLX2q2gyMAETVRWiXcuNPAIotUClu
	QvczrVC3mF/K/nYu1GmzkxanNsM3Cqi9Uf6b4rqwhbqmjcJExphfJFzyHbXzo+rEoz1NPK8GXokLI
	kWCFgEitRkRQqTKrIyMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpZ-00Eng9-1R;
	Fri, 08 Dec 2023 05:55:21 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpL-00EnOD-0V
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:09 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1d048c171d6so15672175ad.1
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014905; x=1702619705; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9S9qeMKPrbOjny9ys0DNZnwzZdal5DwwFbQdO5IaRKs=;
        b=iqmzunOeLwgk1lT9SQdFwbptO2491/yQQa6UORyWx+L2YH3zMKH+KC32XenFjmEC/n
         7cOuozzTRpoaktQ2tN/la+afhI4MITXDKMr+0A/VFIDsdeiJdC0eHWRwQQoBSxk0EH/b
         VSpr6bkrb/00lBwM7fN02KyHfP0q+77ZiiK2h5NiHP1vh6Uj6/0d+6SHGrI95nIl5wNN
         +KPM4yCQZ5zIJRCUZTWROQCI+R6bdjBMdmjFnpMYcSN0geIIDPQrn4uL1GeSDsviNZgF
         4Pf3vXkS8fzWQbYjDOwhazChivO7eHBhGaMxmu/bTJCRlEBhxQoeTZP5UeXLSjRlqNZi
         xfZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014905; x=1702619705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9S9qeMKPrbOjny9ys0DNZnwzZdal5DwwFbQdO5IaRKs=;
        b=JcuFsTVDB0CEbI+yZ8N8cf+WJFUfWd46pftqVD5pDkz4Dj9iz+aBCTP5GWlURWGgB9
         u75ZfjVUsccs5aGg+a8R75i6FxBLpLKDdEI9R9XZObvtqMYRnf7s44kZ9XIPk05V96ai
         o8r8SL/kDc3EJG2eTA+XJWqfJvF1TkZUrd5FPnAzrzgz+sw5aBKJmg74SrRH/LCXST4i
         tV8iCW2p+znNOsg99oNwKRyFKunXYBRNJqSxxdsQMeplsJc09vqpIpoFQc8Xb0SS9aH4
         CCMtYgjdPYuxm71W6rMSnGUHqLAmEWSMlGIZ8DvuQo8occDh2Ho0yO0QvQpDHMSbeMEb
         LIfw==
X-Gm-Message-State: AOJu0Yyg+LLTsNEVWlS5K4C8VIXgedaPFoweMwHfF/I8pQZVyx/8FKoz
	MVBQmZU5wI8AEb3HZWM9gRpjZw==
X-Google-Smtp-Source: AGHT+IHfVmDuQcwcTNkJBCCNyd1od5dj0sgf6cJP7ZkJkjT+CFkpOEIDhByDVUVjY+z9LFISOIDfEQ==
X-Received: by 2002:a17:902:6844:b0:1cf:b190:ea07 with SMTP id f4-20020a170902684400b001cfb190ea07mr2955137pln.21.1702014905389;
        Thu, 07 Dec 2023 21:55:05 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:05 -0800 (PST)
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
Subject: [RFC PATCH 02/12] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:32 -0800
Message-ID: <20231208055501.2916202-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215507_192037_99819CF7 
X-CRM114-Status: GOOD (  13.22  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 17 +++++++++++++++++
 3 files changed, 25 insertions(+)
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
index 000000000000..d01ca06e700a
--- /dev/null
+++ b/arch/arm/include/asm/fpu.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * linux/arch/arm/include/asm/fpu.h
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
