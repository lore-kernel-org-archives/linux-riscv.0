Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E462C43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzZTbM1QRTtZs7+CYQLlN10cZJR2d8oR2a9ohbCvjzU=; b=NYK4nzaARN8EIh
	tFxD2HVXQZf2lBQadtZcxXPspVs/U+CHGg3f2bi/OaqTSZwbS4+Jo1LYTUQM2Jrh95pRalZDp6MNq
	C8Z8+o6KvgByvILJEnp5/tj+SGPsYWdr/eBpw8kuZO/c8hnHS9xzaoree0LEPRpbHYVgyrpZvE7eh
	0mHDfs1nr1fKIMCQIeXvguBpK+N94BU7CO9B+UFA+2FvmXkIb+nvkNLGL4Ev8RCs+NdDXDZZk2AmQ
	HnKuCtIVqxqWtIUlPxUSMdctfkLr+Es9srmn3uK6jtVfzuTiMucn2Q8bem3pZe8A6NuoOrKDc9mB7
	eeoqEi0VH58lnwBMC4bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx0-00000000xBT-3Ovc;
	Thu, 09 Jul 2026 04:01:26 +0000
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfwy-00000000xAh-1KyV
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:25 +0000
Received: by mail-pj1-x102a.google.com with SMTP id 98e67ed59e1d1-37ff8e0ad0fso1670914a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569683; x=1784174483; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=s3u1R9tEDxMhv9GRywh30S19ksp169UgyFVlh4lqgxSO+XQ7ZSoM4C4gSqT/TDsigq
         12kSCtZ7HiZJQlNLS20NGWHMqC+3dOClT/vHN9ppGX823U6T6EkQosN5fXHibay3QAa3
         pSf9bY+xylnoeFjusXESLCtQ1GcK54EW1bLsCZrFRCsddueYroSkGkuiVrScbhFr5esf
         DHRMOPINHsBGgR2EnzcnHiKrUqjU5A1UmGfZUpgonJIiTgwAI4ihemV+LkgCJZYBASRJ
         jWeRmAlC4NbNT4SsQzltQnDxPhYEpp/7hNvHRwpCF3lfjjdDqtWE5M9w4UG7Wd+fyPXH
         hUHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569683; x=1784174483;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=cm9f/3J99O/P90XumT519FUYpgkIBks/ew94b16sKnzmKwml1POzTmmxtGYk004GM4
         vRrI9t/YBonBKKTsrV2Jzkqc+YU+TTmlDfGzxDpfwbamKj8XfkWM0vfN6c+YJN31QC0Q
         ogyjDH21zGdOye4mMhfyEcH/o+jgNt5rj1HXaFfjMAr7H/NBd/UAUcQlRiR+Y9j55Z3q
         yjnJFfJU7PFaGT6FA6+OGKhYmYd3sXEhdUYibTIM+wSk3aUFQdNMIRBnR+Loy8kj7PqY
         9HE4EISWNmvN/VrW7OBmuIbUuQMTgDykBRYCq80bsCKYICz0gvqUDhg2lFv+siVy70Bn
         jeVQ==
X-Forwarded-Encrypted: i=1; AHgh+RoxPWsMmlbY5FTNxk+X6ClGbCEuSprddweEND1eQ1kh+WKHooAeJei4Pa9OkHyQxhINdqNNM5/CzsK9lQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmlHxM6YVk58pQlMgkmk5TjF8Kfq/iV5fnX1Kq7DTMot/Xakcd
	xRHMhwZOtRQpx21f5z9z9YH98YGOpSQ7UeoFeBYfRXo5ys2Zc1J1UaFv
X-Gm-Gg: AfdE7cm0Yknleu1VoqBpr44dUDF66eIN1qdzK2UcCWnVTgQPKL2HoQUo6zlturOO5pN
	cIr9BnSQeMkXghOUzKHmxM+9kTv9g741JMovPIHDIMY2GFwjzV1XpC12hjg4dmXWgBwdSdeTAbI
	cnm51Kz3aVw4XDMEeT9eEQtQOG1zFY6AW6XNDrN/PJmjjOwIMnGspdyiPPR933lSwJCLtGt9Rxj
	ca8UjFjc5bGGO0+/GeKUAl8cVZXWhoTCQro0Lu5W+zAispq1LFieopFKEeS20MVuIjxlcufRnNh
	FIGmy/5txyttpZDnPf0wkHn1cBsKMp3O6vATedjMjJ8bS+Z71CZ19iDHaDcQ6k5K9c0f5LnxQuR
	sqPehNaQeywU2xnu3vy1nj2TNZq4CBfdUCYnV3nBKvZ5uO7TK23OYS8NetTICYBDaAM6m0d44ZH
	8=
X-Received: by 2002:a17:90b:56c8:b0:36d:66d4:270e with SMTP id 98e67ed59e1d1-38941101e99mr5534226a91.5.1783569683198;
        Wed, 08 Jul 2026 21:01:23 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38a5506b418sm423373a91.2.2026.07.08.21.01.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:22 -0700 (PDT)
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
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/6] PCI: spacemit-k1: Add device data support
Date: Thu,  9 Jul 2026 12:00:21 +0800
Message-ID: <20260709040027.958400-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210124_381558_F446AB8B 
X-CRM114-Status: GOOD (  15.95  )
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
index be20a520255b..f6ae8ff3589a 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -49,8 +49,17 @@
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
@@ -278,14 +287,21 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 
 static int k1_pcie_probe(struct platform_device *pdev)
 {
+	const struct k1_pcie_device_data *data;
 	struct device *dev = &pdev->dev;
 	struct k1_pcie *k1;
 	int ret;
 
+	data = device_get_match_data(dev);
+	if (!data)
+		return -ENODEV;
+
 	k1 = devm_kzalloc(dev, sizeof(*k1), GFP_KERNEL);
 	if (!k1)
 		return -ENOMEM;
 
+	k1->data = data;
+
 	k1->pmu = syscon_regmap_lookup_by_phandle_args(dev_of_node(dev),
 						       SYSCON_APMU, 1,
 						       &k1->pmu_off);
@@ -299,11 +315,11 @@ static int k1_pcie_probe(struct platform_device *pdev)
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
@@ -320,7 +336,7 @@ static int k1_pcie_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, k1);
 
-	ret = k1_pcie_parse_port(k1);
+	ret = data->parse_port(k1);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to parse root port\n");
 
@@ -338,8 +354,14 @@ static void k1_pcie_remove(struct platform_device *pdev)
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
+	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
 	{ }
 };
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
