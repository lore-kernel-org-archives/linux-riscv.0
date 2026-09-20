Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6877C982DA
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Sep 2026 13:07:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jLUMPKYrHhInwvVrHdEFJ2FYDr/NX95FvOUXZufYz6E=; b=yT9zIZ8VO+cQOO
	b9S/BTRj3ZiTX9L9wP5nmi4cqh6J4DcnbP61KErIjggZL1/5efb4Q6O12RH2ff/Xfxva6ngZDAlbq
	jbClblqhdmvyX4lLvNrVMTdup+gmzZPYMAu3t6Qbu53z03wYDasCPGWGC9JK0l8XTWOXF5Zzj/fwF
	4yUQvIxA5GERe4wMapYOjZi8lUnwFp7MaLE2cugh3GiMZj4I9h761hn8LuqHDmzw1Srtnz+8Ea6jb
	R3wlZE/XeZlgZoxMJL3RsiYc/0LpMybX9HGsZ2FVcAZObrukIb4xsvY/N+sY38mV7O1tTBmGHgI7I
	V42Wuh7+FuqD6xS8f3qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HGJ-0000000HU3l-2pHK;
	Sun, 20 Sep 2026 13:07:19 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8HGG-0000000HU3A-1cm3
	for linux-riscv@lists.infradead.org;
	Sun, 20 Sep 2026 13:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hN
	nb657Kpa7CCqjimnpKbxkMCn7r0L4fN9/W9GtbHuU=; b=goTjUqKVQ+HGtiN0MX
	HdQ7buPyVYNdUPgPS5lMumhS2ql3/ld+CMRTX7JWy8CV+dCce9INxb0mnsMrAK2q
	hr+9Xe0ZfPOwOQUtf0b4+8H5FimzoMGrMCI1J4U3RzeYGFQa/ykcvaIHyhOZt75m
	+njbmicXHIBbF2XxtFy6sqGco=
Received: from localhost.localdomain (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgBXe05v2q9q+Hy_AQ--.59097S2;
	Sun, 20 Sep 2026 21:06:56 +0800 (CST)
From: Pengpeng Hou <hppiscas@163.com>
To: radu@rendec.net,
	tglx@kernel.org
Cc: Pengpeng Hou <hppiscas@163.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Lucas Zampieri <lzampier@redhat.com>,
	Paul Walmsley <pjw@kernel.org>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2] irqchip/sifive-plic: Avoid signed shift in interrupt enable mask
Date: Sun, 20 Sep 2026 21:06:53 +0800
Message-ID: <caplitmus-rv.v2.plic.87a8fc444de44e109889ba28703c76f3@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: PygvCgBXe05v2q9q+Hy_AQ--.59097S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uw4DuryxCFWrKryUWr4fAFb_yoW8Gw1xpF
	W5W3yvyr4fKa1j9Fy5CF4fZFy5W3sxtrW2kFZ7W34IqryYq3WkuF429345ZFn8try7Ar1U
	Cw4ftF45uFWkAaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UjZX5UUUUU=
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxRFZImqv2nHWwgAA3V
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_060716_910583_FB662EFE 
X-CRM114-Status: UNSURE (   9.25  )
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

__plic_toggle() builds a 32-bit interrupt enable mask using a signed
integer literal. A valid interrupt selecting bit 31 evaluates 1 << 31,
which shifts a signed int into its sign bit.

Use BIT(), matching the equivalent mask construction in plic_irq_eoi().
The resulting mask remains representable in u32 on both RV32 and RV64.

The issue was found by our static-analysis tool.

Fixes: 8237f8bc4f6e ("irqchip: add a SiFive PLIC driver")
Assisted-by: gpt 5
Signed-off-by: Pengpeng Hou <hppiscas@163.com>
---
Changes since v1: https://lore.kernel.org/r/20260825151000.1-plic-bit31-caplitmus-rv@iscas.ac.cn/
- Fix the Fixes tag as requested by Radu; keep the code change unchanged.
- Rebase on 518e5b794c06.

 drivers/irqchip/irq-sifive-plic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 5b0dac1..d3d4187 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -108,7 +108,7 @@ static int plic_irq_set_type(struct irq_data *d, unsigned int type);
 static void __plic_toggle(struct plic_handler *handler, int hwirq, int enable)
 {
 	u32 __iomem *base = handler->enable_base;
-	u32 hwirq_mask = 1 << (hwirq % 32);
+	u32 hwirq_mask = BIT(hwirq % 32);
 	int group = hwirq / 32;
 	u32 value;
 

base-commit: 518e5b794c06c0f0eb40df3e202274a66202c137


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
