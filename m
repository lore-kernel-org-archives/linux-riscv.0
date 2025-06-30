Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657A1C83029
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jun 2025 16:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x8YTfDX3ZGSS/HqWqKumSyAKV9nAB2yCFKmP1z+USLg=; b=blxA5ih23HRj+4
	k0A5JA5UdiBsNDj22OCedbeMar0cIR+xDBa6zAzfbiCJwMem+DWISkzzFNJoe2xe9GY9romsdUPVl
	BeYDcrdtMbeChcFJNb2Y6rS3Z8bT3UTDML6CvgKv6X7we/aM7rRXmsCB3seKmkg+8gRtLtSIKJTRR
	4FcOTjlz0MwYrz420OkUICRt5gsORitkJ7pjt7sOfc33OQZ6SMjiKHL7gUpr4OcFRX4El2ezZRUXg
	1aom7BruQyVj/kQ02PFa/w9M3HRmWuu6iWvsi9BhJPHbyYzpKiiSAdGmBoAYkDFK1ke5OesPP55LQ
	hnLLQ0GcxvA3CGaFvPRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWHLn-00000002vE7-0Ric;
	Mon, 30 Jun 2025 16:27:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWH0W-00000002ojg-0GJL;
	Mon, 30 Jun 2025 16:05:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DA232613B0;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2EFC4CEF3;
	Mon, 30 Jun 2025 16:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751299523;
	bh=Weaemm5tVSSOITzoU3Exa8gIqcPO7agiHtgu1h0EiAY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=G6SdNRxTh3Ciw7tvEBvdMJDJ2pBTRqKZrXnc4VCIBytKFkTJpt3yLkXrBQ43W5Xfc
	 MSaPHP2zGfS31WjYmnoGB/3etvzWfs59cG8i3V0bPCVh9lqS/ayx3PhzyweVM6SHpE
	 a8K3fbneg6OFdo2NJwZPzGn0ji5Zt97pbqCwuASSUt+oAi8zMRh4Zok+CG2MjbAfLp
	 kG5RyDFYNzMraJW04smN96tyaP7uFDnj9JCU1Qu8HE63kCi4qCBolaIG2pqAI1w2m+
	 mePoviuPsG+xzMDSE3fl0wEsBX9Y4iAWgwOE4kx+gzIx0neyORBtS1/NZ0dV58LGej
	 DeRbkpYFvI67A==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v3 04/16] crypto: riscv/sha512 - Stop depending on sha512_generic_block_fn
Date: Mon, 30 Jun 2025 09:03:08 -0700
Message-ID: <20250630160320.2888-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250630160320.2888-1-ebiggers@kernel.org>
References: <20250630160320.2888-1-ebiggers@kernel.org>
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

sha512_generic_block_fn() will no longer be available when the SHA-512
support in the old-school crypto API is changed to just wrap the SHA-512
library.  Replace the use of sha512_generic_block_fn() in
sha512-riscv64-glue.c with temporary code that uses the library's
__sha512_update().  This is just a temporary workaround to keep the
kernel building and functional at each commit; this code gets superseded
when the RISC-V optimized SHA-512 is migrated to lib/crypto/ anyway.

Acked-by: Ard Biesheuvel <ardb@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/crypto/Kconfig               | 1 +
 arch/riscv/crypto/sha512-riscv64-glue.c | 8 +++++++-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index cd9b776602f89..53e4e1eacf554 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -29,10 +29,11 @@ config CRYPTO_GHASH_RISCV64
 	  - Zvkg vector crypto extension
 
 config CRYPTO_SHA512_RISCV64
 	tristate "Hash functions: SHA-384 and SHA-512"
 	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	select CRYPTO_LIB_SHA512
 	select CRYPTO_SHA512
 	help
 	  SHA-384 and SHA-512 secure hash algorithm (FIPS 180)
 
 	  Architecture: riscv64 using:
diff --git a/arch/riscv/crypto/sha512-riscv64-glue.c b/arch/riscv/crypto/sha512-riscv64-glue.c
index 4634fca78ae24..b3dbc71de07b0 100644
--- a/arch/riscv/crypto/sha512-riscv64-glue.c
+++ b/arch/riscv/crypto/sha512-riscv64-glue.c
@@ -36,11 +36,17 @@ static void sha512_block(struct sha512_state *state, const u8 *data,
 	if (crypto_simd_usable()) {
 		kernel_vector_begin();
 		sha512_transform_zvknhb_zvkb(state, data, num_blocks);
 		kernel_vector_end();
 	} else {
-		sha512_generic_block_fn(state, data, num_blocks);
+		struct __sha512_ctx ctx = {};
+
+		static_assert(sizeof(ctx.state) == sizeof(state->state));
+		memcpy(&ctx.state, state->state, sizeof(ctx.state));
+		__sha512_update(&ctx, data,
+				(size_t)num_blocks * SHA512_BLOCK_SIZE);
+		memcpy(state->state, &ctx.state, sizeof(state->state));
 	}
 }
 
 static int riscv64_sha512_update(struct shash_desc *desc, const u8 *data,
 				 unsigned int len)
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
