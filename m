Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB06C61DE4
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Sep 2026 05:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Enc9EzXkk+DJBQ4f2N6uTQvpPRx+TjqjdrAkU4cleAA=; b=G49kj3d6BUnqsN
	KRiwV9dxuiqCqipH26vksg79P23WEOuWCFTQQpflRzVVzaCYXEFta4t1yKX+m7SCzwaDKKbYG9loX
	qCxy+ozhynfOUehLISlCMMINzO2ubJoDdg8c5kwijjshTsqG//hynKusGz0XCpsEZtmo46jOWLeoZ
	2zqE4QsUNH0ZRQJoMyxy3IzAFZL4ic9q7gJ6/2LmF76YGgpQ6MNWWiucINT6Ghhwwz6gyDYmi0HZ9
	D9N6wSZGK/24+2IYpU6/cKfzJFMN1fnDy1ozcp0zCs4BmaAMOwwTAgqnHFcpVWBDeHfBVwRKuL6M4
	hfn8Lf1tdNkoS/U5WVeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gbh-0000000Azir-0uyj;
	Tue, 01 Sep 2026 05:00:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Gbf-0000000AziC-1Qvk
	for linux-riscv@lists.infradead.org;
	Tue, 01 Sep 2026 05:00:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C12E1601DE;
	Tue,  1 Sep 2026 05:00:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B170B1F00A3F;
	Tue,  1 Sep 2026 05:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788238822;
	bh=n3Q8RF4M/hgya8VOSqKUVI4WBX6zl6C8eGltqGxQCpU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=GhggRRq7EsKH9sMWM8k2d1uwhxzAJSJ9aPSF4BJYxuRYt9xWdzISSPhs89uRS9m/I
	 zFMw5vieOpZtlT/2km9PpRFzZi43/8MhQPQgDLc6kKndW0NPTQspq0HjaeDVm4kDty
	 r7KvqKrS/QPIybbO58rC3bcvQKJzqSsgZr3pqSEuwnEXh3l+RoMugsXeRjShgskpNO
	 cdrjp59786xLx9ShpJ11UcCYfEo9E2LqmE467u2xZaKvTVlpso1VloBR458X9e6hwF
	 KfV0OXJe9M7jtIUu0uJOAncLYVZKBaokwoNRaUmQX5up0dTbpzVBvLT7LG+tmdETfu
	 ooqEcrsq7CTQQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 2/3] riscv: word-at-a-time: improve find_zero() without Zbb
Date: Tue,  1 Sep 2026 12:40:30 +0800
Message-ID: <20260901044032.5635-3-jszhang@kernel.org>
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
 arch/riscv/include/asm/word-at-a-time.h | 29 ++++++++++++++++++++++++-
 1 file changed, 28 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/word-at-a-time.h b/arch/riscv/include/asm/word-at-a-time.h
index 0c8a9b337f93..ca3d30741ed1 100644
--- a/arch/riscv/include/asm/word-at-a-time.h
+++ b/arch/riscv/include/asm/word-at-a-time.h
@@ -42,9 +42,36 @@ static inline unsigned long create_zero_mask(unsigned long bits)
 	return bits >> 7;
 }
 
+#ifdef CONFIG_64BIT
+/*
+ * Jan Achrenius on G+: microoptimized version of
+ * the simpler "(mask & ONEBYTES) * ONEBYTES >> 56"
+ * that works for the bytemasks without having to
+ * mask them first.
+ */
+static inline long count_masked_bytes(unsigned long mask)
+{
+	return mask*0x0001020304050608ul >> 56;
+}
+
+#else	/* 32-bit case */
+
+/* Carl Chatfield / Jan Achrenius G+ version for 32-bit */
+static inline long count_masked_bytes(long mask)
+{
+	/* (000000 0000ff 00ffff ffffff) -> ( 1 1 2 3 ) */
+	long a = (0x0ff0001+mask) >> 23;
+	/* Fix the 1 for 00 case */
+	return a & mask;
+}
+#endif
+
 static inline unsigned long find_zero(unsigned long mask)
 {
-	return fls64(mask) >> 3;
+	if (riscv_has_extension_likely(RISCV_ISA_EXT_ZBB))
+		return !mask ? 0 : ((__fls(mask) + 1) >> 3);
+
+	return count_masked_bytes(mask);
 }
 
 /* The mask we created is directly usable as a bytemask */
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
