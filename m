Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F196C07545
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Oct 2023 15:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hzpDjRVm29CkhZzPE2ZnuK0Dd/qfN18XdUnchpWmOgo=; b=iL/i5f5Cb/ErE3
	a9s5WKyq8UnR643twj0PEF6QjRoq9Pp7AdIrMTlqgVsTSqNBA/yvYwFDh9X3C+r45eyxYf+wgjcz2
	iAd+AISKmZHMxROQjvdRzbIy46GXbZp+xXT2TjZbMcVQv4sgaiU/U1v3IYBwlgVugkBI/wdVKU509
	LcH+sRtEMzKqu8xWZd4Md+renev8D5iRaF/O5TTZNUJAwBRp4hGXvkDhwc+gug7h+ehVWsr/gKjp8
	1WPPBFkOlSyFSc16Gt2Q/NJzRkHyO529EKJvAtiCqcyU2pcReVEgrUUzs26tkLieNj73ZimArEXjj
	l3KcErur9qqyeVKDUjbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJDl-00AIvF-14;
	Tue, 24 Oct 2023 15:21:29 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBP-00AGpX-1t;
	Tue, 24 Oct 2023 15:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=NNfCkWmd5LT0BAlRMwpLRo9og9wq6dyC/LO+q6jD+yw=; b=GPKKYJxcxw57oC285ndZvwWMJj
	GupaUd+k9s0rp+Ykt/nydfK3oQXTDryykZFpwI53trBL6bn4BvSzhoMl+qjcWyZmYVfB6/auJpOlJ
	K6cd+pGp2pO90WRrQ1rHNicgF90qHULVHC7ejfeKQa8w0mXTNL6hxGM/Yxqc2ggip69ip3QH7QO3I
	PiD8St5Z4svt7Nt+yMC5+Pr9xwG3aeRs2HLZPEVIO8S97cf3VIDecttdTUXTMEZi1uL4SiPBDoUZs
	mKlExsy+STbaVGGJX6e6XMpfX20V+UZsfRkfZyyxrSN9mgmxI5WaMYycopNFeKk+bu34u62S2BdHk
	ttUhsgsg==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvJBL-00FbJx-2d;
	Tue, 24 Oct 2023 15:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=NNfCkWmd5LT0BAlRMwpLRo9og9wq6dyC/LO+q6jD+yw=; b=pyT8sDn3D1Na/0O83HIphO1Ygc
	l6elglC6TwBupkx3TMPL6MHhd2AQ13+rYybnm0Z2pPCaFUuxwj82HJY+JIzqfk8mGsLNkv610UyCO
	Mu8peZB3jHlW2munKziOBEfKGZwJcPj8n/tN4OL3S9fexilLt0PcraVsNGn/RbnYJMs6Gx+A/yVsV
	8Yb4sXGt74xXlYc6UEszKMH3by5XWusgwOTbCfqzHtABHHLYkGpXAcRtU6UgpuhZrNXk2EdBkqfEC
	gZrnaaFcBiIzZgVdZDiJT4aZixMrV3HtPxI0LxbVPyNoi1yiCfbQ6QuP6izPgBwNqRCmtL8esPEGk
	gnU6KdQw==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:44458 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1qvJBE-0004VZ-1a;
	Tue, 24 Oct 2023 16:18:52 +0100
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1qvJBF-00AqRw-Us; Tue, 24 Oct 2023 16:18:54 +0100
In-Reply-To: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
References: <ZTffkAdOqL2pI2la@shell.armlinux.org.uk>
From: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
To: linux-pm@vger.kernel.org,
	 loongarch@lists.linux.dev,
	 linux-acpi@vger.kernel.org,
	 linux-arch@vger.kernel.org,
	 linux-kernel@vger.kernel.org,
	 linux-arm-kernel@lists.infradead.org,
	 linux-riscv@lists.infradead.org,
	 kvmarm@lists.linux.dev,
	 x86@kernel.org,
	 linux-csky@vger.kernel.org,
	 linux-doc@vger.kernel.org,
	 linux-ia64@vger.kernel.org,
	 linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	 Jean-Philippe Brucker <jean-philippe@linaro.org>,
	 jianyong.wu@arm.com,
	 justin.he@arm.com,
	 James Morse <james.morse@arm.com>,
	Marc Zyngier <maz@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 32/39] irqchip/gic-v3: Don't return errors from
 gic_acpi_match_gicc()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1qvJBF-00AqRw-Us@rmk-PC.armlinux.org.uk>
Date: Tue, 24 Oct 2023 16:18:53 +0100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231024_161900_282028_74F42450 
X-CRM114-Status: GOOD (  16.45  )
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

From: James Morse <james.morse@arm.com>

gic_acpi_match_gicc() is only called via gic_acpi_count_gicr_regions().
It should only count the number of enabled redistributors, but it
also tries to sanity check the GICC entry, currently returning an
error if the Enabled bit is set, but the gicr_base_address is zero.

Adding support for the online-capable bit to the sanity check
complicates it, for no benefit. The existing check implicitly
depends on gic_acpi_count_gicr_regions() previous failing to find
any GICR regions (as it is valid to have gicr_base_address of zero if
the redistributors are described via a GICR entry).

Instead of complicating the check, remove it. Failures that happen
at this point cause the irqchip not to register, meaning no irqs
can be requested. The kernel grinds to a panic() pretty quickly.

Without the check, MADT tables that exhibit this problem are still
caught by gic_populate_rdist(), which helpfully also prints what
went wrong:
| CPU4: mpidr 100 has no re-distributor!

Signed-off-by: James Morse <james.morse@arm.com>
Reviewed-by: Gavin Shan <gshan@redhat.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/irqchip/irq-gic-v3.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index d50d9414f471..e787e7bbb5a2 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2428,21 +2428,15 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 
 	/*
 	 * If GICC is enabled and has valid gicr base address, then it means
-	 * GICR base is presented via GICC
+	 * GICR base is presented via GICC. The redistributor is only known to
+	 * be accessible if the GICC is marked as enabled. If this bit is not
+	 * set, we'd need to add the redistributor at runtime, which isn't
+	 * supported.
 	 */
-	if (acpi_gicc_is_usable(gicc) && gicc->gicr_base_address) {
+	if (gicc->flags & ACPI_MADT_ENABLED && gicc->gicr_base_address)
 		acpi_data.enabled_rdists++;
-		return 0;
-	}
 
-	/*
-	 * It's perfectly valid firmware can pass disabled GICC entry, driver
-	 * should not treat as errors, skip the entry instead of probe fail.
-	 */
-	if (!acpi_gicc_is_usable(gicc))
-		return 0;
-
-	return -ENODEV;
+	return 0;
 }
 
 static int __init gic_acpi_count_gicr_regions(void)
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
