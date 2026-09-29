Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B2B1CA5FA1
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnqKS3gVE3je9Fcka7c3qaEAdoXYkTMPuHzAYUZGrkg=; b=p058RcPLO1oZDS
	DnS/BwxEpTlO+aigIKq15j9M+OyjqRhx6qBnr2PZ32NvoG3d/hvsysv+XC/rGdkN+fozvIelB7Tcq
	+P6+O9BSwbUGZh4z87qmT2Y9yfjff0vXb0RTSrnbP0NzMIUfZr4qmpddmUFs2KRC36cs/5OET+O2n
	XR+25fw31Mv0JVshkDLV+nARuSz41C8cwioGF1TuKGW5h9L+eJIGWrXQlGI4pZe3kn5/jk4k8yG3P
	zM1mDh9DS4BM3GwHgBKl1ZBryYtVB781mumWc5c80BrUQ+DV7+0dTQK60GUmzlr2226mUTQ34zzG5
	Z0Y4OczYNDPOCCjbitQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLv-00000002oBW-02Np;
	Tue, 29 Sep 2026 08:38:19 +0000
Received: from mail-pz2-x11.google.com ([2607:f8b0:4864:3b::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLq-00000002o8C-1QF4
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:16 +0000
Received: by mail-pz2-x11.google.com with SMTP id 41be03b00d2f7-cc4cdc0d663so1581848a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671093; x=1791275893; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=YlEEJ/o5xORzaZKgWsfUsVZ8aBf4he/oJDgKeZIbbMsPI7ANuukgc4d4D91zXUMjFY
         DFZJspesBa4ki97sBtggbtLs5p+YuKvMgp8GVA1hh7MKO7a578DTWMQ8V+C33UvUqBJa
         S6fdvT7uCUy6Dd6zugMwGPmKcj8RP1JaezVM5mzCJWBDINTFoizf8oDCuEmfJMQe5PL0
         lTklnjem9F55Y8bqM03baJG/cWrbVD/gH20EqPDZ5RvzB/eF/n3QxqTLWaDIPE4QquK4
         ITY3KhGIclnLJfRzsQ4lZeS1eHL9i/W2dImjuvxLVjmCI7YnA0zd855Is9X1npA2Uy6z
         StAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671093; x=1791275893;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=m35p8FNItybUtCnMbwnCqcHx6goKMtkssv7O8vt1P0NAPbs99O/dDxzb1EQF23mgmn
         BIvB4M75zb3gTGyCL6ItwHaTQ7nAmKc8uzBvaVY08vMJo7rUzV9I1Vz1Zo+6Z0ALFlBN
         z/8gU4ap/kLF9OIaMbMXi5Fyw5ieN61+L4ukvAY1tzQZA+CYzStCyNNQupyPR5c6KbnI
         7BaFbORJtWGg7O9+OgzWrnlsw4D5TdfKqJDxm348IF0ez3aRDUWg4GFudewAV7xVOWHN
         rk6qzTcax9tyKGc70f78IpWbmM66/0vGQoGPDJr+XLEbSRnrcgHzCSpCETmrydcvuVkR
         VHgQ==
X-Forwarded-Encrypted: i=1; AKwUvBy8Zl/N5QsQJFCp+QpLZmwBR+kj00XtEL4v9yo7XgTmbiZ/VYlKv+Fi94ZzhlwVsMawmpaMWUeCOuOmKg==@lists.infradead.org
X-Gm-Message-State: AFuF++lFyHDzVxXJclXYovFKp3JBdYa9qVbeLZGwSeUEqOh8sQxw0BkL
	Ojs/7rTrFWoz83xKNN0ZS1PKiSleGSq2fXdVlDdrQ3XMlVdnKtWFfEFg
X-Gm-Gg: AYBFou3amDhfGdi89x6U8hrvKtWlaQ5SPPBo2gCRAtmv7HEcFj1zmee8vh0DYRyC3El
	F4h5EONVVdJHsdSCtDoeKl2KJTUwXTsK6GrYzcZ78epHpKqMsjUM45LLLX9NZtNyHMDtVtPcHhe
	58ccUSi2svJB8+Od3BZY55COUY/yR8tlnSxEojWLrdQnF4uM5Bg5zIoe4sfjBw9I7CH8btj2ZyI
	an2E6vUccuSSiTkTlM+778/gQOo/GAGMrL+QgZmDL46Iejlsht1H6DNPMvumAmRlPyN5O66OB/p
	1vep7nZMlg4TGJLAj/G4XecySVyqdrPgV+Ds2YQ+y3R+3xRN5mh+d7125JYQuH2+4RpnjufFkef
	pBaNXEwA+7FcraPAFsllS8IByI+8I8NaTcRwWOOEtel/0e/0gUFzQ2EWNvHMM1/NdGkcuLnzYjy
	Qew8eidGUCeS8IXSnod3nGGC4n6rIUyEM70dh2d4CZ88I3HX5sTpL8/qXFMTMvOwUzc0cc
X-Received: by 2002:a05:6a21:9082:b0:3de:4ff3:6b10 with SMTP id adf61e73a8af0-3de4ff36c9amr7089255637.70.1790671093419;
        Tue, 29 Sep 2026 01:38:13 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-885defd9e9dsm432299b3a.6.2026.09.29.01.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:12 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Tue, 29 Sep 2026 16:37:48 +0800
Message-ID: <20260929083755.458238-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013814_407354_63B44779 
X-CRM114-Status: GOOD (  19.99  )
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
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index ab2953ad8f56..8c4f0b09fe24 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -51,12 +51,14 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_host_ops *host_ops;
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
+	unsigned int max_phy_count;
 };
 
 struct k1_pcie {
 	struct dw_pcie pci;
 	const struct k1_pcie_device_data *data;
-	struct phy *phy;
+	struct phy_bulk_data *phys;
+	unsigned int phy_count;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
 	u32 pmu_off;
@@ -115,6 +117,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
 	clk_bulk_disable_unprepare(ARRAY_SIZE(pci->app_clks), pci->app_clks);
 }
 
+static int k1_pcie_get_phy_handle(struct k1_pcie *k1, struct device_node *node)
+{
+	const struct k1_pcie_device_data *data = k1->data;
+	struct device *dev = k1->pci.dev;
+	int count;
+
+	count = devm_of_phy_bulk_get_all(dev, node, &k1->phys);
+	if (count < 0)
+		return count;
+	if (!count)
+		return -ENOENT;
+	if (count > data->max_phy_count)
+		return -EINVAL;
+
+	k1->phy_count = count;
+
+	return 0;
+}
+
 /* FIXME: Disable ASPM L1 to avoid errors reported on some NVMe drives */
 static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 {
@@ -170,12 +191,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
-	if (ret) {
-		k1_pcie_disable_resources(k1);
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_init;
 
-		return ret;
-	}
+	ret = phy_bulk_power_on(k1->phy_count, k1->phys);
+	if (ret)
+		goto failed_phy_power_on;
 
 	/* Deassert fundamental reset (drive PERST# high) */
 	regmap_clear_bits(k1->pmu, reset_ctrl, PCIE_RC_PERST);
@@ -184,6 +206,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	k1_pcie_disable_aspm_l1(k1);
 
 	return 0;
+
+failed_phy_power_on:
+	phy_bulk_exit(k1->phy_count, k1->phys);
+failed_phy_init:
+	k1_pcie_disable_resources(k1);
+
+	return ret;
+
 }
 
 static void k1_pcie_deinit(struct dw_pcie_rp *pp)
@@ -195,7 +225,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -262,23 +293,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -354,6 +380,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
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
