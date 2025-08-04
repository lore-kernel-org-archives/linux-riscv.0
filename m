Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C892DC87FCB
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+R5gYqp/bgaRdhPDJU7R+2y36E91uHnI3oR+Z5l8BtM=; b=Y9Ph6txAafqwIH
	UzfsloNwZS0wpqYP6FiZ88xxeg9oRAPzxONs6paWWgDqs/YU/BK748+H3euksN65lta03Rhafbegi
	8RexT+DALXcEHhRSVZ7eeD2qEZmR2RShCVlBtQKFsS5h14qb6uWadcQ52xARjrE6wqmjyqyYLlqPu
	XqgerWmalyQjee7PDmirsrR8YXvXhQXUpdHHXSPoDvVM+W9QQu7NIhetpJr+zpvw2C7jaMMytot/R
	q+Bb5soL1MkZ78WUiEbS7amu/a+s61cQ9F73Sn8OHc6PfYRZ4X0KtJdY4GM8XFZTsBPZkSpfxmTlK
	rgOr0H9hhCoox+kFenmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKR-0000000B0r0-3IJc;
	Mon, 04 Aug 2025 16:46:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIN-0000000B006-2qqB
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BD5A761139;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8802DC4CEFE;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=bi83DBSxTax3RYBhak54pajUvhtkEYIGQUxIvC9PE+I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bgcltgsyxoyf/pKF+Tj3hy+i0p+Uv1aCtnom71lmu6zgJmQHg1dJf8V/XnIlHC6pd
	 hAwD0iPYUVHXShTacAvArdMfxY2rrIc7kzQgBeVWZ45s4XF8e2w/jVyaR5nvULRC5+
	 sUciGGOA+pFzVwTxE0KvHX4IhxnVx3dJs4Wnd4ORleV95p6qSQhhsHcakorPshOjz5
	 iOP3HSpjTYkxiRvo64dk+KgzJK3zbqgu/qopxOBJFcbPZR48Q3Yi9RzBKlPO9/3p14
	 ix2M4vSFeoehIGIXuzlmpvsGAPVuJjjrj6bN9GUItM/Rzeuwwb8T1+GYCAcKq1BlZh
	 VR8QPX6SL2SsQ==
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
Subject: [PATCH 15/17] xtensa: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:11 -0700
Message-Id: <20250804164417.1612371-15-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2758; i=kees@kernel.org; h=from:subject; bh=bi83DBSxTax3RYBhak54pajUvhtkEYIGQUxIvC9PE+I=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkeb9bDx/Nw2R6PD5fZFAdkDyyrPvD+T8PfQGlEXi 7KDPivPdJSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEyklofhr0z6rA9SgTnRLP1d iyVVkrKvHem4/UN/SuIUQe4VwRMSyxn+6bhFap9w6BJ9Zbqp022VpEZv9/UHv08EpmQaNBTd/8H NBQA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

Add missing __attribute_const__ annotations to Xtensa's implementations
of ffs(), __ffs(), fls(), __fls(), ffz() functions. These are pure
mathematical functions that always return the same result for the
same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=xtensa defconfig with GCC xtensa-linux 15.1.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/xtensa/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/xtensa/include/asm/bitops.h b/arch/xtensa/include/asm/bitops.h
index e02ec5833389..f7390b6761e1 100644
--- a/arch/xtensa/include/asm/bitops.h
+++ b/arch/xtensa/include/asm/bitops.h
@@ -37,7 +37,7 @@ static inline unsigned long __cntlz (unsigned long x)
  * bit 0 is the LSB of addr; bit 32 is the LSB of (addr+1).
  */
 
-static inline int ffz(unsigned long x)
+static inline int __attribute_const__ ffz(unsigned long x)
 {
 	return 31 - __cntlz(~x & -~x);
 }
@@ -46,7 +46,7 @@ static inline int ffz(unsigned long x)
  * __ffs: Find first bit set in word. Return 0 for bit 0
  */
 
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	return 31 - __cntlz(x & -x);
 }
@@ -57,7 +57,7 @@ static inline unsigned long __ffs(unsigned long x)
  * differs in spirit from the above ffz (man ffs).
  */
 
-static inline int ffs(unsigned long x)
+static inline __attribute_const__ int ffs(unsigned long x)
 {
 	return 32 - __cntlz(x & -x);
 }
@@ -67,7 +67,7 @@ static inline int ffs(unsigned long x)
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static inline int fls (unsigned int x)
+static inline __attribute_const__ int fls (unsigned int x)
 {
 	return 32 - __cntlz(x);
 }
@@ -78,7 +78,7 @@ static inline int fls (unsigned int x)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static inline unsigned long __fls(unsigned long word)
+static inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	return 31 - __cntlz(word);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
