Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73B9AC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:00:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HzZTbM1QRTtZs7+CYQLlN10cZJR2d8oR2a9ohbCvjzU=; b=R5R7wsqgfXq4TL
	Rt1zwmIj1+Ztoi0l3dw2qh6RtlFtCvz/k3cWd9NrSKCQvoDpRiGbdDxbgeIuBeLRvl5l+YKuuaZRF
	XmPmjC/uCAqGOfIyS0VX0TB7kc/YXrpc6ISbJHMf2ExS6uxPjQvMXmZqaZkiRjXIgnEWxjCN70pfS
	oPKIeBm05408/moEc5/ww0NzNCGarFc6I5iVzhc/Sh31CpY/JzM+xXaN3pvw0uK6qYzMdbRXYggvu
	S3kFzq37ZYbS0bNTbp0MUewbf+qHUhVQWWr8oavUY2krYHsvqXowO9rBuu4DIRSTUw9imhBr1zJa0
	OE5ezmngHfGKOZhxUF5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCv-00000005qsa-3RYB;
	Fri, 03 Jul 2026 02:00:45 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCs-00000005qrP-3xm4
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:44 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-3811f512167so44382a91.3
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044042; x=1783648842; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=OxvydABTnSjRzAuWbkfBIxn3PVettazh9oij1kN2mKCe1OxdA9LHag+Tsri5+QTIvg
         e0CQOL5+0rvm7m3mG9Zwx05AxF2D+hkQIaYBvjKN+NDOFUGXmcdLjgHn6RqpOINMhloa
         3kSBSPe6jani/g7bcJrFfJ4mrAzULBKD8jxHiCFvgUXYcgavj7ZVdrBMpmSrRkn86kQo
         An/Z5z88w5iOEIBKzS92vJDEy+Cv0fjC1mx2roKFFMTd5JPQMMCJJRI4zMz0/UgS4mFy
         IdUMp0NkPgvZtqDOe3t7oC8QqR0grd4A/Uy3SXCUuo2GJeZfkAF4tXz9t6Vt00NKD4bh
         1snQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044042; x=1783648842;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KkWnYh3cllnXcTwBIcvBSJWZoRydH1m54nLp+o8irTo=;
        b=gNO9iOkxmCDbf2tDcjOZXzdCbN89BD+WqflHDFfckzwTFSv3vYCuJMBwJMvuWDqa3p
         10AXYtyoWY1C2QSKn5lBD+Ua9l9QxAz9hqB98dnUfAMAj6xh4fPadbNDlZtFOP92rM5n
         yEWpEFqlU0vf206F6j3G4ijN+RH5B1GcUn+UAd/LZKWtIDFt+tWQFAGzMoHoNtCQS6Ti
         f7RKj1mLGV0UwSZYIdFJG+ilzkd7Ifte6WhpJGbOxW2DF5PwBRfFhLFpzVkiaRUB7mre
         kRe/m7tSmXVvfOE3ym5bFoYkciAWzinYWrgCzjv6ebuD5NaOYWSmr4QHqAUkuM+xK/Ff
         CFCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrucCA9L9rb0hR9jTUdmHlhtLCzXAVdGqM3FQwebC1+C6mzlf9wGqZcPF8vkIjmMzIX3Uj/m7rEgf0MmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwJP8fJwdHwcATUBx9kCSenXe72VreAsDhz/hLvEKCZ66MaDjTn
	wE5NcXyY7M9GBJ1vs6CGcvj3ZYmu2KLqxadFxyxaPcVX5PMVC0MoNJ14
X-Gm-Gg: AfdE7cnN+ecgv4YoShJHWr9wz1eoZPZhGSqBPXFJ8tRXucW0zOotUtqJJ28sNbWZqRp
	18w4RUjriqqmoeS7+Zn8hXEazcBBAkrXtkJNtWxSsO/+1Rfu0+0c/fbBW6zVVZwVNbNqsojHeru
	LMLfXn+KwHFxo8JQLf6YwCpc3uhLrkKw9T4Q16/X8TfjZoLMCDvwZJDV9Tn+skWitp5TiHNNL58
	mNEYDEG9nPssPZWddMlHCWQ701CnajdpVhYN9DnF/eXWM5X8W4sWupKeZMr3L2ZnWh58Z+0zw4F
	LYeuENwl2FJ9J7uECvWK7kWun5ssevHJcfC9IjXBYNxiyT5y26VdQUQ3sPieqWSyLSOpISGKkaK
	OuEKWlK4t9+X8346IIssna9w9KJo4T4YrIXyMjnxk+2jcNOcnRsSw50X3BAKtjLQrj8J5WbZmqm
	z7dZDH8GCYk44=
X-Received: by 2002:a17:90b:2c87:b0:37f:ed7e:7e42 with SMTP id 98e67ed59e1d1-380aa0e0512mr8521066a91.14.1783044041818;
        Thu, 02 Jul 2026 19:00:41 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38127c12792sm190602a91.5.2026.07.02.19.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:41 -0700 (PDT)
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
Subject: [PATCH v3 1/6] PCI: spacemit-k1: Add device data support
Date: Fri,  3 Jul 2026 09:59:57 +0800
Message-ID: <20260703020003.485436-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190043_010272_F6E70C74 
X-CRM114-Status: GOOD (  15.73  )
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
