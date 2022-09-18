Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 173D6C32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f4x5RlQjIDCU1bRt7WYauOgKXSQmZ+6eJTvnWBCW0aE=; b=A9vx6bKWgLDTzo
	J4c0L/T+nevIkaFTVtg0m4NDnoTBao8Ao4kqJrobjEC/GaHVoeAX97+pl5o8Q8ADM3tnEK08gIWuV
	AO6DbMFAqC8lJ+icsIHt5sqQAr8mvbNpWf/Zqfx+VxmZfWEHXl3s5Z6WyJ8fydgjw4uILbZZhQBE9
	Zu16iDwz9Uh8UasdXNzxC95lcErLWH9+o/hUs1S7MV0N6b4wrRBHs5wk0RASp55BAeSfhU1SGxrzH
	U73RipYPw724C2pfdUULaTPK2rnzBZI7OgiXPDFWqohW2x+csRwd4Wla90rofqFnlZmh3hZIt3EtE
	qYhMrvmosEPF5P7a+U2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwcB-000GcI-VB; Sun, 18 Sep 2022 15:53:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwc9-000GZJ-CL
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E5DA9615DC;
	Sun, 18 Sep 2022 15:53:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD1BC43145;
	Sun, 18 Sep 2022 15:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516428;
	bh=Ok5Yj5MczHHCWRKuLHE5cnfQ4mU9TPAWVYBKctkiI58=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OVZ2ZM7JdqAB04FF3oU8sITo6XBs8ZTTQDkaobWHmibrpzdi+w5WNV1YfoM+CtLxz
	 +N8v6dKjsLr4crC3JfskA1D69p+gQf8vx1he3tinSD2K9UZwUnXNnvTsIfvdWqfU7H
	 sQWiGPQmP9uJIHrIw0snu/9U4hDRwokgYRaIJzYL6/+ne37GAUSQguRji89NG00TBN
	 YfJWgi4lzeK6w0+kqZbMMBXPqb4oZRMQkz/HDqGdyt2qPevAilXGgC7+WauqSmcaZi
	 7JZOaeF+IBC+PGr++DrbD1+YmLf8WDux3zSljoZiiI46aXDPBjHvsdQugCqMjsVEhS
	 BlLAatIJ0KOrQ==
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
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Andreas Schwab <schwab@suse.de>
Subject: [PATCH V5 10/11] riscv: Add config of thread stack size
Date: Sun, 18 Sep 2022 11:52:45 -0400
Message-Id: <20220918155246.1203293-11-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085349_587016_5AA87B31 
X-CRM114-Status: GOOD (  11.74  )
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
 arch/riscv/Kconfig                   | 18 ++++++++++++++++++
 arch/riscv/include/asm/thread_info.h | 12 +-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index dfe600f3526c..8241b12399d7 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -442,6 +442,24 @@ config IRQ_STACKS
 	  Add independent irq & softirq stacks for percpu to prevent kernel stack
 	  overflows. We may save some memory footprint by disabling IRQ_STACKS.
 
+config THREAD_SIZE
+	int "Kernel stack size (in bytes)" if EXPERT
+	range 4096 65536
+	default 8192 if 32BIT && !KASAN
+	default 32768 if 64BIT && KASAN
+	default 16384
+	help
+	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
+	  affects irq stack size, which is equal to thread stack size.
+
+config THREAD_SIZE_ORDER
+	int
+	default 0 if THREAD_SIZE = 4096
+	default 1 if THREAD_SIZE <= 8192
+	default 2 if THREAD_SIZE <= 16384
+	default 3 if THREAD_SIZE <= 32768
+	default 4
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
