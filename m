Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3853DC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YBvGktdZMUhd9Ehb8tLQcnK/kZ8urrwnLeEByJzlde0=; b=bxBRFy/h2VMli4
	ejbYU7uOhow+hSLqyHymea/sQWqYVvOSQBRklZriLKhaFP2zF0EPzBy16Xx98etfEdOv4EJWz5J6c
	JMRIYSLqJhueKD8nEB26X5OFwiMuOXyxea+3Tf+12PL1KmlIfaZShdc2Zv9VIzce1l32H2/JWrVYr
	3WwoXeEhV2Fi1Bv2rVeLoif2/x6wPk62jN+xV+DouCJ6JYNrNhhjZp9AjGtc4/gNN99IoCe0ED7OF
	+h8j/Ctbv4MEkgbHOrxajJIYjqCDHt7J64bxQoMdaGwj1Jczs0pv+f26yjQjYccgTNGrglIcttZ+K
	R/N7FE+P1lc5aNicC+LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenkU-00Gruc-EX; Sun, 02 Oct 2022 01:26:30 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenkR-00GrqB-6E
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:26:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 4FBCFCE098C;
	Sun,  2 Oct 2022 01:26:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62F5DC433B5;
	Sun,  2 Oct 2022 01:26:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673983;
	bh=4oHXfV11l+JA10+Jvj388oZwJkjl0J5Q1sFgO4/Sa2o=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WeWS6RcMiMeQqV1d774MCywsY/bFDbmipPr+cdYl3L7vRJhZDyuAWTMYPtn/HSGU5
	 /CnsSV7kNPu/FEVXQ/kVuctUaDCRFRL0fO7UsPQ5lFy/JT18U9shyC+WCPXcskoRqW
	 wmAjfg77UlAS5iFk28UhR5khJi8kAhEOBsy75ItPgA2ouOU4IxjKe9AB6CV/0yGvMt
	 8cbJVymNOSHBdxh/SqmLrVPbTF1r+1FErrlpQH/2TaCF5x+u4p/lUdTML/IxAe6WfJ
	 aG+QJavO2I6bSHhTTy8kaKoAzXfRwStq05+NRvXigp85yjgO5NAFadCJRCDx2Hihl/
	 Xf5RYb2766HvQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Andreas Schwab <schwab@suse.de>
Subject: [PATCH V6 10/11] riscv: Add config of thread stack size
Date: Sat,  1 Oct 2022 21:24:50 -0400
Message-Id: <20221002012451.2351127-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182627_672567_1515E2DE 
X-CRM114-Status: GOOD (  11.57  )
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

0cac21b02ba5 ("risc v: use 16KB kernel stack on 64-bit") increase the
thread size mandatory, but some scenarios, such as D1 with a small
memory footprint, would suffer from that. After independent irq stack
support, let's give users a choice to determine their custom stack size.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Cc: Andreas Schwab <schwab@suse.de>
---
 arch/riscv/Kconfig                   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h | 12 +-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 76bde12d9f8c..602e577c429c 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -443,6 +443,16 @@ config IRQ_STACKS
 	  Add independent irq & softirq stacks for percpu to prevent kernel stack
 	  overflows. We may save some memory footprint by disabling IRQ_STACKS.
 
+config THREAD_SIZE_ORDER
+	int "Kernel stack size (in power-of-two numbers of page size)" if VMAP_STACK && EXPERT
+	range 0 4
+	default 1 if 32BIT && !KASAN
+	default 3 if 64BIT && KASAN
+	default 2
+	help
+	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
+	  affects irq stack size, which is equal to thread stack size.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 043da8ccc7e6..c970d41dc4c6 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -11,18 +11,8 @@
 #include <asm/page.h>
 #include <linux/const.h>
 
-#ifdef CONFIG_KASAN
-#define KASAN_STACK_ORDER 1
-#else
-#define KASAN_STACK_ORDER 0
-#endif
-
 /* thread information allocation */
-#ifdef CONFIG_64BIT
-#define THREAD_SIZE_ORDER	(2 + KASAN_STACK_ORDER)
-#else
-#define THREAD_SIZE_ORDER	(1 + KASAN_STACK_ORDER)
-#endif
+#define THREAD_SIZE_ORDER	CONFIG_THREAD_SIZE_ORDER
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
 /*
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
