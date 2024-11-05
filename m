Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A902ED33A21
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Nov 2024 18:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AVIZvf3t1rzjkVI4j11x+99v/1wpkxriaJzGWuQsOdk=; b=nqANBrkNzoU8JQ
	XKcAdWGWsi8b1LpIsbQ3gO7qCrNsoAU9cWeu2ogFLs0v2Vq9NqT1P0ENDU2uzcI0oZMJnhzTdqqQJ
	+J7MR8BeAgn8+D6oGZmevg3azl7YuRwOjumlfrKBqnJehoy6WldV5ujsiDlGVStOK9SAfgUC9tOeA
	RJIwF4eUJ/Hog3BUV12kP3Dd3/m0y0TnKkGTuuja1DeYnK2/unAbbIS5LheXrMCMfDKe81DxBM5Qt
	W8g+Vt9wVIN3jJIges/UazC64G9LalvC0sUTir0vXiVrFLUsIeXPbOCiRHdYQ+hNOQEwKM9dlxPIg
	4knVnyLEazRks7ND/VKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OV9-00000000Pms-2SjB;
	Tue, 05 Nov 2024 18:42:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8OQ1-00000000OHc-1mPj
	for linux-riscv@lists.infradead.org;
	Tue, 05 Nov 2024 18:36:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1730831806; x=1762367806;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=sOrsKDmx9/vKQmRX+rhbt4lmfdLCgkIhjnsuTV0xE4U=;
  b=RSDqWUE6wngdtPmCp01EBXnfHElO5xPoMKMA4WzdgRVMs0GPgYSvmEN9
   Sb6/ha+DN6fMYWap+m9FU0hDutQkMDpZeZsiXNSVqDd0NJeR/CaJiM/9U
   VF6RJyd4ZIxt9SvUMNM7KlE6DxbPmFcY0kk9kt5G2ZVCEbK+dlGzNaQgp
   /RD6UaLWg9ajHcx1eriGNyPCbO/Z+AGL6F2e93kuhAAvZL3iJKngipq0u
   PhEmPdnvyg9ZEYApYpAHWjdaOCFeQqtTjrTHPQyeEa9MZj/NPDG7IoagW
   DYVdtBIAgLLgELECsdDJiavmzYVnhpd9Hp0MQAQR+rzx26DScXSrv/ttk
   A==;
X-CSE-ConnectionGUID: aPvpj/ErQpCvLHGNHY35EA==
X-CSE-MsgGUID: EkpJYgi1RjaqiN20vBksuQ==
X-IronPort-AV: E=Sophos;i="6.11,260,1725346800"; 
   d="scan'208";a="33910621"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 05 Nov 2024 11:36:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Tue, 5 Nov 2024 11:36:14 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Tue, 5 Nov 2024 11:36:11 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<ycliang@andestech.com>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	<peterlin@andestech.com>, <samuel.holland@sifive.com>,
	<conor.dooley@microchip.com>, <alexghiti@rivosinc.com>,
	<ruanjinjie@huawei.com>, <takakura@valinux.co.jp>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 0/4] Add Microchip IPC mailbox
Date: Tue, 5 Nov 2024 18:35:09 +0000
Message-ID: <20241105183513.1358736-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_103645_513339_BB0919F3 
X-CRM114-Status: GOOD (  16.45  )
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

Hello all,

This series adds support for the Microchip Inter-Processor Communication
(IPC) mailbox driver.

Microchip's family of RISC-V SoCs typically has one or more clusters
that can be configured to run in Asymmetric Multi-Processing (AMP) mode.

The Microchip IPC is used to send messages between processors using
an interrupt signaling mechanism. The driver uses the RISC-V Supervisor
Binary Interface (SBI) to communicate with software running in machine
mode (M-mode) to access the IPC hardware block.

Additional details on the Microchip vendor extension and the IPC
function IDs described in the driver can be found in the following
documentation:

https://github.com/linux4microchip/microchip-sbi-ecall-extension

The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
dts after the initial upstreaming [1].

[1] https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/

Changes in v3:
- Fix incorrent formatting around '=' in dt binding examples
- Add per compatible descriptions in dt binding
- Add '>' in certain dt binding descriptions to keep paragraphs maintained
- export __cpuid_to_hartid_map to compile mailbox driver as module
- Drop unused enum ipc_irq_type
- rename struct mchp_ipc_probe to mchp_ipc_mbox_info
- rename struct ipc_chan_info to mchp_ipc_sbi_chan
- rename struct microchip_ipc to mchp_ipc_sbi_mbox
- use phys_addr_t for __pa()
- drop mchp_ipc_get_chan_id function
- use num_chans in mbox_controller
- Fix buf_base_tx and buf_base_rx sizes using max and kmalloc

Changes in v2:
- use kmalloc and __pa() instead of DMA API
- fix size of buf_base to avoid potential buffer overflow
- add kernel doc for exported functions (mchp_ipc_get_chan_id)
- use EXPORT_SYMBOL_GPL instead of EXPORT_SYMBOL
- drop unnecessary blank line and fix alignment issues
- drop of_match_ptr
- move MODULE_DEVICE_TABLE next to the definition
- reword subject from riscv: asm: vendorid_list to riscv: sbi: vendorid_list
- remove the word "driver" from dt-binding commit subject
- make interrupt-names a required property for all cases
- add dependency on COMPILE_TEST and ARCH_MICROCHIP

Regards,
Valentina

Valentina Fernandez (4):
  riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
  riscv: export __cpuid_to_hartid_map
  dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
  mailbox: add Microchip IPC support

 .../bindings/mailbox/microchip,sbi-ipc.yaml   | 117 ++++
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 arch/riscv/kernel/smp.c                       |   1 +
 drivers/mailbox/Kconfig                       |  13 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 504 ++++++++++++++++++
 include/linux/mailbox/mchp-ipc.h              |  33 ++
 7 files changed, 671 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
 create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
 create mode 100644 include/linux/mailbox/mchp-ipc.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
