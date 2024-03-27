Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4712C54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 21:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NAkfNB7JjOaSidRi/sFs2ISSoJot6FUBcJYMnvDiWu8=; b=Yg01U77BFJOcK+
	O7cSuOYZ5CcRMhtjk6xppGyZJE8XrX4H4onxuEhzx2ByFN/FG1DyppD0LtOYTMYZbfymw000tcdxZ
	1R8KRd2fXCJ9kqzdZRd1bgTB92lpCsmGZT9XrTtcPB4RSDQDFbJ2FIDl8mDXmR2g1tAQQiE7jxrsL
	EIw59li6c+7dO24AMkdxZ+jpZd2RpKfBsb6yajFa6Ky/w44aC5i/MCz0PWsRip6zUVaiYLL6ZWerR
	ryULN6Jm2j6pUB76lPNN2sOGmrQPUqqGgRpAj2yVOlaDQHQ8micWSNKqjbuoLkH69qJ7TKAg18VsV
	V+PMHY8mssS1SH/MFBzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpaQl-0000000B8Ln-3rwe;
	Wed, 27 Mar 2024 21:03:31 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpZTG-0000000Atxv-38GC
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 20:02:04 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1dee5ef2a7bso1953905ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 13:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1711569721; x=1712174521; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=TRSVMQ36uWjZzRmAW0UAIect3xkTU1TU3MYTPXKyc0tfmv9HjmubR7jAKNxsde6hsv
         Gagf4cMKfDlryewUvk0g3044pXzbZevZqDbZztx1jDWmyPS80hL6ZoyiLjMobDB1bZDQ
         uJq4kQzC1Pvoo8IXwTGDe+S8klOKws7oTEZFcle+9gVtPEDW7SJ+DA5lc3YGuq88hRbJ
         vo6VBCEwdiYNU0EH731QyVDJf10UZRBsddzJyPysnFfEwef+hOmudL/cEJSHkbvqMUUI
         9cHWQ3g9qnqx/KNZF3Sbb03GOu6aqUqTUsIBILBM/iq4P7kmupghU0CmhdKrpo+U9mRT
         pftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711569721; x=1712174521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=im7zmQeDt7pZodE0p+VySjAa7DBv0KaW+gKoLu+LS/g=;
        b=eoo6a/schabhb9vnWpZpU4+Hf4KD2fGXqRP7s3YFFPlsRe27E5c0vKz4xZj5P5gmO9
         F/vRvLWkH17wuZenvl+8CCM9/KLBErOEalnG/2uN3BuWOhIQWyMBgrDRGiHwlWT4UKhB
         L4hW9Fc64uagElGmCLRgS7T2Q5QZ//sE/ZmWdCooEvytld97vp/FXjT0EQf12+BgJlsc
         rOf4x9wzt/K7FucK+ir8+vZBsA6N6XvhPJGHs/tYxXDT1Dc3SNwN2xS57ZhEysMvbg7T
         iFDPnc0t+nKizInxfQhF/VejXg6BOW4Z9uhME2yFLf66UIcAKTC8SI0dBv/S67Ko/RzA
         VuFQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8XY/Cr5RgzLE3gdT67XEfxFh38/O3j9Lir5JZnp34L0K3VCv1+cvhMPVGaJAYjQmV7w9MDvXLkd8xi2Rm4E6cpg5v0k+NlB9TxJsGDPPR
X-Gm-Message-State: AOJu0YynxJSlLoQqjs+CuxRmumjWhc4pn7vfzUzpr6nMvhysIU5scx3i
	coT1b8UzsIKG8mp1FDtYKAB36ffbYCu+Bg6NKqnGP2O7e2uqTP8egHPL6Pk1mkQ=
X-Google-Smtp-Source: AGHT+IF+ykWlXq/2p9fLdxe5qiT+fQJVLXU8yD1cTqgZWIiJ9yzpflW/8jhLl1LVX7Yz7XdGYJsgng==
X-Received: by 2002:a17:903:28e:b0:1e0:d6ce:7e16 with SMTP id j14-20020a170903028e00b001e0d6ce7e16mr805365plr.15.1711569721663;
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902e5c400b001dd0d0d26a4sm9446459plf.147.2024.03.27.13.02.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:02:01 -0700 (PDT)
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
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v3 02/14] ARM: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Mar 2024 13:00:33 -0700
Message-ID: <20240327200157.1097089-3-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.43.1
In-Reply-To: <20240327200157.1097089-1-samuel.holland@sifive.com>
References: <20240327200157.1097089-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_130202_930496_7811206F 
X-CRM114-Status: GOOD (  15.41  )
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

(no changes since v2)

Changes in v2:
 - Remove file name from header comment

 arch/arm/Kconfig           |  1 +
 arch/arm/Makefile          |  7 +++++++
 arch/arm/include/asm/fpu.h | 15 +++++++++++++++
 3 files changed, 23 insertions(+)
 create mode 100644 arch/arm/include/asm/fpu.h

diff --git a/arch/arm/Kconfig b/arch/arm/Kconfig
index b14aed3a17ab..b1751c2cab87 100644
--- a/arch/arm/Kconfig
+++ b/arch/arm/Kconfig
@@ -15,6 +15,7 @@ config ARM
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_KEEPINITRD
 	select ARCH_HAS_KCOV
+	select ARCH_HAS_KERNEL_FPU_SUPPORT if KERNEL_MODE_NEON
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NON_OVERLAPPING_ADDRESS_SPACE
 	select ARCH_HAS_PTE_SPECIAL if ARM_LPAE
diff --git a/arch/arm/Makefile b/arch/arm/Makefile
index d82908b1b1bb..71afdd98ddf2 100644
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
2.43.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
