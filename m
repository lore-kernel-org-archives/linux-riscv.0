Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F6ACD8C9F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jun 2026 12:00:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OsbRsZy+uHRU5LQL6Vdqv6PFP8CF3ET58OMoMSfW9KU=; b=Ox6R2l5EPvAS/9
	Q3x6cAb9RoTc3V3xeS89qnDZldyEmRf17GJnBdQ2Rm0ZmCH0eDOtE/6GHHQYioXI8M5ytrbd6sP3g
	1/0P/VIPMdrOzWFhklq+E4WpvH6XjGvBIjo/E2P6YU14g3usL2cgHjdHgTktUjuvb9Wd+ZJ/kHUjk
	gjSAJZ03qkL/wzwMzjK3uynosUYz/Sgg9V+vjmgL4GjCXNTki2r4d0BDfhifxfDn9IZipysUbN7/R
	14PC0NwEL0ogIFoY5H/Xbdk2W+YT4GNBCJBBicQK9R7JWzk9XVUJIEdPDytCutwBvVpb5M1t6cY7z
	KCLYyLNNsWqGucqwuILg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYe0-00000003TZ6-1mV2;
	Mon, 08 Jun 2026 11:59:52 +0000
Received: from smtp25.cstnet.cn ([159.226.251.25] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWYdv-00000003TYA-0dsq
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jun 2026 11:59:51 +0000
Received: from Ubuntu2204-XLH.hygon.cn (unknown [222.209.92.76])
	by APP-05 (Coremail) with SMTP id zQCowABnus2priZqKgm0Eg--.38680S2;
	Mon, 08 Jun 2026 19:59:37 +0800 (CST)
From: Wenhui Fan <fanwenhui@masscore.cn>
To: anup@brainfault.org,
	tglx@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: alex@ghiti.fr,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Wenhui Fan <fanwenhui@masscore.cn>
Subject: [PATCH] irqchip/riscv-imsic: Fix IPI target CPU mapping for sparse hartid topology
Date: Mon,  8 Jun 2026 19:59:35 +0800
Message-ID: <20260608115935.2194813-1-fanwenhui@masscore.cn>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowABnus2priZqKgm0Eg--.38680S2
X-Coremail-Antispam: 1UD129KBjvJXoW7Kw4kZFykZw18ZrW5WFW3Wrg_yoW8Aw1Dpr
	4rWwn29r4xZw4IqFsFqa18uFyfK3ZYyrZ8KryUtw1rXFW3AFyDZFnFkw1rua18Grs5Aa4F
	9F45ta48Ka1UZFUanT9S1TB71UUUUUDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUvl14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j
	6r4UM28EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
	0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj
	6xIIjxv20xvE14v26r106r15McIj6I8E87Iv67AKxVW8JVWxJwAm72CE4IkC6x0Yz7v_Jr
	0_Gr1lF7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7MxkF7I0En4kS14v2
	6r1q6r43MxkIecxEwVAFwVW8KwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7xkEbVWUJV
	W8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E67AF67kF
	1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCwCI42IY6x
	IIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMIIF0xvE
	x4A2jsIE14v26r4j6F4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvj
	DU0xZFpf9x0JUDb1nUUUUU=
X-Originating-IP: [222.209.92.76]
X-CM-SenderInfo: 5idq4vpqkxxq5pdv2uxruhhubq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260608_045947_568742_3897BCA1 
X-CRM114-Status: GOOD (  10.96  )
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

When the system has sparse hartid topology (e.g., only hart0 and hart8
are online), the current IMSIC driver incorrectly calculates the MSI
MMIO offset for each CPU. This causes IPIs targeting hart8 to be
misdirected to hart1.

The root cause is that in imsic_setup_state(), the MMIO offset is
calculated using the parent interrupt index 'i' rather than the actual
hartid:
    reloff = i * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;

This assumes a contiguous hartid space, which is not guaranteed in all
systems. When only hart0 and hart8 are online, the driver receives
nr_parent_irqs=2, with i=0 for hart0 and i=1 for hart8.

Using i=1 for hart8 results in using the wrong offset which is intended
for hart1, and causes the MSI configured for hart8 to incorrectly access
hart1's MSI page.

Fix this by using the actual hartid for offset calculation:
    reloff = hartid * BIT(global->guest_index_bits) * IMSIC_MMIO_PAGE_SZ;

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Signed-off-by: Wenhui Fan <fanwenhui@masscore.cn>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index e3ed874d8..5f737ec36 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -894,7 +894,7 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 
 		/* Find MMIO location of MSI page */
 		index = nr_mmios;
-		reloff = i * BIT(global->guest_index_bits) *
+		reloff = hartid * BIT(global->guest_index_bits) *
 			 IMSIC_MMIO_PAGE_SZ;
 		for (j = 0; nr_mmios; j++) {
 			if (reloff < resource_size(&mmios[j])) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
