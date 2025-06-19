Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0638C7115B
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 21:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ArUutO4cxlbK/2Aj6Vo7ZOOuKKXaRZbErPrORs5sdYg=; b=kNLeaXVHIg9Jih
	78V78GAPHbKMPF36sIfpWrrIwStkY+wKxiE4fA13kjq67aoI04K9kmAkcpL98Tu6YAFlt9BB9Y7qA
	HZmzGFeW5OInSVB58eH01ckTKZJ3dzYVL/18kdVI2n/SWiSjPXUuAlQaIo18Ohkh1Xtrp1q7ylqmN
	8iEY0PdUvLGuUZRq57yCII4zReQWOwDW6xn3yzC0oa8jcvFtLOVyn8AfJAmMkIbb+155BKjEKcQ+2
	oNhSyuqCIyyGP+YGLafoQBsqvZ6en44k68+gil94PVV41XV6+foytkrHU8bgljfBWmM3CDX3wLFZ5
	TLJFhntQFJ5nPslkARHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSMrj-0000000EIvl-12Fi;
	Thu, 19 Jun 2025 21:32:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpu-0000000E56b-16o2;
	Thu, 19 Jun 2025 19:22:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 73C88A54752;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E70CEC4CEEA;
	Thu, 19 Jun 2025 19:22:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360929;
	bh=3DyeUW/WI822CziP8LflvlPGRnidGfXtAs+o4+U8YL0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CkfubopaY6VurlxxTDeKt8EuEdcI0jI8Ltmpks0RGHy/xxpDowfcQFmgSd56Dojjl
	 8GXxHra63v7nHHvUxy5f9ZrcMNoQzOhVQW42dqFNm775PqtCJx02qBK6gIVVFTNygI
	 l9uYbgRMBSgv0j9EzGm/JjC2KNcgiaQEngRGSKXkudVKWSI8Mi3c94FQ2hmZZgK5Vw
	 3rKGG8cLGgKOzR4GHC/Q1KDQ56GrawR15ExRtAkzK7JlISUNzUrdgWpXQ1sFulToOQ
	 faEt5eEfuWqmFWmpwIynw0lVykla8gG7dwdRNImsH3tEbqP474rmedKVJoMjBMNlhK
	 muEWsRTZZp9yA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 6/9] lib/crypto: s390: move arch/s390/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:05 -0700
Message-ID: <20250619191908.134235-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_122210_431520_BD9DADF8 
X-CRM114-Status: GOOD (  13.51  )
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

From: Eric Biggers <ebiggers@google.com>

Move the contents of arch/s390/lib/crypto/ into lib/crypto/s390/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/s390/lib/Makefile                                  | 1 -
 lib/crypto/Kconfig                                      | 2 +-
 lib/crypto/Makefile                                     | 1 +
 {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig       | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/Makefile      | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h | 0
 {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c      | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Kconfig (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/Makefile (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-glue.c (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.S (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/chacha-s390.h (100%)
 rename {arch/s390/lib/crypto => lib/crypto/s390}/sha256.c (100%)

diff --git a/arch/s390/lib/Makefile b/arch/s390/lib/Makefile
index cd35cdbfa8713..271a1c407121c 100644
--- a/arch/s390/lib/Makefile
+++ b/arch/s390/lib/Makefile
@@ -1,11 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for s390-specific library files..
 #
 
-obj-y += crypto/
 lib-y += delay.o string.o uaccess.o find.o spinlock.o tishift.o
 lib-y += csum-partial.o
 obj-y += mem.o xor.o
 lib-$(CONFIG_KPROBES) += probes.o
 lib-$(CONFIG_UPROBES) += probes.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a2b58ca2df0cc..278b7ef5ec4f9 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -203,11 +203,11 @@ source "lib/crypto/powerpc/Kconfig"
 endif
 if RISCV
 source "lib/crypto/riscv/Kconfig"
 endif
 if S390
-source "arch/s390/lib/crypto/Kconfig"
+source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "arch/sparc/lib/crypto/Kconfig"
 endif
 if X86
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 0fe9200a031d6..4cda1f5cd21d4 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -106,5 +106,6 @@ libsm3-y					:= sm3.o
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
+obj-$(CONFIG_S390) += s390/
diff --git a/arch/s390/lib/crypto/Kconfig b/lib/crypto/s390/Kconfig
similarity index 100%
rename from arch/s390/lib/crypto/Kconfig
rename to lib/crypto/s390/Kconfig
diff --git a/arch/s390/lib/crypto/Makefile b/lib/crypto/s390/Makefile
similarity index 100%
rename from arch/s390/lib/crypto/Makefile
rename to lib/crypto/s390/Makefile
diff --git a/arch/s390/lib/crypto/chacha-glue.c b/lib/crypto/s390/chacha-glue.c
similarity index 100%
rename from arch/s390/lib/crypto/chacha-glue.c
rename to lib/crypto/s390/chacha-glue.c
diff --git a/arch/s390/lib/crypto/chacha-s390.S b/lib/crypto/s390/chacha-s390.S
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.S
rename to lib/crypto/s390/chacha-s390.S
diff --git a/arch/s390/lib/crypto/chacha-s390.h b/lib/crypto/s390/chacha-s390.h
similarity index 100%
rename from arch/s390/lib/crypto/chacha-s390.h
rename to lib/crypto/s390/chacha-s390.h
diff --git a/arch/s390/lib/crypto/sha256.c b/lib/crypto/s390/sha256.c
similarity index 100%
rename from arch/s390/lib/crypto/sha256.c
rename to lib/crypto/s390/sha256.c
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
