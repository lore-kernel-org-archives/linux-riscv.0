Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC3EEA4FD8
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 15:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zIL8WIJm4Tw3uqYCVNLzvt1qMhiG/5TS++XV9Wh9C5s=; b=3dJZFKHNiR/Uc1
	AM7k3OL5etCjTCAFfEV2Kn741X+N5jUp/5kh86RvPa/M+DepJsXFajSkbtwzlXVUfkQedt3E+NIy+
	kc1AM2q3wyzYZK+zbECCqfLYixR194/JjdAdet7f3fg1KQep5Uwo119uUf6sLGgLVMFXezmaGWysG
	wsymzbHdyWzFHv8F9LtUCxxwfVU9VLzTZ5YR7vwY2e8y1O0pKG308NKshsCqmfGJOXKHqPfsizKyv
	tvwyt4CUCBc7sG2+6PZe2X9tdSxLXskMe2kdxoUsDmCyxNkganUM2J/MFrhiM19LumVKZpl/RKpGL
	XLDw0zfsdyatqV+cll3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYFp-00000000bqn-2QZQ;
	Mon, 23 Feb 2026 15:53:49 +0000
Received: from mail-m32104.qiye.163.com ([220.197.32.104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuYFm-00000000bpx-3Thm
	for linux-riscv@lists.infradead.org;
	Mon, 23 Feb 2026 15:53:48 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b4045a8;
	Mon, 23 Feb 2026 23:53:40 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	Bjorn Helgaas <bhelgaas@google.com>,
	Philipp Stanner <phasta@kernel.org>,
	linux-pci@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 21/37] iommu/riscv: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
Date: Mon, 23 Feb 2026 23:53:31 +0800
Message-Id: <1771862011-88864-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9c8b34ceec09cckunmbc588dbe987c42
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5MGVYdTx0eGU4aSEwdSR5WFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=LLSM1v25WAq/SswkB376EBgHwzq59kOjUC3q28q1wsGGcTM5L9eitwYv7a8xmF/IOVyrRvAo68tEuXQbYCRBc9iLQOKoU5gE0L3lmMlA/Zg0MPoGKBigIZ3zCLLrKuBItr+0+BfGNOC6vu1WhO01OItcic58bkzTGyI8yA4VVAo=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=TeaSVotaIdmlBVwbjwoZ6VK6NcCzkiCU/IZWFmgDxVY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_075347_419262_7FF2FCCE 
X-CRM114-Status: GOOD (  10.82  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

pcim_enable_device() no longer automatically manages IRQ vectors via devres.
Drivers must now manually call pci_free_irq_vectors() for cleanup. Alternatively,
pcim_alloc_irq_vectors() should be used.

To: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Will Deacon <will@kernel.org>
To: Joerg Roedel <joro@8bytes.org>
Cc: iommu@lists.linux.dev
Cc: linux-riscv@lists.infradead.org
Cc: Bjorn Helgaas <bhelgaas@google.com>
Cc: Philipp Stanner <phasta@kernel.org>
Cc: linux-pci@vger.kernel.org
Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/iommu/riscv/iommu-pci.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/riscv/iommu-pci.c b/drivers/iommu/riscv/iommu-pci.c
index d82d2b0..c5bb926 100644
--- a/drivers/iommu/riscv/iommu-pci.c
+++ b/drivers/iommu/riscv/iommu-pci.c
@@ -75,8 +75,8 @@ static int riscv_iommu_pci_probe(struct pci_dev *pdev, const struct pci_device_i
 	}
 
 	/* Allocate and assign IRQ vectors for the various events */
-	rc = pci_alloc_irq_vectors(pdev, 1, RISCV_IOMMU_INTR_COUNT,
-				   PCI_IRQ_MSIX | PCI_IRQ_MSI);
+	rc = pcim_alloc_irq_vectors(pdev, 1, RISCV_IOMMU_INTR_COUNT,
+				    PCI_IRQ_MSIX | PCI_IRQ_MSI);
 	if (rc <= 0)
 		return dev_err_probe(dev, -ENODEV,
 				     "unable to allocate irq vectors\n");
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
