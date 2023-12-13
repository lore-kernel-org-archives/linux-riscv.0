Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E29C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:50:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-Id:MIME-Version:Subject:Cc
	:To:From:References:In-Reply-To:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mbW9ynrxKBB/bpMVVcOXLdsdtazW3W8UOEXqWiaduf4=; b=pC/Du+8av49zq0
	qMnABepZN3uokYC6Now+hnSdyfEQzo9uhTs2oaxMqPCIAY1eTnasR/m/hSz/t4k08m/OGirx+UcVB
	wJBwQ4YOj7u36hL20q1EKathv4XFDiQl8xJ9cHM4nAsEslUmr6t6xhLJTZw3ajCSwRQx7CliHBwM7
	HDvPKD1QtoiYYpa1guT5n5t+Vi229CH127fo1jLpDsvp7P9hgpnd7ncee6Xzau8xueg+wzNYUUgCt
	EPrkGc69qGDT48hPFUM6oqPlszXa8iz6Mas9HKiI3cCKJ6NwiE8LlnVBOi8dPJFmhWI7bOtQMOmxg
	gmx7B6+1m2W0waT4pT0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhM-00EeyN-2T;
	Wed, 13 Dec 2023 12:50:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOhF-00Eeqr-0s;
	Wed, 13 Dec 2023 12:50:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description;
	bh=nlbHQpsJ2mXYVNzTjHiHy20VvNm+xTIYOL47lOBS/vU=; b=V+/1wo36KSWGuHKziqfgXpxqXI
	Yvo+UQWnwjFLGWUJ9zb3hAb/fX7FWU0KkdwNVdfUcX23PBR6hdcS7TN7NJPJesc2dH1uNdUF79Imo
	VzU9ep7PdVQxXAtApHa3H/0d1V31J1riceE8KkUEeXT57hr9GR4K3FjIV91pHwUsavKV0iZV/nHH2
	ix1D7rRvBVhMfZhIl7RyWZkRWKYxtjGdeoRN+4Ra1Hz848ix40gYCkdkbUl8MYOTBWsNG75n9GoRY
	JPfHzT9dg12UjrKLzAFTsGGjsUHlmbX2zrcBzoKQ/Tcs4cX0M7StISLi5IlEzDr9X0meYRUC6AfBp
	1V4vx/oQ==;
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOh9-00964c-1m;
	Wed, 13 Dec 2023 12:50:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Date:Sender:Message-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Subject:Cc:To:From:References:
	In-Reply-To:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nlbHQpsJ2mXYVNzTjHiHy20VvNm+xTIYOL47lOBS/vU=; b=NxjT/a9log1Qg2/QyYTC28lXRw
	Nb9PdozexRLxTReLoLYO2nPm/U2CtaDlf+9iRFgmUhORHcWBDVCDEmOfIsZ/HBQqtNBv2syvGX9sV
	vSB+ayP6h5pwY6jETJUNe3RmtaiNKcx8QfBN2h/Xh1IM03S0O5bhesS3qtkU2C567Y0tXYCzHjnoz
	SKnotxGSCp10T9ulrc6Xvm96pwTBhdssvD2Zwqyl9X62ZMKA2SXgWyqpWB2ifAuwftFu6/bsM3ibG
	Su6rLni7+lTJqAXf41O4K0yuwixYKidf/YEBvSwcuWzVz/QMW5sTleuqzkZF+ksNmUAYp2bFDclj4
	OQBX60Zg==;
Received: from e0022681537dd.dyn.armlinux.org.uk ([fd8f:7570:feb6:1:222:68ff:fe15:37dd]:33740 helo=rmk-PC.armlinux.org.uk)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <rmk@armlinux.org.uk>)
	id 1rDOgv-0008G4-0b;
	Wed, 13 Dec 2023 12:50:21 +0000
Received: from rmk by rmk-PC.armlinux.org.uk with local (Exim 4.94.2)
	(envelope-from <rmk@rmk-PC.armlinux.org.uk>)
	id 1rDOgx-00Dvkv-Bb; Wed, 13 Dec 2023 12:50:23 +0000
In-Reply-To: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
References: <ZXmn46ptis59F0CO@shell.armlinux.org.uk>
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
	acpica-devel@lists.linuxfoundation.org,
	linux-csky@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-parisc@vger.kernel.org
Cc: Salil Mehta <salil.mehta@huawei.com>,
	Jean-Philippe Brucker <jean-philippe@linaro.org>,
	jianyong.wu@arm.com,
	justin.he@arm.com,
	James Morse <james.morse@arm.com>
Subject: [PATCH RFC v3 14/21] irqchip/gic-v3: Don't return errors from
 gic_acpi_match_gicc()
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <E1rDOgx-00Dvkv-Bb@rmk-PC.armlinux.org.uk>
Date: Wed, 13 Dec 2023 12:50:23 +0000
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_125035_907082_DC4E0AF8 
X-CRM114-Status: GOOD (  15.50  )
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
Tested-by: Miguel Luis <miguel.luis@oracle.com>
Tested-by: Vishnu Pajjuri <vishnu@os.amperecomputing.com>
Tested-by: Jianyong Wu <jianyong.wu@arm.com>
Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
---
 drivers/irqchip/irq-gic-v3.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/irqchip/irq-gic-v3.c b/drivers/irqchip/irq-gic-v3.c
index 98b0329b7154..ebecd4546830 100644
--- a/drivers/irqchip/irq-gic-v3.c
+++ b/drivers/irqchip/irq-gic-v3.c
@@ -2420,21 +2420,15 @@ static int __init gic_acpi_match_gicc(union acpi_subtable_headers *header,
 
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
