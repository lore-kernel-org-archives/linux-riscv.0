Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57140CE7AA8
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 10:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPA8Ij8gMOB6veqQk1N3DOcDXuf+F7lDzgKvE67Vwx0=; b=i7i7ND1Zsw+nfM
	Plu9VEdOyHm3rG3XoLQlIvyF2rWYw+PlX71goQBC2f/VxR4SJLD5kKDpU2rjA4sE9Lth9qg2fyTkj
	BdE+wRGPFHf1PXOxfpO9BzTymWyOFlu0VoO7ObgV7CBqUab6GMITaCKOAblFljCHtm95OZXSfsOH2
	OeGe/f6DLIeEQmdzn1Wxg88l6v/lqQ7whjeoHXYixUN799jIdY3D2ALE0DgjlvozikF5RDxYzygZf
	HBWSVFdmyRc5mum2WgFY4oLbaQOKVFwPemOhObAp0BtZ7jP3CXD1pmRdXMP4S95XpagWAKSWL/V7T
	Jb3oTeUDbYxMKCwPW2Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr8b-0000000C1vR-2tBw;
	Fri, 14 Nov 2025 10:34:41 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJr8Z-0000000C1uW-2Dwi
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 10:34:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1763116480; x=1794652480;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=LmzioE4Q6F6/YsQ6HUWzvctwQNwjqvdOm9BlnNNnZSQ=;
  b=02iLGwAvJTQCYOGsDMS11T1S0kWUBb7RPhwvT0sJ81QZZGSTUvlvR/N4
   jbv5IMVlSVOxMTHa9gkLphjDgQugv0eO+bffPFxTGBVk7Ks5t/DXtJS3c
   Xf2juuKkziJnCokX0vj3vOyJIjaech/gksJEbrUj3wxqjiVGIJNN/olAw
   cW89w2LfkPxt5ct0fr0YT5WmAmWA2h0TNvqGK5WBqa77VhQ1Ca6ZYEt+r
   EdnDEu6SoJ2satTtgx1uqQSAsYd0FAEKaWyW9hv6id4y2O0ZmHqA4APry
   3f6usdJMsU2/2t4HJe9QuYE5tEAtLiFEw16/T66oTEJb6fS3R1uLh7czF
   Q==;
X-CSE-ConnectionGUID: wYFga1SYSXSOScvbmgh0dQ==
X-CSE-MsgGUID: 1w6Bd04iRt+19rD6K4BNMQ==
X-IronPort-AV: E=Sophos;i="6.19,304,1754982000"; 
   d="scan'208";a="49141509"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 03:34:38 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 14 Nov 2025 03:34:18 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 14 Nov 2025 03:34:16 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v4 0/3] Add support for Microchip CoreSPI Controller
Date: Fri, 14 Nov 2025 10:45:42 +0000
Message-ID: <20251114104545.284765-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251114_023439_574234_01517AC8 
X-CRM114-Status: GOOD (  12.30  )
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

This patch series adds support for the Microchip FPGA CoreSPI "soft" IP 
and documents its device tree bindings.

As preparation, the existing Microchip SPI driver is renamed to clearly
indicate that it supports only the Microchip PolarFire SoC "hard" controller.
Although it was originally named with the expectation that it might also
cover the FPGA CoreSPI "soft" IP, the register layouts differ significantly, 
so separate drivers are required.

changes in v4
--------------
- Switch callback from .remove_new to .remove in mpfs-spi.c This change was missed in v2

changes in v3
--------------
- Renamed Kconfig symbol to SPI_MICROCHIP_CORE_SPI 
- Renamed CoreSPI driver from spi-microchip-core.c to spi-microchip-core-spi.c to avoid confusion

changes in v2
--------------
- Moved compatible strings into an enum and kept alphabetical order
- Replaced .remove_new callback with .remove
- Dropped unused variable reported by kernel test robot 
- Updated CoreSPI drivers commit message to include the 8-bit frame size restriction

Prajna Rajendra Kumar (3):
  spi: microchip: rename driver file and internal identifiers
  spi: dt-binding: document Microchip CoreSPI
  spi: add support for microchip "soft" spi controller

 .../bindings/spi/microchip,mpfs-spi.yaml      |  70 ++-
 drivers/spi/Kconfig                           |  28 +-
 drivers/spi/Makefile                          |   3 +-
 drivers/spi/spi-microchip-core-spi.c          | 442 ++++++++++++++++++
 .../spi/{spi-microchip-core.c => spi-mpfs.c}  | 207 ++++----
 5 files changed, 635 insertions(+), 115 deletions(-)
 create mode 100644 drivers/spi/spi-microchip-core-spi.c
 rename drivers/spi/{spi-microchip-core.c => spi-mpfs.c} (68%)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
