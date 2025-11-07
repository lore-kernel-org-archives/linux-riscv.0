Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0C9FCCF9F8
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Nov 2025 12:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Nsqyvh4XZV/3ZhLLmw+ALs/GGsjwriSIXUv1XkbjYeo=; b=CnSJLpLokj8U/t
	o2FVffv4zfc0Fu571wq7sa6Uklfotlf6M1/mxZKIiXgo2+RiAVGkmjTaf+C3nb5crzsKvkviUmKng
	FSDHNwJRiBc9BP75wQYSEje+Og+4+znoeIc8msbk1FCHbLmCIkrIRZuR3h9CksUG39akqwu5F52Ws
	ZTNMMYbUFDDHKOBxZw6917T01B34oE6gxbbACOoVsMwj2yYxhO0qaOPo6C3eM5Q7ZIr0lHV4/C8QQ
	fd+NYPM0odR5ow6fL8oz4OAv5Y7I+LXapOSW7iA7lay/9miNpp61v2D4SpkdYRA9dcJRYK4DrCZsu
	0bysBwlirnpO4cPEjLrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLOv-0000000HHDM-1yEM;
	Fri, 07 Nov 2025 12:17:09 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHLOs-0000000HHCS-0nTQ
	for linux-riscv@lists.infradead.org;
	Fri, 07 Nov 2025 12:17:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762517825; x=1794053825;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=fKFaVGRCYqdZdfnsZlL0kIN99ZrW6FxHqWyJRYYzsyk=;
  b=fx6p4d/nNPe1MK5U0njg2EbVRY7mGWU07fO/b6GMHqbwEqjl2aZINzt3
   CsY8tN6WHekoM3B6jLzOcG64MIomKEaAetqzhc7HoEeQffrosF3oOWqFB
   zhLXSB1ZQZtM0G6hzzHOoKlhNPY55yvmrtoNPijjF4XKF7FpUx1IABby/
   zjIMzVRk3ofG74dNUDoBN8gca+AB6x2b2DjKgFnxmoafK1GAx/tuwc5+Y
   Cuikf+FozF1z8B+a2UK1xH+7he/YFVHNXOg9J351uuFsCVJBJ+8YHgv4S
   lMA6/j3KFWFlB/U6Z/mxx0BIeuXfG5Y//rZXQP0Q4rC89AueeRW5twqVb
   A==;
X-CSE-ConnectionGUID: BMvHhjAdT6y1+HEhZwPKDQ==
X-CSE-MsgGUID: Ztzym4YlSXOXoPc+PKmwNg==
X-IronPort-AV: E=Sophos;i="6.19,286,1754982000"; 
   d="scan'208";a="55218261"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Nov 2025 05:17:03 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex1.mchp-main.com (10.10.87.30) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Fri, 7 Nov 2025 05:16:34 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Fri, 7 Nov 2025 05:16:32 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v3 0/3] Add support for Microchip CoreSPI Controller
Date: Fri, 7 Nov 2025 12:21:01 +0000
Message-ID: <20251107122104.1389301-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_041706_446099_95BDFF2E 
X-CRM114-Status: GOOD (  12.14  )
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
