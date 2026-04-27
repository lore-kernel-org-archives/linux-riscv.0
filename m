Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C2E5FF8850
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Apr 2026 01:33:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bIW9t9D7fXIhuIPbO7RlOTlYsG/Lj1VxnfJfWBs7aRg=; b=d6G5hREKIiYMDn
	xKwIj4r0yqJrQIMQzbpp6ZRT4AuQhwYbr6cptJHKSaUz5+3MsmpkVZzktA7SWVg3x34/kz8WWPl5+
	RBxS7EG0DATk7kgMD/QiIfPARpKqNCFcsnd0wd6KxFFmIS+kEcL5nGwDrDk8i8orZEk2S8UR7I/V3
	wLpXUfu6hvlEm/X6+DInCprjBr9KC64kvq1xwJcW8HIG/+NmCVL6/XouIvShYYzNLLs5wll9PkGWa
	trr5429WXo8Un3bWhYNCKmiHLQ1BbugxLSYTe2i+edh6KTMQnYYVCk9TKxb0qnl/pCwrFLFHca1W8
	Psd6udV6tPGXvLVx3OBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAqy-0000000G1Ae-0lhb;
	Mon, 27 Apr 2026 01:33:40 +0000
Received: from [218.76.62.146] (helo=ultrarisc.com)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAqv-0000000G19e-3CQ4
	for linux-riscv@lists.infradead.org;
	Mon, 27 Apr 2026 01:33:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ultrarisc.com; s=dkim; h=Received:From:Subject:Date:Message-Id:
	MIME-Version:Content-Type:Content-Transfer-Encoding:To:Cc; bh=W1
	OSDnY0uPdVYrdVQOgWw2IW/C6VhYNToYtSoQxsDZU=; b=GuJOMXeig/YxxlXWI7
	hionvUii6HbJEr/ymsfBKuE+8+Dz7Mf5bT4w1PT+om5Vu06WOBuZMo+qzM4Y1/EZ
	3LQYL2CBs+pN+4UX9StqLST3Pc0IrUQCyoL+J9aLMtyVzMw8dXsLyxLJwriOwruR
	5s56hNayUBasr0xVAv5QZ2vgY=
Received: from [127.0.0.1] (unknown [192.168.100.1])
	by localhost.localdomain (Coremail) with SMTP id AQAAfwA3cULPvO5ps_0CAA--.1758S2;
	Mon, 27 Apr 2026 09:33:04 +0800 (CST)
From: Jia Wang <wangjia@ultrarisc.com>
Subject: [PATCH v4 0/3] riscv: Add PCIe support for UltraRISC DP1000 SoC
Date: Mon, 27 Apr 2026 09:32:09 +0800
Message-Id: <20260427-ultrarisc-pcie-v4-0-98935f6cdfb5@ultrarisc.com>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJm87mkC/23Nyw6CMBQE0F8xXVvTl63Xlf9hXJR6kRoF0gLRE
 P7dgvERcTnJzJmeRAweI9kuehKw89FXZQpquSCusOUJqT+mTAQTmknOaHtpgg0+Olo7j1SBAtg
 YLSUASaM6YO5vE7g/PHNsszO6ZlTGRuFjU4X79NjxsffC9S/eccoo5gKUxiNq2OzehZWrrmQ86
 MSHUMzMCJEIYa2wHKzJM/mPkF8EX88ImQgjc6YRjNBc/xLDMDwAG2m7FUgBAAA=
X-Change-ID: 20260310-ultrarisc-pcie-494998763399
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>, 
 Bjorn Helgaas <bhelgaas@google.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Xincheng Zhang <zhangxincheng@ultrarisc.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org, 
 Jia Wang <wangjia@ultrarisc.com>, Conor Dooley <conor.dooley@microchip.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777253539; l=4082;
 i=wangjia@ultrarisc.com; s=20260309; h=from:subject:message-id;
 bh=QdzIULHchgm6W2vSCIC/etjrebZnjnmuExvyJn88zMQ=;
 b=f8mVz/ZK7J8cviQ6X69XHjNzz8kvK3Aj2eyEdS7h2QGZ6Wmd9oeCDg4FxNE8anUZqsZT3rT+6
 3qyX6RbIHP0A4YjcUnuv8lkiLuw0TSY95V+NDa1CvI+jsduMtLLL5cT
X-Developer-Key: i=wangjia@ultrarisc.com; a=ed25519;
 pk=XvYkrelqJIIzobY7j+nIg8rsfv5kzaOzuc1UPhd087U=
X-CM-TRANSID: AQAAfwA3cULPvO5ps_0CAA--.1758S2
X-Coremail-Antispam: 1UD129KBjvJXoWxWw1fuw4DCF45Zw15XF4UXFb_yoWrXr4Dpa
	98WF4fAF97Jr1agF4ft3W8WF1SqF4kArW2qF42gwnFyasxuFyUXr9aga1YvFnrCrn5Xr12
	yr4a9r1rGay7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: pzdqwylld63zxwud2x1vfou0bp/1tbiAQAHEWnq6L8AGAAOsV
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_183337_988030_3105B481 
X-CRM114-Status: GOOD (  14.42  )
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

This patch series adds PCIe controller support for the UltraRISC DP1000 SoC.
The DP1000 is an 8-core 64-bit RISC-V SoC based on UltraRISC CP100 cores,
supporting RV64GCBHX ISA with Hardware Virtualization and RISC-V H(v1.0)
Extension.

The PCIe controller is based on Synopsys DesignWare PCIe IP.
This series adds:
- Patch 1 adds the basic SoC family Kconfig support for UltraRISC platforms.
- Patch 2 adds the device tree bindings documentation for the PCIe controller.
- Patch 3 introduces the PCIe host controller driver.

The patches have been tested on UltraRISC DP1000 development board with
various PCIe devices including NVMe SSDs and network cards, verifying
link establishment, enumeration, and basic data transfer.

Signed-off-by: Jia Wang <wangjia@ultrarisc.com>
---
Changes in v4:
- Patch 3:
  * Drop the wrapper struct and store struct dw_pcie directly as driver data.
  * Drop the unused platform_get_irq() call.
  * Move the extra DBI programming out of .start_link() into the host init
    callback (and skip it when the link is already up), keeping .start_link()
    limited to enabling LTSSM.
  * Replace the hard-coded Completion Timeout value with a named macro.
  * Do not force max_link_speed; keep the hardware default.
  * Drop unused header includes.
- Link to v3: https://patch.msgid.link/20260415-ultrarisc-pcie-v3-0-73f06e972616@ultrarisc.com

Changes in v3:
- Fold the MAINTAINERS update into the binding/driver patches and drop
  the standalone MAINTAINERS patch from v2.
- Patch 1:
   * Trim DP1000-specific ISA/feature details from the help text.
- Patch 2:
   * Simplify the description formatting and remove the redundant.
   * Drop the max-link-speed property from the binding.
   * Remove the redundant interrupts description line.
   * Clean up the example.
- Patch 3:
   * Drop unused regmap include.
   * Drop the unused irq_mask[] field.
   * Set pci->max_link_speed = 4 based on the fixed hardware capability.
- Link to v2: https://patch.msgid.link/20260407-ultrarisc-pcie-v2-0-2aa2a19a7fb3@ultrarisc.com

Changes in v2:
- Rebased onto v7.0-rc7.
- Patch 1:
   * Removed unnecessary 'depends' line.
   * Fixed help text indentation.
- Patch 2:
   * No changes.
- Patch 3:
   * Updated $ref to use 'snps,dw-pcie.yaml' as the base schema.
   * Add interrupts/interrupt-names (MSI + INTx).
   * Drop properties covered by generic DWC/PCI host bindings;
     update example accordingly.
   * Verified the schema passes 'make dt_binding_check' and 'yamllint'.
- Patch 4:
   * Update commit message.
   * Kconfig: switch PCIE_ULTRARISC to tristate; simplify help text.
   * Convert suspend/resume to dev_pm_ops and called
      `dw_pcie_suspend_noirq()` / `dw_pcie_resume_noirq()`.
   * Use FIELD_MODIFY(); adjust DWC header macros/comments.
   * Added empty `.pme_turn_off()` callback for DP1000 limitation.
   * Renamed link callback to `start_link`.
   * Switched to `module_platform_driver()`.
   * Formatting cleanups (headers order, spacing, variable naming,
     function names)
- Link to v1: https://patch.msgid.link/20260316-ultrarisc-pcie-v1-0-ef2946ede698@ultrarisc.com

---
Jia Wang (2):
      riscv: add UltraRISC SoC family Kconfig support
      dt-bindings: PCI: Add UltraRISC DP1000 PCIe controller

Xincheng Zhang (1):
      PCI: ultrarisc: Add UltraRISC DP1000 PCIe Root Complex driver

 .../bindings/pci/ultrarisc,dp1000-pcie.yaml        |  93 +++++++++++
 MAINTAINERS                                        |   8 +
 arch/riscv/Kconfig.socs                            |   6 +
 drivers/pci/controller/dwc/Kconfig                 |  12 ++
 drivers/pci/controller/dwc/Makefile                |   1 +
 drivers/pci/controller/dwc/pcie-designware.h       |  22 +++
 drivers/pci/controller/dwc/pcie-ultrarisc.c        | 175 +++++++++++++++++++++
 7 files changed, 317 insertions(+)
---
base-commit: e774d5f1bc27a85f858bce7688509e866f8e8a4e
change-id: 20260310-ultrarisc-pcie-494998763399

Best regards,
--  
Jia Wang <wangjia@ultrarisc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
