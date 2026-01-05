Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E5CC2A072
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 05:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+9puQWmYCuOZiBuQ0pqCfAKmoRu2eOXQWK0A9WOWxWU=; b=UA9ptaATWdRcey
	uX/507IQBmXSoaXe92jH6Vk2E/zUipSc6NT/oJBBijllQa4Pbp9ErkYxbfKvsGAmHUK4L2nOI45zj
	eDhpZOw1S/Vf3H6CBsDpW0l8UGTq+WFQV3MBXxrQz2ICEqDbpMccQ8HOH5EZy2RVijViBk0ToCBgY
	CLF14Lr+i4k8TriuAh5pU5IrMw+4zDBLtDbqLsuJewLmql0dvO5k3D0i/2spjnGcgP/sFCNH3zIxe
	MT2NAgvJXJXcECyLrIl0hilJiGImhCtIMOa2tytvT6Tg/K355rZ8jL8OnQXScA24J6d/XLUyObLaq
	OE7wsod7kCSEKgA3Zqlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccxp-0000000AmAa-0WYx;
	Mon, 05 Jan 2026 05:17:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvt-0000000AjMe-2uQ1;
	Mon, 05 Jan 2026 05:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1D2656013A;
	Mon,  5 Jan 2026 05:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37F03C4AF0B;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590108;
	bh=pLGtNzAKc0LyxTZ2Mcmb/pp64y+CkxfMTXzhOdP/RaU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MmsZ/qRfKLZytMKJmngb3WeBk7WVifeswTA12xXEF/l57Xl/NJSVBbNUA4cwJNMzn
	 bLUBK10x2R3XWrRzzbm2cxC+XGscGowPV2OAkNqiMiKKOyaF1fuMz8/qw6K24KiA6F
	 oKScxEhEiKwjEgeoI3fbB/Jul9LjMFF9xtMKZVYjrpry0t3ykWEUdm4YdcSXX/TJDF
	 tash1gU50u/+Jr6pw6eTTnRaRac3IodBZOVBFYi9A/5AoHratPyMRbPqNuTCUFy+oD
	 UaO7bLexyNyJFhMS0RxR35euAkapgX8ZUlTnTXAYB9aKd7QBrHsFpPrzLnoKmFcU7R
	 i/TXDkuCc/yig==
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
Subject: [PATCH 27/36] crypto: chelsio - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:00 -0800
Message-ID: <20260105051311.1607207-28-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
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

Switch from the old AES library functions (which use struct
crypto_aes_ctx) to the new ones (which use struct aes_key and struct
aes_enckey).  In encryption-only use cases, this eliminates the
unnecessary computation and caching of the decryption round keys.  The
new AES en/decryption functions are also much faster and use AES
instructions when supported by the CPU.

Note: aes_encrypt_new() and aes_decrypt_new() will be renamed to
aes_encrypt() and aes_decrypt(), respectively, once all callers of the
old aes_encrypt() and aes_decrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/chelsio/chcr_algo.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/crypto/chelsio/chcr_algo.c b/drivers/crypto/chelsio/chcr_algo.c
index 22cbc343198a..b6b97088dfc5 100644
--- a/drivers/crypto/chelsio/chcr_algo.c
+++ b/drivers/crypto/chelsio/chcr_algo.c
@@ -1026,11 +1026,11 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
 			     u32 isfinal)
 {
 	struct crypto_skcipher *tfm = crypto_skcipher_reqtfm(req);
 	struct ablk_ctx *ablkctx = ABLK_CTX(c_ctx(tfm));
 	struct chcr_skcipher_req_ctx *reqctx = skcipher_request_ctx(req);
-	struct crypto_aes_ctx aes;
+	struct aes_key aes;
 	int ret, i;
 	u8 *key;
 	unsigned int keylen;
 	int round = reqctx->last_req_len / AES_BLOCK_SIZE;
 	int round8 = round / 8;
@@ -1042,24 +1042,24 @@ static int chcr_update_tweak(struct skcipher_request *req, u8 *iv,
 	/* For a 192 bit key remove the padded zeroes which was
 	 * added in chcr_xts_setkey
 	 */
 	if (KEY_CONTEXT_CK_SIZE_G(ntohl(ablkctx->key_ctx_hdr))
 			== CHCR_KEYCTX_CIPHER_KEY_SIZE_192)
-		ret = aes_expandkey(&aes, key, keylen - 8);
+		ret = aes_preparekey(&aes, key, keylen - 8);
 	else
-		ret = aes_expandkey(&aes, key, keylen);
+		ret = aes_preparekey(&aes, key, keylen);
 	if (ret)
 		return ret;
-	aes_encrypt(&aes, iv, iv);
+	aes_encrypt_new(&aes, iv, iv);
 	for (i = 0; i < round8; i++)
 		gf128mul_x8_ble((le128 *)iv, (le128 *)iv);
 
 	for (i = 0; i < (round % 8); i++)
 		gf128mul_x_ble((le128 *)iv, (le128 *)iv);
 
 	if (!isfinal)
-		aes_decrypt(&aes, iv, iv);
+		aes_decrypt_new(&aes, iv, iv);
 
 	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
@@ -3404,11 +3404,11 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 {
 	struct chcr_aead_ctx *aeadctx = AEAD_CTX(a_ctx(aead));
 	struct chcr_gcm_ctx *gctx = GCM_CTX(aeadctx);
 	unsigned int ck_size;
 	int ret = 0, key_ctx_size = 0;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 
 	aeadctx->enckey_len = 0;
 	crypto_aead_clear_flags(aeadctx->sw_cipher, CRYPTO_TFM_REQ_MASK);
 	crypto_aead_set_flags(aeadctx->sw_cipher, crypto_aead_get_flags(aead)
 			      & CRYPTO_TFM_REQ_MASK);
@@ -3442,17 +3442,17 @@ static int chcr_gcm_setkey(struct crypto_aead *aead, const u8 *key,
 						0, 0,
 						key_ctx_size >> 4);
 	/* Calculate the H = CIPH(K, 0 repeated 16 times).
 	 * It will go in key context
 	 */
-	ret = aes_expandkey(&aes, key, keylen);
+	ret = aes_prepareenckey(&aes, key, keylen);
 	if (ret) {
 		aeadctx->enckey_len = 0;
 		goto out;
 	}
 	memset(gctx->ghash_h, 0, AEAD_H_SIZE);
-	aes_encrypt(&aes, gctx->ghash_h, gctx->ghash_h);
+	aes_encrypt_new(&aes, gctx->ghash_h, gctx->ghash_h);
 	memzero_explicit(&aes, sizeof(aes));
 
 out:
 	return ret;
 }
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
