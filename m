Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928FAC3ABBC
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 18:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5B/IT3dJJFQU0TbAcHVaRgn9+Mm8KyfeGIDV9A6jHac=; b=kh/Ka18WS8wMyf
	ti/vl247P4flCwbyGWmwF/oY6GFUJAtUHJkcstO4GUH7+H6GlrAOR00OYUPLlYnMZn742RHa0QJjQ
	fIr+gZg5KMOcnJ+jKCZNi+oaivsIC2SMyd3hbmXsECepm9/hefhZkFWxRpngh8FAiJHyqEwkvLKGE
	KzsxttYW6+m6UwghnEC0E7ac/aH7NhcrD9v9EoQ3E8FIR74/xqAVOlSvFTnc7Ou5iXAhilWRrKoHM
	epeWk3ZnNuReMjNE6JVRK7XCIYgfpz2fMfOBKodLXu4zYLwT7mxJX+0AprYyXkTmi2npoOEiHZZJs
	aqqu1FjpE3I9wv59bx4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0XN-00000008Hih-3PGC;
	Mon, 05 May 2025 18:27:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC0PX-00000008GEc-0DX2;
	Mon, 05 May 2025 18:19:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D93261F1D;
	Mon,  5 May 2025 18:18:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E8EEC4CEEE;
	Mon,  5 May 2025 18:19:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746469163;
	bh=b/9JYhuN7J7zBR7ary1s1WvggcmHZ7V9W2w6tJgLRtw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pDa53t6DCjWYM/LmZqGF9bnJJ573ftIBSUQsp8IeHuT5N7tEcbBprRacM6EAolgWa
	 KnM4f1Ecr4wsjUKSjvQrsrEOI61Z1Nenrn/tYHyD0VxpliwIloUv60+380sygQKeFn
	 FxwIMuAGqXJ/SCu+mhdkAvNtZ/VV+Hpcs9PRhT0j3hKSDgORzS83PV0rP1IGISbSpL
	 aTZfyBqlR/WkgLr3KGW3DlBmln+QJkH1npbWh+vtLcej0hH78R6O4qdEbRHUlUrbSw
	 ke0NPkusn8yL0Rp2/trfxhRJ3n8yZzmTAV2C0r7cHVP5MRtIDrFszeZGaEVvf/LP32
	 dPGvxobHLcyGg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-bcachefs@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Theodore Ts'o <tytso@mit.edu>
Subject: [PATCH 2/4] crypto: lib/chacha - use struct assignment to copy state
Date: Mon,  5 May 2025 11:18:22 -0700
Message-ID: <20250505181824.647138-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250505181824.647138-1-ebiggers@kernel.org>
References: <20250505181824.647138-1-ebiggers@kernel.org>
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

From: Eric Biggers <ebiggers@google.com>

Use struct assignment instead of memcpy() in lib/crypto/chacha.c where
appropriate.  No functional change.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 lib/crypto/chacha.c | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/lib/crypto/chacha.c b/lib/crypto/chacha.c
index a7f5eb091839..ae50e441f9fb 100644
--- a/lib/crypto/chacha.c
+++ b/lib/crypto/chacha.c
@@ -74,15 +74,13 @@ static void chacha_permute(struct chacha_state *state, int nrounds)
  * The caller has already converted the endianness of the input.  This function
  * also handles incrementing the block counter in the input matrix.
  */
 void chacha_block_generic(struct chacha_state *state, u8 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
+	struct chacha_state permuted_state = *state;
 	int i;
 
-	memcpy(permuted_state.x, state->x, 64);
-
 	chacha_permute(&permuted_state, nrounds);
 
 	for (i = 0; i < ARRAY_SIZE(state->x); i++)
 		put_unaligned_le32(permuted_state.x[i] + state->x[i],
 				   &stream[i * sizeof(u32)]);
@@ -103,13 +101,11 @@ EXPORT_SYMBOL(chacha_block_generic);
  * of the state.  It should not be used for streaming directly.
  */
 void hchacha_block_generic(const struct chacha_state *state,
 			   u32 *stream, int nrounds)
 {
-	struct chacha_state permuted_state;
-
-	memcpy(permuted_state.x, state->x, 64);
+	struct chacha_state permuted_state = *state;
 
 	chacha_permute(&permuted_state, nrounds);
 
 	memcpy(&stream[0], &permuted_state.x[0], 16);
 	memcpy(&stream[4], &permuted_state.x[12], 16);
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
