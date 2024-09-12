Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EF7EED622
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:48:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0lGpq81Cbb+wAnBkZQdsmk2OxWCETboCfryevWi/LEY=; b=PBQKExB/NOJXvZ
	KOsUg2XhCfvb7YTH68OR2dMpZ887QID8P7u8g9861KClSoSHC4oEiRumkPtS5b9JkRm0zqcxNn/iR
	/b5lYygnFdI0jcercoI39+d6BIhqbgFI1QmKiudAK18jozc9mZhmzvucOAWjLw98L7Q/eJ36bJzyk
	KmJ/vxYjEBifAHbJ6iQ80e+vXsmXiW71BpEqWcoWy6s/ykcpHXW5eocOGfLdkY50O4FTVRnxpgzpn
	1z0vvlGfcGLaVUfdnLND+0Su64cZIbn6x/OvVPTQD5l7UsoKuJ7z5REaHw+2XjyU9VVuB1/ABChzT
	lE/41pkvnU3LWaneMyww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somze-0000000Dkm3-3vYB;
	Thu, 12 Sep 2024 16:48:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somzb-0000000DkkD-2CDU
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 16:48:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159707; x=1757695707;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=tumOMK6ePQtr6oYjEIUYDl/feJA9f3v2UT5ccuOHVNo=;
  b=ts19u13lpcUO9qIs8OFFp6wUb+8/h6DI546iEI32vMZyWmUaocanEiS0
   cD4aYjT24C7GKquIXniMO/neWuNxHTq3Zsksy+itob7f0HQ3iXMumJOCQ
   0v4cA1SSs0eSu3PVsBAchQuYOcmC4EmPN0cNGZRnwojjDjyrVEpHHy1eD
   /R7BgN6nNco57QrZcHNoTkz7Sw5QpOCLx+UsiTkYt48igxc62/o/Lg3xU
   uY2bV7GOet+MB/Eyf5CfTRZKMpkue+uAnImIp8IuITzGAq/9QxzD4Zz2R
   sDn9fIWkUedixOg4u1icrePFK1fam9beSrXzN7Tgf6jfxsxYDGXLErdvr
   g==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: fZT3tPZfQRufVAoEKWniow==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331225"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:24 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:44 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:41 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 0/5] Add Microchip IPC mailbox and remoteproc support
Date: Thu, 12 Sep 2024 18:00:20 +0100
Message-ID: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_094827_644033_F01A377B 
X-CRM114-Status: GOOD (  14.72  )
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
(IPC) mailbox controller, as well as an IPC remoteproc platform driver.

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

The IPC remoteproc platform driver allows for starting and stopping
firmware on the remote cluster(s) and facilitates RPMsg communication.
The remoteproc attach/detach operations are also supported for use cases
where the firmware is loaded by the Hart Software Services
(zero-stage bootloader) before Linux boots.

Error Recovery and Power Management features are not currently
supported in the remoteproc platform driver.

The PIC64GX MPU has a Mi-V IHC block, this will be added to the PIC64GX
dts after the initial upstreaming:

https://patchwork.kernel.org/project/linux-riscv/patch/20240725121609.13101-18-pierre-henry.moussay@microchip.com/

Thanks,
Valentina

Valentina Fernandez (5):
  riscv: asm: vendorid_list: Add Microchip Technology to the vendor list
  dt-bindings: mailbox: add binding for Microchip IPC mailbox driver
  mailbox: add Microchip IPC support
  dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
  remoteproc: add support for Microchip IPC remoteproc platform driver

 .../bindings/mailbox/microchip,sbi-ipc.yaml   | 115 ++++
 .../remoteproc/microchip,ipc-remoteproc.yaml  |  84 +++
 arch/riscv/include/asm/vendorid_list.h        |   1 +
 drivers/mailbox/Kconfig                       |  12 +
 drivers/mailbox/Makefile                      |   2 +
 drivers/mailbox/mailbox-mchp-ipc-sbi.c        | 539 ++++++++++++++++++
 drivers/remoteproc/Kconfig                    |  12 +
 drivers/remoteproc/Makefile                   |   1 +
 drivers/remoteproc/mchp_ipc_remoteproc.c      | 461 +++++++++++++++
 include/linux/mailbox/mchp-ipc.h              |  23 +
 10 files changed, 1250 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
 create mode 100644 drivers/mailbox/mailbox-mchp-ipc-sbi.c
 create mode 100644 drivers/remoteproc/mchp_ipc_remoteproc.c
 create mode 100644 include/linux/mailbox/mchp-ipc.h

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
