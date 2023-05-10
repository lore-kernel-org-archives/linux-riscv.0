Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6649EC7EE22
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 16:35:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=31vsxACMuencD5yY7UCmJ8vsXj/ajd5iJORDVlybpAw=; b=szpfGdqfmhFExR
	/lIpReRXAqOLXUYcSFan289eJl5Xjk7O0YQEbm/F9hezywmpsRyqPJdF6SX23uM+pQauLmDjqsQsB
	ox6WudikiYaWi8hwiYT8t7N5Abg5VuBRfvV5TD+hlwtuHcky9u3Rcr+9Q94K5pAmAbwklYjt503Np
	CYelXWGDmZ66CDnMQVQ39ep6hiaWzkK8rTChdyLaRg6BOj8Fhx8zX0mL4MVHIx9um31Bf/8zsb1Gi
	fvqOFZ5cAf1R7YCW4u/qO+Ma3WcG5WSrirkzEwVOwKqi3JMX1LeGjZ9Vr/7FDNj/MEPiQVy0QQeDv
	gxM8oPaLBUQu8FC9nJxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmmc-006aAA-38;
	Wed, 10 May 2023 16:35:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwmma-006a9U-1D
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 16:35:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DBB37649EF;
	Wed, 10 May 2023 16:35:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BEBAC4339C;
	Wed, 10 May 2023 16:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683736515;
	bh=D/zx5C3wzjM0zZXbvIgMONVy5BqICz3TUA896+jQLlk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pM5PoYrty7yCH0RwPEETSGMTPtIBfqrDnxC1Of4QRrUvRYpcqhfo6CnKstuBdrJ1p
	 Y8cTCUfcyPT9HCkODQhlW0ldspb1r8HMngbvPk58T/mxUVoWPYO0S8YT67WaBZmkkS
	 0guf3w7XP62n7Ufw6skcC1kTsgNS41PBKc3ftTIiOzKTnQIUvBMw98EWCV5UsjLA28
	 6w71JHcobAAmgW+ISjtdcEJaao3XBzY1Aov9TpeRhc+o6IRxbfwVCAXdnvBBH/xOYT
	 JabESi0GONWMCoSl4Pw7TmgOCBO1uEBG3nscObwQzvG6izQ9zkRZEu5L++sWiusIiK
	 gcuU64Yx8J6dw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Schaffner Tobias <tobias.schaffner@siemens.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH RT 1/3] asm-generic/preempt: also check preempt_lazy_count for should_resched() etc.
Date: Thu, 11 May 2023 00:24:04 +0800
Message-Id: <20230510162406.1955-2-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230510162406.1955-1-jszhang@kernel.org>
References: <20230510162406.1955-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230510_093516_456340_3F9906D1 
X-CRM114-Status: GOOD (  12.29  )
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

lazy preempt count is great mechanism to help ordinary SCHED_OTHER
tasks' throughput Under PREEMPT_RT. But current implementation relies
on each arch-specific code to check the preempt_lazy_count in
should_resched() and __preempt_count_dec_and_test(), if the arch, e.g
riscv use the asm-generic preempt implementation, it losts the great
lazy preempt mechanism.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/asm-generic/preempt.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/preempt.h b/include/asm-generic/preempt.h
index b4d43a4af5f7..b583e7c38ccf 100644
--- a/include/asm-generic/preempt.h
+++ b/include/asm-generic/preempt.h
@@ -59,6 +59,11 @@ static __always_inline void __preempt_count_sub(int val)
 	*preempt_count_ptr() -= val;
 }
 
+#ifdef CONFIG_PREEMPT_LAZY
+#define preempt_lazy_count()		(current_thread_info()->preempt_lazy_count)
+#else
+#define preempt_lazy_count()		(0)
+#endif
 static __always_inline bool __preempt_count_dec_and_test(void)
 {
 	/*
@@ -66,7 +71,7 @@ static __always_inline bool __preempt_count_dec_and_test(void)
 	 * operations; we cannot use PREEMPT_NEED_RESCHED because it might get
 	 * lost.
 	 */
-	return !--*preempt_count_ptr() && tif_need_resched();
+	return !--*preempt_count_ptr() && !preempt_lazy_count() && tif_need_resched();
 }
 
 /*
@@ -75,6 +80,7 @@ static __always_inline bool __preempt_count_dec_and_test(void)
 static __always_inline bool should_resched(int preempt_offset)
 {
 	return unlikely(preempt_count() == preempt_offset &&
+			!preempt_lazy_count() &&
 			tif_need_resched());
 }
 
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
