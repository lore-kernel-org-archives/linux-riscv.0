Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69F1CFF60F4
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tXGzRHItFO0Pl08FpK8oR2qMtN7v29RHTI8DhVPU1j0=; b=E5Dafcfn32DlRp
	/E6PoVsaD33YzLAhMmQct/cU2SU2UN6UVmGzH+bzfflkVwJwxwdCrV+cfX9cXaB2to6+Er/Z/iqJt
	8AX5YPVATfpyYmiW3Lo4j+22KQF0CjTU/S+0TE2QgV8A/ylS/J0UK6ByGS2ppQscdHy3+8PVnCKgX
	wc8XmNvgjoA+LOrC4isnKZutFbMPvtNmA5kEvBpGIpUFXJZMWs2vtxmx7kcnMMTd2S2Fi8AMLyfzD
	GU0hWEBHmpd3o+g11aCNXo1JHQGyVz/rYBnV4UMJsWMAT2UctNuyyhPs5FyURcMulES3az5gJ2pv4
	Pqcl6oZ+pgcgDVan6uGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKx-0000000DNQi-03AP;
	Tue, 31 Mar 2026 17:57:11 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKt-0000000DNOh-3RY1
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:57:09 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowABH8GvrCsxpCP3GCw--.20050S3;
	Wed, 01 Apr 2026 01:57:00 +0800 (CST)
From: Han Gao <gaohan@iscas.ac.cn>
To: Bjorn Helgaas <bhelgaas@google.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Lukas Wunner <lukas@wunner.de>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>,
	Chen Wang <unicorn_wang@outlook.com>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: linux-pci@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Han Gao <rabenda.cn@gmail.com>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Yao Zi <me@ziyao.cc>,
	stable@vger.kernel.org
Subject: [PATCH 1/2] PCI: Add per-device flag to disable native PCIe port services
Date: Wed,  1 Apr 2026 01:56:57 +0800
Message-ID: <20260331175658.1015829-2-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABH8GvrCsxpCP3GCw--.20050S3
X-Coremail-Antispam: 1UD129KBjvJXoW7tw43CFWrXr1rKw4UAw4fXwb_yoW8AFykpF
	WvkFykKrWrKFyUWw4qy3W3Ca4rWan8ZrWSkrWUWwnxuFWayryrZF9rtFyaqrsxGFW0vFy5
	GrZxGry5CF47ZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQ2b7Iv0xC_KF4lb4IE77IF4wAFF20E14v26rWj6s0DM7CY07I2
	0VC2zVCF04k26cxKx2IYs7xG6rWj6s0DM7CIcVAFz4kK6r1j6r18M28IrcIa0xkI8VA2jI
	8067AKxVWUGwA2048vs2IY020Ec7CjxVAFwI0_Gr0_Xr1l8cAvFVAK0II2c7xJM28CjxkF
	64kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWUCVW8JwA2z4x0Y4vE2Ix0cI8IcV
	CY1x0267AKxVW8JVWxJwA2z4x0Y4vEx4A2jsIE14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE
	c7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzV
	Aqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S
	6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxw
	ACI402YVCY1x02628vn2kIc2xKxwCY1x0262kKe7AKxVW8ZVWrXwCF04k20xvY0x0EwIxG
	rwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Gr1j6F4UJbIYCTnIWIevJa73UjIFyTuYvjTRwL0rUUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiBg0DDGnL4iiZtwAAsC
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_105708_229891_E2F7EE78 
X-CRM114-Status: GOOD (  11.56  )
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

Add PCI_DEV_FLAGS_NO_PORT_SERVICES to allow quirks to prevent the PCIe
port service driver from probing specific devices. This provides a
per-device equivalent of the global pcie_ports=compat kernel parameter.

Some platforms have PCIe root ports that break MSI delivery to downstream
devices when native port services (AER, PME, bwctrl, etc.) are active.
The existing pci_host_bridge native_* flags do not cover all services
(notably bwctrl), so a mechanism to skip port driver probing entirely
on a per-device basis is needed.

Cc: stable@vger.kernel.org
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pci/pcie/portdrv.c | 3 +++
 include/linux/pci.h        | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/pci/pcie/portdrv.c b/drivers/pci/pcie/portdrv.c
index 2d6aa488fe7b..3386818d200d 100644
--- a/drivers/pci/pcie/portdrv.c
+++ b/drivers/pci/pcie/portdrv.c
@@ -685,6 +685,9 @@ static const struct dev_pm_ops pcie_portdrv_pm_ops = {
 static int pcie_portdrv_probe(struct pci_dev *dev,
 					const struct pci_device_id *id)
 {
+	if (dev->dev_flags & PCI_DEV_FLAGS_NO_PORT_SERVICES)
+		return -ENODEV;
+
 	int type = pci_pcie_type(dev);
 	int status;
 
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 1c270f1d5123..e038fe14ef78 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -253,6 +253,8 @@ enum pci_dev_flags {
 	 * integrated with the downstream devices and doesn't use real PCI.
 	 */
 	PCI_DEV_FLAGS_PCI_BRIDGE_NO_ALIAS = (__force pci_dev_flags_t) (1 << 14),
+	/* Do not use native PCIe port services (equivalent to pcie_ports=compat) */
+	PCI_DEV_FLAGS_NO_PORT_SERVICES = (__force pci_dev_flags_t) (1 << 15),
 };
 
 enum pci_irq_reroute_variant {
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
