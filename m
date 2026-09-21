Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63544C982F7
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eVdTU86KMb1rnlPDjLkA57H8nZLAlusAa3ib8GECxo4=; b=ijS+BJHQUbIi/9
	8X+/eYeIdbcZdabohffxhl1+0almCzTWvHOGl/kNfQaY9goJV51dsS/VngvRhOo/tTHi911eui5cJ
	WL1YOEPuOQNsY+iVvLhR86HUrUFU8X8VEr78UEBlZXjcq+hBWSgE1L5DwUzzi0h/E/bt9myYxtsoV
	ZbgDCcYoyXF1v68wsbrPdhzVkKUr03TVybfrps+lMmA1OyZStlOVfH4u0R4xT2EYX3ISC+5T8yttm
	nSIWvGTDc++3Y9t6TLl16Jystw28L9BPANmaNmZ6E0LUdYCY4RRWaKamfNbRTZSmHOqnWs7M8Rikx
	HCsWN2DumLz6cnttRSAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNy-00000000tJn-19WV;
	Mon, 21 Sep 2026 05:16:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNq-00000000tEn-3JqI
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3ED7360220;
	Mon, 21 Sep 2026 05:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B26FB1F000FF;
	Mon, 21 Sep 2026 05:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967766;
	bh=xrbxpAIudFXLQj0+9acngXmOgr6mUBsVSCepUOvq0KU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=X48SLngoUJu+xvQlChDPm/opx1y8tBFRk2E8KAGZVoWao1w0+eZvYd/EhB5W2FUxN
	 pFtHV/Z2PRjWXxQ03LIpqaRJVOpJ9M5hmnemuZyob5jOBmQNKuJY+8lMbfS5LsHATL
	 JdhgbSZXOa6i4Td8mM3Nz2V0rmeCuMaDhmdEJBRcM9r5DblbFXiw734yuD1fIF7V6a
	 aQFkPvv65XWZW4jbHYuPMV5xMB1I/CpVUZznO0Ywc2L7PewYrU4ZvqdO0jRKJkGh6a
	 MMi0/5kbZzSV7Z3AeE2uT7Z2y5b0IzOFBA8rrs0fGUlV3bIWQutYqE72sunSTOXKqb
	 EK3EWhWT517Yw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 07/20] lib/crypto: x86/aes-xts: Add AES-NI optimization
Date: Sun, 20 Sep 2026 22:08:53 -0700
Message-ID: <20260921050910.296144-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921050910.296144-1-ebiggers@kernel.org>
References: <20260921050910.296144-1-ebiggers@kernel.org>
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

Optimize the crypto library's AES-XTS support with AES-NI, making its
performance be at least at parity with the "xts-aes-aesni" skcipher
algorithm that it will supersede.

The new assembly function is written from scratch to fit well into the
crypto library and to be more consistent with aes-xts-avx-x86_64.S than
the code in arch/x86/crypto/aesni-intel_asm.S that it will supersede.
At a high level it is quite similar though, including doing 4 blocks per
iteration and supporting 32-bit mode for parity with the old code.

Note: the priority of xts-aes-lib is left unchanged at 110 temporarily.
It will be increased when the AVX-optimized code is migrated too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/aes-aesni.S | 146 +++++++++++++++++++++++++++++++++++++
 lib/crypto/x86/aes.h       |  44 +++++++++++
 2 files changed, 190 insertions(+)

diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
index 24c53f1a144b..50f09ac6ef34 100644
--- a/lib/crypto/x86/aes-aesni.S
+++ b/lib/crypto/x86/aes-aesni.S
@@ -50,6 +50,17 @@
 
 .section .rodata
 .p2align 4
+.Lxts_gf_poly:
+	// For XTS: a constant used when advancing the tweak by one block by
+	// multiplying by the polynomial 'x' in GF(2^128).  The low 64 bits of
+	// this value represent the polynomial x^7 + x^2 + x + 1; it is the
+	// value that must be XOR'd into the low 64 bits of the tweak each time
+	// a 1 is carried out of the high 64 bits.
+	//
+	// The high 64 bits of this value is just the internal carry bit that
+	// exists when there's a carry out of the low 64 bits of the tweak.
+	.quad	0x87, 1
+
 #ifdef __x86_64__
 .Lbswap_mask:
 	// A mask for pshufb that byte-reflects the value.
@@ -776,3 +787,138 @@ SYM_FUNC_START(aes_ctr64_crypt_aesni)
 	RET
 SYM_FUNC_END(aes_ctr64_crypt_aesni)
 #endif // __x86_64__
+
+// Given a 128-bit XTS tweak in the xmm register \tweak, compute the next tweak
+// (by multiplying by the polynomial 'x') and write it back to \tweak.
+.macro	_next_tweak	tweak, tmp
+	pshufd		$0x13, \tweak, \tmp
+	paddq		\tweak, \tweak
+	psrad		$31, \tmp
+	pand		GF_POLY, \tmp
+	pxor		\tmp, \tweak
+.endm
+
+.macro	_aes_xts_crypt	enc
+	// Arguments
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	NBLOCKS,	ARG2
+	.set	NBLOCKS32,	ARG2_32	// Used for improved code density
+	.set	TWEAK_PTR,	ARG3
+	.set	KEY,		ARG4
+
+	// Other local variables
+#ifdef __x86_64__
+	.set	RNDKEY_PTR,	%r9
+#else
+	.set	RNDKEY_PTR,	TWEAK_PTR // TWEAK_PTR is clobbered and reloaded later.
+#endif
+	.set	NROUNDS,	TMP_32
+	.set	AESDATA0,	%xmm0
+	.set	AESDATA1,	%xmm1
+	.set	AESDATA2,	%xmm2
+	.set	AESDATA3,	%xmm3
+	.set	GF_POLY,	%xmm4
+	.set	RNDKEY,		%xmm5
+	.set	TWEAK,		%xmm6
+	.set	SAVED_TWEAK0,	%xmm7
+#ifdef __x86_64__
+	.set	SAVED_TWEAK1,	%xmm8
+	.set	SAVED_TWEAK2,	%xmm9
+#endif
+
+	_prologue	uses_arg3=2, uses_arg4=2
+
+	movdqu		(TWEAK_PTR), TWEAK
+	movdqa		RODATA(.Lxts_gf_poly), GF_POLY
+
+	sub		$4, NBLOCKS
+	jl		.Lxts_loop4_done\@
+.p2align 5
+.Lxts_loop4\@:
+	// Load the next four source blocks into AESDATA[0-3] and XOR them with
+	// their tweaks, advancing the tweak three times in order to do so.
+	// Save the four tweaks for later; on 64-bit they all fit into
+	// registers, while on 32-bit two tweaks are spilled to DST.
+.irp i, 0,1,2,3
+	movdqu		\i*16(SRC), AESDATA\i
+	pxor		TWEAK, AESDATA\i
+  .if \i != 3
+#ifdef __x86_64__
+	movdqa		TWEAK, SAVED_TWEAK\i
+#else
+    .if \i == 0
+	movdqa		TWEAK, SAVED_TWEAK0
+    .else
+	movdqu		TWEAK, (\i-1)*16(DST)
+    .endif
+#endif
+	_next_tweak	TWEAK, RNDKEY
+  .endif
+.endr
+
+	// Encrypt or decrypt the blocks.
+	_do_aes		\enc, 0,1,2,3
+
+	// XOR the blocks with the saved tweaks.
+	pxor		SAVED_TWEAK0, AESDATA0
+#ifdef __x86_64__
+	pxor		SAVED_TWEAK1, AESDATA1
+	pxor		SAVED_TWEAK2, AESDATA2
+#else
+	movdqu		0(DST), RNDKEY
+	pxor		RNDKEY, AESDATA1
+	movdqu		16(DST), RNDKEY
+	pxor		RNDKEY, AESDATA2
+#endif
+	pxor		TWEAK, AESDATA3
+
+	// Store the encrypted or decrypted blocks.
+.irp i, 0,1,2,3
+	movdqu		AESDATA\i, \i*16(DST)
+.endr
+
+	_next_tweak	TWEAK, RNDKEY
+	add		$64, DST
+	add		$64, SRC
+	sub		$4, NBLOCKS
+	jge		.Lxts_loop4\@
+.Lxts_loop4_done\@:
+	add		$4, NBLOCKS32
+	jz		.Lxts_done\@
+
+.Lxts_loop1\@:
+	movdqu		(SRC), AESDATA0
+	pxor		TWEAK, AESDATA0
+	_do_aes		\enc, 0
+	pxor		TWEAK, AESDATA0
+	movdqu		AESDATA0, (DST)
+	_next_tweak	TWEAK, RNDKEY
+	add		$16, DST
+	add		$16, SRC
+	dec		NBLOCKS32
+	jnz		.Lxts_loop1\@
+
+.Lxts_done\@:
+	// Store the next tweak.  On 32-bit, reload TWEAK_PTR from stack first.
+	_reload_arg3
+	movdqu		TWEAK, (TWEAK_PTR)
+	_epilogue
+.endm
+
+// void aes_xts_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      u8 tweak[AES_BLOCK_SIZE],
+//			      const struct aes_key *key);
+// void aes_xts_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      u8 tweak[AES_BLOCK_SIZE],
+//			      const struct aes_key *key);
+//
+// `tweak` must have already been encrypted by the tweak key; `key` is just the
+// main key.  To allow incremental computation, `tweak` is updated to contain
+// the next tweak.
+SYM_FUNC_START(aes_xts_encrypt_aesni)
+	_aes_xts_crypt	1
+SYM_FUNC_END(aes_xts_encrypt_aesni)
+SYM_FUNC_START(aes_xts_decrypt_aesni)
+	_aes_xts_crypt	0
+SYM_FUNC_END(aes_xts_decrypt_aesni)
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
index 685b43ce6ef0..def9799302c1 100644
--- a/lib/crypto/x86/aes.h
+++ b/lib/crypto/x86/aes.h
@@ -257,6 +257,50 @@ static bool aes_ctr_arch(u8 *dst, const u8 *src, size_t len,
 }
 #endif /* CONFIG_CRYPTO_LIB_AES_CTR && CONFIG_X86_64 */
 
+#if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_XTS)
+void aes_xts_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   u8 tweak[AES_BLOCK_SIZE], const struct aes_key *key);
+void aes_xts_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   u8 tweak[AES_BLOCK_SIZE], const struct aes_key *key);
+
+/* len is always a positive multiple of AES_BLOCK_SIZE here. */
+static __always_inline bool
+aes_xts_crypt_x86(u8 *dst, const u8 *src, size_t len, u8 tweak[AES_BLOCK_SIZE],
+		  const struct aes_xts_key *key, bool cont, bool enc)
+{
+	const long nblocks = len / AES_BLOCK_SIZE;
+
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+
+	kernel_fpu_begin();
+	if (!cont)
+		aes_encrypt_aesni(tweak, tweak, &key->tweak_key);
+	if (enc)
+		aes_xts_encrypt_aesni(dst, src, nblocks, tweak, &key->main_key);
+	else
+		aes_xts_decrypt_aesni(dst, src, nblocks, tweak, &key->main_key);
+	kernel_fpu_end();
+	return true;
+}
+
+#define aes_xts_encrypt_arch aes_xts_encrypt_arch
+static bool aes_xts_encrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 u8 tweak[AES_BLOCK_SIZE],
+				 const struct aes_xts_key *key, bool cont)
+{
+	return aes_xts_crypt_x86(dst, src, len, tweak, key, cont, true);
+}
+
+#define aes_xts_decrypt_arch aes_xts_decrypt_arch
+static bool aes_xts_decrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 u8 tweak[AES_BLOCK_SIZE],
+				 const struct aes_xts_key *key, bool cont)
+{
+	return aes_xts_crypt_x86(dst, src, len, tweak, key, cont, false);
+}
+#endif /* CONFIG_CRYPTO_LIB_AES_XTS */
+
 #define aes_mod_init_arch aes_mod_init_arch
 static void aes_mod_init_arch(void)
 {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
