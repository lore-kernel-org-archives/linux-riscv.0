Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E3CC606A338
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Nov 2026 04:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=szvZbmkH;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DnuQY2mv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=OhOl6SrzjJRbtab3z85eQb102fPPH4UVx6HwUryJrzU=; b=szvZbmkHi62nmG6y043JCqqd8F
	TQobrVLjtLNC7YdxiliOK4aCkcLsjCz4MsxR/kJCzgZ4FJPWg3lTUwfdA/tgTXKo/G4NwTkqEn1ac
	S/+D6AZCs7sbIzuKC5kr9p7ZLFerpPcPv5d/QPjCJ7fGfYB9s9iFfhis/CaQMQR5OcMATqMy0nE2V
	rCesMMgjrV2O6qA6MmoMHwD0a+3ARiQxLmnKsmBnELjAsJSXVZzrB37p7AW7Pqcv91m23GopP6UGE
	3/VL/IU0oDKHKOy2m6izQH2PoOegxosNOypr78Bo7Fy5qQbLbMvL5sN5UV0yMej7pF8To1E1192A7
	DBhXVgUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Q4-00000008N9v-0GZr;
	Wed, 25 Nov 2026 04:15:44 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xW4Q0-00000008N8O-2afd
	for linux-riscv@lists.infradead.org;
	Wed, 25 Nov 2026 04:15:43 +0000
Received: by mail-pj1-x1033.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso3276173a91.1
        for <linux-riscv@lists.infradead.org>; Tue, 24 Nov 2026 20:15:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795580140; x=1796184940; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=DnuQY2mvrgW/EvenboP8s8fQHEyfjVLSTj/4tGrY5CfLZTA2BkjJzPHnpXsSDQIvJe
         N2MHka2s/u8mHO056c3hWf1b/Yph4vCGUpDmwKoPCHs6Boh8/dEc/pOkUr+rteWlDiS3
         utuE8bx40eD+vJp2WJ1EoHqIyDyTakqkfWSEQFNwJq78/FEI8ZlDn5ALPEppUcEy/UlT
         YFukkoMKUBfgVobcWUtxIO2SMnrzsyT3lRs5wAuev3QdbwfGgZ+qTIGSgTX2aNyGcyMd
         YnWRXV2olZdhx7+z7uk7m9bVpO3yv9aa4Fy//dfec9Rv3X4ASdMNirDeV9djWaHTShqU
         i4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795580140; x=1796184940;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+lnP5N8d/GW3QDCKYsZCJCZ0aJwXzBKVnMHodRhbiOc=;
        b=DSxk6cJgfMQUknXMvqhEeG4K1u/ZNHZlW6tvJAcdPNEal3egH172FYpAHkm0/3jlLH
         F719thGyA8brsVix2WKzFUhcP+Ir4e5ILTLapBMMSSJI8gCAWRDwx3ZCgFZGoSyCHU8M
         Acpb1x8jRq/ly8CTn6PHpH4njK7M+pX78fP4luxXOGIqRusL/YegkTgU4CocAiG/50nY
         roEAli4r0D8Kw4LW8YwXuO6w+UBQUlkYlKbb0U+h1qf1qOk+/jN3XqmQt8qLwQr4sxYf
         f6dGosHwVs9bvGBKM/fOLWeBEdeHIVPPYr7Q7bq0ZqbzpHAkYq1SrkB0cyKhMB3g7RxP
         0EGg==
X-Forwarded-Encrypted: i=1; AL+hErFQePJdm3ToroO3k/4Rs1AIDT2Dj3JqlgPNDubcUxrmD/4/JOdfp5y6vNWKNge5OHXh0yjCn3CDXOX47w==@lists.infradead.org
X-Gm-Message-State: APuU4Z/bvDcKxhXWxBkccP6zPneqaIVpj5JBiyMUbBAU6bw8sOGSI284
	Aply4Q7FO/IOCKPfTQ71GnkcSiQ5TYKUQG8xKSSUJ+YRzBy8cGn4k1To
X-Gm-Gg: AZFdTZdYD+Ka2suczVpWjhM4VaRsWDOeIh8l7KXvH2fqmykTL5II47HJ5LG/xrKXLwy
	LRIosrtj/VX1CfoU6PRn5D1L5i02DgLrsH+zq1wEYvHhAvdT6LBWz8oIl8U84UMHSALMB2rdlBK
	yIVusvwNekiFOtwGHNQW9FHWzW8nc+jjIVwX+RiEoAMUYnvDtBCJAy8ugn2ssd3tYDbvygfvSrg
	+b//4slVaSnn9vmvltYlQjMOf+WOFJdGMElPfdzRs4QUBoEVVHAuT3NRq9jUztIguNHGx02J3md
	IgovZ7qcqzaaGsFlmDieqo89SZRV5Q6X6YxJBxE+yBnqu5hiEWYtfkRaTNZwBSJSL8vtZgu1eZ4
	MPxv7zSdVas9wLVhte29K9e0vPQkrgJ5U81yTAjB4d5d+IOYK8WYZfLko9NtpcWdTN1jILgEVbF
	2hZCpjeZdyrNe2MugTcse/TszaapYPUR5g8cOzfqQpg4L8MlI3e5boa6qF4DiYiXi5jZKcpkv/Z
	dJnVsrc3Di+5SoLRe1qCkyr1Tqr9xWAnv1N04Mu9PEZpDhGDjgd//HykaHlVxtq8l3fArnlZfnf
	xnxQm03g+vW7tY57qRrrvP6NaPE=
X-Received: by 2002:a17:90b:2f8c:b0:3ac:9c37:9426 with SMTP id 98e67ed59e1d1-3b41c92a2c1mr16021471a91.31.1795580139611;
        Tue, 24 Nov 2026 20:15:39 -0800 (PST)
Received: from localhost ([2001:19f0:8000:4ce8:5400:7ff:fe0e:e6b2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41aab4729sm25258203a91.0.2026.11.24.20.15.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 20:15:38 -0800 (PST)
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
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Sherry Sun <sherry.sun@nxp.com>,
	Niklas Cassel <cassel@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	LECOINTRE Philippe <philippe.lecointre@thalesgroup.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vladimir Oltean <vladimir.oltean@nxp.com>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>,
	Alex Elder <elder@riscstar.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>
Subject: [PATCH v8 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Wed, 25 Nov 2026 12:15:16 +0800
Message-ID: <20261125041523.242588-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125041523.242588-1-inochiama@gmail.com>
References: <20261125041523.242588-1-inochiama@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_201541_998403_B62AB95C 
X-CRM114-Status: GOOD (  19.70  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The PCIe controller on Spacemit K3 may use multiple PHYs at the
same time. The feature is not supported by the current driver.
So extend the PHY definition to support multiple PHY handles.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Aurelien Jarno <aurelien@aurel32.net>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 57 ++++++++++++++-----
 1 file changed, 42 insertions(+), 15 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 658ad2fa87b2..8a3cae32609f 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -54,12 +54,14 @@ struct k1_pcie_device_data {
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
@@ -118,6 +120,25 @@ static void k1_pcie_disable_resources(struct k1_pcie *k1)
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
@@ -173,12 +194,13 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -187,6 +209,14 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
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
@@ -198,7 +228,8 @@ static void k1_pcie_deinit(struct dw_pcie_rp *pp)
 	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CLK_RESET_CONTROL,
 			PCIE_RC_PERST);
 
-	phy_exit(k1->phy);
+	phy_bulk_power_off(k1->phy_count, k1->phys);
+	phy_bulk_exit(k1->phy_count, k1->phys);
 
 	k1_pcie_disable_resources(k1);
 }
@@ -265,23 +296,18 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
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
@@ -357,6 +383,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.host_ops	= &k1_pcie_host_ops,
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
+	.max_phy_count	= 1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.56.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
