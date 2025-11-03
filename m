Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60AD2CCF9F8
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Nov 2025 16:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=UKGiYgHXh6WZo0sVGPiEf6IZeOtyyZ2+LukEmLoQZHA=; b=hkvYLAQsOBCev6
	yRz1fLkhIpGgvuR65YNAqbRv9yBS0mSFfCUmI8a9UDej9325MmDCcrM2EZsP5w4B26jDxDLT9gpOO
	XOKQo5VUbyUZtQc55qL0dvm9eZEPJVyStIdf1qwXGF9np7cNC3BBVRXJaqkiU+zOyIey0T/1RtUyT
	Wva/CCn8LuDdTcDJZcs9X26QTXgpTJDBZ/ZmGTY5ezm8abEj2zsrCEjuJd/5KN9d5CeDeZmSTtpal
	3BGpkVMFOrzVFH4ePbWXgZZ6ArHqtCPITXyA/7PeBy7wo/vHAVuf3QG9jvrtOO2K8UhItZ82ovZu8
	BYjMNaaIf8ulHRX3vfAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwzi-0000000AD7h-0PsL;
	Mon, 03 Nov 2025 16:01:22 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwzf-0000000AD6g-3SFM
	for linux-riscv@lists.infradead.org;
	Mon, 03 Nov 2025 16:01:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1762185679; x=1793721679;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=Ot3iWYcj47ZwqvJJfRRJMWRtoVr4u3WTIVXuUcMeLds=;
  b=Dpkq+27cSz9h9Qt6EWcvKPZ5/u3Yja2AEEDn8r0uKEQnQ2PtOqeHOQFq
   bVvr0irXF7d70xHakHfoCXnZplRaS6b0kow5pfWD8KrXE4ak6R7bB1hko
   9ZDKipPRW77B1VNzSuG1v2rYV42HPM9m8wVSaHZ1ta3aYj6OwovCdckQ5
   lxywHe6RPh74vKwnJa/JiURP8Gzn+XAwdQl0/BWQ7fz4qncVUB2dKeBVb
   f59eqXJD2yidoWpSm4a5rs0NOa/0nOI2NW1CS9OQNy3UHYund/I/gRkc/
   ihejU17lfOkQgKRDkf8WGvlMGuTpUu+40+BlL4Ntn/WbX+jNf9OtFEku/
   Q==;
X-CSE-ConnectionGUID: HCNQY0jzQAeYr9vBiTkXcQ==
X-CSE-MsgGUID: kqr79KI6SMSkHm381Jn2Zw==
X-IronPort-AV: E=Sophos;i="6.19,276,1754982000"; 
   d="scan'208";a="49119074"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 09:01:17 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.87.151) by
 chn-vm-ex4.mchp-main.com (10.10.87.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.2562.29; Mon, 3 Nov 2025 09:00:37 -0700
Received: from Lily.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.58 via Frontend
 Transport; Mon, 3 Nov 2025 09:00:35 -0700
From: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Valentina Fernandez Alanis <valentina.fernandezalanis@microchip.com>, "Cyril
 Jean" <cyril.jean@microchip.com>, Prajna Rajendra Kumar
	<prajna.rajendrakumar@microchip.com>
Subject: [PATCH v1 0/3] Add support for Microchip CoreSPI Controller
Date: Mon, 3 Nov 2025 16:05:12 +0000
Message-ID: <20251103160515.412706-1-prajna.rajendrakumar@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_080119_922721_B41C5084 
X-CRM114-Status: GOOD (  10.68  )
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

Prajna Rajendra Kumar (3):
  spi: microchip: rename driver file and internal identifiers
  spi: dt-binding: document Microchip CoreSPI
  spi: add support for microchip "soft" spi controller

 .../bindings/spi/microchip,mpfs-spi.yaml      |  65 ++
 drivers/spi/Kconfig                           |  12 +-
 drivers/spi/Makefile                          |   1 +
 drivers/spi/spi-microchip-core.c              | 582 ++++++----------
 drivers/spi/spi-mpfs.c                        | 626 ++++++++++++++++++
 5 files changed, 903 insertions(+), 383 deletions(-)
 create mode 100644 drivers/spi/spi-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
