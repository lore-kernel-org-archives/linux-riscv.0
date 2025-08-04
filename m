Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4BA9CA0EC4
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0GjhuID79wXUhjwmLmSLLSN/AaTvOl1QF/TxFWk4ckQ=; b=1OHYIksh3Pxby9
	9uB2XzM6VdazE+ZrNeo3ELzD7CJwU8/MyiLYEOqIeVMDv4dR5kbdbv8sBrDbm2FBb7Yc2MG7mmt5U
	38vyvBjoGPaThV61ojDCuHhFPIKSjiQqwnv+MaynSPL6yyBmzqiO9YuifSnnIaRB/I2mRCyCgwLMu
	T4xVj+A2cCusaz5lp7m6OSlehtJAUD6WcXRCQSHOBUX70odunsN61UkZ36FsnGonCFhjfp+USwIK/
	HKrcnAaVDmtzvVLn6vD1wKqJalumKfNUNo/iR1aQAxozA1kXF3Vyx+KWen/MisYSB6z95FmMZg00t
	blp3m8MuU5/ozPqjrgtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKU-0000000B0tc-1guo;
	Mon, 04 Aug 2025 16:46:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIM-0000000AzxX-3yee
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5C1BC45E3C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B233C116D0;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=guvy9CFz34iD95VNx9U+nwzbEodayv2bp++BoAV7Co8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m7b8ufEvWKC7zComlRM7+u4PtyfPEWo/yjTdeYkDlJsbVyvwHAovh35m4D3uuSVye
	 gHJqZVdqWNTwtanGfltzgxGVOtOstQHMiweKxm56tiOvOzLvR44JZYdUL8B5L1htI+
	 DGDKHooxzEKRzUaDUXP7yWLGj/TWeVyVHYMQzEghCsXqPhdeduMIDPn11gl9swH7a+
	 HEINXXtYK9TpmhXZNMHyNCftjjwDDURfQsMuyzWDTs0oBX4SY+zy7mK7Jgke/vDeg3
	 U7w0bqTMAqEajLuIcJFHYSbSneQKkmY/yNhbGerF4hTMOq3OpZ4VDdx/o1lJJPBczx
	 s7evE8jRDh0cw==
From: Kees Cook <kees@kernel.org>
To: linux-arch@vger.kernel.org
Cc: Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org,
	x86@kernel.org,
	linux-alpha@vger.kernel.org,
	linux-csky@vger.kernel.org,
	linux-hexagon@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linux-mips@vger.kernel.org,
	linux-openrisc@vger.kernel.org,
	linux-parisc@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-sh@vger.kernel.org,
	sparclinux@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-hardening@vger.kernel.org
Subject: [PATCH 06/17] sh: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:02 -0700
Message-Id: <20250804164417.1612371-6-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=kees@kernel.org; h=from:subject; bh=guvy9CFz34iD95VNx9U+nwzbEodayv2bp++BoAV7Co8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkfmP9t48PLcGkVp7XKfZ3/uTi7Rm+jids/QLcX+v ovoKoOHHaUsDGJcDLJiiixBdu5xLh5v28Pd5yrCzGFlAhnCwMUpABNRZ2T4Z1zh+zj++LvqmA3l LWq5U/2rD36e5VuY8uHfOu9mze9iixn+5z/fPemPk/mc5Lc7HA/9vMSTdJhT49XaZfdm+L/0SFt yjQUA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094419_081288_BB5EC66C 
X-CRM114-Status: GOOD (  11.78  )
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

While tracking down a problem where constant expressions used by
BUILD_BUG_ON() suddenly stopped working[1], we found that an added static
initializer was convincing the compiler that it couldn't track the state
of the prior statically initialized value. Tracing this down found that
ffs() was used in the initializer macro, but since it wasn't marked with
__attribute__const__, the compiler had to assume the function might
change variable states as a side-effect (which is not true for ffs(),
which provides deterministic math results).

Add missing __attribute_const__ annotations to SH's implementations of
__ffs() and ffz() functions. These are pure mathematical functions that
always return the same result for the same input with no side effects,
making them eligible for compiler optimization.

Build tested ARCH=sh defconfig with GCC sh4-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/sh/include/asm/bitops.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/sh/include/asm/bitops.h b/arch/sh/include/asm/bitops.h
index 10ceb0d6b5a9..aba3aa96a50e 100644
--- a/arch/sh/include/asm/bitops.h
+++ b/arch/sh/include/asm/bitops.h
@@ -24,7 +24,7 @@
 #include <asm-generic/bitops/non-atomic.h>
 #endif
 
-static inline unsigned long ffz(unsigned long word)
+static inline unsigned long __attribute_const__ ffz(unsigned long word)
 {
 	unsigned long result;
 
@@ -44,7 +44,7 @@ static inline unsigned long ffz(unsigned long word)
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	unsigned long result;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
