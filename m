Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1D3ACA5FA7
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5LTzwPPEja8xgn0J9PUeg7CpFo/CWEXulRgaK2Iy5Q=; b=uKP5sunX5PJlAA
	tIMDIZtuv9XTCPV/z+wQGaQ5aDNqvsxZSpVXWqUE8wdOcRv33EdkU4daziZMqbleHr51gFbdNorU/
	QqOs8siSC76gGBE98Lmj6wYSXqoJo28LHoynOIU+Xenf6DobP/LLDYYLgS+P3cJg/YbJMhzvyvDQl
	OjR6Caly7x/Zw5FI77k4zuzZXJcVvoePkWjwvCPtbrsWxXmQCbPF4hfFj1kj6biC2/M8rkOqg0Ft/
	P94944MAasWqaygTGU51WaLvLHxiRVO95iyD4m/ApYz2v20xQWn2XaW/KAN8lzZSBqs4iwHmlGGIZ
	1aQKmo6TrzDR82Jf4Y/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLq-00000002o8w-3jHX;
	Tue, 29 Sep 2026 08:38:14 +0000
Received: from mail-pj2-x10.google.com ([2607:f8b0:4864:39::10])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLn-00000002o7E-0FLx
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:12 +0000
Received: by mail-pj2-x10.google.com with SMTP id d9443c01a7336-2d747eefae4so9431845ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671090; x=1791275890; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=e2GZoP5N/1WLOySvJ7fFHjVSdBdlYw3C5RB6fe4Hq+QPFJCEC47T/W6f9hPGozxuYP
         xf16R/TklELxFn8IBmuyH3fOznDMbJvx7D0WLFwlj1n/+NoL79H8beq379KOPKeak+8W
         b1R9YBU4aR8cPPrF/SD2489o6RxYMNIYdSJsDvXAILLBNUwKoNfn+6axHLYErzaMlD4r
         3wwsGNrNufX9s8U2aVD886StlIo7sUqPViLnnN2+k5hSf21vvuhTKft6+aBRgx/O1Bs4
         G9HivxrOM0VlJH2Dw4F7++6jwCHmIeBKW4uJyxDVCPx8GuJMay/HUOfu2Jl1afUn+HMr
         5lNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671090; x=1791275890;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=x1m10jHLypkP0+h67A84dwNiJ1MlYtA63hsLmYLWmC0tw5tGazyGqF6Z22Gcz2MvW0
         8KGEGmAndMqdSO3e5oh937Cxyo0xGv3kgEaYDJQJTtCUKEDh3oHgAcm2jotVWAn4U5kw
         g0ObVdV4uD1KchkBlA3ucb6wsVS4+05ndhrcjSOIPFL26Wb4oVXqcMjxODm5hwkqxbqJ
         1+fWVMEC/Tom3B+hoxWaDEmFDefhtDKlXK09k9FVNZFlJweVWVzjXOEahSMdUdUzilsV
         9yOHw0nxtm+HMnVPmZl1Ael53rprlKImP8PCsxt5MZwJlL0kIdVQnxZca8zn8NKcBcW7
         RXdA==
X-Forwarded-Encrypted: i=1; AKwUvBwzBUxrWTS/mC+6G32WdKCHwb0fwLXCRa0Sm5ZwEp9FOo/S6aLhQxPb/EdU/x3SSZgVXfo6iURMeGI1pg==@lists.infradead.org
X-Gm-Message-State: AFq9FYLu9Kt5BU4gRWsq74Wx7TpLVgS6Uy2sLHMqjfQiIR/aNlM3it14
	MARHM0C6jSOSQnSfBF0dV/ybNjLkX9EF5hG6I5H5NunTTEYbAdgVfMBT
X-Gm-Gg: AYBFou04lR/kGc6rwuFcSBVXL6EPG1HbKgchcDhBGx83KxEm7JRFrxK5PJXoSZZnS2p
	IttodqmJczbzKptNMbD6sEDlgLjsVyzE0HZkoe+sng8sCryGs4YHGik9Ji2sy7NI42TDs0gkVoF
	/3QqwvZkn+HMbgh2HbLEWSUfNRFQO1kADqWg4AvXiuYSMt0sTwVUn4eD9DmZxGnVvNik46j2Elv
	dUfif8oGEIHQTK9xhG1NqG8dy1TEkdJcCvh9Tswl/PTcGOItDMGyAivFOtQ4tYHKaNAfKDFhw1k
	0DBBivaV0lbHPtXR2yvARu0BNZteoDtYSxvxWFh9Z2u9mn6utDxycaqsCB7nTrrQSHR+F2Zev/c
	DUoxN6YE5GL+u0upFI1XWrZ65euOGnUN87YMHNXDWMWMNy/2fNy2DCQyY8nZG822AIXFIfnFtPi
	+KvNcLYmEODpZsxt6J8PGowHObMkSkH3Ckz//Hzvh+BdgI26VwUXTeAzhBfNEkKDc4oekb
X-Received: by 2002:a17:90b:538c:b0:395:8124:ac53 with SMTP id 98e67ed59e1d1-3a49c0b06cbmr995624a91.6.1790671090167;
        Tue, 29 Sep 2026 01:38:10 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a498c4b665sm1745414a91.2.2026.09.29.01.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:09 -0700 (PDT)
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
Subject: [PATCH v7 1/6] PCI: spacemit-k1: Add device data support
Date: Tue, 29 Sep 2026 16:37:47 +0800
Message-ID: <20260929083755.458238-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260929083755.458238-1-inochiama@gmail.com>
References: <20260929083755.458238-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013811_148770_EF70D9E3 
X-CRM114-Status: GOOD (  16.73  )
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

To reuse the K1 PCIe driver logic for K3 PCIe controller, add device
data to handle the K1 specific logic and make room for the incoming
logic for K3.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 0564c46e2f48..ab2953ad8f56 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -45,8 +45,17 @@
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
 
+struct k1_pcie;
+
+struct k1_pcie_device_data {
+	const struct dw_pcie_host_ops *host_ops;
+	const struct dw_pcie_ops *ops;
+	int (*parse_port)(struct k1_pcie *k1);
+};
+
 struct k1_pcie {
 	struct dw_pcie pci;
+	const struct k1_pcie_device_data *data;
 	struct phy *phy;
 	void __iomem *link;
 	struct regmap *pmu;	/* Errors ignored; MMIO-backed regmap */
@@ -274,14 +283,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODATA;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -295,11 +311,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
 				     "failed to map \"link\" registers\n");
 
 	k1->pci.dev = dev;
-	k1->pci.ops = &k1_pcie_ops;
+	k1->pci.ops = data->ops;
 	k1->pci.pp.num_vectors = MAX_MSI_IRQS;
 	dw_pcie_cap_set(&k1->pci, REQ_RES);
 
-	k1->pci.pp.ops = &k1_pcie_host_ops;
+	k1->pci.pp.ops = data->host_ops;
 
 	/* Hold the PHY in reset until we start the link */
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
@@ -316,7 +332,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -334,8 +350,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
 	dw_pcie_host_deinit(&k1->pci.pp);
 }
 
+static const struct k1_pcie_device_data k1_pcie_device_data = {
+	.host_ops	= &k1_pcie_host_ops,
+	.ops		= &k1_pcie_ops,
+	.parse_port	= k1_pcie_parse_port,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
-	{ .compatible = "spacemit,k1-pcie", },
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, k1_pcie_of_match_table);
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
