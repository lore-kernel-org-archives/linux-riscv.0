Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E67DC982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:16:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xa9TUov3gxKjsWgBHcHsBCuUNzpQTq8bAhbWkUZdnqE=; b=PAdoZIidH9fUfq
	jsGUJEw3jgGxWYhvWN7zKcx9we+2r04+6F9WuApkq7MpC7aUkDw6cBN+/YBYxsjZ8HFSOCOPUhSQs
	ufzdDKt6mRsoIdJgQlxhu4iLh4V7CTNrEW4PdF77pgdWIvlHoXB7amt2mIRZbEhoFHjZ5U61bOwmU
	g7VUkAZcuMGZlQGFtr13XUTKQQT8r6TxQYbUxRr+nX0lIh7mlXpGdvuNLLkFJWBgUf7Ned3SYT6vB
	AF4dt/nivOSBAfxiHfkW48enI5VhzoS93+vl/5mGNrhno1Mr7ya+NwoIDbPysVojzZ6ngtTSFx1U8
	thu503niUaISG6/RqKgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNy-00000000tJf-0gJm;
	Mon, 21 Sep 2026 05:16:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNq-00000000tEq-2n2S
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6C6CD42E69;
	Mon, 21 Sep 2026 05:16:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1884B1F00899;
	Mon, 21 Sep 2026 05:16:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967766;
	bh=mlQyMsJiv5qUwYGxCdI53YiBa6XzV8Yve52rPyxXedA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=aOGxvqZT5zaFfD40iwgE0np9/MJ+a+abKSfw/YV1o1zaMPyGd5SspbV5/FKIRFiik
	 XWQk8MZK9PKBpHs9wLCbL72stKyd/yTKJ4mEB1hQL8HPBX9YSjCWa88W79tjsP+flm
	 lFrlpNQr5KuwFHNYNO6PmSiVDGa7LiGFEiLKJ8KzrKUwZlNHARjwgLzSrAUwLI6pet
	 GAjYJTxXw0ButJpoedXTZuZh4nt9IZIxDU96uYoxWbN9eYWk5KEuIF2F+BnTSVe2TD
	 hMVoiuxYSH675w3M+zVMF6H5wI95m6JAW/tlflKeDsijCraawhNMCrqXJuTChhjs1m
	 +4EoubPJiwvVg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 08/20] crypto: x86/aes-ecb - Remove superseded ECB skcipher
Date: Sun, 20 Sep 2026 22:08:54 -0700
Message-ID: <20260921050910.296144-9-ebiggers@kernel.org>
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

Now that the AES-ECB library functions are optimized with dedicated
AES-NI code and exposed via the skcipher API via crypto/aes.c, the
similar implementation in aesni-intel is redundant.  Remove it.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig            |   4 +-
 arch/x86/crypto/aesni-intel_asm.S  | 121 -----------------------------
 arch/x86/crypto/aesni-intel_glue.c |  62 ---------------
 3 files changed, 2 insertions(+), 185 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index f65d7b83702f..ecd4931557a3 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -3,14 +3,14 @@
 menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 
 config CRYPTO_AES_NI_INTEL
-	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
+	tristate "Ciphers: AES, modes: CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
 	select CRYPTO_SKCIPHER
 	help
 	  AEAD cipher: AES with GCM
-	  Length-preserving ciphers: AES with ECB, CBC, CTS, CTR, XCTR, XTS
+	  Length-preserving ciphers: AES with CBC, CTS, CTR, XCTR, XTS
 
 	  Architecture: x86 (32-bit and 64-bit) using:
 	  - AES-NI (AES new instructions)
diff --git a/arch/x86/crypto/aesni-intel_asm.S b/arch/x86/crypto/aesni-intel_asm.S
index 6abe5e38a6d7..db7f259ee8ab 100644
--- a/arch/x86/crypto/aesni-intel_asm.S
+++ b/arch/x86/crypto/aesni-intel_asm.S
@@ -601,127 +601,6 @@ SYM_FUNC_START_LOCAL(_aesni_dec4)
 	RET
 SYM_FUNC_END(_aesni_dec4)
 
-/*
- * void aesni_ecb_enc(struct crypto_aes_ctx *ctx, const u8 *dst, u8 *src,
- *		      size_t len)
- */
-SYM_FUNC_START(aesni_ecb_enc)
-	FRAME_BEGIN
-#ifndef __x86_64__
-	pushl LEN
-	pushl KEYP
-	pushl KLEN
-	movl (FRAME_OFFSET+16)(%esp), KEYP	# ctx
-	movl (FRAME_OFFSET+20)(%esp), OUTP	# dst
-	movl (FRAME_OFFSET+24)(%esp), INP	# src
-	movl (FRAME_OFFSET+28)(%esp), LEN	# len
-#endif
-	test LEN, LEN		# check length
-	jz .Lecb_enc_ret
-	mov 480(KEYP), KLEN
-	cmp $16, LEN
-	jb .Lecb_enc_ret
-	cmp $64, LEN
-	jb .Lecb_enc_loop1
-.align 4
-.Lecb_enc_loop4:
-	movups (INP), STATE1
-	movups 0x10(INP), STATE2
-	movups 0x20(INP), STATE3
-	movups 0x30(INP), STATE4
-	call _aesni_enc4
-	movups STATE1, (OUTP)
-	movups STATE2, 0x10(OUTP)
-	movups STATE3, 0x20(OUTP)
-	movups STATE4, 0x30(OUTP)
-	sub $64, LEN
-	add $64, INP
-	add $64, OUTP
-	cmp $64, LEN
-	jge .Lecb_enc_loop4
-	cmp $16, LEN
-	jb .Lecb_enc_ret
-.align 4
-.Lecb_enc_loop1:
-	movups (INP), STATE1
-	call _aesni_enc1
-	movups STATE1, (OUTP)
-	sub $16, LEN
-	add $16, INP
-	add $16, OUTP
-	cmp $16, LEN
-	jge .Lecb_enc_loop1
-.Lecb_enc_ret:
-#ifndef __x86_64__
-	popl KLEN
-	popl KEYP
-	popl LEN
-#endif
-	FRAME_END
-	RET
-SYM_FUNC_END(aesni_ecb_enc)
-
-/*
- * void aesni_ecb_dec(struct crypto_aes_ctx *ctx, const u8 *dst, u8 *src,
- *		      size_t len);
- */
-SYM_FUNC_START(aesni_ecb_dec)
-	FRAME_BEGIN
-#ifndef __x86_64__
-	pushl LEN
-	pushl KEYP
-	pushl KLEN
-	movl (FRAME_OFFSET+16)(%esp), KEYP	# ctx
-	movl (FRAME_OFFSET+20)(%esp), OUTP	# dst
-	movl (FRAME_OFFSET+24)(%esp), INP	# src
-	movl (FRAME_OFFSET+28)(%esp), LEN	# len
-#endif
-	test LEN, LEN
-	jz .Lecb_dec_ret
-	mov 480(KEYP), KLEN
-	add $240, KEYP
-	cmp $16, LEN
-	jb .Lecb_dec_ret
-	cmp $64, LEN
-	jb .Lecb_dec_loop1
-.align 4
-.Lecb_dec_loop4:
-	movups (INP), STATE1
-	movups 0x10(INP), STATE2
-	movups 0x20(INP), STATE3
-	movups 0x30(INP), STATE4
-	call _aesni_dec4
-	movups STATE1, (OUTP)
-	movups STATE2, 0x10(OUTP)
-	movups STATE3, 0x20(OUTP)
-	movups STATE4, 0x30(OUTP)
-	sub $64, LEN
-	add $64, INP
-	add $64, OUTP
-	cmp $64, LEN
-	jge .Lecb_dec_loop4
-	cmp $16, LEN
-	jb .Lecb_dec_ret
-.align 4
-.Lecb_dec_loop1:
-	movups (INP), STATE1
-	call _aesni_dec1
-	movups STATE1, (OUTP)
-	sub $16, LEN
-	add $16, INP
-	add $16, OUTP
-	cmp $16, LEN
-	jge .Lecb_dec_loop1
-.Lecb_dec_ret:
-#ifndef __x86_64__
-	popl KLEN
-	popl KEYP
-	popl LEN
-#endif
-	FRAME_END
-	RET
-SYM_FUNC_END(aesni_ecb_dec)
-
 /*
  * void aesni_cbc_enc(struct crypto_aes_ctx *ctx, const u8 *dst, u8 *src,
  *		      size_t len, u8 *iv)
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index f522fff9231e..f3b9cfb0b813 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -61,10 +61,6 @@ static inline void *aes_align_addr(void *addr)
 asmlinkage void aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
 			      unsigned int key_len);
 asmlinkage void aesni_enc(const void *ctx, u8 *out, const u8 *in);
-asmlinkage void aesni_ecb_enc(struct crypto_aes_ctx *ctx, u8 *out,
-			      const u8 *in, unsigned int len);
-asmlinkage void aesni_ecb_dec(struct crypto_aes_ctx *ctx, u8 *out,
-			      const u8 *in, unsigned int len);
 asmlinkage void aesni_cbc_enc(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len, u8 *iv);
 asmlinkage void aesni_cbc_dec(struct crypto_aes_ctx *ctx, u8 *out,
@@ -119,50 +115,6 @@ static int aesni_skcipher_setkey(struct crypto_skcipher *tfm, const u8 *key,
 	return aes_set_key_common(aes_ctx(crypto_skcipher_ctx(tfm)), key, len);
 }
 
-static int ecb_encrypt(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_skcipher_ctx(tfm));
-	struct skcipher_walk walk;
-	unsigned int nbytes;
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	while ((nbytes = walk.nbytes)) {
-		kernel_fpu_begin();
-		aesni_ecb_enc(ctx, walk.dst.virt.addr, walk.src.virt.addr,
-			      nbytes & AES_BLOCK_MASK);
-		kernel_fpu_end();
-		nbytes &= AES_BLOCK_SIZE - 1;
-		err = skcipher_walk_done(&walk, nbytes);
-	}
-
-	return err;
-}
-
-static int ecb_decrypt(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_skcipher_ctx(tfm));
-	struct skcipher_walk walk;
-	unsigned int nbytes;
-	int err;
-
-	err = skcipher_walk_virt(&walk, req, false);
-
-	while ((nbytes = walk.nbytes)) {
-		kernel_fpu_begin();
-		aesni_ecb_dec(ctx, walk.dst.virt.addr, walk.src.virt.addr,
-			      nbytes & AES_BLOCK_MASK);
-		kernel_fpu_end();
-		nbytes &= AES_BLOCK_SIZE - 1;
-		err = skcipher_walk_done(&walk, nbytes);
-	}
-
-	return err;
-}
-
 static int cbc_encrypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
@@ -513,20 +465,6 @@ static int xts_decrypt_aesni(struct skcipher_request *req)
 
 static struct skcipher_alg aesni_skciphers[] = {
 	{
-		.base = {
-			.cra_name		= "ecb(aes)",
-			.cra_driver_name	= "ecb-aes-aesni",
-			.cra_priority		= 400,
-			.cra_blocksize		= AES_BLOCK_SIZE,
-			.cra_ctxsize		= CRYPTO_AES_CTX_SIZE,
-			.cra_module		= THIS_MODULE,
-		},
-		.min_keysize	= AES_MIN_KEY_SIZE,
-		.max_keysize	= AES_MAX_KEY_SIZE,
-		.setkey		= aesni_skcipher_setkey,
-		.encrypt	= ecb_encrypt,
-		.decrypt	= ecb_decrypt,
-	}, {
 		.base = {
 			.cra_name		= "cbc(aes)",
 			.cra_driver_name	= "cbc-aes-aesni",
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
