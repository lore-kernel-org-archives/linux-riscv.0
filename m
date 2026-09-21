Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D8EC982E1
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Sep 2026 05:16:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=93hFVOx5bkp2NaaZGXOXeWiM1ZTM+rCn2cN9HAinV88=; b=ASKXRRZfGWj1Xu
	CGayIesOnyDqrgOEH8iWOrQxY2TD9mbVUZb6I1xrF6RdSWvJ2Z60LgSqWbHXSMSOBuBPbfMGQJQBu
	vgRov6ZtOm/0OGyJzGCoVxyIgX8dvtID/MRZ0YduCVysxcbzWdkRlqJVmbE958jqjzjOanMusgchF
	ts6FPX4q38PbnqtY907yVzKFteOtTwC/TtQJdrDR5HtxTsZM6Vm8kuuPsL5rfdKniKEeIJbCAlZdZ
	0BBF7v9ZCx8LJVFTy2m0qWWRwWwGgJfHnHxhaLHzHXI/hPpW+jyBmZybvgCQ0OYOcScE1MbqyQy/7
	TE2rNIZWVNm8GAVhsx3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNq-00000000tF2-38Gq;
	Mon, 21 Sep 2026 05:16:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8WNp-00000000tDu-0pzl
	for linux-riscv@lists.infradead.org;
	Mon, 21 Sep 2026 05:16:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 65FF06021E;
	Mon, 21 Sep 2026 05:16:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D97D01F00899;
	Mon, 21 Sep 2026 05:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789967764;
	bh=DmrQnWAp+PfddUGRztDV+bpGLhcW7RlUL0r9TlxAYCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jZeziMwRSQcDUOCfNw+OPJIdK57/XDgsSnwJ4Fd/PYUQjXmeqejrpt7IoS3FiPndS
	 BOq+HV3nZak15huEPJZYE+fGb3RYFZ+MCFdQ9rioFuawemy/lsBhFeDwWhdIIWDx4h
	 ec67PmRHQ80qrWtwD62fAm+Fn0Eg+bc+BpHGOLjBbrvT/EGJLRK+rbj19+eTRvnnBm
	 R1Mxd7KJUz4AB9S1rBNg2Z9Jteb0T0GiEcyHWRw4MfsDBkooMZnJK18XqD6aDunqZx
	 dVL90HiO6iJauPKn+wGfxtaSmn+xA9cE6C05VSivQbRFWKOl98iV6aqEwQLh4Dr3S0
	 51yo1VPjN6BHQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>
Subject: [PATCH 02/20] lib/crypto: aes-xctr: Pass counter by value to aes_xctr_arch()
Date: Sun, 20 Sep 2026 22:08:48 -0700
Message-ID: <20260921050910.296144-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260921050910.296144-1-ebiggers@kernel.org>
References: <20260921050910.296144-1-ebiggers@kernel.org>
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
