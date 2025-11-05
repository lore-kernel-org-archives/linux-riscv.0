Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7975CCFA0D
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Nov 2025 15:24:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=n8Ixp+BJ97IJKooOsGMhyqGzIi9jbypn3W+aZKxqgYY=; b=IW77n1BdNpFc/Z
	p/p5hNOUUqHZzDoMAKtYPN6VTl3hj3mEOJCRbuQfpkjyRPpKB1Bfnexrk0js0I0V49oxFjx6uqnT3
	EQv9NJcdOvsip2udYLZBo5MdDuXVadpD0zm4QoZ0Y9f238ddtR18D62ukZ/02PubhqspSfBv2xnQF
	te+J1Gg/CWpViEzqbyi8zWt1JMCE1lcYcv3p4RKmXP3FhXpLvJa1ooXbhkdSdEh9vbLWwbDC5h5Km
	q2ys++b1RDHg6v8rtvUsxQarspua9iw/aal19aIFPHyl/HycMacXHtJKPdAqjQ9cr6+3cHWp0gFyI
	0T0yW6n8Fpn4sRzQlD/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfMm-0000000DvON-2UOM;
	Wed, 05 Nov 2025 15:24:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGfMi-0000000DvLm-2q8w
	for linux-riscv@lists.infradead.org;
	Wed, 05 Nov 2025 15:24:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762356244; x=1793892244;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=GXwbdQaFXRPyLyOFxOAe1jK4fHdG0pnAJ3StTbZyCww=;
  b=ADk40C+l1X3jBSzSqPm3jePxqb6b3QyBwa6alJ1t9KWwAdeA89TH1msx
   WwLwB6M3a8NFfs8eiFMU4xaj9bcdPlrLarD40vzUXU6/Bak8kwR+eXBCG
   Eco8+DsL0h1fx5szAvn5NgFTpiF7BEK+v2FMNmA0HpgtIXUED+bqRO9gb
   MMMoydx3k4h7mwqQer2eAxIgGZn/7L3u7NJ41J/fRZ1Kf06OvnN2X6tJ2
   lWDMiDFBre3UerPWLYjTSuInrERbrTztndfSX4Wbv6s9m488gimSU3EeF
   dgspVw0Uok5CLGhWn2HoE+H1y1LtCI3MJ1/Xeb4STTtYdtz75x4yFYpTi
   w==;
X-CSE-ConnectionGUID: uJ3OEhFsR7KdS3mVaaXYNA==
X-CSE-MsgGUID: u5K7xTi8TYyqLlRpBNBwow==
X-IronPort-AV: E=Sophos;i="6.19,282,1754982000"; 
   d="scan'208";a="49225714"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2025 08:24:02 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.87.152) by
 chn-vm-ex2.mchp-main.com (10.10.87.31) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Wed, 5 Nov 2025 08:23:49 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Wed, 5 Nov 2025 08:23:47 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v2 0/3] Add support for Microchip CoreSPI Controller
Date: Wed, 5 Nov 2025 15:28:20 +0000
Message-ID: <20251105152823.730422-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_072404_956948_FD1AF4B0 
X-CRM114-Status: GOOD (  12.72  )
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

 .../bindings/spi/microchip,mpfs-spi.yaml      |  70 +-
 drivers/spi/Kconfig                           |  12 +-
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-microchip-core.c              | 581 ++++++----------
 drivers/spi/spi-mpfs.c                        | 626 ++++++++++++++++++
 5 files changed, 905 insertions(+), 385 deletions(-)
 create mode 100644 drivers/spi/spi-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
