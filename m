Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9E0AD0C601
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Oct 2024 12:36:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=G6h+V7l9Zew3l8uTPVfRc7ingHfSZcV+RkMRfQYYHwM=; b=d6ZK28N/qO6e5i
	h4CU6raofrGS5tA3xZUif8hKeJeQHO7wusMjw7v65rO9UWweB0wF1Ts8xks6nmz0RU17swf/FP0z8
	bRldyI8onM9u/Bp9lbtkBTJiCIieiJzCo9nVVd1SW9z+d67Gz0xAIXnhgwfEM5mAulUMJsF99EwKg
	D7ieGb0VtwcV3PMvNtnopS6eRooJyzeBcEftZknv7Y7DY0wXeymeIVAPjuA8W0e0KXCuM/jkTbsYD
	rOmwF+Nrc8+TxXtBh/BUk6DxoIFLlv5sLaB0QQxbkLr1bpz2Z9gWdcHdQaWEEeTjp0JUxFZC/1Amp
	QR6F3J/sGwOPHzYo1T4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JYS-00000003fz7-0yj9;
	Fri, 25 Oct 2024 12:36:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JYO-00000003fw6-1zrc
	for linux-riscv@lists.infradead.org;
	Fri, 25 Oct 2024 12:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1729859792; x=1761395792;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=QawCFqr5BT6CrXbkDHPVmxbNPAmvASHSPaF+S3p29tU=;
  b=WUwG62ArS2xgRrUEgfw30QPDOZrXeCXecKSkGbZWc+3j3NXGfEp8N5ES
   xpAiRBGeGnA+BbV1+lyMgtNl4udA720b6k1mgVHLb0YaHJDNbxHV3Z2rq
   8I6lWjpRCEDbNW8/lrTTPWkVDEdHkbomCiW2OVV435yu25HbUQH69pZVU
   JUpBBDNMex2L5CQj+yFtmJC6HVM+62ZFHexwTRUMadsN99Gh7svdESeqv
   mfDKWg7pbV5rgccEp3aZpaoykk7pzvW2xoH1AopJo4r8/C5HOK1zJ61bk
   irxfSS6XgNGsQ1L2XeisLjv55mv7deqDgHKOsHpk+1pjg0v7u0trPtuyK
   g==;
X-CSE-ConnectionGUID: X92f2WlyQymcF1jpVGgAqw==
X-CSE-MsgGUID: N+DaUVr+Rratp8G4QRKpvg==
X-IronPort-AV: E=Sophos;i="6.11,231,1725346800"; 
   d="scan'208";a="33481559"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Oct 2024 05:36:30 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Fri, 25 Oct 2024 05:35:44 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Fri, 25 Oct 2024 05:35:42 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <conor.dooley@microchip.com>,
	<conor+dt@kernel.org>, <ycliang@andestech.com>, <dminus@andestech.com>,
	<prabhakar.mahadev-lad.rj@bp.renesas.com>, <jassisinghbrar@gmail.com>,
	<robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v2 0/3] Add Microchip IPC mailbox
Date: Fri, 25 Oct 2024 13:51:07 +0100
Message-ID: <20241025125110.1347757-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_053632_604375_00DB5402 
X-CRM114-Status: GOOD (  15.31  )
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

I am submitting this v2 with the IPC mailbox patches and without the
IPC remoteproc drivers, as suggested in v1 [1].

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
dts after the initial upstreaming [2].

[1] https://patchwork.kernel.org/project/linux-remoteproc/cover/20240912170025.455167-1-valentina.fernandezalanis@microchip.com/
[2] https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/


changes since v1:
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

Valentina Fernandez (3):
  riscv: sbi: vendorid_list: Add Microchip Technology to the vendor list
  dt-bindings: mailbox: add binding for Microchip IPC mailbox controller
  mailbox: add Microchip IPC support

 .../bindings/mailbox/microchip,sbi-ipc.yaml   | 108 ++++
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 drivers/mailbox/Kconfig                       |  13 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 537 ++++++++++++++++++
 include/linux/mailbox/mchp-ipc.h              |  23 +
 6 files changed, 684 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
 create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
 create mode 100644 include/linux/mailbox/mchp-ipc.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
