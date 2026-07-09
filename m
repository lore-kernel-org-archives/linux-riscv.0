Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C20FC43458
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+bQbBW3szspuplF2WagId70Ycpenhhq3+8HnBk5uudU=; b=TPU7LI2zIuu+I8
	EwJ3njk5mSGfQyfyZkQdiC1fMbw33j7WVQ3jkCgVh5Yg0HznCBF8qcZUSQ2jSqQdbEJUgmjz7aVeA
	W0qM/e5fXIWZQVOWH1HfZOoOEiUuT65bJed9X+jsLHA+E+r4K9/OxG8nLsfXpe4I6W+Y25TgPy2UE
	sgZphQEADLBTuS7P/EilcOcksW3DsE/HWLeJuYiprMeFKok+Yn63tthmOJTzW0ZJuZseMdbRH0lrV
	W5yysk+lbbCaQOjILEVHmgY2YbM2zOE2MHh2zx+6EQVxyILq19tP+J8PfMTLqQc8ElTEK4nnE09ji
	mXqYe67JSSSRaoyCjHig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx5-00000000xDh-01mp;
	Thu, 09 Jul 2026 04:01:31 +0000
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfx3-00000000xCS-05l3
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:30 +0000
Received: by mail-pf1-x435.google.com with SMTP id d2e1a72fcca58-845ea8924a2so1557891b3a.1
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569688; x=1784174488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=MHTpotMVIgJNO3mXgszcrWDgr0fj2WrBEvM7voBOumSlmSCgTUP6ZLqxkXS+JLPTOQ
         N09ypkFIfW0PSjgh5wamCVwFa27IBwoisBTdmscaD9ZT7KS7DKfOx2Iu1IFcva/jDHeN
         rQdRPsd95p69GO3TSryuPn8+CG6P6IbYvRBjIS+Fx1vhU3M7xZ0UlEhlwqVEoHsJX+m+
         jWs4kxyDvMVPRpTeeohWYWycdT/RAyhOX5ZJ/5d957jkGCoL5woriuqMbKVgm601f/ru
         hGYbipc8c2FCwPPEhQDHS1PG8qTUGRnvvlqfQ1bo3wXlSpqgSsNc55l0T0hlHIpmwETl
         u6gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569688; x=1784174488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=7O6mnMyk+6LPMo3beQtKUpBA4veH6tNlOCZqSC3QPZs=;
        b=GA16Dwiu2UVyvdtb6iAKztyzIORW/xnTt0+5B0nkSYVeGaDXybSmYnhJxt/h1WL/z4
         aj+G8ghgSKmELpbcA7Q0pKaAuIVcLViNaP0VFAU9MAbAN0+/BitANRu4yTqN4CZI5Cil
         m6jNAX8i+HhBdZdd6HTCNhCMouV9eTyuNBfzLHngU8MK3kJ3E77HLu5J0UPSdT5TWGu4
         zEnD+WnM4NfZ25oBsqEfD/46IBamTob4jK0Q0gjrGrTvAJ2LxJWwM/kKoeVHY3eB6haH
         x6Kq6gXpii8kuygaqxsqEpeU3Qlsklq1TLhwH4LArrpBHdOIjQcMpiQEW+IXAclXqgeW
         mcjQ==
X-Forwarded-Encrypted: i=1; AHgh+RpvFpxwpwx2hFGO2fX32AUPyy7p1sRMALwD3zmLEx8izdTPLff3hVVteowdBm1gXDrf0Uq11p8DZxmgXw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwFDAtG5xaLXERzfAGAQSbm2907lJLp/RSqt+jRtMij1nBMQUIm
	a1CWMyEEOBHNOlg1mSxJGCeMsz2vaNFQeF2nQ86ufkCytMo2cfkpfWH4
X-Gm-Gg: AfdE7ckkHkzDvOw/LKlpCXFNud5sRsgl72v/ZXGVlv6xx1EbB4u1V1GQ5TczQakaYUa
	nXkATyazWUPkON/ZSZA+ODivGaSusAjth/Y20ezH2MT1O5xHA2uumPRukNfXd9wPcmaQ4JEucff
	3qy80NslVHLNO1ZkfIhLjKXRlVm1/dcB65wsSOHBGvJOTeh73Fzo9cjhvlCdklQ/gQywGQwsT1u
	3L2danIrduXmk+4UBZoalnB1eLQivzXWvYDTH0J4ufyENnrjxOHF1PP09B744Yn9XpfzN+BJcD2
	o5hiDb/+rc/0G4LyvrH7ga2yXvPLMGU/89WYHGYtTd586XLjPYcxFBoLGJ+daph7uXEIz+1zTIl
	us72qzv6aJdGNgBWUUzIDwmBdb0HWMGKfsqNxiZFQ0CaGC5O3PbgdL8menGd2hMZp
X-Received: by 2002:aa7:9067:0:b0:846:1b9:cb63 with SMTP id d2e1a72fcca58-8484356de46mr5839163b3a.62.1783569687912;
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d7a96fsm7868309b3a.46.2026.07.08.21.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:27 -0700 (PDT)
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
Subject: [PATCH v4 3/6] PCI: spacemit-k1: Add device id update helper
Date: Thu,  9 Jul 2026 12:00:23 +0800
Message-ID: <20260709040027.958400-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260709040027.958400-1-inochiama@gmail.com>
References: <20260709040027.958400-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210129_091916_3154EB68 
X-CRM114-Status: GOOD (  13.06  )
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
