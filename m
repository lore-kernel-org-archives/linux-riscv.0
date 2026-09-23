Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67F36C98309
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZnqKS3gVE3je9Fcka7c3qaEAdoXYkTMPuHzAYUZGrkg=; b=x3UPiujlBQ0cNz
	IUgXfd34YBUo2vKkGw0Mh0FgZ49DbrcA/yP1NnB+dBjwxfyGp5CLddT2RP05jKdZISw/1KrhZFbiT
	Mg0oidyqh02DRqFJfJjRjBWX9hS4TvvFQtkZiUb2ldvQUsyn+7m0unRVKrtTrAkBDByi7JCHa6UsG
	tfYkOB0umooVqrTs9a7w1uPU5expk/yIWabTtlvJVSEi2F9+60e/KjY/PchYLeHhLM9S8uLrgmVVH
	ysg9Vxd3IzZQGjWE02JcVvg4yc+KVnXp9djYhB9s/bOkXaBtoS2HgKM02jVTO1uUuvAoP2vVzNVH8
	rboKe76PDhCkdXvPghgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8m-00000006t1B-2dsl;
	Wed, 23 Sep 2026 01:51:20 +0000
Received: from mail-pj2-x11.google.com ([2607:f8b0:4864:39::11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8k-00000006t07-2bt0
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:19 +0000
Received: by mail-pj2-x11.google.com with SMTP id 98e67ed59e1d1-396ccda24afso280870a91.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128278; x=1790733078; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=lF5ed3/cTO+FTN7MSX4qjpzqlB9lB1LtMJKFkpTCiWamyLyspgjTJlzQhKxIzeBQGr
         JadOpxNZpiBw1Do0v9vsn8pP4qnOsiOY7hdcAduJDCPlrL8xHi0f3rjNrtrJOSM9DehM
         hN3caFxHCkn3UGSilQQik3NQPu9SPVtTmlUlT7DFvtIifyeVlQinsl7qnfVSPYpz9ATG
         wZrnIroCQkOKGTOXdxComteim/OiqteRQUS1Mc6HBTEbQBJjbMILy+Rf5nwa0T4iMTNp
         e+JqFG+dY1Q+D8/GeTZpUvHEJpjRDFFtMII4+QGTEGzb7tPkBxkzJbI60GZLbc0a31CE
         NZOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128278; x=1790733078;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=cWIERes12OVbNPYRqquvHTMVDdUpX3EZuxH/wCFzrNQ=;
        b=avDX7okae3YSsEOZCDEjYxHbGvsIE3eiJ0F+E3nFXJ7Jv6Eo1df3vCFOIEj9SUQz0N
         +2JHHLgDaDz+XLa25nAi0hFpbMNUOn9KmXfUb8XFMEjAgV14KuwPF2oSZimJNdls3Md7
         KmvfXVdLXtouExNyFnv5n+nH7iJIDHNsHr/R1hf0EglJXhTJOTEfOFA35XrHBeS4RvYu
         mvZy6Rf1FzFCDrx3uL+fzrRhR7UxHiJixcfw4k7+dJWLgqbR3juMlLNtkclMcoOtp6M3
         UIT8DBVD81Kqp/Mfw/E+aZnpeYMuLxByt4aZLNivMjDVhHvQpHkA9yjbRHKPzAh4wabl
         Kvpw==
X-Forwarded-Encrypted: i=1; AKwUvBxTSRNrd5B3ALL2+v/Y9tSx3RuZMMNQLpDuMvYMSlOgMQF9TjSBNXx8pcnrdoT9oVzBGnqE/CAm566kag==@lists.infradead.org
X-Gm-Message-State: AFuF++nrp8rqixFwItSB9KNkbUXGCA05+/lx4bVZcc9CZB/jOX5LXJrH
	ZxfUrtZ3rfzjP3zMUipwMRnJEsW/sMV4XEwet0WQ+03dljixY4jwkAT7
X-Gm-Gg: AYBFou1PRa5/MK3CuYFq+ztjyI2kwURGjdZHLcCTTLF+6wnbsqd45Oaj9RmqQfvL0nw
	FnrQ8Fq3kAs1F4M/sHZ2ceh0nEkrQvAmlnMrinKYN4pnd0kPubkXIdjEZ5bXZRkLh9Ypux+Wp9l
	abBthnxpQKRaPp2aT2BS9fuSKq3SV0Tzj86hZJmN8/4LOBD9/zLPC54aF9fMqz1gNUMWTiY2aR4
	en85Na/wOVQ1f/LZmmmc4v7yFGUWS2O6HQNRGZO7EuG+EJjdPygIedASVfZ9stbYD09YJA0KDVb
	IjWvvKs+6xSQsF5i2BCRt+5CPxKAd00VpgODJHdR79tOXYc8RCL6spNVKR4w1fzJ9giDAcdAI4q
	hkPGQxpQwMoirAv4ZXFKoJDh0ZcA+WVA/bxC0TCC+JXsn2hanGuOVIM/3Y2JQwGWVylQm3ngxLi
	tnwv2E+r80/aWNhjz7ZKCNfTVqENgLoYfGDE0XHkf5LPGzW2mrS6J0Bok3rg==
X-Received: by 2002:a17:90b:258b:b0:39d:f66e:1720 with SMTP id 98e67ed59e1d1-3a07e54e52fmr1026309a91.13.1790128277812;
        Tue, 22 Sep 2026 18:51:17 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07dc74977sm1959022a91.17.2026.09.22.18.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:17 -0700 (PDT)
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
	Sascha Hauer <s.hauer@pengutronix.de>,
	Vidya Sagar <vidyas@nvidia.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Randolph Lin <randolph@andestech.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Ping-Ke Shih <pkshih@realtek.com>,
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
Subject: [PATCH v6 2/6] PCI: spacemit-k1: Add multiple PHY handles support
Date: Wed, 23 Sep 2026 09:50:11 +0800
Message-ID: <20260923015016.64069-3-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185118_665975_ECE7BC86 
X-CRM114-Status: GOOD (  19.88  )
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
