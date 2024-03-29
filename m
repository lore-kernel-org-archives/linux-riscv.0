Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6426CC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 08:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BINAtuknauSGav5dFR1jvUepxbfvD6CnNvfDYZTwDfk=; b=rV2eBGoGBjh2uB
	KCISPwyFqc8eMUj4hxeqv2+yIvRQGjpfQhjXhkHYPUMaPYLYUrlvGcHEdwowYHf1iZgKoX27hJPzt
	WtCtC0Bx+3t2roPHaexRdonEY6qVtnzS+HUs2BWYPojKIqrP7GQJBhmD/ELMfvIUAcyiqDO0mXROw
	6fBhCZa6CimeO6uyvb0jWcIJ44QDjOrK7S2TkJpnEXklsIDg7WT94ez23ooIJ9blKoImB57qsmc2Z
	2JN1vbTh5eh7dYM/h0rEls5f5zFejZlkb76+5ZRswDbIEzrDUT3Hh6IiI6mj7IPA+vOAs8xUQxUFH
	xnrikRH9tRt6JIywO0Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq7gg-0000000HKdI-34Y2;
	Fri, 29 Mar 2024 08:34:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bo-0000000H8hp-3bAm
	for linux-riscv@bombadil.infradead.org;
	Fri, 29 Mar 2024 07:25:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=; b=JEm/7Ho5jwi1OcMMs+Wlg9jHaI
	Fo1qUkC/RG3Hh303Ng0Q81qkOyG+HAOyRbjGsxdY68kMndm64R7sWgEs8NdSRGnFyvelAPXu9FsU0
	s7I2i9GshRf86s/H+G0HBhXmVgh10241vLRMEvyaZyIYhhGzkvAlgJpa1zH96PNi8WB611J9+gWkH
	4XZ7htv4yksiEn9dr2Ygsmv4lhPC1eLFxG11Ktjbi7rmnkXFHH7cDgBtWz0o8v1RD8mIZzwfcqUF/
	q9sdhSdiKvyggg2+56bLhLJjGP3MeVIWNdY0Ait13TFL9x0IOB7ghetviOn1rFY3LkCSLTzKSW+J6
	M7sPMX7Q==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq6bl-00000001QtU-2GOO
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 07:25:03 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6e7425a6714so1502237b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 29 Mar 2024 00:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711697099; x=1712301899; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=IrWdzBqppExxW0jsN5DO1Lye8ORzfalZpVvRu4CDwDwDhl951IAkiCgUWDQpgCTadx
         Je1N1Jn24WMdxr4WOQOFWDvYKN8EWNK3Pj5DYG6ofJMuRWtsNcDrGhs+wUARMFLDtj5S
         y+t6HidMaOK/WQmCk8FXCIArZzmlYIwmhpc0Pd6wnxRQm7H/BdzpUi9JavjubNK4ui2N
         nLOIm4rUhL8/3Bbaq9bjNSc67izK1J19h+b48Tj8AY98/Mu4Csbcu6skK0oiz4jpQSh1
         CjWUuIy3EXpOmqFkNSYjUop9tzjc9duw8Xu2AjhvUq2GG3kbNwMdDfAIycYxRnoycdkF
         Jnmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711697099; x=1712301899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=miBOSRWGIbztCOf3acmBaICqQz/+WnlSIiHBb+4Rl8M=;
        b=fCL1wk8gbNVLMds3vOSI9VuvVxJW8HhC58VdSzNak4N9vrnmC/9UzYCDIXQlZwSvVW
         EjEBNF8M9n7sJFcLVIjwdbwWU/3eLrfCYxctDaTrmjNeoEC6M88BjaYzbNejJTjdaYW6
         iucXyCnJ7vNFD24AeXaKE5qi9b9G3YA/XlCJKnhH3KGhbfXF9hrvPEIwzO4bmAhQvT1x
         dUqZ06BoyQu+Yfka33MmmIui0PrwzWQLcx6U8Yd7+dwaX2ohL/RYdVrfEGcfFliL51E9
         vcQw4exAhHMCSTg14wa5o9Qq3RG8gT7GD8eSyaN3H87u/Qvl44G5GxnhqeH1cQPEtQ/5
         ho0A==
X-Forwarded-Encrypted: i=1; AJvYcCXoLWs3ct9qLulG0vByUH0VU41Ko8ccHuPnU70MTstXW2UehDuqZRsl8F1Q4+ygkoqVEXC8h581cMWrzI2j1/6P3N2T9JWAIx1dbaAqiNI8
X-Gm-Message-State: AOJu0YxC5qVYoQw9oCvLYuiIMokqNOxxz2Ddi/bySePCZmX1R41FwQkz
	gmUDuIbqsdoUKKgjrXDLdjdZ6CT9beF88E55O5DXt5yAFPXqR+JfFhI+gZkBv8I=
X-Google-Smtp-Source: AGHT+IHGvAdAnX/0WDZVeXS0a7ZQ/motGWeac64eqKBau0xYaG382zqiN+0tE34St5zugVtRmJL1tg==
X-Received: by 2002:a05:6a20:549c:b0:1a3:baad:d566 with SMTP id i28-20020a056a20549c00b001a3baadd566mr1487303pzk.40.1711697098883;
        Fri, 29 Mar 2024 00:24:58 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id b8-20020a17090a010800b0029ddac03effsm4971798pjb.11.2024.03.29.00.24.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Mar 2024 00:24:53 -0700 (PDT)
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
	Michael Ellerman <mpe@ellerman.id.au>
Subject: [PATCH v4 08/15] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Fri, 29 Mar 2024 00:18:23 -0700
Message-ID: <20240329072441.591471-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240329072441.591471-1-samuel.holland@sifive.com>
References: <20240329072441.591471-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_072501_731840_5DD39B26 
X-CRM114-Status: GOOD (  14.01  )
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

Acked-by: Michael Ellerman <mpe@ellerman.id.au> (powerpc)
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

 arch/powerpc/Kconfig           |  1 +
 arch/powerpc/Makefile          |  5 ++++-
 arch/powerpc/include/asm/fpu.h | 28 ++++++++++++++++++++++++++++
 3 files changed, 33 insertions(+), 1 deletion(-)
 create mode 100644 arch/powerpc/include/asm/fpu.h

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 1c4be3373686..c42a57b6839d 100644
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
index 65261cbe5bfd..93d89f055b70 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -153,6 +153,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
+
 ifdef CONFIG_FUNCTION_TRACER
 ifdef CONFIG_ARCH_USING_PATCHABLE_FUNCTION_ENTRY
 KBUILD_CPPFLAGS	+= -DCC_USING_PATCHABLE_FUNCTION_ENTRY
@@ -174,7 +177,7 @@ asinstr := $(call as-instr,lis 9$(comma)foo@high,-DHAVE_AS_ATHIGH=1)
 
 KBUILD_CPPFLAGS	+= -I $(srctree)/arch/powerpc $(asinstr)
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
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
