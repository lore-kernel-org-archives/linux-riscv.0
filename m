Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2CEBC4829A
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Feb 2024 05:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Y2D5kaycJsLmCvH7R0fsmy7BiX0vFCuP7GCuz6ikg5Y=; b=rqO45o+TSgUVb6
	Fs8CgkMV/4gQoMiRVAkNms9xiHPUx/eHbYEzBa8nE1b5LB0bufcJtiSzHKEyk06ibK0l89nvmvOBJ
	IBmgUdtzIasQfiHlXeLN9mdXNX2uDIShdzbunS0amIh1QKsLrX/otlzvEDsz5x0BL7YkakD3eF5T2
	/WY+dN470fiMHvwTWYm55y39dfoingnkWFBCdLLW3d/OMRe6aSPTNqkR5QDM1b/ItoDacqdVTMKbx
	gmLf1lWrhOMdA7Uh+tiUJAfInmpWVt5/hb97I7cifOh3Ad/eGEJhyk6xTYCKpFvKqjvFT9bGabR20
	HP9/od9sPaJBOIk4EhiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlnN-000000082wN-29Gj;
	Tue, 13 Feb 2024 05:57:29 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rZlnK-000000082vo-1mNF
	for linux-riscv@lists.infradead.org;
	Tue, 13 Feb 2024 05:57:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id DA025CE19B8;
	Tue, 13 Feb 2024 05:57:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE3A5C43394;
	Tue, 13 Feb 2024 05:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1707803841;
	bh=ZoU2LAm/u+8wLy5XrHXYMxUvu+iwH+8hJ1JmmSNPLSY=;
	h=From:To:Cc:Subject:Date:From;
	b=uqEUQqPU4T9sMod+PVNuUxM9frXC5GgdOnR2vPt5/SITu4Ubb0XrcjY2W/UFj5dhB
	 FU/BXj+HOOv4FfAR0PF5xTk+0vCEpurVj+TtUZSfVZT3l/mkTdu0UkEHci0Hr652PS
	 s1XonNW6h/RIaQoGXcE6slUXDBmVPXbb6C5uUx3MjXc2HqxJHOZQNRadyD4+oF+lhi
	 raQP49oXRQE5VWEuC6CJO3SpNV+VtaFl+7YvhK7BFPzuAMcY2glSb1bud4JswsbCvg
	 71MgQ3kr1fxjOAWv/dMKXd+Rsm0KAF8X91X7UIYnESb/WNDnlHjyHc1nWWXpZrTjQP
	 S1LWqku1XzIDA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-riscv@lists.infradead.org,
	Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-crypto@vger.kernel.org,
	Jerry Shih <jerry.shih@sifive.com>,
	=?UTF-8?q?Christoph=20M=C3=BCllner?= <christoph.muellner@vrull.eu>,
	Heiko Stuebner <heiko@sntech.de>,
	Phoebe Chen <phoebe.chen@sifive.com>,
	Andy Chiu <andy.chiu@sifive.com>,
	Ard Biesheuvel <ardb@kernel.org>
Subject: [PATCH riscv/for-next] crypto: riscv - add vector crypto accelerated AES-CBC-CTS
Date: Mon, 12 Feb 2024 21:54:42 -0800
Message-ID: <20240213055442.35954-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240212_215726_855606_9D70BF36 
X-CRM114-Status: GOOD (  26.90  )
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

Add an implementation of cts(cbc(aes)) accelerated using the Zvkned
RISC-V vector crypto extension.  This is mainly useful for fscrypt,
where cts(cbc(aes)) is the "default" filenames encryption algorithm.  In
that use case, typically most messages are short and are block-aligned.
The CBC-CTS variant implemented is CS3; this is the variant Linux uses.

To perform well on short messages, the new implementation processes the
full message in one call to the assembly function if the data is
contiguous.  Otherwise it falls back to CBC operations followed by CTS
at the end.  For decryption, to further improve performance on short
messages, especially block-aligned messages, the CBC-CTS assembly
function parallelizes the AES decryption of all full blocks.  This
improves on the arm64 implementation of cts(cbc(aes)), which always
splits the CBC part(s) from the CTS part, doing the AES decryptions for
the last two blocks serially and usually loading the round keys twice.

Tested in QEMU with CONFIG_CRYPTO_MANAGER_EXTRA_TESTS=y.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/crypto/Kconfig              |   4 +-
 arch/riscv/crypto/aes-riscv64-glue.c   |  93 ++++++++++++++-
 arch/riscv/crypto/aes-riscv64-zvkned.S | 153 +++++++++++++++++++++++++
 3 files changed, 245 insertions(+), 5 deletions(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 2ad44e1d464a..ad58dad9a580 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -1,23 +1,23 @@
 # SPDX-License-Identifier: GPL-2.0
 
 menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
-	tristate "Ciphers: AES, modes: ECB, CBC, CTR, XTS"
+	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms
-	  Length-preserving ciphers: AES with ECB, CBC, CTR, XTS
+	  Length-preserving ciphers: AES with ECB, CBC, CTS, CTR, XTS
 
 	  Architecture: riscv64 using:
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
 config CRYPTO_CHACHA_RISCV64
 	tristate "Ciphers: ChaCha"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
diff --git a/arch/riscv/crypto/aes-riscv64-glue.c b/arch/riscv/crypto/aes-riscv64-glue.c
index 37bc6ef0be40..f814ee048555 100644
--- a/arch/riscv/crypto/aes-riscv64-glue.c
+++ b/arch/riscv/crypto/aes-riscv64-glue.c
@@ -1,20 +1,22 @@
 // SPDX-License-Identifier: GPL-2.0-only
 /*
  * AES using the RISC-V vector crypto extensions.  Includes the bare block
- * cipher and the ECB, CBC, CTR, and XTS modes.
+ * cipher and the ECB, CBC, CBC-CTS, CTR, and XTS modes.
  *
  * Copyright (C) 2023 VRULL GmbH
  * Author: Heiko Stuebner <heiko.stuebner@vrull.eu>
  *
  * Copyright (C) 2023 SiFive, Inc.
  * Author: Jerry Shih <jerry.shih@sifive.com>
+ *
+ * Copyright 2024 Google LLC
  */
 
 #include <asm/simd.h>
 #include <asm/vector.h>
 #include <crypto/aes.h>
 #include <crypto/internal/cipher.h>
 #include <crypto/internal/simd.h>
 #include <crypto/internal/skcipher.h>
 #include <crypto/scatterwalk.h>
 #include <crypto/xts.h>
@@ -33,20 +35,24 @@ asmlinkage void aes_ecb_encrypt_zvkned(const struct crypto_aes_ctx *key,
 asmlinkage void aes_ecb_decrypt_zvkned(const struct crypto_aes_ctx *key,
 				       const u8 *in, u8 *out, size_t len);
 
 asmlinkage void aes_cbc_encrypt_zvkned(const struct crypto_aes_ctx *key,
 				       const u8 *in, u8 *out, size_t len,
 				       u8 iv[AES_BLOCK_SIZE]);
 asmlinkage void aes_cbc_decrypt_zvkned(const struct crypto_aes_ctx *key,
 				       const u8 *in, u8 *out, size_t len,
 				       u8 iv[AES_BLOCK_SIZE]);
 
+asmlinkage void aes_cbc_cts_crypt_zvkned(const struct crypto_aes_ctx *key,
+					 const u8 *in, u8 *out, size_t len,
+					 const u8 iv[AES_BLOCK_SIZE], bool enc);
+
 asmlinkage void aes_ctr32_crypt_zvkned_zvkb(const struct crypto_aes_ctx *key,
 					    const u8 *in, u8 *out, size_t len,
 					    u8 iv[AES_BLOCK_SIZE]);
 
 asmlinkage void aes_xts_encrypt_zvkned_zvbb_zvkg(
 			const struct crypto_aes_ctx *key,
 			const u8 *in, u8 *out, size_t len,
 			u8 tweak[AES_BLOCK_SIZE]);
 
 asmlinkage void aes_xts_decrypt_zvkned_zvbb_zvkg(
@@ -157,21 +163,21 @@ static int riscv64_aes_ecb_encrypt(struct skcipher_request *req)
 	return riscv64_aes_ecb_crypt(req, true);
 }
 
 static int riscv64_aes_ecb_decrypt(struct skcipher_request *req)
 {
 	return riscv64_aes_ecb_crypt(req, false);
 }
 
 /* AES-CBC */
 
-static inline int riscv64_aes_cbc_crypt(struct skcipher_request *req, bool enc)
+static int riscv64_aes_cbc_crypt(struct skcipher_request *req, bool enc)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	struct skcipher_walk walk;
 	unsigned int nbytes;
 	int err;
 
 	err = skcipher_walk_virt(&walk, req, false);
 	while ((nbytes = walk.nbytes) != 0) {
 		kernel_vector_begin();
@@ -195,20 +201,84 @@ static inline int riscv64_aes_cbc_crypt(struct skcipher_request *req, bool enc)
 static int riscv64_aes_cbc_encrypt(struct skcipher_request *req)
 {
 	return riscv64_aes_cbc_crypt(req, true);
 }
 
 static int riscv64_aes_cbc_decrypt(struct skcipher_request *req)
 {
 	return riscv64_aes_cbc_crypt(req, false);
 }
 
+/* AES-CBC-CTS */
+
+static int riscv64_aes_cbc_cts_crypt(struct skcipher_request *req, bool enc)
+{
+	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
+	const struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
+	struct scatterlist sg_src[2], sg_dst[2];
+	struct skcipher_request subreq;
+	struct scatterlist *src, *dst;
+	struct skcipher_walk walk;
+	unsigned int cbc_len;
+	int err;
+
+	if (req->cryptlen < AES_BLOCK_SIZE)
+		return -EINVAL;
+
+	err = skcipher_walk_virt(&walk, req, false);
+	if (err)
+		return err;
+	/*
+	 * If the full message is available in one step, decrypt it in one call
+	 * to the CBC-CTS assembly function.  This reduces overhead, especially
+	 * on short messages.  Otherwise, fall back to doing CBC up to the last
+	 * two blocks, then invoke CTS just for the ciphertext stealing.
+	 */
+	if (unlikely(walk.nbytes != req->cryptlen)) {
+		cbc_len = round_down(req->cryptlen - AES_BLOCK_SIZE - 1,
+				     AES_BLOCK_SIZE);
+		skcipher_walk_abort(&walk);
+		skcipher_request_set_tfm(&subreq, tfm);
+		skcipher_request_set_callback(&subreq,
+					      skcipher_request_flags(req),
+					      NULL, NULL);
+		skcipher_request_set_crypt(&subreq, req->src, req->dst,
+					   cbc_len, req->iv);
+		err = riscv64_aes_cbc_crypt(&subreq, enc);
+		if (err)
+			return err;
+		dst = src = scatterwalk_ffwd(sg_src, req->src, cbc_len);
+		if (req->dst != req->src)
+			dst = scatterwalk_ffwd(sg_dst, req->dst, cbc_len);
+		skcipher_request_set_crypt(&subreq, src, dst,
+					   req->cryptlen - cbc_len, req->iv);
+		err = skcipher_walk_virt(&walk, &subreq, false);
+		if (err)
+			return err;
+	}
+	kernel_vector_begin();
+	aes_cbc_cts_crypt_zvkned(ctx, walk.src.virt.addr, walk.dst.virt.addr,
+				 walk.nbytes, req->iv, enc);
+	kernel_vector_end();
+	return skcipher_walk_done(&walk, 0);
+}
+
+static int riscv64_aes_cbc_cts_encrypt(struct skcipher_request *req)
+{
+	return riscv64_aes_cbc_cts_crypt(req, true);
+}
+
+static int riscv64_aes_cbc_cts_decrypt(struct skcipher_request *req)
+{
+	return riscv64_aes_cbc_cts_crypt(req, false);
+}
+
 /* AES-CTR */
 
 static int riscv64_aes_ctr_crypt(struct skcipher_request *req)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	const struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
 	unsigned int nbytes, p1_nbytes;
 	struct skcipher_walk walk;
 	u32 ctr32, nblocks;
 	int err;
@@ -427,20 +497,36 @@ static struct skcipher_alg riscv64_zvkned_aes_skcipher_algs[] = {
 		.max_keysize = AES_MAX_KEY_SIZE,
 		.ivsize = AES_BLOCK_SIZE,
 		.base = {
 			.cra_blocksize = AES_BLOCK_SIZE,
 			.cra_ctxsize = sizeof(struct crypto_aes_ctx),
 			.cra_priority = 300,
 			.cra_name = "cbc(aes)",
 			.cra_driver_name = "cbc-aes-riscv64-zvkned",
 			.cra_module = THIS_MODULE,
 		},
+	}, {
+		.setkey = riscv64_aes_setkey_skcipher,
+		.encrypt = riscv64_aes_cbc_cts_encrypt,
+		.decrypt = riscv64_aes_cbc_cts_decrypt,
+		.min_keysize = AES_MIN_KEY_SIZE,
+		.max_keysize = AES_MAX_KEY_SIZE,
+		.ivsize = AES_BLOCK_SIZE,
+		.walksize = 4 * AES_BLOCK_SIZE, /* matches LMUL=4 */
+		.base = {
+			.cra_blocksize = AES_BLOCK_SIZE,
+			.cra_ctxsize = sizeof(struct crypto_aes_ctx),
+			.cra_priority = 300,
+			.cra_name = "cts(cbc(aes))",
+			.cra_driver_name = "cts-cbc-aes-riscv64-zvkned",
+			.cra_module = THIS_MODULE,
+		},
 	}
 };
 
 static struct skcipher_alg riscv64_zvkned_zvkb_aes_skcipher_alg = {
 	.setkey = riscv64_aes_setkey_skcipher,
 	.encrypt = riscv64_aes_ctr_crypt,
 	.decrypt = riscv64_aes_ctr_crypt,
 	.min_keysize = AES_MIN_KEY_SIZE,
 	.max_keysize = AES_MAX_KEY_SIZE,
 	.ivsize = AES_BLOCK_SIZE,
@@ -533,18 +619,19 @@ static void __exit riscv64_aes_mod_exit(void)
 	if (riscv_isa_extension_available(NULL, ZVKB))
 		crypto_unregister_skcipher(&riscv64_zvkned_zvkb_aes_skcipher_alg);
 	crypto_unregister_skciphers(riscv64_zvkned_aes_skcipher_algs,
 				    ARRAY_SIZE(riscv64_zvkned_aes_skcipher_algs));
 	crypto_unregister_alg(&riscv64_zvkned_aes_cipher_alg);
 }
 
 module_init(riscv64_aes_mod_init);
 module_exit(riscv64_aes_mod_exit);
 
-MODULE_DESCRIPTION("AES-ECB/CBC/CTR/XTS (RISC-V accelerated)");
+MODULE_DESCRIPTION("AES-ECB/CBC/CTS/CTR/XTS (RISC-V accelerated)");
 MODULE_AUTHOR("Jerry Shih <jerry.shih@sifive.com>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CRYPTO("aes");
 MODULE_ALIAS_CRYPTO("ecb(aes)");
 MODULE_ALIAS_CRYPTO("cbc(aes)");
+MODULE_ALIAS_CRYPTO("cts(cbc(aes))");
 MODULE_ALIAS_CRYPTO("ctr(aes)");
 MODULE_ALIAS_CRYPTO("xts(aes)");
diff --git a/arch/riscv/crypto/aes-riscv64-zvkned.S b/arch/riscv/crypto/aes-riscv64-zvkned.S
index 43541aad6386..23d063f94ce6 100644
--- a/arch/riscv/crypto/aes-riscv64-zvkned.S
+++ b/arch/riscv/crypto/aes-riscv64-zvkned.S
@@ -177,10 +177,163 @@ SYM_FUNC_END(aes_cbc_encrypt_zvkned)
 
 // Same prototype and calling convention as the encryption function
 SYM_FUNC_START(aes_cbc_decrypt_zvkned)
 	aes_begin	KEYP, 128f, 192f
 	aes_cbc_decrypt	256
 128:
 	aes_cbc_decrypt	128
 192:
 	aes_cbc_decrypt	192
 SYM_FUNC_END(aes_cbc_decrypt_zvkned)
+
+.macro	aes_cbc_cts_encrypt	keylen
+
+	// CBC-encrypt all blocks except the last.  But don't store the
+	// second-to-last block to the output buffer yet, since it will be
+	// handled specially in the ciphertext stealing step.  Exception: if the
+	// message is single-block, still encrypt the last (and only) block.
+	li		t0, 16
+	j		2f
+1:
+	vse32.v		v16, (OUTP)	// Store ciphertext block
+	addi		OUTP, OUTP, 16
+2:
+	vle32.v		v17, (INP)	// Load plaintext block
+	vxor.vv		v16, v16, v17	// XOR with IV or prev ciphertext block
+	aes_encrypt	v16, \keylen	// Encrypt
+	addi		INP, INP, 16
+	addi		LEN, LEN, -16
+	bgt		LEN, t0, 1b	// Repeat if more than one block remains
+
+	// Special case: if the message is a single block, just do CBC.
+	beqz		LEN, .Lcts_encrypt_done\@
+
+	// Encrypt the last two blocks using ciphertext stealing as follows:
+	//	C[n-1] = Encrypt(Encrypt(P[n-1] ^ C[n-2]) ^ P[n])
+	//	C[n] = Encrypt(P[n-1] ^ C[n-2])[0..LEN]
+	//
+	// C[i] denotes the i'th ciphertext block, and likewise P[i] the i'th
+	// plaintext block.  Block n, the last block, may be partial; its length
+	// is 1 <= LEN <= 16.  If there are only 2 blocks, C[n-2] means the IV.
+	//
+	// v16 already contains Encrypt(P[n-1] ^ C[n-2]).
+	// INP points to P[n].  OUTP points to where C[n-1] should go.
+	// To support in-place encryption, load P[n] before storing C[n].
+	addi		t0, OUTP, 16	// Get pointer to where C[n] should go
+	vsetvli		zero, LEN, e8, m1, tu, ma
+	vle8.v		v17, (INP)	// Load P[n]
+	vse8.v		v16, (t0)	// Store C[n]
+	vxor.vv		v16, v16, v17	// v16 = Encrypt(P[n-1] ^ C[n-2]) ^ P[n]
+	vsetivli	zero, 4, e32, m1, ta, ma
+	aes_encrypt	v16, \keylen
+.Lcts_encrypt_done\@:
+	vse32.v		v16, (OUTP)	// Store C[n-1] (or C[n] in single-block case)
+	ret
+.endm
+
+#define LEN32		t4 // Length of remaining full blocks in 32-bit words
+#define LEN_MOD16	t5 // Length of message in bytes mod 16
+
+.macro	aes_cbc_cts_decrypt	keylen
+	andi		LEN32, LEN, ~15
+	srli		LEN32, LEN32, 2
+	andi		LEN_MOD16, LEN, 15
+
+	// Save C[n-2] in v28 so that it's available later during the ciphertext
+	// stealing step.  If there are fewer than three blocks, C[n-2] means
+	// the IV, otherwise it means the third-to-last ciphertext block.
+	vmv.v.v		v28, v16	// IV
+	add		t0, LEN, -33
+	bltz		t0, .Lcts_decrypt_loop\@
+	andi		t0, t0, ~15
+	add		t0, t0, INP
+	vle32.v		v28, (t0)
+
+	// CBC-decrypt all full blocks.  For the last full block, or the last 2
+	// full blocks if the message is block-aligned, this doesn't write the
+	// correct output blocks (unless the message is only a single block),
+	// because it XORs the wrong values with the raw AES plaintexts.  But we
+	// fix this after this loop without redoing the AES decryptions.  This
+	// approach allows more of the AES decryptions to be parallelized.
+.Lcts_decrypt_loop\@:
+	vsetvli		t0, LEN32, e32, m4, ta, ma
+	addi		t1, t0, -4
+	vle32.v		v20, (INP)	// Load next set of ciphertext blocks
+	vmv.v.v		v24, v16	// Get IV or last ciphertext block of prev set
+	vslideup.vi	v24, v20, 4	// Setup prev ciphertext blocks
+	vslidedown.vx	v16, v20, t1	// Save last ciphertext block of this set
+	aes_decrypt	v20, \keylen	// Decrypt this set of blocks
+	vxor.vv		v24, v24, v20	// XOR prev ciphertext blocks with decrypted blocks
+	vse32.v		v24, (OUTP)	// Store this set of plaintext blocks
+	sub		LEN32, LEN32, t0
+	slli		t0, t0, 2	// Words to bytes
+	add		INP, INP, t0
+	add		OUTP, OUTP, t0
+	bnez		LEN32, .Lcts_decrypt_loop\@
+
+	vsetivli	zero, 4, e32, m4, ta, ma
+	vslidedown.vx	v20, v20, t1	// Extract raw plaintext of last full block
+	addi		t0, OUTP, -16	// Get pointer to last full plaintext block
+	bnez		LEN_MOD16, .Lcts_decrypt_non_block_aligned\@
+
+	// Special case: if the message is a single block, just do CBC.
+	li		t1, 16
+	beq		LEN, t1, .Lcts_decrypt_done\@
+
+	// Block-aligned message.  Just fix up the last 2 blocks.  We need:
+	//
+	//	P[n-1] = Decrypt(C[n]) ^ C[n-2]
+	//	P[n] = Decrypt(C[n-1]) ^ C[n]
+	//
+	// We have C[n] in v16, Decrypt(C[n]) in v20, and C[n-2] in v28.
+	// Together with Decrypt(C[n-1]) ^ C[n-2] from the output buffer, this
+	// is everything needed to fix the output without re-decrypting blocks.
+	addi		t1, OUTP, -32	// Get pointer to where P[n-1] should go
+	vxor.vv		v20, v20, v28	// Decrypt(C[n]) ^ C[n-2] == P[n-1]
+	vle32.v		v24, (t1)	// Decrypt(C[n-1]) ^ C[n-2]
+	vse32.v		v20, (t1)	// Store P[n-1]
+	vxor.vv		v20, v24, v16	// Decrypt(C[n-1]) ^ C[n-2] ^ C[n] == P[n] ^ C[n-2]
+	j		.Lcts_decrypt_finish\@
+
+.Lcts_decrypt_non_block_aligned\@:
+	// Decrypt the last two blocks using ciphertext stealing as follows:
+	//
+	//	P[n-1] = Decrypt(C[n] || Decrypt(C[n-1])[LEN_MOD16..16]) ^ C[n-2]
+	//	P[n] = (Decrypt(C[n-1]) ^ C[n])[0..LEN_MOD16]
+	//
+	// We already have Decrypt(C[n-1]) in v20 and C[n-2] in v28.
+	vmv.v.v		v16, v20	// v16 = Decrypt(C[n-1])
+	vsetvli		zero, LEN_MOD16, e8, m1, tu, ma
+	vle8.v		v20, (INP)	// v20 = C[n] || Decrypt(C[n-1])[LEN_MOD16..16]
+	vxor.vv		v16, v16, v20	// v16 = Decrypt(C[n-1]) ^ C[n]
+	vse8.v		v16, (OUTP)	// Store P[n]
+	vsetivli	zero, 4, e32, m1, ta, ma
+	aes_decrypt	v20, \keylen	// v20 = Decrypt(C[n] || Decrypt(C[n-1])[LEN_MOD16..16])
+.Lcts_decrypt_finish\@:
+	vxor.vv		v20, v20, v28	// XOR with C[n-2]
+	vse32.v		v20, (t0)	// Store last full plaintext block
+.Lcts_decrypt_done\@:
+	ret
+.endm
+
+.macro	aes_cbc_cts_crypt	keylen
+	vle32.v		v16, (IVP)	// Load IV
+	beqz		a5, .Lcts_decrypt\@
+	aes_cbc_cts_encrypt \keylen
+.Lcts_decrypt\@:
+	aes_cbc_cts_decrypt \keylen
+.endm
+
+// void aes_cbc_cts_crypt_zvkned(const struct crypto_aes_ctx *key,
+//			         const u8 *in, u8 *out, size_t len,
+//				 const u8 iv[16], bool enc);
+//
+// Encrypts or decrypts a message with the CS3 variant of AES-CBC-CTS.
+// This is the variant that unconditionally swaps the last two blocks.
+SYM_FUNC_START(aes_cbc_cts_crypt_zvkned)
+	aes_begin	KEYP, 128f, 192f
+	aes_cbc_cts_crypt 256
+128:
+	aes_cbc_cts_crypt 128
+192:
+	aes_cbc_cts_crypt 192
+SYM_FUNC_END(aes_cbc_cts_crypt_zvkned)

base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
prerequisite-patch-id: 2a69e1270be0fa567cc43269826171d6e46d65de
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
