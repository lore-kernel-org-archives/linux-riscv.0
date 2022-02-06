Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72D18C433EF
	for <linux-riscv@archiver.kernel.org>; Sun,  6 Feb 2022 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Qs/Lg3OhFcuVJCqcXouz4NCkCQr7EDWfHIlLxHCwAYk=; b=e6UG140f4eNdPo
	5OsMKKc/0oJu+78jqU9R/GwJl71nU2M3MUBUQiIHsutBL+4V8CEfQS3CMniRVw89MFeelmaqr0All
	LebsXjs8TbtLnB3b1Z5otYF+XDqpDLuC0CyUh3Z4yIazREkVagcKl6IKKfIRMosGvE1p+yIeKsU7k
	o+3HDdksVWQbyV364Yr1IydsddAK51Ro7xQOf0aXazsxNPBitszKLHQgSmUlSLtDje1FyWgE2oNLS
	j9E5YhfXFTbPKX2T5W9nMyAs1VV/HDCDIp6tw8smYqPIvtBiIgqgFYOWafVpaNbPDNjXT+pXsQzW1
	iNKiV7aF+g8yvphobaOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nGlhT-008V2A-O3; Sun, 06 Feb 2022 17:51:47 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nGlhQ-008V1R-Nn
 for linux-riscv@lists.infradead.org; Sun, 06 Feb 2022 17:51:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 0D78AB80E2F;
 Sun,  6 Feb 2022 17:51:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4E8EC340E9;
 Sun,  6 Feb 2022 17:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644169901;
 bh=PgP3XA+R87hLDRANpjuRku4aVM76Q9vxTvvDIf8+XYU=;
 h=From:To:Cc:Subject:Date:From;
 b=MvdOGZ/muD3iuxKGNPy5RTPuuwrBO1mMdpCUkVaEYwiLfAFhHGcQD69qu4WCWSpgR
 cgWyLcZObA1dIVF41cqV8UOV1m4j/d+PzaV68pqMSFbLqbJZtpp1UQPpjHTdt7oupt
 pP96cn6nV93W/UX84tMlFLntO75wBzWXNrTumm4GOtsZiMo/AH6NLU2qfZAxhkoIAF
 w8e7YfpRC5H0nCj5F2C4Bb+QZmnXhgZl5hFebuKax+FJHqPrBDI6kMPryVpc2z2IKq
 Y2T/L1ikQBCvpFRSpP2j9vE2LVLLbpfEmcTtVpkQZY8fLvZl+jJzud6cafnpZYfEkf
 WltLtSivvaxMw==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH] riscv: reduce THREAD_SIZE from 16KB to 8KB for RV64
Date: Mon,  7 Feb 2022 01:43:59 +0800
Message-Id: <20220206174359.2986-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220206_095144_934615_6A2D586C 
X-CRM114-Status: UNSURE (   8.28  )
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

After irq stack is supported, it's possible to use small THREAD_SIZE.
In fact, I tested this patch on a Lichee RV board, looks good so far.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/thread_info.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
index 67387a8bcb34..fdbf3890a1ab 100644
--- a/arch/riscv/include/asm/thread_info.h
+++ b/arch/riscv/include/asm/thread_info.h
@@ -12,11 +12,7 @@
 #include <linux/const.h>
 
 /* thread information allocation */
-#ifdef CONFIG_64BIT
-#define THREAD_SIZE_ORDER	(2)
-#else
 #define THREAD_SIZE_ORDER	(1)
-#endif
 #define THREAD_SIZE		(PAGE_SIZE << THREAD_SIZE_ORDER)
 
 #define IRQ_STACK_SIZE		THREAD_SIZE
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
