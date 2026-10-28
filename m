Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1932F606A31A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=nRp2cVgx;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=JIC+3XoR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7vJKDWaMINrLi25GrY57UebN24R8aNnFLnVP8lMxWr0=; b=nRp2cVgxjZ/imD1Udjva20BTO0
	5nAgAo2KengfZv1Auq6QDorjEVfJpjOru+nOL8eofH145YtkzksFO2rjKupa/+oJUk9/6PTaJbs0Z
	GSVVXuCfU1oAnMfUjuIsoFzc8tio/B/x2RWp3ZWuivp8wrki9c4olR9lNQVj22+W4Brfcj5ziGI3D
	7iyKKFN/R7hF3N9978ukFv5m8+kONXk2dK+QCnMAt0X8jFVA4zLXt4PZe1ob0gMXOpz4uszthmu6h
	Jx1g7Hf7TokIZgTNbP6/VEjh31MeSy/SKZ8dMtIrz/O7knUvRa08k4zPNUCqZW8PYhgioCMLuKxYA
	r2NFJjLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0V-000000068YU-0ac9;
	Wed, 28 Oct 2026 03:07:19 +0000
Received: from m16.mail.163.com ([220.197.31.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0S-000000068WY-3YQ2;
	Wed, 28 Oct 2026 03:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=H7
	/WiFVVM2Ct9E/WSDPj/g8wukhy3907IvTWxmVmjP8=; b=JIC+3XoR2kMfR2J5D9
	4N+FL69uSijetsI0O8w8D2AZoMtL1Jt/dnuesm2kuf2eUnlJp5EAKz1Nu2X5IVQU
	KlthXBDV+VqqhunuHfHwETE/YVqsEaiWt+aw/J++XDvj4nOzOTGsauxX7V7bddpL
	9gn5lHSqmjA4pkU4IKALE7+2c=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnD07QZuFqZiY4DA--.60713S6;
	Wed, 28 Oct 2026 11:07:01 +0800 (CST)
From: Hans Zhang <18255117159@163.com>
To: bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	jingoohan1@gmail.com
Cc: imx@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-amlogic@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-tegra@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Hans Zhang <18255117159@163.com>,
	Frank Li <Frank.Li@nxp.com>
Subject: [PATCH v5 04/16] PCI: dwc: layerscape-ep: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:40 +0800
Message-ID: <20261028030652.2917756-5-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnD07QZuFqZiY4DA--.60713S6
X-Coremail-Antispam: 1Uf129KBjvJXoW7uFyrXr45GF17AF43Cw13XFb_yoW8WF1fpF
	Z8JF1Ykr18JF4SgFnF9a1DWr13GF9xAFW7Ja97Kw1avFyav3yUG3s0yryftFn7KFZFkF1a
	v3y5tFW5uw4rAFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piLZ2-UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC6xbhhWrhZtbEBwAA3h
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200717_193796_8B83CC20 
X-CRM114-Status: GOOD (  11.77  )
X-Spam-Score: -1.8 (-)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	FROM_LOCAL_DIGITS,FROM_LOCAL_HEX,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Replace the dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls in
ls_pcie_ep_probe() and ls_pcie_ep_event_handler() with
dw_pcie_get_pcie_cap().

The probe reads the Link Capabilities register to save the values
configured by the Reset Configuration Word anyway, so the offset is
cached there. The link down event handler runs in hardirq context and
can then simply reuse the cached value instead of walking the
capability list every time the link goes down.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pci-layerscape-ep.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/pci-layerscape-ep.c b/drivers/pci/controller/dwc/pci-layerscape-ep.c
index 527c57114dcfe..113be247b01b0 100644
--- a/drivers/pci/controller/dwc/pci-layerscape-ep.c
+++ b/drivers/pci/controller/dwc/pci-layerscape-ep.c
@@ -84,7 +84,7 @@ static irqreturn_t ls_pcie_ep_event_handler(int irq, void *dev_id)
 
 	if (val & PEX_PF0_PME_MES_DR_LUD) {
 
-		offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+		offset = dw_pcie_get_pcie_cap(pci);
 
 		/*
 		 * The values of the Maximum Link Width and Supported Link
@@ -268,7 +268,7 @@ static int __init ls_pcie_ep_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, pcie);
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	pcie->lnkcap = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 
 	ret = dw_pcie_ep_init(&pci->ep);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
