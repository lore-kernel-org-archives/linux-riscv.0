Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1669BC3DA6E
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 04:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zNuRMxCyuIWgWTLNRxqHT9Em58Mku+Sxu+9A+NkkiYE=; b=bWHqUYVgmMx2Bj
	xH1v7rQihZ+1L94dm4lJOso6BtVnSRik5R/2D3O6knsfnk1WaKLqI/pRNjW5tvelMJXMQvCR6P7Np
	uFkt0nQeZrdxrow2l/B1nNDapDHiCeW5TTfkg2/KFmDQM0aWpejSNG9Xh7r+/t3kVRrKSOIx10DLE
	3b/xFgrqR7crNiAX9rFHyWaLurlPk5T0aQkRvpOKkLTJHexClwdPiXx8YHtI4SNNz8nErJ8NhpS69
	TPviWfFnz75z/sRCIRnSFS51qAZxtfAJb402hhbSW8NikqY3RPDonknl+aPFCaSQhli2KCPTvnoJw
	VWh0MDdAY9Z+qrP4NuOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIhZd-00G4aB-2d;
	Thu, 28 Dec 2023 04:00:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQ5-00Fs0u-2d
	for linux-riscv@bombadil.infradead.org;
	Thu, 28 Dec 2023 01:42:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=5FK4PuyaVW5o+fowKBsFSathMMiGJoXogQryv4/PrHo=; b=pyXm3w+IYlj/aTCy+BYqxqp1FD
	vJ0ioXob8li/wLuafXH/UlNGMWU//TsEXXFMHtrGUiBwXXX514ssarhgsqCHSu0VXovVb5NeTWHY6
	swXOrDs5yQnxehp2TIYNImlzsXryAraxpI/K6NEBueG3of9OtLmosr8qLSJoT7OeZgTGIp8WMOJVY
	Pnm+fqjpXCrW2y389P6UMLeRmcGPu83jGXdiuOz3v5xSYgXcNDGMe3zpX8niXDIYfeUpIUxcO8B5K
	8fA+zb24966WJT5TM/2QDyxLYkXN0xeZyFnOp+jpB3jLkqMT/iI13f7DkyGXu9SdwWi8DRyhBAF2r
	plK09VyA==;
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPx-000xJ3-12
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:40 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-5ce2170b716so1758508a12.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727753; x=1704332553; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5FK4PuyaVW5o+fowKBsFSathMMiGJoXogQryv4/PrHo=;
        b=KduikWc0CE9NqjD95M1pT9qhiEjiJUrTpHkzZp9ni4F8m93I1LTF5/uzJ4vvRm0tpb
         sGTl0aYfekiO4Eo/NpJLd7PPcCHIIgyMMuXQWhEUJNkhRs2VCs1J59njo8zcJnrZS18l
         AmYqzmrZh2uiFa6/Qd8BxD17AvrbiwpBH0ykUDiNXqRE1zlFiycwyt39V89A8CJFyCVx
         jsARILgpHp0FJQNSN8MiHfPj/SIHg59vX4ErXV/9Grm/ANPAk8nalk4QAWBiaZrcOOy6
         c2l9NlcX8Ew0uZOeTLX9v276oA8AJpMqEq5y3xvLL3ZvDv9U81Ri8ZrH+N1N8uf1Rl3e
         Rtlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727753; x=1704332553;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5FK4PuyaVW5o+fowKBsFSathMMiGJoXogQryv4/PrHo=;
        b=rpmQP3VtjUvwP6ZgIPoj4DnqIta5NfEK/T4rh6tmqqrPfHGaqvzZFCSbjgUT5jEP7+
         eeX7rMdtGqWEjhDU2KGoIshG//10rg48M2fa37WCv46gYnvke7YZj8wutks1rQrkD5x7
         ERC+tuX5yHHkVMLwm/BmU2NxFurUP/wlDGoL7psgh2ruNLRrJ7zAosiAxUk8BWjiyjZb
         5xR/PK+GMAQNoP1Rv9yLiRccsqHZuRoupZ8BqnVyv5d4/Ym90CPW4aY3v+IliV+yg2Oj
         KScmbXbg7thxvClzCZYvCc3AJFdrI61+EbsGBKAqC6bwME0HRPBt4xjw1PesLykLjv4k
         Ffmg==
X-Gm-Message-State: AOJu0YwIN0depAafEnbw8zmogjwMkBcowLvDtyVyyL5dpEeZN21DhQxI
	fdDWJs/Wi/B8+LbG6N3u1jEnxDz+8n92Qw==
X-Google-Smtp-Source: AGHT+IGDcwpDNI+ACJS8JwK6slMdt2P3zgEqkBXVCA8XIoKmVvXUWVJm0n6YvZtcZMejj6VORWJ3pQ==
X-Received: by 2002:a05:6a21:612:b0:194:f17b:f877 with SMTP id ll18-20020a056a21061200b00194f17bf877mr9226487pzb.61.1703727752746;
        Wed, 27 Dec 2023 17:42:32 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:32 -0800 (PST)
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
Subject: [PATCH v2 08/14] powerpc: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:58 -0800
Message-ID: <20231228014220.3562640-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_014238_113304_936984AC 
X-CRM114-Status: GOOD (  12.89  )
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
index f19dbaa1d541..91106970a8c1 100644
--- a/arch/powerpc/Makefile
+++ b/arch/powerpc/Makefile
@@ -142,6 +142,9 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
 
 CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
 
+CC_FLAGS_FPU		:= $(call cc-option,-mhard-float)
+CC_FLAGS_NO_FPU		:= $(call cc-option,-msoft-float)
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
