Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82DCBC98302
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Sep 2026 01:51:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r5LTzwPPEja8xgn0J9PUeg7CpFo/CWEXulRgaK2Iy5Q=; b=mDfaBhm1i2DHEl
	qq9aOr5TmkJAywjQBJDyO5OnjRTXuR8G8/IAtDd1/pTaIQQToYoVZlz+P4OjayJq0kTzn3m2Kz857
	0Jl5unvsvINWEV+PcIsVdUP8NMBXlbzLFvoRdFh0DcLLXCCMtva/UTKj5YcBjrzlTTrCe0tyodxWe
	Ndtg2F5i41+GpgegNHb+ZDIefyMoW5UyXK/AsNoVb12Uu4gOZKHLwj//6hPPOWanRtTz70CLqZNrO
	zkZ0DccIsq37pikKeJQn0NrPkA0SQposdScin6UPT7Dr8RmsTHQz5bkSYcXjGrGl7mhroRWJKPIbp
	A78CRMc6G/gwQTy45eGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8m-00000006t0z-2CXY;
	Wed, 23 Sep 2026 01:51:20 +0000
Received: from mail-pj2-x0e.google.com ([2607:f8b0:4864:39::e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9C8i-00000006sz8-0x2h
	for linux-riscv@lists.infradead.org;
	Wed, 23 Sep 2026 01:51:17 +0000
Received: by mail-pj2-x0e.google.com with SMTP id d9443c01a7336-2df4aa80a73so2695165ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 22 Sep 2026 18:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790128275; x=1790733075; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=IjiZxkme3bli60S8Yfo/BVlJcBZ9N6hcg1JJAXthHb2NpbL3T5rImHGJavBynE9G+e
         b3zef45+UBsMcKdfkU/T2755eOWSbebwPjiBlhx2IHkJ4r2AuklORrcPkc0+2GzrW/bJ
         abArwgWepk879Xt7d95BszdUa9qvpXX61temRiRlrgUY3YjazQ81iyvkiIuNUZM/fMod
         K2j7HTT1/FbHX9cxd5iPXiDW5yfHYJ1zvsycZdMkX3t+2UsEnarkPkc8H8RevH0vXgIt
         yvFpKpGtZPoOfaABAoZmH37ONUnziVMZousq5KGZGe9U2CzWtG8DxBOx0ygQD915s9MH
         Mmlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790128275; x=1790733075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hb0/W1AZf3MAAAZ7FNUC0CLHYr19qqSE//LGC9bNTDk=;
        b=LDlFBvqeRbBKpn6hXJQx9r53E49HuRyqWHYixh51snINp/RCs6mita+ADEE4VaykrW
         /n73CslPx4pmaotCbZiBDvh3tRA+sG8h8D3DRF2e64P6VI6NuCeFlVE4pXE3GEw+96oL
         DPo64hhNOpciP4wGAyykIvkCR6Cec9PFtWgLvohli/bTT6SbgTLHpntaZaYEXDS9Va0X
         bpitqqSj81/sPcTQDZyg6yhnPPOAXX7v6hjM2XRM+4xmIbjlLTTE+6vVKP4wTTlnyLjn
         8JON3G1IFTaGOGO/1cboBk6ZMgHK/eCEPnRf4cpJAfuZuEPNBw/wwlGOOz6DgcBSnc6v
         1W7A==
X-Forwarded-Encrypted: i=1; AKwUvByyC0S6vs36Df1qqI6osepLL3t/UUk07SBHn97w8lhuKBBtOIwHE/YupOs/iM1MeApEuGOdsqfXNNfDiQ==@lists.infradead.org
X-Gm-Message-State: AFuF++nZ42jkBbzt1v8Y1/jwX6S5DClSIF0JaxVSOXOTED9XMPr+JrY9
	Gda1lnryUf+mJsbgQYgqZzIDzCr+3tS13M6zRlIb+YuqBsmhcp/OA567
X-Gm-Gg: AYBFou31mYHyI+wNq9Bgy77cc39uTMm56fUsEuF579QVoTwg8EjbsibWW0OFpaF26jZ
	O/+ty54wDX1EnI2Xewi5re0dMedyRWjAwvo7ZDxMc+gPqhks48u+73Ho61c9ekt8+D/pLErdIhP
	g9YRlP9wpkX/A1IR+y0LqB+KjgBNmUXVIK0rpFpImtSwdcgcwi96+lwWtdsKXWOG2GIm+F+m5Wt
	ZWWzDrycTh97UQdYSI4f2eXpCy4atR/pP1dtA34d4Pv5TtrhQwLMzxG8rL2oGIsYBtcVpPTjwOW
	hzvfigHX7Bop8QYiOr39pzqOWM7uDympy34kUqy4d9+HEoSHqqMvvEr7mPGUuMscfYlBtWp3fZl
	HxZLxMCHXwqD8GDXbQvWwpWaQNhKfwCAAUYax0Gs/e+vYfbwQ4k3aOhgQoFswkG5WcLLphg3Jpx
	Hnm7PEw5LUb1fgTzAzCqCRdtSM5ART6+QCywBegdFH4aesyrg=
X-Received: by 2002:a17:902:ce08:b0:2dd:ad73:c982 with SMTP id d9443c01a7336-2df69d583b9mr11377075ad.26.1790128275555;
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a60c668sm2768035ad.78.2026.09.22.18.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 18:51:15 -0700 (PDT)
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
Subject: [PATCH v6 1/6] PCI: spacemit-k1: Add device data support
Date: Wed, 23 Sep 2026 09:50:10 +0800
Message-ID: <20260923015016.64069-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260923015016.64069-1-inochiama@gmail.com>
References: <20260923015016.64069-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_185116_269537_8FEB811C 
X-CRM114-Status: GOOD (  16.75  )
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
