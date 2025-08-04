Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1684C87FDA
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=coDdddmXPsdHsGbe97O/tOFpPq+Mq5s/Y8mdNU72WWM=; b=lXwbBktR9e2CWb
	fHBjLq5wLKsSwEQe3EUGUmEzsR0pwoTMbSmRlJYTXTCXJSD1ezOiPFtoJAQHOGpeRkQdm1Ooxvwf1
	LcGPTrNG3SKIUlweIWBePucauFZXZ5kWkE5T38lcB1VfH6d7tdyh+wlVxCWDgxpQZWu0X1Q0Bf0Lu
	IfXIOu/EbpsEPjstloe+2Yn02O4dfB4gYZKKz0HKnnBZ6hr1DnxgvkIABJcTIAK5lUPdO3pdgOLt0
	Szrr2UXL18lyLI4VnAPja56DwP3O71aVJF63N7uAF1Icj/88G0ZV6Y+D2xCW7PiYu8qosspewfH3i
	PPjbS6mV6n9WKr2Za7TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKc-0000000B14l-0ZGa;
	Mon, 04 Aug 2025 16:46:38 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyId-0000000B09X-3DId
	for linux-riscv@bombadil.infradead.org;
	Mon, 04 Aug 2025 16:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=4DzcTI7U3A6UKOU2FYtNcPE5SCReEdDDUBLV3ejEM4M=; b=ma5rZN33EVpe/zp48be4TTg7cp
	KSyNwTYRhSBcpSAv9ShLiqZiHc3WgzpEODu8w0yzX8QlDig3EZwMorKUBI1pIUvgWARQG9FyxEzDe
	FSsBv/KpdaNhboAYC4pfSBlkj8k0W7KSZ6kkr847SvrDsH357SeXan8IzMryZLGICsobGxqbsl7AS
	ZnKaz4laOoRGL3kvyky1McIKC0Dn9ojLzlrOpMY/0xk56fW0meeZw/aGe9pFDHDbnKzjndwZQU9w1
	SjR5Bq2iRALaJ8k2YCflMcOZ4zf760QsdSx+4zzeOu3oJH4avlEvUQl+EyPHLw5/hCyeqzHae9gGp
	IlkAHrEA==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIa-0000000DsSX-05zH
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D5B615C5C4F;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CA43C4AF09;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=Lvi+SOjPyvnPy8ciTq59tLtKnNheCboKdQcwuoaKmUM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ctp3G9AgiSCKLRp3GaS8h8tJ0qd2GiWi29AWYoW9OphEKR9uxRpx+tVuZ37fpfpsL
	 IIiqsW+BqW+QyimiyTxqwluC3gBj0itLpMcnGvSkUJW+Jtvtu0G8zJm4JEpeAv07ho
	 5p6x/9qjLA5BPlYqTiJ+ItnXGdxvcaVtNEU6C921kzwAdklU0oJOrywzY/43+qATyc
	 qkCMHpUPQU7oHixjqmmc6E/rz2akCtU5V8u3ok+s8qmQdwYEwufDL+M7FaTtHByKcC
	 AuS5qqztdOQXGV87h2P9OWbRhnDlzJPeEZsfRqWu0o2aRbkYyxMYY+FjPb1Q+fYa9A
	 LXmNT4G4CjwRQ==
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
Subject: [PATCH 14/17] s390: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:10 -0700
Message-Id: <20250804164417.1612371-14-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2996; i=kees@kernel.org; h=from:subject; bh=Lvi+SOjPyvnPy8ciTq59tLtKnNheCboKdQcwuoaKmUM=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkdP80i3EZa0WqNV8fMHixWbmEZHeZVc662+q3+e/ xLYYFLfUcrCIMbFICumyBJk5x7n4vG2Pdx9riLMHFYmkCEMXJwCMBGxaIa/knsDtxWE2YZe7I7U 3WXadmPtRbMlWjOOFS4Pyt5xp698FyPDCXntuf8OrPNQnv7aqHOTUcK6qfbFbx5JC57KYzE7e+8 jOwA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_174432_525598_32265840 
X-CRM114-Status: GOOD (  12.41  )
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

Add missing __attribute_const__ annotations to S390's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=s390 defconfig with GCC s390x-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/s390/include/asm/bitops.h | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/include/asm/bitops.h b/arch/s390/include/asm/bitops.h
index a5ca0a947691..fbcc3e1cc776 100644
--- a/arch/s390/include/asm/bitops.h
+++ b/arch/s390/include/asm/bitops.h
@@ -179,7 +179,7 @@ static inline unsigned char __flogr(unsigned long word)
  *
  * Undefined if no bit exists, so code should check against 0 first.
  */
-static inline unsigned long __ffs(unsigned long word)
+static inline __attribute_const__ unsigned long __ffs(unsigned long word)
 {
 	return __flogr(-word & word) ^ (BITS_PER_LONG - 1);
 }
@@ -191,7 +191,7 @@ static inline unsigned long __ffs(unsigned long word)
  * This is defined the same way as the libc and
  * compiler builtin ffs routines (man ffs).
  */
-static inline int ffs(int word)
+static inline __attribute_const__ int ffs(int word)
 {
 	unsigned long mask = 2 * BITS_PER_LONG - 1;
 	unsigned int val = (unsigned int)word;
@@ -205,7 +205,7 @@ static inline int ffs(int word)
  *
  * Undefined if no set bit exists, so code should check against 0 first.
  */
-static inline unsigned long __fls(unsigned long word)
+static inline __attribute_const__ unsigned long __fls(unsigned long word)
 {
 	return __flogr(word) ^ (BITS_PER_LONG - 1);
 }
@@ -221,7 +221,7 @@ static inline unsigned long __fls(unsigned long word)
  * set bit if value is nonzero. The last (most significant) bit is
  * at position 64.
  */
-static inline int fls64(unsigned long word)
+static inline __attribute_const__ int fls64(unsigned long word)
 {
 	unsigned long mask = 2 * BITS_PER_LONG - 1;
 
@@ -235,7 +235,7 @@ static inline int fls64(unsigned long word)
  * This is defined the same way as ffs.
  * Note fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
-static inline int fls(unsigned int word)
+static inline __attribute_const__ int fls(unsigned int word)
 {
 	return fls64(word);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
