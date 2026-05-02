Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F56CCFA13
	for <linux-riscv@archiver.kernel.org>; Sat,  2 May 2026 10:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6H57wmIHc6tdyXfBxpJKyJau1tu+NCbD2lW6W/4+sC0=; b=naPQZqv5USNUDs
	wOpAaucuPTitBJFW4CXuA8lqQfP5ZbGTPJxWAqR02tjn7O92PdROqPWhQp9NseJCuIRrmqHzGklVA
	I3oEoSkQo9XyvZX54OyxDETYKcS9EVFujMo2Rfm6UR1+FdLkjSBn3yEDtkvW2QwF1Q/fYZKtFFK8r
	sa8m76cp/kfoA7oeEQ+VOFDzq8Mt9HVE9vChpIhF4SkTfWbU8ZGgpDb3tRo8H3QsHI7FTagi/jftC
	js9Iq9Aj8PL1JNz59WPhos/Tp+Ij1flWHQeygVsDs8dZHlNbuoUtayPbHBX9eWNzJXjnqoEbdpwjC
	0tEc8ACZQClbpe0l/LAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7MD-00000008m6Y-0dzu;
	Sat, 02 May 2026 10:13:57 +0000
Received: from mail-pg1-x52e.google.com ([2607:f8b0:4864:20::52e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJ7MB-00000008m5c-0uar
	for linux-riscv@lists.infradead.org;
	Sat, 02 May 2026 10:13:56 +0000
Received: by mail-pg1-x52e.google.com with SMTP id 41be03b00d2f7-c736261ee8dso912193a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 02 May 2026 03:13:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777716834; x=1778321634; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr6D/Xzdn4v9rbHKlmP/r4GXGKbaNof+CbkZ0R6qh7Y=;
        b=Pr8DYC/IsE7UOicT0Gvg4vkeCSb2+k65uGtQcuEQXjiKvO+Ly1fksQmaMhfkYI0sVW
         SJ1rKpG3iJ9H3jXZHRtYqkPDcGukjLNNcC43htRRYfW4ExlDPRCEU22uboHGoiA08DkR
         o7MKpqGfp0qRisZ8r6/t742dqmA5mO/Wvb1m4ArXdA3TZGjFMIdrko6W+6XgZ1iBM6qT
         8u2oGoNkEsyO9ssqKTr9WhPlo8dYlyjFsjRxwEZJVX9pJyp0tLrLOvH6DQvi/noGr5/2
         KdWeJE3nwWWynZWyBKo+mGN5h+F2pwznQ7L0MMyPs7OF++XcI0/nmq3iI/xMX6a0jMqB
         tUKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777716834; x=1778321634;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gr6D/Xzdn4v9rbHKlmP/r4GXGKbaNof+CbkZ0R6qh7Y=;
        b=ID69yPvdIFVm4ugz4GRJPZ/VFLRJNM6e72+/Xtlehm70BUh4miUyfK9dCvNDWSGJPt
         3jxU5cZWBoFwJgr+OEuKgzKnFMkaeRxcL9bnCnXkhKdVPAL+5ci9e5K6+Fb/CSOLmP7+
         8HMWh8g8GbIq1lvwjuRMBYrWqPOu+p4RYCIQipqixapBXMEcUK0vd4TkkJ7PQHp69YN+
         hSAcMcy16e1n+FEIyrYIhTKhIOgQB9A/vmY3LPKl1t/1zFJhd8PLbigpWSy2ptk2132Q
         +NXFq0d8m8hIym22S3lh4QhIeoK0k9Cym5QT8TIlh2kfEA2PxuMU/mvdyRFEU1ju4ltS
         144g==
X-Forwarded-Encrypted: i=1; AFNElJ9n3mJs7bFcMf2VkVN7OWrClxY5zMFaD1BGbef2hYNxlagWl7TwKXnExaJHIVvWfPIFScWxYZqMlG+Yjw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzdx1ilC4QxmgDjiC/4Iq07ncISe3T3mYhQvbyVQxp+s8mgQqCz
	qxjjK3Pq++ecvUtT6XWk+oB66tAChQOSjH8BWaAuq8mSC0GwePDTEExh
X-Gm-Gg: AeBDietwgfZoWSxIHtryYVRh7vkjgVw2rt9WYiezJq4zYLtZrRFU0/cOTiiiXE3gTKD
	lHqQB5RdIemycYTrEcpS5Id2YHmPKb2G3L1rn/rPkEUSZKwqPC3ReWtyYblQgku3a4D9OsKthbt
	GJzTZq0eDUFhjzCe/YCET5DasQ8/YJ2GaL2kWVfBmEJp+0ObgHeXFPL02YVKryqDArIgZ5L9D2I
	EVBwrjtxYwI1WGnvIBijemOw1kTcMp9dQ+bm71W59u42k/WE/0dacX3LUDsrsEPYDBf/SBpfufv
	0/D6GWivc738oTqMfQ5PZYQKb8hdv+T1adOFDs3E8QIJnPnsoTNGqaXwWOezvKo3x92FsEn1Uwu
	lu89JECAna0iGlIp91Nh7V+wqRxKEjzISXhsx1+W3clWWP0BJJ46rbvjBFBIyM8tkEvTU+QrEMn
	+ALThRClCmIkHhyveI63M3UMJEElOFAePPlxNd2K2dH95/
X-Received: by 2002:a05:6a20:72a7:b0:39c:235:c5ec with SMTP id adf61e73a8af0-3a7f1d18314mr2674945637.34.1777716834197;
        Sat, 02 May 2026 03:13:54 -0700 (PDT)
Received: from localhost ([2001:19f0:8001:1b2d:5400:5ff:fefa:a95d])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515ad0049sm5842519b3a.33.2026.05.02.03.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 May 2026 03:13:53 -0700 (PDT)
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
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH 5/5] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Sat,  2 May 2026 18:13:18 +0800
Message-ID: <20260502101319.2364052-6-inochiama@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260502101319.2364052-1-inochiama@gmail.com>
References: <20260502101319.2364052-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260502_031355_263543_06DB8800 
X-CRM114-Status: GOOD (  21.67  )
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

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra link and reset control. Unlike
the PCIe controller on K1, this controller supports external MSI
interrupt controller and can use multiple phy at the same time.

Add driver to support PCIe controller on Spacemit K3 PCIe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 238 ++++++++++++++++++
 1 file changed, 238 insertions(+)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index f2a722e5edb5..fa529ac18f2d 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -23,6 +23,7 @@
 
 #define PCI_VENDOR_ID_SPACEMIT		0x201f
 #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
 
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
@@ -32,8 +33,27 @@
 #define SMLH_LINK_UP			BIT(1)
 #define RDLH_LINK_UP			BIT(12)
 
+#define INTR_STATUS				0x0010
+
 #define INTR_ENABLE				0x0014
 #define MSI_CTRL_INT			BIT(11)
+#define RDLH_LINK_UP_INT		BIT(20)
+
+#define K3_PHY_AHB_IRQSTATUS_INTX		0x0008
+
+#define K3_PHY_AHB_IRQENABLE_SET_INTX		0x000c
+#define LEG_EP_INTERRUPTS		(BIT(6) | BIT(7) | BIT(8) | BIT(9))
+
+#define K3_PHY_AHB_IRQENABLE_SET_MSI		0x0014
+/* MSI defined as BIT(11) in existing INTR_ENABLE, reusing */
+
+#define K3_ADDR_INTR_STATUS1			0x0018
+
+#define K3_ADDR_INTR_ENABLE1			0x001C
+#define MSI_INT				BIT(0)
+#define MSIX_INT			GENMASK(8, 1)
+
+#define K3_MAX_PHY_NUMBER		6
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -48,6 +68,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie {
 	struct dw_pcie pci;
@@ -263,6 +286,213 @@ static const struct dw_pcie_ops k1_pcie_ops = {
 	.stop_link	= k1_pcie_stop_link,
 };
 
+static int k3_pcie_enable_phy(struct k1_pcie *pcie)
+{
+	int i, ret;
+
+	for (i = 0; i < pcie->phy_count; i++) {
+		ret = phy_init(pcie->phy[i]);
+		if (ret)
+			goto err_phy;
+	}
+
+	return 0;
+
+err_phy:
+	while (--i >= 0)
+		phy_exit(pcie->phy[i]);
+
+	return ret;
+}
+
+static int k3_pcie_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 reset_ctrl = k1->pmu_off + PCIE_CLK_RESET_CONTROL;
+	u32 val;
+	int ret;
+
+	regmap_clear_bits(k1->pmu, reset_ctrl, LTSSM_EN);
+
+	k1_pcie_toggle_soft_reset(k1);
+
+	ret = k1_pcie_enable_resources(k1);
+	if (ret)
+		return ret;
+
+	regmap_set_bits(k1->pmu, reset_ctrl, PCIE_AUX_PWR_DET);
+	regmap_clear_bits(k1->pmu, reset_ctrl, APP_HOLD_PHY_RST);
+
+	ret = k3_pcie_enable_phy(k1);
+	if (ret)
+		return ret;
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
+	usleep_range(1000, 2000);
+	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
+
+	mdelay(PCIE_T_PVPERL_MS);
+
+	/*
+	 * Put the controller in root complex mode, and indicate that
+	 * Vaux (3.3v) is present.
+	 */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val &= ~(0xffff << 8);
+	val |= ((0x1 << 4) << 8);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	/* Set the PCI vendor and device ID */
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K3);
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	/* Finally, as a workaround, disable ASPM L1 */
+	k1_pcie_disable_aspm_l1(k1);
+
+	return 0;
+}
+
+static int k3_pcie_msi_host_init(struct dw_pcie_rp *pp)
+{
+	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
+	u32 val;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+
+	val = dw_pcie_readl_dbi(pci, COHERENCY_CONTROL_3_OFF);
+	val |= (0xf << 11);
+	dw_pcie_writel_dbi(pci, COHERENCY_CONTROL_3_OFF, val);
+
+	dw_pcie_dbi_ro_wr_dis(pci);
+
+	return 0;
+}
+
+static const struct dw_pcie_host_ops k3_pcie_host_ops = {
+	.init		= k3_pcie_init,
+	.deinit		= k1_pcie_deinit,
+	.msi_init	= k3_pcie_msi_host_init,
+};
+
+static int k3_pcie_start_link(struct dw_pcie *pci)
+{
+	struct k1_pcie *k1 = to_k1_pcie(pci);
+	u32 val;
+
+	k1_pcie_start_link(pci);
+
+	/* Enable INTx */
+	val = readl_relaxed(k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
+	val |= LEG_EP_INTERRUPTS;
+	writel_relaxed(val, k1->link + K3_PHY_AHB_IRQENABLE_SET_INTX);
+
+	/* Enable MSI/MSIX specific to K3 */
+	val = readl_relaxed(k1->link + K3_ADDR_INTR_ENABLE1);
+	val |= (MSI_INT | MSIX_INT);
+	writel_relaxed(val, k1->link + K3_ADDR_INTR_ENABLE1);
+
+	return 0;
+}
+
+static const struct dw_pcie_ops k3_pcie_ops = {
+	.link_up	= k1_pcie_link_up,
+	.start_link	= k3_pcie_start_link,
+	.stop_link	= k1_pcie_stop_link,
+};
+
+static void k3_pcie_clear_irq_status(struct k1_pcie *k1,
+				     u32 *status0, u32 *status1, u32 *status2)
+{
+	*status0 = readl_relaxed(k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	*status1 = readl_relaxed(k1->link + INTR_STATUS);
+	*status2 = readl_relaxed(k1->link + K3_ADDR_INTR_STATUS1);
+
+	writel_relaxed(*status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(*status1, k1->link + INTR_STATUS);
+	writel_relaxed(*status2, k1->link + K3_ADDR_INTR_STATUS1);
+}
+
+static int k3_pcie_parse_port(struct k1_pcie *k1)
+{
+	struct device *dev = k1->pci.dev;
+	u32 status0, status1, status2;
+	int i;
+
+	k1->phy = devm_kmalloc_array(dev, sizeof(*k1->phy),
+				     K3_MAX_PHY_NUMBER, GFP_KERNEL);
+	if (IS_ERR(k1->phy))
+		return PTR_ERR(k1->phy);
+
+	for (i = 0; i < K3_MAX_PHY_NUMBER; i++) {
+		k1->phy[i] = devm_of_phy_get_by_index(dev, dev->of_node, i);
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
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	return 0;
+}
+
+static irqreturn_t k3_pcie_irq_thread(int irq, void *data)
+{
+	struct k1_pcie *k1 = data;
+	struct dw_pcie_rp *pp = &k1->pci.pp;
+	struct device *dev = k1->pci.dev;
+	u32 status0, status1, status2;
+
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	writel_relaxed(status0, k1->link + K3_PHY_AHB_IRQSTATUS_INTX);
+	writel_relaxed(status1, k1->link + INTR_STATUS);
+	writel_relaxed(status2, k1->link + K3_ADDR_INTR_STATUS1);
+
+	if (FIELD_GET(RDLH_LINK_UP_INT, status1)) {
+		msleep(PCIE_RESET_CONFIG_WAIT_MS);
+		/* Rescan the bus to enumerate endpoint devices */
+		pci_lock_rescan_remove();
+		pci_rescan_bus(pp->bridge->bus);
+		pci_unlock_rescan_remove();
+	} else if (!status0 && !status1 && !status2)
+		dev_WARN_ONCE(dev, true,
+			      "Received unknown event. status0=0x%08x status1=0x%08x status2=0x%08x\n",
+			      status0, status1, status2);
+
+	return IRQ_HANDLED;
+}
+
+static int k3_pcie_post_init(struct k1_pcie *k1)
+{
+	struct device *dev = k1->pci.dev;
+	struct platform_device *pdev = to_platform_device(dev);
+	int irq;
+
+	irq = platform_get_irq_byname_optional(pdev, "app");
+	if (irq > 0) {
+		return devm_request_threaded_irq(dev, irq, NULL,
+						 k3_pcie_irq_thread,
+						 IRQF_ONESHOT, NULL, k1);
+	}
+
+	return 0;
+}
+
 static int k1_pcie_parse_port(struct k1_pcie *k1)
 {
 	struct device *dev = k1->pci.dev;
@@ -373,8 +603,16 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.parse_port	= k1_pcie_parse_port,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k3_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+	.post_init	= k3_pcie_post_init,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
 	{ }
 };
 
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
