Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A045BC79F9E
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:26:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ewsypp1yEizQGebfTOsRUSK4A04f3aitoXuC4lqkTLM=; b=YjByJE97g8R9Er
	ya8Hb1Dz8tyNLivSWFyEZKsuyA8PrnMugmyKFd/fdyLMqLGhu8kVwtJW2J05vDOm5YriTx16/j9Mh
	Vfo5Qqxjisomrq/ge9GCPu4pGVZ6xz9X9wfNi+I86fUZYd/6PxzvOstzVQV4B0VPdQBQoCr6VH020
	D7VPZ7b9/UHsZPglZ7uKJIQ3xMBG1PUPut5V5005vuRgU3TQU37fdWist9Yc6T0LoSET1yiCP/bpJ
	1mSEVFqi5+9/0Y6Q4WeiWEFKxMpY2mohDpcnZb6zrmURYrnfHKPtrY/A0omnNiEg4/zoDObFhd/y8
	9LCLkWNfV0kX9MxXbeSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUo-00000006e6H-0BPw;
	Mon, 07 Sep 2026 11:26:42 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUl-00000006e5Z-35RP
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:40 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-cc1bcdb3c4cso2269063a12.2
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780399; x=1789385199; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=bH1ExlEVWQxmTWujKQl1Q9AiLOLO2T6BEoV02Y3u9uYCJPpyT+x++Z1HXhVzrdivjD
         +g9Q+Q9wRoQye7hhusVl1DaQ4Q9IG9xGO2Bcg0J+AdVSx1BaLIHjzRmCp7e/UfmTpeLC
         hw0IbsTXV1UYIYazAqtm2mkoK/8MJVWC6Yko1Xg3XP+A1zqvAlqUJPfnnxFCOs22odA1
         tojunJ4gksDvDscBkoAI34i1g5P7okfTAJix6RfyN8Qae7tk7T3P4pYb3Q/pBirn8Pzw
         7NwimrT9mwwb5pkXvwL/icNI4IaXTK4y4yrZon/ELqEp1NxjnV99Q9fk89U8Uv4twfLk
         kI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780399; x=1789385199;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IYNU3JutMTV98e9RCfpqkVsEuBCUrUdbqqssfR9cXXM=;
        b=epCJjiau3TYUDkQDaeSrnV9EZeBuDXuJTn4yZDpAo/wJWsbldZqo7vAnOkxaLaWEHh
         2jgvDh7uChZ8Fiexg0aZ2+CP//3J2jFVUOWf8WVKtmEW+v9EQS+d8GJl2BL8B1jk5KP4
         rmqt7SBObamnqK4NgFgLanXNs+PEBVSKrH6HTVrCeXtRydIQ8/p/EUHV60fLGHm8pgWN
         CTdmWzMZ5QFupn3Dqr8t6WXdbg9enj+DSF9opHv/zqy59twxHwVrgFCGg7MOifpOpD1I
         ryZKdjgr6EYPikCVy8PMCfKYJeOwpKWtPXc19OVf2nL8t5u3TuYPav4ajo+7FNpgDsr+
         7sgA==
X-Forwarded-Encrypted: i=1; AKwUvByPVxHktP9OII2ZRu1n41nEaL3gFmiir5zMv6EZVzlP4/5Fhj0r0GsK0AANRLJVRtnS8sN6QVgTEUQBrg==@lists.infradead.org
X-Gm-Message-State: AFuF++lxJ6XjfCLHauxmvnAm7O/FTpt81yu+iO989Vf4TRlXmjhHb5bx
	2SHIQkGQ59gqCwhFwW5MzTSezJ/zuBr31baZHFSq+ucb8J22/8bIt70D
X-Gm-Gg: AYBFou2WqfoBJRh4Vzh8nY9wDe3fHXhtn/vLcW43tAHDDj58qSax1ax9GKpIx7dn2RM
	x3IbKJmu/q5dmKsaLzw4PABr/csrd8kHCKu7lREb+QFAzGyJK0IMtED3ulsmNDpdLAoXlBCHSBl
	xUSQweuCwxUNuL7MG2wNHmYEA4RgfhAx+onr2WWIUpjIcuP1rrefHDsbXONKkph2e2A273CzX8l
	MDqo90PWKbHmQicHbHxxlytxrWl25jqBsb0Dl1F+XUcbo3sk325vt0wWpXmhXVXevHIkFI+XHyW
	NrAnDhikWtOwqQvWKnCqKBrpfghaw/IaZINZ8y/ml63ZscZy/ikA61UUQqnZryByzRtME+BMagv
	nqNOBXchZPCZ+KFS2YmUXq3A4QiVvu27JFwY8BKjkvwP3MbOQmBPTvR4UOxERXOjcgcGkVjHGI/
	5nBhFE7nddbfumPFAsiv7sHPoGe8MPKnLxOVn4
X-Received: by 2002:a17:90b:510c:b0:398:9be6:f999 with SMTP id 98e67ed59e1d1-39b262e27a9mr37011195a91.24.1788780398731;
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b2612d3f1sm19984853a91.13.2026.09.07.04.26.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:38 -0700 (PDT)
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
Subject: [PATCH v5 1/6] PCI: spacemit-k1: Add device data support
Date: Mon,  7 Sep 2026 19:26:00 +0800
Message-ID: <20260907112606.465778-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907112606.465778-1-inochiama@gmail.com>
References: <20260907112606.465778-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042639_796151_1F617EBF 
X-CRM114-Status: GOOD (  16.29  )
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
index 0564c46e2f48..9512556d4539 100644
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
