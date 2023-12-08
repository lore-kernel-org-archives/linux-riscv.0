Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42536C10DC1
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 05:55:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n436mfIhxJSodjvZu/blQl/uApjFYoHtz43lv1RqYqA=; b=kI4h2VQMq/aIJo
	cuPsBAS/+FXadkJQw9pVEgTLk2aXrl6mhZ0JfoMr5J23cpqN77Ja2EJ+r/fdGiTs9Ubxsopd+DoFQ
	vUKbY31D4mR76c6ars+bTIZaxJ+kZmpGya/InRM+pC/m9wwD97KthYfRq6SgsZS1SR+uQa9bxEO+8
	fKFqY9/1T6Z8obyy7MFH7UysGJLBQJ6oSaMZFcj3CVDVlicT69xAEWUaAez6XqWLn1kMrhtm6WakN
	OG0CF6a3vStfoxRqIFuOW/QRcyf8sz2m3j4vEm1CgIuk32xgrvrrDCfhXEBqIE4UF8kCb2DcyWJkM
	m+ulUg1y42Bt1k4IxoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpl-00EntZ-2O;
	Fri, 08 Dec 2023 05:55:33 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBTpS-00EnWr-0S
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 05:55:18 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1d048d38881so13129165ad.2
        for <linux-riscv@lists.infradead.org>; Thu, 07 Dec 2023 21:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1702014912; x=1702619712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOdH6gQ2/kSr11qF6anDkZP04y2oGGJwChsMHemqfok=;
        b=gtVXlqF44lpEx7V+8bqYWdyKf6ET/6e5JwhrYSww+3CcG8eGvkoYlEruP3MzaV9L7B
         Dc1H7JuWWBjtlY2eXWlPF/hekIvstP4HwKfC88OPLMZkyxhpz7SzMQwahGFMk+EEcmbb
         9EuNMaNgVSvn+UNMwGLY7qn+JnhH5rr7/H9FHRE9uH/XOOD9ePOAKOEPJURG6yeiX2ng
         cM0rwW5YsUkpyP8h19ycg7e/GKqALk2pRRd8feB4Hehz7w5aUoi+GiMJBPhRR9kJePBR
         c1e3P/2Py3VIV/plmet6dvQq6rpFI9hluTJm/dEkh6ZvF3VFj8aTvId9lZiTDQmSrt2d
         4H0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702014912; x=1702619712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wOdH6gQ2/kSr11qF6anDkZP04y2oGGJwChsMHemqfok=;
        b=QwmsOIx4zkJbWCyekzjJQoc2mGYrgTiDBQ+6SLlBporFzcj7r/kfSJEt5Kkym73gOp
         Wzm7UeC+e+8JDCXlUsQX2GTkJ3yopsHZMTlfdCi0Ot2vKT58r4td3ZJSVlBtv5p4fD0T
         65dQ7Pzl16iHiAhwlaTjpV2IMei6JCSJbKeFc54kYm4VHEOBRMGRG8Y+3cdCB/lvCAON
         p/c7m16ZdQsLOq6dHugVt8geFbq1RrcR5gHpEwI/jC0Dm1hUWve9YZ/JwYa4WfL6ukFu
         DJElXjTVq1bU4U8AHVQ2C8AOgKjSjJuMURfKHNX4n0kZMe3WS/VLuYpHisuFYkGjDfVw
         f4sQ==
X-Gm-Message-State: AOJu0YyqmDddE0DBhQ3l31gQWMrGZeW0bfWXxoITXCVJIL2YvCmzqCno
	hniOSzkvSMCkKTS4dyapJJU3Yg==
X-Google-Smtp-Source: AGHT+IF6KW8xi8WlWkg/kkkF64YaWdAU9w8XTSDFOxfj/W9T6fcHp2B4VJ43fwnOYGHYYluHTLhnIQ==
X-Received: by 2002:a17:902:64d0:b0:1d2:eea4:a7d7 with SMTP id y16-20020a17090264d000b001d2eea4a7d7mr180399pli.5.1702014912711;
        Thu, 07 Dec 2023 21:55:12 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id s22-20020a170902989600b001ce5b859a59sm786250plp.305.2023.12.07.21.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Dec 2023 21:55:12 -0800 (PST)
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
Subject: [RFC PATCH 08/12] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Thu,  7 Dec 2023 21:54:38 -0800
Message-ID: <20231208055501.2916202-9-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231208055501.2916202-1-samuel.holland@sifive.com>
References: <20231208055501.2916202-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231207_215514_183651_127504A9 
X-CRM114-Status: GOOD (  13.74  )
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

x86 already provides kernel_fpu_begin() and kernel_fpu_end(), but in a
different header. Add a wrapper header, and export the CFLAGS
adjustments as found in lib/Makefile.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

 arch/x86/Kconfig           |  1 +
 arch/x86/Makefile          | 20 ++++++++++++++++++++
 arch/x86/include/asm/fpu.h | 13 +++++++++++++
 3 files changed, 34 insertions(+)
 create mode 100644 arch/x86/include/asm/fpu.h

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 3762f41bb092..1fe7f2d8d017 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -81,6 +81,7 @@ config X86
 	select ARCH_HAS_FORTIFY_SOURCE
 	select ARCH_HAS_GCOV_PROFILE_ALL
 	select ARCH_HAS_KCOV			if X86_64
+	select ARCH_HAS_KERNEL_FPU_SUPPORT
 	select ARCH_HAS_MEM_ENCRYPT
 	select ARCH_HAS_MEMBARRIER_SYNC_CORE
 	select ARCH_HAS_NMI_SAFE_THIS_CPU_OPS
diff --git a/arch/x86/Makefile b/arch/x86/Makefile
index 1a068de12a56..71576c8dbe79 100644
--- a/arch/x86/Makefile
+++ b/arch/x86/Makefile
@@ -70,6 +70,26 @@ export BITS
 KBUILD_CFLAGS += -mno-sse -mno-mmx -mno-sse2 -mno-3dnow -mno-avx
 KBUILD_RUSTFLAGS += -Ctarget-feature=-sse,-sse2,-sse3,-ssse3,-sse4.1,-sse4.2,-avx,-avx2
 
+#
+# CFLAGS for compiling floating point code inside the kernel.
+#
+CC_FLAGS_FPU := -msse -msse2
+ifdef CONFIG_CC_IS_GCC
+# Stack alignment mismatch, proceed with caution.
+# GCC < 7.1 cannot compile code using `double` and -mpreferred-stack-boundary=3
+# (8B stack alignment).
+# See https://gcc.gnu.org/bugzilla/show_bug.cgi?id=53383
+#
+# The "-msse" in the first argument is there so that the
+# -mpreferred-stack-boundary=3 build error:
+#
+#  -mpreferred-stack-boundary=3 is not between 4 and 12
+#
+# can be triggered. Otherwise gcc doesn't complain.
+CC_FLAGS_FPU += -mhard-float
+CC_FLAGS_FPU += $(call cc-option,-msse -mpreferred-stack-boundary=3,-mpreferred-stack-boundary=4)
+endif
+
 ifeq ($(CONFIG_X86_KERNEL_IBT),y)
 #
 # Kernel IBT has S_CET.NOTRACK_EN=0, as such the compilers must not generate
diff --git a/arch/x86/include/asm/fpu.h b/arch/x86/include/asm/fpu.h
new file mode 100644
index 000000000000..b2743fe19339
--- /dev/null
+++ b/arch/x86/include/asm/fpu.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2023 SiFive
+ */
+
+#ifndef _ASM_X86_FPU_H
+#define _ASM_X86_FPU_H
+
+#include <asm/fpu/api.h>
+
+#define kernel_fpu_available()	true
+
+#endif /* ! _ASM_X86_FPU_H */
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
