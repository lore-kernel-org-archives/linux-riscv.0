Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84909C27C55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Jun 2024 11:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qAwuT7UJNQqgD5BPMJE/niNWSLQCUpCIUq9vZN9CD2E=; b=uhMeV3yrwv2qf6
	ybeHGDAonfVhaoZL4kssklz4SjZIyErsDDcfuj04w0wIhjRDzy9K+1NaLjB9xwflgEHwmpZ4Y5qUf
	b+ngoAlNWKbGrYh64N3jLI9uZ8rl3crFRbdcJK9ywSRK5HIecrS0BrjJEStZF/1xlanoxDh9y8H0u
	30h9evoK7LmAJjqBmBXF8JHFDZtHTcGi1Iypg0qA1Vk3sj94z+FVsBWkqXTTKtkXuUiKNOovQsD5m
	jbd8cfigNUnskYufL9sdtdj7ZlWQybk21SBYlg8uHhgbYVz4wc41zIKXMpKOxWzuyVBbLUSnJ0bhy
	kxsIOsolXZqFKv36ogaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuu-00000004ltB-1EnU;
	Mon, 10 Jun 2024 11:10:24 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGcuq-00000004lqi-1ZUQ
	for linux-riscv@lists.infradead.org;
	Mon, 10 Jun 2024 11:10:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1718017820; x=1749553820;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=NsjQbAmUmlOlgifCA2KPWGuT+GynfWTjmgtIMLdbQcc=;
  b=KjxQHw7zung6/D/YUl4gsZTjutCauqPUHWcKAiiv7/pIK86SPZz0orKf
   pOcVuVRiXYMv73vPHbwNCJukKHaXJIOF5ktUkmklSMS1BU5+8sVZDvE9g
   Xq4CWiYd8ALL3i+Lnp3mc2zz7rpvMy8HBZ1qQ1s0uhKa2NXoUMx/U4V3n
   49Yc5eCq+S2dzyQpKteZmOanXTme5zbADphfnRp6F+wf9uDeof0r+xqAO
   vbMLz4tUFJUZwR/Pq2UE3Pt9qk4+CUjeTLlQ2VCL/96F9VgIjmLGtlhwn
   KmvdQ8qWguHdC9xH/KJItMwS7NnMqD8j4rmbB4QYIryjWTYd+IFh8DfLW
   w==;
X-CSE-ConnectionGUID: BcDt+H4qQZa2Sjv9BSuOAw==
X-CSE-MsgGUID: qoMeJWC2RsKc3uE6dYlZFQ==
X-IronPort-AV: E=Sophos;i="6.08,227,1712646000"; 
   d="scan'208";a="194602811"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 10 Jun 2024 04:10:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 10 Jun 2024 04:09:35 -0700
Received: from wendy.microchip.com (10.10.85.11) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.35 via Frontend
 Transport; Mon, 10 Jun 2024 04:09:33 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-riscv@lists.infradead.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, "Daire
 McNamara" <daire.mcnamara@microchip.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Samuel Holland
	<samuel.holland@sifive.com>, <devicetree@vger.kernel.org>
Subject: [PATCH v1 0/5] PolarFire SoC Icicle Reference Design PCIe ?support?/fixes
Date: Mon, 10 Jun 2024 12:09:12 +0100
Message-ID: <20240610-vertical-frugally-a92a55427dd9@wendy>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2570; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=NsjQbAmUmlOlgifCA2KPWGuT+GynfWTjmgtIMLdbQcc=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGlp927uk9Wy2+Gote/W7y99N4VsbkT1zpL58l5DvH/7rS0y Qtr/OkpZGMQ4GGTFFFkSb/e1SK3/47LDuectzBxWJpAhDFycAjCRfy8ZGc7/05c6kzE9atczjjN77w ZtXtqkaB7AsTK/vjTnrbv4TF9GhnUpE1bHL2zUEgp3OMeow9q/JPpPFleUQZKnppDe1RO/+AE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_041020_532527_5D828507 
X-CRM114-Status: GOOD (  11.67  )
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

Here's some patches that add an Erratum to enable non-coherent DMA
support for PolarFire SoC. By nature of being an FPGA, and due to the
PCIe root ports being only 32-bit capable, many bitstreams configure the
FPGA fabric such that peripherals in the fabric become non-coherent. The
PCIe root ports on PolarFire SoC are connected to the core-complex via
the fabric, and therefore can be (and regularly are) made DMA
non-coherent. The Icicle Kit Reference Design has been configuring the
PCIe root port in this manner since late 2022 and in a way unsupported
by mainline since earlier that year. Adding this non-coherent DMA
support makes PCIe functional on those FPGA designs. Daire did almost all
the work to figure out how to support these kinds of designs, and this
series depends on his patches to introduce the required dma-ranges
handling for the root port driver:
https://lore.kernel.org/linux-pci/20240531085333.2501399-1-daire.mcnamara@microchip.com/

The final patch depends on:
https://lore.kernel.org/linux-pci/20240527-slather-backfire-db4605ae7cd7@wendy/

I'm not sure if an Erratum is really the right way to go about doing
this, but I didn't want to make ARCH_MICROCHIP depend on NONPORTABLE.
An alternative would be to add a menu under drivers/soc like Renesas
does and allow it to be toggled as an option there instead.

Thanks,
Conor.

CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh@kernel.org>
CC: Krzysztof Kozlowski <krzk+dt@kernel.org>
CC: Samuel Holland <samuel.holland@sifive.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org

Conor Dooley (5):
  cache: ccache: allow building for PolarFire
  cache: ccache: add mpfs to nonstandard cache ops list
  RISC-V: Add an MPFS erratum for PCIe
  riscv: dts: microchip: modify memory map & add dma-ranges for pcie on
    icicle
  riscv: dts: microchip: update pcie reg properties

 arch/riscv/Kconfig.errata                     | 19 +++++
 .../dts/microchip/mpfs-icicle-kit-fabric.dtsi | 77 ++++++++++++-------
 .../boot/dts/microchip/mpfs-icicle-kit.dts    | 44 +++++++++--
 .../dts/microchip/mpfs-m100pfs-fabric.dtsi    |  6 +-
 .../dts/microchip/mpfs-polarberry-fabric.dtsi |  6 +-
 drivers/cache/Kconfig                         |  2 +-
 drivers/cache/sifive_ccache.c                 |  2 +
 7 files changed, 116 insertions(+), 40 deletions(-)

-- 
2.43.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
