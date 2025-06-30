Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED3E3C83033
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 18:14:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lrstVMy4GyYhTiT1EgoQusT+Jz7edBTXSwuQ1Y5HzVk=; b=WLfzSEN198zO2q
	NDMAZo3Rn63XU1vx84LcA8aA6GRIcRU+vRASBF8beIf1KsMYXWAfdWxf7cl/xTNFcLPiIC0raCQJj
	jZwPwdRH28X6MuGUxcKh4Yvnnrg6NVPVC2vGmrox7ytcrzl81guz+xA9+KdhF0hmw5kB8D5XMoOHb
	5vji8OQ0nWpwtYYAQN8FssuSmfqcBVjH/3iimZbj7hfmB4sPk5GKCUFXuNadZpABIExnvtwcGpCp/
	W94aN/QwzekeRD+JvkB4fcqPZz2j7k2XpDDMnZnil44op2wRkJKYF+DqfkCBEl35AjRvSOLLKZWXG
	NHqFGvK/2otvq+QQfNXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWJ1T-000000039bh-2KIW;
	Mon, 30 Jun 2025 18:14:31 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH4S-00000002ppZ-0KdD;
	Mon, 30 Jun 2025 16:09:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 6C7A9A53426;
	Mon, 30 Jun 2025 16:09:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4921C4CEF2;
	Mon, 30 Jun 2025 16:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299767;
	bh=hI7/9MXXn63qxg1DA2W2CAE23ZWS/FopAAuRjD/xhFs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=oN5D7nM68TGKPGZYZfUCmR2idT6QSU/9V6Bm4Nd+BH4W3ccbIdeb6eX7QizYZe7ce
	 b1C5ugHHJ0UyxkvLvqKHVwgxGKT2tGHhB6SkNjeJGS9EyxEhNmgQq5gaTCKepPBrbJ
	 5/KKuQsavBRZWjviiWq9Uc2bjEiTbU9DMXo7pTiwZtgmTIrc/Rb1onnm2pYpEKE2nL
	 jc5sTkLpA1W6qHTjKTlNmOXhKDDJcBdsrgZFT2ZZcVkciO2+Tsu4E2Cq1YITmIm7m9
	 uWHqbWEOtWiMOYhvUlspb4D980aEHInjhTTJMzcxAAfrmqYalRCh3cKOmAFJLmFBiN
	 uueT2Z+/VqTzA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 13/14] lib/crypto: sha256: Sync sha256_update() with sha512_update()
Date: Mon, 30 Jun 2025 09:06:44 -0700
Message-ID: <20250630160645.3198-14-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160645.3198-1-ebiggers@kernel.org>
References: <20250630160645.3198-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_090928_206049_EFDFC0C2 
X-CRM114-Status: GOOD (  11.30  )
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

The BLOCK_HASH_UPDATE_BLOCKS macro is difficult to read.  For now, let's
just write the update explicitly in the straightforward way, mirroring
sha512_update().  It's possible that we'll bring back a macro for this
later, but it needs to be properly justified and hopefully a bit more
readable.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/sha256.c | 28 +++++++++++++++++++++++++---
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/lib/crypto/sha256.c b/lib/crypto/sha256.c
index 68936d5cd7745..808438d4f4278 100644
--- a/lib/crypto/sha256.c
+++ b/lib/crypto/sha256.c
@@ -8,11 +8,10 @@
  * Copyright (c) 2014 Red Hat Inc.
  * Copyright 2025 Google LLC
  */
 
 #include <crypto/hmac.h>
-#include <crypto/internal/blockhash.h>
 #include <crypto/sha2.h>
 #include <linux/export.h>
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/string.h>
@@ -178,12 +177,35 @@ EXPORT_SYMBOL_GPL(sha256_init);
 void __sha256_update(struct __sha256_ctx *ctx, const u8 *data, size_t len)
 {
 	size_t partial = ctx->bytecount % SHA256_BLOCK_SIZE;
 
 	ctx->bytecount += len;
-	BLOCK_HASH_UPDATE_BLOCKS(sha256_blocks, &ctx->state, data, len,
-				 SHA256_BLOCK_SIZE, ctx->buf, partial);
+
+	if (partial + len >= SHA256_BLOCK_SIZE) {
+		size_t nblocks;
+
+		if (partial) {
+			size_t l = SHA256_BLOCK_SIZE - partial;
+
+			memcpy(&ctx->buf[partial], data, l);
+			data += l;
+			len -= l;
+
+			sha256_blocks(&ctx->state, ctx->buf, 1);
+		}
+
+		nblocks = len / SHA256_BLOCK_SIZE;
+		len %= SHA256_BLOCK_SIZE;
+
+		if (nblocks) {
+			sha256_blocks(&ctx->state, data, nblocks);
+			data += nblocks * SHA256_BLOCK_SIZE;
+		}
+		partial = 0;
+	}
+	if (len)
+		memcpy(&ctx->buf[partial], data, len);
 }
 EXPORT_SYMBOL(__sha256_update);
 
 static void __sha256_final(struct __sha256_ctx *ctx,
 			   u8 *out, size_t digest_size)
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
