Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6B20D2D0E7
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jan 2026 12:43:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Enc9EzXkk+DJBQ4f2N6uTQvpPRx+TjqjdrAkU4cleAA=; b=3SkRlghQNbHcdo
	Xe4sU/nHELKIN5Kc4oIJDWcwQOl48E2TuYeabUACnSU8l7xkQEgkVMUSSPT5KNzHG88bpgod5V/+x
	Ld8G6GxQA5GFhCXW5zEs7ZBL1mypo2YGeCFsejs9kVNstqpQzXfOjgVEEittsXdATPHpSIVN2e+y8
	RZcMOwpplNNfW0G0RBGHtEWrChMXPPzVrb/2hTj3rtwjWqExL8EIiI4s5R3AbWNeC0FTEfvJDqE/Z
	8kceBdNL2RILD+XoO8jG0n41D2QFi5d4veT4E78YEa2bduwnUxTkqua9Pee/afP445w9Ce5H7ptgA
	quzD4D3rjcxnjH8HYDng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdk1-000000076Zn-1DKw;
	Tue, 13 Jan 2026 12:43:21 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfdjz-000000076YP-1Bpb
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jan 2026 12:43:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 80907440FA;
	Tue, 13 Jan 2026 12:43:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68582C16AAE;
	Tue, 13 Jan 2026 12:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768308198;
	bh=jy33/Tc52BzbW3MkRv/+6XiOGSKTPkOy55r39xq3KKA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uG9oa/Hxj5wlTi9C1TTXNuar1ADxBHwTZ9/+NKGpAPP0iWkeGAQC0MD0s7ueD369n
	 rmxQny8MbrK8k202M8b+53cwRA9XBgV+14xrR6C5n6Ucrr+8KHSHyYQy+IIT260BTI
	 1mR6Em0EXndaYD8d52tQ5uzCkCzOwCipUYiQdIXs5+dw1EiBZULKL5TTJ0wBv+muc3
	 SX2Nl1h/Zc+DR4XhEczZhsbsINYwsA/YBWNRbyYWUV7PpwXEDMQQ7mbwy4MK7oefAn
	 wR4EWBYHiTqspb4vIpDxlYu4yOxgwqFwbVmPIU9ekDXPSIEKFl0m14pDbDUOumyLXp
	 F8sh41y6Erkxg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] riscv: word-at-a-time: improve find_zero() without Zbb
Date: Tue, 13 Jan 2026 20:24:56 +0800
Message-ID: <20260113122457.27507-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260113122457.27507-1-jszhang@kernel.org>
References: <20260113122457.27507-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_044319_346549_837F6D0B 
X-CRM114-Status: GOOD (  14.04  )
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
