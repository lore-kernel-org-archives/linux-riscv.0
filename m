Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63D9DC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:26:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KW6w/PNN3qMHH33acBZEP3uKLxFqRkHHILf3aC3+ytA=; b=EigrqJTOSFCVZQ
	ZrryyahCPBQsJxj7MDTZZIjxUsClxhN/bypNkX895g4Sn9g6wRy4h4dqBnpCE1QdaohfQtPqaclWL
	qNHLMVh3Zc6grz4/7ikYIaV5j1Mxais6v9oguHM3sdoIW6S8+lOfyDheZvC1ysbqXbqDS9WOna+PB
	tVd1/e427rfq0XyCp4LKf9sEKAUEBDJ2Ll9LM9/0mS5pCfbHFzzS/g+fxRKtyqufa8abCszMHTBRl
	Bz5NftcFGyeOgKM6yq0E3z56Cj9N0aYZ41M7aH340ivjHlNihWz+bzg9vIbiSQRBIKzHXoWVlbLQy
	/FteTj/Vg26Gq1zTxMag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUr-00000006e7r-0YMd;
	Mon, 07 Sep 2026 11:26:45 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUo-00000006e6K-2DMx
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:43 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so4130362a91.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780402; x=1789385202; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Rc3uyG1Btuax47jaWosPyczOcgqdfqJHPv/7lDCZEAM=;
        b=ThCRu5g6RXg+RPjKrPrOXRMkk1DJB8BwWQkCoDn+xdgJqsvNKnL2evJGD1HJqmGw4N
         L5Oso2c1JkIefn916SysxZBzCZNpd5gTTYvqJjEm9uq2e+MLGIQzi07e2h5aorcIB8em
         IKSAc9e7pqs+uvXdCcRANAh2WdXdP2DzCAgCJ426GXK036G4OZpVYKOUEI+tEWi8xaOi
         vi/nwvv6CfdQWC9uG9LSl2/XGaCkFi9gaVqcoKGIAHh7+tx/W15EaaUzt82Jeknf/dW2
         bc2VtyfyNp9DMN7fpwdCt0L3n5Pbts9QpinJEpR0rtK/Cd0LlRU/50axrAT2kzU1enK4
         ZYgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780402; x=1789385202;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Rc3uyG1Btuax47jaWosPyczOcgqdfqJHPv/7lDCZEAM=;
        b=ADe4fYuffw89mjmnJdoJ8J0FT8g8Sp05/+Nqyg9yDzU7dB8Zum4keTr/kBX856YIn8
         M0iJV/RlMi6WcjC81EhhU4CBYEJtGQGM8TUB+w91rCgBGBN2MQecpNCxAuu/9eWwzLF6
         CUZ1O/aVj02435OH42m82ThlTr+0cN/Dl1LmBpJb5wfQhaDElnQZeA/82KM0bg9L8nnY
         ocKOwtFTXt1YdiRybgKsH1dDsLBQA8/IztOtbuZu035vALyQ9od3QgYw3GC95h2o/pyA
         uGK3gMrGaZmgbEyLaZKjRky3FTFdQF8ReOejwJR6DQhgJidl3IGCTCzlHS/w0F2gM6iC
         /8mA==
X-Forwarded-Encrypted: i=1; AKwUvBwgJS12GeTAbkKRdzg55EA2/Gi1wR99OpHxDw62jNkBVNX+fGcU9ClQQznNDeSkEqAQnxbpZR4XluSrjw==@lists.infradead.org
X-Gm-Message-State: AFuF++myVn9PXnGz3BT3gRMTvRdSem8syb5/g9+03jNNQwgFjdx1sVnx
	6WFICMLbmxbk1seSEI4Tjk2Em9ho0QaXhSIuTv3z09HXUwDqD/hHsmxY
X-Gm-Gg: AYBFou2JPtGThfz/ogdgI10X46qX9zji2NfviAeXBxujTmMIb5kNiT/4oUonccAHSO2
	1/6sToCtGvxyAXm8f2mZF56czZiKC0IQgOoDCbzYukpBqr//hXShr/7a92TVjYuo7GXSpaeMB+Y
	Gkr5ew8mfi/yvRzIIY65jnsZp9xQHtA3GJqmFEjSn8Xy0i+9Snnq/+jWnY2J1iuG8JwJ1TtwQ4R
	Gbytjmx92ekfnDBKf8DkKK5wBNt6/yJMbt18reCIsN5ZLrqz7v4pXF3mEKmi1Th92jaUgPeBEF5
	3RATPeKN4v/YoJrbgb0M0Ir1iPZ5aKHhen7rj6o0tsHf+euM9fq+jPGTP1gZ96ZNJ6SLTejfKOG
	dsdeJTQYngcYZDT4a+WbT/MoX2+avngdoIx8cq0+fUB3GhxM+BS0b8D+8l7/Y8FHl1m1YMK62LM
	tyyntiuMhklYZzxwk1HDCuZBRA8XboRfP8FGePjW29rvzv94g=
X-Received: by 2002:a17:90b:17cf:b0:398:9be8:ea6a with SMTP id 98e67ed59e1d1-39b26216cf7mr33136274a91.23.1788780401528;
        Mon, 07 Sep 2026 04:26:41 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08cacba5sm27707027a91.12.2026.09.07.04.26.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:41 -0700 (PDT)
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
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Mon,  7 Sep 2026 19:26:01 +0800
Message-ID: <20260907112606.465778-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042642_583958_76F3E1DC 
X-CRM114-Status: GOOD (  19.61  )
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
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 37 +++++++++++++------
 1 file changed, 26 insertions(+), 11 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 9512556d4539..1049391beee8 100644
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
@@ -115,6 +117,23 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
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
+	if (count == 0 || count > data->max_phy_count)
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
@@ -170,7 +189,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 	 */
 	regmap_set_bits(k1->pmu, reset_ctrl, DEVICE_TYPE_RC | PCIE_AUX_PWR_DET);
 
-	ret = phy_init(k1->phy);
+	ret = phy_bulk_init(k1->phy_count, k1->phys);
 	if (ret) {
 		k1_pcie_disable_resources(k1);
 
@@ -195,7 +214,7 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -262,23 +281,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -354,6 +368,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
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
