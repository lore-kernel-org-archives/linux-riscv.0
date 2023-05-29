Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFFA1C7EE29
	for <linux-riscv@archiver.kernel.org>; Mon, 29 May 2023 08:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ocniQQ6pxc3ZT0gC8vctbqKxiTFWR0H4squIXC0gdSw=; b=iiakiD3OLSc67H
	tU/ogJKjKzyPf6JkzuVTiZ6z9MzGyx/giRboWpE2aaOrkpYWTs/CoIUBL7kghCCMvwzPG9kepu1YP
	2lQPaAdUYc3OJuSR3uNHAdunUFh6jHvSAQTvEt66aQ3Ncxv/Dgis00u3Y+XnnZwtxllDXfRj1FW19
	udR/Q20eXRNMTC2oOlYy4LMxWHz7oa5bzjKCISU/cECDyCfuhQjxCeBltKpks19WeUZBnEHv/dtS3
	eU1DwyoiEZVCIYanUxr4pAtl97LCaXcMF9rGOoZLxznJaqA3gckAknE26okdZjMvsh9oW9tinbWxV
	EwTiU+pIEc0Ntb4dLiSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWY-009kzb-00;
	Mon, 29 May 2023 08:46:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q3YWV-009kxd-0L
	for linux-riscv@lists.infradead.org;
	Mon, 29 May 2023 08:46:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ACB46622AF;
	Mon, 29 May 2023 08:46:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 25966C433D2;
	Mon, 29 May 2023 08:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685349998;
	bh=pWzn7wo88vvYCHCgitlDzyBp4bmFmsyhuqUhKxMt8uc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=go44EOeN3HCIMumIdRYVxxfdiB8ceIrb1h2GOkJGsvb0XgdX9T8j52X+WA4MaSTGk
	 KCUxijiy+h9l8kehiVFSui4vuFOS581B1I2Rsp8nmclq2iIlsXTPFAha1hZNpn0E40
	 jSxE3HMZMwQP/iEX9/UDvirq+GHhaaRQ3ZeV1bsr3ZLE3THWrlcCqWozTViAh7c2kL
	 9WXWCtbPzruxihqEnH183ai0WN3av7oMCXQ3pvtZWzP6/Yvzi2Lpchw3IczTsxj8gB
	 6F+gnPgNPA+PhXzcYxM48602eZkWqyPCr6HgWKn6WAodNs/RJdQ60HSRIrrLjZwJbu
	 bMNixPzLjFo3g==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	bjorn@kernel.org,
	greentime.hu@sifive.com,
	vincent.chen@sifive.com,
	andy.chiu@sifive.com,
	paul.walmsley@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH -next V12 3/3] riscv: stack: Add config of thread stack size
Date: Mon, 29 May 2023 04:46:00 -0400
Message-Id: <20230529084600.2878130-4-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20230529084600.2878130-1-guoren@kernel.org>
References: <20230529084600.2878130-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230529_014639_185960_FDA01461 
X-CRM114-Status: GOOD (  12.43  )
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
index 9567bf5fd5ed..e82be82882fd 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -597,6 +597,16 @@ config IRQ_STACKS
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
