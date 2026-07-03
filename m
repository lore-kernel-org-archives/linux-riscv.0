Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 420BEC43458
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bQbBW3szspuplF2WagId70Ycpenhhq3+8HnBk5uudU=; b=uR3yfCrbtn67TW
	gVTTz+WwsEoei739NA1br6JtHCJQj4sTpLQ7AGsVTv6AqsAWwey5wrx1jOlfM1OmsFMI/e4x41BvD
	UYHU2QkyOnpzU04ncvzh4gnDsKZSpepjBIEG/exu7Te3rBt3Yd1c9UcX5a+W+cHyFq2lgYtBk0vjY
	VTTT4jYeDbVTuDV7TfqYJlvddaY3klyKpwEE3dZ4ThfsSgj61YL7QYE+kxFgc8qZYnnrNVazkYtk8
	7gXDPTQ5jqYsNMqt3LGsqmIUqMhxemVitrxKx07adaAd41++8wtRNwgPbReOHQaRIz9tM1LOC+UHq
	ML7XnluvU6ZmtnH4ZB0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTD1-00000005quk-05yR;
	Fri, 03 Jul 2026 02:00:51 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCy-00000005qtF-0YaN
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:49 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so24991a12.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044047; x=1783648847; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=IR1PB0u+Dr4h7dVKq6Kxuv60jvAbdRUFmd4NjG6+j4ot6lDpkEr15dXm9yVtzOBQ6v
         SaDbEaQdrGJdWIeFCVt8M9hOIP1hEZHLiBrdQT+NNjaUf/7acaLkcqUrbdbmOAoGWjr5
         3nlEULwY3ta/0icIgnkfZQO9vA5phRrtlfgvGS82Fpc4ThSQQzuyVs89LF3naktwCLzO
         JBrohYlu5Myaq/vT6Iatwc2hM1nZ9rwtVb5J1Ct744lap/DISRJDnO6fJaZr3tgRyIYU
         m9iQRF+k4TI9+P76uniQCteK9HFSnXhZA7AVoTj8AIW9GFpAU/gaSn9K1nPuEsjkeiw7
         ZE/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044047; x=1783648847;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=SgVK3UYP+v5CjvwYRBq4NBq7cqIeCFDHNssLD6HRyvVtzSIpjfZ/eInxA1ycB4YtNQ
         2Kye6INCsVzWgBeDCWwOSKDnnZ8g1EZMu1XR7l4e2qOUcu7DDV1Z036d45KQYLJi0ZSi
         V87H7xv0ZI/BViEeifueAY2rDGsUMC3/3yoXyqvGhMtuVBMnL0oiluYo+y8yz6e30LHa
         ZZr2LXXkNbvlJsKbNSNyNB9yEBbx0ghw8rkCOtInN1Y/8GY4d+CWD9X8lQymZOT6UIN4
         vsAQej9YUZyZue3OsOncHWBPoH58X4sl2Zx/RUaxtfu7UdbSfj1Ct2iReQd1kM/Ax0iz
         IuCA==
X-Forwarded-Encrypted: i=1; AFNElJ/EEeTlrTYjA6mqVXlO56B2VjB8NeapS5RfdeRPgkdvuwyoUKL2Z+vIDCQsXMhN3xMYPQYwA3cXghT0Ow==@lists.infradead.org
X-Gm-Message-State: AOJu0YzM623YH4Lh2NKSaX5O2ediRF7Rti2JUJpCPPGelECFPRdHSzJp
	/hj/crqqTiRPoKes9GoYGC2IdvM8v2S+gjNjJcLWp7Px2B3V3E7Jel02
X-Gm-Gg: AfdE7clzTfKnwJRej6k97bAeTykySSQBK9gdpQfYdbK/sq/z9X5OzvF19KcYoZ6LnsD
	KuK8wP3FsPSiNnhztTGwE3qPi0nTDcm9XlYppH/2MOvFnQuFG4tlNl20QVP5x2bgZUSfkYMiea9
	qiDt9ILYMbaF+sQBci4CFhQjSFHrvH/yU+e3iMVOjvPy/MyqzcsOuATrNkNULL1TEM0AfPiR8MG
	nyRwwgN7QbwLb8qmmAOfbfoofrWssdlpT+RpJevIQQEWtB7+qhLTP39wbFIs/A7R44W7O+O648D
	2/S09KcxgXDlXVEBaveRO2wzFLmkm0SthnNf0kGmE3dewJ/2TqnIib1lUEWWw/tdgySlRTmn9rM
	qV5IG1YTZ0p3xMhoBYEDHK8tCfMey3QaK0J2Ge9cIq0/H/9YEAujUJZPUHKR+KuRZ5Wvq9rQIaB
	1WiUehgn5HY3I=
X-Received: by 2002:a05:6a20:c98b:b0:3bf:7e2a:e874 with SMTP id adf61e73a8af0-3bff4038a89mr8316617637.1.1783044047021;
        Thu, 02 Jul 2026 19:00:47 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8f3d74ccsm2024844a12.9.2026.07.02.19.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:46 -0700 (PDT)
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
Subject: [PATCH v3 3/6] PCI: spacemit-k1: Add device id update helper
Date: Fri,  3 Jul 2026 09:59:59 +0800
Message-ID: <20260703020003.485436-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260703020003.485436-1-inochiama@gmail.com>
References: <20260703020003.485436-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190048_184012_A5A37144 
X-CRM114-Status: GOOD (  12.95  )
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

Both K1 and K3 needs to set vendor id and device id, add a helper function
to simplify this.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/pci/controller/dwc/pcie-spacemit-k1.c b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
index e22ecbd09579..31aac056b68e 100644
--- a/drivers/pci/controller/dwc/pcie-spacemit-k1.c
+++ b/drivers/pci/controller/dwc/pcie-spacemit-k1.c
@@ -56,6 +56,7 @@ struct k1_pcie_device_data {
 	const struct dw_pcie_ops *ops;
 	int (*parse_port)(struct k1_pcie *k1);
 	unsigned int max_phy_count;
+	unsigned int device_id;
 };
 
 struct k1_pcie {
@@ -186,6 +187,16 @@ static void k1_pcie_disable_aspm_l1(struct k1_pcie *k1)
 	dw_pcie_dbi_ro_wr_dis(pci);
 }
 
+static void k1_pcie_set_device_id(struct k1_pcie *k1)
+{
+	struct dw_pcie *pci = &k1->pci;
+
+	dw_pcie_dbi_ro_wr_en(pci);
+	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
+	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, k1->data->device_id);
+	dw_pcie_dbi_ro_wr_dis(pci);
+}
+
 static int k1_pcie_init(struct dw_pcie_rp *pp)
 {
 	struct dw_pcie *pci = to_dw_pcie_from_pp(pp);
@@ -201,10 +212,7 @@ static int k1_pcie_init(struct dw_pcie_rp *pp)
 		return ret;
 
 	/* Set the PCI vendor and device ID */
-	dw_pcie_dbi_ro_wr_en(pci);
-	dw_pcie_writew_dbi(pci, PCI_VENDOR_ID, PCI_VENDOR_ID_SPACEMIT);
-	dw_pcie_writew_dbi(pci, PCI_DEVICE_ID, PCI_DEVICE_ID_SPACEMIT_K1);
-	dw_pcie_dbi_ro_wr_dis(pci);
+	k1_pcie_set_device_id(k1);
 
 	/*
 	 * Start by asserting fundamental reset (drive PERST# low).  The
@@ -406,6 +414,7 @@ static const struct k1_pcie_device_data k1_pcie_device_data = {
 	.ops		= &k1_pcie_ops,
 	.parse_port	= k1_pcie_parse_port,
 	.max_phy_count	= 1,
+	.device_id	= PCI_DEVICE_ID_SPACEMIT_K1,
 };
 
 static const struct of_device_id k1_pcie_of_match_table[] = {
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
