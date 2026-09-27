Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABE13C9833E
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Sep 2026 22:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+Q0qKlPrDeXBOQbo5M4os/w4wHnVwKC7Xhqy/+n/7HI=; b=Xr0/3w3h7EjPGt
	lbOFsSmJrxjQScJi6ICGPhs6ca90Fpj1cot6kkFz76Ixy2psU8WOkiWzhNH6JMhwvRLp6CCN8Jfrd
	m+wf1kGLuAAFTHFLl9C0GJkCpDSOlyEfdV/CBYsSPABZR/QRAl/aO2NvbmL+S0KGLB58hDNobJoFG
	3BSbVDFxRxuRi0nN2J+ILfqQhsh/Q6f+jkoueHb9OXahc7Pe5PfST6Y1Vug9Ru6v4ejWZXswp/l3U
	z2Uu0suN6IHNFJ9UQtaYQi8V276W4T822u5z4ePNvtU5jNSwLjqBOBaX+utGBGGejwh8SUMT9n6dh
	B0daAdpCQYwKM/+Vtfcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbx-0000000GwSw-3hnw;
	Sun, 27 Sep 2026 22:44:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xAxbt-0000000GwR0-1CnL
	for linux-riscv@lists.infradead.org;
	Sun, 27 Sep 2026 22:44:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 91BFD409A6;
	Sun, 27 Sep 2026 22:44:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34C7C1F00898;
	Sun, 27 Sep 2026 22:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790549079;
	bh=vnEA9cfMXmX200OnA8/EwYowZNF4bPtpzOYKNAaTVp4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=I9dd3Tz8UrCLCCZPxMi2hKHrOe8eOGjMrsJmBJMOv6FMI7jzyUDp7BuO4UbqRJtWQ
	 qYQ04iqmrX15Yggyt1Yd7A07Al13/LHAmr5VEL1l25C1hFvVeE3wO1MZuGYtURqO3M
	 P4mqbaonb7vA5B8tpUJZMsUJXRzw7IPkvl2YAVnkKE0mSlINEe1thvC7j6BfpI9r2n
	 LQGpmoE7N4vksSHpCqSgSYuRipkyu+C0M72R9CCU8eiPl1Eaihy51MIV/vhM1epaNF
	 jU9Ok/irsiVeA404n5jaEtO003+64JF+m1TSdoOKSpRrl2sxGy1zak7A/ulPlq6znf
	 uV6j9VnYcPhyg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	Thomas Huth <thuth@redhat.com>
Subject: [PATCH v2 02/20] lib/crypto: aes-xctr: Pass counter by value to aes_xctr_arch()
Date: Sun, 27 Sep 2026 15:42:53 -0700
Message-ID: <20260927224418.109759-3-ebiggers@kernel.org>
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

Update the calling convention for aes_xctr_arch() to pass the counter by
value, then do the increment in generic code.  This aligns better with
the x86_64 and arm64 assembly code for XCTR, which takes the counter by
value and thus has to be paired with an increment in C code anyway.

Reviewed-by: Thomas Huth <thuth@redhat.com>
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 lib/crypto/aes.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/lib/crypto/aes.c b/lib/crypto/aes.c
index f1549839b3de..22f096c50242 100644
--- a/lib/crypto/aes.c
+++ b/lib/crypto/aes.c
@@ -1094,7 +1094,7 @@ static bool aes_ctr_arch(u8 *dst, const u8 *src, size_t len,
 }
 #endif
 #ifndef aes_xctr_arch
-static bool aes_xctr_arch(u8 *dst, const u8 *src, size_t len, u64 *ctr,
+static bool aes_xctr_arch(u8 *dst, const u8 *src, size_t len, u64 ctr,
 			  const u8 iv[AES_BLOCK_SIZE],
 			  const struct aes_enckey *key)
 {
@@ -1150,8 +1150,10 @@ void aes_xctr(u8 *dst, const u8 *src, size_t len, u64 *ctr,
 	__le64 aes_input[2];
 	u8 keystream[AES_BLOCK_SIZE] __aligned(__alignof__(long));
 
-	if (likely(aes_xctr_arch(dst, src, len, ctr, iv, key.enc_key)))
+	if (likely(aes_xctr_arch(dst, src, len, *ctr, iv, key.enc_key))) {
+		*ctr += DIV_ROUND_UP(len, AES_BLOCK_SIZE);
 		return;
+	}
 
 	aes_input[1] = get_unaligned((const __le64 *)&iv[8]);
 	/* Handle the full blocks. */
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
