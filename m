Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D725CEA4FD5
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Feb 2026 15:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XxXJvTHOMx/XK4yY/AV5HsMdthuNE4bjVoxsALKBscY=; b=n3gMXHI4pUiSD8
	ESBN0wID17Y7mzIQWUH96Zg1UAX9/wg74ERZfE3aHggXtkYT9pigAP6jvbh6zaZRxGMx3YlUl+Af0
	Bdv2oZmFoDMtPmzFI2ihPLFkh2ec9KB2dRkkV9exaTkwPtf+nbm9yZj4dFRrECZQI0mEH8s/jssFk
	Uw6vJ+KgqVUzByp8M1NDTtw13z9jBJe522cOuE6Wn1KtQJTzDvceVVA/359F2Zd01ZqHbFXr6DS+y
	PdxftmqP5i8Qg21OwAr2NUcqDF59wdj3V37JRltSKklDKrHpkttv3BfIp4dztRjFemaXiOYhG66y0
	NRP9sEHf+KC94OAgELfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXuM-00000000Zrc-1O2H;
	Mon, 23 Feb 2026 15:31:38 +0000
Received: from mail-m49223.qiye.163.com ([45.254.49.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuXuJ-00000000ZqT-0h9q;
	Mon, 23 Feb 2026 15:31:36 +0000
Received: from localhost.localdomain (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 34b37f769;
	Mon, 23 Feb 2026 23:31:09 +0800 (GMT+08:00)
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
Subject: [PATCH 0/37] PCI/MSI: Enforce explicit IRQ vector management by removing devres auto-free
Date: Mon, 23 Feb 2026 23:29:39 +0800
Message-Id: <1771860581-82092-1-git-send-email-shawn.lin@rock-chips.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-HM-Tid: 0a9c8b20307709cckunm6946b3c79862a6
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0oaHlZPHx5OTE0YQkJPHxlWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSUJDQ0
	xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=jy81/F5Ni9q9/bSyZWlJabD1XxAXELPL9UhibFZyMz9WyzEiB5iEDVH0Ye8gCgDrz+TXTgJ8mWQ6QgQDO5+xpeOsxh+rOYDNTZc0JKdQU/fj9M+S4Jnb31IUAfPQnG6b/8K1G5LiNjlbXGROoXvc1DCKurZLBq/IoT1lOI+FLR8=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=BcUR/HoijHqinvoMXUQVA7vidPdOPQAH0voVT1QIHOY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_073135_762267_9A2AC2A9 
X-CRM114-Status: GOOD (  15.11  )
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

This patch series addresses a long-standing design issue in the PCI/MSI
subsystem where the implicit, automatic management of IRQ vectors by
the devres framework conflicts with explicit driver cleanup, creating
ambiguity and potential resource management bugs.

==== The Problem: Implicit vs. Explicit Management ====
Historically, `pcim_enable_device()` not only manages standard PCI resources
(BARs) via devres but also implicitly triggers automatic IRQ vector management
by setting a flag that registers `pcim_msi_release()` as a cleanup action.

This creates an ambiguous ownership model. Many drivers follow a pattern of:
1. Calling `pci_alloc_irq_vectors()` to allocate interrupts.
2. Also calling `pci_free_irq_vectors()` in their error paths or remove routines.

When such a driver also uses `pcim_enable_device()`, the devres framework may
attempt to free the IRQ vectors a second time upon device release, leading to
a double-free. Analysis of the tree shows this hazardous pattern exists widely,
while 35 other drivers correctly rely solely on the implicit cleanup.

==== The Solution: Making Management Explicit ====
This series enforces a clear, predictable model:
1.  New Managed API (Patch 1/37): Introduces pcim_alloc_irq_vectors() and
    pcim_alloc_irq_vectors_affinity(). Drivers that desire devres-managed IRQ
    vectors should use these functions, which set the is_msi_managed flag and
    ensure automatic cleanup.
2.  Patches 2 through 36 convert each driver that uses pcim_enable_device() alongside
    pci_alloc_irq_vectors() and relies on devres for IRQ vector cleanup to instead
    make an explicit call to pcim_alloc_irq_vectors().
3.  Core Change (Patch 37/37): With the former cleanup, now modifies pcim_setup_msi_release()
    to check only the is_msi_managed flag. This decouples automatic IRQ cleanup from
    pcim_enable_device(). IRQ vectors allocated via pci_alloc_irq_vectors*()
    are now solely the driver's responsibility to free with pci_free_irq_vectors().

With these changes, we clear ownership model: Explicit resource management eliminates
ambiguity and follows the "principle of least surprise." New drivers choose one model and
be consistent.
- Use `pci_alloc_irq_vectors()` + `pci_free_irq_vectors()` for explicit control.
- Use `pcim_alloc_irq_vectors()` for devres-managed, automatic cleanup.

==== Testing And Review ====
1. This series is only compiled test with allmodconfig.
2. Given the substantial size of this patch series, I have structured the mailing
   to facilitate efficient review. The cover letter, the first patch and the last one will be sent
   to all relevant mailing lists and key maintainers to ensure broad visibility and
   initial feedback on the overall approach. The remaining subsystem-specific patches
   will be sent only to the respective subsystem maintainers and their associated
   mailing lists, reducing noise.

Please help review it, much thanks!



Shawn Lin (37):
  PCI/MSI: Add Devres managed IRQ vectors allocation
  mmc: cavium: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  media: ipu6: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  gpio: merrifield: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI: switchtec: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI: vmd: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  spi: spi-pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  spi: pxa2xx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: amd-mp2: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: mchp-pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: thunderx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i2c: designware: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  bus: mhi: host: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  serial: 8250_mid: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  serial: 8250_exar: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  platform/x86/intel: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  crypto: safexcel: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  crypto: octeontx2: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  cxl/pci: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
  drm/hisilicon/hibmc: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  iommu/riscv: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  thunderbolt: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/amdxdna: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/ivpu: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  accel/qaic: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  net: stmmac: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  r8169: Replace pci_alloc_irq_vectors() with pcim_alloc_irq_vectors()
  net: thunder_bgx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  net: hibmcge: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  mfd: intel-lpss: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  dmaengine: hsu: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  dmaengine: hisilicon: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  i3c: mipi-i3c-hci-pci: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  HID: intel-ish-ipc: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  HID: Intel-thc-hid: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  misc: microchip: pci1xxxx: Replace pci_alloc_irq_vectors() with
    pcim_alloc_irq_vectors()
  PCI/MSI: Only check is_msi_managed in pcim_setup_msi_release()

 drivers/accel/amdxdna/aie2_pci.c                   |  2 +-
 drivers/accel/ivpu/ivpu_drv.c                      |  2 +-
 drivers/accel/qaic/qaic_drv.c                      |  4 ++--
 drivers/bus/mhi/host/pci_generic.c                 |  3 ++-
 drivers/crypto/inside-secure/safexcel.c            |  8 +++----
 drivers/crypto/marvell/octeontx2/otx2_cptpf_main.c |  2 +-
 drivers/crypto/marvell/octeontx2/otx2_cptvf_main.c |  4 ++--
 drivers/cxl/pci.c                                  |  8 ++-----
 drivers/dma/hisi_dma.c                             |  3 +--
 drivers/dma/hsu/pci.c                              |  2 +-
 drivers/gpio/gpio-merrifield.c                     |  2 +-
 drivers/gpu/drm/hisilicon/hibmc/hibmc_drm_drv.c    |  4 ++--
 drivers/hid/intel-ish-hid/ipc/pci-ish.c            |  2 +-
 .../intel-thc-hid/intel-quicki2c/pci-quicki2c.c    |  2 +-
 drivers/i2c/busses/i2c-amd-mp2-pci.c               |  2 +-
 drivers/i2c/busses/i2c-designware-pcidrv.c         |  2 +-
 drivers/i2c/busses/i2c-mchp-pci1xxxx.c             |  2 +-
 drivers/i2c/busses/i2c-thunderx-pcidrv.c           |  2 +-
 drivers/i3c/master/mipi-i3c-hci/mipi-i3c-hci-pci.c |  2 +-
 drivers/iommu/riscv/iommu-pci.c                    |  4 ++--
 drivers/media/pci/intel/ipu6/ipu6.c                |  2 +-
 drivers/mfd/intel-lpss-pci.c                       |  2 +-
 drivers/misc/mchp_pci1xxxx/mchp_pci1xxxx_gp.c      |  2 +-
 drivers/mmc/host/cavium-thunderx.c                 |  2 +-
 drivers/net/ethernet/cavium/thunder/thunder_bgx.c  |  4 ++--
 drivers/net/ethernet/hisilicon/hibmcge/hbg_irq.c   |  4 ++--
 drivers/net/ethernet/realtek/r8169_main.c          |  2 +-
 drivers/net/ethernet/stmicro/stmmac/dwmac-intel.c  |  6 ++---
 drivers/pci/controller/vmd.c                       |  4 ++--
 drivers/pci/msi/api.c                              | 26 ++++++++++++++++++++++
 drivers/pci/msi/msi.c                              |  4 +---
 drivers/pci/switch/switchtec.c                     |  6 ++---
 drivers/platform/x86/intel/ehl_pse_io.c            |  2 +-
 drivers/spi/spi-pci1xxxx.c                         |  4 ++--
 drivers/spi/spi-pxa2xx-pci.c                       |  2 +-
 drivers/thunderbolt/nhi.c                          |  6 ++---
 drivers/tty/serial/8250/8250_exar.c                |  2 +-
 drivers/tty/serial/8250/8250_mid.c                 |  2 +-
 include/linux/pci.h                                | 22 ++++++++++++++++++
 39 files changed, 104 insertions(+), 62 deletions(-)

-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
