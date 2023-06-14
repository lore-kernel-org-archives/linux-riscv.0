Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E918EB64D8
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Jun 2023 15:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=NOwfPq/0gTnejYHBs5AmsgI5k+yovTIQjsCtaZ+lV1U=; b=0uoHcCwU8IYBlz
	cPr3rnV/O8PDmXNZMB/efZuPLJihACbN7jI/OQDCRBvI2G9h2GvLh8VxypInVw1Yq3U3F9noCdMnM
	JFZdaGcqVaJ43+Wk12JM4TyACRtMGXofkfCti+qpVN7bqRV/LOigUBjDth0P4jifACHaLc+bUAwDc
	7MRXjNFQhNbBeolR7gwsWbatOlNTRtESaRR8lk+viMbWo34Se7gkv3D3WSv5mgmbsIj61C/44rjSA
	eOBISNe0omGlrew1ttFuCfBmRBVQjrt6se2lsMHOGc6+6G8cBRBYUi0Tha40gUH6zIl0MulX7OHZI
	7kSw3xgYNjsnXgfiz1lQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Sr1-00C8Kt-2n;
	Wed, 14 Jun 2023 15:56:15 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9Sqx-00C8Il-33
	for linux-riscv@lists.infradead.org;
	Wed, 14 Jun 2023 15:56:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1686758171; x=1718294171;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=V0ZOQaPKSV/H5+EVRJxA4Vvcf0hXmJjJ6BdLur6kYRU=;
  b=q6Pio8WxTZteKAHXDI+vuKqKlBXEBTMd4R+5qvVHzIDPfCnmBi4bbBsy
   PCtbXyxH1o8h/Psa/gbeTcS2ayQNnmPqIHudZCM9h543Nubsv1lu2iGor
   9Sw2ILrbWNYD34ihgg6ogWh/EnleQTX7zy6w7S1XoqVDp0oJCJYFHMYcT
   qNtH91n+iJm4gwIsXqBKnN55KbbxNubLJ4w4I6ujFZO6/Fg9oapoj8JKX
   FYSLgHVKZXWf+cOIwMenflTib7LA3GCol0g7qjRHLrRkcHl57uinfjIXm
   0Kt7JNU64lOBQaHQ83TaNa/y38B1u9PZ4htGgzBxY5XeRkzlxY/aBg1lc
   g==;
X-IronPort-AV: E=Sophos;i="6.00,242,1681196400"; 
   d="scan'208";a="156969570"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Jun 2023 08:56:03 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 14 Jun 2023 08:56:00 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.21 via Frontend Transport; Wed, 14 Jun 2023 08:55:59 -0700
From: <daire.mcnamara@microchip.com>
To: <conor.dooley@microchip.com>, <lpieralisi@kernel.org>, <kw@linux.com>,
	<robh@kernel.org>, <bhelgaas@google.com>, <linux-pci@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/8] PCI: microchip: Fixes and clean-ups
Date: Wed, 14 Jun 2023 16:55:48 +0100
Message-ID: <20230614155556.4095526-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230614_085612_059573_C7F45B7C 
X-CRM114-Status: UNSURE (   6.69  )
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

From: Daire McNamara <daire.mcnamara@microchip.com>

This patch series contains fixes and clean-ups for the Microchip PolarFire SoC PCIe driver

These patches are extracted from the link below to separate them from the outbound and inbound
range handling which is taking considerable time.

These patches are regenerated on v6.4-rc6.

Link: https://lore.kernel.org/linux-riscv/Y8p16kaddL+Ot2Oa@wendy/

Daire McNamara (8):
  PCI: microchip: Correct the DED and SEC interrupt bit offsets
  PCI: microchip: Remove cast warning for devm_add_action_or_reset() arg
  PCI: microchip: enable building this driver as a module
  PCI: microchip: Align register, offset, and mask names with hw docs
  PCI: microchip: Enable event handlers to access bridge and ctrl ptrs
  PCI: microchip: Clean up initialisation of interrupts
  PCI: microchip: Gather MSI information from hardware config registers
  PCI: microchip: Re-partition code between probe() and init()

 drivers/pci/controller/Kconfig               |   2 +-
 drivers/pci/controller/pcie-microchip-host.c | 412 +++++++++++--------
 2 files changed, 246 insertions(+), 168 deletions(-)


base-commit: 858fd168a95c5b9669aac8db6c14a9aeab446375
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
