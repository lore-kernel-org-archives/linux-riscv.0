Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D75C2BBCA
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 02:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=BZ9ezF3hhPoWgu48xfT+x3sp1TOUSJcNhYIiX+sx5uI=; b=uxYPiMSllFU0vd
	ExXLUxIJKZPuBp76P/K65udYUNOa9MTCgiLj3IxP/jffT3VqcVskf16R0p/uPH21cnKbTsX8jwtyD
	Rx7ImOf7mlhLEc7yTP9Ad0ckT12SU+J3g66cOYOezwajwisduLjUWp/Io8zDooGbQzvkp4VicN7Wk
	s6MlRPdv5dwkkfRaODBrgYfFOEIgfRxJLVtnyI47c33IgXxYzuw9Nq0fpPcjomXrqjwSvyq/vZnpB
	M1yqrehYzCkTq14CLL4H8R+QMAEal2JAQqrTSrcK1q/EjqA3OEbzByGK6cLnKcH9zpbC7lp+cZbER
	LvVh4siowkyTFjk3K/OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIUp-000000057iu-1lfE;
	Wed, 26 Jun 2024 02:34:55 +0000
Received: from smtpbg151.qq.com ([18.169.211.239])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMIUl-000000057i7-1IpQ
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 02:34:53 +0000
X-QQ-mid: bizesmtp83t1719369218t0sm7mls
X-QQ-Originating-IP: PZ/+RbjVK5tkOQsFsab5chKDrIqjTGpfpsK7wjJrAt4=
Received: from ubuntu1.. ( [221.226.144.218])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Wed, 26 Jun 2024 10:33:36 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 1355789864237892268
From: Song Shuai <songshuaishuai@tinylab.org>
To: takakura@valinux.co.jp,
	alex@ghiti.fr,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu,
	bhe@redhat.com,
	songshuaishuai@tinylab.org,
	akpm@linux-foundation.org,
	guoren@kernel.org,
	xianting.tian@linux.alibaba.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH V2 -fixes] riscv: kexec: Avoid deadlock in kexec crash path
Date: Wed, 26 Jun 2024 10:33:16 +0800
Message-Id: <20240626023316.539971-1-songshuaishuai@tinylab.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-QQ-SENDSIZE: 520
Feedback-ID: bizesmtp:tinylab.org:qybglogicsvrsz:qybglogicsvrsz4a-0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240625_193451_840780_311C7677 
X-CRM114-Status: GOOD (  10.82  )
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
trying to acquire the irqdesc spinlock and then deactivate irqchip in
irq_set_irqchip_state() function.

Unlike arm64, riscv only requires irq_eoi handler to complete EOI and
keeping irq_set_irqchip_state() will only leave this possible deadlock
without any use. So we simply remove it.

Link: https://lore.kernel.org/linux-riscv/20231208111015.173237-1-songshuaishuai@tinylab.org/
Fixes: b17d19a5314a ("riscv: kexec: Fixup irq controller broken in kexec crash path")
Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
---
Changes since V1:
https://lore.kernel.org/linux-riscv/20231208111015.173237-1-songshuaishuai@tinylab.org/
- update the commit log as @Ryo elaborated 
- rebase on Linux 6.10-rc3

---
 arch/riscv/kernel/machine_kexec.c | 10 +---------
 1 file changed, 1 insertion(+), 9 deletions(-)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index ed9cad20c039..3c830a6f7ef4 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -121,20 +121,12 @@ static void machine_kexec_mask_interrupts(void)
 
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
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
