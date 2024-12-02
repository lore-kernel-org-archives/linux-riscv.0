Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96B13D78326
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Dec 2024 14:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CTxeX2eVPUtwKadFxwecLHPEde4qJlK3yWQwauZVNpU=; b=FN3LpfoN5QEQTf
	z16OB0WvHLsAWb5EUtY1Nz2hr87vQ5LMtk4GMOHN8E/f8VfMb7nCtvpfRfvaj9ZBxJYY29+darnj0
	R7inWBfkT6Gxwz9ZDPpNWjb694e0U9NLJTG1YiIi59dpYt85nKIFnciYrwUp+XL8KQfFdaBFPf2Uk
	YjahtXYU/wEulbIyK2uKqL7O1eLb7enQo1BCzfYr0WD3Z9X7jlUss+5AetwyKOPrnq9JyDyoW+5hW
	kXhKPQn6+/jJPTXNb4+DiW+/ppgAczFIzwSJqcpIjLf5CizD7pqxvTk1QLufKaeN/Z8Giz1ywSRys
	hGGuoMbW8EuE5901TVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78q-00000006NGA-2RRT;
	Mon, 02 Dec 2024 14:11:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tI78n-00000006NFI-3lkb
	for linux-riscv@lists.infradead.org;
	Mon, 02 Dec 2024 14:11:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1733148670; x=1764684670;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yRbOjZ2hD0leE2tDAokT732AMFTPg2jdC93fXQD4wyI=;
  b=r+z/o0npY34ffnuabhpOdTivg4KWQUCutxtOXWuDtX/LjYRDJgDiHuTe
   B9nqj2J85My7Jo/SUBQ7hnMKd7niGx/NwpH0HwDDT+owahDvkbQ1VfrZ9
   eYiO2NQRaYo0zZdMFv1kL5o2F0HIrr9tCe242qYvghcsuR8ub2LRRVKaX
   27lqvvUc6kGeLjPmJrrO4YvU1CV2FfJuWeUpo/ewb053cHdV/h9hf8Cwu
   fdw32yO6fqm/P8vzlGLj/BxyS6rtwJVTxyrxnjI1Vku4TAU9nYv5T/Evz
   NZ5R6EppKZmjM2+VmDQEXPR2S7QmHPae+jrw82iiVDPQS7Y+qzMGggE+e
   A==;
X-CSE-ConnectionGUID: 2KutSU5NQueuFpBXpCyxJA==
X-CSE-MsgGUID: HEOvJCBSQFuLbWAqGes20Q==
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="266205958"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 02 Dec 2024 07:11:08 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 2 Dec 2024 07:10:50 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Mon, 2 Dec 2024 07:10:49 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v5 0/4] Add Microchip IPC mailbox
Date: Mon, 2 Dec 2024 14:11:03 +0000
Message-ID: <20241202141107.193809-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241202_061110_053276_211440BF 
X-CRM114-Status: GOOD (  17.77  )
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

Changes in v5:
- change interrup-names property to use a list instead of pattern
- move assitionalProperties after allOf : block
- update reg property in dt binding example to use lowercase hex

Changes in v4:
- specify that microchip,miv-ihc-rtl-v2 is intended for use with MIV IHC Soft IP
- drop items array and use const value for compatible strings
- add a contraint to microchip,ihc-chan-disabled-mask property
- minor improvements to "'#mbox-cells' description

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
