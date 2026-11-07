Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B065E606A32F
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2026 14:06:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=y88NTHSZ;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=W4cwxv6A
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=4hqdAat1qHEKqoCdRKpUN8ybYVGED9bk23zl/wK/2fk=; b=y88NTHSZj9j/AHHGPLdHZqvvTm
	Y1YDDugh81cHUJsQ9N5PztevCqow11nury6rIQFa7eahV1HBtvOThUKE3IkPqZhpeDUeJAD1B1a3a
	hjaXdMURarSmV34SILSLdrSW5pK1mxfKhyHSUUyJe0GdS9D2KQmDSVyO0nW32p6KYivUQqdwJeU2j
	ZHDNkBMSQ5xgsQ35G8HwzMufKOlTzRA2ENwU075VYQI9GH5Yc5T+qz9+TR8ASIt4M1S/i+xj0USAG
	qNEytaKHORj/LR+h95Jly+St1iLHnljzmDdJYBJs2zfs/pBot1rxRvuanykKkvgKqGdyDOWAgEA3I
	HxqF0THw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3y-0000000Emtr-2yKu;
	Sat, 07 Nov 2026 14:06:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPh3v-0000000EmsS-0eNv
	for linux-riscv@lists.infradead.org;
	Sat, 07 Nov 2026 14:06:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E4D4E43F96;
	Sat,  7 Nov 2026 14:06:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBAD1F008A3;
	Sat,  7 Nov 2026 14:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794060390;
	bh=+4jpQxhUM2rm241PTUEfsH6sQtxcE1qdLAK5XanGPhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=W4cwxv6ADq9WikNCPRz5ZHzLSQBRwN0hCigf5po9luXmBSicSse0y162x2Q2BrPKc
	 5nBp+qpUO26+UX38SCnJR9P8tTiylIQpbX3dVjl5+j4keqote5U4sd1upo8Ar4nCCC
	 jqU3PCmgQc7HBBbLSl7qtZYiRhH/2d9OIsBZmvXTfmTWhgvTjU3vKaIXwlzBnPVCxR
	 jD9woDqdyCjPeYI/KNJ22H5QIzeZnlHsp0/WLr2VoHnkdY1Ls7R8ibWOutV3/LhP8l
	 mBqcv+pTryZXGHHJt6B5IYpOloCD94uZ+W5nO+/kZOKJ7eWCksFnLLhww7MNYkmrsJ
	 MEJK7c9BulpSQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND v5 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Sat,  7 Nov 2026 21:46:13 +0800
Message-ID: <20261107134613.17830-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261107134613.17830-1-jszhang@kernel.org>
References: <20261107134613.17830-1-jszhang@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

In commit f915a3e5b018 ("arm64: word-at-a-time: improve byte count
calculations for LE"), Linus improved the find_zero() for arm64 LE.
Do the same optimization as he did: "do __ffs() on the intermediate value
that found whether there is a zero byte, before we've actually computed
the final byte mask.", so that we share the similar improvements:

"The difference between the old and the new implementation is that
"count_zero()" ends up scheduling better because it is being done on a
value that is available earlier (before the final mask).

But more importantly, it can be implemented without the insane semantics
of the standard bit finding helpers that have the off-by-one issue and
have to special-case the zero mask situation."

Before the patch:
0000000000000000 <find_zero>:
   0:	c909                	beqz	a0,12 <.L1>
   2:	60051793          	clz	a5,a0
   6:	03f00513          	li	a0,63
   a:	8d1d                	sub	a0,a0,a5
   c:	2505                	addiw	a0,a0,1
   e:	4035551b          	sraiw	a0,a0,0x3

0000000000000012 <.L1>:
  12:	8082                	ret

After the patch:

0000000000000000 <find_zero>:
   0:	60151513          	ctz	a0,a0
   4:	810d                	srli	a0,a0,0x3
   6:	8082                	ret

7 instructions vs 3 instructions!

As can be seen, on RV64 w/ Zbb, the new "find_zero()" ends up just
"ctz" plus the shift right that then ends up being subsumed by the
"add to final length".

But I have no HW platform which supports Zbb, so I can't get the
performance improvement numbers by the last patch, only built and
tested the patch on QEMU.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/word-at-a-time.h | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index f2d16c1eea8d..31240133eccd 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -35,6 +35,10 @@ static inline unsigned long prep_zero_mask(unsigned long val,
 
 static inline unsigned long create_zero_mask(unsigned long bits)
 {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
 	bits = (bits - 1) & ~bits;
 	return bits >> 7;
 }
@@ -67,13 +71,21 @@ static inline unsigned long find_zero(unsigned long mask)
 {
 	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
 	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+		return __ffs(mask) >> 3;
 
 	return count_masked_bytes(mask);
 }
 
-/* The mask we created is directly usable as a bytemask */
-#define zero_bytemask(mask) (mask)
+static inline unsigned long zero_bytemask(unsigned long bits)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB)) {
+		bits = (bits - 1) & ~bits;
+		return bits >> 7;
+	}
+
+	return bits;
+}
 
 #ifdef CONFIG_DCACHE_WORD_ACCESS
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
