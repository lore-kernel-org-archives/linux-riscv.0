Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD32C77B7C
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=J5ieFAp8EmIURSl/Nqgp8kDcbzbxwMTMW3nd7UXMywA=; b=2qYhgyMsMsdkg0
	ltMkQAED2jZZ2yfdX8QuAxzZH48dwxPyS5SlxA4zMMPu7CYaxlQT+4wI9A0GvoB/bS0qu518Dxvmf
	NKJRgfQtmbkP256MbMGsk7Z/3SljgvQYiOt/1lEHoX5KY2IBHNx3uc+eFh0h/s8XSzeP8JGhxl711
	KpLOEyqvRQjsgjZ/8rX5bSsCTT0WVxAQSJJxBNA9yC5S6+sK73gUpNyq3ljoKjW6CY1HSoZuQqdWt
	LlOWWvYNwNy1L5T1t81k35KVsxsQDWW+WvyM4IbLffSEzf6hThp/cAV9RPIHh7v08r9V7BdQt0nMX
	5MWF3yKNIMh7bf8q/5hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpT-0000000ECka-2Rhw;
	Thu, 19 Jun 2025 20:25:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKq7-0000000E5Ap-1OEx;
	Thu, 19 Jun 2025 19:22:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=83W10fLLpoIK8L9mY0z2oTkp6zKcXP+g8qzeZHR+GAQ=; b=PMwI729d3uRdn7cvGmiXxDYh9B
	GBwUrvDJt7XaCFtsimJNS57mkTt4ezgpb6hInCLEbdKd3/n5/vvoIfQeJFswabF976a58bEkDCgmN
	vBI2sIlkqboCGkW4TytQ8A55IhGGiXJ0Vxtci2r5n4HUs1N4O+Tc/82oQHJgX47iAgdqDBd1Znb0c
	0yASYnIwTqiL450GR54KJarXyJ23fzGdXt7ENetR1sezH4iW05FynrS+Sefkd/OfKfWaGHMRB7Gxj
	SUI1iGfDT8W811H/roQRoBRWlzNe1Po6jFS/ygAJmcEi1bo6M7tuweqCSMIdlir13N5QB9s0blO1D
	zJ7z3VTw==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpw-00000004YiN-12be;
	Thu, 19 Jun 2025 19:22:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5F4E84ADB9;
	Thu, 19 Jun 2025 19:22:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFC34C4CEF0;
	Thu, 19 Jun 2025 19:22:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360930;
	bh=LcwApgCrHyyCRJ2a2GiLxcYl5o0MWSHAzQ2wvFx8Muw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bXEnUCHoOEBW6mTEMAks5KvLkFh56qawoMnJm4Lu1chZFHRZ1mkUDFWyVIy9iVfSo
	 Av2+zMNkTlD264YmAlok7fz8uZva7Y/IUglzFRjBonpKdz+SnVah+29csKVS/BOH6p
	 bZJVaWxxXGNAbf4lcfqNjgJyc0dtyRuBjbzJNwOVWmZ4cpEFhnijLJ0q6uv1m/0M7k
	 4hY9RPYMyxNu+e+jvrThVOPgUI4OERXfD7BUZkdh8neyZvnECOInPybo8043B2+Mjz
	 KaweQKmbi1zfSGupVtAWc6XZUUPgLB4FQSdZ5yyLp/VYDNcb0ywrEAJ1I2xK5XPpbf
	 wYuFi60vKIOYg==
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
	x86@kernel.org,
	Sohil Mehta <sohil.mehta@intel.com>
Subject: [PATCH v2 8/9] lib/crypto: x86: move arch/x86/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:07 -0700
Message-ID: <20250619191908.134235-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_202212_869459_31E11815 
X-CRM114-Status: GOOD (  13.40  )
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

Move the contents of arch/x86/lib/crypto/ into lib/crypto/x86/.

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

Add a gitignore entry for the removed directory arch/x86/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Reviewed-by: Sohil Mehta <sohil.mehta@intel.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/x86/lib/.gitignore                                       | 4 ++++
 arch/x86/lib/Makefile                                         | 2 --
 lib/crypto/Kconfig                                            | 2 +-
 lib/crypto/Makefile                                           | 1 +
 {arch/x86/lib/crypto => lib/crypto/x86}/.gitignore            | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig               | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/Makefile              | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S        | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c        | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S  | 0
 .../lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S    | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c         | 0
 .../crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl   | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c       | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S      | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S     | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S       | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S    | 0
 {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c              | 0
 20 files changed, 6 insertions(+), 3 deletions(-)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/.gitignore (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Kconfig (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/Makefile (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-core.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/blake2s-glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx2-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-avx512vl-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha-ssse3-x86_64.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/chacha_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305-x86_64-cryptogams.pl (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/poly1305_glue.c (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-avx2-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ni-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256-ssse3-asm.S (100%)
 rename {arch/x86/lib/crypto => lib/crypto/x86}/sha256.c (100%)

diff --git a/arch/x86/lib/.gitignore b/arch/x86/lib/.gitignore
index 8ae0f93ecbfdd..ec2131c9fd206 100644
--- a/arch/x86/lib/.gitignore
+++ b/arch/x86/lib/.gitignore
@@ -1,2 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
+
 inat-tables.c
diff --git a/arch/x86/lib/Makefile b/arch/x86/lib/Makefile
index 4fa5c4e1ba8a0..7cf8681cba0f2 100644
--- a/arch/x86/lib/Makefile
+++ b/arch/x86/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for x86 specific library files.
 #
 
-obj-y += crypto/
-
 # Produces uninteresting flaky coverage.
 KCOV_INSTRUMENT_delay.o	:= n
 
 # KCSAN uses udelay for introducing watchpoint delay; avoid recursion.
 KCSAN_SANITIZE_delay.o := n
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index b98543c7ef231..2460ddff967fc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -209,10 +209,10 @@ source "lib/crypto/s390/Kconfig"
 endif
 if SPARC
 source "lib/crypto/sparc/Kconfig"
 endif
 if X86
-source "arch/x86/lib/crypto/Kconfig"
+source "lib/crypto/x86/Kconfig"
 endif
 endif
 
 endmenu
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 748d1fc6b6be2..16f5d76d92710 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -108,5 +108,6 @@ obj-$(CONFIG_ARM64) += arm64/
 obj-$(CONFIG_MIPS) += mips/
 obj-$(CONFIG_PPC) += powerpc/
 obj-$(CONFIG_RISCV) += riscv/
 obj-$(CONFIG_S390) += s390/
 obj-$(CONFIG_SPARC) += sparc/
+obj-$(CONFIG_X86) += x86/
diff --git a/arch/x86/lib/crypto/.gitignore b/lib/crypto/x86/.gitignore
similarity index 100%
rename from arch/x86/lib/crypto/.gitignore
rename to lib/crypto/x86/.gitignore
diff --git a/arch/x86/lib/crypto/Kconfig b/lib/crypto/x86/Kconfig
similarity index 100%
rename from arch/x86/lib/crypto/Kconfig
rename to lib/crypto/x86/Kconfig
diff --git a/arch/x86/lib/crypto/Makefile b/lib/crypto/x86/Makefile
similarity index 100%
rename from arch/x86/lib/crypto/Makefile
rename to lib/crypto/x86/Makefile
diff --git a/arch/x86/lib/crypto/blake2s-core.S b/lib/crypto/x86/blake2s-core.S
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-core.S
rename to lib/crypto/x86/blake2s-core.S
diff --git a/arch/x86/lib/crypto/blake2s-glue.c b/lib/crypto/x86/blake2s-glue.c
similarity index 100%
rename from arch/x86/lib/crypto/blake2s-glue.c
rename to lib/crypto/x86/blake2s-glue.c
diff --git a/arch/x86/lib/crypto/chacha-avx2-x86_64.S b/lib/crypto/x86/chacha-avx2-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx2-x86_64.S
rename to lib/crypto/x86/chacha-avx2-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-avx512vl-x86_64.S b/lib/crypto/x86/chacha-avx512vl-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-avx512vl-x86_64.S
rename to lib/crypto/x86/chacha-avx512vl-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha-ssse3-x86_64.S b/lib/crypto/x86/chacha-ssse3-x86_64.S
similarity index 100%
rename from arch/x86/lib/crypto/chacha-ssse3-x86_64.S
rename to lib/crypto/x86/chacha-ssse3-x86_64.S
diff --git a/arch/x86/lib/crypto/chacha_glue.c b/lib/crypto/x86/chacha_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/chacha_glue.c
rename to lib/crypto/x86/chacha_glue.c
diff --git a/arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl b/lib/crypto/x86/poly1305-x86_64-cryptogams.pl
similarity index 100%
rename from arch/x86/lib/crypto/poly1305-x86_64-cryptogams.pl
rename to lib/crypto/x86/poly1305-x86_64-cryptogams.pl
diff --git a/arch/x86/lib/crypto/poly1305_glue.c b/lib/crypto/x86/poly1305_glue.c
similarity index 100%
rename from arch/x86/lib/crypto/poly1305_glue.c
rename to lib/crypto/x86/poly1305_glue.c
diff --git a/arch/x86/lib/crypto/sha256-avx-asm.S b/lib/crypto/x86/sha256-avx-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx-asm.S
rename to lib/crypto/x86/sha256-avx-asm.S
diff --git a/arch/x86/lib/crypto/sha256-avx2-asm.S b/lib/crypto/x86/sha256-avx2-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-avx2-asm.S
rename to lib/crypto/x86/sha256-avx2-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ni-asm.S b/lib/crypto/x86/sha256-ni-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ni-asm.S
rename to lib/crypto/x86/sha256-ni-asm.S
diff --git a/arch/x86/lib/crypto/sha256-ssse3-asm.S b/lib/crypto/x86/sha256-ssse3-asm.S
similarity index 100%
rename from arch/x86/lib/crypto/sha256-ssse3-asm.S
rename to lib/crypto/x86/sha256-ssse3-asm.S
diff --git a/arch/x86/lib/crypto/sha256.c b/lib/crypto/x86/sha256.c
similarity index 100%
rename from arch/x86/lib/crypto/sha256.c
rename to lib/crypto/x86/sha256.c
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
