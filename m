Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AB35C83035
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yUguuRI2NuIYe1cC/zJPufbQPUb8XWinfTbW+6BoPD0=; b=r+B8ed0NivVpyW
	6pkAEpkEJWgylmWAWSIy7q71BtwJTO6nRXL0GqGZIm0XrXHoNGvz9PMyjVf8VrLe3vNM739UHG0er
	S8D9jJmSXOB7vRVHwJyII05PU502+puRygru1E0aMo54plu6gu+tILb4yDsPFahzdVEMbJ42Nlx2e
	/4qPZPAMkawa6A8cghMcX0QaA9ie5yNquecnalM/PggNeTWZIdlmPAVZZnLlC9aZixyhqLWzZPW37
	be1UE7XoVM2vlT6Oopu63FvXtYzzaqSZKlfM7h1DKd+lNlXhLOr+PT23nT/3eAXqAKTgHo677mno9
	1n/wa/0twl5NIioEx2bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1S-000000039bb-471W;
	Mon, 30 Jun 2025 18:14:30 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4R-00000002poV-0KK3;
	Mon, 30 Jun 2025 16:09:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 633F1A53514;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB896C4CEF4;
	Mon, 30 Jun 2025 16:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299766;
	bh=qX6erliMaa6ulFNQWAym5UGYaX+QesAVdQAZCq+fGOg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=B4SBkLPsrDtMSle6gshLLQ/m4UzOebXqZJ7GZ8t9HmQa3kgB01qTNAxJ+E+5SI0tE
	 DNGWpFZnQ42KfzK1RPVMUHDevxo25awdKlOgZ5M7V1/kMazAdbvyoeDHw6yEDYBjSb
	 iZaBZ9D+PNTEt33b1OvxfM4ZesS/fBZeiGK025KQUGyFBVXu14Psn7CYuNbWmtzCjQ
	 L6jJO1k4bEMhGecya7uc2MbbpyDHLgiATkvhMXmup1TwqKqZAdBd/RW12OdtAHwxLc
	 Yo87PcBTc0x13h6KFgGAboUadOVjZ6H54Lpvg+8Bq/LQnkASFOe0y18gFsm1pvPLrz
	 mzGLPZzFJjrFA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 11/14] lib/crypto: sha256: Remove sha256_is_arch_optimized()
Date: Mon, 30 Jun 2025 09:06:42 -0700
Message-ID: <20250630160645.3198-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090927_277102_B72DC22E 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Remove sha256_is_arch_optimized(), since it is no longer used.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/mips/cavium-octeon/crypto/octeon-sha256.c | 6 ------
 include/crypto/internal/sha2.h                 | 8 --------
 lib/crypto/arm/sha256.c                        | 7 -------
 lib/crypto/arm64/sha256.c                      | 7 -------
 lib/crypto/powerpc/sha256.c                    | 6 ------
 lib/crypto/riscv/sha256.c                      | 6 ------
 lib/crypto/s390/sha256.c                       | 6 ------
 lib/crypto/sparc/sha256.c                      | 6 ------
 lib/crypto/x86/sha256.c                        | 6 ------
 9 files changed, 58 deletions(-)

diff --git a/arch/mips/cavium-octeon/crypto/octeon-sha256.c b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
index f8664818d04ec..c7c67bdc2bd06 100644
--- a/arch/mips/cavium-octeon/crypto/octeon-sha256.c
+++ b/arch/mips/cavium-octeon/crypto/octeon-sha256.c
@@ -59,14 +59,8 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	state64[3] = read_octeon_64bit_hash_dword(3);
 	octeon_crypto_disable(&cop2_state, flags);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return octeon_has_crypto();
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm (OCTEON)");
 MODULE_AUTHOR("Aaro Koskinen <aaro.koskinen@iki.fi>");
diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index f0f455477bbd7..7915a3a46bc86 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -7,18 +7,10 @@
 #include <linux/compiler_attributes.h>
 #include <linux/string.h>
 #include <linux/types.h>
 #include <linux/unaligned.h>
 
-#if IS_ENABLED(CONFIG_CRYPTO_ARCH_HAVE_LIB_SHA256)
-bool sha256_is_arch_optimized(void);
-#else
-static inline bool sha256_is_arch_optimized(void)
-{
-	return false;
-}
-#endif
 void sha256_blocks_generic(struct sha256_block_state *state,
 			   const u8 *data, size_t nblocks);
 void sha256_blocks_arch(struct sha256_block_state *state,
 			const u8 *data, size_t nblocks);
 
diff --git a/lib/crypto/arm/sha256.c b/lib/crypto/arm/sha256.c
index 7d90823586952..27181be0aa92e 100644
--- a/lib/crypto/arm/sha256.c
+++ b/lib/crypto/arm/sha256.c
@@ -35,17 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) && (elf_hwcap & HWCAP_NEON)) {
 		static_branch_enable(&have_neon);
 		if (elf_hwcap2 & HWCAP2_SHA2)
diff --git a/lib/crypto/arm64/sha256.c b/lib/crypto/arm64/sha256.c
index 609ffb8151987..a5a4982767089 100644
--- a/lib/crypto/arm64/sha256.c
+++ b/lib/crypto/arm64/sha256.c
@@ -45,17 +45,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_block_data_order(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	/* We always can use at least the ARM64 scalar implementation. */
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_arm64_mod_init(void)
 {
 	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
 	    cpu_have_named_feature(ASIMD)) {
 		static_branch_enable(&have_neon);
diff --git a/lib/crypto/powerpc/sha256.c b/lib/crypto/powerpc/sha256.c
index c3f844ae0aceb..437e587b05754 100644
--- a/lib/crypto/powerpc/sha256.c
+++ b/lib/crypto/powerpc/sha256.c
@@ -58,13 +58,7 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		nblocks -= unit;
 	} while (nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return true;
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 MODULE_LICENSE("GPL");
 MODULE_DESCRIPTION("SHA-256 Secure Hash Algorithm, SPE optimized");
diff --git a/lib/crypto/riscv/sha256.c b/lib/crypto/riscv/sha256.c
index a2079aa3ae925..01004cb9c6e9e 100644
--- a/lib/crypto/riscv/sha256.c
+++ b/lib/crypto/riscv/sha256.c
@@ -32,16 +32,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_extensions);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init riscv64_sha256_mod_init(void)
 {
 	/* Both zvknha and zvknhb provide the SHA-256 instructions. */
 	if ((riscv_isa_extension_available(NULL, ZVKNHA) ||
 	     riscv_isa_extension_available(NULL, ZVKNHB)) &&
diff --git a/lib/crypto/s390/sha256.c b/lib/crypto/s390/sha256.c
index fb565718f7539..6ebfd35a5d44c 100644
--- a/lib/crypto/s390/sha256.c
+++ b/lib/crypto/s390/sha256.c
@@ -21,16 +21,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_cpacf_sha256);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_s390_mod_init(void)
 {
 	if (cpu_have_feature(S390_CPU_FEATURE_MSA) &&
 	    cpacf_query_func(CPACF_KIMD, CPACF_KIMD_SHA_256))
 		static_branch_enable(&have_cpacf_sha256);
diff --git a/lib/crypto/sparc/sha256.c b/lib/crypto/sparc/sha256.c
index 060664b88a6d3..f41c109c1c18d 100644
--- a/lib/crypto/sparc/sha256.c
+++ b/lib/crypto/sparc/sha256.c
@@ -30,16 +30,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 	else
 		sha256_blocks_generic(state, data, nblocks);
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_opcodes);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_sparc64_mod_init(void)
 {
 	unsigned long cfr;
 
 	if (!(sparc64_elf_hwcap & HWCAP_SPARC_CRYPTO))
diff --git a/lib/crypto/x86/sha256.c b/lib/crypto/x86/sha256.c
index cbb45defbefab..9ee38d2b3d572 100644
--- a/lib/crypto/x86/sha256.c
+++ b/lib/crypto/x86/sha256.c
@@ -35,16 +35,10 @@ void sha256_blocks_arch(struct sha256_block_state *state,
 		sha256_blocks_generic(state, data, nblocks);
 	}
 }
 EXPORT_SYMBOL_GPL(sha256_blocks_arch);
 
-bool sha256_is_arch_optimized(void)
-{
-	return static_key_enabled(&have_sha256_x86);
-}
-EXPORT_SYMBOL_GPL(sha256_is_arch_optimized);
-
 static int __init sha256_x86_mod_init(void)
 {
 	if (boot_cpu_has(X86_FEATURE_SHA_NI)) {
 		static_call_update(sha256_blocks_x86, sha256_ni_transform);
 	} else if (cpu_has_xfeatures(XFEATURE_MASK_SSE |
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
