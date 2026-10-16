Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54679CCA462
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Oct 2026 14:14:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0pqYpOxBDZlgQ1HpL+tbTyfQYcjzflG1x5Badta70r4=; b=s2r9vhwf5TO5tI
	lcT6SEzm47dAuIFXEcgEDds9QbKnCHGuNHyiVM4+ssJlEczwJFzBsLVJ2dPhL85IW2rRqKEhY+wsj
	dSdRQQgufTG+bTa49Pn9sMxSiJevK1+IEomf+LErrEaSWoCmhRUxwY/jaeesrfVNNaBBAI1I1iqJI
	aHsyMswUmp20JN/dcETmWb/EgV216SHC1ZBNGp4Zo/+aIqZ2JhO1OIyN6wHAel3XYeC4tEkZmYlcp
	PXh5HsIVnI3HbSV98JtU8HVtdBc4kOSA14QyCRP2rQY7EQJpIZXCShJN+myspEyZFvIiFtsQUSd4F
	9cQ2FIEbyWILdPRjY6fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigw-000000036qR-3GoX;
	Fri, 16 Oct 2026 14:13:50 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHigt-000000036nr-2sBl
	for linux-riscv@lists.infradead.org;
	Fri, 16 Oct 2026 14:13:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=5G
	GZU1GhM7HtjYZNTj6Fd8UyFQ8wgw6K7NpuKS0+tBM=; b=R9HnGyn2OJYkxqhUwN
	RRmNQaImcNFNkCi4GNFSe3cfI2Izku6htxrZYsYPSapmEFHEITvqZvTYsDFG8rLT
	XlgGskjrYBgYdm5LRtifLsAtCV3T6HYT84O1/8dqCubBBsvbGKzbqGx4XnR4eK4D
	1bmj0JmDkvXTBhUvEuLXlRdXo=
Received: from pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgCX5Hj5MNJqeorFAA--.36405S4;
	Fri, 16 Oct 2026 22:13:18 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Sunil V L <sunilvl@ventanamicro.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-acpi@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 2/2] ACPI: riscv: validate interrupt controller MADT entries
Date: Fri, 16 Oct 2026 22:12:48 +0800
Message-Id: <20261016141249.2791819-3-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016141249.2791819-1-yaojiale02@163.com>
References: <20261016141249.2791819-1-yaojiale02@163.com>
MIME-Version: 1.0
X-CM-TRANSID: PCgvCgCX5Hj5MNJqeorFAA--.36405S4
X-Coremail-Antispam: 1Uf129KBjvJXoW7CF15Ww17Zr1kZw17ZryrWFg_yoW8GFWxpa
	yUKw4Yyr45tr4fWw1UKr15XFW3W3y5GFsIqFWUua4IqrsrKFWYqFZYqF1a9r95Ja1vgw4a
	9r4ktFy5uFW8AF7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRha93UUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbC8B6a1GrSMP6n-QAA3M
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261016_071348_078748_71A8EEE8 
X-CRM114-Status: UNSURE (   7.95  )
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

The PLIC and APLIC MADT callbacks cast generic subtable headers to
fixed-size records before checking that the complete records are
present. Truncated firmware entries can therefore cause out-of-bounds
field reads.

Reject entries that do not contain the complete controller-specific
structure before registering an interrupt controller.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/acpi/riscv/irq.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/acpi/riscv/irq.c b/drivers/acpi/riscv/irq.c
index da2c42e0ebfd..1f6fee5c5746 100644
--- a/drivers/acpi/riscv/irq.c
+++ b/drivers/acpi/riscv/irq.c
@@ -220,6 +220,9 @@ static int __init riscv_acpi_aplic_parse_madt(union acpi_subtable_headers *heade
 {
 	struct acpi_madt_aplic *aplic = (struct acpi_madt_aplic *)header;
 
+	if (BAD_MADT_ENTRY(aplic, end))
+		return -EINVAL;
+
 	return riscv_acpi_register_ext_intc(aplic->gsi_base, aplic->num_sources, aplic->num_idcs,
 					    aplic->id, ACPI_RISCV_IRQCHIP_APLIC);
 }
@@ -229,6 +232,9 @@ static int __init riscv_acpi_plic_parse_madt(union acpi_subtable_headers *header
 {
 	struct acpi_madt_plic *plic = (struct acpi_madt_plic *)header;
 
+	if (BAD_MADT_ENTRY(plic, end))
+		return -EINVAL;
+
 	return riscv_acpi_register_ext_intc(plic->gsi_base, plic->num_irqs, 0,
 					    plic->id, ACPI_RISCV_IRQCHIP_PLIC);
 }
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
