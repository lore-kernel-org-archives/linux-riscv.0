Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 616D1C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 12:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uJJNa1zgJ7AmmiS0a5dVciDDoTTN1r0hap9vjEM4r1U=; b=MfH+602P4IYWrf
	URgT90X9ezj+PqfxNm44sGi+yEHXEfZZpmEbERLfx9q+yKeA6eTYY7dqvI32lp0O16HKKoPGicN0+
	7mRvxR4/IBhZq5JIRl+80h23Ehd+wpUC8YNw5Iqzxgcp8z15ePYDmQKsEyb4lLI0nxDkvsANqMUqv
	cBXGx+QVIvJ9ftFwocPw6driz9HzDqpFT13Cn14tL2Ve6olmJdqwfRxeNoKy22T5mBdCJ3aFywq3U
	vprCYOqSCvBnn8oDCb6zHtjyQu+7cGthhK9sBhOuuYki04Tc3lGFTytZ84x6IRITdSskwupa/znBM
	E/mE+Hw5K4lCfmU6wIBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFago-0061Fw-O8; Sun, 24 Jul 2022 12:26:30 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFagk-00619S-OW
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 12:26:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 60202B80D71;
	Sun, 24 Jul 2022 12:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0295C385A2;
	Sun, 24 Jul 2022 12:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658665584;
	bh=TntvPReuJPtm/qiF5zkEbZIbJqaHdY1xoBE45jhztPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EPJhAETB/ZqTQnVFktFMepdVKYlphjry92IZblQTOLZlxU0UYThU9b2tUKt8pPiog
	 GmtZpXduJBpd7drvjOtcETgnubOvsBOOhl0+wXj+iZncxwrG90Wy68y6saAdgVuKkQ
	 GeSnzS+R7/0wu5I3pRqG2sgK/svzsONsYE2DShu4SccBavpViBvBIlNonqIq9XWE1K
	 PW2UxIWAWPxsbxPxO7bABb89m0HCeMoAKBnZitSzUx6jasCKU+wyoy/vebAL4na6I0
	 3P6pnHIKjVySXbzldBjOCdD5/o+wnT5P2Ry/b0KCWEEXJ1A7u7+6d9GWrShyichSom
	 KVIg8pv9nXfcQ==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	mingo@redhat.com,
	philipp.tomsich@vrull.eu,
	cmuellner@linux.com,
	linux-kernel@vger.kernel.org,
	David.Laight@ACULAB.COM
Cc: linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V8 09/10] csky: Enable ARCH_INLINE_READ*/WRITE*/SPIN*
Date: Sun, 24 Jul 2022 08:25:16 -0400
Message-Id: <20220724122517.1019187-10-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724122517.1019187-1-guoren@kernel.org>
References: <20220724122517.1019187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_052626_982336_12E7D551 
X-CRM114-Status: UNSURE (   8.18  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Enable ARCH_INLINE_READ*/WRITE*/SPIN* when !PREEMPTION, it is copied
from arch/arm64. It could reduce procedure calls and improves
performance.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/csky/Kconfig | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/arch/csky/Kconfig b/arch/csky/Kconfig
index 21d72b078eef..dfdb436b6078 100644
--- a/arch/csky/Kconfig
+++ b/arch/csky/Kconfig
@@ -8,6 +8,32 @@ config CSKY
 	select ARCH_HAS_SYNC_DMA_FOR_DEVICE
 	select ARCH_USE_BUILTIN_BSWAP
 	select ARCH_USE_QUEUED_RWLOCKS
+	select ARCH_INLINE_READ_LOCK if !PREEMPTION
+	select ARCH_INLINE_READ_LOCK_BH if !PREEMPTION
+	select ARCH_INLINE_READ_LOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_READ_LOCK_IRQSAVE if !PREEMPTION
+	select ARCH_INLINE_READ_UNLOCK if !PREEMPTION
+	select ARCH_INLINE_READ_UNLOCK_BH if !PREEMPTION
+	select ARCH_INLINE_READ_UNLOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_READ_UNLOCK_IRQRESTORE if !PREEMPTION
+	select ARCH_INLINE_WRITE_LOCK if !PREEMPTION
+	select ARCH_INLINE_WRITE_LOCK_BH if !PREEMPTION
+	select ARCH_INLINE_WRITE_LOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_WRITE_LOCK_IRQSAVE if !PREEMPTION
+	select ARCH_INLINE_WRITE_UNLOCK if !PREEMPTION
+	select ARCH_INLINE_WRITE_UNLOCK_BH if !PREEMPTION
+	select ARCH_INLINE_WRITE_UNLOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_WRITE_UNLOCK_IRQRESTORE if !PREEMPTION
+	select ARCH_INLINE_SPIN_TRYLOCK if !PREEMPTION
+	select ARCH_INLINE_SPIN_TRYLOCK_BH if !PREEMPTION
+	select ARCH_INLINE_SPIN_LOCK if !PREEMPTION
+	select ARCH_INLINE_SPIN_LOCK_BH if !PREEMPTION
+	select ARCH_INLINE_SPIN_LOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_SPIN_LOCK_IRQSAVE if !PREEMPTION
+	select ARCH_INLINE_SPIN_UNLOCK if !PREEMPTION
+	select ARCH_INLINE_SPIN_UNLOCK_BH if !PREEMPTION
+	select ARCH_INLINE_SPIN_UNLOCK_IRQ if !PREEMPTION
+	select ARCH_INLINE_SPIN_UNLOCK_IRQRESTORE if !PREEMPTION
 	select ARCH_WANT_FRAME_POINTERS if !CPU_CK610 && $(cc-option,-mbacktrace)
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT
 	select COMMON_CLK
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
