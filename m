Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7B9C87FD1
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2dnEB7BNVftgjzC7YAzszRRIkDOfWRhYqjQ/D3yLz7I=; b=aCi/tNFZ4Ef7GP
	bh6xjqNMmJmoCE7IizTRNJdsbaGynn3BP6csCffhmVEBSxJRuMtBcOTh3EUuWW0eDVnZlCVtRyQQC
	J+65xxrUqVtT+adh5b5aYYbdKGOZ4FnQGlRDRObisRHtu9mLZPnj1elxAp6g/dqQO9aIx1tbvLT97
	e0VjoQjOISZGzcjhny+QKfb905FfPep+Ocsk9aP11Zux5DYzmKgXruRynwWkz3pkmN1NakvkFRk9x
	MhW4CayGo7QS3bKI/H7CSrts8N9zKeTg5tBJYqPM04xsW2g2tFglVsj9JI8wrWkjAXGgw5Mht5uzY
	EGo9KdZemP2LPsCUF7nA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKa-0000000B12J-2ffS;
	Mon, 04 Aug 2025 16:46:36 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIP-0000000B029-2vmq
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CF5A45E8F;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 633B5C113D0;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ge6UnzC7RCLcQnB7l193lH28keaIzGG1YTTZUZMK4Velt+wX4iI+WLWhEq0f25glZ
	 EPQLcMekI7Qvor+gIO2PqW0/4OjdTkyLrHQ5EPHMRDAjBoA2HTeFoRsl6GXh/qJLgj
	 MF69H6fg2iDs2LL0gkx86SD4N/8EocNjtjMQgdHiqj44NY5Vqw8hA1wJB61jHXHHZm
	 v7W+8ZuG2nchNWjSRwa024Wv2ZapjnQQXpX6J88aI+CFwRDSUXs6ltLrZGcmXmcDWo
	 nS5iD0eGBf/ejiqGM9Qvn3UKnMrG6ib6iJFT4D42SgAa35HMf3R2+MzKIuOWsemar9
	 YnJC/kBSRhIUg==
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
Subject: [PATCH 13/17] parisc: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:09 -0700
Message-Id: <20250804164417.1612371-13-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2252; i=kees@kernel.org; h=from:subject; bh=nGrvLP+52DqmCHeke8Z62fxml8VqaHAPq3pxBvDMhbA=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkef/nFELezMN7cjNvMWx9sJHzw1i22t5cePF+sdU /Nld6080lHKwiDGxSArpsgSZOce5+Lxtj3cfa4izBxWJpAhDFycAjARL1mG/37Hr0ifUD5qKhpw fXet6D0J8bNfnog1bb1+l1/U9sh+7yBGhhm3b15IzvrjxfGP78CVyJl/F691fSu1dqHll4/JXsq 5jVwA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094421_831329_5E87B927 
X-CRM114-Status: GOOD (  11.47  )
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

Add missing __attribute_const__ annotations to PARISC's implementations of
ffs(), __ffs(), and fls() functions. These are pure mathematical functions
that always return the same result for the same input with no side effects,
making them eligible for compiler optimization.

Build tested ARCH=parisc defconfig with GCC hppa-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/parisc/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/parisc/include/asm/bitops.h b/arch/parisc/include/asm/bitops.h
index 0ec9cfc5131f..bd1280a8a5ec 100644
--- a/arch/parisc/include/asm/bitops.h
+++ b/arch/parisc/include/asm/bitops.h
@@ -123,7 +123,7 @@ static __inline__ int test_and_change_bit(int nr, volatile unsigned long * addr)
  * cycles for each mispredicted branch.
  */
 
-static __inline__ unsigned long __ffs(unsigned long x)
+static __inline__ __attribute_const__ unsigned long __ffs(unsigned long x)
 {
 	unsigned long ret;
 
@@ -161,7 +161,7 @@ static __inline__ unsigned long __ffs(unsigned long x)
  * This is defined the same way as the libc and compiler builtin
  * ffs routines, therefore differs in spirit from the above ffz (man ffs).
  */
-static __inline__ int ffs(int x)
+static __inline__ __attribute_const__ int ffs(int x)
 {
 	return x ? (__ffs((unsigned long)x) + 1) : 0;
 }
@@ -171,7 +171,7 @@ static __inline__ int ffs(int x)
  * fls(0) = 0, fls(1) = 1, fls(0x80000000) = 32.
  */
 
-static __inline__ int fls(unsigned int x)
+static __inline__ __attribute_const__ int fls(unsigned int x)
 {
 	int ret;
 	if (!x)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
