Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1E3C624CE
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 05:00:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WEEtxk8Cwr/3Ax3WM7c+hKIOUWcR3v1vncXJ+J34Y+Q=; b=y4EVnfjxZfBf79
	rRSbxtjJknjer5ko6ugG1H/kiIIumvW3lyalsczyRA8t8iFHHXwvbht4FFRdrHUVBf3c08lnV3aa2
	arVJPpUhbnON8Ghb9mHIHqil5nvYVV9IzhkntjWjStM9ahxuOnPqBBe+wk+Fvp2uMX/5JZb2ATdy+
	hc8wS9ZX0VzzAFtOi45mrVLArHPGRESbbv7phDmJMEQMaSLVxJ0uFFNhE9G8Hxvq1CvDmYX1C3PPZ
	96h6ZyssZ16ZEqqX6hjHCBL4lyJo0uaJa0FYshxo5mtnW9ERD7r+JEah7Phtb1ZDMq+8eobgr/Kc6
	l4PbXn6QXqTVIbxRVo6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gbj-0000000AzjT-1Pib;
	Tue, 01 Sep 2026 05:00:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gbi-0000000Azj5-0vZC
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 05:00:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 671B6602CB;
	Tue,  1 Sep 2026 05:00:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53BA21F000E9;
	Tue,  1 Sep 2026 05:00:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238825;
	bh=Ut/plU37hD5FU0JK0VZhhjzCZo1toEUrT5tdJhQhLbc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KOFSeLalu7RlfBOOrdjKw1xHW46q6Ara4dLGnjFHb/y9LUPjl7w/jLIp7kBS5yPtt
	 6gW/wiwq4QnKqTIkYGPZWydFVktDxG9Hu12pz9BqXsauMQAUinU7ToI7lw61BzQ5y+
	 Nxc3p/VYo7m9ZLPxtOxMGKhhnSe91z35LY914jieSEOXf0Wa3cdGMeHgMgXnG2LA/n
	 uwFRKpCc1nWk6QDF9Tk0XMWLMWbCi3FRxwop+gRYZx02Q22t2frUl6w3Ol6zRZuPpz
	 dnMWikyT+yRflAk0taclfza+VByoaU5305sHJNvr4KVxWE1tTg1czpP/u/eccPIYSe
	 P+4JGkbpF7ApQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 3/3] riscv: word-at-a-time: improve find_zero() for Zbb
Date: Tue,  1 Sep 2026 12:40:31 +0800
Message-ID: <20260901044032.5635-4-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260901044032.5635-1-jszhang@kernel.org>
References: <20260901044032.5635-1-jszhang@kernel.org>
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
 arch/riscv/include/asm/word-at-a-time.h | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index ca3d30741ed1..8c5ac6a72f7f 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -38,6 +38,9 @@ static inline unsigned long prep_zero_mask(unsigned long val,
 
 static inline unsigned long create_zero_mask(unsigned long bits)
 {
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
 	bits = (bits - 1) & ~bits;
 	return bits >> 7;
 }
@@ -69,13 +72,19 @@ static inline long count_masked_bytes(long mask)
 static inline unsigned long find_zero(unsigned long mask)
 {
 	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
-		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+		return __ffs(mask) >> 3;
 
 	return count_masked_bytes(mask);
 }
 
-/* The mask we created is directly usable as a bytemask */
-#define zero_bytemask(mask) (mask)
+static inline unsigned long zero_bytemask(unsigned long bits)
+{
+	if (!riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return bits;
+
+	bits = (bits - 1) & ~bits;
+	return bits >> 7;
+}
 
 #endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) */
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
