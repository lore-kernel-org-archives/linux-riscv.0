Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83BB9C00140
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Aug 2022 07:14:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82Z3TnUhXL0ukgntI1o5miFIQiddYja3owAOZehczt4=; b=KfHqxbBidzuSR8
	jEGey85xztuRhg1J5XmoJ9sxai6fKRyUJrBEghCIXL/1MTsGaDcwgqXv5S86UCTBzLE4T9An7Wjlv
	UNAlLdg4lO2YXiaceJkwt4KmwT8Gk6zV2JPeB3ayS2umz1haRuRCsk/4Wx15YnqNWtziSOc5pcBDr
	8c1ygcPONT0kHNGYdmyAwHJUpTswUim4BoQ17T3IFGs8PzTBhsNT29VshtAo2dqHjZjM8zBj2NF2C
	6QbBjOMqxmRfa3TIbZzlIw/76ZEOPyU1mtBAWrGS23JSzMQeWuwSOlbJIIl+LuV4p+RzVC8xsykRP
	TjQZ79QeeOcb+MZ5fZtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxo-00C1sf-HR; Mon, 08 Aug 2022 07:14:12 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oKwxl-00C1oQ-BN
	for linux-riscv@lists.infradead.org; Mon, 08 Aug 2022 07:14:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 213ACB80E13;
	Mon,  8 Aug 2022 07:14:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C1E9AC43144;
	Mon,  8 Aug 2022 07:14:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1659942846;
	bh=WoY94/J8cfzum9irmyRxRUySe4AhzCRGKz56Za4j0Us=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Dmp61UFU8SA/lRXSMwulcK8hsmZHXKxWNoltZU6J1+C0Tl1VlTX6NbEQpqhjmwwC0
	 aC2JsVf6ET8hY6KdAULsOP5se+CPera0Vk+WakOUOMR2TfRuAJrA/5K2ZuXBQFJXhN
	 b1vZCmK7gyPtayyCTr39QKIDO4xmLbUcZf2eYISecYjR0isYe5RDarzFsF3t8RE3rC
	 F5O/b5SdogsbAuMSc5EZn5LAL3v4OSBUnsf69xe1NxDIPiRTe5IsbD1ct861I21LXy
	 gt8cZJsiA/wU0qpb7KnvWYckD8OOBtFM/nIGT+ZxpzSQB79WHN0CgQNfNOrkQX70Wc
	 yOkxvWPJg/ahA==
From: guoren@kernel.org
To: palmer@rivosinc.com,
	heiko@sntech.de,
	hch@infradead.org,
	arnd@arndb.de,
	peterz@infradead.org,
	will@kernel.org,
	boqun.feng@gmail.com,
	longman@redhat.com,
	shorne@gmail.com,
	conor.dooley@microchip.com
Cc: linux-csky@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH V9 05/15] asm-generic: spinlock: Add queued spinlock support in common header
Date: Mon,  8 Aug 2022 03:13:08 -0400
Message-Id: <20220808071318.3335746-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220808071318.3335746-1-guoren@kernel.org>
References: <20220808071318.3335746-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220808_001409_547449_049FAF55 
X-CRM114-Status: UNSURE (   8.44  )
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

Select queued spinlock or ticket lock by CONFIG_QUEUED_SPINLOCKS in
the common header file. Define smp_mb__after_spinlock with smp_mb()
as default.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 include/asm-generic/spinlock.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/asm-generic/spinlock.h b/include/asm-generic/spinlock.h
index 6f5a1b838ca2..349cdb46a99c 100644
--- a/include/asm-generic/spinlock.h
+++ b/include/asm-generic/spinlock.h
@@ -3,7 +3,11 @@
 #ifndef __ASM_GENERIC_SPINLOCK_H
 #define __ASM_GENERIC_SPINLOCK_H
 
+#ifdef CONFIG_QUEUED_SPINLOCKS
+#include <asm-generic/qspinlock.h>
+#else
 #include <asm-generic/ticket_spinlock.h>
+#endif
 #include <asm/qrwlock.h>
 
 /* See include/linux/spinlock.h */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
