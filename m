Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73DCEC36014
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Apr 2025 20:35:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5LeS24iki5dCvM9DHTlDvl6R2IODK/w29NvdebdZHdE=; b=i9nroByiOcgL4I
	cOemySzLzOgHaSLx8+B6I/DH1O6KdI1Msc/rWk0uiad5/jc2pWY02IGAfy9qGw+189XXx4FoCH2E2
	ydPa0zaURZwKf9SxAWzxBwSiBmz6POX7bHl5dec8Emk7QSe+FqnYBU3YFsOxRpIIQMjPOBsoCu8uy
	1VsV3nBabcOLcQi3GU5FvvsXvEvnx1PbbfFVTTIoPrbE2HHuBwI5sD8kJUw4MPDFSKwENmMWkn+aY
	fpAtrow7Dulg/4BGxzP3DTDOTTIvy21tM33GhbWVFVkEA6621O/ZcOdqdgkzHOrlapG0Uvc2Qe42a
	EJ1C6cHbgjHZfnki3dsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RHL-00000009yy1-2u5R;
	Thu, 03 Apr 2025 20:35:11 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0RGv-00000009yrz-3of3
	for linux-riscv@lists.infradead.org;
	Thu, 03 Apr 2025 20:34:47 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1743712482;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uD5iR3j3WFLeggCmYAp0dLJAKr7cyaVudV3J9Ga4myY=;
	b=MIwNf3eaBPBrPG9omxufAUV6tnp5q3ry1N627DcdtUnMzfiH67FN+ZUm12lE2dQVJVcjiB
	bVZjU2tDudJbqxqc0ig1fsk1ti9GkNNbfEUmnqClXrVzOaOJz4JImFPCTJJ5WkBl968Bf1
	8QZScsUZwv/RnH+AELw1It1J4QmMxg5SBRqAEnw2YJATgdsSie8QNRXnB2SAxGKGeCdgZU
	MamUC6LihnbhVDyj1xCzw3rbsqExVOW1/u4kyMKzLyvQx08MVZhaTOnqONnt/kiQbAyrYq
	povq+FHVJouPcG32144mW5tOJKBiWbMzBL7Ex204tZIR77KFOlAYzLRjRTC46w==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Thu, 03 Apr 2025 22:34:18 +0200
Subject: [PATCH v3 2/2] riscv: introduce asm/swab.h
MIME-Version: 1.0
Message-Id: <20250403-riscv-swab-v3-2-3bf705d80e33@iencinas.com>
References: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
In-Reply-To: <20250403-riscv-swab-v3-0-3bf705d80e33@iencinas.com>
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>, 
 Arnd Bergmann <arnd@arndb.de>
Cc: Eric Biggers <ebiggers@kernel.org>, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev, 
 skhan@linuxfoundation.org, Zhihang Shao <zhihang.shao.iscas@gmail.com>, 
 =?utf-8?q?Bj=C3=B6rn_T=C3=B6pel?= <bjorn@kernel.org>, 
 linux-arch@vger.kernel.org, Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250403_133446_099852_D5FD48B6 
X-CRM114-Status: GOOD (  10.58  )
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

Implement endianness swap macros for RISC-V.

Use the rev8 instruction when Zbb is available. Otherwise, rely on the
default mask-and-shift implementation.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
 arch/riscv/include/asm/swab.h | 43 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 43 insertions(+)

diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
new file mode 100644
index 000000000000..7352e8405a99
--- /dev/null
+++ b/arch/riscv/include/asm/swab.h
@@ -0,0 +1,43 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_SWAB_H
+#define _ASM_RISCV_SWAB_H
+
+#include <linux/types.h>
+#include <linux/compiler.h>
+#include <asm/cpufeature-macros.h>
+#include <asm/hwcap.h>
+#include <asm-generic/swab.h>
+
+#if defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE)
+
+#define ARCH_SWAB(size) \
+static __always_inline unsigned long __arch_swab##size(__u##size value) \
+{									\
+	unsigned long x = value;					\
+									\
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
+		asm volatile (".option push\n"				\
+			      ".option arch,+zbb\n"			\
+			      "rev8 %0, %1\n"				\
+			      ".option pop\n"				\
+			      : "=r" (x) : "r" (x));			\
+		return x >> (BITS_PER_LONG - size);			\
+	}                                                               \
+	return  ___constant_swab##size(value);				\
+}
+
+#ifdef CONFIG_64BIT
+ARCH_SWAB(64)
+#define __arch_swab64 __arch_swab64
+#endif
+
+ARCH_SWAB(32)
+#define __arch_swab32 __arch_swab32
+
+ARCH_SWAB(16)
+#define __arch_swab16 __arch_swab16
+
+#undef ARCH_SWAB
+
+#endif /* defined(CONFIG_RISCV_ISA_ZBB) && !defined(NO_ALTERNATIVE) */
+#endif /* _ASM_RISCV_SWAB_H */

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
