Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5915AC2A077
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 05:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yvLzUe4ryPIe2xlZ0bc/ublRQLUwnXHKCDRC1zeQfwI=; b=njW+TcdGje1mBV
	uCOweOcsDUWMXK/DO7uV0elcdudPel7MSfQzMbt4kB4pfNTorJULsfJp3tSuK0CD9JdOj31eP+M9I
	nwNlt/a6NlgJj8RimlFPdf+6bn51LK5r0dGnmt6uCgq59ZSYeCBaiiUOQkoAEg1JXkk3W5rasZ0QX
	ykoNVXI5W4HEMTb8QvYRbThk0CV9rypE5LixKAJt+V8ONxQnW/6/hChStdUe69IgRZRpitip2IruF
	Q/5h/Az1RtW36p9smS8hDtjaM82o0wFaHwdLM5bKLMQC3U9A1L+tp//pLoVCo7oX1WBB9+bSylqZH
	s2EcVa+NdtAEjxL78NJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccyW-0000000AnAd-2BMc;
	Mon, 05 Jan 2026 05:17:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvw-0000000AjQ7-1dDC;
	Mon, 05 Jan 2026 05:15:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 7B30560143;
	Mon,  5 Jan 2026 05:15:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF868C19424;
	Mon,  5 Jan 2026 05:15:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590111;
	bh=aczZF388MJyjmHPpFhPybAXNgrNBDPfQD3X1AxBltYA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=COMWjurarSx0tc1u0S//8fc2KTuNtS7ijGjFRXrLCJRnu+BuhGv5rgrBzbQUJ9eF5
	 fVBqlLQCuTXn/8/pQ/36762MnXgp49Y/vHrPz+Wy10++9qVLD712eBBI3lj9aXnofW
	 w9BoBKOvqzQIGb/Y3WbOUvJy4+90x0vv1nkK6HHPztOSezbco4jwJZe26f9WBPqpFS
	 Y33A2c+vhXOxvM9uuhpD/HfuD9O3XcHzM9gQcrRCNuE3jgGt8ftga6xph8pPM2WNwy
	 LnP5SXRnh6sRdcCJDF0YTvrEIRBr9CnT0phwNCdB/LyCfXliTTCkqThp8KHp5P5g2+
	 PtPGFK4PWLXCg==
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
Subject: [PATCH 31/36] crypto: omap - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:04 -0800
Message-ID: <20260105051311.1607207-32-ebiggers@kernel.org>
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
crypto_aes_ctx) to the new ones (which use struct aes_enckey).  This
eliminates the unnecessary computation and caching of the decryption
round keys.  The new AES en/decryption functions are also much faster
and use AES instructions when supported by the CPU.

Note: aes_encrypt_new() will be renamed to aes_encrypt() once all
callers of the old aes_encrypt() have been updated.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 drivers/crypto/omap-aes-gcm.c | 6 +++---
 drivers/crypto/omap-aes.h     | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/crypto/omap-aes-gcm.c b/drivers/crypto/omap-aes-gcm.c
index 1f4586509ca4..efe94a983589 100644
--- a/drivers/crypto/omap-aes-gcm.c
+++ b/drivers/crypto/omap-aes-gcm.c
@@ -175,11 +175,11 @@ static int omap_aes_gcm_copy_buffers(struct omap_aes_dev *dd,
 
 static int do_encrypt_iv(struct aead_request *req, u32 *tag, u32 *iv)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(crypto_aead_reqtfm(req));
 
-	aes_encrypt(&ctx->actx, (u8 *)tag, (u8 *)iv);
+	aes_encrypt_new(&ctx->akey, (u8 *)tag, (const u8 *)iv);
 	return 0;
 }
 
 void omap_aes_gcm_dma_out_callback(void *data)
 {
@@ -312,11 +312,11 @@ int omap_aes_gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 			unsigned int keylen)
 {
 	struct omap_aes_gcm_ctx *ctx = crypto_aead_ctx(tfm);
 	int ret;
 
-	ret = aes_expandkey(&ctx->actx, key, keylen);
+	ret = aes_prepareenckey(&ctx->akey, key, keylen);
 	if (ret)
 		return ret;
 
 	memcpy(ctx->octx.key, key, keylen);
 	ctx->octx.keylen = keylen;
@@ -332,11 +332,11 @@ int omap_aes_4106gcm_setkey(struct crypto_aead *tfm, const u8 *key,
 
 	if (keylen < 4)
 		return -EINVAL;
 	keylen -= 4;
 
-	ret = aes_expandkey(&ctx->actx, key, keylen);
+	ret = aes_prepareenckey(&ctx->akey, key, keylen);
 	if (ret)
 		return ret;
 
 	memcpy(ctx->octx.key, key, keylen);
 	memcpy(ctx->octx.nonce, key + keylen, 4);
diff --git a/drivers/crypto/omap-aes.h b/drivers/crypto/omap-aes.h
index 99c36a777e97..6aa70bde387a 100644
--- a/drivers/crypto/omap-aes.h
+++ b/drivers/crypto/omap-aes.h
@@ -96,11 +96,11 @@ struct omap_aes_ctx {
 	struct crypto_skcipher	*fallback;
 };
 
 struct omap_aes_gcm_ctx {
 	struct omap_aes_ctx	octx;
-	struct crypto_aes_ctx	actx;
+	struct aes_enckey	akey;
 };
 
 struct omap_aes_reqctx {
 	struct omap_aes_dev *dd;
 	unsigned long mode;
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
