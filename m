Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 414BD10F92E6
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 17:57:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yDDnUYebovZozKGybHAAFjwQe6doPA+MuhnqXiwT0Nc=; b=wfXFeXUn4w54Gz
	9Ij0MTRtAuQh3tc2p1bh26ftHpOc103xpQsqkelObgzoUdPU2skNB/aHh5PwfjofEff7/OeJE91T9
	K9dg3OibmDkjRt5+rCMgBv6puLbmquxKClbOuL01EurIOI2c91JUiuQzAf7Xf/qqtdI4pkAjhiWp+
	8a1SyrvL4FEdt5kaD5qdnlERUry9sQpHFDDHn4JRlp9ZluX2o+7HjEYWn1P2zkSiU8mv/JeXAJzjn
	xxq+EOM6cLxHW/T7ucwWazG1oiwWq5yD5lPjhNCqtmhVJPxiaWIrwksk51JlgSglhBhdCsi1/kGhq
	7plWxAWyOQT9cNwpGlMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKz-0000000DNRV-1KWy;
	Tue, 31 Mar 2026 17:57:13 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7dKt-0000000DNOk-47ab
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 17:57:09 +0000
Received: from localhost.localdomain (unknown [223.166.95.230])
	by APP-01 (Coremail) with SMTP id qwCowABH8GvrCsxpCP3GCw--.20050S4;
	Wed, 01 Apr 2026 01:57:01 +0800 (CST)
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
Subject: [PATCH 2/2] PCI: Add quirk to disable PCIe port services on Sophgo SG2042
Date: Wed,  1 Apr 2026 01:56:58 +0800
Message-ID: <20260331175658.1015829-3-gaohan@iscas.ac.cn>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
References: <20260331175658.1015829-1-gaohan@iscas.ac.cn>
MIME-Version: 1.0
X-CM-TRANSID: qwCowABH8GvrCsxpCP3GCw--.20050S4
X-Coremail-Antispam: 1UD129KBjvJXoWxJr4fXw1rAr17XrykAr48tFb_yoW8uw17pF
	s8GF9ayr4FgFyUGw4kZw1kuF9xua1vy34FkrZ3Wa9IvF1ay3s5XFsrtr9IyF47WFsrXFW5
	Xwn8Cws8Wa4DWFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUmI14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2048vs2IY020E87I2jVAFwI0_Jryl82xGYIkIc2
	x26xkF7I0E14v26ryj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0
	Y4vE2Ix0cI8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM2
	8EF7xvwVC2z280aVAFwI0_Cr0_Gr1UM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr0_Cr1U
	M2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xIIjx
	v20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr1l
	F7xvr2IYc2Ij64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2
	IY04v7MxkF7I0En4kS14v26r4a6rW5MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY
	6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17
	CEb7AF67AKxVW8ZVWrXwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF
	0xvE2Ix0cI8IcVCY1x0267AKxVWxJVW8Jr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1xMI
	IF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJbIYCTnI
	WIevJa73UjIFyTuYvjTRNiSHDUUUU
X-Originating-IP: [223.166.95.230]
X-CM-SenderInfo: xjdrxt3q6l2u1dvotugofq/1tbiDAgDDGnL4tWXegAAsz
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_105708_380946_79386642 
X-CRM114-Status: UNSURE (   7.12  )
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

SG2042's PCIe root ports [1f1c:2042] fail to deliver MSI interrupts to
downstream devices when native port services are enabled. Devices under
an affected root port receive zero interrupts despite successful vector
allocation, causing driver timeouts (e.g. amdgpu fence fallback timer
expired on all rings).

Set PCI_DEV_FLAGS_NO_PORT_SERVICES on SG2042 root ports to prevent the
port service driver from probing, restoring correct MSI delivery.

Fixes: 1c72774df028 ("PCI: sg2042: Add Sophgo SG2042 PCIe driver")
Cc: stable@vger.kernel.org
Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
---
 drivers/pci/quirks.c    | 12 ++++++++++++
 include/linux/pci_ids.h |  2 ++
 2 files changed, 14 insertions(+)

diff --git a/drivers/pci/quirks.c b/drivers/pci/quirks.c
index 48946cca4be7..bbde482ff7cb 100644
--- a/drivers/pci/quirks.c
+++ b/drivers/pci/quirks.c
@@ -6380,3 +6380,15 @@ static void pci_mask_replay_timer_timeout(struct pci_dev *pdev)
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9750, pci_mask_replay_timer_timeout);
 DECLARE_PCI_FIXUP_FINAL(PCI_VENDOR_ID_GLI, 0x9755, pci_mask_replay_timer_timeout);
 #endif
+
+/*
+ * SG2042's PCIe root ports do not correctly deliver MSI interrupts to
+ * downstream devices when native PCIe port services are enabled. All
+ * services including bwctrl must be disabled, equivalent to pcie_ports=compat.
+ */
+static void quirk_sg2042_no_port_services(struct pci_dev *dev)
+{
+	pci_info(dev, "SG2042: disabling native PCIe port services\n");
+	dev->dev_flags |= PCI_DEV_FLAGS_NO_PORT_SERVICES;
+}
+DECLARE_PCI_FIXUP_EARLY(PCI_VENDOR_ID_SOPHGO, 0x2042, quirk_sg2042_no_port_services);
diff --git a/include/linux/pci_ids.h b/include/linux/pci_ids.h
index 406abf629be2..9663be526dd0 100644
--- a/include/linux/pci_ids.h
+++ b/include/linux/pci_ids.h
@@ -2630,6 +2630,8 @@
 
 #define PCI_VENDOR_ID_CXL		0x1e98
 
+#define PCI_VENDOR_ID_SOPHGO		0x1f1c
+
 #define PCI_VENDOR_ID_TEHUTI		0x1fc9
 #define PCI_DEVICE_ID_TEHUTI_3009	0x3009
 #define PCI_DEVICE_ID_TEHUTI_3010	0x3010
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
