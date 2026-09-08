Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63694C79FAF
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 00:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n2sAqbuCYiuh8Yl72mOtjHhEgl4vdpeWTnzwP8KXSuY=; b=V7U0RrpbQq/Ken
	m0Cl6A0qVD830IVUMiibPWqu3UBCi7P4ZzeNyBBBiN1isu/QupHEyS55C/2dGyxqg1TC+Q1UsYCtN
	RpaT9S10Q2FXoh7TxiFxZCD265ntgyxYq5d1sRNZ7VzHMtf6O/344I3m19ZjXcPGPDCSnAXjg2tl6
	KqPWcU/QeboVogq0+1jKhAGr0rnl82TDe/Hlxg3JAyPBWuuRWtYRMGY5wZSzfL2sEdm3Fv8QeDS+3
	0tJCw1exJmtjqFAVO7gL+9IxFcBLsrOCxr/TQtuLLFbiFaN6TJEUGBlpUEpvpWQ/E9I2/xg4XRUB4
	y/oT2Z+wXQtBW63hNCtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45w4-0000000AU0X-1uKA;
	Wed, 09 Sep 2026 00:13:08 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45w2-0000000ATzv-1pm4
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 00:13:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F80A444F5;
	Wed,  9 Sep 2026 00:13:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7495D1F00A3D;
	Wed,  9 Sep 2026 00:13:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912786;
	bh=U1/4nM4HTUPSSUQ1nie+OmGSZKZ9RR8PG8T23avywYE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=fDByqrPKFBoc5p3L71aUU1PQoZlJ2QUW3OqbBp+LXhGFE/MpstF3LoaAKwH84B0NP
	 uLz0AqoojfLldWY6/eD+eiAYZFOvpBVI9SiT7onggHqZ85Lbl8+mqsTLBSY8hzxC3N
	 frlzcn716iNZhJ9/x7eVdtvyuZ52uZQIDW+ROr/qNpRCPLvWo9Hg/ny/n1eQ5QwY9Z
	 Q+UsDXOb1DuzgGPIHM/UajWGpghmRjVn89VXJvxRylbStjslHY/2zGj8Xb1/DhqCjM
	 FUONCJQY81zlF38++I9vQbOlUB9nbQ/xDrc82eGKdgDeXYOv43uHTXVI0Qpoo108OK
	 gXRvajFnZwb4g==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Wed,  9 Sep 2026 07:53:12 +0800
Message-ID: <20260908235312.8440-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260908235312.8440-1-jszhang@kernel.org>
References: <20260908235312.8440-1-jszhang@kernel.org>
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
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
