Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A985CA5FA7
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49zMx8Idqr8o5hAZJzEL3+zRJ+rsK4za5M6h4xihErg=; b=mMla9H1vG0ujlF
	kyKMzryQpDN0UqiqLeXx+NrO9xb45oEY6T0W10kOj9W9fpfspDX8L20JWrybOuOUj4qaRBO2XCQ9m
	IWX3jgDI1tszVHWQFtjqkIDRGatujyO7ypRTkmCeCE+/7RvVgKfsem5uba9UKX6AhFJz8h4ncoe0w
	IG7vnNUfGwvqw5NHRm5FOS0A94TEgWz9qmREs5KWMC7ksD6JY7kRz2iFuv2f6NrYN7QGJiqJxLBKO
	qZ6dkF1i866qStqYIz9+IpK/gCYaPoPoyhGQ+J734SxuLmkBWOJiVu3rgmgEPnGHv0Xdtz9092zcA
	FXCFk3lJmfWC3NCKS57w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxby-0000000GwTT-1txB;
	Sun, 27 Sep 2026 22:44:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbt-0000000GwR1-2Erp
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 22:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E561D60D78;
	Sun, 27 Sep 2026 22:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 636911F000FF;
	Sun, 27 Sep 2026 22:44:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549080;
	bh=n9Da5C1vAGelIU2jXAiQKk44z2kGmavaO4J9KFT700A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=akppXitB3zz3a/ioEiELfkZZeYnS3qxgdtJIwjO393JhOUd3JPUwRrJBAoODMFfH2
	 xSVTr9FT/FgSfpTP2OO6LFKnOwH3AICvlLKq0HaAKhS/Ss1owiuHDIKw1f1tQIkHIY
	 w8ombCW/oy9v62icmunLwX8Z8rqpsdT/hlPh73agwQVa5ENvivVb0DqVCPR2378VV3
	 hljeIoMzqWcbXHv4IRFyfOo4TKYo8gPdbu5jwPD09+t/FyDjPyIypMjFHp1btsgqaf
	 jdg6Hcno4goiWOU8RUYmy3ees2hOX1HWYMx6+CmBSdwMtLzQh3VndUyHdoQVjsRAjJ
	 /AaVVITG5ugvw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 05/20] lib/crypto: x86/aes-cbc: Add AES-NI optimization
Date: Sun, 27 Sep 2026 15:42:56 -0700
Message-ID: <20260927224418.109759-6-ebiggers@kernel.org>
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

Optimize the crypto library's AES-CBC and AES-CBC-CTS support with
AES-NI, bringing their performance on par with the "cbc-aes-aesni" and
"cts-cbc-aes-aesni" skcipher algorithms they will supersede.

The new assembly functions are written from scratch to fit well into the
crypto library.  However, they are functionally very similar to the
functions in arch/x86/crypto/aesni-intel_asm.S that they will supersede
and are intended to provide parity with those -- including supporting
32-bit mode, having the inner loops do 4 AES blocks per iteration, etc.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/aes.c               |   4 +-
 lib/crypto/x86/aes-aesni.S | 232 +++++++++++++++++++++++++++++++++++++
 lib/crypto/x86/aes.h       |  89 ++++++++++++++
 3 files changed, 323 insertions(+), 2 deletions(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index b1f71d2b2460..bf8acc553188 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -625,7 +625,7 @@ static struct skcipher_alg skcipher_algs[] = {
 	{
 		.base.cra_name = "cbc(aes)",
 		.base.cra_driver_name = "cbc-aes-lib",
-		.base.cra_priority = 110,
+		.base.cra_priority = IS_ENABLED(CONFIG_X86) ? 300 : 110,
 		.base.cra_blocksize = AES_BLOCK_SIZE,
 		.base.cra_ctxsize = sizeof(struct aes_key),
 		.base.cra_module = THIS_MODULE,
@@ -651,7 +651,7 @@ static struct skcipher_alg skcipher_algs[] = {
 	{
 		.base.cra_name = "cts(cbc(aes))",
 		.base.cra_driver_name = "cts-cbc-aes-lib",
-		.base.cra_priority = 110,
+		.base.cra_priority = IS_ENABLED(CONFIG_X86) ? 300 : 110,
 		.base.cra_blocksize = AES_BLOCK_SIZE,
 		.base.cra_ctxsize = sizeof(struct aes_key),
 		.base.cra_module = THIS_MODULE,
diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
index 52f4ee5c13b9..51c8522416d7 100644
--- a/lib/crypto/x86/aes-aesni.S
+++ b/lib/crypto/x86/aes-aesni.S
@@ -57,6 +57,14 @@
 	// The AES round constants, used during key expansion
 	.long	0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80, 0x1b, 0x36
 
+.Lcts_permute_table:
+	.byte	0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte	0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte	0x00, 0x01, 0x02, 0x03, 0x04, 0x05, 0x06, 0x07
+	.byte	0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f
+	.byte	0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+	.byte	0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80, 0x80
+
 .text
 
 // In 32-bit mode, push certain callee-saved GPRs and optionally load function
@@ -402,3 +410,227 @@ SYM_FUNC_END(aes_ecb_encrypt_aesni)
 SYM_FUNC_START(aes_ecb_decrypt_aesni)
 	_ecb_crypt	0
 SYM_FUNC_END(aes_ecb_decrypt_aesni)
+
+// void aes_cbc_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      u8 iv[AES_BLOCK_SIZE],
+//			      const struct aes_enckey *key);
+//
+// This assumes nblocks > 0.
+SYM_FUNC_START(aes_cbc_encrypt_aesni)
+	// Arguments
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	NBLOCKS,	ARG2
+	.set	IV_PTR,		ARG3
+	.set	KEY,		ARG4
+
+	// Other local variables
+#ifdef __x86_64__
+	.set	RNDKEY_PTR,	%r9
+#else
+	.set	RNDKEY_PTR,	IV_PTR // IV_PTR is clobbered and reloaded later
+#endif
+	.set	NROUNDS,	TMP_32
+	.set	AESDATA0,	%xmm0
+	.set	PTEXT,		%xmm1
+	_prologue	uses_arg3=2, uses_arg4=2
+
+	movdqu		(IV_PTR), AESDATA0
+.p2align 5
+.Lcbc_enc_loop:
+	movdqu		(SRC), PTEXT
+	pxor		PTEXT, AESDATA0
+	_do_aes		1, 0
+	movdqu		AESDATA0, (DST)
+	add		$16, SRC
+	add		$16, DST
+	dec		NBLOCKS
+	jnz		.Lcbc_enc_loop
+
+	// Store the next IV.  On 32-bit, reload IV_PTR from stack first.
+	_reload_arg3
+	movdqu		AESDATA0, (IV_PTR)
+	_epilogue
+SYM_FUNC_END(aes_cbc_encrypt_aesni)
+
+// void aes_cbc_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      u8 iv[AES_BLOCK_SIZE], const struct aes_key *key);
+SYM_FUNC_START(aes_cbc_decrypt_aesni)
+	// Arguments
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	NBLOCKS,	ARG2
+	.set	NBLOCKS32,	ARG2_32	// Used for improved code density
+	.set	IV_PTR,		ARG3
+	.set	KEY,		ARG4
+
+	// Other local variables
+#ifdef __x86_64__
+	.set	RNDKEY_PTR,	%r9
+#else
+	.set	RNDKEY_PTR,	IV_PTR // IV_PTR is clobbered and reloaded later
+#endif
+	.set	NROUNDS,	TMP_32
+	.set	AESDATA0,	%xmm0
+	.set	AESDATA1,	%xmm1
+	.set	AESDATA2,	%xmm2
+	.set	AESDATA3,	%xmm3
+	.set	RNDKEY,		%xmm4
+	.set	IV,		%xmm5
+	.set	CTEXT0,		%xmm6
+	.set	CTEXT1,		%xmm7
+#ifdef __x86_64__
+	.set	CTEXT2,		%xmm8
+	.set	CTEXT3,		%xmm9
+#endif
+	_prologue	uses_arg3=2, uses_arg4=2
+
+	movdqu		(IV_PTR), IV
+
+	sub		$4, NBLOCKS
+	jl		.Lcbc_dec_loop4_done
+.p2align 5
+.Lcbc_dec_loop4:
+	movdqu		0(SRC), AESDATA0
+	movdqu		16(SRC), AESDATA1
+	movdqu		32(SRC), AESDATA2
+	movdqu		48(SRC), AESDATA3
+	movdqa		AESDATA0, CTEXT0
+	movdqa		AESDATA1, CTEXT1
+#ifdef __x86_64__
+	movdqa		AESDATA2, CTEXT2
+	movdqa		AESDATA3, CTEXT3
+#endif
+	_do_aes		0, 0,1,2,3
+	pxor		IV, AESDATA0
+	pxor		CTEXT0, AESDATA1
+	pxor		CTEXT1, AESDATA2
+#ifdef __x86_64__
+	pxor		CTEXT2, AESDATA3
+	movdqa		CTEXT3, IV
+#else
+	movdqu		32(SRC), CTEXT0
+	pxor		CTEXT0, AESDATA3
+	movdqu		48(SRC), IV
+#endif
+	movdqu		AESDATA0, 0(DST)
+	movdqu		AESDATA1, 16(DST)
+	movdqu		AESDATA2, 32(DST)
+	movdqu		AESDATA3, 48(DST)
+	add		$64, SRC
+	add		$64, DST
+	sub		$4, NBLOCKS
+	jge		.Lcbc_dec_loop4
+.Lcbc_dec_loop4_done:
+	add		$4, NBLOCKS32
+	jz		.Lcbc_dec_done
+
+.Lcbc_dec_loop1:
+	movdqu		(SRC), AESDATA0
+	movdqa		AESDATA0, CTEXT0
+	_do_aes		0, 0
+	pxor		IV, AESDATA0
+	movdqa		CTEXT0, IV
+	movdqu		AESDATA0, (DST)
+	add		$16, SRC
+	add		$16, DST
+	dec		NBLOCKS32
+	jnz		.Lcbc_dec_loop1
+
+.Lcbc_dec_done:
+	// Store the next IV.  On 32-bit, reload IV_PTR from stack first.
+	_reload_arg3
+	movdqu		IV, (IV_PTR)
+	_epilogue
+SYM_FUNC_END(aes_cbc_decrypt_aesni)
+
+.macro	_aes_cbc_cts_crypt	enc
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	PN_LEN,		ARG2
+	.set	IV_PTR,		ARG3
+	.set	KEY,		ARG4
+	.set	RNDKEY_PTR,	IV_PTR	// Temporary register for _do_aes
+	.set	NROUNDS,	TMP_32	// Temporary register for _do_aes
+	.set	RSHIFT_MASK,	%xmm0 // range(16-PN_LEN,16) + [0x80, 0x80, ...]
+				      // Must be %xmm0 for pblendvb to work.
+	.set	LSHIFT_MASK,	%xmm1 // [0x80, 0x80, ...] + range(PN_LEN)
+	.set	AESDATA0,	%xmm2
+	.set	AESDATA1,	%xmm3
+	.set	RNDKEY,		%xmm4 // Temporary register for _do_aes
+	.set	IV,		%xmm5
+
+	_prologue	uses_arg3=2, uses_arg4=2
+
+	// Load LSHIFT_MASK and RSHIFT_MASK.
+	lea		RODATA(.Lcts_permute_table), TMP
+	movdqu		(TMP,PN_LEN), LSHIFT_MASK
+	sub		PN_LEN, TMP
+	movdqu		32(TMP), RSHIFT_MASK
+
+	// Load the IV, freeing up IV_PTR to reuse for RNDKEY_PTR.
+	movdqu		(IV_PTR), IV
+
+	// Load the second-from-last source block (P[n-1] or C[n-1]) and
+	// AES-en/decrypt it.  In the encryption case, XOR it with the IV first.
+	movdqu		(SRC), AESDATA0
+.if \enc
+	pxor		IV, AESDATA0
+.endif
+	_do_aes		\enc, 0
+
+	// Load the last source block (P[n] or C[n]), left-aligned.
+	movdqu		(SRC,PN_LEN), AESDATA1
+
+.if \enc
+	// Right-align P[n], XOR it with the first AES output, and AES-encrypt
+	// the result.  This gives C[n-1] in AESDATA1.
+	pshufb		RSHIFT_MASK, AESDATA1
+	pxor		AESDATA0, AESDATA1
+	_do_aes		1, 1
+
+	// Left-align the first AES output to get left-aligned C[n].
+	pshufb		LSHIFT_MASK, AESDATA0
+.else
+	// Save a copy of the first AES output in %xmm6 for later.
+	movdqa		AESDATA0, %xmm6
+
+	// Left-align the first AES output and XOR it with the
+	// already-left-aligned C[n].  This gives the left-aligned P[n].
+	pshufb		LSHIFT_MASK, AESDATA0
+	pxor		AESDATA1, AESDATA0
+
+	// Right-align C[n], then use RSHIFT_MASK (in %xmm0 as pblendvb's
+	// implicit operand) as a blend mask to select C[n] and the remaining
+	// bytes from the first AES output, with the result in AESDATA1.
+	pshufb		RSHIFT_MASK, AESDATA1
+	pblendvb	%xmm6, AESDATA1
+
+	// AES-decrypt the result and XOR with the IV to get P[n-1] in AESDATA1.
+	_do_aes		0, 1
+	pxor		IV, AESDATA1
+.endif
+	// Store the left-aligned C[n] or P[n], then C[n-1] or P[n-1].
+	// Note that these stores may overlap.
+	movdqu		AESDATA0, (DST,PN_LEN)
+	movdqu		AESDATA1, (DST)
+	_epilogue
+.endm
+
+// void aes_cbc_cts_encrypt_aesni(u8 *dst, const u8 *src, long pn_len,
+//				  const u8 iv[AES_BLOCK_SIZE],
+//				  const struct aes_enckey *key);
+// void aes_cbc_cts_decrypt_aesni(u8 *dst, const u8 *src, long pn_len,
+//				  const u8 iv[AES_BLOCK_SIZE],
+//				  const struct aes_key *key);
+//
+// Use the CS3 variant of ciphertext stealing to encrypt or decrypt the last two
+// blocks in a message.  The two blocks are located at src and consist of one
+// full block of length 16 bytes and one possibly-partial block of length 1 <=
+// pn_len <= 16 bytes.  The output is written to dst, which may equal src.
+SYM_FUNC_START(aes_cbc_cts_encrypt_aesni)
+	_aes_cbc_cts_crypt	1
+SYM_FUNC_END(aes_cbc_cts_encrypt_aesni)
+SYM_FUNC_START(aes_cbc_cts_decrypt_aesni)
+	_aes_cbc_cts_crypt	0
+SYM_FUNC_END(aes_cbc_cts_decrypt_aesni)
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
index 408625750ae9..a0346cb3ecb5 100644
--- a/lib/crypto/x86/aes.h
+++ b/lib/crypto/x86/aes.h
@@ -116,6 +116,95 @@ static bool aes_ecb_decrypt_arch(u8 *dst, const u8 *src, size_t len,
 }
 #endif /* CONFIG_CRYPTO_LIB_AES_ECB */
 
+#if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_CBC)
+void aes_cbc_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   u8 iv[AES_BLOCK_SIZE], const struct aes_enckey *key);
+void aes_cbc_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   u8 iv[AES_BLOCK_SIZE], const struct aes_key *key);
+void aes_cbc_cts_encrypt_aesni(u8 *dst, const u8 *src, long pn_len,
+			       const u8 iv[AES_BLOCK_SIZE],
+			       const struct aes_enckey *key);
+void aes_cbc_cts_decrypt_aesni(u8 *dst, const u8 *src, long pn_len,
+			       const u8 iv[AES_BLOCK_SIZE],
+			       const struct aes_key *key);
+
+/* len is always a positive multiple of AES_BLOCK_SIZE here. */
+#define aes_cbc_encrypt_arch aes_cbc_encrypt_arch
+static bool aes_cbc_encrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 u8 iv[AES_BLOCK_SIZE],
+				 const struct aes_enckey *key)
+{
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+	kernel_fpu_begin();
+	aes_cbc_encrypt_aesni(dst, src, len / AES_BLOCK_SIZE, iv, key);
+	kernel_fpu_end();
+	return true;
+}
+
+/* len is always a positive multiple of AES_BLOCK_SIZE here. */
+#define aes_cbc_decrypt_arch aes_cbc_decrypt_arch
+static bool aes_cbc_decrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 u8 iv[AES_BLOCK_SIZE],
+				 const struct aes_key *key)
+{
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+	kernel_fpu_begin();
+	aes_cbc_decrypt_aesni(dst, src, len / AES_BLOCK_SIZE, iv, key);
+	kernel_fpu_end();
+	return true;
+}
+
+/* len can be any value greater than AES_BLOCK_SIZE here. */
+#define aes_cbc_cts_encrypt_arch aes_cbc_cts_encrypt_arch
+static bool aes_cbc_cts_encrypt_arch(u8 *dst, const u8 *src, size_t len,
+				     u8 iv[AES_BLOCK_SIZE],
+				     const struct aes_enckey *key)
+{
+	const size_t cbc_blocks = (len - AES_BLOCK_SIZE - 1) / AES_BLOCK_SIZE;
+	const size_t pn_len = ((len - 1) % AES_BLOCK_SIZE) + 1;
+
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+
+	kernel_fpu_begin();
+	if (cbc_blocks) {
+		aes_cbc_encrypt_aesni(dst, src, cbc_blocks, iv, key);
+		dst += cbc_blocks * AES_BLOCK_SIZE;
+		src += cbc_blocks * AES_BLOCK_SIZE;
+	}
+	/* Encrypt the last 17 to 32 bytes. */
+	aes_cbc_cts_encrypt_aesni(dst, src, pn_len, iv, key);
+	kernel_fpu_end();
+	return true;
+}
+
+/* len can be any value greater than AES_BLOCK_SIZE here. */
+#define aes_cbc_cts_decrypt_arch aes_cbc_cts_decrypt_arch
+static bool aes_cbc_cts_decrypt_arch(u8 *dst, const u8 *src, size_t len,
+				     u8 iv[AES_BLOCK_SIZE],
+				     const struct aes_key *key)
+{
+	const size_t cbc_blocks = (len - AES_BLOCK_SIZE - 1) / AES_BLOCK_SIZE;
+	const size_t pn_len = ((len - 1) % AES_BLOCK_SIZE) + 1;
+
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+
+	kernel_fpu_begin();
+	if (cbc_blocks) {
+		aes_cbc_decrypt_aesni(dst, src, cbc_blocks, iv, key);
+		dst += cbc_blocks * AES_BLOCK_SIZE;
+		src += cbc_blocks * AES_BLOCK_SIZE;
+	}
+	/* Decrypt the last 17 to 32 bytes. */
+	aes_cbc_cts_decrypt_aesni(dst, src, pn_len, iv, key);
+	kernel_fpu_end();
+	return true;
+}
+#endif /* CONFIG_CRYPTO_LIB_AES_CBC */
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
