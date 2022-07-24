Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5755DC433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Jul 2022 12:25:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kBxl61PUeRoGa+Bg4EUORc6DvaaViY4/QEWjIK+D3x8=; b=HkUQ4Rv0zMmq45
	+39jMznPJTL+zDOxe7uUuFWTKtBO+25UrZmnxCiONgWZjKiQZ3qJ/HgpPeB/j7VZUOlkVYuzRo8Dw
	J7dLgzWLfgaLUvVzZCatQ/MDYUYP94AXtZr7tkO63PQX9V/1yyZrylSTf1tTkMXm5admSCxDPSQro
	XHDy9i999hxhRs86ZavlkMMv+Phf6YhQxAmHDuCjnjq7+ckCvWNYrCiH3FJff5PeClCvsdHhRAsVY
	a7/dc0fw7qfW0+FTTOtP126mxNDmaUlwu9dMT488Ox5vhwHgteJ/DpDr8PBqLNFUNbtrwMD6ljTgB
	R91aCkFkwQ5cNy9+7BPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFag4-0060Z0-Re; Sun, 24 Jul 2022 12:25:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oFag2-0060UU-Hi
	for linux-riscv@lists.infradead.org; Sun, 24 Jul 2022 12:25:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BAB5561050;
	Sun, 24 Jul 2022 12:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C85A0C341C0;
	Sun, 24 Jul 2022 12:25:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1658665535;
	bh=x8ThgiIuKR7Cb/zZ7HilMYDMWlq4+j+CW+ILWn7Ti5k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kKZZEb6YKDRcOlsszyCzQ7M/uNpEnrWtnxpdvQHnPWNz6K51FSe01RcVzp+UyRzpo
	 Y7gWUT7sY12kIkJR5bdYjqslJJh+yrQ8N0P1Skiv+7a2AThxxRTaRpSyzoJ5Ao7wwS
	 irOpP/RkMvz7YrrfbUqsK/Gmt+hqmkZ2OlZd6LIwe8Nv5YxR/98QnkRfte95q2QhFg
	 o+ZJTSbNZbOiaTbHrLMktgKfNHuiFCb5yAG7DMzP41IP9xpwjfN4fOnNOv2wzsFOov
	 IpfSE7107PyFic9a3E9sYqpNyD84Ki2YVyFeZP3R2ugR4GwMP2A4Sx9tdkWPhPMeP/
	 Yp2xWgZPk1Lcw==
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
Subject: [PATCH V8 01/10] asm-generic: ticket-lock: Remove unnecessary atomic_read
Date: Sun, 24 Jul 2022 08:25:08 -0400
Message-Id: <20220724122517.1019187-2-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220724122517.1019187-1-guoren@kernel.org>
References: <20220724122517.1019187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220724_052542_645337_A25CE799 
X-CRM114-Status: UNSURE (   9.55  )
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

Remove unnecessary atomic_read in arch_spin_value_unlocked(lock),
because the value has been in lock. This patch could prevent
arch_spin_value_unlocked contend spin_lock data again.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 include/asm-generic/spinlock.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index fdfebcb050f4..90803a826ba0 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -68,11 +68,18 @@ static __always_inline void arch_spin_unlock(arch_spinlock_t *lock)
 	smp_store_release(ptr, (u16)val + 1);
 }
 
+static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
+{
+	u32 val = lock.counter;
+
+	return ((val >> 16) == (val & 0xffff));
+}
+
 static __always_inline int arch_spin_is_locked(arch_spinlock_t *lock)
 {
-	u32 val = atomic_read(lock);
+	arch_spinlock_t val = READ_ONCE(*lock);
 
-	return ((val >> 16) != (val & 0xffff));
+	return !arch_spin_value_unlocked(val);
 }
 
 static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
@@ -82,11 +89,6 @@ static __always_inline int arch_spin_is_contended(arch_spinlock_t *lock)
 	return (s16)((val >> 16) - (val & 0xffff)) > 1;
 }
 
-static __always_inline int arch_spin_value_unlocked(arch_spinlock_t lock)
-{
-	return !arch_spin_is_locked(&lock);
-}
-
 #include <asm/qrwlock.h>
 
 #endif /* __ASM_GENERIC_SPINLOCK_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
