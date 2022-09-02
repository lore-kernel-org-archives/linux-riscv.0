Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 832A9ECAAD5
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Sep 2022 14:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Z/58QuPd2iSsleR5EkRvO+jiSM7W9FOF/H7xloSkgRQ=; b=Ov2FQZEW8KgZyA
	ib8a2RMggruwf3Hc3dxBcWQJTNPsb5cOslfZ7IZ1+aIYLRq/T2IgDEkv1HttImg00sxUbAGEHNNtQ
	QYvfPoTGANEOVhlCT2pIRBNgrKiNwmtcaktf8O2SNUsRn+a8hvsOzgEjFa7d8T01K1I+Wj2FgBJKd
	0VmjS5RuFPBex28ypMBk5+CGz7bE8Fc4+2KZYzTUk8tJ4QS5uz1e99BgL0DbgxbuVsZJTeG5mdfLO
	SuY38U3gDoKLPXKMqYIK4Ai4Trn8a7qesBJ+ndwelyTF5MrIhCSPQbACiiR1MFXZ21Bvwk3a/xpuD
	CezB6jCd8NAwyC++hTkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Yu-005VjK-Db; Fri, 02 Sep 2022 14:22:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oU7Yo-005VgD-Ny
	for linux-riscv@lists.infradead.org; Fri, 02 Sep 2022 14:22:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1662128539; x=1693664539;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=00MuWJs7nufafUVbmiAfu3d9nDl7PUc8fJXHDrqkkec=;
  b=BiGv/SBQwAsnfh15vH8qhFD+gpMtlmeOA1fnpkMa2Rwe7p9hCRGValn6
   CmW03BGIqkc4nkf/3LgXAko/o7Lhx5XsUDu/3l9XgO+k18RTt1C5ic1OK
   kT5zMLyOZVOYpaV4tEEMeG2LH/ggdM1rA+Skv4rTAmR5ef/LkJpSIUZGS
   lACl5V7kdRK/ATpxyMHdrzfcXFC+gVZMD+uXZywVx+WelRDYoZ+tKUFVC
   IH7yjTEeDArDS+h8ltAs1WsZ8zYByDO5VjDqtEDuN+sWrjOiXx49jUz4L
   mZAwieLs6TE6Y1fSv7LyTM4Vz0RGzOcu8ubGl424Id5fVKv3L8fujl9PH
   g==;
X-IronPort-AV: E=Sophos;i="5.93,283,1654585200"; 
   d="scan'208";a="178808371"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Sep 2022 07:22:17 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Fri, 2 Sep 2022 07:22:16 -0700
Received: from daire-X570.emdalo.com (10.10.115.15) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Fri, 2 Sep 2022 07:22:13 -0700
From: <daire.mcnamara@microchip.com>
To: <aou@eecs.berkeley.edu>, <bhelgaas@google.com>,
	<conor.dooley@microchip.com>, <devicetree@vger.kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <kw@linux.com>,
	<linux-pci@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<lpieralisi@kernel.org>, <palmer@dabbelt.com>, <paul.walmsley@sifive.com>,
	<robh+dt@kernel.org>, <robh@kernel.org>
CC: <cyril.jean@microchip.com>, <padmarao.begari@microchip.com>,
	<heinrich.schuchardt@canonical.com>, <david.abdurachmanov@gmail.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>
Subject: [PATCH v1 0/4] PCI: microchip: apportion address translation between rootport and FPGA
Date: Fri, 2 Sep 2022 15:21:58 +0100
Message-ID: <20220902142202.2437658-1-daire.mcnamara@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220902_072218_808727_702E2C53 
X-CRM114-Status: GOOD (  11.33  )
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

From: Daire McNamara <daire.mcnamara@microchip.com>

Hi all,

This series includes an attempt to deal with the PCIe address translation
behaviour of Microchip PolarFire SoC.  On this chip, FPGA logic exists
between the PCIe rootport and the CPUs (Core Complex). So, outbound and
inbound translation to PCIe devices is achieved by a combination of individual 
customer's FPGA fabric designs and by the PCIe rootport itself and thus
the outbound and inbound address translation specified in range
properties and dma-range properties of the PCIe rootport appears insufficient
as they do not capture how much outbound and inbound address translation
has occured in the FPGA design between the addresses used by the CPU and
the addresses used by the PCIe devices. So, we require some mechanism
to inform the root port of what address translation it actually needs
to perform in order to achieve the goals specified in the range and
dma-range properties.

This series proposes two new Microchip properties, each in the form of
ranges, which capture the amount of outbound and inbound translation
done by the FPGA fabric, if any.  

If the new properties are absent, the range and dma-range properties 
are intended to be parsed by the root port driver as usual, and the 
entire specified address translation is carried out by the root port
using its address translation tables.

if one of the new properties are present, the translations
carried out by the rootport, as specified in the range or dma-range properties,
are adjusted by the amount of address translation carried out by
the FPGA design, as described in the details of the new properties.

The new properties are structured as ranges to enable FPGA designers to have
different address translation ranges; for example, an FPGA designer may
choose to partition 32-bit address translation and 38-bit translation through
different apertures for their particular design or may choose to target
non-cached and/or cached DDR with different dma-ranges.

This series contains a proposed new binding for the properties, and an
implementation of the new properties for the Microchip PolarFire SoC
PCIe rootport driver.

Thanks,
Daire

Conor Dooley (1):
  dt-bindings: PCI: microchip: add fabric address translation properties

Daire McNamara (3):
  riscv: dts: microchip: add fabric address translation properties
  PCI: microchip: add fabric address translation properties
  of: PCI: tidy up logging of ranges containing configuration space type

 .../bindings/pci/microchip,pcie-host.yaml     | 107 ++++++++++++++++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi |   6 +-
 drivers/pci/controller/pcie-microchip-host.c  |  59 ++++++++--
 drivers/pci/of.c                              |   2 +
 4 files changed, 166 insertions(+), 8 deletions(-)


base-commit: 6496a28df951641c0d50052ee195c7765591ff92
prerequisite-patch-id: 39bd182e929a064e38ca191a1726dd6d5a620f2d
prerequisite-patch-id: 9401b90950832090dabfe5f74f525ed4fa1c1410
prerequisite-patch-id: 606a8ca57d3dc19b04490b6e75d267a7c0d76163
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
