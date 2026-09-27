Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1766FCA5FA5
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:45:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQQfXE5ls8Szkvw736KwrfNLPxfgGBSMpYG6VIdNug4=; b=QXuZUb0kODbIcb
	40Gr5e9NOYZ2MkmQqXVKdIMcMoflAwcL6Lw4qebyyHuCh3L55M/Rx2XmU8UVA13rPKnE7thCejNDr
	8IF3/Sd6UH2xu5NOeJ75aZqKCpTt2uunU/S3JgcoktYfIEZ4h9HVFFkATjAHo5T3imotL1Y+l0TdG
	hM7O21+rBOgv9NGFAhR92aPF/jDk4bZzqjgM0n7EtFTIKh5dHVcw6njsM5inR47YG82idf8XmtTQH
	1zxBJVelVxr0fA11CvclrIpJHaxtKUJzuwVPQ7sVvdwg//ZL4hwM8EgT7CmNUpMOnClwELRdWfbwE
	nTzOY5Aj3x1AEbUojHDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxby-0000000GwTO-1Tyg;
	Sun, 27 Sep 2026 22:44:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbt-0000000GwQy-1P2q
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 22:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 879166022A;
	Sun, 27 Sep 2026 22:44:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 048221F0089A;
	Sun, 27 Sep 2026 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549080;
	bh=RHJ02+mGgNRUnUB6/pgFVjqhIaZE1vBPHsU5gAohAc0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=U+z/4CBOiXT86ZWtiWPzbGXgXR+QZF6pLXbETitWykja+RlCEvswkr8wLbTTwiUSw
	 XI6u8SwPsbtCmF/+/QV9tN5iUtvQM8SmDofX9DqSpdxMBvm5F+oYn4bdX/g6+1vGUw
	 KtofiF4YYQ8RDpsqePFw25jhMMyMhAL7I769KXVOpuJ4f+ckRg2rCm11wDTqJl75EQ
	 R7m4shqUIXf3pdCBKR3ORqSg5TA7L0fEg5JacD+ia50YqZid/0BAx5UTS+j6BTeWe9
	 cSNVzdKR1Vji3DaE0xjRNzocdDtBAO1HSgARAvtvLhDDgQrvQ+xw96UOyUfhE5UpqK
	 +S2xj+f8mV5eA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH v2 04/20] lib/crypto: x86/aes-ecb: Add AES-NI optimization
Date: Sun, 27 Sep 2026 15:42:55 -0700
Message-ID: <20260927224418.109759-5-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260927224418.109759-1-ebiggers@kernel.org>
References: <20260927224418.109759-1-ebiggers@kernel.org>
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

Optimize the crypto library's AES-ECB support with AES-NI, bringing its
performance on par with the "ecb-aes-aesni" skcipher algorithm it will
supersede.

The new assembly functions are written from scratch to fit well into the
crypto library.  However, they are functionally very similar to the
functions in arch/x86/crypto/aesni-intel_asm.S that they will supersede
and are intended to provide parity with those -- including supporting
32-bit mode, having the inner loops do 4 AES blocks per iteration, etc.

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 crypto/aes.c               |  2 +-
 lib/crypto/x86/aes-aesni.S | 54 ++++++++++++++++++++++++++++++++++++++
 lib/crypto/x86/aes.h       | 35 ++++++++++++++++++++++++
 3 files changed, 90 insertions(+), 1 deletion(-)

diff --git a/crypto/aes.c b/crypto/aes.c
index 5046b887ac9a..b1f71d2b2460 100644
--- a/crypto/aes.c
+++ b/crypto/aes.c
@@ -610,7 +610,7 @@ static struct skcipher_alg skcipher_algs[] = {
 	{
 		.base.cra_name = "ecb(aes)",
 		.base.cra_driver_name = "ecb-aes-lib",
-		.base.cra_priority = 110,
+		.base.cra_priority = IS_ENABLED(CONFIG_X86) ? 300 : 110,
 		.base.cra_blocksize = AES_BLOCK_SIZE,
 		.base.cra_ctxsize = sizeof(struct aes_key),
 		.base.cra_module = THIS_MODULE,
diff --git a/lib/crypto/x86/aes-aesni.S b/lib/crypto/x86/aes-aesni.S
index a56fcb36da18..52f4ee5c13b9 100644
--- a/lib/crypto/x86/aes-aesni.S
+++ b/lib/crypto/x86/aes-aesni.S
@@ -348,3 +348,57 @@ SYM_FUNC_END(aes_encrypt_aesni)
 SYM_FUNC_START(aes_decrypt_aesni)
 	_aes_crypt_aesni	0
 SYM_FUNC_END(aes_decrypt_aesni)
+
+.macro	_ecb_crypt	enc
+	// Arguments
+	.set	DST,		ARG0
+	.set	SRC,		ARG1
+	.set	NBLOCKS,	ARG2
+	.set	NBLOCKS32,	ARG2_32	// Used for improved code density
+	.set	KEY,		ARG3
+
+	// Other local variables
+	.set	RNDKEY_PTR,	ARG4	// Temporary register for _do_aes
+	.set	NROUNDS,	TMP_32	// Temporary register for _do_aes
+	.set	AESDATA0,	%xmm0
+	.set	AESDATA1,	%xmm1
+	.set	AESDATA2,	%xmm2
+	.set	AESDATA3,	%xmm3
+	.set	RNDKEY,		%xmm4	// Temporary register for _do_aes
+	_prologue	uses_arg3=2, uses_arg4=1
+
+	sub		$4, NBLOCKS
+	jl		.Lecb_loop4_done\@
+.p2align 5
+.Lecb_loop4\@:
+	_do_aes_ecb	\enc, 0,1,2,3
+	add		$64, SRC
+	add		$64, DST
+	sub		$4, NBLOCKS
+	jge		.Lecb_loop4\@
+.Lecb_loop4_done\@:
+	add		$4, NBLOCKS32
+	jz		.Lecb_done\@
+
+.Lecb_loop1\@:
+	_do_aes_ecb	\enc, 0
+	add		$16, SRC
+	add		$16, DST
+	dec		NBLOCKS32
+	jnz		.Lecb_loop1\@
+
+.Lecb_done\@:
+	_epilogue
+.endm
+
+// void aes_ecb_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      const struct aes_enckey *key);
+SYM_FUNC_START(aes_ecb_encrypt_aesni)
+	_ecb_crypt	1
+SYM_FUNC_END(aes_ecb_encrypt_aesni)
+
+// void aes_ecb_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+//			      const struct aes_key *key);
+SYM_FUNC_START(aes_ecb_decrypt_aesni)
+	_ecb_crypt	0
+SYM_FUNC_END(aes_ecb_decrypt_aesni)
diff --git a/lib/crypto/x86/aes.h b/lib/crypto/x86/aes.h
index 06146fef06be..408625750ae9 100644
--- a/lib/crypto/x86/aes.h
+++ b/lib/crypto/x86/aes.h
@@ -12,6 +12,8 @@ static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_aesni);
 /* The assembly code assumes the following offsets. */
 static_assert(offsetof(struct aes_enckey, nrounds) == 4);
 static_assert(offsetof(struct aes_enckey, k.rndkeys) == 16);
+static_assert(offsetof(struct aes_key, nrounds) == 4);
+static_assert(offsetof(struct aes_key, k.rndkeys) == 16);
 static_assert(offsetof(struct aes_key, inv_k.inv_rndkeys) == 256);
 
 void aes128_expandkey_aesni(u32 rndkeys[], u32 *inv_rndkeys,
@@ -81,6 +83,39 @@ static void aes_decrypt_arch(const struct aes_key *key,
 	}
 }
 
+#if IS_ENABLED(CONFIG_CRYPTO_LIB_AES_ECB)
+void aes_ecb_encrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   const struct aes_enckey *key);
+void aes_ecb_decrypt_aesni(u8 *dst, const u8 *src, long nblocks,
+			   const struct aes_key *key);
+
+/* len is always a positive multiple of AES_BLOCK_SIZE here. */
+#define aes_ecb_encrypt_arch aes_ecb_encrypt_arch
+static bool aes_ecb_encrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 const struct aes_enckey *key)
+{
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+	kernel_fpu_begin();
+	aes_ecb_encrypt_aesni(dst, src, len / AES_BLOCK_SIZE, key);
+	kernel_fpu_end();
+	return true;
+}
+
+/* len is always a positive multiple of AES_BLOCK_SIZE here. */
+#define aes_ecb_decrypt_arch aes_ecb_decrypt_arch
+static bool aes_ecb_decrypt_arch(u8 *dst, const u8 *src, size_t len,
+				 const struct aes_key *key)
+{
+	if (!static_branch_likely(&have_aesni) || unlikely(!irq_fpu_usable()))
+		return false;
+	kernel_fpu_begin();
+	aes_ecb_decrypt_aesni(dst, src, len / AES_BLOCK_SIZE, key);
+	kernel_fpu_end();
+	return true;
+}
+#endif /* CONFIG_CRYPTO_LIB_AES_ECB */
+
 #define aes_mod_init_arch aes_mod_init_arch
 static void aes_mod_init_arch(void)
 {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
