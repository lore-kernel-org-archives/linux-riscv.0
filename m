Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFA38C369D8
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:57:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/GzyX178+l7YFzAtf5SUuYG3ltTLLJj0QsAtjWlKMyo=; b=MJP8g3twjlBIx9
	awAJRDe99Mvmae6micjFL+XrDLUc7CfLsiG3cZ6gLnTeoGpgrehkbw6qjz1ptQsH7n5x2p2SKvMCc
	r5Kn1ev+HQm+2CO4JwXlcI7ubP7k7tzBnkSi3fU7izxJIwEHVdm6WYnlbdjDGOUAw9SvoTMYUmPmQ
	nk+SJgYgPaceZjSTEU8nSHGYH9P/p8ezsY66x8mSQQHXrzAEJf1J55xTJVwMXq1UC1wVM5GaglYWc
	EjNfWcNfQR2m2JU4QXSH5Cnf76at+LeW+YT/1bqKG09g7c9Wy4f1SkcJdK0Yojopde6M/9dCQU7Uh
	ZxgmxwRz+FZZprtxP1Bw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxc-00000002Bdr-3MY3;
	Sat, 26 Apr 2025 14:56:56 +0000
Received: from out-173.mta1.migadu.com ([2001:41d0:203:375::ad])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxZ-00000002BZ8-0trn
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:56:54 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1745679399;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2kGESmUc5K4aE63sF+pKXsYXoXR44233ot7fuIdc7eY=;
	b=Cynu4gWmcHLMMh351vsuhpvZBlrDwJN2/KOCWh5A3hAyULSfEYOXSXewFSphEDseSyuP9v
	dV5Ez5gCNMYOGlS9N7LgVeLYvDcFg6l2yidT5oVjD1MP3cAjs6lIaoQFy255/djZqLMx37
	G83QxgEd0YA1aGKOmeVxETiwZUeGNIwZsUTBcEmLzwJtaBzNYnFm+w0Z1Po1YDt/HTDHjd
	XxaVGqV5dHAc3WFg/6Via63St3EqkjbAL7xjS6/HpMVwuQ+HztkXazkwfzMulJrFU0d7oE
	hHMdeeMGEGIrtqbVJoZlO0baceoMVP8T9ygPzWF0yGpS5s4bHSx38JYsZ1rH/w==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Sat, 26 Apr 2025 16:56:19 +0200
Subject: [PATCH v4 2/2] riscv: introduce asm/swab.h
MIME-Version: 1.0
Message-Id: <20250426-riscv-swab-v4-2-64201404a68c@iencinas.com>
References: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
In-Reply-To: <20250426-riscv-swab-v4-0-64201404a68c@iencinas.com>
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
X-CRM114-CacheID: sfid-20250426_075653_398940_06681359 
X-CRM114-Status: GOOD (  10.91  )
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
 arch/riscv/include/asm/swab.h | 62 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 62 insertions(+)

diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
new file mode 100644
index 000000000000..629f6164c1f3
--- /dev/null
+++ b/arch/riscv/include/asm/swab.h
@@ -0,0 +1,62 @@
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
+#define ARCH_SWAB(size, value)						\
+({									\
+	unsigned long x = value;					\
+									\
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {            \
+		asm volatile (".option push\n"				\
+			      ".option arch,+zbb\n"			\
+			      "rev8 %0, %1\n"				\
+			      ".option pop\n"				\
+			      : "=r" (x) : "r" (x));			\
+		x = x >> (BITS_PER_LONG - size);			\
+	} else {                                                        \
+		x = ___constant_swab##size(value);                      \
+	}								\
+	x;								\
+})
+
+static __always_inline __u16 __arch_swab16(__u16 value)
+{
+	return ARCH_SWAB(16, value);
+}
+
+static __always_inline __u32 __arch_swab32(__u32 value)
+{
+	return ARCH_SWAB(32, value);
+}
+
+#ifdef CONFIG_64BIT
+static __always_inline __u64 __arch_swab64(__u64 value)
+{
+	return ARCH_SWAB(64, value);
+}
+#else
+static __always_inline __u64 __arch_swab64(__u64 value)
+{
+	__u32 h = value >> 32;
+	__u32 l = value & ((1ULL << 32) - 1);
+
+	return ((__u64)(__arch_swab32(l)) << 32) | ((__u64)(__arch_swab32(h)));
+}
+#endif
+
+#define __arch_swab64 __arch_swab64
+#define __arch_swab32 __arch_swab32
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
