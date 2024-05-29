Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99108C25B75
	for <linux-riscv@archiver.kernel.org>; Wed, 29 May 2024 19:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZmT5o59XhYK3cwc2nCC6YBibbEd1b9SxQXBXy0QvA8E=; b=PPgnbR3NPKR3YK
	AFYVR7p3aZfziO23cwHxuLRRUfIvhB0ZTlWdme7Wpu5Hx2+4URrSLGMTRfr1ypfPy2QvTi5D4r983
	jLOVEBD9Uf+E25MxdF7avvDn+HpuvG1QRqUC//o+d5eGKfwutvspBVny2o8F01zJaLcMbXRjGKc3M
	xDYnMDmBkJ/arV4/GOCU+2nAxmgnRUk79NK0uRe3AYzz1Ruys53WlgWKoUpJ0FZv1jDezbTARb/Yq
	oVE+LKpVre/te4CaIlhVGvQw9F5ZJ+sKSA6zQGE7CC9Kp3p3ouozVE2lrUIHkjQ/OdPDfGubc0MG6
	59EUnsakF+MEPNOSCqcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPSg-00000005OTM-3coA;
	Wed, 29 May 2024 19:59:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCPSV-00000005OOR-2kJX;
	Wed, 29 May 2024 19:59:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1891061D76;
	Wed, 29 May 2024 19:59:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C2A1C113CC;
	Wed, 29 May 2024 19:59:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1717012777;
	bh=yv3sV0IekJXEfS+vnm5tOFqY0f0ZsogndSU+bY2+t+8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OOMx2RZSuUuUO35THJIgMC0eMmcRO9rRnCRuQA6h25AB8TBjaWfHHUnjJj0KQaoUr
	 Oe5t4AH+nB5CxLHAuIG8kJK3HGEyHNCcnf5EslfUUMTDJW3Hv9iB3E3BM8wLzptRXO
	 sdPLP9udgeoAYaoOH0VcTYdUk2NBQPHz89nV5r+h/gcEp5ikS6FvZBnl4VzA+60a0E
	 0UptO85nBP3bUEFNbXAtovO0z+L7RLP5Jx2eFvGMhc3avocnBDBcpWRXDnByc8kgat
	 QMazwfwRA3ZcKQUtHWlywrZgdK+zgvfoRvmRj0ymPy9vYOdoulfYGJd4fsZbHrkjS4
	 oMSHjUF2MYfng==
From: "Rob Herring (Arm)" <robh@kernel.org>
Date: Wed, 29 May 2024 14:59:21 -0500
Subject: [PATCH v2 2/2] of: property: Fix fw_devlink handling of
 interrupt-map
MIME-Version: 1.0
Message-Id: <20240529-dt-interrupt-map-fix-v2-2-ef86dc5bcd2a@kernel.org>
References: <20240529-dt-interrupt-map-fix-v2-0-ef86dc5bcd2a@kernel.org>
In-Reply-To: <20240529-dt-interrupt-map-fix-v2-0-ef86dc5bcd2a@kernel.org>
To: Saravana Kannan <saravanak@google.com>, 
 Anup Patel <apatel@ventanamicro.com>, Marc Zyngier <maz@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.14-dev
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_125939_865703_7B314623 
X-CRM114-Status: GOOD (  21.26  )
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

From: Marc Zyngier <maz@kernel.org>

Commit d976c6f4b32c ("of: property: Add fw_devlink support for
interrupt-map property") tried to do what it says on the tin,
but failed on a couple of points:

- it confuses bytes and cells. Not a huge deal, except when it
  comes to pointer arithmetic

- it doesn't really handle anything but interrupt-maps that have
  their parent #address-cells set to 0

The combinations of the two leads to some serious fun on my M1
box, with plenty of WARN-ON() firing all over the shop, and
amusing values being generated for interrupt specifiers.

Having 2 versions of parsing code for "interrupt-map" was a bad
idea. Now that the common parsing parts have been refactored
into of_irq_parse_imap_parent(), rework the code here to use it
instead and fix the pointer arithmetic.

Note that the dependency will be a bit different than the original code
when the interrupt-map points to another interrupt-map. In this case,
the original code would resolve to the final interrupt controller. Now
the dependency is the parent interrupt-map (which itself should have a
dependency to the parent). It is possible that a node with an
interrupt-map has no driver.

Fixes: d976c6f4b32c ("of: property: Add fw_devlink support for interrupt-map property")
Signed-off-by: Marc Zyngier <maz@kernel.org>
Co-developed-by: Rob Herring (Arm) <robh@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>
Cc: Saravana Kannan <saravanak@google.com>
Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 drivers/of/property.c | 30 ++++++++++--------------------
 1 file changed, 10 insertions(+), 20 deletions(-)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 1c83e68f805b..164d77cb9445 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1306,10 +1306,10 @@ static struct device_node *parse_interrupts(struct device_node *np,
 static struct device_node *parse_interrupt_map(struct device_node *np,
 					       const char *prop_name, int index)
 {
-	const __be32 *imap, *imap_end, *addr;
+	const __be32 *imap, *imap_end;
 	struct of_phandle_args sup_args;
 	u32 addrcells, intcells;
-	int i, imaplen;
+	int imaplen;
 
 	if (!IS_ENABLED(CONFIG_OF_IRQ))
 		return NULL;
@@ -1322,33 +1322,23 @@ static struct device_node *parse_interrupt_map(struct device_node *np,
 	addrcells = of_bus_n_addr_cells(np);
 
 	imap = of_get_property(np, "interrupt-map", &imaplen);
-	if (!imap || imaplen <= (addrcells + intcells))
+	imaplen /= sizeof(*imap);
+	if (!imap)
 		return NULL;
-	imap_end = imap + imaplen;
 
-	while (imap < imap_end) {
-		addr = imap;
-		imap += addrcells;
+	imap_end = imap + imaplen;
 
-		sup_args.np = np;
-		sup_args.args_count = intcells;
-		for (i = 0; i < intcells; i++)
-			sup_args.args[i] = be32_to_cpu(imap[i]);
-		imap += intcells;
+	for (int i = 0; imap + addrcells + intcells + 1 < imap_end; i++) {
+		imap += addrcells + intcells;
 
-		/*
-		 * Upon success, the function of_irq_parse_raw() returns
-		 * interrupt controller DT node pointer in sup_args.np.
-		 */
-		if (of_irq_parse_raw(addr, &sup_args))
+		imap = of_irq_parse_imap_parent(imap, imap_end - imap, &sup_args);
+		if (!imap)
 			return NULL;
 
-		if (!index)
+		if (i == index)
 			return sup_args.np;
 
 		of_node_put(sup_args.np);
-		imap += sup_args.args_count + 1;
-		index--;
 	}
 
 	return NULL;

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
