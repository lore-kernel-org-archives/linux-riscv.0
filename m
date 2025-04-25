Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32134C369AB
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 00:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=J02sWVBhToQP7qRsG0bP7vH4jGt+FggYoHoCaE6I+Tg=; b=J6iFQoQjFSVR7U
	ZdzIsacLW22OYEcRQZlp3RWh87l1VtkU79fE2iUt5kIBC5tGC4Fq84Z7h7y69+OJGG5yeUr5lAhFa
	W3fx+bAzJujOD44X557uBUerjxP9mwV11abvJ2bfQkWpGE92BCpQLOx688Pc6Uh2lqviu/btSq0A7
	VOhmZ7JGGGak6/LWOVeaM/v2Wd7vQ6V+Wlvtm8hd3aPw+4pMcG0/sTKn66LMSzwenha13hMl8vksa
	8zQ1Re/9fDZkap3cr6a424PWbIM3Ee00IG1ZQtJt2lrN6vqqZ4bRk66PGAr4zZFnBRIWO6xH6xBGw
	aLl+Hnygr+NF5CCteZCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86qw-0000000Fc4m-0B5N;
	Fri, 25 Apr 2025 00:23:38 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u86qs-0000000Fc48-313B
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 00:23:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4FC9EA4BAC4;
	Fri, 25 Apr 2025 00:18:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADC6CC4CEE3;
	Fri, 25 Apr 2025 00:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745540612;
	bh=UEkSo+BagKkIVRMMe9pgkrGMxtdYLmVfK4/QgaOoRvc=;
	h=From:Date:Subject:To:Cc:From;
	b=pUarwgPxg10MK0UdQ+n5BCmMishwDRNdqKKtmZeSwy6yosN15zyV66BLSRDZi5A3c
	 yVKMHZZzjcPoaTAJlS3aJBbN3RbJtDAlMxvqvthKXy3RD4ayvHKrha1/fo9OcfQHxq
	 y7p3Ui7hk/Mm4qo9Aui0h5LGGGoYcAD3AX1BjZjgVC+bWmpXfVuc+PIbBPy645vLsk
	 +KV3W7aTXxXHLe9iZPp+6GvbYbRheGZDd2kiLKlCP9S8dqK9184eXrNyta7wElhwM4
	 FTPshbqWhVU5pc0It3lqahAGYR/TDUNf7wxEMMQkU0TwwNjZvcrEDK4Pblvz2ty7Yo
	 WclNOcBljsHiQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 24 Apr 2025 17:23:22 -0700
Subject: [PATCH] riscv: crypto - Use SYM_FUNC_START for functions only
 called directly
MIME-Version: 1.0
Message-Id: <20250424-riscv-crypto-fix-cfi-build-v1-1-2d7516737379@kernel.org>
X-B4-Tracking: v=1; b=H4sIAPnVCmgC/x3M0QpAQBBA0V/RPJtai8SvyIMds0wJzSKSf7d5P
 HW7DwRW4QBN8oDyKUHWJSJLE6CpX0ZGGaLBGluawhaoEuhE0nvbV/RyIXlBd8g8YF1WlSfnXW5
 6iINNOQb/vO3e9wM6U9lmbAAAAA==
X-Change-ID: 20250424-riscv-crypto-fix-cfi-build-9577fcbfb30a
To: Herbert Xu <herbert@gondor.apana.org.au>
Cc: linux-crypto@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4387; i=nathan@kernel.org;
 h=from:subject:message-id; bh=UEkSo+BagKkIVRMMe9pgkrGMxtdYLmVfK4/QgaOoRvc=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDBlc15gdXliefvD94bbcI7N/HPy2dd+jWCa5aMaq2Ts9a
 s1lVgb/7ChlYRDjYpAVU2Spfqx63NBwzlnGG6cmwcxhZQIZwsDFKQATsT3MyPCbPehTSr3+2ZsP
 Dqa6ymWJap1UdSs98Nj92LItsl/2GDsy/JXjmSl+buulJcuLYzcv6JwlNPsIf8TCyuOJttM9u2w
 2GjECAA==
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250424_172334_885324_F8F71E0A 
X-CRM114-Status: GOOD (  10.18  )
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

After some recent changes to the RISC-V crypto code that turned some
indirect function calls into direct ones, builds with CONFIG_CFI_CLANG
fail with:

  ld.lld: error: undefined symbol: __kcfi_typeid_sm3_transform_zvksh_zvkb
  >>> referenced by arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.o:(.text+0x2) in archive vmlinux.a

  ld.lld: error: undefined symbol: __kcfi_typeid_sha512_transform_zvknhb_zvkb
  >>> referenced by arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.o:(.text+0x2) in archive vmlinux.a

  ld.lld: error: undefined symbol: __kcfi_typeid_sha256_transform_zvknha_or_zvknhb_zvkb
  >>> referenced by arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.o:(.text+0x2) in archive vmlinux.a

As these functions are no longer indirectly called (i.e., have their
address taken), the compiler will not emit __kcfi_typeid symbols for
them but SYM_TYPED_FUNC_START expects these to exist at link time.

Switch the definitions of these functions to use SYM_FUNC_START, as they
no longer need kCFI type information since they are only called
directly.

Fixes: 1523eaed0ac5 ("crypto: riscv/sm3 - Use API partial block handling")
Fixes: 561aab1104d8 ("crypto: riscv/sha512 - Use API partial block handling")
Fixes: e6c5597badf2 ("crypto: riscv/sha256 - Use API partial block handling")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S | 4 ++--
 arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S           | 4 ++--
 arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S               | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S b/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
index 8ebcc17de4dc..f1f5779e4732 100644
--- a/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
+++ b/arch/riscv/crypto/sha256-riscv64-zvknha_or_zvknhb-zvkb.S
@@ -43,7 +43,7 @@
 // - RISC-V Vector SHA-2 Secure Hash extension ('Zvknha' or 'Zvknhb')
 // - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
 
-#include <linux/cfi_types.h>
+#include <linux/linkage.h>
 
 .text
 .option arch, +zvknha, +zvkb
@@ -108,7 +108,7 @@
 
 // void sha256_transform_zvknha_or_zvknhb_zvkb(u32 state[8], const u8 *data,
 //					       int num_blocks);
-SYM_TYPED_FUNC_START(sha256_transform_zvknha_or_zvknhb_zvkb)
+SYM_FUNC_START(sha256_transform_zvknha_or_zvknhb_zvkb)
 
 	// Load the round constants into K0-K15.
 	vsetivli	zero, 4, e32, m1, ta, ma
diff --git a/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S b/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
index 3a9ae210f915..89f4a10d12dd 100644
--- a/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
+++ b/arch/riscv/crypto/sha512-riscv64-zvknhb-zvkb.S
@@ -43,7 +43,7 @@
 // - RISC-V Vector SHA-2 Secure Hash extension ('Zvknhb')
 // - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
 
-#include <linux/cfi_types.h>
+#include <linux/linkage.h>
 
 .text
 .option arch, +zvknhb, +zvkb
@@ -95,7 +95,7 @@
 
 // void sha512_transform_zvknhb_zvkb(u64 state[8], const u8 *data,
 //				     int num_blocks);
-SYM_TYPED_FUNC_START(sha512_transform_zvknhb_zvkb)
+SYM_FUNC_START(sha512_transform_zvknhb_zvkb)
 
 	// Setup mask for the vmerge to replace the first word (idx==0) in
 	// message scheduling.  There are 4 words, so an 8-bit mask suffices.
diff --git a/arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S b/arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S
index a2b65d961c04..4fe754846f65 100644
--- a/arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S
+++ b/arch/riscv/crypto/sm3-riscv64-zvksh-zvkb.S
@@ -43,7 +43,7 @@
 // - RISC-V Vector SM3 Secure Hash extension ('Zvksh')
 // - RISC-V Vector Cryptography Bit-manipulation extension ('Zvkb')
 
-#include <linux/cfi_types.h>
+#include <linux/linkage.h>
 
 .text
 .option arch, +zvksh, +zvkb
@@ -81,7 +81,7 @@
 .endm
 
 // void sm3_transform_zvksh_zvkb(u32 state[8], const u8 *data, int num_blocks);
-SYM_TYPED_FUNC_START(sm3_transform_zvksh_zvkb)
+SYM_FUNC_START(sm3_transform_zvksh_zvkb)
 
 	// Load the state and endian-swap each 32-bit word.
 	vsetivli	zero, 8, e32, m2, ta, ma

---
base-commit: 63dc06cd12f980e304158888485a26ae2be7f371
change-id: 20250424-riscv-crypto-fix-cfi-build-9577fcbfb30a

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
