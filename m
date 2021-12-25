Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C95AC433FE
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=flCgNddtvAABxiGuYkBKbb297uwtZ7Ur/iBxt6lNk8U=; b=G9S9BG8xVuB/La
	n6oDDiD3cPRyu/AUFrq140KzCgqOBlIv2rKA2HYsZH+cPwhstzCOgN+TIrzOzmI1At+yf8zZh/JPQ
	Uz4f/koq+1BEzm2QvAZ3Cdl38db9LSWAqX1MgH9PoBatgBoBAxOb7crwlbmh/7AvHhLOXXN9uTkOz
	t5HY0+h9kqbFsROLC8XKb/I9cVMu+n8dsMbBnyGcqJ/nFyJGX54Kj3M4OaAfIDa0pvxqs7CcNHxqE
	dypI5J28EhfroyEgGJG9UmEptSZxngBK+z3eg5cvCIk+yiLOS8WSwl9Y1t1goD964DWYUT691VTYZ
	6PW0IcmkICQv2+S/PBmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z88-00EeZs-B7; Sat, 25 Dec 2021 04:58:04 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5Z-00EdDw-QB; Sat, 25 Dec 2021 04:55:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 5EB3E60A6C;
 Sat, 25 Dec 2021 04:55:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D298C36AED;
 Sat, 25 Dec 2021 04:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408124;
 bh=2zgLt5m4opNmUCEFSnx0Q5KUECGIsLc07ztCDJUJaOs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rDZUQlpCKFHoVJUhEmnp3qJoPD/dkCpcxPxVab4pfzGV0bRYlto9zUDaUp2sJ1p3P
 QSv1tGv3cLd55dXRVh4qwy5EZmEETgCZ1rFV3yjxwxNFu8aZjCbYc+YAx9hDz8+mkN
 2bOp4wCHmGoJaiTy/468jP53YfU7u3mC0pxDUq7pcDsyjKCQxAIZ/cWNI0CY7nPwFL
 8tudlZG/ofnsRiynAt6BU413lHOAcGFvo+f/pS6EREBv6WRvwT77vOZdpcNcgddYWl
 pgE/+XNnE4ra9oS0Yff9+X2X8ojGenuNuheE/opao+eRHssOpXJ+O/Wa4sxh84eeXF
 Dkb/jNJpaRfeA==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 7/8] sched: arm64: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:29 +0800
Message-Id: <20211225045430.2868608-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205526_340155_A62328B1 
X-CRM114-Status: UNSURE (   8.23  )
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

This macro isn't used in Linux sched, now. Delete in
include/linux/sched.h and arch's include/asm.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 arch/arm64/include/asm/processor.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/include/asm/processor.h b/arch/arm64/include/asm/processor.h
index 6f41b65f9962..d24dfb49237d 100644
--- a/arch/arm64/include/asm/processor.h
+++ b/arch/arm64/include/asm/processor.h
@@ -65,8 +65,6 @@
 #endif /* CONFIG_ARM64_64K_PAGES */
 #define TASK_SIZE		(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : TASK_SIZE_64)
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_32BIT) ? \
-				TASK_SIZE_32 : TASK_SIZE_64)
 #define DEFAULT_MAP_WINDOW	(test_thread_flag(TIF_32BIT) ? \
 				TASK_SIZE_32 : DEFAULT_MAP_WINDOW_64)
 #else
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
