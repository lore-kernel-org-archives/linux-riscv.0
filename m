Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 840DCCA0EC2
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wIG4tmYPQOqAJLiwKpSHbYfZJ2SQHchBYPHbowPqSdg=; b=pvpKtZQ9zkZL52
	EuGUl5CaIC4C7aVvsYro9BAdIaLJR2odegtA7dMLuP0AsM9ihs8Y44UJ79CH7r0QBVvsuBZxYJdQZ
	2BWHJ/DOcS5GlZM6Hs8GcMyg1zIHuJB+xD+ycz31cDbXunILmkAYQX0GhJ82Wk3pdk4pAMTOLkY4F
	mhkZfQQP58ELevYcav2G+OQeRHgKxyQodjH8IQPcFv9tE+yg5mhCIInjxUmEJXbJnWSSsW/K+ARbw
	64aMh8mVu55NbPoAEaTVONHny7EAKWX5XI5yN9p2mjbRxaj9z0d+dJ1NzpnRvqNXtVBAqjLQ4JFEM
	MGG1dvzv9Ukb7yKrWWKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKT-0000000B0t7-3Hrm;
	Mon, 04 Aug 2025 16:46:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIM-0000000Azx6-2vpB
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 3517F45D64;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03BABC4CEFC;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=f1BJyviPYJxx8kFp/yukIUneK3tevM8t3j60E+6mJ1Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iCRKQ61mm01MZTvc3CPPe2Ki/UrPAJKulntT266Ebe8TeWDAN/PSv0m32mZuiBkpN
	 lk/deOYVzRLtSp7i6p4G7JOZzGDwuaAryUY11pGGbT30Ubny4bRA9VoK9foPrUhkFy
	 5Kdb9YBAUZfg0XipfrZDkRGYNiY8gnoYygkru433UuRkZYLKddHKgD3V1i3NRUr65E
	 jI3qDVxgAjgs0faGOdEZKxTlRUMVWRKKtbD/zPFJkkQmhZoOks1gC8mF1Wrrb6/rxq
	 Brmye/Z8DZwW8aMN1Lsr/FFUXXIYCbg+wC0d/XKLVlJHJdrQIxU0buKqimdXSNKiTB
	 sP5NLdQ1qXfMw==
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
Subject: [PATCH 03/17] csky: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:43:59 -0700
Message-Id: <20250804164417.1612371-3-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2307; i=kees@kernel.org; h=from:subject; bh=f1BJyviPYJxx8kFp/yukIUneK3tevM8t3j60E+6mJ1Y=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkf4pKfxelzOuX/uzqPPOxs0l05ZFhCiyao9Jeqci 3ziSXXxjlIWBjEuBlkxRZYgO/c4F4+37eHucxVh5rAygQxh4OIUgIks2MXIsEItKTpFNdpgi2AC T4VsWqPxkidZFV7pHLJyKvtDK1pbGBmmVyyW697n81XsnYVwT1DQGWaXqglTVk1a8WJH3VlBbyE GAA==
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094418_873790_B0B1F841 
X-CRM114-Status: GOOD (  11.51  )
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

Add missing __attribute_const__ annotations to C-SKY's implementations of
ffs(), __ffs(), fls(), and __fls() functions. These are pure mathematical
functions that always return the same result for the same input with no
side effects, making them eligible for compiler optimization.

Build tested ARCH=csky defconfig with GCC csky-linux 15.1.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/csky/include/asm/bitops.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/csky/include/asm/bitops.h b/arch/csky/include/asm/bitops.h
index 72e1b2aa29a0..80d67eee6e86 100644
--- a/arch/csky/include/asm/bitops.h
+++ b/arch/csky/include/asm/bitops.h
@@ -9,7 +9,7 @@
 /*
  * asm-generic/bitops/ffs.h
  */
-static inline int ffs(int x)
+static inline __attribute_const__ int ffs(int x)
 {
 	if (!x)
 		return 0;
@@ -26,7 +26,7 @@ static inline int ffs(int x)
 /*
  * asm-generic/bitops/__ffs.h
  */
-static __always_inline unsigned long __ffs(unsigned long x)
+static __always_inline __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	asm volatile (
 		"brev %0\n"
@@ -39,7 +39,7 @@ static __always_inline unsigned long __ffs(unsigned long x)
 /*
  * asm-generic/bitops/fls.h
  */
-static __always_inline int fls(unsigned int x)
+static __always_inline __attribute_const__ int fls(unsigned int x)
 {
 	asm volatile(
 		"ff1 %0\n"
@@ -52,7 +52,7 @@ static __always_inline int fls(unsigned int x)
 /*
  * asm-generic/bitops/__fls.h
  */
-static __always_inline unsigned long __fls(unsigned long x)
+static __always_inline __attribute_const__ unsigned long __fls(unsigned long x)
 {
 	return fls(x) - 1;
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
