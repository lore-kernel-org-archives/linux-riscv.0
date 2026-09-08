Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 608E9C79FAA
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Sep 2026 00:13:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jn3UdyoDtj8uVShu6zH3WGcBpudrCWWU0T+gFf/XUFs=; b=Q7zxxqz5TaYuUy
	xrGhXYdwyeJuIY79z9WQkaPYSITIMDG83lr1p8hSa1AFyZ7hyCHqTi7KgAgBEndvhectbU6VENXLr
	7dQZtsFTydVzc8GzHkYHf21en5Ky8sMrrtC4oW2GGN28QHxn3BqW4LhL65MdMu6tvAnrIiWMGro7X
	a0U6671GfOKcij1TfmX9e/krEHSYRg5SgwkQGbrmFO00BK7wYVsgg2ABH5wsCYL+PGVjOkO/wZCdI
	iB8mrLIGb/D/YLbs+zVt+BJgiMxBurg7bqUnWUzwr+SxAC511umbF//DQR88qd19ADbx+EnywUhdC
	JeHRLG+Bd4Hb0dLZueeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45w2-0000000ATzw-1XFK;
	Wed, 09 Sep 2026 00:13:06 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x45w0-0000000ATzQ-1lu9
	for linux-riscv@lists.infradead.org;
	Wed, 09 Sep 2026 00:13:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2367B43E4D;
	Wed,  9 Sep 2026 00:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 787D41F00A3A;
	Wed,  9 Sep 2026 00:13:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788912784;
	bh=gPSXCb0eA8BM+P5Y//s4nfh/kZxqoCvqmOhim53CK5s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=h7lQTFh3CQAnVksW6Zj8yeFGo7my2tdk7q88OzLB8reV60Tf8cIBQ8aUNQ7l99QNT
	 MPe2KsZ/cFiQ0C2uhIXNbURCHGedprS/4JIJiL5PiIGtG7agSfZzQl2hRqwxSMFARY
	 xAwGRRUXO0PFZBO9UXLBtUHRCbGOV2ipPJhU64XfG0ivy1Z9nDBV9haDNHi+I9qtCK
	 yPuyGvFZTXn2EUkPEU/7k27XL89HUMsVmZ8YOVGGml2AEo1o6yQspIObhbnmHJ+Qe1
	 Z60cPKiHh9X8s4WmghurVMSk5cHVkd4bRaewavpIB7Eq2bSVI2OJPOgUtpjTSozifJ
	 H05AuE7fHa1HA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/3] riscv: word-at-a-time: improve find_zero() without Zbb
Date: Wed,  9 Sep 2026 07:53:11 +0800
Message-ID: <20260908235312.8440-3-jszhang@kernel.org>
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

Previous commit improved the find_zero() performance for !RISCV_ISA_ZBB.
What about RISCV_ISA_ZBB=y but the HW doesn't support Zbb? We have the
same heavy generic fls64() issue.

Let's improve this situation by checking Zbb extension and fall back
to generic count_masked_bytes() if Zbb isn't supported.

To remove non-necessary zero bits couting on RV32, we also replace the
'fls64(mask) >> 3' with '!mask ? 0 : ((__fls(mask) + 1) >> 3);'

We will get similar performance improvement as previous commit for
RISCV_ISA_ZBB=y but HW doesn't support Zbb.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/word-at-a-time.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 1dcac57a73dd..f2d16c1eea8d 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -65,8 +65,9 @@ static inline long count_masked_bytes(long mask)
 
 static inline unsigned long find_zero(unsigned long mask)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
-		return fls64(mask) >> 3;
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB) &&
+	    riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
 
 	return count_masked_bytes(mask);
 }
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
