Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26704CA0FE8
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Aug 2025 17:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X9GGT/cJ9vPxMGBr5EayvOj48b1aTkkAYBQFS7NiLwQ=; b=nU6zjw1j04WG3D
	Z8wkIjGpLab2xkuwvNDovoJYeot2XbaEV5coO3b1tVsPr+RQ3p/pr/fxkA8ln3kyYTU/UBu6GLFda
	osGZpEetWWOP9NXyaHRrKhRtajnl8HfYx/4FV88Jsg+8QMfB1DLFy9xaZpFQBOAe0DsNYtsejJjPS
	qlbe1XvGIwPjjnGrKCJJ46U0Gh1nM4cHwVq7A0RjguKUEPPCXV/0jnJqPgJsxc3ssK8UFdCWIRDJm
	rkb3ireeFxen2NLiE8+kbcUU14anSHYhcdLHuyPTsCvT3PDiFvEKkCWCu7MFbQJOgZoVdgfaL8nPu
	0Ux23REIteqPX6UuCRmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqaYw-00000008kec-3nb7;
	Mon, 25 Aug 2025 17:00:54 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uqZw7-00000008dmK-0urv
	for linux-riscv@lists.infradead.org;
	Mon, 25 Aug 2025 16:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1756138847; x=1787674847;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=7RPyJ/WS8sIDW2l0x9iCbOzBEdLIsTVZEzDioi73MfE=;
  b=wwMzOvbabXHydywudYWm3FUMoelEw1tXL2wyyvTNX7uWlTXBvTF/t1vt
   CSnkvaAZl7bziWWGfUgvlPsaMSgL+b6txc04cst48Yhdd1xhP4KQuI4kh
   ylPlg8f7bOk0na6r+vnkFfyi0DTQI1IFfXGpQtXO2YqHkoe7J6ubXnBzA
   mux4VhTaUjEZkNpdC9reufRuCgsAoZIA1GLnMYqxROTrAo+1m0ln5DqlY
   NSVX4IHJ9qbH7+vGplTpKGaKd5r7T3ZO0Yaqee/47KUwXaQIWJkBf/rcf
   7XdB90t2oaORz9IsQoC1WkonNThGIWau+h0s3HSHi62aMZpVqfffYRSVV
   w==;
X-CSE-ConnectionGUID: yR/Y38h+TmqSdYuuwCmvnw==
X-CSE-MsgGUID: IJ4yU4nmSpugJRaaEWeb/w==
X-IronPort-AV: E=Sophos;i="6.18,213,1751266800"; 
   d="scan'208";a="45617280"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 25 Aug 2025 09:20:45 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 25 Aug 2025 09:20:42 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.44 via Frontend Transport; Mon, 25 Aug 2025 09:20:40 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>
Subject: [PATCH v1 0/5] Icicle Kit with prod device and Discovery Kit support
Date: Mon, 25 Aug 2025 17:19:47 +0100
Message-ID: <20250825161952.3902672-1-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250825_092047_390883_85C21A48 
X-CRM114-Status: GOOD (  11.53  )
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

Thanks,
Valentina

Valentina Fernandez (5):
  riscv: dts: microchip: add common board dtsi for icicle kit variants
  dt-bindings: riscv: microchip: document icicle kit with production
    device
  riscv: dts: microchip: add icicle kit with production device
  dt-bindings: riscv: microchip: document Discovery Kit
  riscv: dts: microchip: add a device tree for Discovery Kit

 .../devicetree/bindings/riscv/microchip.yaml  |  13 +
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../dts/microchip/mpfs-disco-kit-fabric.dtsi  |  58 ++++
 .../boot/dts/microchip/mpfs-disco-kit.dts     | 191 +++++++++++++
 .../dts/microchip/mpfs-icicle-kit-common.dtsi | 251 ++++++++++++++++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  23 +-
 .../dts/microchip/mpfs-icicle-kit-prod.dts    |  23 ++
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 244 +----------------
 8 files changed, 561 insertions(+), 244 deletions(-)
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
