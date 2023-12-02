Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09FBFC10F04
	for <linux-riscv@archiver.kernel.org>; Sat,  2 Dec 2023 14:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ATkqwRnK0dhsw/L5ssx37WCHpZ8qxCckT5V4v8o+At8=; b=o+G54tS2puCmlM
	YVoIFaS3itY8o6qALpXiT1pYOD+6Zpvop9GTRgSgaEcXpIA9l3BDZgMpZQ3Yc1WhWpRLqHd9Pjjwn
	WsPIsG+bkTN4arccoeAyZPU/B1oXkbbU+DeadXTknepNVn/Mhgbu3GbtsL97PK9qpIEN7b7QOohY2
	EafPBeGdQzgL1w5B6T257iGO07lLGC+u0ACRHwzvXhC3BL88RA2qkQQGHxm/NCdCF47A+Yw6rTUMt
	qKFv7sGmQtSd4zh8H9gm2quoUdO6x2j85RwDkjrnLZKok1GZt+i7ppjlnh1iygcROBJk8EQAsjT+k
	AytYEQa8Y7JTgG0EL+Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qml-00Fmpn-19;
	Sat, 02 Dec 2023 14:15:59 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r9Qmg-00Fmmu-1X
	for linux-riscv@lists.infradead.org;
	Sat, 02 Dec 2023 14:15:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2485660B73;
	Sat,  2 Dec 2023 14:15:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3574C433B6;
	Sat,  2 Dec 2023 14:15:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701526552;
	bh=f5wYmmEc/6YNMD4xeSRCsSaZscE5Ri2p04isx1ogm+s=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Ial5msYMisNvSBLgaIv84BoLRvHY5kBgWPY2YeInOEJ03ZnAa+AU8INHjN48bxfof
	 KJx5rAacZfFcgF1QYUUOkQyJSThnvmHmzlOlgdLg0I+occ47+4DyG91NJKP86M4RDs
	 LPq3zhIgi1Gv/xvP4arCU2uAa8uhs2hTnlcWPYX0n4bSqHrVaf0RvoNZtQUL4xRKlF
	 D1tCHvXQdP9MsjEsAAGX5Zq8SoFhlWsJdRz2FFTYbuS7DP8DJ3wgSFseWk4SMOzgF4
	 z0dqLn3uX6cT306Y3tErtpAcxAmmQ39Yhnb8KVYCdM27TkerisIXDEeXZ71zPmg/nT
	 KSHPimVFypkpg==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/2] riscv: cmpxchg: implement arch_cmpxchg64_{relaxed|acquire|release}
Date: Sat,  2 Dec 2023 22:03:23 +0800
Message-Id: <20231202140323.315-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231202140323.315-1-jszhang@kernel.org>
References: <20231202140323.315-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231202_061554_557151_74530717 
X-CRM114-Status: UNSURE (   9.87  )
X-CRM114-Notice: Please train this message.
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

After selecting ARCH_USE_CMPXCHG_LOCKREF, one straight futher
optimization is implementing the arch_cmpxchg64_relaxed() because the
lockref code does not need the cmpxchg to have barrier semantics. At
the same time, implement arch_cmpxchg64_acquire and
arch_cmpxchg64_release as well.

However, on both TH1520 and JH7110 platforms, I didn't see obvious
performance improvement with Linus' test case [1]. IMHO, this may
be related with the fence and lr.d/sc.d hw implementations. In theory,
lr/sc without fence could give performance improvement over lr/sc plus
fence, so add the code here to leave performance improvement room on
newer HW platforms.

Link: http://marc.info/?l=linux-fsdevel&m=137782380714721&w=4 [1]
Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/cmpxchg.h | 18 ++++++++++++++++++
 1 file changed, 18 insertions(+)

diff --git a/arch/riscv/include/asm/cmpxchg.h b/arch/riscv/include/asm/cmpxchg.h
index 2f4726d3cfcc..6318187f426f 100644
--- a/arch/riscv/include/asm/cmpxchg.h
+++ b/arch/riscv/include/asm/cmpxchg.h
@@ -360,4 +360,22 @@
 	arch_cmpxchg_relaxed((ptr), (o), (n));				\
 })
 
+#define arch_cmpxchg64_relaxed(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_relaxed((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_acquire(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_acquire((ptr), (o), (n));				\
+})
+
+#define arch_cmpxchg64_release(ptr, o, n)				\
+({									\
+	BUILD_BUG_ON(sizeof(*(ptr)) != 8);				\
+	arch_cmpxchg_release((ptr), (o), (n));				\
+})
+
 #endif /* _ASM_RISCV_CMPXCHG_H */
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
