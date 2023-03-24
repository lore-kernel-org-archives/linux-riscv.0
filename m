Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7AAC6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 07:14:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ASlUqEAV1F94xplU3SCGcEj0j0x8oejhbDrGJ+ov8A4=; b=vsjELv/OosPSFL
	SA9wew6Nk7llgaQOu0nabn9uWSMpMVT05Az2kNpUiUpbF57h80SRBjnE82PpMaxxQswq6SH5kMnr2
	XZ9q7gtVVYP4ht7AKRUa2zTz0dQj4/Spv3uTipl6QJqFaCXIq81SWC7kJkgKFudUbrMwPVItROV+Q
	Q+yXj8mPmcR/hddosRgjcNxVpdErH7vtq1Xu6w5u+5eYOBDFwJu3OJGw2uygV1USRyhnQy+JiJFMk
	wgwsShuZNTP9Rn3QeOvCj8P6RtcM0TwudNoD+1BoMmwvlczTmGQENKshnbfF0ZDpiYCva5GxQo1vK
	UZj29TUzMsOEooL3hToA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbdT-003k0J-0A;
	Fri, 24 Mar 2023 07:14:51 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfbdQ-003jyP-0Z
	for linux-riscv@lists.infradead.org;
	Fri, 24 Mar 2023 07:14:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id C10E8B822B5;
	Fri, 24 Mar 2023 07:14:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 368CCC4339C;
	Fri, 24 Mar 2023 07:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679642083;
	bh=5Apt43PtNAwm2BzPLMCNMaIA3jE930gvw1frsSZwRcA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bSt7xWTQ8EDfBmF/+gfDgrXxNbsKZkHQIvgyzDiebEdRbBPRSb1kfXqq5toIXzX4j
	 kGptgJX058jI4BaeNWwWfyeES3V32qD5jH2NS7vJuzJSpzO6vxogJtaIi8WYVxb4mm
	 VkfxphQZwF9/rbxXG85b/eCA3CTomFMfh3UzG8ywV5v1R3HlMfgqn32TU9tq1OXDdr
	 G3+lDp17cBvLCYZN9q4itL2xe205klcxvA8xj9qT7FEwQE5m6cl3lLTNsitVXfo0ru
	 Rox0R2BkH1VIj3g1lgyAVWtbA5qfWD6nVC2s6IZ7UOEgPVXA5YeSXq/dY4md4iroBb
	 uSrC7JorAVjsA==
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
	mark.rutland@arm.com,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V11 3/3] riscv: stack: Add config of thread stack size
Date: Fri, 24 Mar 2023 03:12:39 -0400
Message-Id: <20230324071239.151677-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230324071239.151677-1-guoren@kernel.org>
References: <20230324071239.151677-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_001448_506909_39FD0B36 
X-CRM114-Status: GOOD (  12.21  )
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

The commit 0cac21b02ba5 ("riscv: use 16KB kernel stack on 64-bit")
increases the thread size mandatory, but some scenarios, such as D1 with
a small memory footprint, would suffer from that. After independent irq
stack support, let's give users a choice to determine their custom stack
size.

Link: https://lore.kernel.org/linux-riscv/5f6e6c39-b846-4392-b468-02202404de28@www.fastmail.com/
Suggested-by: Arnd Bergmann <arnd@arndb.de>
Tested-by: Jisheng Zhang <jszhang@kernel.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig                   | 10 ++++++++++
 arch/riscv/include/asm/thread_info.h | 12 +-----------
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7b10af7d2479..f58a8e37f1d5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -502,6 +502,16 @@ config IRQ_STACKS
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
index ab60593eed99..41556ee84290 100644
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
