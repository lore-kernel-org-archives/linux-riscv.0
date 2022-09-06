Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75B44C38145
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Sep 2022 03:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gGVALJESfitu2NNGjj+Ycyh5mAdwDoGvlL8XPdOIFSY=; b=f6b7pV0J3X+oDQ
	hg2aUa5kIoYUaHRXPdr+o+UZEYttOWoPvCW8OPTAlQKB4ZVI/u1zOcig8QvEQdtfxNtBJ0yDtTZFG
	pLwBqICsTjhnThXcyAGk32aF9KMqkuB3VyOIXubnSMgsLftt3FH0uH+s6XEeryXS2+/9zO8+1cTqx
	7iuDXdK3bU5eUF5HtnGzSqfy6VPcFpixtYctEJoCJmt8FvsfdrQUcAN2d1GizKPBPxGC4yXa1N9LX
	DHxkvjUmv/Hp6hIiVsu5tlCkK8LIMM97YPu6UA30BMY0NH+0JGvnVKFPGS8r91iKIMmWDmT3K0kAL
	i0iT0/npaq67E9Jl3nxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPgP-003ygd-Jy; Tue, 06 Sep 2022 03:55:29 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVPgL-003yOj-1S
	for linux-riscv@lists.infradead.org; Tue, 06 Sep 2022 03:55:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9EFDA61281;
	Tue,  6 Sep 2022 03:55:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2C4EC43141;
	Tue,  6 Sep 2022 03:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1662436524;
	bh=8Tzw/Kwo451JDguurnRXBTqnhiIZf0WJITLDKeAtvFQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=m8eSEaII7FXw5gkzT8e3DX9whA4K3F2vb5Ubk0R7po4+q+dLQg9FmNCZOmT+XxmmM
	 PdNGldoPuSHbrtUYVP5P8qBKdkoq+yD0YCmNofz/l1zeD9c4IeR3RPEubRmRWqmlS+
	 n7KBTAHhQqMGnxSj9SAPCr3g1ZtkPS6w7HwOGokDrJWgM8QYtp0Eg3UrnqtYjcTpWx
	 iMJq8cnzGOehiwrIATnxVyCDRVz4L/pYRjIoQ4A56WXAobQRoLEkEaK7pzt5YCOfqo
	 erbVWRpcG/pGSJHFkiIJqMG5bkDpM14IbuoZt+tRoBtQj/TqeWJRnlMtdMeVtDr6et
	 XLSCc1RVHQCzA==
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
Subject: [PATCH V3 7/7] riscv: Add config of thread stack size
Date: Mon,  5 Sep 2022 23:54:23 -0400
Message-Id: <20220906035423.634617-8-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220906035423.634617-1-guoren@kernel.org>
References: <20220906035423.634617-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220905_205525_174540_CF282FBD 
X-CRM114-Status: GOOD (  12.56  )
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
