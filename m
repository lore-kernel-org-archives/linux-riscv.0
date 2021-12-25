Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1679C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:56:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Zlm06MSu6tpQ3TRV5UoWUL0LzrUkqLwhaOMGjOIqlXA=; b=iQv2qs0IVbc5l+
	1aFMwd6TAmfVxkl3wAyfjFYonxkhOBn9XNdYweS1ojl5IwVq50ukRlMUq9he21BhQmjEe4Iu99G5/
	Qjio7jXQ3eLIK0HctrqVYup26VTZNhL3/8tBEcbklvhd7PbLxaGRJauDS+qb8xnH1jWSxXChDyZiu
	gWI43tI8rb4Srow2Ikl1Iykhb9p7dvlJ4L/fI5sLQF8+cMh0V1ESX8Q7HCi48p8YCnZfGFFfcDfjo
	/w/whDv8Y60M2P7ln3fVSIzlcx4H4kBEyuaMPKqHZ6P6fKwY830o3bNu57U7pETLmmgVgzkFRBK1b
	CVEj88XiP+7cgDtNjh6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z6u-00EdtF-CA; Sat, 25 Dec 2021 04:56:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z5Q-00Ed8R-GU; Sat, 25 Dec 2021 04:55:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id DA182609ED;
 Sat, 25 Dec 2021 04:55:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FA59C36AEB;
 Sat, 25 Dec 2021 04:55:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408115;
 bh=Vgmo1LqXxeFPU307tJ+7Re0rBb1tuTZKi6eTay9/CKU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NGo1wO9sdj36PtKdUBWAd4trmVUnxha/FyZol7/QzhaUNMSCcZPWtP1yzEDVCVevC
 N/1lhUzpzRgy1RedS5iCmuo/qe7MvDbNGKtlnLus6afduc7J3PO0fc9nxb3pR5e7yL
 IRbuDbkv3R31z3pvzowLV+6m5C0eQMZATPm7Par3LwNY8b6wrQxbgChfLgZzn9IjaV
 +yR/9siwjeIC03/NYJEMz84Ux+XWjQy0MI5cWaHU+OsaLi9Moo9aQnRstbIm2paFDt
 7cS7j9WXttR2b8B6kFj5CWM5yP6T1qLArpJFEKTDJP7ARxvU4C+okImQqAt0q6reZ0
 G5nebMiv9M3bw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 5/8] sched: s390: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:27 +0800
Message-Id: <20211225045430.2868608-6-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205517_051748_A9D2BDD1 
X-CRM114-Status: UNSURE (   9.90  )
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
