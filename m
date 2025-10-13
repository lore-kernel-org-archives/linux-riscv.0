Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AC0ACCD185
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 10:55:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=x3u4n0DV48sPams3RQXJLQMjNcNlDx2NBtU8xiY+dTQ=; b=1j9MqVPh7E71Qh
	6TnOG6H5C+yjCPTAw5etHQNvzsDT+yj+K9n3Be+eHatwOp1GwrOLM4wohUTpM+IYKrA1pKEDADXPN
	DMvrIjaj2ppqdiFiV+f7Y96VDswujhvtItbIxeIpiq1i7aHZaaRyeopTmXP9nyPALixrnUdCc1Pci
	R7bLobGwRrLSxR07sgbyPGh4QBz3BO0M0pbgFs3Xpp0Q4p/zTsgn8C47u/rjusRP4klnzk7D8PMbo
	oUPdFNaXMqe81yXLUs5figAPvbLlczlX9Jfr2GzNWg8OPN4nnfZUoAzgGOG6bdYXIyl03gqH3ZAIC
	E03l2PgLFOouKu6HSQJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GCX-0000000Cwiv-2At0;
	Mon, 13 Oct 2025 10:54:49 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8GCP-0000000CwaI-1PZj
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 10:54:48 +0000
Received: from Atcsqr.andestech.com (localhost [127.0.0.2] (may be forged))
	by Atcsqr.andestech.com with ESMTP id 59DAkF58076551
	for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 18:46:15 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 59DAg63V075209
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 13 Oct 2025 18:42:06 +0800 (+08)
	(envelope-from randolph@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Mon, 13 Oct 2025
 18:42:06 +0800
From: Randolph Lin <randolph@andestech.com>
To: <linux-kernel@vger.kernel.org>
CC: <linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <devicetree@vger.kernel.org>, <jingoohan1@gmail.com>,
        <mani@kernel.org>, <lpieralisi@kernel.org>, <kwilczynski@kernel.org>,
        <robh@kernel.org>, <bhelgaas@google.com>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <alex@ghiti.fr>, <aou@eecs.berkeley.edu>,
        <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
        <ben717@andestech.com>, <inochiama@gmail.com>,
        <thippeswamy.havalige@amd.com>, <namcao@linutronix.de>,
        <shradha.t@samsung.com>, <pjw@kernel.org>, <randolph.sklin@gmail.com>,
        <tim609@andestech.com>, Randolph Lin <randolph@andestech.com>
Subject: [PATCH v7 1/5] PCI: dwc: Allow adjusting the number of ob/ib windows in glue driver
Date: Mon, 13 Oct 2025 18:41:42 +0800
Message-ID: <20251013104146.578319-2-randolph@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251013104146.578319-1-randolph@andestech.com>
References: <20251013104146.578319-1-randolph@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 59DAkF58076551
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_035441_715893_1ACD9B18 
X-CRM114-Status: GOOD (  11.16  )
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

The number of ob/ib windows is determined through write-read loops
on registers in the core driver. Some glue drivers need to adjust
the number of ob/ib windows to meet specific requirements,such as
hardware limitations. This change allows the glue driver to adjust
the number of ob/ib windows to satisfy platform-specific constraints.
The glue driver may adjust the number of ob/ib windows, but the values
must stay within hardware limits.

Signed-off-by: Randolph Lin <randolph@andestech.com>
---
 drivers/pci/controller/dwc/pcie-designware.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-designware.c b/drivers/pci/controller/dwc/pcie-designware.c
index c644216995f6..a860890febc3 100644
--- a/drivers/pci/controller/dwc/pcie-designware.c
+++ b/drivers/pci/controller/dwc/pcie-designware.c
@@ -851,8 +851,16 @@ void dw_pcie_iatu_detect(struct dw_pcie *pci)
 		max = 0;
 	}
 
-	pci->num_ob_windows = ob;
-	pci->num_ib_windows = ib;
+	if (!pci->num_ob_windows)
+		pci->num_ob_windows = ob;
+	else if (pci->num_ob_windows > ob)
+		dev_err(pci->dev, "Adjusted ob windows exceed the limit\n");
+
+	if (!pci->num_ib_windows)
+		pci->num_ib_windows = ib;
+	else if (pci->num_ib_windows > ib)
+		dev_err(pci->dev, "Adjusted ib windows exceed the limit\n");
+
 	pci->region_align = 1 << fls(min);
 	pci->region_limit = (max << 32) | (SZ_4G - 1);
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
