Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0A28EA4FD7
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 15:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KtGeIdE5kJuOH0zvAT59tr2F00snD27sjIzcyx8wk9Y=; b=qPXbEePpwoJL33
	GZYy4vOJuNdIterujfldqXgJHfxJDboic6ac0MfeFqZjBnm78lpH1H0jIASM/TF7BLiUvdwWYY/hz
	6TrAOB2yTMzk3Q213Xef0rVn0UcEtlC7VeoHlK2mjk/ZVRNQlFsIwJ224/u/D2mZ8sOQHd0lLd5GE
	CBuxZvwzWsbN3fdX2XhOmwAV6BW6eWMJVjm/phIcQzMsXjDBjAQfnRCdHQe7CRV3bLaX3pXjW0t0O
	6qPETiJlKbmlLgq7+NvQf0c2ewqe1sETdtpvZuYMm+stnIRcmj4NLmE+wQG6uFDsLv8ggPzoX8JrS
	FGQCW/P/09IHAOKhmpFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXuw-00000000Zyq-03Fl;
	Mon, 23 Feb 2026 15:32:14 +0000
Received: from mail-m49216.qiye.163.com ([45.254.49.216])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXut-00000000Zxe-0NKt;
	Mon, 23 Feb 2026 15:32:12 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b37f77f;
	Mon, 23 Feb 2026 23:31:55 +0800 (GMT+08:00)
From: Shawn Lin <shawn.lin@rock-chips.com>
To: Bjorn Helgaas <bhelgaas@google.com>,
	"Vaibhaav Ram T . L" <vaibhaavram.tl@microchip.com>,
	Kumaravel Thiagarajan <kumaravel.thiagarajan@microchip.com>,
	Even Xu <even.xu@intel.com>,
	Xinpeng Sun <xinpeng.sun@intel.com>,
	Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
	Jiri Kosina <jikos@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Zhou Wang <wangzhou1@hisilicon.com>,
	Longfang Liu <liulongfang@huawei.com>,
	Vinod Koul <vkoul@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Jijie Shao <shaojijie@huawei.com>,
	Jian Shen <shenjian15@huawei.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Oded Gabbay <ogabbay@kernel.org>,
	Maciej Falkowski <maciej.falkowski@linux.intel.com>,
	Karol Wachowski <karol.wachowski@linux.intel.com>,
	Min Ma <mamin506@gmail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Andreas Noever <andreas.noever@gmail.com>,
	Mika Westerberg <westeri@kernel.org>,
	Tomasz Jeznach <tjeznach@rivosinc.com>,
	Will Deacon <will@kernel.org>,
	Xinliang Liu <xinliang.liu@linaro.org>,
	Tian Tao <tiantao6@hisilicon.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Antoine Tenart <atenart@kernel.org>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Raag Jadav <raag.jadav@intel.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Andy Shevchenko <andy@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	Robert Richter <rric@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Nirmal Patel <nirmal.patel@linux.intel.com>,
	Kurt Schwemmer <kurt.schwemmer@microsemi.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Ulf Hansson <ulf.hansson@linaro.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Benjamin Tissoires <bentiss@kernel.org>,
	linux-input@vger.kernel.org,
	linux-i3c@lists.infradead.org,
	dmaengine@vger.kernel.org,
	Philipp Stanner <phasta@kernel.org>,
	netdev@vger.kernel.org,
	nic_swsd@realtek.com,
	linux-arm-msm@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-usb@vger.kernel.org,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-cxl@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-serial@vger.kernel.org,
	mhi@lists.linux.dev,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Jan Dabros <jsd@semihalf.com>,
	linux-i2c@vger.kernel.org,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	linux-spi@vger.kernel.org,
	Jonathan Derrick <jonathan.derrick@linux.dev>,
	linux-pci@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	linux-media@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	Shawn Lin <shawn.lin@rock-chips.com>
Subject: [PATCH 01/37] PCI/MSI: Add Devres managed IRQ vectors allocation
Date: Mon, 23 Feb 2026 23:29:40 +0800
Message-Id: <1771860581-82092-2-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
References: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-HM-Tid: 0a9c8b20e63209cckunm6946b3c7986369
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5JGFYdQhpNQ0tOHx8aQhpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZS1VLVUtVS1kG
DKIM-Signature: a=rsa-sha256;
	b=hesEBWpuUfkngcgz1f2Ig1nlGmmzRwW4WQwqVSHNJo/8mDrQHyi2jBXfpRejbQ5213Bi/x3y5ZKsO4yPdU29saCaBfjZuhiQPZrXuFi/nfbjzR0kpb+gL5Eft5gNlVXtMsgoBjIOykghNIgFG4xZvqITu8wqjNed5lf17v/+SjU=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=j3H95hgVRLs6dldnhhXVuqSGrPI2yynu10KTCXrGKLk=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_073211_326926_C9266795 
X-CRM114-Status: GOOD (  10.94  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

pcim_alloc_irq_vectors() and pcim_alloc_irq_vectors_affinity() are created for
pci device drivers which rely on the devres machinery to help cleanup the IRQ
vectors.

Signed-off-by: Shawn Lin <shawn.lin@rock-chips.com>
---

 drivers/pci/msi/api.c | 26 ++++++++++++++++++++++++++
 include/linux/pci.h   | 22 ++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/drivers/pci/msi/api.c b/drivers/pci/msi/api.c
index c18559b..2362fca 100644
--- a/drivers/pci/msi/api.c
+++ b/drivers/pci/msi/api.c
@@ -297,6 +297,32 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 EXPORT_SYMBOL(pci_alloc_irq_vectors_affinity);
 
 /**
+ * pcim_alloc_irq_vectors() - devres managed pci_alloc_irq_vectors()
+ * Interrupt vectors are automatically freed by the devres machinery
+ */
+int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+			   unsigned int max_vecs, unsigned int flags)
+{
+	return pcim_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					       flags, NULL);
+}
+EXPORT_SYMBOL(pcim_alloc_irq_vectors);
+
+/**
+ * pcim_alloc_irq_vectors_affinity() - devres managed pci_alloc_irq_vectors_affinity()
+ * Interrupt vectors are automatically freed by the devres machinery
+ */
+int pcim_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
+				   unsigned int max_vecs, unsigned int flags,
+				   struct irq_affinity *affd)
+{
+	dev->is_msi_managed = true;
+	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					      flags, affd);
+}
+EXPORT_SYMBOL(pcim_alloc_irq_vectors_affinity);
+
+/**
  * pci_irq_vector() - Get Linux IRQ number of a device interrupt vector
  * @dev: the PCI device to operate on
  * @nr:  device-relative interrupt vector index (0-based); has different
diff --git a/include/linux/pci.h b/include/linux/pci.h
index d5ec0f8..ae58f70 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -1764,6 +1764,12 @@ int pci_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
 				   unsigned int max_vecs, unsigned int flags,
 				   struct irq_affinity *affd);
 
+int pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+			  unsigned int max_vecs, unsigned int flags);
+int pcim_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
+				   unsigned int max_vecs, unsigned int flags,
+				   struct irq_affinity *affd);
+
 bool pci_msix_can_alloc_dyn(struct pci_dev *dev);
 struct msi_map pci_msix_alloc_irq_at(struct pci_dev *dev, unsigned int index,
 				     const struct irq_affinity_desc *affdesc);
@@ -1806,6 +1812,22 @@ pci_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
 					      flags, NULL);
 }
 
+static inline int
+pcim_alloc_irq_vectors_affinity(struct pci_dev *dev, unsigned int min_vecs,
+			       unsigned int max_vecs, unsigned int flags,
+			       struct irq_affinity *aff_desc)
+{
+	return pci_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					      flags, aff_desc);
+}
+static inline int
+pcim_alloc_irq_vectors(struct pci_dev *dev, unsigned int min_vecs,
+		      unsigned int max_vecs, unsigned int flags)
+{
+	return pcim_alloc_irq_vectors_affinity(dev, min_vecs, max_vecs,
+					      flags, NULL);
+}
+
 static inline bool pci_msix_can_alloc_dyn(struct pci_dev *dev)
 { return false; }
 static inline struct msi_map pci_msix_alloc_irq_at(struct pci_dev *dev, unsigned int index,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
