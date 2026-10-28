Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02BE7606A334
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Oct 2026 03:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dH+nyGR+;
	dkim=fail reason="signature verification failed" (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=pXPt6h9D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Q2d300kMSO7nTLjB77+JzqLyqZPt/umPuMpRzzvAusg=; b=dH+nyGR+TwgMLi4excLR05fl5A
	gvK4koC6ex8llVNf9u2sMPF+SsDjK68IZ+Znlr/4hBlCzm18VO7JbPMdxtVYoUfCywEL2ljXGje7E
	3XXCs6PqMFrJ80FKoBrBOGNG/5B6MTZ1hGtQGqZThD6lX9BiuKXIDXvQZ8NRoIZZ1fkaDm7Onts/H
	k+DvM86oN5Muhn7ddcKYBHfFMpnZk4ro3VFSRo7CyIpMCI1b0d/CY64m1jL1Zz7iyH4O+KzsMp3Lo
	mFa1W8kwu0ZMTP8TycYTodMyG1i9kqUqGRbHXjxCIKovAX3CwrH+dhO2X/f36Gw0zc+/8n2t5X0ma
	4IzqwtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0s-000000069N8-0aZo;
	Wed, 28 Oct 2026 03:07:42 +0000
Received: from m16.mail.163.com ([117.135.210.5])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLu0c-000000068ig-0Npf;
	Wed, 28 Oct 2026 03:07:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=nE
	XGdJC+nnnfnf7AnSlpph3oGrheAJvtJd7pKFwHRr0=; b=pXPt6h9DTD65L8XFFv
	FHenj4yvv6zfOMSt0UAcropNQ2Vuy6ey5TGKfLnddVDEfQx1a2o8l+45u14kGY0f
	x6O2f+rzOETBMN16euOQU38LiEPYwMZXq2TffgpJOjBEE5LsIxdq6zk0DvgmRtBb
	4JqYUoxNF+BKnyy7mTu4KjLOc=
Received: from Precision-7960.. (unknown [])
	by gzga-smtp-mtada-g1-3 (Coremail) with SMTP id _____wDnVwncZuFqLzE4DA--.33198S4;
	Wed, 28 Oct 2026 11:07:11 +0800 (CST)
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
	Hans Zhang <18255117159@163.com>
Subject: [PATCH v5 10/16] PCI: dwc: qcom-ep: Use cached PCIe capability offset
Date: Wed, 28 Oct 2026 11:06:46 +0800
Message-ID: <20261028030652.2917756-11-18255117159@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261028030652.2917756-1-18255117159@163.com>
References: <20261028030652.2917756-1-18255117159@163.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CM-TRANSID: _____wDnVwncZuFqLzE4DA--.33198S4
X-Coremail-Antispam: 1Uf129KBjvJXoWxZryxZrWxGrWfGFWrKw1ftFb_yoW5XFy3pa
	90qFWYyF18Jr48Xrs2ya1DXF13W3ZxAry7Ja97K34avF9F9w17Ka1jkryftrn7GFZ7KryU
	Grs5t34xu3WayFUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEveH-UUUUU=
X-CM-SenderInfo: rpryjkyvrrlimvzbiqqrwthudrp/xtbC7B-jh2rhZt-R5QAA3R
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_200726_543506_7D2445C8 
X-CRM114-Status: GOOD (  12.02  )
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

Replace the three dw_pcie_find_capability(pci, PCI_CAP_ID_EXP) calls in
the qcom-ep driver with dw_pcie_get_pcie_cap().

qcom_pcie_perst_deassert() is the point where the controller resources
have just been enabled and DBI becomes accessible, so the offset is
looked up and cached there. Both the L0s and the L1 exit latency are
then programmed using that same cached offset instead of walking the
capability list again.

qcom_pcie_ep_icc_update() may run from the global IRQ handler, which is
requested before the PERST# IRQ. The helper performs its lookup at that
point of use, i.e. exactly where the open coded search happened before,
so this change neither adds nor moves a DBI access and does not
introduce a new race with the PERST# handler.

Signed-off-by: Hans Zhang <18255117159@163.com>
---
 drivers/pci/controller/dwc/pcie-qcom-ep.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-qcom-ep.c b/drivers/pci/controller/dwc/pcie-qcom-ep.c
index e6afdc6198acc..3e2068f3fa117 100644
--- a/drivers/pci/controller/dwc/pcie-qcom-ep.c
+++ b/drivers/pci/controller/dwc/pcie-qcom-ep.c
@@ -308,14 +308,15 @@ static void qcom_pcie_dw_write_dbi2(struct dw_pcie *pci, void __iomem *base,
 static void qcom_pcie_ep_icc_update(struct qcom_pcie_ep *pcie_ep)
 {
 	struct dw_pcie *pci = &pcie_ep->pci;
-	u32 offset, status;
+	u8 offset;
+	u32 status;
 	int speed, width;
 	int ret;
 
 	if (!pcie_ep->icc_mem)
 		return;
 
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	status = readw(pci->dbi_base + offset + PCI_EXP_LNKSTA);
 
 	speed = FIELD_GET(PCI_EXP_LNKSTA_CLS, status);
@@ -398,7 +399,8 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 {
 	struct qcom_pcie_ep *pcie_ep = to_pcie_ep(pci);
 	struct device *dev = pci->dev;
-	u32 val, offset;
+	u32 val;
+	u8 offset;
 	int ret;
 
 	ret = pm_runtime_resume_and_get(dev);
@@ -493,13 +495,12 @@ static int qcom_pcie_perst_deassert(struct dw_pcie *pci)
 	dw_pcie_dbi_ro_wr_en(pci);
 
 	/* Set the L0s Exit Latency to 2us-4us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
+	offset = dw_pcie_get_pcie_cap(pci);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L0SEL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
 
 	/* Set the L1 Exit Latency to be 32us-64 us = 0x6 */
-	offset = dw_pcie_find_capability(pci, PCI_CAP_ID_EXP);
 	val = dw_pcie_readl_dbi(pci, offset + PCI_EXP_LNKCAP);
 	FIELD_MODIFY(PCI_EXP_LNKCAP_L1EL, &val, 0x6);
 	dw_pcie_writel_dbi(pci, offset + PCI_EXP_LNKCAP, val);
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
