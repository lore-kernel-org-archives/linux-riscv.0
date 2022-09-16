Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F2ECC6FA92
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Sep 2022 11:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TSaiYyxhgg0iwZb5spwoxop1RBLDVTB9QR1k+zle89Y=; b=ksXi1fK5a1AOXR
	ORX7niRnLDAIEkOcBFQfHqMJ2C2ca8YZbeLxZkEJ9PnAyD0YmLKqm9KX7me9pzr/ZSA7eWg9Fre69
	Hf3hlMgDAGWgyOc6qzQX4kDl92TpPZ/XliSbQqm3838lfXRoiC+i84JpLDkhKF2EqZimKT56M/ihO
	GH2hS/eWARt16xSOB9Cw41QxDViGtHEFzNCh/fSS8lYUSYSDi63UvPU3VlB+LNrpEFllhsHEMSfDw
	WG+vG+SyvWg0NM2mn9iv8IZYscQpr/W+zUWki9b5Z/EDJuOPwRlpCPneGAKGcYYbUj1K962cIB8+K
	6TP81wrkrk9BPeEUKWTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9VG-00Cfg8-VN; Fri, 16 Sep 2022 11:27:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZ9V8-00CfXo-KM
	for linux-riscv@lists.infradead.org; Fri, 16 Sep 2022 11:27:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1663327638; x=1694863638;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NhLw3PG76HisIAakO+0cR9U6jetMp5XopTOnfnJJ+bE=;
  b=JR72qh7BaNMfCgvopVLiVw5GR6c6YyxCJ7cnRsRpmrMJgM6+7bQ4pRgx
   gdHADlQnkx898Fxvi09CZu+WXElnrd3D9uWn8pS5UP1PFcSmw83WdUzoD
   InrlV6Xg5FAgBoCxUc2hxcf7Nn/TvKqDFSbEpWUfqWof1k1X2zl/SLZWe
   fcM+bd8IvPYq+u7UZvD/bzSVtjrC0mtRUotcZ3eG+stjRBPF/dx2TpCoC
   RqSAOSXU5MOof/YoQ3p1YBYK+UJy6ap4Q+hem5sC1DN6ASbT4/U7uMBya
   fNypEns9cfIT4Q0ZJC6nRbhMncr5CMZmpNP1L7wARmjNB2dXRRQIY0Mun
   A==;
X-IronPort-AV: E=Sophos;i="5.93,320,1654585200"; 
   d="scan'208";a="114001445"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Sep 2022 04:27:13 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 16 Sep 2022 04:27:13 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 16 Sep 2022 04:27:10 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, Hugh Breslin <hugh.breslin@microchip.com>,
	<devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v5 00/10] New PolarFire SoC devkit devicetrees & 22.09 reference design updates
Date: Fri, 16 Sep 2022 12:26:36 +0100
Message-ID: <20220916112645.567794-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220916_042718_781756_CA348D04 
X-CRM114-Status: GOOD (  16.38  )
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

Hey all,

Some 6.1 targeted changes here.
Firstly, two new dev kits (one first-party & one from Aries Embedded).
They've been sitting in our vendor tree, so are being sent where they
belong.

Secondly, another release of our reference design for the Icicle kit
is due in September. Usually these do not really change much for the
devicetree, but this time around a pair of changes impact the memory
map.

The first of these is adding dma-ranges to the pcie controller. The
controller had some issues to begin with & with the current reference
design (v2022.05) would not work with mainline Linux nor has it since
reference design v2021.08. A combination of the property, a change
to the FPGA design & a small fix to the driver will get it working
with mainline again. The other non-backwards compatible change to the
reference design is moves of the peripherals instantiated in the
fabric. Currently they are fairly spread out & a common complaint has
been that this leaves little room in the fic3 section of the memory map
for custom peripherals without removing the existing ones.

This series depends on [0] so as not to add dtbs_check warnings. The
fabric clock support is added by [1].

Thanks,
Conor.

Changes since v4:
- fix the incompatible interrupts on m100pfsevp

Changes since v3:
- add an extra patch reducing the fic3 clock rate

Changes since v2:
- drop the sd & emmc versions of the aries devicetree
- remove a extra newline

Changes since v1:
- made the polarberry part of an enum in patch 1

0 - https://lore.kernel.org/linux-gpio/20220825143522.3102546-1-conor.dooley@microchip.com/
1 - https://lore.kernel.org/linux-clk/20220824093342.187844-1-conor.dooley@microchip.com/

Conor Dooley (8):
  dt-bindings: riscv: microchip: document icicle reference design
  dt-bindings: riscv: microchip: document the aries m100pfsevp
  riscv: dts: microchip: add pci dma ranges for the icicle kit
  riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
  riscv: dts: microchip: icicle: update pci address properties
  riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
  riscv: dts: microchip: reduce the fic3 clock rate
  riscv: dts: microchip: add a devicetree for aries' m100pfsevp

Shravan Chippa (1):
  dt-bindings: riscv: microchip: document the sev kit

Vattipalli Praveen (1):
  riscv: dts: microchip: add sevkit device tree

 .../devicetree/bindings/riscv/microchip.yaml  |  20 +-
 arch/riscv/boot/dts/microchip/Makefile        |   2 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  44 ++++-
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   3 +-
 .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 +++++
 .../boot/dts/microchip/mpfs-m100pfsevp.dts    | 179 ++++++++++++++++++
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |  29 +++
 .../dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 +++++
 .../riscv/boot/dts/microchip/mpfs-sev-kit.dts | 145 ++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  29 ---
 10 files changed, 499 insertions(+), 42 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
