Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55F54C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BcizJeLm61QKYkxkN+fPznl7F1lFwGosKMocd5RkLG4=; b=QVm1U6p6uwIgTj
	TiApntKCjGPwLs/mlzauOr0VLkwux2PblJTgGcUKKNbhYspPIFca6q0Wd3ohbSlf3mKIUCJNEAeUo
	yMsBTyL0vTzqEQjoAhOkAJ6fndP2Qwa5onJY7nUgPS7Kl9/oG62gX0mRyUsADS+iQu0RUgeLEokKH
	nNkC0NWwg6Xukb4wbbh3ASzZYdnlM0PNvRwrarfC57GkHF+tXQJTjTIVN4WjBIDpd6ABQ23n3lHBj
	bjK/I4clzsgIUINS4yAzkGfT13hDK10sh5Tr7YimeMb0+yFzOt3Q8Hy70lvP38+LDWfuX/sR3b9ku
	qNIgzO6DmxCV9moYalLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mzidY-007iek-4O; Tue, 21 Dec 2021 17:09:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziW4-007f2k-Mg; Tue, 21 Dec 2021 17:01:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 6241AB817A9;
 Tue, 21 Dec 2021 17:01:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12666C36AEA;
 Tue, 21 Dec 2021 17:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106090;
 bh=21+K8fAisVvzD89O507BazhTiVK3e2SzmbL55P10Iuk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y1OS/PO+yvJI/bKgEMBVmfoC8xvxNIheoQmJpV42TA5ec+u8S5T/x1fdLb0hsigyD
 KBD8N9nQjxYvk95eA9zbLUMFvqbRNJSKX3ew9qlmxEhJY5JfVWKFtr4N1+uG3NKMaM
 JAX2pbFs3tg0Megdetl7llVWiT/imMIoJdsGjFdfamzdZlkGnd6+wvQOCJYiIDmHlp
 8pcfZjJF1rR4SiObVwlzCFr/aBo/ROB6IyYczCzMIVpc1OGOXbArI/X9ZDXc7x3fWi
 A0CAjJNtSjjBfDxaomCqyqkAXNHx/wU/OouL8BQZmX6ACLPQrCacoqCsKvhvOjHKEC
 2K1suEEmaHOZg==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 5/8] sched: s390: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:54 +0800
Message-Id: <20211221170057.2637763-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090132_933756_59EC808E 
X-CRM114-Status: GOOD (  10.29  )
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
---
 arch/s390/include/asm/processor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
index f54c152bf2bf..605bc57a5ffc 100644
--- a/arch/s390/include/asm/processor.h
+++ b/arch/s390/include/asm/processor.h
@@ -88,11 +88,10 @@ extern void __bpon(void);
  * User space process size: 2GB for 31 bit, 4TB or 8PT for 64 bit.
  */
 
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_31BIT) ? \
+#define TASK_SIZE		(test_tsk_thread_flag(current, TIF_31BIT) ? \
 					_REGION3_SIZE : TASK_SIZE_MAX)
 #define TASK_UNMAPPED_BASE	(test_thread_flag(TIF_31BIT) ? \
 					(_REGION3_SIZE >> 1) : (_REGION2_SIZE >> 1))
-#define TASK_SIZE		TASK_SIZE_OF(current)
 #define TASK_SIZE_MAX		(-PAGE_SIZE)
 
 #define STACK_TOP		(test_thread_flag(TIF_31BIT) ? \
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
