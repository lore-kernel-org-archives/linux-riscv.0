Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73370C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:49:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gUIQRQMUwtj3Y78kQ56C0o+6xtNR6BQl3gqRDAmv3dM=; b=YwkgRAZ3Bv6vlm
	5OfCuDsmnG60KelYDC/IJ19DtAuxjExEMZJL1aHmq3ZaAF6cxmF6OHhYT+Lj0Ws2aQFdJMiCPSuCz
	RSOoRiZs//KPa1ckb73rShAklQdGmocy21xXBHhLHvbCbKieQdNbKfuKaaNqUsF/uOcfo5OA+JKu1
	i3wju0jKbss8Dz6eyasVHbw9I7vucAqcJl05iSrAFVqXhifRbx+/u0Zn0FRK75wUYMJmR1TUcb4Oj
	cCTlDv5vndmcZgGr2wQQVoMQqEfSQP43RKbS6oGW7iGwVA6qZRj3f3c9XJ08XmmyFyAtlSQs57Thk
	312RiYoYtnyL7EViCehg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26Ij-000HlR-Dm; Tue, 28 Dec 2021 06:49:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26HK-000Gu6-EF; Tue, 28 Dec 2021 06:48:11 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id F1D4B6117A;
 Tue, 28 Dec 2021 06:48:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E30EC36AE7;
 Tue, 28 Dec 2021 06:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674089;
 bh=+GnMS/OPoYG7iR/KsEwNlbZjf29CM2NqgjFZvoobNBE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=iZJdIjCPIfEdOY3H6eDHZ64LATvocPbarXuzVAnDl8T0QYyhPYUknYTdU5yEB/5wH
 NyafdEETUQ4Nar9C/HYFZYzLmZ7Y2JRLXOmmp3iDp/rOOSOXK9P5Z4+qFAe4Lgxno6
 IJ1EdExYBCP61Trn/pi6UNaWiAA1P08h9oz/t0z/fIKGVn77QO1smVyMJQGR2uW+Gg
 ipF0UHM0iDJvkfyPFL06LFlHdDtFwbmQOzxsY/hnE+yJPAsTgJyjvh2zZpnHXNxol5
 QSWBr4hM3EeOGMJCIwVGxLMiMISxsH4Q+FRA6S5egJHIjQGy3+7nNGcWA+t9P5Gu5N
 gU1XAx3pRx2kA==
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
Subject: [PATCH V3 5/8] sched: s390: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:26 +0800
Message-Id: <20211228064730.2882351-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224810_549011_BBF826E2 
X-CRM114-Status: GOOD (  10.06  )
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
 arch/s390/include/asm/processor.h | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/s390/include/asm/processor.h b/arch/s390/include/asm/processor.h
index f54c152bf2bf..5581b64a4236 100644
--- a/arch/s390/include/asm/processor.h
+++ b/arch/s390/include/asm/processor.h
@@ -88,11 +88,10 @@ extern void __bpon(void);
  * User space process size: 2GB for 31 bit, 4TB or 8PT for 64 bit.
  */
 
-#define TASK_SIZE_OF(tsk)	(test_tsk_thread_flag(tsk, TIF_31BIT) ? \
+#define TASK_SIZE		(test_thread_flag(TIF_31BIT) ? \
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
