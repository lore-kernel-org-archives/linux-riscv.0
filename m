Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BDC44506
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jx5PEh/vNYkmwBCq81htLrt2fU1Nt3/9yUmxy7EZGHw=; b=Oq/dNhSNRe6uvs
	1G2dnE87e8wJQqq46Ik7f6sc+qq9aTvy1oMyjKz3v1m0jVZ/s7d4RMyGvSywbezlvXzJGHVmMvtc/
	dbKqF3BovItm6Gc0wjtYxdPHsS8DvMjVPOfnR2/8wvsBSJIZtwkEP2d7m4EfpZDjS/cggNIDBoxjv
	5r1JPEQn3HodZLYwh+kHshjvoPWho15Q5F2fimHIw3GGxKLztfrBaK/zvbW95QmuU7qYnjTO2TKm1
	xEhT2/vlNKaAXgbswMBJCgqMvqO+N0yrfkRaIlNwSbHVUYFcAguMafJV+hLhpdL7pg2jVeuwcpyDW
	FTNS+4An8KRIJOvkpGiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfxC-00000000xHe-1nYA;
	Thu, 09 Jul 2026 04:01:38 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfxA-00000000xG0-0INh
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:37 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-84861fc51a5so14702b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569695; x=1784174495; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4z6AQAHmf9aogx8IP1q5n8kkbecJEDiIeqsrEqoRDzg=;
        b=JpRHupFWSZ3e5zC+s2nbTJOESCYHyX3hPafRnAAx1NoyZIYUTHMrhe+Joi0IfllxUX
         gAH1rikeqRTPCupR9Gyj0YMomjtKejobsslVAaG6Zx+DUp6nmiCKIp4f07kEBD2wrMLd
         F3RmAS+uX+LV4AWjC94TJRZSUGfpdvebIIbvRYcVDm34m/pKi2Pyv8DQcVAm1qkaLleh
         9GP6k5m2CJ9CVjIVAGsMYPsc4SCmaEmSVmOcxQHMW2fr1qfZJRnIZj9vpTsIpzk/Xctl
         8Fn13uiAAW+AQo+XaOtoC+iMNMDHDqNAPuKm7ix1gz2VG1UtKHwqf/XbSpBsrhpImKvr
         ROMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569695; x=1784174495;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4z6AQAHmf9aogx8IP1q5n8kkbecJEDiIeqsrEqoRDzg=;
        b=a0VDIaaGOnEUTf7+PW2SOSHM5KH8eAKZ0ujk4NxXNj15EchG2Kn+96qJqwoAxvBpQm
         QMT1lI6UWk1g5CibdTLuzHBkWA3kUskpVpOD0BkzTMmnJUCqR6Bhf+wJzMkN9LCZEv6+
         bZgTAw5npM1XoIF0U/vWBq8ym+/p0aDK9MASeJW2N5496qWY0IIJ4idSda3fkCXR5f84
         MFFD/OrELf+EUY4ofCoGM3IDdXZm4M37DZMQpD6ulegQanQTez+xN8PbM7Radn57vcik
         CmLMBchpMVRjjMOqSQ1RF8ZczpQdewYAPaJGQowHSH/Z8Z6rIzGSww71TmtMV9v7qYle
         UrAA==
X-Forwarded-Encrypted: i=1; AHgh+RovueN7tXWybkef8OyAhRD//gslfzCR9pTGGZ/lNpSMgIa6gRf+LEt4T70dIM7bIXY3xSTX9nwPQ0QaQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNJQLvK4yzMH6hx80aCdUFM1FF/IMxPT2l0w2Ay/Ya/BcYBFcR
	IQYwG/ougRShaHVSbrNsb1JzdN1ft13Rv2g4gPiW9TzRoTP0f0qk2Yhe
X-Gm-Gg: AfdE7ckeF5tr0BTxpkCw9m5jD8tQ2HYAARsNp/9We5YxZx+6EUdK3kvZ7Ex8lqALM2+
	oHMeIbZqJG2CXQNDq/FUGP7/vleS3OUbF5yfGV9UtcEXIvBKfW5ueOuOY58uQCk6DneOmgcyIbe
	IsGpdP/GC8LMIuV+C01b3O589d0Tq9cBsO2EtMdUktVyw08jRhe7iYKPdgpmOwCdiLNO63Se0ya
	IadXbdXXrCDaLxeEldJpkq8LlLZe7+ogI3E86Iq+NRcTt6+HxnDPODEcBAvMS9f1yHyBlEt+qNq
	vidvmn9hKD7egj2sxVHCUrtwlqAHt+i2DMNUsFYykVv9EpdZ3puuZzob03SHpvXLgHd9uRDDzL8
	ign27+qCXAyD5rbix2rOHnp/qit8s1voWQ6ERk7xrp2nWZML7MlowJX11Encs+nco84NEV7fexn
	4=
X-Received: by 2002:a05:6a00:c88:b0:82c:e9cc:f61d with SMTP id d2e1a72fcca58-84842eb7f5dmr4880962b3a.9.1783569695001;
        Wed, 08 Jul 2026 21:01:35 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6dbdc8dsm7889342b3a.55.2026.07.08.21.01.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:34 -0700 (PDT)
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
Subject: [PATCH v4 6/6] PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support
Date: Thu,  9 Jul 2026 12:00:26 +0800
Message-ID: <20260709040027.958400-7-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210136_115759_9F6E415E 
X-CRM114-Status: GOOD (  19.32  )
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
DesignWare PCIe IP with extra link and reset control. Unlike
the PCIe controller on K1, this controller supports external MSI
interrupt controller and can use multiple PHYs at the same time.

Add driver to support PCIe controller on Spacemit K3 PCIe.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 126 ++++++++++++++++++
 2 files changed, 128 insertions(+), 2 deletions(-)

diff --git a/drivers/pci/controller/dwc/Kconfig b/drivers/pci/controller/dwc/Kconfig
index aa0b784c85b4..dacbac5cc35c 100644
--- a/drivers/pci/controller/dwc/Kconfig
+++ b/drivers/pci/controller/dwc/Kconfig
@@ -440,7 +440,7 @@ config PCIE_SOPHGO_DW
 	  Sophgo SoCs.
 
 config PCIE_SPACEMIT_K1
-	tristate "SpacemiT K1 PCIe controller (host mode)"
+	tristate "SpacemiT PCIe controller (host mode)"
 	depends on ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	select PCIE_DW_HOST
@@ -448,7 +448,7 @@ config PCIE_SPACEMIT_K1
 	default ARCH_SPACEMIT
 	help
 	  Enables support for the DesignWare based PCIe controller in
-	  the SpacemiT K1 SoC operating in host mode.  Three controllers
+	  the SpacemiT SoC operating in host mode. Three controllers
 	  are available on the K1 SoC; the first of these shares a PHY
 	  with a USB 3.0 host controller (one or the other can be used).
 
diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index 31aac056b68e..680acc93f539 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -23,6 +23,7 @@
 
 #define PCI_VENDOR_ID_SPACEMIT		0x201f
 #define PCI_DEVICE_ID_SPACEMIT_K1	0x0001
+#define PCI_DEVICE_ID_SPACEMIT_K3	0x0002
 
 /* Offsets and field definitions for link management registers */
 #define K1_PHY_AHB_IRQ_EN			0x0000
@@ -32,8 +33,18 @@
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
+#define K3_ADDR_INTR_STATUS1			0x0018
+
+#define K3_CACHE_MSTR_AWCACHE_MODE	GENMASK(14, 11)
+#define K3_CACHE_MSTR_AWCACHE_BEHAVIOR	0xf
 
 /* Some controls require APMU regmap access */
 #define SYSCON_APMU			"spacemit,apmu"
@@ -48,6 +59,9 @@
 
 #define PCIE_CONTROL_LOGIC			0x0004
 #define PCIE_SOFT_RESET			BIT(0)
+#define PCIE_PERSTN_OE			BIT(24)
+#define PCIE_PERSTN_OUT			BIT(25)
+#define PCIE_IGNORE_PERSTN		BIT(31)
 
 struct k1_pcie;
 
@@ -340,6 +354,109 @@ static int k1_pcie_parse_port(struct k1_pcie *k1)
 	return ret;
 }
 
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
+	ret = k1_pcie_enable_phy(k1);
+	if (ret) {
+		k1_pcie_disable_resources(k1);
+		return ret;
+	}
+
+	/* K3: Set IGNORE_PERSTN and drive PERSTN_OE high (assert reset) */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_IGNORE_PERSTN | PCIE_PERSTN_OE | PCIE_PERSTN_OUT);
+	usleep_range(1000, 2000);
+	regmap_clear_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC, PCIE_PERSTN_OUT);
+
+	msleep(PCIE_T_PVPERL_MS);
+
+	/*
+	 * Put the controller in root complex mode, and indicate that
+	 * Vaux (3.3v) is present.
+	 */
+	regmap_set_bits(k1->pmu, k1->pmu_off + PCIE_CONTROL_LOGIC,
+			PCIE_PERSTN_OUT | PCIE_PERSTN_OE);
+
+	val = dw_pcie_readl_dbi(pci, GEN3_EQ_CONTROL_OFF);
+	val = u32_replace_bits(val, BIT(7),
+			       GEN3_EQ_CONTROL_OFF_PSET_REQ_VEC);
+	dw_pcie_writel_dbi(pci, GEN3_EQ_CONTROL_OFF, val);
+
+	k1_pcie_set_device_id(k1);
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
+	val = u32_replace_bits(val, K3_CACHE_MSTR_AWCACHE_BEHAVIOR,
+			       K3_CACHE_MSTR_AWCACHE_MODE);
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
+static const struct dw_pcie_ops k3_pcie_ops = {
+	.link_up	= k1_pcie_link_up,
+	.start_link	= k1_pcie_start_link,
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
+	u32 status0, status1, status2;
+
+	k3_pcie_clear_irq_status(k1, &status0, &status1, &status2);
+
+	return k1_pcie_parse_port(k1);
+}
+
 static int k1_pcie_probe(struct platform_device *pdev)
 {
 	const struct k1_pcie_device_data *data;
@@ -417,8 +534,17 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
+static const struct k1_pcie_device_data k3_pcie_device_data = {
+	.host_ops	= &k3_pcie_host_ops,
+	.ops		= &k3_pcie_ops,
+	.parse_port	= k3_pcie_parse_port,
+	.max_phy_count	= 6,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K3,
+};
+
 static const struct of_device_id k1_pcie_of_match_table[] = {
 	{ .compatible = "spacemit,k1-pcie", .data = &k1_pcie_device_data},
+	{ .compatible = "spacemit,k3-pcie", .data = &k3_pcie_device_data},
 	{ }
 };
 
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
