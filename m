Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5595C9830E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:45:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=N/O3wRm/xShVDzldghdMQPzxJi+c5OoBBzMjvdB89EQ=; b=n4PcP1ZZ2X1inc
	R3WKtVl1iDHqL+TrN30P9N0P4AVdKKCZel50dSpQLIrR3Qn1iF0A7fw+hKb8VfpbVBJEqf0rdQanB
	tiahucNM+KVDkLn4BX+USyPHU1jcAL/KY0fG+hbANtWBtP0hWJmq/k5uJFThbd4ykugxBnK/1toJY
	son2im+SGYy428s2vfCAemMBCEkiDImyquBfW4a5br4U1MQyp7WSNv1VJHQ12c29qmAUhK50KMQ9C
	16/rCEjHBv0M4twiVIwLoMQZ5qH8/cMKI6r3/8n17D+VEbajLESAtV1ir8wRJ1oPxH6S/m7ZuuK+T
	EFHCBTTPQTqpIIR34s8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxby-0000000GwTJ-0yUY;
	Sun, 27 Sep 2026 22:44:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbt-0000000GwR2-1Wdf
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 22:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 23FB8444ED;
	Sun, 27 Sep 2026 22:44:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1AD31F00893;
	Sun, 27 Sep 2026 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549081;
	bh=PcsrPVJ/UMD1DI0RT43ecOt4FiB+9EnHO4w28Q6a8/w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=VN84ExcFxTdtL9iQpuJbjCKgS56QPisU7CADxnSnoMGeaXhfwuXQLd0m74m7+nsnq
	 v4tNeVSfwmLPdLjqRVBQSOirLmTr/8Jw+MuhobpVfKWgglyRo8y3ckIKeKWFEQ0mkH
	 gRoUg0kvLLjDnEFJNSO00mRj0dCU+amI8UkCVQKtSzpkuadITSQC6/X28n2VaieIQ0
	 sFXuvi57f3Jkk7/WcBy4tRv/LeyE2IalrpU86JHfKfU3JxTDn5Y59YVcOcBr1OdfBE
	 g1fKTHXWxhQ2QxAKkAcVK2/AdMDy+Lsq7bi/lZBrlRKv9CKt8tx0Jv1yf6DDHKTkd5
	 Ezbv/gzI7PNnw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 06/20] lib/crypto: x86/aes-ctr: Add AES-NI optimization
Date: Sun, 27 Sep 2026 15:42:57 -0700
Message-ID: <20260927224418.109759-7-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927224418.109759-1-ebiggers@kernel.org>
References: <20260927224418.109759-1-ebiggers@kernel.org>
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

Optimize the crypto library's AES-CTR support with AES-NI, bringing its
performance on par with the "ctr-aes-aesni" skcipher algorithm it will
supersede.

The new assembly function is written from scratch to fit well into the
crypto library and to be more consistent with aes-ctr-avx-x86_64.S than
the code in arch/x86/crypto/aesni-intel_asm.S that it will supersede.
That includes using the "ctr64" convention, where the assembly code is
simplified by making the C code handle incrementing the high 64 bits of
the counter.  Unlike the ECB, CBC, and XTS code, 32-bit support is *not*
included for this one, as the existing CTR code didn't have it.

Note: the priority of ctr-aes-lib is left unchanged at 110 temporarily.
It will be increased when the AVX-optimized code is migrated too.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/x86/aes-aesni.S | 130 ++++++++++++++++++++++++++++++++++++-
 lib/crypto/x86/aes.h       |  54 +++++++++++++++
 2 files changed, 183 insertions(+), 1 deletion(-)

diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
index 51c8522416d7..297fe21ba830 100644
--- a/lib/crypto/x86/aes-aesni.S
+++ b/lib/crypto/x86/aes-aesni.S
@@ -4,7 +4,8 @@
 //
 // Copyright 2026 Google LLC
 //
-// The code in this file supports 32-bit and 64-bit CPUs, and it doesn't require
+// The code in this file supports 32-bit and 64-bit CPUs (except for
+// aes_ctr64_crypt_aesni() which supports 64-bit only), and it doesn't require
 // AVX.  It does use up to SSE4.1, which all CPUs with AES-NI have.
 #include <linux/linkage.h>
 
@@ -48,6 +49,12 @@
 
 .section .rodata
 .p2align 4
+#ifdef __x86_64__
+.Lbswap_mask:
+	// A mask for pshufb that byte-reflects the value.
+	.byte	15, 14, 13, 12, 11, 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0
+#endif
+
 .Lexpandkey_mask:
 	// A mask for pshufb that extracts the last dword, rotates it right by 8
 	// bits, and copies the result to all four dwords.
@@ -634,3 +641,124 @@ SYM_FUNC_END(aes_cbc_cts_encrypt_aesni)
 SYM_FUNC_START(aes_cbc_cts_decrypt_aesni)
 	_aes_cbc_cts_crypt	0
 SYM_FUNC_END(aes_cbc_cts_decrypt_aesni)
+
+#ifdef __x86_64__
+// void aes_ctr64_crypt_aesni(u8 *dst, const u8 *src, s64 len,
+//			      const u64 le_ctr[2],
+//			      const struct aes_enckey *key);
+SYM_FUNC_START(aes_ctr64_crypt_aesni)
+	// Arguments
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	LEN,		ARG2
+	.set	LEN32,		ARG2_32	// Used for improved code density
+	.set	LE_CTR_PTR,	ARG3	// Used as temp reg after LE_CTR is loaded
+	.set	KEY,		ARG4
+
+	// Other local variables
+	.set	AESDATA0,	%xmm0
+	.set	AESDATA1,	%xmm1
+	.set	AESDATA2,	%xmm2
+	.set	AESDATA3,	%xmm3
+	.set	LE_CTR,		%xmm4	// Current 128-bit little endian counter
+	.set	LE_CTR_INC,	%xmm5	// Initialized to (u64[])[1, 0]
+	.set	BSWAP_MASK,	%xmm6
+	.set	RNDKEY,		%xmm7
+	.set	RNDKEY_PTR,	LE_CTR_PTR  // Temporary register for _do_aes
+	.set	NROUNDS,	TMP_32	// Temporary register for _do_aes
+
+	// Initialize LE_CTR, BSWAP_MASK, and LE_CTR_INC.
+	movdqu		(LE_CTR_PTR), LE_CTR
+	movdqa		RODATA(.Lbswap_mask), BSWAP_MASK
+	mov		$1, TMP_32
+	movd		TMP_32, LE_CTR_INC
+
+	// Encrypt and XOR four blocks (64 bytes) at a time.
+	sub		$64, LEN
+	jl		.Lctr_loop4_done
+.p2align 5
+.Lctr_loop4:
+.irp i, 0,1,2,3
+	movdqa		LE_CTR, AESDATA\i
+	pshufb		BSWAP_MASK, AESDATA\i	// => big endian counter
+	paddq		LE_CTR_INC, LE_CTR
+.endr
+	_do_aes		1, 0,1,2,3
+	// AESDATA[0-3] now contain four keystream blocks.
+.irp i, 0,1,2,3
+	movdqu		\i*16(SRC), RNDKEY	// Use RNDKEY as temp register.
+	pxor		RNDKEY, AESDATA\i
+	movdqu		AESDATA\i, \i*16(DST)
+.endr
+	add		$64, SRC
+	add		$64, DST
+	sub		$64, LEN
+	jge		.Lctr_loop4
+.Lctr_loop4_done:
+	add		$64, LEN32
+	jz		.Lctr_done
+
+	// 1 <= LEN <= 63 bytes remain.  Prepare four more keystream blocks.
+.irp i, 0,1,2,3
+	movdqa		LE_CTR, AESDATA\i
+	pshufb		BSWAP_MASK, AESDATA\i	// => big endian counter
+  .if \i != 3
+	paddq		LE_CTR_INC, LE_CTR
+  .endif
+.endr
+	_do_aes		1, 0,1,2,3
+	// AESDATA[0-3] now contain four keystream blocks.
+
+	// XOR one block (16 bytes) at a time.
+	sub		$16, LEN32
+	jl		.Lctr_xor_partial
+.Lctr_xor1:
+	movdqu		(SRC), RNDKEY		// Use RNDKEY as temp register.
+	pxor		RNDKEY, AESDATA0
+	movdqu		AESDATA0, (DST)
+	movdqa		AESDATA1, AESDATA0
+	movdqa		AESDATA2, AESDATA1
+	movdqa		AESDATA3, AESDATA2
+	add		$16, SRC
+	add		$16, DST
+	sub		$16, LEN32
+	jge		.Lctr_xor1
+
+	// XOR the remaining LEN mod 16 bytes.
+.Lctr_xor_partial:
+	test		$8, LEN32
+	jz		1f
+	movq		AESDATA0, TMP
+	xor		(SRC), TMP	// XOR 8 bytes.
+	mov		TMP, (DST)
+	add		$8, SRC
+	add		$8, DST
+	psrldq		$8, AESDATA0
+1:
+	test		$4, LEN32
+	jz		2f
+	movd		AESDATA0, TMP_32
+	xor		(SRC), TMP_32	// XOR 4 bytes.
+	mov		TMP_32, (DST)
+	add		$4, SRC
+	add		$4, DST
+	psrldq		$4, AESDATA0
+2:
+	test		$2, LEN32
+	jz		3f
+	movd		AESDATA0, TMP_32
+	xor		(SRC), TMP_16	// XOR 2 bytes.
+	mov		TMP_16, (DST)
+	add		$2, SRC
+	add		$2, DST
+	psrldq		$2, AESDATA0
+3:
+	test		$1, LEN32
+	jz		.Lctr_done
+	movd		AESDATA0, TMP_32
+	xor		(SRC), TMP_8	// XOR 1 byte.
+	mov		TMP_8, (DST)
+.Lctr_done:
+	RET
+SYM_FUNC_END(aes_ctr64_crypt_aesni)
+#endif // __x86_64__
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
index a0346cb3ecb5..2a2b26d10e87 100644
--- a/lib/crypto/x86/aes.h
+++ b/lib/crypto/x86/aes.h
@@ -205,6 +205,60 @@ static bool aes_cbc_cts_decrypt_arch(u8 *dst, const u8 *src, size_t len,
 }
 #endif /* CONFIG_CRYPTO_LIB_AES_CBC */
 
+#if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_CTR) && IS_ENABLED(CONFIG_X86_64)
+void aes_ctr64_crypt_aesni(u8 *dst, const u8 *src, s64 len, const u64 le_ctr[2],
+			   const struct aes_enckey *key);
+
+static void aes_ctr64_x86(u8 *dst, const u8 *src, size_t len,
+			  const u64 le_ctr[2], const struct aes_enckey *key)
+{
+	aes_ctr64_crypt_aesni(dst, src, len, le_ctr, key);
+}
+
+#define aes_ctr_arch aes_ctr_arch
+static bool aes_ctr_arch(u8 *dst, const u8 *src, size_t len,
+			 u8 ctr[AES_BLOCK_SIZE], const struct aes_enckey *key)
+{
+	u64 le_ctr[2];
+	u64 ctr64;
+	size_t nblocks;
+	size_t part1_len;
+
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+
+	ctr64 = le_ctr[0] = get_unaligned_be64(&ctr[8]);
+	le_ctr[1] = get_unaligned_be64(&ctr[0]);
+
+	kernel_fpu_begin();
+
+	nblocks = DIV_ROUND_UP(len, AES_BLOCK_SIZE);
+	ctr64 += nblocks;
+
+	if (likely(ctr64 >= nblocks)) {
+		/* The low 64 bits of the counter won't overflow. */
+		aes_ctr64_x86(dst, src, len, le_ctr, key);
+	} else {
+		/*
+		 * The low 64 bits of the counter will overflow.  The
+		 * assembly doesn't handle this case, so split the
+		 * operation into two at the point where the overflow
+		 * will occur.  After the first part, add the carry bit.
+		 */
+		part1_len = min(len, (nblocks - ctr64) * AES_BLOCK_SIZE);
+		aes_ctr64_x86(dst, src, part1_len, le_ctr, key);
+		le_ctr[0] = 0;
+		le_ctr[1]++;
+		aes_ctr64_x86(dst + part1_len, src + part1_len, len - part1_len,
+			      le_ctr, key);
+	}
+	kernel_fpu_end();
+	put_unaligned_be64(ctr64, &ctr[8]);
+	put_unaligned_be64(le_ctr[1], &ctr[0]);
+	return true;
+}
+#endif /* CONFIG_CRYPTO_LIB_AES_CTR && CONFIG_X86_64 */
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
