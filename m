Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7174CC6B3C
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 12:55:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lfvq2MD8aH8dA6Gi+l3Alw4B+vzogfHOYTk9FNEkxT0=; b=5GfzZgC0w6YJ7M
	/ANxal00FRUq/ZDfQfB9cx496BMsbrhn6ukMr8OpAJFRLEtIbqBnTbirdtgjQMMGK9k3hYJjIgXd4
	/qx000/wiDyii7kPUDk2MGPfijw0Ce8piDkF86zTS1i6cuM6dP3fevOvuJM9fggC/X/fDU1H5wIGE
	NOY98OulZQ6byKAscXaG5O6qEnCmpHWdorKGny4WB8p86R2hGHXM3lw9MnKxA10fgJtO08bERRxmQ
	/Y4Uimw4Bz6Vcsi1Z/qRYUYR5mLB74GnFKe4RcuJA03SLy/xPiSW6158/BVPt0bxoZti7AzJr7bgE
	fJjolrtg8nC76qp5k8kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKz9-00000000AhU-2ZVx;
	Thu, 15 Oct 2026 12:55:03 +0000
Received: from naesa04.arrow.com ([216.150.161.24])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHKz5-00000000AfK-23e8
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 12:55:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=einfochips.com; i=@einfochips.com; l=1839; q=dns/txt;
  s=NAESA-Selector1; t=1792068900; x=1823604900;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=KFb8TFgQbX2FJlutJnLiqDlIKXZrvpZGANN2h8M5k74=;
  b=gNKBxTO6H8VWsbI+4v3HRG4P43Z57a629bVLeHay9blz7K/xiEV4SmdX
   4ARr/q/CNfXnfH/6WUGThwwmJeomwy8vPVUNT6kKfJEkuS3p866pnq7X9
   WHUE2P25+/BTO3Kw37dCUSZxuJYt5Xh/Rv4XvaR7BmY7bBDGIMuaZeDQ+
   DtLMaqBKlqMLMDhwfFYMelII1LOC0alGiZyDC2duuJCF8d+KKU+Xu0a+2
   7dzpQN7ZF9/KvBauctlu5EbRz2650TrxJcEX6xioZE2DB4O4qqJGRNfoM
   w5VXaeQBxR6pRK4zNKF+DkQbMmxghDWPL2TETkhil3eP4BMHv/AFvPDhN
   g==;
X-CSE-ConnectionGUID: d+yVcRs0RmmZ3A2iV7nywQ==
X-CSE-MsgGUID: ZoJ70h9YQfSuSGT/++S2pw==
X-IronPort-AV: E=Sophos;i="6.27,159,1787032800"; 
   d="scan'208";a="125039157"
Received: from unknown (HELO eicahmirelay01.einfochips.com) ([10.100.49.50])
  by naesa04out.arrow.com with ESMTP; 15 Oct 2026 06:54:56 -0600
Received: from AHMCPU1888.localdomain ([172.25.5.100]) by eicahmirelay01.einfochips.com with Microsoft SMTPSVC(10.0.20348.1);
	 Thu, 15 Oct 2026 18:24:55 +0530
From: Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andi Shyti <andi.shyti@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Min Lin <linmin@eswincomputing.com>
Cc: Yulin Lu <luyulin@eswincomputing.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Darshan Prajapati <darshan.prajapati@einfochips.com>,
	Pinkesh Vaghela <pinkesh.vaghela@einfochips.com>,
	Pritesh Patel <pritesh.patel@einfochips.com>
Subject: [PATCH v5 0/7] riscv: eswin: eic7700: Add support for clocks, resets, pinctrl, HSP bus, I2C and watchdog
Date: Thu, 15 Oct 2026 18:24:47 +0530
Message-Id: <20261015125454.1381941-1-pinkesh.vaghela@einfochips.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-OriginalArrivalTime: 15 Oct 2026 12:54:55.0091 (UTC) FILETIME=[604B1C30:01DD5CA4]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261015_055459_752175_7F81660E 
X-CRM114-Status: UNSURE (   7.89  )
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

Changes in v5:
- Rebased the patches to master branch of linux-next tree having
  latest tag: next-20261014.
- Updated dts file
  - Arranged the nodes in alphabetical order.
  - Removed the board-wide GPIO pinctrl state and attached GPIO84 to
    its gpio-leds consumer.
  - Moved the invariant I2C pinctrl states from board overrides into
    the corresponding SoC controller nodes.
  - Removed enabling watchdog nodes and describe them as enabled at
    SoC level.
- Updated dtsi file
  - Added pinctrl property to all I2C controller nodes.
  - Sorted the always-on I2C controllers by unit address.
  - Removed default property "disabled" from all watchdog nodes.
- Updated pinctrl.dtsi file
  - Resolve missing space issue.
  - Annotate all nodes with /omit-if-no-ref/.
  - Removed duplicated base pins from the quad-SPI pin states.
  - Split UART1 RTS/CTS from its TX/RX pin state.
- Added "Acked-by" tag of "Andi Shyti" for the I2C binding patch
  (i.e. Patch 5).
- Link to v4: https://lore.kernel.org/lkml/20260814070007.1662455-1-pinkesh.vaghela@einfochips.com/

Pinkesh Vaghela (1):
  riscv: dts: eswin: add hsp bus node

Pritesh Patel (5):
  riscv: dts: eswin: add reset generator for EIC7700 SoC
  riscv: dts: eswin: add clock generator for EIC7700 SoC
  dt-bindings: i2c: dw: add ESWIN EIC7700 SoC I2C controller
  riscv: dts: eswin: add I2C controller support
  riscv: dts: eswin: add watchdog support

Yulin Lu (1):
  riscv: dts: eswin: eic7700: add pinctrl support

 .../bindings/i2c/snps,designware-i2c.yaml     |    1 +
 .../dts/eswin/eic7700-hifive-premier-p550.dts |   91 ++
 .../riscv/boot/dts/eswin/eic7700-pinctrl.dtsi | 1065 +++++++++++++++++
 arch/riscv/boot/dts/eswin/eic7700.dtsi        |  255 ++++
 4 files changed, 1412 insertions(+)
 create mode 100644 arch/riscv/boot/dts/eswin/eic7700-pinctrl.dtsi

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
