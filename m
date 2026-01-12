Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD07CF45C9
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AzoYaHse5uSE248Pm1FkPM0vw/06CHBkmxP7QY9tymw=; b=P0i96djdCc9uDY
	eQBQR+xSGa0cXNLyjlPueTS+HrOTE/zZPhSNI5BlC1pE6EDyKg1gQyAH0nQzWSH50TkBlQYu3+/SJ
	TW8ARLcV0ahr+uij+75aJvbGMS5TvcAprP1aEZp+kyVMhs5mdMuAxrUlLJbqPAN1XyL+Lod6rlL/F
	URGbbZztQHNZh89+LhXrlc7bisI+Ui8+b1mfGbCfBkT2LNqyf91xW/1kBSAjGRtk02c0iMyVG8o3m
	ZH+EJBiQ7R0Farn98uIU+K3wvVtPUZzFPwX8ZXE0bv/T8XXxHsBnHfSGYiOdruznjEhpW10758Y48
	71sY6eDUaEa/yixESXkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNXN-000000061MY-1Acv;
	Mon, 12 Jan 2026 19:25:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVj-00000005z7V-2ezg;
	Mon, 12 Jan 2026 19:23:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 421E7443B9;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2F1FC2BC9E;
	Mon, 12 Jan 2026 19:23:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245811;
	bh=NltvZkewEHgk0OxV2OlqHClzS++fArO+KBZ7L9kUlbk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DyrNjcdd2UgBnDotjEXY8qII9iGNu1uEWirOyLRGsPUKHPRmLRsgrQYJZfK17EFOT
	 Jjmq4w+utco9K5dko0xzOYNRvHThKn5H4/AzH0lvIa19igg/yEDaSoVVv0SEtNMe+E
	 XSL1UzonfD7FtxVxqTjWkIT9zWnw19PISlMGaCOs9Ro7UEMdlMOZD/wId2NdVT1IqP
	 yD6n1DPoVEl4eDRd4NEovQLTRJa1HSn+1iQ9HkrnviY85iMQyaDiYspDFfsvSgjk77
	 FezNcc7WxWghb/T1QHeymsQNN3jPz/6MgE1q6Al5w6cr8a9181ylkwZWI9A5uMbQuY
	 lQVtTc+2DGfZg==
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
Subject: [PATCH v2 24/35] crypto: arm64/ghash - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:22 -0800
Message-ID: <20260112192035.10427-25-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112331_759268_395554AD 
X-CRM114-Status: GOOD (  14.34  )
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note that in addition to the change in the key preparation function and
the key struct type itself, the change in the type of the key struct
results in aes_encrypt() (which is temporarily a type-generic macro)
calling the new encryption function rather than the old one.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/ghash-ce-glue.c | 27 +++++++--------------------
 1 file changed, 7 insertions(+), 20 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index ef249d06c92c..63bb9e062251 100644
--- a/arch/arm64/crypto/ghash-ce-glue.c
+++ b/arch/arm64/crypto/ghash-ce-glue.c
@@ -38,11 +38,11 @@ struct ghash_key {
 struct arm_ghash_desc_ctx {
 	u64 digest[GHASH_DIGEST_SIZE/sizeof(u64)];
 };
 
 struct gcm_aes_ctx {
-	struct crypto_aes_ctx	aes_key;
+	struct aes_enckey	aes_key;
 	u8			nonce[RFC4106_NONCE_SIZE];
 	struct ghash_key	ghash_key;
 };
 
 asmlinkage void pmull_ghash_update_p64(int blocks, u64 dg[], const char *src,
@@ -184,31 +184,19 @@ static struct shash_alg ghash_alg = {
 	.import			= ghash_import,
 	.descsize		= sizeof(struct arm_ghash_desc_ctx),
 	.statesize		= sizeof(struct ghash_desc_ctx),
 };
 
-static int num_rounds(struct crypto_aes_ctx *ctx)
-{
-	/*
-	 * # of rounds specified by AES:
-	 * 128 bit key		10 rounds
-	 * 192 bit key		12 rounds
-	 * 256 bit key		14 rounds
-	 * => n byte key	=> 6 + (n/4) rounds
-	 */
-	return 6 + ctx->key_length / 4;
-}
-
 static int gcm_aes_setkey(struct crypto_aead *tfm, const u8 *inkey,
 			  unsigned int keylen)
 {
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(tfm);
 	u8 key[GHASH_BLOCK_SIZE];
 	be128 h;
 	int ret;
 
-	ret = aes_expandkey(&ctx->aes_key, inkey, keylen);
+	ret = aes_prepareenckey(&ctx->aes_key, inkey, keylen);
 	if (ret)
 		return -EINVAL;
 
 	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
 
@@ -294,11 +282,10 @@ static void gcm_calculate_auth_mac(struct aead_request *req, u64 dg[], u32 len)
 
 static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 {
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(aead);
-	int nrounds = num_rounds(&ctx->aes_key);
 	struct skcipher_walk walk;
 	u8 buf[AES_BLOCK_SIZE];
 	u64 dg[2] = {};
 	be128 lengths;
 	u8 *tag;
@@ -329,12 +316,12 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 			tag = NULL;
 		}
 
 		scoped_ksimd()
 			pmull_gcm_encrypt(nbytes, dst, src, ctx->ghash_key.h,
-					  dg, iv, ctx->aes_key.key_enc, nrounds,
-					  tag);
+					  dg, iv, ctx->aes_key.k.rndkeys,
+					  ctx->aes_key.nrounds, tag);
 
 		if (unlikely(!nbytes))
 			break;
 
 		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
@@ -357,11 +344,10 @@ static int gcm_encrypt(struct aead_request *req, char *iv, int assoclen)
 static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 {
 	struct crypto_aead *aead = crypto_aead_reqtfm(req);
 	struct gcm_aes_ctx *ctx = crypto_aead_ctx(aead);
 	unsigned int authsize = crypto_aead_authsize(aead);
-	int nrounds = num_rounds(&ctx->aes_key);
 	struct skcipher_walk walk;
 	u8 otag[AES_BLOCK_SIZE];
 	u8 buf[AES_BLOCK_SIZE];
 	u64 dg[2] = {};
 	be128 lengths;
@@ -399,12 +385,13 @@ static int gcm_decrypt(struct aead_request *req, char *iv, int assoclen)
 		}
 
 		scoped_ksimd()
 			ret = pmull_gcm_decrypt(nbytes, dst, src,
 						ctx->ghash_key.h,
-						dg, iv, ctx->aes_key.key_enc,
-						nrounds, tag, otag, authsize);
+						dg, iv, ctx->aes_key.k.rndkeys,
+						ctx->aes_key.nrounds, tag, otag,
+						authsize);
 
 		if (unlikely(!nbytes))
 			break;
 
 		if (unlikely(nbytes > 0 && nbytes < AES_BLOCK_SIZE))
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
