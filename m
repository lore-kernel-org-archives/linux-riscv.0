Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7FB0C2A075
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 05:17:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GYm4rva61GaChSMrpU+T80/VCHah90wwuTdnPI3u6OM=; b=nef4GBlnN/W4t5
	HmyBHG9HQJZhwNoG+6VP/KthHEwjF31BI6KYiTQMXerzGZC+vz3GaT/QnCcvaEJ+CZhekMQuVlmG7
	N2iuNhkuiwQAWCyBMXAg60wzC7Ua398FI3rp5bzrfalh3e+a5z88MMKnxYMi7/zGmb+TxEsxCDTHS
	n6Qtkd6SOLuHiHbGtKuAen9CCzk6xXL52+g/bd8eRqOqHrHP01xlIuvJSvdKvbkd9eOuWFyHGmcZ1
	fvFsRFg+xB0j3Aainoj/U4w9k4TRELf17VP2ehSvAo8x7cwbQROYGahOn5JNYRJ6gBK9P6eJP6BtT
	flzwJbx+AHDYtrB2VJjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccxY-0000000AlkC-0QZ6;
	Mon, 05 Jan 2026 05:16:52 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvr-0000000Aj3N-01pd;
	Mon, 05 Jan 2026 05:15:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CDD2B4430E;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F442C4AF09;
	Mon,  5 Jan 2026 05:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590106;
	bh=X2y6JmsAPpKxGvYBZWX3/Sy84iagH93kp9gxdC5t9Go=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Rmly392a977vLVI0kfIty/rm8OhHHS/k5IDBLd9WUUdJDGUZk77qfzuOUZOwqSYu0
	 +ILUM5sQMAanzj4L78EzSjqCPf2HbWVRLYRZqzVH7Cbp9jqwmY6YFz5sK0ZEtElr9u
	 lS8cI0RrtadOm8Rz0A/pLiOBP71fBx2HYzL6NRrvOjx09dXoh5lV+UA3n9zI9RJgC5
	 E+d33a+vjyQ0RncbIGufV5ni6Frma+umzTnzXfF9wggbwtWr2tyzfNce83TUAEC1sJ
	 HWFMoH7PJKLC4UJAJZrbQppx0tXeDO2LY9c/RAgt/1mvYY0OIen/I21GHPWpt/BLRK
	 Hh9X0ljtBlWDA==
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
Subject: [PATCH 24/36] crypto: arm64/ghash - Use new AES library API
Date: Sun,  4 Jan 2026 21:12:57 -0800
Message-ID: <20260105051311.1607207-25-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211507_131049_08CB6176 
X-CRM114-Status: GOOD (  13.37  )
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

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/arm64/crypto/ghash-ce-glue.c | 29 ++++++++---------------------
 1 file changed, 8 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/crypto/ghash-ce-glue.c b/arch/arm64/crypto/ghash-ce-glue.c
index ef249d06c92c..bfd38e485e77 100644
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
@@ -184,35 +184,23 @@ static struct shash_alg ghash_alg = {
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
 
-	aes_encrypt(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
+	aes_encrypt_new(&ctx->aes_key, key, (u8[AES_BLOCK_SIZE]){});
 
 	/* needed for the fallback */
 	memcpy(&ctx->ghash_key.k, key, GHASH_BLOCK_SIZE);
 
 	ghash_reflect(ctx->ghash_key.h[0], &ctx->ghash_key.k);
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
