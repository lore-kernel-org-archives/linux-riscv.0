Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35ECACF45C5
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Jan 2026 19:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zyXRMOv6I2BJhruDAIY5Pp2U+3ObOzyq0TI9LPGPoCQ=; b=jSARhGqQ/pevoW
	PnwmQy6USfQSvx2oGXLtL4UDfT3IRrJD6pNdcxV2x3MvOo06DV985yJHn1KzKYVTHq65CiiC0pM4s
	fkWLaxkjSQ3tnLZYMlyNA0PBEK2oUuntVKlLMtfUoMwi2mE041F7rr2BC9GmuNJFuAu3pW6CH7z7E
	lr1qenBeEVHVKAnP8pIdiXmBMesAuwsjjvtifH6R/BL5op4H26elCnFhJbZh5ibfg7h/nDy/hUQ8Q
	GMfvaRVVHiyVW9vs150sl9lre5dCVmrSIBt3Ksvwg62dsLaB8qJdTS3MfsnfSoiC9UtZlVLj7ff0p
	EhetNaelQ9q9gUXvOZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNXi-000000061vW-2Mob;
	Mon, 12 Jan 2026 19:25:34 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfNVk-00000005z98-3Gc8;
	Mon, 12 Jan 2026 19:23:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 677B943483;
	Mon, 12 Jan 2026 19:23:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D27E5C2BC86;
	Mon, 12 Jan 2026 19:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768245812;
	bh=WLZZawaQBX35WPW58Hz//ngE+4DAJvp0HQ0I1HlTY/o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c1uZHKeto0AfyTDnkpw+maKdeM0KeDm2Q70XvXQU/RpOQN8SKGIlrpmf3qjxTie86
	 HCNSg4+UvVX3xUSdbQVP8xeeOQMJoQg1DuN+j3Q7uMn1pi8833mHKQsAMJKHJ/r0co
	 Cp9t7NfmIB9UcWHN7L1swZLb2Bt1wDVrX1d7fqpuqdvA8b11taUYiaKgJY13HpgOwo
	 UqE27wAEUeCRcKwzQPZMRSqiSF3OIPD11Gu7aUrpUal/Qv2Wf/u6wG8DO8SrVskdHr
	 mp5bV4KfXC90NInEuREpltxcfpeZYFO7VWCjJqaaviHvltHYdOmLgxI6z8RRKbwvRF
	 Fm8EGShrZgCLg==
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
Subject: [PATCH v2 26/35] crypto: ccp - Use new AES library API
Date: Mon, 12 Jan 2026 11:20:24 -0800
Message-ID: <20260112192035.10427-27-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260112192035.10427-1-ebiggers@kernel.org>
References: <20260112192035.10427-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_112332_860301_6B80F838 
X-CRM114-Status: GOOD (  14.43  )
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
 drivers/crypto/ccp/ccp-crypto-aes-cmac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
index d8426bdf3190..71480f7e6f6b 100644
--- a/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
+++ b/drivers/crypto/ccp/ccp-crypto-aes-cmac.c
@@ -259,11 +259,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 	struct ccp_ctx *ctx = crypto_ahash_ctx_dma(tfm);
 	struct ccp_crypto_ahash_alg *alg =
 		ccp_crypto_ahash_alg(crypto_ahash_tfm(tfm));
 	u64 k0_hi, k0_lo, k1_hi, k1_lo, k2_hi, k2_lo;
 	u64 rb_hi = 0x00, rb_lo = 0x87;
-	struct crypto_aes_ctx aes;
+	struct aes_enckey aes;
 	__be64 *gk;
 	int ret;
 
 	switch (key_len) {
 	case AES_KEYSIZE_128:
@@ -282,11 +282,11 @@ static int ccp_aes_cmac_setkey(struct crypto_ahash *tfm, const u8 *key,
 
 	/* Set to zero until complete */
 	ctx->u.aes.key_len = 0;
 
 	/* Set the key for the AES cipher used to generate the keys */
-	ret = aes_expandkey(&aes, key, key_len);
+	ret = aes_prepareenckey(&aes, key, key_len);
 	if (ret)
 		return ret;
 
 	/* Encrypt a block of zeroes - use key area in context */
 	memset(ctx->u.aes.key, 0, sizeof(ctx->u.aes.key));
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
