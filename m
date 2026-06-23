Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D603BCDB470
	for <linux-riscv@archiver.kernel.org>; Tue, 23 Jun 2026 07:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=HszojIP1uDodmENe4biRTPLcUGo7NIZV5X+CYW4+HPA=; b=wihtPatXGZQTdJ
	btD/V5i/GDXYmJ/VhrsJq/rjFx9k28CoTKBwwPharU77JfmMVwIGSPtUwZDyOc4ztWBkz0nLafTeO
	DZgisL+UiBNGjFL8Zg05yyG2iybZ4AYXctmS+ghx+P+RIN7g4SDiq6DG3idECEmhvHw62M9RdQohb
	3mJnWVdcEGvwL0zrV06dVLdOI7IddOGhRxyoD00HEfavk5dCiVmExLSuc+STWH0Ea5B3M5095e6hC
	UQJvkeLbyusl5KUYzFCQtefQn/XdS/EiJwr2FjDvSA2K9dEsKAC5RDAz4Fu9MAgShUEV55qc6cRul
	bV/NPoZzALVayq0oHTIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbviT-00000005qR6-0WWN;
	Tue, 23 Jun 2026 07:38:41 +0000
Received: from m16.mail.163.com ([117.135.210.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbviQ-00000005qQl-0V8z
	for linux-riscv@lists.infradead.org;
	Tue, 23 Jun 2026 07:38:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=cz
	wcxy20z7HdHob/DRitDJw7LqO+2Wxqq+k78T1yRIs=; b=j/J1/Z3v2dad4X8JkO
	zT5cvcYG/SQYIs6SKVpYOXZtxX7mEN2lbEQN/HT7ighVvJBW4VB0+ZyS3322xNvg
	yRCJ3U6zx7DRtyfTNScXKtvG19gIjqoOm29UQg0bV9MZe4K2w3JmHaS0juJi4sxj
	TIhPxbL8i2MW5DK/9LncjBeew=
Received: from localhost.localdomain (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wD3LCvJNzpqF4UrFA--.25662S2;
	Tue, 23 Jun 2026 15:37:47 +0800 (CST)
From: Haoxiang Li <haoxiang_li2024@163.com>
To: anup@brainfault.org,
	tglx@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	rafael.j.wysocki@intel.com,
	sunilvl@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Haoxiang Li <haoxiang_li2024@163.com>,
	stable@vger.kernel.org
Subject: [PATCH] irqchip/irq-riscv-imsic-early: Fix fwnode leak on state setup failure
Date: Tue, 23 Jun 2026 15:37:44 +0800
Message-Id: <20260623073744.2009137-1-haoxiang_li2024@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: _____wD3LCvJNzpqF4UrFA--.25662S2
X-Coremail-Antispam: 1Uf129KBjvJXoWruw4rKFy8tFWDurWDGr13twb_yoW8Jr1kpr
	45Jas09r15A3W8Xr4Utw18uFWrJryDCrZrKay8twnxXr45tFWkJFWDZFyfu3WDJrWfWa1a
	9F4rtaykZF1DCaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pidWrJUUUUU=
X-Originating-IP: [240e:604:311:e68d:298a:1bbc:177b:53c8]
X-CM-SenderInfo: xkdr5xpdqjszblsqjki6rwjhhfrp/xtbCxgspl2o6N8theAAA3G
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_003838_873878_1B1E1432 
X-CRM114-Status: UNSURE (   8.89  )
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

imsic_early_acpi_init() allocates a firmware node with
irq_domain_alloc_named_fwnode() before setting up the
IMSIC state. If imsic_setup_state() fails, the function
returns without freeing the allocated fwnode.

Free the fwnode and clear the global pointer on this
error path, matching the cleanup already done when
imsic_early_probe() fails.

Fixes: fbe826b1c106 ("irqchip/riscv-imsic: Add ACPI support")
Cc: stable@vger.kernel.org
Signed-off-by: Haoxiang Li <haoxiang_li2024@163.com>
---
 drivers/irqchip/irq-riscv-imsic-early.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/irqchip/irq-riscv-imsic-early.c b/drivers/irqchip/irq-riscv-imsic-early.c
index a7a1852b548c..b7cbfee3aeb2 100644
--- a/drivers/irqchip/irq-riscv-imsic-early.c
+++ b/drivers/irqchip/irq-riscv-imsic-early.c
@@ -272,6 +272,8 @@ static int __init imsic_early_acpi_init(union acpi_subtable_headers *header,
 	rc = imsic_setup_state(imsic_acpi_fwnode, imsic);
 	if (rc) {
 		pr_err("%pfwP: failed to setup state (error %d)\n", imsic_acpi_fwnode, rc);
+		irq_domain_free_fwnode(imsic_acpi_fwnode);
+		imsic_acpi_fwnode = NULL;
 		return rc;
 	}
 
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
