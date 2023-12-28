Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE2BDC46CD2
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 01:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cJf1S5OFhLL3tVqEeau/YZZpoBpdgq/Cdk4NxoGvoew=; b=Ms0/YDxfBjAMKX
	IkbxMJ9dRmWkh2+2Jiiy2Wv2AukamPLFqbYUVwX14YLht9ycLFcA9eBXyRHKbRNPNxtk8KsxqlD+R
	1wGqljj/A1mWKyBQ+EDFarvfAVLakq2s8MaQfQVdz5b/31MU+DscmxKTedGfvtD0t0b8xKishOizi
	f73EVYD8kdKNfAFBEY7ABkfzKzH69bgcCHVfomk4d//Ddx6Hl0tbjM6P8rHCsh44W//iraT1KO2Pg
	lE0ncuuBjNgQWbfdYbXXI8BoJFQMAOhFGLTeMsTz+BMeT/tb81EFOHENsVLo4kWpyLr9D8/wwuAHl
	ZgmfjaReSFWFiwaO2RBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfQs-00Fsbk-2u;
	Thu, 28 Dec 2023 01:43:34 +0000
Received: from mail-oi1-x22b.google.com ([2607:f8b0:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rIfPv-00FrrT-2h
	for linux-riscv@lists.infradead.org;
	Thu, 28 Dec 2023 01:42:39 +0000
Received: by mail-oi1-x22b.google.com with SMTP id 5614622812f47-3bb7344a0e1so4769744b6e.0
        for <linux-riscv@lists.infradead.org>; Wed, 27 Dec 2023 17:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1703727754; x=1704332554; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eH3LxR+7tKPhQkN8usVAFkK9L6kG8awbjmN4hDMh6eY=;
        b=WqBUm7Z30+vkLf7ORpXjbpZ/T2P3R/p7X7Y52OhZa8EEUMFJMpvEik3hl94x1rOx8f
         8kHzrwhflGVRYDaj/7AnyR3bA5vk+KBV0F84A7w+CqOxRUhtiFSOgCGMsnN1C5HQCz0Z
         Ag/1ZlOIOPVE3+gJAOhDaWdRCa7GAavViOCynEpYyRHjlB7noFHEJi93zPpcPyrUIRZe
         NYVzC2Ltv8bbY1SWVdgkGNdWPl3SPCkUg8ojz8gjGl6qEqzXvfC77nfnezfEonb6G51s
         aoC0qtKKksRLWUnaRQleVvoyKyCIO/rzwxvxdCDYbZUnd/uHfTRLJmYLLbWzc0upiAvN
         +CfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703727754; x=1704332554;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eH3LxR+7tKPhQkN8usVAFkK9L6kG8awbjmN4hDMh6eY=;
        b=cG3UoxtK3K/PBLK1IcKAfTqGhMBTypeh4OLz8KWUHPRiEc38xJo782LICdJP4LWX5q
         x+cJaVQynUBLnPHwkHQlJ+huxGEanffRfVcq8zR7gh6U2cTpsJkW13FCAVMFqC9x+778
         HQj7fOxUpt6bZghqTdv6HEZNFFv7OaGXBMVDov5RTapDF0d6azDEsd9SEXzNfKlIs/8I
         tmFKxilqfci72WYLf2mb0S1NiVLLXFQNe7cnvyO4i8TKLGZ2B/GXKunz16Ta9uK5iv5O
         lu8gSAyzEY8s8BmLS1KOzgU732whajMJxnsdWxnzKMwiIl94yz+21VmJs9MHE5lhP5jG
         8XuQ==
X-Gm-Message-State: AOJu0YwMSu2bmDpOwRbOJcNcSlKocoeWiHi2qg2OX2SOLr5P+B+BuyMe
	tzxn37opFlhcPW7toOyfyN3jd2mQzg091A==
X-Google-Smtp-Source: AGHT+IFEpLCvQycB9Oz1224kGaB5IW+nw3w8GCtWHxMOhFrbIq/NPFVjqUIq8RXAsL/B2ql/Y5FiAg==
X-Received: by 2002:a05:6808:2204:b0:3bb:6f23:8244 with SMTP id bd4-20020a056808220400b003bb6f238244mr12160740oib.70.1703727754042;
        Wed, 27 Dec 2023 17:42:34 -0800 (PST)
Received: from sw06.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id g24-20020aa78758000000b006d49ed3effasm7335440pfo.63.2023.12.27.17.42.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Dec 2023 17:42:33 -0800 (PST)
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
Subject: [PATCH v2 09/14] x86: Implement ARCH_HAS_KERNEL_FPU_SUPPORT
Date: Wed, 27 Dec 2023 17:41:59 -0800
Message-ID: <20231228014220.3562640-10-samuel.holland@sifive.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231228014220.3562640-1-samuel.holland@sifive.com>
References: <20231228014220.3562640-1-samuel.holland@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231227_174235_899054_330765E8 
X-CRM114-Status: GOOD (  13.63  )
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

Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
---

(no changes since v1)

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
