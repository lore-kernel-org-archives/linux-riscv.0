Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDAE0ECAAD3
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Sep 2022 02:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGVALJESfitu2NNGjj+Ycyh5mAdwDoGvlL8XPdOIFSY=; b=f00Ff2cvFzMm1y
	JKDYSQRSMja2iPIjeIv8bMXAXl0sUJI8Uo74OsmY0UDGOunmElfyYywoMd2//pFPIDTU/z2sAh3Og
	0zEZuACUQWD60Mb/N8yy+gHnl1g5nzxAv0fGanyt9qp0mOqlSBbLBH+zq8PUiL+8JheAXo+3hFrfQ
	Prq8vd2wIpeZyMdYZmxthTScGYAr4wVFNNIZGm9BHn6P8g/wvISMBcu+C2zMtY4CoI6kNuRBZOJZ+
	hqNQd1ndG2w0PmH9U4MGckuahQbxqmaovQeeJCLUXTv12fQMxHX8O7YsNFlN4pg1UDsL8QeMIdsPe
	VM8FIEuD/YFxEFQQG7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7FF-00Eg4k-NX; Thu, 08 Sep 2022 02:26:21 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oW7FC-00EfrM-9F
	for linux-riscv@lists.infradead.org; Thu, 08 Sep 2022 02:26:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sin.source.kernel.org (Postfix) with ESMTPS id 49C53CE1DED;
	Thu,  8 Sep 2022 02:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B97AC43144;
	Thu,  8 Sep 2022 02:26:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662603972;
	bh=8Tzw/Kwo451JDguurnRXBTqnhiIZf0WJITLDKeAtvFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XhT5s8kvvDpsphLtgApzIPqE6hBrZBriJ0zJqSucoJnY0Pt/75Yok5HTf+XYLeCC+
	 9znWL8KN+HTg9fXQnGa6NeR54fe2S/dvSQKDBTBbUojmwCl/qdiWA4NLmWBoHC+l1d
	 xIECepF0v2tRBdCsTVBJ+zOiJ8j6CpcGFim3KB9eDySw9v2fsbh7uZPfQ8Yzxx/YAI
	 NbEZoy6X7HiTNN/UUnmZA4Qli0tJRjfFRT5Mn726MQr+namWq7H9O1s0gv5VsSDWTM
	 wtBKS+/PPAElgHvPmSF+vxJyrfjzWqQ1R9GI1i6n41Ghtg+LYJGBz5UGxr1M7zU9GR
	 4LLdtUOlRhElA==
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
	bigeasy@linutronix.de
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Andreas Schwab <schwab@suse.de>
Subject: [PATCH V4 8/8] riscv: Add config of thread stack size
Date: Wed,  7 Sep 2022 22:25:06 -0400
Message-Id: <20220908022506.1275799-9-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220908022506.1275799-1-guoren@kernel.org>
References: <20220908022506.1275799-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220907_192618_504607_CC21892B 
X-CRM114-Status: GOOD (  12.88  )
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
 arch/riscv/Kconfig                   | 9 +++++++++
 arch/riscv/include/asm/thread_info.h | 4 ++--
 2 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index da548ed7d107..e436b5793ab6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -442,6 +442,15 @@ config IRQ_STACKS
 	  Add independent irq & softirq stacks for percpu to prevent kernel stack
 	  overflows. We may save some memory footprint by disabling IRQ_STACKS.
 
+config THREAD_SIZE_ORDER
+	int "Pages of thread stack size (as a power of 2)"
+	range 1 4
+	default "1" if 32BIT
+	default "2" if 64BIT
+	help
+	  Specify the Pages of thread stack size (from 8KB to 64KB), which also
+	  affects irq stack size, which is equal to thread stack size.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 043da8ccc7e6..c64d995df6e1 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -19,9 +19,9 @@
 
 /* thread information allocation */
 #ifdef CONFIG_64BIT
-#define THREAD_SIZE_ORDER	(2 + KASAN_STACK_ORDER)
+#define THREAD_SIZE_ORDER	(CONFIG_THREAD_SIZE_ORDER + KASAN_STACK_ORDER)
 #else
-#define THREAD_SIZE_ORDER	(1 + KASAN_STACK_ORDER)
+#define THREAD_SIZE_ORDER	(CONFIG_THREAD_SIZE_ORDER + KASAN_STACK_ORDER)
 #endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
