Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1710C982DA
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TwBfA6BBi5RkmrNpR+Flc6xRcON6n/dUzCRntx1FfzU=; b=aXBnWf8QgloljP
	sJn8GWbdSP3WT5kiMni9jeTYxvKTiwfzeI/etEX1BdV83r+DJ4dnDsbOi/3M1KDg4GVu6Z2KlJ0ay
	TbIG4t57svo4nQ02+gYq5KFkzIq2wXIdJWy3CskJuxnkxYpJsW0KfVQzd5aXTuSXiYWwk16CQA7y3
	54hqU1BPeE/e65JHXo2AL8hMwLF3oQN78RUQwStT+TlmobRMFcn0U54gD/MkJxeI+GqW1NlkrQctA
	mzz3t4eTiV28Rqwp68cVGAB8JfTWSZu2/Oo3e7gpAcd1VH3lrlm/h/6vBEbAOVxeRK7QeG8/Sx+rZ
	N9DnmenXieYabHxCeHEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WOA-00000000tUV-2qMw;
	Mon, 21 Sep 2026 05:16:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNu-00000000tH2-3S4E
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 909C642E69;
	Mon, 21 Sep 2026 05:16:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D1F71F000FF;
	Mon, 21 Sep 2026 05:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967770;
	bh=vlT+J7esaslXXYemR4OArHYwe0CTdSuz4G5sivbKcpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Km9EuofKDPOo2VpnsdxomeJcX1G59x46/4U0i5hePbSYsrciV+HwTY5M79rET52RW
	 x1QrFfpWmPS6gFB4LhtGA5JtiHfxG1o3bxpTIBo6JqdjxbSffvaVShrEquMJCdt5SN
	 RNbPwgFl7ZBE/FGz+wkH2Mwjw6FxoZpMPPQYGwxpg3v9JRs9WAelHc6xLriNyXqgwz
	 rI4F+787EHCEMsyAnYY0kRB9jONQwG4R6FdXGiUnVBZyueblV2ODzYDVIZW83UiP9Z
	 AtYFADVHpV2yoE3ldZby3eeT/kNTF5lPr1jN4G4kMr/xSCT6EHG/wwzbcM+CTZ+p+7
	 3uJ65DcrPNzTA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 19/20] lib/crypto: riscv/aes-ctr: Migrate optimized code into library
Date: Sun, 20 Sep 2026 22:09:05 -0700
Message-ID: <20260921050910.296144-20-ebiggers@kernel.org>
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

Instead of exposing the riscv-optimized AES-CTR code via a
riscv-specific crypto_skcipher algorithm, just implement the AES-CTR
library functions.  This is simpler, it makes the AES-CTR library
functions be riscv-optimized, and it also fixes the longstanding issue
where the riscv-optimized AES-CTR code was disabled by default.  AES-CTR
support still remains available through crypto_skcipher via
crypto/aes.c, but individual architectures no longer need to handle it.

To match what the library expects, update the assembly functions to
operate on struct aes_enckey rather than struct crypto_aes_ctx, and
adjust the argument order.

Bump up the priority of the corresponding library-based algorithm on
riscv now that it no longer has to be lower than arch/riscv/crypto/.
Also re-enable the library-based "ccm(aes)" and "gcm(aes)".

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/crypto/Kconfig                     |   5 +-
 arch/riscv/crypto/Makefile                    |   2 +-
 arch/riscv/crypto/aes-riscv64-glue.c          | 114 +-----------------
 crypto/aes.c                                  |   5 +-
 lib/crypto/Makefile                           |   4 +
 .../crypto/riscv}/aes-riscv64-zvkned-zvkb.S   |  23 ++--
 lib/crypto/riscv/aes.h                        |  69 ++++++++++-
 7 files changed, 91 insertions(+), 131 deletions(-)
 rename {arch/riscv/crypto => lib/crypto/riscv}/aes-riscv64-zvkned-zvkb.S (93%)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index 0a3f87ad384e..0733d4894401 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -3,18 +3,17 @@
 menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
-	tristate "Ciphers: AES, modes: CTR, XTS"
+	tristate "Ciphers: AES, modes: XTS"
 	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
 		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
-	  Length-preserving ciphers: AES with CTR, XTS
+	  Length-preserving ciphers: AES with XTS
 
 	  Architecture: riscv64 using:
 	  - Zvkned vector crypto extension
 	  - Zvbb vector extension (XTS)
-	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
 config CRYPTO_SM4_RISCV64
diff --git a/arch/riscv/crypto/Makefile b/arch/riscv/crypto/Makefile
index d8b85afa6d0b..08904603fc94 100644
--- a/arch/riscv/crypto/Makefile
+++ b/arch/riscv/crypto/Makefile
@@ -2,7 +2,7 @@
 
 obj-$(CONFIG_CRYPTO_AES_RISCV64) += aes-riscv64.o
 aes-riscv64-y := aes-riscv64-glue.o \
-		 aes-riscv64-zvkned-zvbb-zvkg.o aes-riscv64-zvkned-zvkb.o
+		 aes-riscv64-zvkned-zvbb-zvkg.o
 
 obj-$(CONFIG_CRYPTO_SM4_RISCV64) += sm4-riscv64.o
 sm4-riscv64-y := sm4-riscv64-glue.o sm4-riscv64-zvksed-zvkb.o
diff --git a/arch/riscv/crypto/aes-riscv64-glue.c b/arch/riscv/crypto/aes-riscv64-glue.c
index 97f5369d7e71..a7dcceb77c49 100644
--- a/arch/riscv/crypto/aes-riscv64-glue.c
+++ b/arch/riscv/crypto/aes-riscv64-glue.c
@@ -22,10 +22,6 @@
 #include <linux/minmax.h>
 #include <linux/module.h>
 
-asmlinkage void aes_ctr32_crypt_zvkned_zvkb(const struct crypto_aes_ctx *key,
-					    const u8 *in, u8 *out, size_t len,
-					    u8 iv[AES_BLOCK_SIZE]);
-
 asmlinkage void aes_xts_encrypt_zvkned_zvbb_zvkg(
 			const struct crypto_aes_ctx *key,
 			const u8 *in, u8 *out, size_t len,
@@ -62,75 +58,6 @@ static int riscv64_aes_setkey(struct crypto_aes_ctx *ctx,
 	return aes_expandkey(ctx, key, keylen);
 }
 
-static int riscv64_aes_setkey_skcipher(struct crypto_skcipher *tfm,
-				       const u8 *key, unsigned int keylen)
-{
-	struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-
-	return riscv64_aes_setkey(ctx, key, keylen);
-}
-
-/* AES-CTR */
-
-static int riscv64_aes_ctr_crypt(struct skcipher_request *req)
-{
-	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
-	const struct crypto_aes_ctx *ctx = crypto_skcipher_ctx(tfm);
-	unsigned int nbytes, p1_nbytes;
-	struct skcipher_walk walk;
-	u32 ctr32, nblocks;
-	int err;
-
-	/* Get the low 32-bit word of the 128-bit big endian counter. */
-	ctr32 = get_unaligned_be32(req->iv + 12);
-
-	err = skcipher_walk_virt(&walk, req, false);
-	while ((nbytes = walk.nbytes) != 0) {
-		if (nbytes < walk.total) {
-			/* Not the end yet, so keep the length block-aligned. */
-			nbytes = round_down(nbytes, AES_BLOCK_SIZE);
-			nblocks = nbytes / AES_BLOCK_SIZE;
-		} else {
-			/* It's the end, so include any final partial block. */
-			nblocks = DIV_ROUND_UP(nbytes, AES_BLOCK_SIZE);
-		}
-		ctr32 += nblocks;
-
-		kernel_vector_begin();
-		if (ctr32 >= nblocks) {
-			/* The low 32-bit word of the counter won't overflow. */
-			aes_ctr32_crypt_zvkned_zvkb(ctx, walk.src.virt.addr,
-						    walk.dst.virt.addr, nbytes,
-						    req->iv);
-		} else {
-			/*
-			 * The low 32-bit word of the counter will overflow.
-			 * The assembly doesn't handle this case, so split the
-			 * operation into two at the point where the overflow
-			 * will occur.  After the first part, add the carry bit.
-			 */
-			p1_nbytes = min(nbytes, (nblocks - ctr32) * AES_BLOCK_SIZE);
-			aes_ctr32_crypt_zvkned_zvkb(ctx, walk.src.virt.addr,
-						    walk.dst.virt.addr,
-						    p1_nbytes, req->iv);
-			crypto_inc(req->iv, 12);
-
-			if (ctr32) {
-				aes_ctr32_crypt_zvkned_zvkb(
-					ctx,
-					walk.src.virt.addr + p1_nbytes,
-					walk.dst.virt.addr + p1_nbytes,
-					nbytes - p1_nbytes, req->iv);
-			}
-		}
-		kernel_vector_end();
-
-		err = skcipher_walk_done(&walk, walk.nbytes - nbytes);
-	}
-
-	return err;
-}
-
 /* AES-XTS */
 
 struct riscv64_aes_xts_ctx {
@@ -251,25 +178,6 @@ static int riscv64_aes_xts_decrypt(struct skcipher_request *req)
 
 /* Algorithm definitions */
 
-static struct skcipher_alg riscv64_zvkned_zvkb_aes_skcipher_alg = {
-	.setkey = riscv64_aes_setkey_skcipher,
-	.encrypt = riscv64_aes_ctr_crypt,
-	.decrypt = riscv64_aes_ctr_crypt,
-	.min_keysize = AES_MIN_KEY_SIZE,
-	.max_keysize = AES_MAX_KEY_SIZE,
-	.ivsize = AES_BLOCK_SIZE,
-	.chunksize = AES_BLOCK_SIZE,
-	.walksize = 4 * AES_BLOCK_SIZE, /* matches LMUL=4 */
-	.base = {
-		.cra_blocksize = 1,
-		.cra_ctxsize = sizeof(struct crypto_aes_ctx),
-		.cra_priority = 300,
-		.cra_name = "ctr(aes)",
-		.cra_driver_name = "ctr-aes-riscv64-zvkned-zvkb",
-		.cra_module = THIS_MODULE,
-	},
-};
-
 static struct skcipher_alg riscv64_zvkned_zvbb_zvkg_aes_skcipher_alg = {
 	.setkey = riscv64_aes_xts_setkey,
 	.encrypt = riscv64_aes_xts_encrypt,
@@ -302,43 +210,27 @@ static int __init riscv64_aes_mod_init(void)
 
 	if (riscv_isa_extension_available(NULL, ZVKNED) &&
 	    riscv_vector_vlen() >= 128) {
-		if (riscv_isa_extension_available(NULL, ZVKB)) {
-			err = crypto_register_skcipher(
-				&riscv64_zvkned_zvkb_aes_skcipher_alg);
-			if (err)
-				return err;
-		}
-
 		if (riscv64_aes_xts_supported()) {
 			err = crypto_register_skcipher(
 				&riscv64_zvkned_zvbb_zvkg_aes_skcipher_alg);
 			if (err)
-				goto unregister_zvkned_zvkb_skcipher_alg;
+				return err;
 		}
 	}
 
 	return err;
-
-unregister_zvkned_zvkb_skcipher_alg:
-	if (riscv_isa_extension_available(NULL, ZVKB))
-		crypto_unregister_skcipher(&riscv64_zvkned_zvkb_aes_skcipher_alg);
-	return err;
 }
 
 static void __exit riscv64_aes_mod_exit(void)
 {
-	if (riscv64_aes_xts_supported())
-		crypto_unregister_skcipher(&riscv64_zvkned_zvbb_zvkg_aes_skcipher_alg);
-	if (riscv_isa_extension_available(NULL, ZVKB))
-		crypto_unregister_skcipher(&riscv64_zvkned_zvkb_aes_skcipher_alg);
+	crypto_unregister_skcipher(&riscv64_zvkned_zvbb_zvkg_aes_skcipher_alg);
 }
 
 module_init(riscv64_aes_mod_init);
 module_exit(riscv64_aes_mod_exit);
 
-MODULE_DESCRIPTION("AES-CTR/XTS (RISC-V accelerated)");
+MODULE_DESCRIPTION("AES-XTS (RISC-V accelerated)");
 MODULE_AUTHOR("Jerry Shih <jerry.shih@sifive.com>");
 MODULE_LICENSE("GPL");
 MODULE_ALIAS_CRYPTO("aes");
-MODULE_ALIAS_CRYPTO("ctr(aes)");
 MODULE_ALIAS_CRYPTO("xts(aes)");
diff --git a/crypto/aes.c b/crypto/aes.c
index e951f0e1fe5a..9990e5034d34 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -670,7 +670,8 @@ static struct skcipher_alg skcipher_algs[] = {
 	{
 		.base.cra_name = "ctr(aes)",
 		.base.cra_driver_name = "ctr-aes-lib",
-		.base.cra_priority = IS_ENABLED(CONFIG_X86) ? 300 : 110,
+		.base.cra_priority = (IS_ENABLED(CONFIG_RISCV) ||
+				      IS_ENABLED(CONFIG_X86)) ? 300 : 110,
 		.base.cra_blocksize = 1,
 		.base.cra_ctxsize = sizeof(struct aes_enckey),
 		.base.cra_module = THIS_MODULE,
@@ -1002,7 +1003,6 @@ static struct aead_alg aead_algs[] = {
 	!(IS_ENABLED(CONFIG_ARM) || \
 	  IS_ENABLED(CONFIG_ARM64) || \
 	  IS_ENABLED(CONFIG_POWERPC) || \
-	  IS_ENABLED(CONFIG_RISCV) || \
 	  IS_ENABLED(CONFIG_S390) || \
 	  IS_ENABLED(CONFIG_SPARC))
 	{
@@ -1045,7 +1045,6 @@ static struct aead_alg aead_algs[] = {
 	!(IS_ENABLED(CONFIG_ARM) || \
 	  IS_ENABLED(CONFIG_ARM64) || \
 	  IS_ENABLED(CONFIG_POWERPC) || \
-	  IS_ENABLED(CONFIG_RISCV) || \
 	  IS_ENABLED(CONFIG_S390) || \
 	  IS_ENABLED(CONFIG_SPARC))
 	{
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 02d89a226377..ff34aeda37ba 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -51,6 +51,10 @@ endif # !CONFIG_SPE
 endif # CONFIG_PPC
 
 libaes-$(CONFIG_RISCV) += riscv/aes-riscv64-zvkned.o
+ifneq ($(CONFIG_CRYPTO_LIB_AES_CTR),)
+libaes-$(CONFIG_RISCV) += riscv/aes-riscv64-zvkned-zvkb.o
+endif
+
 libaes-$(CONFIG_SPARC) += sparc/aes_asm.o
 
 libaes-$(CONFIG_X86) += x86/aes-aesni.o
diff --git a/arch/riscv/crypto/aes-riscv64-zvkned-zvkb.S b/lib/crypto/riscv/aes-riscv64-zvkned-zvkb.S
similarity index 93%
rename from arch/riscv/crypto/aes-riscv64-zvkned-zvkb.S
rename to lib/crypto/riscv/aes-riscv64-zvkned-zvkb.S
index 9962d4500587..93747d4cb5f3 100644
--- a/arch/riscv/crypto/aes-riscv64-zvkned-zvkb.S
+++ b/lib/crypto/riscv/aes-riscv64-zvkned-zvkb.S
@@ -49,11 +49,11 @@
 
 #include "aes-macros.S"
 
-#define KEYP		a0
-#define INP		a1
-#define OUTP		a2
-#define LEN		a3
-#define IVP		a4
+#define DST		a0
+#define SRC		a1
+#define LEN		a2
+#define IVP		a3
+#define KEYP		a4
 
 #define LEN32		a5
 #define VL_E32		a6
@@ -110,13 +110,13 @@
 
 	// XOR the data with the keystream.
 	vsetvli		t0, LEN, e8, m4, ta, ma
-	vle8.v		v20, (INP)
+	vle8.v		v20, (SRC)
 	vxor.vv		v20, v20, v24
-	vse8.v		v20, (OUTP)
+	vse8.v		v20, (DST)
 
 	// Advance the pointers and update the remaining length.
-	add		INP, INP, t0
-	add		OUTP, OUTP, t0
+	add		SRC, SRC, t0
+	add		DST, DST, t0
 	sub		LEN, LEN, t0
 	sub		LEN32, LEN32, VL_E32
 	srli		VL_BLOCKS, VL_E32, 2
@@ -133,9 +133,8 @@
 	ret
 .endm
 
-// void aes_ctr32_crypt_zvkned_zvkb(const struct crypto_aes_ctx *key,
-//				    const u8 *in, u8 *out, size_t len,
-//				    u8 iv[16]);
+// void aes_ctr32_crypt_zvkned_zvkb(u8 *dst, const u8 *src, u32 len, u8 iv[16],
+//				    const struct aes_enckey *key);
 SYM_FUNC_START(aes_ctr32_crypt_zvkned_zvkb)
 	aes_begin	KEYP, 128f, 192f
 	aes_ctr32_crypt	256
diff --git a/lib/crypto/riscv/aes.h b/lib/crypto/riscv/aes.h
index e02f9343d67d..2c4d1e58c703 100644
--- a/lib/crypto/riscv/aes.h
+++ b/lib/crypto/riscv/aes.h
@@ -9,6 +9,7 @@
 #include <asm/vector.h>
 
 static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_zvkned);
+static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_zvkned_zvkb);
 
 /* The assembly code assumes the following offsets. */
 static_assert(offsetof(struct aes_enckey, len) == 0);
@@ -159,10 +160,76 @@ static bool aes_cbc_cts_decrypt_arch(u8 *dst, const u8 *src, size_t len,
 }
 #endif /* CONFIG_CRYPTO_LIB_AES_CBC */
 
+#if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_CTR)
+void aes_ctr32_crypt_zvkned_zvkb(u8 *dst, const u8 *src, u32 len,
+				 u8 iv[16], const struct aes_enckey *key);
+
+static void aes_ctr_riscv(u8 *dst, const u8 *src, u32 len,
+			  u8 ctr[AES_BLOCK_SIZE], const struct aes_enckey *key)
+{
+	u32 ctr32 = get_unaligned_be32(&ctr[12]);
+	u32 part1_len;
+	u32 nblocks;
+
+	nblocks = DIV_ROUND_UP(len, AES_BLOCK_SIZE);
+	ctr32 += nblocks;
+
+	if (likely(ctr32 >= nblocks)) {
+		/* The low 32 bits of the counter won't overflow. */
+		aes_ctr32_crypt_zvkned_zvkb(dst, src, len, ctr, key);
+	} else {
+		/*
+		 * The low 32 bits of the counter will overflow.  The
+		 * assembly doesn't handle this case, so split the
+		 * operation into two at the point where the overflow
+		 * will occur.  After the first part, add the carry bit.
+		 */
+		part1_len = min(len, (nblocks - ctr32) * AES_BLOCK_SIZE);
+		aes_ctr32_crypt_zvkned_zvkb(dst, src, part1_len, ctr, key);
+		for (int i = AES_BLOCK_SIZE - 5; i >= 0; i--) {
+			if (++ctr[i] != 0)
+				break;
+		}
+		if (part1_len < len)
+			aes_ctr32_crypt_zvkned_zvkb(dst + part1_len,
+						    src + part1_len,
+						    len - part1_len, ctr, key);
+	}
+}
+
+#define aes_ctr_arch aes_ctr_arch
+static bool aes_ctr_arch(u8 *dst, const u8 *src, size_t len,
+			 u8 ctr[AES_BLOCK_SIZE], const struct aes_enckey *key)
+{
+	if (!static_branch_likely(&have_zvkned_zvkb) ||
+	    unlikely(!may_use_simd()))
+		return false;
+	kernel_vector_begin();
+	while (len) {
+		/*
+		 * Process at most a 32-bit len at a time, so that each step
+		 * needs to handle at most 1 carry bit out of the low 32-bit
+		 * word of the counter.
+		 */
+		u32 n = min(len, round_down(U32_MAX, AES_BLOCK_SIZE));
+
+		aes_ctr_riscv(dst, src, n, ctr, key);
+		dst += n;
+		src += n;
+		len -= n;
+	}
+	kernel_vector_end();
+	return true;
+}
+#endif /* CONFIG_CRYPTO_LIB_AES_CTR */
+
 #define aes_mod_init_arch aes_mod_init_arch
 static void aes_mod_init_arch(void)
 {
 	if (riscv_isa_extension_available(NULL, ZVKNED) &&
-	    riscv_vector_vlen() >= 128)
+	    riscv_vector_vlen() >= 128) {
 		static_branch_enable(&have_zvkned);
+		if (riscv_isa_extension_available(NULL, ZVKB))
+			static_branch_enable(&have_zvkned_zvkb);
+	}
 }
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
