Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D49E8C10F07
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GSUr91OzPCzUOBjoUg8L9CpNLPyz6ZBZ375sEmua/V8=; b=wtITaZTDQH2//E
	SqN3nCDSjZU18Ja97Naux00mGyaf+a9rhAsx2bXR1+KfSSRcjfzErEH86+roJAKWcOZb4QZHikBsN
	IBxSUw53JC0gv8L+gB3i5fH1JPwZCH9LMSzS5Tnl32/gT+eLIWqxCKcM5/EStRThKOVNH8duaQORl
	y4Des1+FnzP/GE91BI0edlEkpVcvwQZI2GUuWLwKXYPtzTr5ysbPrvc4AmLHZlMS9JOQ+0nM4hEDS
	kLBDDPaNtqj8ok/McJvktKAFWeCRtDwxpcR1Uvwdov0tgKL67Xa6HSW5qu3m0g3HWa6UK09cjEXBL
	PTIjz+0EIr0BExDj54mA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpj-00Enqd-0V;
	Fri, 08 Dec 2023 05:55:31 +0000
Received: from mail-pl1-x62b.google.com ([2607:f8b0:4864:20::62b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpP-00EnUq-3C
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:16 +0000
Received: by mail-pl1-x62b.google.com with SMTP id d9443c01a7336-1d0538d9bbcso15753425ad.3
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014911; x=1702619711; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+YzUuPYE3yay4aPXmYR/ZrTN/zes857jj0i/rwk/8vA=;
        b=lvQRBf1m4SlTAV5W3l5dZxaIt+LuC/kMu70XtARHO4hjOezNCyqOm3NcUDJW5kKXss
         9EEDuDX2tH68IXPFjsPQF4NVHBJmnNBmpnrtVeON7WVsKadTzvK+IjYuKFFySxbd96hW
         2N67IPfe9Jb5ZOZieowlJDPXy3uCw8/EdCtlrH7GlDmkZxOrbWsUos01dWkaRNeJRdSR
         C1oz2nBtd1I60ieOtqIgMw2rL7DrgkJiKgsyZedb+TzWLw9N9bv847Iqpaeb1w9auI0E
         W/vOML2gpZ8A6P3VUD7sr3OQTE7588sx67xaCDegLUd8MujFsS64pY3WM1ERcX3uH6gf
         cBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014911; x=1702619711;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+YzUuPYE3yay4aPXmYR/ZrTN/zes857jj0i/rwk/8vA=;
        b=whhdCg6uoZsCMXyBHnXz7Jac4/x5BtvL+cvLZfDPCklQdRdjn7vYWEh1xuNSiwDrHf
         VQMK8hAUKQllbLAi28sf0akznyEg/7T+iOd0lDtguuSpt4LS46lFW26NEIUKybOrrzmL
         nAN90ha1mI0IBhO3OxGhDtPZKKZ00+Bgy1joETOcyhrurKfhMvfgvJsvV/AkRA5MuMiL
         OpoM9RSVudd9M5P+Ow1SvhLHCiT3oshY/HrXxHyH9hx/Mz0KR1bJIi/m7gofKKN15jZe
         LMbQMBc1qSQXTD1GwtcpPdR5AYm2HQ/SWbxSwwTdKqCt467DKDOMFhZHZgMbNxZELxTf
         1QIg==
X-Gm-Message-State: AOJu0YwdusEI+myVKw6h9aqGt63yZ+2RZH92S8IfEQVQ85bqXLg9Qakb
	/Tg/wD7NURCgdJ/0CsDL2kfTsw==
X-Google-Smtp-Source: AGHT+IGkpKPNTZyORkUclzuJiqEGnd764SXTk1kHONQX0GukAsvi/MYXEyo8qWiBUacvBaveWOlV4w==
X-Received: by 2002:a17:902:7e82:b0:1d0:b9f4:800f with SMTP id z2-20020a1709027e8200b001d0b9f4800fmr3698333pla.109.1702014911528;
        Thu, 07 Dec 2023 21:55:11 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:11 -0800 (PST)
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
Subject: [RFC PATCH 07/12] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:37 -0800
Message-ID: <20231208055501.2916202-8-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215512_113214_BA0C5546 
X-CRM114-Status: GOOD (  13.05  )
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

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/Makefile          |  5 ++++-
 arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/fpu.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 6f105ee4f3cf..e96cb5b7c571 100644
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
index f19dbaa1d541..2d5f21baf6ff 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -142,6 +142,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		+= $(call cc-option,-msoft-float)
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
@@ -163,7 +166,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/$(ARCH) $(asinstr)
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
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
