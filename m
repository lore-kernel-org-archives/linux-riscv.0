Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88A8EC87FCF
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Aug 2025 16:46:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=94oqNweEVfAR9+td5lGBiwomE1Z40p861cIQ3ePG8DQ=; b=1r6ZYi/jCzonM+
	ivSuvzpY+FwkKqGaLkT14/ONrkja3xu8jKyu8XrPZAMHvddQgWyDgVBKSyU8i8k4NISOIZwzT+8Fi
	Jfi3eQk2dGM3XKcDK1Oo69LibYlRAI5JZ9OL3nOARnVvOYJxngVbiY9Vn6md6TEgLemV5hcz1x8gf
	eyHxRQJ/tsvH7ne5E+s6wX/Z50Y+06yNqE4UP6FynHQiJxkfUW1XolOTNgO85Rf3936+6nLpyICjX
	YFYAbzIl8S2oNmqH35qusLj5tqzwcS+sZfWDa2ff3GwxdQ6Deri2sQjVxJMQ1+vvxi+EtNGw9iqow
	pAFd08XbhZO/DgPjX+Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyKX-0000000B0ww-0xf9;
	Mon, 04 Aug 2025 16:46:33 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiyIN-0000000Azyx-2XKS
	for linux-riscv@lists.infradead.org;
	Mon, 04 Aug 2025 16:44:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B0C40A55A54;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 52B7BC4AF0C;
	Mon,  4 Aug 2025 16:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754325858;
	bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=o0wr+SOQrJ8Pb1HYn23m4nYGmmpz1RDCR0ieEPGyaoZStf9uxSKkOeJ+ht08w8Btg
	 Mk16Oj5DcqMKz/MiKi8tHWrMk13bxl6FmvWQLkLC9rcpfJZE6u8Pgf6DcugDDacw/n
	 Gt1m4MotOXAbpwe1NUuHL8wW+JPWgcHeXq2UruCVO8Nxp4xDsYHY6mP6CA6UJep8Gi
	 4v4XsgZvc5nHH0fLusjDc2D7xmP4pPA5nbCjn3spw2vXn4Kuax1rC1vilgHcaGL1u5
	 +BXbkvga5yhWQsopUPn8srq6zLvG798XxT0hdKDu652cFd9q5dF1ACGM650jF2MJx2
	 QaBmx5wtzTV7A==
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
Subject: [PATCH 09/17] riscv: Add __attribute_const__ to ffs()-family implementations
Date: Mon,  4 Aug 2025 09:44:05 -0700
Message-Id: <20250804164417.1612371-9-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250804163910.work.929-kees@kernel.org>
References: <20250804163910.work.929-kees@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467; i=kees@kernel.org; h=from:subject; bh=g9NWGXns36jX28IL85SFtHFGu7oIjU0Ua5dSHJdI5kc=; b=owGbwMvMwCVmps19z/KJym7G02pJDBkTHkemZM9qPHqPbYffitvpiduXcnN//Wz59H7Src5ro iuN53c7dZSyMIhxMciKKbIE2bnHuXi8bQ93n6sIM4eVCWQIAxenAEzk8wJGhkbFJarr3qZFnVMK ivFlq+MtkmgR9Xud8jxCoklDa6WcBcNf2d0LPUQOnJ4w6cfNbUl3P7lbnX7u8W9y56Vbs2y2ORi cYgEA
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_094419_777215_DB505BD2 
X-CRM114-Status: GOOD (  10.46  )
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

Add missing __attribute_const__ annotations to RISC-V's implementations of
variable__ffs(), variable__fls(), and variable_ffs() functions. These are pure
mathematical functions that always return the same result for the same
input with no side effects, making them eligible for compiler optimization.

Build tested ARCH=riscv defconfig with GCC riscv64-linux-gnu 14.2.0.

Link: https://github.com/KSPP/linux/issues/364 [1]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/include/asm/bitops.h | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index d59310f74c2b..77880677b06e 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -45,7 +45,7 @@
 #error "Unexpected BITS_PER_LONG"
 #endif
 
-static __always_inline unsigned long variable__ffs(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__ffs(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -74,7 +74,7 @@ static __always_inline unsigned long variable__ffs(unsigned long word)
 	 (unsigned long)__builtin_ctzl(word) :	\
 	 variable__ffs(word))
 
-static __always_inline unsigned long variable__fls(unsigned long word)
+static __always_inline __attribute_const__ unsigned long variable__fls(unsigned long word)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
@@ -103,7 +103,7 @@ static __always_inline unsigned long variable__fls(unsigned long word)
 	 (unsigned long)(BITS_PER_LONG - 1 - __builtin_clzl(word)) :	\
 	 variable__fls(word))
 
-static __always_inline int variable_ffs(int x)
+static __always_inline __attribute_const__ int variable_ffs(int x)
 {
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
