Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E79C36005
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Apr 2025 06:46:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:From:References
	:In-Reply-To:Message-Id:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jYVEPZ3sTGd0ssPWj0NaB0gOaf6Ot9rKWVNTpKcd4pY=; b=fqKLU6xkcb0xGy
	9p8z8G9SdN44ghmIQ4ut/qEnyWAAGB3IMcBjjEvOerQV8Sr4VpltqzuZtjLz69zSAnp05bK6AKHRl
	fPpzXrwsuvvDJbmyG8lspF6m3+Zlu9LWu0lNa28tTSylV7wIVgCCL2SFXIwlSOrwazWcURZHTPAs9
	AJSg+FZG/NfUVr1UW1x9H9ycMYzyMAQnmXmL+4RjmuptuuRlkCpzNAq0Ph5LxYeU60g7pTSvgS1if
	QwXwKzbRH3rqcsuISq/y8du8mPVGzw6N7G5qHFGHgrSvOK7icTHEoUUQRlxej4bf7b5cIKYVfNiXX
	/QOliFCAlM2sU+LCDKDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9IFb-000000058ci-41w0;
	Mon, 28 Apr 2025 06:45:59 +0000
Received: from abb.hmeau.com ([144.6.53.87])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Gs3-00000004hYo-1Mem;
	Mon, 28 Apr 2025 05:17:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hmeau.com;
	s=formenos; h=Cc:To:Subject:From:References:In-Reply-To:Message-Id:Date:
	Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=GB9/DZlVKQ+qX1C/pXbez0MkOkRiHenUXD6OWOuCEZs=; b=CVAR2Ix3IfhZQmpfOpkslfwtId
	Hlx7GZhAXeDLd38FBrIcfXPECpLUEFQes2kYLfGw36skzAGoBU/HwsB+kw5lEV46hoFiABvWRp1YY
	tIZvMun+xGqBsNvA53UxfPhPKi83+pWsISxJ1T8YnbiVOsCBh8/0AokycWgZy8BD/3/Az6gp/rLnG
	GCI6x0zgmUWVZeZpSWuYSy7Ibvh+DaRPvp5QRZi+5JwBmrZ9j0JUcpzfDWU1eZtT142silVTEiDcK
	Zmd+4T/ITi0Xd3Eso3737704RQM9K4xdXm9ZMzIpVdz45evkjIfv5r3ewihD74Y5i42P/J2W+ggEt
	IFdqSL5w==;
Received: from loth.rohan.me.apana.org.au ([192.168.167.2])
	by formenos.hmeau.com with smtp (Exim 4.96 #2 (Debian))
	id 1u9Gs0-001WUX-0r;
	Mon, 28 Apr 2025 13:17:33 +0800
Received: by loth.rohan.me.apana.org.au (sSMTP sendmail emulation); Mon, 28 Apr 2025 13:17:32 +0800
Date: Mon, 28 Apr 2025 13:17:32 +0800
Message-Id: <f97814714c68dcf60028a2927d541b2e8c81c3bf.1745816372.git.herbert@gondor.apana.org.au>
In-Reply-To: <cover.1745816372.git.herbert@gondor.apana.org.au>
References: <cover.1745816372.git.herbert@gondor.apana.org.au>
From: Herbert Xu <herbert@gondor.apana.org.au>
Subject: [v3 PATCH 13/13] crypto: lib/sha256 - improve function prototypes
To: Linux Crypto Mailing List <linux-crypto@vger.kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org, sparclinux@vger.kernel.org, linux-s390@vger.kernel.org, x86@kernel.org, Ard Biesheuvel <ardb@kernel.org>, "Jason A . Donenfeld " <Jason@zx2c4.com>, Linus Torvalds <torvalds@linux-foundation.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250427_221735_365400_F1E05833 
X-CRM114-Status: GOOD (  11.02  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Eric Biggers <ebiggers@google.com>

Follow best practices by changing the length parameters to size_t and
explicitly specifying the length of the output digest arrays.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
---
 include/crypto/internal/sha2.h |  2 +-
 include/crypto/sha2.h          |  8 ++++----
 lib/crypto/sha256.c            | 12 ++++++------
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/include/crypto/internal/sha2.h b/include/crypto/internal/sha2.h
index 09f622c2ae7d..421872a93a83 100644
--- a/include/crypto/internal/sha2.h
+++ b/include/crypto/internal/sha2.h
@@ -46,7 +46,7 @@ static inline void sha256_choose_blocks(
 
 static __always_inline void sha256_finup(
 	struct crypto_sha256_state *sctx, const u8 *src, unsigned int len,
-	u8 *out, size_t digest_size, bool force_generic,
+	u8 out[SHA256_DIGEST_SIZE], size_t digest_size, bool force_generic,
 	bool force_simd)
 {
 	unsigned int bit_offset = SHA256_BLOCK_SIZE / 8 - 1;
diff --git a/include/crypto/sha2.h b/include/crypto/sha2.h
index a27e2bf1842d..4912572578dc 100644
--- a/include/crypto/sha2.h
+++ b/include/crypto/sha2.h
@@ -105,9 +105,9 @@ static inline void sha256_init(struct sha256_state *sctx)
 {
 	sha256_block_init(&sctx->ctx);
 }
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len);
-void sha256_final(struct sha256_state *sctx, u8 *out);
-void sha256(const u8 *data, unsigned int len, u8 *out);
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len);
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE]);
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE]);
 
 static inline void sha224_block_init(struct crypto_sha256_state *sctx)
 {
@@ -127,6 +127,6 @@ static inline void sha224_init(struct sha256_state *sctx)
 	sha224_block_init(&sctx->ctx);
 }
 /* Simply use sha256_update as it is equivalent to sha224_update. */
-void sha224_final(struct sha256_state *sctx, u8 *out);
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE]);
 
 #endif /* _CRYPTO_SHA2_H */
diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index d2bd9fdb8571..107d2bdea682 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -33,7 +33,7 @@ static inline void sha256_blocks(u32 state[SHA256_STATE_WORDS], const u8 *data,
 			     sha256_force_generic(), false);
 }
 
-void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
+void sha256_update(struct sha256_state *sctx, const u8 *data, size_t len)
 {
 	size_t partial = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -43,8 +43,8 @@ void sha256_update(struct sha256_state *sctx, const u8 *data, unsigned int len)
 }
 EXPORT_SYMBOL(sha256_update);
 
-static void __sha256_final(struct sha256_state *sctx, u8 *out,
-			   size_t digest_size)
+static void __sha256_final(struct sha256_state *sctx,
+			   u8 out[SHA256_DIGEST_SIZE], size_t digest_size)
 {
 	unsigned int len = sctx->count % SHA256_BLOCK_SIZE;
 
@@ -54,19 +54,19 @@ static void __sha256_final(struct sha256_state *sctx, u8 *out,
 	memzero_explicit(sctx, sizeof(*sctx));
 }
 
-void sha256_final(struct sha256_state *sctx, u8 *out)
+void sha256_final(struct sha256_state *sctx, u8 out[SHA256_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA256_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha256_final);
 
-void sha224_final(struct sha256_state *sctx, u8 *out)
+void sha224_final(struct sha256_state *sctx, u8 out[SHA224_DIGEST_SIZE])
 {
 	__sha256_final(sctx, out, SHA224_DIGEST_SIZE);
 }
 EXPORT_SYMBOL(sha224_final);
 
-void sha256(const u8 *data, unsigned int len, u8 *out)
+void sha256(const u8 *data, size_t len, u8 out[SHA256_DIGEST_SIZE])
 {
 	struct sha256_state sctx;
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
