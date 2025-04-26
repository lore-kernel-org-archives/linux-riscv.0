Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 082F1C369CB
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Apr 2025 14:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ftgz2JzRjQw9m9wU0zEqOqGneA3/vcrjIj0SCUHsERg=; b=XfC407pN6Td0b5
	KYM/26nZdCtZoXF7BqZu9HgAUYU1/BzRKp/DHFNPBz8dEUe7Vj2gyCKty6bLiIb6qnx3sAIBV7brl
	OqyFnAMB+kZ2IielbjdThWhibhCLjL6MNZWeDaKAqPlbMoZPsVfXPXwttaMFVQK5d5EmDpVGVS+4M
	ggbeN0rO4MWyxpK7u37Hpf8mJL7c8jo/kow+1EOD7MmjYA2LANdI4UlsGHkGLU0cxMbfcLwHW11vM
	svb2W0n4Nfz6ledvaXjpQX0obc5SSfIghyTMOZttO+QqsMkUmiB54mpiLD/9HVHkGxxVWJLFZemEk
	/TIw7Mt/DzD15Ba9zRdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxR-00000002BZX-2gvR;
	Sat, 26 Apr 2025 14:56:45 +0000
Received: from out-178.mta1.migadu.com ([95.215.58.178])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8gxO-00000002BZ3-3ywF
	for linux-riscv@lists.infradead.org;
	Sat, 26 Apr 2025 14:56:44 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1745679398;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=T3D2Wq7EVGu9ukjexMYuq8e+jDjRLdPow92yjOGXrYg=;
	b=X6B2J3t5QVaUwP7jK9sXf5HGgOifbaWiOZg7lIwgwDBLFPRYVgRamqlr5U8nc3JXmLJDg9
	pvIfOWv387GbCj1rEYzJQhlCqtjAxKhV5yg6gW4rJ6Ez6ct8uUf0QNF5l9vlKVVsJnV5ou
	k17pnrDQs0cGuZ6dj80CFkBYSYvnqZpUM6fi+oKfAlbm3786HwXtb416wIhHOY9ggXETjv
	e3owhLIaP/k11iVwMF3+smUv77RheHhryHr9iQfJxHP/Qb+KShLMthcsdrpXD8bNBVij2M
	qm683yde833B5QC6WMFFbHFVoGEWsi8dO2mxzONqA7hZLVu8ZEuIRq0C891UDg==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Sat, 26 Apr 2025 16:56:18 +0200
Subject: [PATCH v4 1/2] include/uapi/linux/swab.h: move default
 implementation for swab macros into asm-generic
MIME-Version: 1.0
Message-Id: <20250426-riscv-swab-v4-1-64201404a68c@iencinas.com>
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
X-CRM114-CacheID: sfid-20250426_075643_509931_FAF035B4 
X-CRM114-Status: UNSURE (   9.79  )
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

Move the default byteswap implementation into asm-generic so that it can
be included from arch code.

This is required by RISC-V in order to have a fallback implementation
without duplicating it.

Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
 include/uapi/asm-generic/swab.h | 33 +++++++++++++++++++++++++++++++++
 include/uapi/linux/swab.h       | 33 +--------------------------------
 2 files changed, 34 insertions(+), 32 deletions(-)

diff --git a/include/uapi/asm-generic/swab.h b/include/uapi/asm-generic/swab.h
index f2da4e4fd4d1..232e81661dc5 100644
--- a/include/uapi/asm-generic/swab.h
+++ b/include/uapi/asm-generic/swab.h
@@ -3,6 +3,7 @@
 #define _ASM_GENERIC_SWAB_H
 
 #include <asm/bitsperlong.h>
+#include <linux/types.h>
 
 /*
  * 32 bit architectures typically (but not always) want to
@@ -16,4 +17,36 @@
 #endif
 #endif
 
+/*
+ * casts are necessary for constants, because we never know how for sure
+ * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
+ */
+#define ___constant_swab16(x) ((__u16)(				\
+	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
+	(((__u16)(x) & (__u16)0xff00U) >> 8)))
+
+#define ___constant_swab32(x) ((__u32)(				\
+	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
+	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
+	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
+	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
+
+#define ___constant_swab64(x) ((__u64)(				\
+	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
+	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
+	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
+	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
+	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
+	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
+	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
+	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
+
+#define ___constant_swahw32(x) ((__u32)(			\
+	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
+	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
+
+#define ___constant_swahb32(x) ((__u32)(			\
+	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
+	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
+
 #endif /* _ASM_GENERIC_SWAB_H */
diff --git a/include/uapi/linux/swab.h b/include/uapi/linux/swab.h
index 01717181339e..ca808c492996 100644
--- a/include/uapi/linux/swab.h
+++ b/include/uapi/linux/swab.h
@@ -6,38 +6,7 @@
 #include <linux/stddef.h>
 #include <asm/bitsperlong.h>
 #include <asm/swab.h>
-
-/*
- * casts are necessary for constants, because we never know how for sure
- * how U/UL/ULL map to __u16, __u32, __u64. At least not in a portable way.
- */
-#define ___constant_swab16(x) ((__u16)(				\
-	(((__u16)(x) & (__u16)0x00ffU) << 8) |			\
-	(((__u16)(x) & (__u16)0xff00U) >> 8)))
-
-#define ___constant_swab32(x) ((__u32)(				\
-	(((__u32)(x) & (__u32)0x000000ffUL) << 24) |		\
-	(((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |		\
-	(((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |		\
-	(((__u32)(x) & (__u32)0xff000000UL) >> 24)))
-
-#define ___constant_swab64(x) ((__u64)(				\
-	(((__u64)(x) & (__u64)0x00000000000000ffULL) << 56) |	\
-	(((__u64)(x) & (__u64)0x000000000000ff00ULL) << 40) |	\
-	(((__u64)(x) & (__u64)0x0000000000ff0000ULL) << 24) |	\
-	(((__u64)(x) & (__u64)0x00000000ff000000ULL) <<  8) |	\
-	(((__u64)(x) & (__u64)0x000000ff00000000ULL) >>  8) |	\
-	(((__u64)(x) & (__u64)0x0000ff0000000000ULL) >> 24) |	\
-	(((__u64)(x) & (__u64)0x00ff000000000000ULL) >> 40) |	\
-	(((__u64)(x) & (__u64)0xff00000000000000ULL) >> 56)))
-
-#define ___constant_swahw32(x) ((__u32)(			\
-	(((__u32)(x) & (__u32)0x0000ffffUL) << 16) |		\
-	(((__u32)(x) & (__u32)0xffff0000UL) >> 16)))
-
-#define ___constant_swahb32(x) ((__u32)(			\
-	(((__u32)(x) & (__u32)0x00ff00ffUL) << 8) |		\
-	(((__u32)(x) & (__u32)0xff00ff00UL) >> 8)))
+#include <asm-generic/swab.h>
 
 /*
  * Implement the following as inlines, but define the interface using

-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
