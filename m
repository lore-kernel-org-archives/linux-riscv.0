Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E728AC4451C
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Jul 2026 04:34:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=x51fMssme/L3cV9FPhNbYHeVx2RSrEe3xBzTWUUPrE0=; b=Vwrunb+k7ohwq1
	W/AX0giq30xUM4f2cru69DcXIobVae4zgrQ+onA6wBVaCbfpMpp2TAs0xroltNe+KG7VKnTuftZCu
	ePp6S6UtR2MB9HKvKvUPjF/fvlbzxSwP5pcZLjiqoO9iTr81+VcKzPwW6ngrQV8N66mspOFzervKu
	abJaheMHEkYg+TloT1YNojlBMwXSQe0OHYxM/xYRhho371AUSldcrCy42ZhWbMJqMdHOjVcVyMDKc
	dZNWKRbHf0vqxdBm0/7Zdf5pH4zE5ZQ7wH2+5gSnzjVV/hTsUUFgXj0OAmfjnvtDECfb3O3qRIuIy
	WKCuU2I/aLIeRibYT47A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwlA-00000003gHw-3O0L;
	Sat, 18 Jul 2026 04:34:44 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkwl8-00000003gH8-1onb
	for linux-riscv@lists.infradead.org;
	Sat, 18 Jul 2026 04:34:44 +0000
Received: from localhost.localdomain (unknown [111.196.245.140])
	by APP-03 (Coremail) with SMTP id rQCowADHzz1cAltqKUkuAA--.9207S2;
	Sat, 18 Jul 2026 12:34:37 +0800 (CST)
From: Pengpeng Hou <pengpeng@iscas.ac.cn>
To: Anup Patel <anup@brainfault.org>
Cc: Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] irqchip/riscv-imsic: Use GENMASK for base address masks
Date: Sat, 18 Jul 2026 12:34:36 +0800
Message-ID: <20260718040000.004.929c1ef2-caplitmus-rv@iscas.ac.cn>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: rQCowADHzz1cAltqKUkuAA--.9207S2
X-Coremail-Antispam: 1UD129KBjvJXoW7KFWfZr4UWFWktw18uF4rZrb_yoW5JF48pF
	sxCr4SkrW7AFW0vr4IyrnF9342g3WvyFW5GrW7Can0k3sFyrnFq3Z0kFyfZw1kXr4fZry8
	AFs8JryDWa18CFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9214x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1I6r4UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr1j6F4UJwA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
	1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
	7VC0I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r
	1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02
	628vn2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4
	IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1r
	MI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJV
	WUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j
	6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYx
	BIdaVFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [111.196.245.140]
X-CM-SenderInfo: pshqw1xhqjqxpvfd2hldfou0/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_213442_868890_85E82226 
X-CRM114-Status: GOOD (  10.40  )
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

The IMSIC DT binding allows riscv,guest-index-bits up to 7 and
riscv,hart-index-bits up to 15. On RV32, guest-index-bits=7 and
hart-index-bits=13, together with the 12-bit IMSIC page offset, is a
binding-valid layout that consumes a 32-bit low-address mask.

The parser accepts this equality case because it rejects only values
larger than the remaining bit budget. The base address canonicalization
then builds the low-address mask with BIT(sum) - 1. When sum is 32 on
RV32, that expression shifts an unsigned long by its full width.

Keep the legal equality layout and express the mask with GENMASK(sum - 1,
0) instead. The existing parser bounds guarantee that sum - 1 is below
BITS_PER_LONG at both mask sites.

Fixes: 21a8f8a0eb35 ("irqchip: Add RISC-V incoming MSI controller early driver")
Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>
---
 drivers/irqchip/irq-riscv-imsic-state.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/drivers/irqchip/irq-riscv-imsic-state.c b/drivers/irqchip/irq-riscv-imsic-state.c
index b8d1bbbf42f73..9505ddbd9eec9 100644
--- a/drivers/irqchip/irq-riscv-imsic-state.c
+++ b/drivers/irqchip/irq-riscv-imsic-state.c
@@ -7,6 +7,7 @@
 #define pr_fmt(fmt) "riscv-imsic: " fmt
 #include <linux/acpi.h>
 #include <linux/cpu.h>
+#include <linux/bits.h>
 #include <linux/bitmap.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -769,9 +770,9 @@ static int __init imsic_parse_fwnode(struct fwnode_handle *fwnode,
 		return -EINVAL;
 	}
 	global->base_addr = res.start;
-	global->base_addr &= ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+	global->base_addr &= ~GENMASK(global->guest_index_bits +
+				       global->hart_index_bits +
+				       IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 	global->base_addr &= ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
 
@@ -850,9 +851,9 @@ int __init imsic_setup_state(struct fwnode_handle *fwnode, void *opaque)
 		}
 
 		base_addr = mmios[i].start;
-		base_addr &= ~(BIT(global->guest_index_bits +
-				   global->hart_index_bits +
-				   IMSIC_MMIO_PAGE_SHIFT) - 1);
+		base_addr &= ~GENMASK(global->guest_index_bits +
+				      global->hart_index_bits +
+				      IMSIC_MMIO_PAGE_SHIFT - 1, 0);
 		base_addr &= ~((BIT(global->group_index_bits) - 1) <<
 			       global->group_index_shift);
 		if (base_addr != global->base_addr) {
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
