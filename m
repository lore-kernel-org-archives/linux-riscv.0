Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5296CAC581
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Sep 2025 12:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W+PJvXjFvscpZSptE9D5yAZR35p0yZ6AOK9plvD2lys=; b=5FGGWNxhYvOAgD
	OFCwtU0IkA7hY2iT5BTwvvC4XDVglNfU45eb1zgZ3OdZFSVZIyTpjvZ22QDLzGGc+bhu6MGuB/QVR
	pgghDjctjaAG1TmvK/yROPNFMKDksmkGMpiUO5RfzJXbxVxrrsnnkdBuwA5YS/YkcnaCzvNXbbTEs
	U+f7lL9gmFgCih9bZuiOOBUo5u4WwO73TCh7BNtCxOquycDb55k1m6leKnKKzrrOQUYNPbbwC2Zjy
	HUEguSxMbGLe649X9CqFcqGZQH9nycnxlgmXl6E+O98ICo6f50fSvrzH5p2fVfUYT6zVdjrdrtBly
	19IgdXLPp5NBqnGv1pew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvbKg-0000000H9QT-2hPr;
	Mon, 08 Sep 2025 12:50:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvaMj-0000000Gljb-1oaM
	for linux-riscv@lists.infradead.org;
	Mon, 08 Sep 2025 11:48:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1757332137; x=1788868137;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=gGgGMPvV4pFfW5o5EJHnMwTA3FSYCWeLKrCyYVYijik=;
  b=JgVzSI9dnZlpePpog6KOWyJmYyF98A678Q4vOZhBBGYwk+s0xeRrA/gB
   tcbV6Q7ZAZ+3BTw8+HPnWDcz+kXYC3OBlEO4mvZaHnTFWYbGQnyhNsXOX
   3oWbmToaMr7J2MvRQA5AttsP35Kr/Afw1qAiAn5d8tlsSbCB1bY3BwvnF
   6XxV+B7tDPDhwyYJkqzyYAPlfLJT7VhaaS0l0PYZ/A4enHWBUNlyawqqD
   D+59rYR2AwtcVBksq90TV8XJapwlkGfdMz5YJlnnpe5P+yRHgYfSizCzi
   a4hYly9qkqLv9Qfdkyv7Zf0bM74ILxiR5dhiqZNz8v2ucNAdBFI+ZpDTg
   g==;
X-CSE-ConnectionGUID: vDOPHTnsQiaqmkXt9yltVw==
X-CSE-MsgGUID: jctlR1HBQjKK+mP3mJR5cg==
X-IronPort-AV: E=Sophos;i="6.18,248,1751266800"; 
   d="scan'208";a="45634874"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 08 Sep 2025 04:48:52 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.58; Mon, 8 Sep 2025 04:48:34 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.58 via Frontend Transport; Mon, 8 Sep 2025 04:48:31 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v3 0/6] Icicle Kit with prod device and Discovery Kit support
Date: Mon, 8 Sep 2025 12:57:26 +0100
Message-ID: <20250908115732.31092-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_044857_778645_6E114DFC 
X-CRM114-Status: GOOD (  12.96  )
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

Hi all,

With the introduction of the Icicle Kit with the production device
(MPFS250T) to the market, it's necessary to distinguish it from the
engineering sample (-es) variant. This is because engineering samples
cannot write to flash from the MSS, as noted in the PolarFire SoC
FPGA ES errata.

This series adds a common board DTSI for the Icicle Kit, containing
hardware shared by both the engineering sample and production
versions, as well as a DTS for each Icicle Kit variant.

The last two patches add support for the PolarFire SoC Discovery Kit
board.

Changes since v2:
 - rename ccc clock to clock-cccref to match fixed clock binding

Changes since v1:
 - fix order of properties in mailbox nodes
 - drop redundant status property from ddrc_cache nodes
 - fix lowercase hex in reserved memory regions

Thanks,
Valentina

Valentina Fernandez (6):
  riscv: dts: microchip: add common board dtsi for icicle kit variants
  dt-bindings: riscv: microchip: document icicle kit with production
    device
  riscv: dts: microchip: add icicle kit with production device
  riscv: dts: microchip: rename icicle kit ccc clock and other minor
    fixes
  dt-bindings: riscv: microchip: document Discovery Kit
  riscv: dts: microchip: add a device tree for Discovery Kit

 .../devicetree/bindings/riscv/microchip.yaml  |  13 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++
 .../boot/dts/microchip/mpfs-disco-kit.dts     | 190 +++++++++++++
 .../dts/microchip/mpfs-icicle-kit-common.dtsi | 249 ++++++++++++++++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  25 +-
 .../dts/microchip/mpfs-icicle-kit-prod.dts    |  23 ++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 244 +----------------
 8 files changed, 559 insertions(+), 245 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-disco-kit.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-common.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-icicle-kit-prod.dts

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
