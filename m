Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C956C35FFA
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 21:10:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Q9GOT+dzOxP18CDSKnP4B4v5bvIaz55UwRtUjFCMAXI=; b=mv9iHAOEOt87Nl
	nZMlSE3MbO6LfnfowW3zkalnn3fmH+RI06VISlHt/t/1T7+QCBTlMfvDVSG3Dv1VnDHApmVqu4kTd
	yUiiVXLiYgxxo3FxVDhaxDFpJ4JMWtJtOm4rPfUnSUOr9dJPUDmx0sQT+O7epHHsQz0kzxUdivQ8u
	As2UNUxiveRdUisC8v1We+N9pnHCILj6qe96V2Rd3A+YHM0osJ52DHNMgTHE8iY0BDSexNyhdwyPz
	wL6tsZjRbZYuyRmACJh4JuRF/j4Cl0lhWUaZnoWn5p8Rhbh1EfrYle9+wHFGUAib/Rm59z2xjmyzB
	+Fl/rhRJUD/a/Pb8px4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0g4-0000000A7HI-2WpD;
	Wed, 19 Mar 2025 21:10:16 +0000
Received: from out-182.mta1.migadu.com ([95.215.58.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tv0fz-0000000A7ER-3Hwv
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 21:10:13 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742418608;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Z50bW4uP9y2NKyrA9FP3XB/KfgBiP1prO7EaYYpM7k=;
	b=FS5rfi6eUGa/2hpZla7vnwITZrOXs+XRdMr6mlvKgJNk6Qr44UPCas73LB4AcuXWld+pW/
	cp2JPl5Oa+q8yXmOif+e5ckr2qqvvtwhyDlEUAakiy8GhLiNu0n4aiZYZ5DLoVUH89QO++
	HJKsd3Z7Tb+GVk+ri/QsrfN4iFusXN5hEjEFiBOTS/9KsWJC5amy9mwxm0t6NTjdDCJXhV
	ByOcT9GAKgvTuKNUGscSqUapyddmwmSa7TlMw1SPSvvEdKH3LU54peCmTlON0CwjrluyEX
	pKreqAzF7js4T9HI5VSdxHyVc1idbvf+aWHGLv/sreortH8410YYlIAjHCSX+w==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Wed, 19 Mar 2025 22:09:46 +0100
Subject: [PATCH v2 2/2] riscv: introduce asm/swab.h
MIME-Version: 1.0
Message-Id: <20250319-riscv-swab-v2-2-d53b6d6ab915@iencinas.com>
References: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
In-Reply-To: <20250319-riscv-swab-v2-0-d53b6d6ab915@iencinas.com>
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
X-CRM114-CacheID: sfid-20250319_141011_973408_916A5BB8 
X-CRM114-Status: UNSURE (   9.97  )
X-CRM114-Notice: Please train this message.
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
 arch/riscv/include/asm/swab.h | 48 +++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/include/asm/swab.h b/arch/riscv/include/asm/swab.h
new file mode 100644
index 0000000000000000000000000000000000000000..6cb40e8108c956dd445746d59bc1dd0a53475212
--- /dev/null
+++ b/arch/riscv/include/asm/swab.h
@@ -0,0 +1,48 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_SWAB_H
+#define _ASM_RISCV_SWAB_H
+
+#include <linux/types.h>
+#include <linux/compiler.h>
+#include <asm/alternative-macros.h>
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
+	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,			\
+			     RISCV_ISA_EXT_ZBB, 1)			\
+			     :::: legacy);				\
+									\
+	asm volatile (".option push\n"					\
+		      ".option arch,+zbb\n"				\
+		      "rev8 %0, %1\n"					\
+		      ".option pop\n"					\
+		      : "=r" (x) : "r" (x));				\
+									\
+	return x >> (BITS_PER_LONG - size);				\
+									\
+legacy:									\
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
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
