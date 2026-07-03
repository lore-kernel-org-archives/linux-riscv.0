Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6200EC43327
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:00:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wK0zgVr1730o4bU02YyCGsEJba3OY0JKYDWYZK+gXCQ=; b=VnOZHgiKIsPWfq
	qg2Cg+Uie70pPKy4sv2zTcG87n97IiNkmZ443h5p/Ogt9sn//NeXrhyT6QlDGudcKMiWW74RT8XnG
	xZqxOtCo9rdvtLBct2aEH3JwF3d6lloqHtS8UY+rWNHDbkoESfXOd71whA+wXKKXBZIvG2nqaVILD
	XyN06aVmdlli6To3cZWXeF9spq5AD93Y5gHFHl/MvQj2Bfa2MFBcxQ3k9GsMA7nz0fmFihZOFciuP
	bXMTCemixDhHbab65ra+nemK2D1AICWksao9cESnyzXHXAECJqMwT3F1IHAUZRmdbzCTAJEqWPLi9
	KwWtpSXiHb+KMwinbG7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCx-00000005qtR-3sgz;
	Fri, 03 Jul 2026 02:00:47 +0000
Received: from mail-pj1-x102e.google.com ([2607:f8b0:4864:20::102e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCv-00000005qrr-25l0
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:46 +0000
Received: by mail-pj1-x102e.google.com with SMTP id 98e67ed59e1d1-37f816d01e3so66321a91.2
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044044; x=1783648844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=eZnnoa/1c2HwCxs9Xu6zbh2vyDFpDej48Io5DSrztSgkw34Oizwx9BvlOvpZIVmxhU
         KyjlYPerYWp99BiuBiqx0IUQd4T2CJcXqhgWWuQhSiPt9q83Do1hnHixUQAfxJkskAap
         z2yp05118GZGopY+tzlbE+UgaAMS6yNTsDlLP4XkJinwER7DGrSt8KBsDdUALg8R092W
         NSl9Wq3KusRsvHEt68ivDyEtLQeQLY+vW6SppcNlezujU+yXcOaX7w0cMMGoc8EpMwpm
         EIrIH0prFsBd3wcqtNqf8S7eWuWVOLfrm8Wzp0lju3G03PgGN3fnfW2d/O16M5CIee1p
         WAUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044044; x=1783648844;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5q+pTBwamVSA/mf9LeULWykUlYzRmW8hf3toSZ8K/5w=;
        b=dDLPvSWli0pTgcSpPdJgr+OTnJd/9KfGsKNyZ8MwfaLdpJPUVgOGUY4D7g5NXcLA3q
         mILQuvbcgQupWJ3QEmZUfDaKu2b5D7ivavStdhVMhExZtKOKqmjwZt/Li/RMjpja/Mjg
         hrraRTiLSfeb7kKF7a5cwGGyNmeO7Zx14ZB60rd3pNL5Iow9bw+nwVPpr2LCgLILpEB5
         Rzv2OCgCJIxDCVecJSmLW9N1Y5XFCeraAKhXfA3vkdErylGPiSe19bamTHrSwmNEyQaO
         mGrRfMUxFr5BBa/KSvLTPKL1pncxGSNxc7E2vs+ywZYgHcxgE9bI5NF3vzuISTONsvPq
         7CSw==
X-Forwarded-Encrypted: i=1; AHgh+RpMMk2Qua4jKyStCMvcrFs1gT306DQcNs0kI8aTDAWGpxsywBaRhQwdCEg7fHqaXZIDq4dFhZlrfbnE0g==@lists.infradead.org
X-Gm-Message-State: AOJu0YxCDkvqPU02LHNyU+9MJK7HaCTJa6d2LkFQStJ26WAmeqBGDwXc
	bHTIkxMIJ1mfkk9D0f0Pd2vo0IY10LciavK0yW3S80uq7YRHDzUwbb6m
X-Gm-Gg: AfdE7cnoUsJKzFPPRC3UErEx9QMC+ardphOiSkLYCvpJocKeHP9TtAjh+81wmk+8iE5
	4Ino4EgfvvJQWiAf8KwVIiS+UcZF1qKDqu8+DZQ7oUPkrW7MW5UYKDBe/rGdrERhQhj4UbRrZWv
	6ZI4EgMEsmUHvGXplXlqZUNcS2FdBsEaMjimAAQxCwdGJU7W5Q8OE06e6ujNQWXbKtXB01z0sOB
	GZufWNReOJ/zrR4hq2C6cM8Betioe3vZ0HjOCQ5jwm4sVfa7baD8IiE2vwIAVdCnPAnZb24nvPh
	OVlJen1eTgrTWyM6HmN3CTeJxqMneBCBRUWN5rHKUx4J/bcF3sM/TKWWNxBHZjCReOuvXqZNpMY
	USuG13QfH1fYEKpjvEC+jAKmJrAM8Lew4Kd3hE/sS/oq2sYWoZ9eBYxhcMRtDvhx2BE2T5OumoK
	yul9khZdmDHO4=
X-Received: by 2002:a17:90b:3852:b0:37f:9ce3:ca94 with SMTP id 98e67ed59e1d1-380aa1fa176mr8453697a91.29.1783044044437;
        Thu, 02 Jul 2026 19:00:44 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38097d81bd9sm2627846a91.1.2026.07.02.19.00.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:44 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Fri,  3 Jul 2026 09:59:58 +0800
Message-ID: <20260703020003.485436-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190045_543656_0E9FC560 
X-CRM114-Status: GOOD (  21.86  )
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

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not support by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 70 ++++++++++++++++---
 1 file changed, 59 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index f6ae8ff3589a..e22ecbd09579 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -55,12 +55,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy **phy;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -119,6 +121,54 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	unsigned int i;
+
+	k1->phy = devm_kmalloc_array(dev, data->max_phy_count,
+				     sizeof(*k1->phy), GFP_KERNEL);
+	if (!k1->phy)
+		return -ENOMEM;
+
+	for (i = 0; i < data->max_phy_count; i++) {
+		k1->phy[i] = devm_of_phy_get_by_index(dev, node, i);
+		if (IS_ERR(k1->phy[i])) {
+			if (PTR_ERR(k1->phy[i]) == -ENODEV)
+				break;
+
+			return PTR_ERR(k1->phy[i]);
+		}
+	}
+
+	k1->phy_count = i;
+	if (k1->phy_count == 0)
+		return -EINVAL;
+
+	return 0;
+}
+
+static int k1_pcie_enable_phy(struct k1_pcie *k1)
+{
+	unsigned int i;
+	int ret;
+
+	for (i = 0; i < k1->phy_count; i++) {
+		ret = phy_init(k1->phy[i]);
+		if (ret)
+			goto err_phy;
+	}
+
+	return 0;
+
+err_phy:
+	while (i--)
+		phy_exit(k1->phy[i]);
+
+	return ret;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -174,7 +224,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = k1_pcie_enable_phy(k1);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -194,12 +244,14 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
 	struct k1_pcie *k1 = to_k1_pcie(pci);
+	int i;
 
 	/* Assert fundamental reset (drive PERST# low) */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	for (i = 0; i < k1->phy_count; i++)
+		phy_exit(k1->phy[i]);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -266,23 +318,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
 	struct device_node *root_port;
-	struct phy *phy;
+	int ret;
 
 	/* We assume only one root port */
 	root_port = of_get_next_available_child(dev_of_node(dev), NULL);
 	if (!root_port)
 		return -EINVAL;
 
-	phy = devm_of_phy_get(dev, root_port, NULL);
+	ret = k1_pcie_get_phy_handle(k1, root_port);
 
 	of_node_put(root_port);
 
-	if (IS_ERR(phy))
-		return PTR_ERR(phy);
-
-	k1->phy = phy;
-
-	return 0;
+	return ret;
 }
 
 static int k1_pcie_probe(struct platform_device *pdev)
@@ -358,6 +405,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
