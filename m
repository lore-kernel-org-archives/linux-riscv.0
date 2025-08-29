Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54672CA0FF9
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Aug 2025 18:50:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FHeDJ33YwE8pIsB5evuMT67YFH+jAjt9tyjyHd6u6dk=; b=emXxYVNp2fxMt8
	VwqYBVaYPxbo7rAzHDoGj/p+I/Gx5DbuPwaryudSNeNzKT3xxmJLxwt9lW0wLqjeD/OL6NCfZ/gpj
	VcMIX+hdYoZQynF80yU/UQMH0qKmWrjpElYLc2tQBVqgwTfHS+e4sN5jF9wFsaTgVQ0n+BxjR/gm3
	FFFFBtLir01U9trDluRh6vaRm1z6TrM434bEim2bviQk0wIIFZKZLCwXP1tpAC2jMegWFYs8q1oQL
	bajJ+e3kjqaG0QnBSnPPl0xy19Jst/Bs1jUDnOaL6xTLOLo+afLiKyIfbwtnLDLVR133acU9z/D6H
	aicNcjPQdAfN784O6aNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us4BP-00000006giB-2Uxj;
	Fri, 29 Aug 2025 18:50:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us0zj-00000006BOV-0LYM
	for linux-riscv@lists.infradead.org;
	Fri, 29 Aug 2025 15:26:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 80E5D6013F;
	Fri, 29 Aug 2025 15:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A1FC4CEF5;
	Fri, 29 Aug 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756481186;
	bh=6I+Wb/aEB8jPWbBTlpEsierId3E1MIMBuEPA7Zmdpeo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LxhDN1X1MDSozZ8VKfnUvne6zetiil28tw1KT7dak9g52EJYAWdSpOfQx483QkVk4
	 jpe2f0jSpbNzvLSlD3BZ57RtVg5PH+mBRMsIxLwgKSBpc301s2ImW9VcDs0tCJOqhz
	 0lbaKxEVOYdXweVCU1zGq4NrbFUzVqfrS3ex2a8hwm81m5Oly4jeTBk3wZbJ9a5t12
	 DcYJQlmSBnADKLQ1BtrgOO+MCWtS1cAmjc5Twr+YH+87rd4v5ffKHbmw+ouDhi3OTd
	 w12fZrCXLiGn/90Khknd2zk4TsGV54wnOMfqV2t6SVWjcTzz5hIjs9KHzR50gOWy9D
	 JN8/ixfXucB8w==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Zhihang Shao <zhihang.shao.iscas@gmail.com>,
	Andy Polyakov <appro@cryptogams.org>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 1/3] lib/crypto: poly1305: Remove unused function poly1305_is_arch_optimized()
Date: Fri, 29 Aug 2025 08:25:11 -0700
Message-ID: <20250829152513.92459-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250829152513.92459-1-ebiggers@kernel.org>
References: <20250829152513.92459-1-ebiggers@kernel.org>
MIME-Version: 1.0
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

poly1305_is_arch_optimized() is unused, so remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 include/crypto/poly1305.h              | 9 ---------
 lib/crypto/arm/poly1305-glue.c         | 7 -------
 lib/crypto/arm64/poly1305-glue.c       | 7 -------
 lib/crypto/mips/poly1305-glue.c        | 6 ------
 lib/crypto/powerpc/poly1305-p10-glue.c | 6 ------
 lib/crypto/x86/poly1305_glue.c         | 6 ------
 6 files changed, 41 deletions(-)

diff --git a/include/crypto/poly1305.h b/include/crypto/poly1305.h
index e54abda8cfe95..d4daeec8da19d 100644
--- a/include/crypto/poly1305.h
+++ b/include/crypto/poly1305.h
@@ -62,15 +62,6 @@ void poly1305_init(struct poly1305_desc_ctx *desc,
 		   const u8 key[POLY1305_KEY_SIZE]);
 void poly1305_update(struct poly1305_desc_ctx *desc,
 		     const u8 *src, unsigned int nbytes);
 void poly1305_final(struct poly1305_desc_ctx *desc, u8 *digest);
 
-#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_POLY1305)
-bool poly1305_is_arch_optimized(void);
-#else
-static inline bool poly1305_is_arch_optimized(void)
-{
-	return false;
-}
-#endif
-
 #endif
diff --git a/lib/crypto/arm/poly1305-glue.c b/lib/crypto/arm/poly1305-glue.c
index 2d86c78af8837..9e513e319e37c 100644
--- a/lib/crypto/arm/poly1305-glue.c
+++ b/lib/crypto/arm/poly1305-glue.c
@@ -49,17 +49,10 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 	} else
 		poly1305_blocks_arm(state, src, len, padbit);
 }
 EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
 
-bool poly1305_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL(poly1305_is_arch_optimized);
-
 static int __init arm_poly1305_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    (elf_hwcap & HWCAP_NEON))
 		static_branch_enable(&have_neon);
diff --git a/lib/crypto/arm64/poly1305-glue.c b/lib/crypto/arm64/poly1305-glue.c
index 31aea21ce42f7..d4a522e7d25a9 100644
--- a/lib/crypto/arm64/poly1305-glue.c
+++ b/lib/crypto/arm64/poly1305-glue.c
@@ -48,17 +48,10 @@ void poly1305_blocks_arch(struct poly1305_block_state *state, const u8 *src,
 	} else
 		poly1305_blocks(state, src, len, padbit);
 }
 EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
 
-bool poly1305_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM64 scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL(poly1305_is_arch_optimized);
-
 static int __init neon_poly1305_mod_init(void)
 {
 	if (cpu_have_named_feature(ASIMD))
 		static_branch_enable(&have_neon);
 	return 0;
diff --git a/lib/crypto/mips/poly1305-glue.c b/lib/crypto/mips/poly1305-glue.c
index 764a38a652002..002f50f710aba 100644
--- a/lib/crypto/mips/poly1305-glue.c
+++ b/lib/crypto/mips/poly1305-glue.c
@@ -21,13 +21,7 @@ EXPORT_SYMBOL_GPL(poly1305_blocks_arch);
 asmlinkage void poly1305_emit_arch(const struct poly1305_state *state,
 				   u8 digest[POLY1305_DIGEST_SIZE],
 				   const u32 nonce[4]);
 EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
-bool poly1305_is_arch_optimized(void)
-{
-	return true;
-}
-EXPORT_SYMBOL(poly1305_is_arch_optimized);
-
 MODULE_DESCRIPTION("Poly1305 transform (MIPS accelerated");
 MODULE_LICENSE("GPL v2");
diff --git a/lib/crypto/powerpc/poly1305-p10-glue.c b/lib/crypto/powerpc/poly1305-p10-glue.c
index 3f1664a724b65..184a71f9c1dee 100644
--- a/lib/crypto/powerpc/poly1305-p10-glue.c
+++ b/lib/crypto/powerpc/poly1305-p10-glue.c
@@ -70,16 +70,10 @@ void poly1305_emit_arch(const struct poly1305_state *state,
 		return poly1305_emit_generic(state, digest, nonce);
 	poly1305_emit_64(state, nonce, digest);
 }
 EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
-bool poly1305_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_p10);
-}
-EXPORT_SYMBOL(poly1305_is_arch_optimized);
-
 static int __init poly1305_p10_init(void)
 {
 	if (cpu_has_feature(CPU_FTR_ARCH_31))
 		static_branch_enable(&have_p10);
 	return 0;
diff --git a/lib/crypto/x86/poly1305_glue.c b/lib/crypto/x86/poly1305_glue.c
index 856d48fd422b0..deb5841cb0ada 100644
--- a/lib/crypto/x86/poly1305_glue.c
+++ b/lib/crypto/x86/poly1305_glue.c
@@ -139,16 +139,10 @@ void poly1305_emit_arch(const struct poly1305_state *ctx,
 	else
 		poly1305_emit_avx(ctx, mac, nonce);
 }
 EXPORT_SYMBOL_GPL(poly1305_emit_arch);
 
-bool poly1305_is_arch_optimized(void)
-{
-	return static_key_enabled(&poly1305_use_avx);
-}
-EXPORT_SYMBOL(poly1305_is_arch_optimized);
-
 static int __init poly1305_simd_mod_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_AVX) &&
 	    cpu_has_xfeatures(XFEATURE_MASK_SSE | XFEATURE_MASK_YMM, NULL))
 		static_branch_enable(&poly1305_use_avx);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
