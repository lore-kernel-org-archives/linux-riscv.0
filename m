Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D48E7CCA471
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Oct 2025 10:08:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TSNNAxb1zDhQuLVG/600+k/5FDMykOjTEEBo98NQouw=; b=uA1etXUVjTSUgQ
	XCWwtxkOWGZdZLbGj8PXXQQem7OpF8iLe/pciAq3n4fOhZjVVj752ENQPBbjhyfkFiFxPIdGAPcVA
	xU5GLAUyPVpzS9OOZJhs2m4pfmvsFOCgdUlf/EC80nyxGQe41lNM7RVlbhfO/rjuzSzUbw/2OKaAv
	fpwMJL45XHL4wZMkAUhbJTEPD+3Q0lgwoWBHl7ENE3RxtxxaXefwhFoh5eyrcWgMIrJ2s8RlrMRtd
	H46NzfXK24fWBAJDftqpWSGCXbC6l7XDXkx+XketDPqE6KD/Wi/mV+weBE/GKDTPFI8QkXfWyDrfe
	aatMmj3HlOawUERmU5sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ci1-0000000C0c8-1x7L;
	Fri, 03 Oct 2025 10:08:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v4ci0-0000000C0b3-0NsO
	for linux-riscv@lists.infradead.org;
	Fri, 03 Oct 2025 10:08:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4802561180;
	Fri,  3 Oct 2025 10:08:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E607FC4CEF9;
	Fri,  3 Oct 2025 10:08:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Samuel Holland <samuel@sholland.org>,
	Marc Zyngier <maz@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Magnus Damm <magnus.damm@gmail.com>
Cc: linux-renesas-soc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH/RFC 1/2] of/irq: Ignore interrupt parent for nodes without interrupts
Date: Fri,  3 Oct 2025 12:07:48 +0200
Message-ID: <98e13934d06116d5c116bd2b2187842ec3a8c11a.1759485668.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1759485668.git.geert+renesas@glider.be>
References: <cover.1759485668.git.geert+renesas@glider.be>
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
 drivers/of/irq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/of/irq.c b/drivers/of/irq.c
index c29f0bef7798ec02..f155054e297c989a 100644
--- a/drivers/of/irq.c
+++ b/drivers/of/irq.c
@@ -663,7 +663,7 @@ void __init of_irq_init(const struct of_device_id *matches)
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
