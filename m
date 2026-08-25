Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC111C5DF94
	for <linux-riscv@archiver.kernel.org>; Tue, 25 Aug 2026 07:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vj6KppmsbgtGW47Z7k/6k/lV1yQkXzPhVOeXwwF+x4c=; b=NnUMSAUwEyjIXq
	wPcNFdil1NRLGKbKOrrCJ8+bDrep/0NUiaCJX/4898CRHwsT6hrtWlqDzc6+A7CrZP8K1JZyaCD21
	hnpFezbMkRtD98EQI2S14mwy1U+7LLvCpNV0oKlXOjbZeVm5a++F8k7F0CoYMIo5j4twV4efPMSXF
	SGnXaxUiiS2KTvD6WOyecVT5atruvW6kQhGwXpcQ8Qn9pjBuh64jW3pE17ObIRG1N/KB8HyscNfSr
	nc3+Q0f3c/kDoWYjBEW6he5SQRydeHUdAO+Ou+ARPfVENd77ldcvmlkSQI1wGrInnljD5iGVyuQyj
	5ehZIOPcCdAgJfurXYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylf8-00000000IJW-1PR9;
	Tue, 25 Aug 2026 07:33:38 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wylf4-00000000IJ5-41k4
	for linux-riscv@lists.infradead.org;
	Tue, 25 Aug 2026 07:33:37 +0000
Received: from localhost.localdomain (unknown [111.196.241.250])
	by APP-03 (Coremail) with SMTP id rQCowAAXHz1IRY1qO684Bg--.16779S2;
	Tue, 25 Aug 2026 15:33:29 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Radu Rendec <radu@rendec.net>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Lucas Zampieri <lzampier@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
Date: Tue, 25 Aug 2026 15:33:26 +0800
Message-ID: <20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowAAXHz1IRY1qO684Bg--.16779S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrykArW7ZFWktF4UuF4fGrg_yoWkWrc_ur
	yjqwsrGayFyrn3ZFySkFW7ZryrXa4DW3Z7WwsYgFs0qrn0gw48Cr1Sqr15ZayrWr129r1x
	CrWDurySkw1xCjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUb48FF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
	6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
	A2z4x0Y4vE2Ix0cI8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
	Gr1UM28EF7xvwVC2z280aVAFwI0_Cr1j6rxdM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
	Cq3wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwCY1x0262kKe7AKxVWU
	tVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14
	v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkG
	c2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI
	0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4U
	MIIF0xvEx4A2jsIEc7CjxVAFwI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7VUbGQ6JUUUU
	U==
X-Originating-IP: [111.196.241.250]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_003335_392776_E9AA1F3C 
X-CRM114-Status: UNSURE (   9.66  )
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

__plic_toggle() builds a 32-bit enable-register mask from the hardware
interrupt number. A valid interrupt whose low five bits are 31 evaluates
1 << 31, which shifts a signed int into its sign bit and is undefined
behavior.

Use BIT(), matching the equivalent mask construction in plic_irq_eoi().

Fixes: 14ff9e54dd14 ("irqchip/sifive-plic: Cache the interrupt enable state")
Assisted-by: Codex:gpt-5
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac104814..d3d4187b96ab 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,6 +108,6 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type);
 static void __plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
 	u32 __iomem *base = handler->enable_base;
-	u32 hwirq_mask = 1 << (hwirq % 32);
+	u32 hwirq_mask = BIT(hwirq % 32);
 	int group = hwirq / 32;
 	u32 value;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
