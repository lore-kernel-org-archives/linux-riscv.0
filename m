Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6593AC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Yhbo4oQvUlluosbc7gtu61ZVP3OAmyFRcBCnKw0datc=; b=4zuYU0aPqPrPnF
	T08t/piM3zpL/B+0OvAZcqQel6OdiC9h+E2FFUcpmaUAuLtu4LzcxqbgYgJ/zSyGBWhH9jF9CobL7
	2WCu5c4NmeXOiWgiOt2URMNLsCx1Ea5UHBPwtVMaWBbD6knGkJvGJwNTMnevSo5hOqsrfkxjG+BH3
	KZjjoeC8AUKz51Hww4Gy2CRJg6KExiiKsc+H+TNxNXlgMD3SG/2/8HaynAgy7SG6al8dQ0gQPMAZH
	AaAmjHwfOfIGHryYWmz+uSTVj7Q0uae8cxPB6ioz8IMcctgvEH2tovojn0onFG2tcZSLZG3JVmwSD
	bIp+7cJEZPccJKHy2hkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26Jx-000IXD-CX; Tue, 28 Dec 2021 06:50:53 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26HX-000H12-R0; Tue, 28 Dec 2021 06:48:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6A7FFB8118C;
 Tue, 28 Dec 2021 06:48:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3888C36AEF;
 Tue, 28 Dec 2021 06:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674101;
 bh=RnnvsP16LZkGVq1CvZskQLpA80ExePCT6xw8+7fx9qY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GAoVXZipFGCxV1/J8x20sPoRBFPkXgmVnkV+HOz0yZ+hszEzck+jTLQEyaBFDCAsF
 nhMW0srHzh6avykgI4hf3qL5eiO4uDlOsbuqZg+HqHxfp8khIORLxXGxg98FyIxiTL
 DYxPUdH6IgrxsUCbNjk+3FJWr/RI/ES0Rz9P8rFrdqK5k/PY6qdYie8FS4RJoBapSC
 +6L1eggOmbr++OMwy/asnM9nZM3XYYaDkTgDKf7/XDx37sb4TCkhRGxpnW1CVwSvVg
 AcXr1nE30xxR1dgZHUkMxlCtpoUIkNYKdj92p0BYsagzDQxhH8JH49QwvsN4yQduF2
 sJm6UEP/sM7Sw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 7/8] sched: arm64: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:28 +0800
Message-Id: <20211228064730.2882351-8-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224824_040567_9DA515A5 
X-CRM114-Status: UNSURE (   8.49  )
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
Signed-off-by: Guo Ren <guoren@kernel.org>
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
