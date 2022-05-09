Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A814C433EF
	for <linux-riscv@archiver.kernel.org>; Mon,  9 May 2022 14:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TiNvOqLOiHxsSG4B3Gm461czwi4rflsC+RIUhOz60Bg=; b=HLIkke5p9ee3QO
	TOf4d1HbbdMdZaJKrO7G1/vnASUsVtiOOoSIhpBvP3s/XlCNE+KjCHwskIE78da/LZALyVhIbe57l
	1G4CzmaMc7e/gWtUPUoNNXTKayi0PyDK8Jb5xJN9+HfYdIFFD7mWbCq3n5l9Wt7dvf1UvKEHCYrKV
	UDHuhYSep0oMCiPao8+jZcAUjw5/RgGBJESrXax9kdwiPzfNyGz9z/bwihYXbyz44c5YIPiK5OmYl
	aj4ie+gg6J4lRsk/b54VJoZRk3Vm0FoAYlbEWM3lTxOxOI1QS/ustjiPM1jLx4iTnCuoroMuiCNxD
	P9s1b2nZSLsO+8bAlSNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1no4Lc-00EplU-VZ; Mon, 09 May 2022 14:26:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1no4LX-00Epiz-VM
 for linux-riscv@lists.infradead.org; Mon, 09 May 2022 14:26:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652106408; x=1683642408;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=HCdSIoiGs6J+p/OfruwdFMvCF2xJa6k7Z24v4z1d0G4=;
 b=E7MXYIRtKTP7HrS5Z3SpZCncwT7jkfxUUFKRwDL3pOM12zE48oGlQafu
 F4qdytR5WvNnVLzXvqb5psKakT3/4AEclOhP8CqELHsiR11exCsA9T1W8
 977tAypuRPomOsmWB3UHkpHag3dRMQtTY61sxSgcWrkuiW+6HMNHy3GuT
 fFKvN3MwIharebWtFIQH1MbaCECbYLNeOsRs1KOxlkwAmw1/G6/Sqlhwt
 37vMSImzmHyNYuqBPoCwdkIObbpK/3WpA8TxpK4LZelXiumWu12LNlHCV
 00iwRP44U3NTmMBeDTm0oOsEf3ossLIfB2vybxad9qpgqOqHIBAgGeERx g==;
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="162858666"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 09 May 2022 07:26:45 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 9 May 2022 07:26:44 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 9 May 2022 07:26:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@rivosinc.com>, Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley
 <conor.dooley@microchip.com>, Daire McNamara <daire.mcnamara@microchip.com>,
 Cyril Jean <Cyril.Jean@microchip.com>, <devicetree@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <heiko@sntech.de>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH v5 00/10] PolarFire SoC dt for 5.19
Date: Mon, 9 May 2022 15:26:01 +0100
Message-ID: <20220509142610.128590-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220509_072648_056648_19565D3E 
X-CRM114-Status: GOOD (  15.73  )
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
Got a few PolarFire SoC device tree related changes here for 5.19.

Firstly, patches 1 & 2 of this series supersede [0] & are unchanged
compared to that submission, figured it would just be easier to keep
all the changes in one series.

As discussed on irc, patch 3 removes the duplicated "microchip" from
the device tree files so that they follow a soc-board.dts & a
soc{,-fabric}.dtsi format.

Patch 5 makes the fabric dtsi board specific by renaming the file to
mpfs-icicle-kit-fabric.dtsi & including it in the dts rather than
mpfs.dtsi. Additionally this will allow other boards to define their
own reference fabric design. A revision specific compatible, added in
patch 4, is added to the dt also.

The remainder of the series adds a bare minimum devicetree for the
Sundance Polarberry.

Thanks,
Conor.

Changes since v4:
- Whitespace and status ordering changes in the polarberry dt pointed
  out by Heiko
- A new patch for same whitspace and status order changes, but applied
  to the icicle dt
- A reordering of the icicle dt alphabetically to match the formatting
  of the polarberry dt

Changes since v3:
- remove an extra line of wshitespace added to dt-binding
- remove unneeded "okay" status & sort status to node end
- sort polarberry dts entries in ~alphabetical order
- add a comment explaining why the second mac (mac0) is disabled on
  polarberry

Changes since v2:
- make ,icicle-reference compatible with ,mpfs & put it inside the enum

Changes since v1:
- fixed whitespace problems in the polarberry dts
- disabled mac0 for the polarberry as its port is on the optional
  carrier board

Conor Dooley (10):
  riscv: dts: microchip: remove icicle memory clocks
  riscv: dts: microchip: move sysctrlr out of soc bus
  riscv: dts: microchip: remove soc vendor from filenames
  dt-bindings: riscv: microchip: document icicle reference design
  riscv: dts: microchip: make the fabric dtsi board specific
  dt-bindings: vendor-prefixes: add Sundance DSP
  dt-bindings: riscv: microchip: add polarberry compatible string
  riscv: dts: microchip: add the sundance polarberry
  riscv: microchip: icicle: readability fixes
  riscv: dts: icicle: sort nodes alphabetically

 .../devicetree/bindings/riscv/microchip.yaml  |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/riscv/boot/dts/microchip/Makefile        |   3 +-
 ...abric.dtsi => mpfs-icicle-kit-fabric.dtsi} |   2 +
 ...pfs-icicle-kit.dts => mpfs-icicle-kit.dts} | 105 +++++++++---------
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |  16 +++
 .../boot/dts/microchip/mpfs-polarberry.dts    |  99 +++++++++++++++++
 .../{microchip-mpfs.dtsi => mpfs.dtsi}        |  11 +-
 8 files changed, 181 insertions(+), 59 deletions(-)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-fabric.dtsi => mpfs-icicle-kit-fabric.dtsi} (91%)
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs-icicle-kit.dts => mpfs-icicle-kit.dts} (95%)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
 rename arch/riscv/boot/dts/microchip/{microchip-mpfs.dtsi => mpfs.dtsi} (98%)

-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
