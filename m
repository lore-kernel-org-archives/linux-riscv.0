Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 954E5C624D3
	for <linux-riscv@archiver.kernel.org>; Sat,  5 Sep 2026 13:43:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1ltuLFDEdtwR0aexGTDgi3godBflijHBAKACd4xqBzA=; b=Ud6SoGD3alcwF3
	YJxY0KMBLbse62ZuZsL2YnJri/EQ7lk5DBf6WdJGX9o30jYGsaI1xsxDoguM3oTVP6fedY5fDRxN6
	sTw7wNX6cEdJRwm9JadrzVOD2LYX6GkoAghD7nPymGl8/OgzAKLMN3yvXKdN7RM/OUfwrj5uOafPP
	wFfagO0opKwo/eGPy29kGCLfSpa4PGGq5iZ6jk/pCpNr2+BINjh45ZzZpIjyKa6BZheYI3x26qQoY
	mpMCQ9jbwvPREfPbL94KCCTA0+SZqcxsDgH/lFnwg8XtvqaeD899DfsKDEVOUec3ABxBIBhHFoysG
	1DMaIm1Dy3u7UrJpHEfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qfv-000000047LA-1lrI;
	Sat, 05 Sep 2026 13:43:19 +0000
Received: from m16.mail.163.com ([220.197.31.2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2qfr-000000047Kq-34BH
	for linux-riscv@lists.infradead.org;
	Sat, 05 Sep 2026 13:43:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=LC
	ZuJst7SDdVBXbEt3I76KSCd0qK5lhyGUPoCM24VrA=; b=OyomrHCy/4HI+9pu9Z
	ajBGyF35D00FvR9W7kGjHas++wineiX6IHwwPf+psObL6lAeYmvnr6UTjFMlwXLb
	hqt1L0VxquXR7FESOaLSTNQgfjFz6WmWA33LUjvvhu9Bw+oqSPqWvWMkZhJGbwGI
	wHMEE5rrP0GJUSgsoyD4NRBKs=
Received: from localhost.localdomain (unknown [])
	by gzsmtp5 (Coremail) with SMTP id QCgvCgCnf71cHJxqOYRFQA--.53141S2;
	Sat, 05 Sep 2026 21:42:53 +0800 (CST)
From: "hpp.iscas" <hppiscas@163.com>
To: Senchuan Zhang <zhangsenchuan@eswincomputing.com>
Cc: "hpp.iscas" <hppiscas@163.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Krzysztof =?utf-8?q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Yu Ning <ningyu@eswincomputing.com>,
	Yanghui Ou <ouyanghui@eswincomputing.com>
Subject: [PATCH] PCI: eswin: Publish the platform driver's OF alias
Date: Sat,  5 Sep 2026 21:42:51 +0800
Message-ID: <20260905134251.67210-1-hppiscas@163.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CM-TRANSID: QCgvCgCnf71cHJxqOYRFQA--.53141S2
X-Coremail-Antispam: 1Uf129KBjvdXoW7JFyUtFW8CF4UAF47Kr17Wrg_yoWDurcE9r
	1DuFsrArW8GFyFkFnYvws3ZF9rAa4xZr1DWa4SyF1YvFyIgr1UXF4DZrZ0va47CryrtF9r
	Jr9FvFWrCFy7XjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7IUb89N3UUUUU==
X-CM-SenderInfo: 5kssx2xfdvqiywtou0bp/xtbCxR3fqGqcHF08KQAA3N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260905_064316_144273_2A970D7A 
X-CRM114-Status: UNSURE (   5.86  )
X-CRM114-Notice: Please train this message.
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

The ESWIN PCIe host controller is a platform driver matched through
eswin_pcie_of_match. PCIE_ESWIN is tristate, but the table is not
published for OF module autoloading.

Publish this platform-device table. Do not change the RISC-V host
initialization sequence or PCI device matching.

Fixes: b593c26d081a ("PCI: eswin: Add ESWIN PCIe Root Complex driver")
Signed-off-by: hpp.iscas <hppiscas@163.com>
---
 drivers/pci/controller/dwc/pcie-eswin.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-eswin.c b/drivers/pci/controller/dwc/pcie-eswin.c
index ce8d64f..1bb4469 100644
--- a/drivers/pci/controller/dwc/pcie-eswin.c
+++ b/drivers/pci/controller/dwc/pcie-eswin.c
@@ -388,6 +388,7 @@ static const struct of_device_id eswin_pcie_of_match[] = {
 	{ .compatible = "eswin,eic7700-pcie", .data = &eswin_eic7700_data },
 	{}
 };
+MODULE_DEVICE_TABLE(of, eswin_pcie_of_match);
 
 static struct platform_driver eswin_pcie_driver = {
 	.probe = eswin_pcie_probe,


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
