Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F662CE7AAA
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 10:48:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=46N347o/jrOguHrebvVaGV7xi644TTes+ewAX/FFYZc=; b=PJZvxnaSF700Sh
	O62cTDyfRm6wgoYqwGt7Le2KJk0YZ/ueH/6HhOnXwMg2nBTAW+A1Yjvg3Y2vDEkpbg4GtPspd7c1m
	YV+ZTJyAJs0BDfABev2fly4D5HCcy46RWnE0KPEkzIiqxPNEKiibEHCbJVTzFuRkRIIn2aiYDti1S
	SKUTjbntai1oEWoBjnkKSfESyuPiS9LD+ATS3bu+BqfvNEkQ+uugubTD0gAtpU6u9acUYLz9mvVMt
	D6/f3dvTJbcZGuMs/eacy15xDGxw40tOVQW4PB3zb5e5oZwPCgDPJojrCjBnvdrMerOwbhQeTy+OM
	JFGgxakAosGVRUPpuWdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrLe-0000000C42Z-14sg;
	Fri, 14 Nov 2025 10:48:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJrLc-0000000C42C-2soZ
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 10:48:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B897E6016F;
	Fri, 14 Nov 2025 10:48:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE180C16AAE;
	Fri, 14 Nov 2025 10:48:03 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Magnus Damm <magnus.damm@gmail.com>,
	devicetree@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v2] of/irq: Ignore interrupt parent for nodes without interrupts
Date: Fri, 14 Nov 2025 11:47:54 +0100
Message-ID: <fbe6fc3657070fe2df7f0529043542b52b827449.1763116833.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

The Devicetree Specification states:

    The root of the interrupt tree is determined when traversal of the
    interrupt tree reaches an interrupt controller node without an
    interrupts property and thus no explicit interrupt parent.

However, of_irq_init() gratuitously assumes that a node without
interrupts has an actual interrupt parent if it finds an
interrupt-parent property higher up in the device tree.  Hence when such
a property is present (e.g. in the root node), the root interrupt
controller may not be detected as such, causing a panic:

    OF: of_irq_init: children remain, but no parents
    Kernel panic - not syncing: No interrupt controller found.

Commit e91033621d56e055 ("of/irq: Use interrupts-extended to find
parent") already fixed a first part, by checking for the presence of an
interrupts-extended property.  Fix the second part by only calling
of_irq_find_parent() when an interrupts property is present.

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
v2:
  - Split off from series "[PATCH/RFC 0/2] of/irq: Fix root interrupt
    controller handling"[1] to relax dependencies,
  - Drop RFC.

[1] https://lore.kernel.org/all/cover.1759485668.git.geert+renesas@glider.be
---
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index b174ec29648955c6..5cb1ca89c1d8725d 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -613,7 +613,7 @@ void __init of_irq_init(const struct of_device_id *matches)
 		 * are the same distance away from the root irq controller.
 		 */
 		desc->interrupt_parent = of_parse_phandle(np, "interrupts-extended", 0);
-		if (!desc->interrupt_parent)
+		if (!desc->interrupt_parent && of_property_present(np, "interrupts"))
 			desc->interrupt_parent = of_irq_find_parent(np);
 		if (desc->interrupt_parent == np) {
 			of_node_put(desc->interrupt_parent);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
