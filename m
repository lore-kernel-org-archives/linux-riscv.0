Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C61AECAAD4
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Aug 2022 14:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wvNBon87wU69t5/5gk3SJVcHlyFeamYI11UsTAc04ec=; b=nB4wqVNgpxq6gx
	ErXLp9fSKqDIxBdWIT79hhUJGUseH6bQOxYVsRSfR5v4uiVCcOfJl4mWCRszxi+RCRGo/+W7X8A5p
	L//8aLUn+tfSHCZeWqTVo3gGA65NUbKtNDX3knFriXU1+rof0bUYgm/1R8mFTgDfM48EqbKMiB4qG
	Hg7EB2+Xluygp9V9CO8Oj6jiYCdsfmdIUPnwsGfi2c05Pp94ZCn0by6W9PjE88SkuUlLP3Zn3DHaL
	ncJ6kN/KRHbudOaJXDIDtqiztWkLZ1lAlbggSZg9Fjdxl2Lv6MVhYSlyXv1u+WdZEa3JxiR3Yd6LE
	zI3Ryz2mwHRko9dFBe1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKJ-006CUh-M0; Fri, 26 Aug 2022 14:28:51 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oRaKG-006CGB-Bu
	for linux-riscv@lists.infradead.org; Fri, 26 Aug 2022 14:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661524129; x=1693060129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=yyk3C0tplTqm10LTuEAScqxik33o055KXg/FXYvR5QI=;
  b=04SwnIH7Pv9bif5Ijc0afnnTU1tbOtz+NqL8Abd3Loe2AZ+HOVJJLt0s
   s//gfwHeW51oRvAzO0DCQaf54VS3R7qICkejo2Ll/e/Up9cZ6Hx/+L3Ju
   HopLqnEEnuvedt2NyKkjtIENGfRdhA9WfmGDeypIzxh9Md2s/XTkcWt6Z
   PHZBulfxCSMnasbTcVlytMgMzM7NFWPbs0W6dQY52jI4GaezhdAqQuNY/
   ZnVxoEHrCGqn9MKQjqonXSz0qs+YFGJxpHnCbG1mNjenwbpsw5nI3Ksvh
   obQSVHq9sWPqL0ULyrLL0xWSJKC0FH3xfRwV9w+9cdtlEOE+raMUAOn7S
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,265,1654585200"; 
   d="scan'208";a="171133563"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 26 Aug 2022 07:28:42 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 26 Aug 2022 07:28:41 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Fri, 26 Aug 2022 07:28:38 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
	Shravan Chippa <shravan.chippa@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Cyril Jean
	<Cyril.Jean@microchip.com>, Lewis Hanly <lewis.hanly@microchip.com>,
	Vattipalli Praveen <praveen.kumar@microchip.com>, Wolfgang Grandegger
	<wg@aries-embedded.de>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH 0/9] New PolarFire SoC devkit devicetrees & 22.09 reference design updates
Date: Fri, 26 Aug 2022 15:27:58 +0100
Message-ID: <20220826142806.3658434-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220826_072848_494735_BC17CEF0 
X-CRM114-Status: GOOD (  14.09  )
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

0 - https://lore.kernel.org/linux-gpio/20220825143522.3102546-1-conor.dooley@microchip.com/
1 - https://lore.kernel.org/linux-clk/20220824093342.187844-1-conor.dooley@microchip.com/

Conor Dooley (7):
  dt-bindings: riscv: microchip: document icicle reference design
  dt-bindings: riscv: microchip: document the aries m100pfsevp
  riscv: dts: microchip: add pci dma ranges for the icicle kit
  riscv: dts: microchip: move the mpfs' pci node to -fabric.dtsi
  riscv: dts: microchip: icicle: update pci address properties
  riscv: dts: microchip: icicle: re-jig fabric peripheral addresses
  riscv: dts: microchip: add a devicetree for aries' m100pfsevp

Shravan Chippa (1):
  dt-bindings: riscv: microchip: document the sev kit

Vattipalli Praveen (1):
  riscv: dts: microchip: add sevkit device tree

 .../devicetree/bindings/riscv/microchip.yaml  |  21 ++-
 arch/riscv/boot/dts/microchip/Makefile        |   3 +
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |  42 ++++-
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   3 +-
 .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  45 +++++
 .../dts/microchip/mpfs-m100pfsevp-emmc.dts    |  37 +++++
 .../dts/microchip/mpfs-m100pfsevp-sdcard.dts  |  37 +++++
 .../boot/dts/microchip/mpfs-m100pfsevp.dtsi   | 155 ++++++++++++++++++
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |  29 ++++
 .../dts/microchip/mpfs-sev-kit-fabric.dtsi    |  45 +++++
 .../riscv/boot/dts/microchip/mpfs-sev-kit.dts | 145 ++++++++++++++++
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  29 ----
 12 files changed, 550 insertions(+), 41 deletions(-)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfs-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp-emmc.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp-sdcard.dts
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
