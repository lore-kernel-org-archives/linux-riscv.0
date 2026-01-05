Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AD97C2A062
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jan 2026 05:17:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMDwjiOv0B9qeqZZcNX1Z3e3mrfPVHuM5dD5LK/hEng=; b=l6Etj2b/lTGkbF
	+D5fkJKw0PemRM9TrEXx2vYMcQz6hNmRqDFF9Bbd8Qao/nWW/7Xe4c4m/vH3/M+syPcs8KZkbGvvZ
	bzIgq7CXRyiMs7SsopU/PhRCa3gx6UAT9kLU0OaIvyrBBwe6+NCk/3RDgIyE+VH/RKfvpA5ihQCel
	fJAk2yujy4fMc7yBIl+MeXHtAwnQkmNzqKObU7SwMbNZHie0wfah6aIHzEXlWUg8yLzjnQJ3guWll
	DTD+8zySsmhiE/POENDKasPJ4g/a+v6nTTLqzrlQRNo8OBMogJvnWeY1w5A5lCS3H4Yohl8NqCu5t
	VALVcWGJ41U0Yu+I5MgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccyM-0000000AmwH-20Su;
	Mon, 05 Jan 2026 05:17:42 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vccvt-0000000Aj3N-2yQp;
	Mon, 05 Jan 2026 05:15:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9282944132;
	Mon,  5 Jan 2026 05:15:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9F59C2BC9E;
	Mon,  5 Jan 2026 05:15:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767590109;
	bh=51MqJUw9vLPBjNhyqGm5KNGeBpiM474Yq2fJhY4WaSs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WXSvV+XiKYdSDaoLylpVKvfPU5H02g22cONeH1AE5K3CY4QrcH+VLEe11L7WHbJzn
	 LQSqWGsgWEKCMoMaJYF+Xm5hEC43m4LeRGnKUyEVoUIPotAd44MP8wSybbaCCCat5j
	 CGqKTFDxES3LadpubNdtviwiZrJmeaUai+ibeYgYsbYGBRLhyHu5ON/yBoS0ncX7MN
	 Yl52+ZfRZsgz0TFx6YNmC1QuRryhC97RyS1FEX7bJUtKL6X9rXiLOevoqJksUXWwLk
	 owp7xxBpt2wAiibDSu/dC8MrjseY1KJivEQJxFhwfVwfauU8c3ADjYkexSt0lke601
	 5A/r1MY4KeGyg==
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
Subject: [PATCH 28/36] crypto: crypto4xx - Use new AES library API
Date: Sun,  4 Jan 2026 21:13:01 -0800
Message-ID: <20260105051311.1607207-29-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260105051311.1607207-1-ebiggers@kernel.org>
References: <20260105051311.1607207-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_211510_459584_C820558B 
X-CRM114-Status: GOOD (  10.67  )
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
 drivers/crypto/amcc/crypto4xx_alg.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/crypto/amcc/crypto4xx_alg.c b/drivers/crypto/amcc/crypto4xx_alg.c
index 38e8a61e9166..1947708334ef 100644
--- a/drivers/crypto/amcc/crypto4xx_alg.c
+++ b/drivers/crypto/amcc/crypto4xx_alg.c
@@ -489,23 +489,23 @@ static int crypto4xx_aes_gcm_validate_keylen(unsigned int keylen)
 }
 
 static int crypto4xx_compute_gcm_hash_key_sw(__le32 *hash_start, const u8 *key,
 					     unsigned int keylen)
 {
-	struct crypto_aes_ctx ctx;
+	struct aes_enckey aes;
 	uint8_t src[16] = { 0 };
 	int rc;
 
-	rc = aes_expandkey(&ctx, key, keylen);
+	rc = aes_prepareenckey(&aes, key, keylen);
 	if (rc) {
-		pr_err("aes_expandkey() failed: %d\n", rc);
+		pr_err("aes_prepareenckey() failed: %d\n", rc);
 		return rc;
 	}
 
-	aes_encrypt(&ctx, src, src);
+	aes_encrypt_new(&aes, src, src);
 	crypto4xx_memcpy_to_le32(hash_start, src, 16);
-	memzero_explicit(&ctx, sizeof(ctx));
+	memzero_explicit(&aes, sizeof(aes));
 	return 0;
 }
 
 int crypto4xx_setkey_aes_gcm(struct crypto_aead *cipher,
 			     const u8 *key, unsigned int keylen)
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
