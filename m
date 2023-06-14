Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DB97EB64D7
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 01:30:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=h9PGPOBbRhX/2PykVgjhIWQveFNNSk1SHKrbKu2Ee5Q=; b=n69AofYlKfyh92
	w5ZVThtKEHwPEIJYjK8IZjLxsXLEgmbThJ9tYdr51AYFs+MOE5NizxAmDnM78mwS/p2SWeSO/SFUY
	IfsHYjI7C4TdAzhntAyjY/OZkP5H5NRqe9KfPl++Bc4j5X9LpakmcVxurWGqg7WQSZB7B5drNHXKF
	kNvU+drtuv4re+MzKw3I78fAd9gaJc0A6ADxjGpwGuQflWoXEREMlRmdkaJfa3iqKaQOO8adhTSe0
	QfG0s0MUWHfg0+2Zae6F4hHkQbX/p7XUjkePnljpaGW2ywvA1Y7xjTFRcsFF/42TLKfcGEXYTjI4p
	ankxveF9+LUWgPAryUZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FLM-009d8L-2l;
	Wed, 14 Jun 2023 01:30:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9FLH-009d6P-0h
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 01:30:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B4C4A6130D;
	Wed, 14 Jun 2023 01:30:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C855C433CC;
	Wed, 14 Jun 2023 01:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686706234;
	bh=qsjRxtxZYf2OUYpf9/BMTkMpzMYIpbCMO3E2fwLXlKI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UZXQlRD/QfHOQjSClgU9X1RRPI3A8OzbdviJ5/Z+3PONCuyh0R2LRMdCgOZzjO8vD
	 OxzFI4PFDIfGvxIKSWQ8/3JIKD08Lr7S5FEaFWAuxre5I+cBxKhjslIAXNu/A0AzuO
	 urgNX6dHtj89ouVC5T+hSvjw7+H34cHza8T2mTQmrP/CzXRRJtOZ6v2mKRnowwhuXT
	 3zAClr6i/4hOWpF4nBht7oJpHrY57kHYDXRQWl93ZEiztO8TXgLiRUDmq5jeHCa6Nb
	 t9W8rn6fa1SsAZBAjzEemGqUsx5wfbu1cPWUGpBT5das0EdtK28eQK2jKOHpLjaSj9
	 gHSMHt+kB75FQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org,
	cleger@rivosinc.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V13 3/3] riscv: stack: Add config of thread stack size
Date: Tue, 13 Jun 2023 21:30:18 -0400
Message-Id: <20230614013018.2168426-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230614013018.2168426-1-guoren@kernel.org>
References: <20230614013018.2168426-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_183035_317662_DEA326CD 
X-CRM114-Status: GOOD (  11.33  )
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
index f515cb101c19..0599bba13654 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -599,6 +599,16 @@ config IRQ_STACKS
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
index 2f32875276b0..1833beb00489 100644
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
