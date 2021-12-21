Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D37C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:05:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cmCqozI9/nBNRuYjX64r/ov+o+po9DjECdafgvTBMX0=; b=HyxZfdnhl9ry6o
	JKy+J8Im+LmGrptoMD8rQMgYRaS7+bOOACD/WA3iN21ZmTXZJ6z72pnCSyVsvH5A0P3DHEM8qdPX/
	smeF1cfL6K9oovZwR2lNgcTSyJuwuW4lI2vGiXrJE7SMyYdEEoPRwSq33jo21V1onNur4ah3lySnE
	peUYRNH8CAjhSS40B/kuylbwcYttUsmm5j/FosdI2hixWu4wydHNmSCUaNlxD2kZ9TSO9Sust+Paa
	FTeGxlKCLnti2BXYii+FcyycWPa9vThxUjgxhEGmB+uVL5+DU9X9gt/4fYnEk31vcIEnUaFR/dBXA
	hRfrxMC06RO2roTWKMyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mziaA-007gzs-K5; Tue, 21 Dec 2021 17:05:46 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziVp-007euc-SL; Tue, 21 Dec 2021 17:01:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 98830B817C7;
 Tue, 21 Dec 2021 17:01:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D78D7C36AE9;
 Tue, 21 Dec 2021 17:01:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106076;
 bh=hn3veBBJZYE9nGCcPpANoBu5axxXjoY0y6QW+W/U4eQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=uWfUvlW0RDAG6Ozg92WgcggGzUxYXEmU7ssB7PoDXcyO8Fg6738JJ45CZmqBYm1b/
 DQXSTRlGz4EMqO2yWos31vB4R3NHHgLDS12AKWvT6zJ1kI6Nkb22e8wSDqePts4Unk
 Z4fXAth9bv2bYajqEIbdq3tqQdFw6kL7QvetvboWvL3YQ0tvwI77hsbIE1CsW2rKAX
 t1yn46OfMf54pm80ItEiXxIPNchdgiq7FILgGEKd4DTsl8f1NgpIcHkf2OIp9NjcvN
 FmjW7DG0y24jHMb2lsRVgE+RYZuvL1HU46BxKpRXFZH95UkpjyY44yWTODhfsSKdMH
 YIf0ZH22SRELg==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 2/8] sched: x86: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:51 +0800
Message-Id: <20211221170057.2637763-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090118_095606_C4CA0EDF 
X-CRM114-Status: UNSURE (   8.37  )
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

This macro isn't used in Linux, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/x86/include/asm/page_64_types.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/x86/include/asm/page_64_types.h b/arch/x86/include/asm/page_64_types.h
index e9e2c3ba5923..6191cf417c31 100644
--- a/arch/x86/include/asm/page_64_types.h
+++ b/arch/x86/include/asm/page_64_types.h
@@ -74,8 +74,6 @@
 					IA32_PAGE_OFFSET : DEFAULT_MAP_WINDOW)
 #define TASK_SIZE		(test_thread_flag(TIF_ADDR32) ? \
 					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
-#define TASK_SIZE_OF(child)	((test_tsk_thread_flag(child, TIF_ADDR32)) ? \
-					IA32_PAGE_OFFSET : TASK_SIZE_MAX)
 
 #define STACK_TOP		TASK_SIZE_LOW
 #define STACK_TOP_MAX		TASK_SIZE_MAX
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
