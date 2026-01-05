Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1346CC2A077
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 05:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yn25mWVL0jUnirDMm9i7nsVIjruKMktO9aiJtH2TO1U=; b=ySVHp1+fxbYosZ
	laeshIi1av7XpDTMFy/wH8Nka7Ak/5SdqkngNVeGEH/bjPXVcl0+i6XKeYtLv9cHCT49HQYUzSUUC
	ViH1yp/uTxS9NKsS8qHRX3llr9noZqUYOP2+kCHHN+KlmsGi4so2ZQGTZBlQh6hu03LR1ZiQSBtCS
	uA279erEe8QcuGeekOYUQ2bRZLbQP1hdgVO0X1+Y5L/h157g5bxvBnmb/C6B4dlg9bFbM6gZiP66j
	0z/C3TbWvxohnF8wd5DeHp7Bhx8S1kAwnJjo9vzlx9Wdf8y/hBAsr9P/VVH+VN/+RKdAXI5twk3uU
	2pg/TfpgDTmWks6BPtKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccwu-0000000Akq0-3ADL;
	Mon, 05 Jan 2026 05:16:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvm-0000000Aj8U-4BtL;
	Mon, 05 Jan 2026 05:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D2DEA44315;
	Mon,  5 Jan 2026 05:15:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D35ECC2BCB1;
	Mon,  5 Jan 2026 05:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590102;
	bh=hJC9DSn5UYENY36JqLwojxw3h+UBaQgfoLRRAZMtsK4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CdFQXBRRFdl+EMlqiCVNkNbaGKA/Qkt5IHNn8GMj5jkLVVMlSr34WOdhrJk37bWOm
	 JoSzZqeqQIdKOlIIXojh2hhZD7I+3OEPs4Kkd0jTyHrXhJ5H3uwbaREhqZtGPZTnuh
	 QLUgEORHsIG4u7+Gx5wu1Y/2wAeBG0aVFjqJmK7qjCAj322AxOG6xQDtqcFp8rhrVF
	 Y1RG6/QNOb3tT6ao+LVdrDNmGFoKzRN46JWUWezG3hsUx22aTi1zoHyKtrVCLKQ5CA
	 5wph2RCuDkwBu4Z9lOcuu6Sjr/aXV+jKQ1j3NeHgtenzPdesv0/P85zeX1s1e420DZ
	 z2yyazlPAXgNw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	linux-arm-kernel@lists.infradead.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Holger Dengler <dengler@linux.ibm.com>,
	Harald Freudenberger <freude@linux.ibm.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 18/36] crypto: x86/aes - Remove the superseded AES-NI crypto_cipher
Date: Sun,  4 Jan 2026 21:12:51 -0800
Message-ID: <20260105051311.1607207-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211503_096490_23F17ECC 
X-CRM114-Status: GOOD (  12.20  )
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

Remove the "aes-aesni" crypto_cipher algorithm and the code specific to
its implementation.  It is no longer necessary because the AES library
is now optimized with x86 AES-NI, and crypto/aes.c exposes the AES
library via the crypto_cipher API.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/x86/crypto/Kconfig            |  2 -
 arch/x86/crypto/aesni-intel_asm.S  | 25 ------------
 arch/x86/crypto/aesni-intel_glue.c | 62 +-----------------------------
 3 files changed, 1 insertion(+), 88 deletions(-)

diff --git a/arch/x86/crypto/Kconfig b/arch/x86/crypto/Kconfig
index ebb0838eaf30..7fb2319a0916 100644
--- a/arch/x86/crypto/Kconfig
+++ b/arch/x86/crypto/Kconfig
@@ -5,14 +5,12 @@ menu "Accelerated Cryptographic Algorithms for CPU (x86)"
 config CRYPTO_AES_NI_INTEL
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XCTR, XTS, GCM (AES-NI/VAES)"
 	select CRYPTO_AEAD
 	select CRYPTO_LIB_AES
 	select CRYPTO_LIB_GF128MUL
-	select CRYPTO_ALGAPI
 	select CRYPTO_SKCIPHER
 	help
-	  Block cipher: AES cipher algorithms
 	  AEAD cipher: AES with GCM
 	  Length-preserving ciphers: AES with ECB, CBC, CTS, CTR, XCTR, XTS
 
 	  Architecture: x86 (32-bit and 64-bit) using:
 	  - AES-NI (AES new instructions)
diff --git a/arch/x86/crypto/aesni-intel_asm.S b/arch/x86/crypto/aesni-intel_asm.S
index b37881bb9f15..6abe5e38a6d7 100644
--- a/arch/x86/crypto/aesni-intel_asm.S
+++ b/arch/x86/crypto/aesni-intel_asm.S
@@ -434,35 +434,10 @@ SYM_FUNC_START_LOCAL(_aesni_enc4)
 	aesenclast KEY, STATE3
 	aesenclast KEY, STATE4
 	RET
 SYM_FUNC_END(_aesni_enc4)
 
-/*
- * void aesni_dec (const void *ctx, u8 *dst, const u8 *src)
- */
-SYM_FUNC_START(aesni_dec)
-	FRAME_BEGIN
-#ifndef __x86_64__
-	pushl KEYP
-	pushl KLEN
-	movl (FRAME_OFFSET+12)(%esp), KEYP	# ctx
-	movl (FRAME_OFFSET+16)(%esp), OUTP	# dst
-	movl (FRAME_OFFSET+20)(%esp), INP	# src
-#endif
-	mov 480(KEYP), KLEN		# key length
-	add $240, KEYP
-	movups (INP), STATE		# input
-	call _aesni_dec1
-	movups STATE, (OUTP)		#output
-#ifndef __x86_64__
-	popl KLEN
-	popl KEYP
-#endif
-	FRAME_END
-	RET
-SYM_FUNC_END(aesni_dec)
-
 /*
  * _aesni_dec1:		internal ABI
  * input:
  *	KEYP:		key struct pointer
  *	KLEN:		key length
diff --git a/arch/x86/crypto/aesni-intel_glue.c b/arch/x86/crypto/aesni-intel_glue.c
index 48405e02d6e4..453e0e890041 100644
--- a/arch/x86/crypto/aesni-intel_glue.c
+++ b/arch/x86/crypto/aesni-intel_glue.c
@@ -58,11 +58,10 @@ static inline void *aes_align_addr(void *addr)
 }
 
 asmlinkage void aesni_set_key(struct crypto_aes_ctx *ctx, const u8 *in_key,
 			      unsigned int key_len);
 asmlinkage void aesni_enc(const void *ctx, u8 *out, const u8 *in);
-asmlinkage void aesni_dec(const void *ctx, u8 *out, const u8 *in);
 asmlinkage void aesni_ecb_enc(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len);
 asmlinkage void aesni_ecb_dec(struct crypto_aes_ctx *ctx, u8 *out,
 			      const u8 *in, unsigned int len);
 asmlinkage void aesni_cbc_enc(struct crypto_aes_ctx *ctx, u8 *out,
@@ -111,43 +110,10 @@ static int aes_set_key_common(struct crypto_aes_ctx *ctx,
 	aesni_set_key(ctx, in_key, key_len);
 	kernel_fpu_end();
 	return 0;
 }
 
-static int aes_set_key(struct crypto_tfm *tfm, const u8 *in_key,
-		       unsigned int key_len)
-{
-	return aes_set_key_common(aes_ctx(crypto_tfm_ctx(tfm)), in_key,
-				  key_len);
-}
-
-static void aesni_encrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_tfm_ctx(tfm));
-
-	if (!crypto_simd_usable()) {
-		aes_encrypt(ctx, dst, src);
-	} else {
-		kernel_fpu_begin();
-		aesni_enc(ctx, dst, src);
-		kernel_fpu_end();
-	}
-}
-
-static void aesni_decrypt(struct crypto_tfm *tfm, u8 *dst, const u8 *src)
-{
-	struct crypto_aes_ctx *ctx = aes_ctx(crypto_tfm_ctx(tfm));
-
-	if (!crypto_simd_usable()) {
-		aes_decrypt(ctx, dst, src);
-	} else {
-		kernel_fpu_begin();
-		aesni_dec(ctx, dst, src);
-		kernel_fpu_end();
-	}
-}
-
 static int aesni_skcipher_setkey(struct crypto_skcipher *tfm, const u8 *key,
 			         unsigned int len)
 {
 	return aes_set_key_common(aes_ctx(crypto_skcipher_ctx(tfm)), key, len);
 }
@@ -542,29 +508,10 @@ static int xts_encrypt_aesni(struct skcipher_request *req)
 static int xts_decrypt_aesni(struct skcipher_request *req)
 {
 	return xts_crypt(req, aesni_xts_encrypt_iv, aesni_xts_decrypt);
 }
 
-static struct crypto_alg aesni_cipher_alg = {
-	.cra_name		= "aes",
-	.cra_driver_name	= "aes-aesni",
-	.cra_priority		= 300,
-	.cra_flags		= CRYPTO_ALG_TYPE_CIPHER,
-	.cra_blocksize		= AES_BLOCK_SIZE,
-	.cra_ctxsize		= CRYPTO_AES_CTX_SIZE,
-	.cra_module		= THIS_MODULE,
-	.cra_u	= {
-		.cipher	= {
-			.cia_min_keysize	= AES_MIN_KEY_SIZE,
-			.cia_max_keysize	= AES_MAX_KEY_SIZE,
-			.cia_setkey		= aes_set_key,
-			.cia_encrypt		= aesni_encrypt,
-			.cia_decrypt		= aesni_decrypt
-		}
-	}
-};
-
 static struct skcipher_alg aesni_skciphers[] = {
 	{
 		.base = {
 			.cra_name		= "ecb(aes)",
 			.cra_driver_name	= "ecb-aes-aesni",
@@ -1687,18 +1634,14 @@ static int __init aesni_init(void)
 	int err;
 
 	if (!x86_match_cpu(aesni_cpu_id))
 		return -ENODEV;
 
-	err = crypto_register_alg(&aesni_cipher_alg);
-	if (err)
-		return err;
-
 	err = crypto_register_skciphers(aesni_skciphers,
 					ARRAY_SIZE(aesni_skciphers));
 	if (err)
-		goto unregister_cipher;
+		return err;
 
 	err = crypto_register_aeads(aes_gcm_algs_aesni,
 				    ARRAY_SIZE(aes_gcm_algs_aesni));
 	if (err)
 		goto unregister_skciphers;
@@ -1714,22 +1657,19 @@ static int __init aesni_init(void)
 	crypto_unregister_aeads(aes_gcm_algs_aesni,
 				ARRAY_SIZE(aes_gcm_algs_aesni));
 unregister_skciphers:
 	crypto_unregister_skciphers(aesni_skciphers,
 				    ARRAY_SIZE(aesni_skciphers));
-unregister_cipher:
-	crypto_unregister_alg(&aesni_cipher_alg);
 	return err;
 }
 
 static void __exit aesni_exit(void)
 {
 	crypto_unregister_aeads(aes_gcm_algs_aesni,
 				ARRAY_SIZE(aes_gcm_algs_aesni));
 	crypto_unregister_skciphers(aesni_skciphers,
 				    ARRAY_SIZE(aesni_skciphers));
-	crypto_unregister_alg(&aesni_cipher_alg);
 	unregister_avx_algs();
 }
 
 module_init(aesni_init);
 module_exit(aesni_exit);
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
