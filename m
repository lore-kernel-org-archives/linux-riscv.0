Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D4EC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 11:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fwK9v6u07AIZE1cG4yK7e0puPoCfjhhwxvY7eoYFGJM=; b=vHuF9hGWsduW9k
	O52cMHICP6lo3oOOZLJ8jcDuQLjLLO8iwH3694h058iOHzoQMe81pLk2zLWPj7uqYg2clhs6ALypA
	Zvjouz8L82tcoMcpOLnDx3OUbi2JvT2e31Pre8OKGk78xL2V6cGYExuMkVcE7PrgnFhg3SZ19Cxcm
	aQX6dAP6yyCEALQIF3z1Q0CYuVqCx0m3MF0UHFzMrw5nXRmsI2B7vw3O6NBzC2UkmMqenN4h2rL8y
	jC9AV6MrnJKebsEvVl3bwhq72CYCmYDBq4R1n+o2uJRMpgtAitQcU8A5O1yU+EFCfqpy6/qvZYmIK
	GxdaGNm1bzFvn/dA9RiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYl1-00FMLw-3C;
	Fri, 08 Dec 2023 11:10:59 +0000
Received: from bg4.exmail.qq.com ([43.155.67.158])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBYky-00FMEX-0E
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 11:10:58 +0000
X-QQ-mid: bizesmtp69t1702033819tx63b91w
Received: from localhost.localdomain ( [58.240.82.166])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 08 Dec 2023 19:10:17 +0800 (CST)
X-QQ-SSF: 01200000000000B0B000000A0000000
X-QQ-FEAT: HIVLo4mOhq54yA4OLFoMe1EM5ffJGUYpbwtVwR0aVb2Wr/FKPBIXiLzDRcTWG
	OIph7+eMji4nK3Bm9+9R2C56dYXezaz0dIipH1Gcf/bRcDAGtVQheFhchN7bubTU4OhuI5Z
	F9DyUzj+gU2wtpheFi8tSfxkzKHyEyzQpyRktOVkIwzlftynytYwscEnrCaNM0IS7pCA4WQ
	I4ct+DAQZOgxysVdVDF8TCrGF9UW6Z4brCHDydwtKfDdeNcqxbFBpRvZU9vwpo/NzqgPCV6
	u029vpL1XAKL1FUKjLY5W28Oo/7BZ1QEUayacnzx48XU3bQfGIv87wBWFNZX2sd7n3/n7om
	wLEiSEYqo9vobF70ORgvS+0j7mOUg==
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3233006858392869652
From: Song Shuai <songshuaishuai@tinylab.org>
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	takahiro.akashi@linaro.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Song Shuai <songshuaishuai@tinylab.org>
Subject: [PATCH -fixes] riscv: kexec: Avoid deadlock in kexec crash path
Date: Fri,  8 Dec 2023 19:10:15 +0800
Message-Id: <20231208111015.173237-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_031056_440912_6D57AE8F 
X-CRM114-Status: GOOD (  12.24  )
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

If the kexec crash code is called in the interrupt context, the
machine_kexec_mask_interrupts() function will trigger a deadlock while
trying to acquire the irqdesc spinlock and then deacitive irqchip.

To avoid the deadlock, this patch directly EOI the irq regardless of
the active status of irqchip.

Fixes: b17d19a5314a ("riscv: kexec: Fixup irq controller broken in kexec crash path")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
Note that:
   
1. this deadlock can reproduced via echo EXCEPTION to lkdtm INT_HW_IRQ_EN point
   
2. RISC-V HLIC and PLIC irqchips don't have the irq_set_irqchip_state handler
and I don't know is it ok to deactive irqchip without the spinlock in this
code context, so I simply removed that snippet as arm and powerpc do.

I would like to listen to your advice.
---
 arch/riscv/kernel/machine_kexec.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index f6c7135b00d7..d7ddf4d2b243 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -149,20 +149,12 @@ static void machine_kexec_mask_interrupts(void)
 
 	for_each_irq_desc(i, desc) {
 		struct irq_chip *chip;
-		int ret;
 
 		chip = irq_desc_get_chip(desc);
 		if (!chip)
 			continue;
 
-		/*
-		 * First try to remove the active state. If this
-		 * fails, try to EOI the interrupt.
-		 */
-		ret = irq_set_irqchip_state(i, IRQCHIP_STATE_ACTIVE, false);
-
-		if (ret && irqd_irq_inprogress(&desc->irq_data) &&
-		    chip->irq_eoi)
+		if (chip->irq_eoi && irqd_irq_inprogress(&desc->irq_data))
 			chip->irq_eoi(&desc->irq_data);
 
 		if (chip->irq_mask)
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
