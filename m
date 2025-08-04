Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B90F9C87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4xffT1ZwVuam5b2raDSRw5M8IGc3E9NjzY8xOsLprJ0=; b=o2WdFRPUrBpdRk
	nRFCvQceyKPYYjVUSWqiIcmEAFhcyCZo2/yUHYIVkJNmtLDFpNkgCP94HRSlic0D5mKQHojvvD7Ds
	Rsx6ETcU+xqPDRgCyeBEpgAC1dQzo9IdPYeEZjdOdvHWh85Y1L/XqQL2erB2zLWJtTkKoUg43qH0d
	mVRSJ1Puc/MLjkX2kc1AIIc2pWNygh3z32F8J1XJhpR96W1dsOPDLm8rZwCBb36CC9OzYUJL9pfR6
	abwlhu13NMBLQE8esYQGVA+DExgNVTOVW9ucpZuD/Ih8ZA/NcqyU7Ga9LD+fk34afuAUL501fwm0j
	7U43TJ+/MzikZGgplkNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKQ-0000000B0q1-48jd;
	Mon, 04 Aug 2025 16:46:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIN-0000000AzzU-29LP
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id ADD4861135;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 51806C4CEF6;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=9IKARCNAQ4YGYQ7SSuIzeAqk93nxRP2HUWwtsuviko8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KkGJbQNvVuFgTNWRpqKUhWNVLN6UmFEjJz8RkC64Hx/hCKoEdADxAMt9NxqAzpnUi
	 8t5Zz4Q9j49fJ5VOfghaKYwVbLvdfiXYWH4ixk7Rm1FwlQ7dhOuEKDCHwl5MuTZSqJ
	 z7G1DMLhD1Qs/8+RIjmgRrDdS2xUYLzvRauKo9huR/eh9m/r8JJ/iqLQytoZpRK9dN
	 k3yMzLg211OPOsbt2kbnW+ZoGC9BJQNQ9XlEfg/XoQuuOmHiScT1RpqJWdR2Ar+NBQ
	 AbTC3JkAe5B901HkVoP3G2lFY7RSFn81iVArXPv55mDzcrJ5y2K1o1m8Pnw6wrmGJr
	 74IU4NrAevjxQ==
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
Subject: [PATCH 11/17] m68k: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:07 -0700
Message-Id: <20250804164417.1612371-11-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3218; i=kees@kernel.org; h=from:subject; bh=9IKARCNAQ4YGYQ7SSuIzeAqk93nxRP2HUWwtsuviko8=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkcZTyv6Wnb80X1b3/rkW+dXCf9+ZaQptMfMsM6vz ndp1+q6jlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgInYbWRkeP5KhYM7b9Xyqrr3 z85yOl8+Z7iH46OtRd3CiL7lLBmXexj+aZ73f5a+LuKbjLj3Kt/zDy9erdv/eeHmDLkmidArC13 kGQE=
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

Add missing __attribute_const__ annotations to M68K's implementations
of ffs(), __ffs(), fls(), __fls(), and ffz() functions. These are
pure mathematical functions that always return the same result for
the same input with no side effects, making them eligible for compiler
optimization.

Build tested ARCH=m68k defconfig with GCC m68k-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/m68k/include/asm/bitops.h | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/arch/m68k/include/asm/bitops.h b/arch/m68k/include/asm/bitops.h
index 14c64a6f1217..139ec9289ff2 100644
--- a/arch/m68k/include/asm/bitops.h
+++ b/arch/m68k/include/asm/bitops.h
@@ -465,7 +465,7 @@ static inline int find_next_bit(const unsigned long *vaddr, int size,
  * ffz = Find First Zero in word. Undefined if no zero exists,
  * so code should check against ~0UL first..
  */
-static inline unsigned long ffz(unsigned long word)
+static inline unsigned long __attribute_const__ ffz(unsigned long word)
 {
 	int res;
 
@@ -488,7 +488,7 @@ static inline unsigned long ffz(unsigned long word)
  */
 #if (defined(__mcfisaaplus__) || defined(__mcfisac__)) && \
 	!defined(CONFIG_M68000)
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	__asm__ __volatile__ ("bitrev %0; ff1 %0"
 		: "=d" (x)
@@ -496,7 +496,7 @@ static inline unsigned long __ffs(unsigned long x)
 	return x;
 }
 
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	if (!x)
 		return 0;
@@ -518,7 +518,7 @@ static inline int ffs(int x)
  *	the libc and compiler builtin ffs routines, therefore
  *	differs in spirit from the above ffz (man ffs).
  */
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	int cnt;
 
@@ -528,7 +528,7 @@ static inline int ffs(int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __ffs(unsigned long x)
+static inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	return ffs(x) - 1;
 }
@@ -536,7 +536,7 @@ static inline unsigned long __ffs(unsigned long x)
 /*
  *	fls: find last bit set.
  */
-static inline int fls(unsigned int x)
+static inline __attribute_const__ int fls(unsigned int x)
 {
 	int cnt;
 
@@ -546,7 +546,7 @@ static inline int fls(unsigned int x)
 	return 32 - cnt;
 }
 
-static inline unsigned long __fls(unsigned long x)
+static inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	return fls(x) - 1;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
