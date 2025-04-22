Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E631C369C2
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Apr 2025 12:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=awEUOGXFAR00alfg8DXB1kL9UkH6ngDfXwXs1JfHvOQ=; b=jOzD9bP3ie6SVg
	pvHlwqueOojABIH3jmdSJ5eFKqHxETwlhqYK4Tw6MeKTC7QHjskJOFCCnWcZ7zkpmQ1RcHG9IVlHe
	8BmnqJcaZboBYay4sWjp+10C4j96Vro1s2e0Z/VRktQO8juJ+bQbSoR39yilOydNzsq1szFKOt+gP
	Qv77ZG/ABtHPvSYBPy4gcDyKv12T48PhXIKQPjIdoHsRArbHIjoRI2i1gjga01SUqP5oB06kvYUX9
	/kfv8ea9DcvtVFMfNYfZx17P2pWEpkHuomv+2y+yE1NNdO38/3Tj3pZiIMcg7TOsYb9hunwSnbGS4
	OW4ImEeENwUJY50pRV2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7CQU-000000073dN-1NH6;
	Tue, 22 Apr 2025 12:08:34 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrH-00000006x1d-0qqk
	for linux-riscv@bombadil.infradead.org;
	Tue, 22 Apr 2025 11:32:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=1aVLhg6SUUMQ+KxN47EugMlsgU2YDd5IIPm2q/yFu0E=; b=aS67vgpMAoatYL4VNe4v2/Nc7c
	adYygMlHYM7SFgJ1xWeLkAd7448rTW01E7xVtrvH2GK1kC+naqemtqFK34C8jZLYW/0qnuUGcc/xl
	hnNqJ2x6vsAS0q2D8FUMIWlicXkYjoScrBedPL6asiVsu4uavBGP+EauK964qVCjTRbg4ULntoi/j
	FYvJ8Ku9onyj/Scwm3IDRzWR+I+63bEYIibhoC+ypJyTaY3sHuxS1zMBFzVKB56NQmPtEgBMVICJI
	QVxvb005Ad7TqcIJTGZMH5HL4575SanOT0+qrPs8gNEXCjjr1Upjt294L8y6pDVugTEnCmEnmwb4R
	A8rQpyOw==;
Received: from mail.loongson.cn ([114.242.206.163])
	by casper.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7BrC-00000004TRP-1LGg
	for linux-riscv@lists.infradead.org;
	Tue, 22 Apr 2025 11:32:09 +0000
Received: from loongson.cn (unknown [113.200.148.30])
	by gateway (Coremail) with SMTP id _____8CxvOIufgdoa__DAA--.64176S3;
	Tue, 22 Apr 2025 19:31:58 +0800 (CST)
Received: from linux.localdomain (unknown [113.200.148.30])
	by front1 (Coremail) with SMTP id qMiowMDxu8QtfgdoPuSPAA--.28937S2;
	Tue, 22 Apr 2025 19:31:58 +0800 (CST)
From: Tiezhu Yang <yangtiezhu@loongson.cn>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Huacai Chen <chenhuacai@loongson.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Make regs_irqs_disabled() more clear
Date: Tue, 22 Apr 2025 19:31:56 +0800
Message-ID: <20250422113156.25742-1-yangtiezhu@loongson.cn>
X-Mailer: git-send-email 2.42.0
MIME-Version: 1.0
X-CM-TRANSID: qMiowMDxu8QtfgdoPuSPAA--.28937S2
X-CM-SenderInfo: p1dqw3xlh2x3gn0dqz5rrqw2lrqou0/
X-Coremail-Antispam: 1Uk129KBj9xXoWrtw17Xw45GF1ruFWDZFWDtrc_yoWfGwc_ua
	1xXa1furyfZrs3u3W5Ww1rJryUK3y0ga97Xr48tr9rA3sIgr45J3y8trnxZF4j93Z8ZFW8
	uas7JrWIkry7GosvyTuYvTs0mTUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvT
	s0mT0YCTnIWjqI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUI
	cSsGvfJTRUUUb78YFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1xkIjI8I6I8E6xAIw20EY4v20x
	vaj40_Wr0E3s1l1IIY67AEw4v_Jr0_Jr4l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxS
	w2x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxV
	W8JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0
	oVCq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AIYIkI8VC2zVCFFI0UMc02F4
	0EFcxC0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_
	Gr0_Cr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI4
	8JMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xv
	wVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUAVWUtwCIc40Y0x0EwIxGrwCI42IY6xIIjx
	v20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20E
	Y4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Gr0_Cr1lIxAIcVC2z280aVCY1x0267
	AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IU82-e7UUUUU==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_123206_876388_79017FA8 
X-CRM114-Status: UNSURE (   7.10  )
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

The return value of regs_irqs_disabled() is true or false, so change
its type to reflect that and also make it always inline.

Suggested-by: Huacai Chen <chenhuacai@loongson.cn>
Signed-off-by: Tiezhu Yang <yangtiezhu@loongson.cn>
---
 arch/riscv/include/asm/ptrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/ptrace.h b/arch/riscv/include/asm/ptrace.h
index 2910231977cb..a7dc0e330757 100644
--- a/arch/riscv/include/asm/ptrace.h
+++ b/arch/riscv/include/asm/ptrace.h
@@ -175,7 +175,7 @@ static inline unsigned long regs_get_kernel_argument(struct pt_regs *regs,
 	return 0;
 }
 
-static inline int regs_irqs_disabled(struct pt_regs *regs)
+static __always_inline bool regs_irqs_disabled(struct pt_regs *regs)
 {
 	return !(regs->status & SR_PIE);
 }
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
