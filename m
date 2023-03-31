Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0924C76196
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 07:19:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iF87QDwNplcOG970irFL/Tc7gyErqOiPLHiYfaGsbN4=; b=YIgCj02YxTIAK8
	2M3Uv2AdALHmi3gwvt/CiYN5263iQ4/oLGTnASy7MrLtDLkZ+dr2vIr9OfnHRg2OhUr2vVGm+a56b
	F6g9B15ppIDN+85Z+tltdGRrwdlHOdSh3EdxsTwlCk/cek4FS1w42jModzLSYw+16uTSK/1XcoQcn
	5baj8JdbgHYvM/YTo1pIjbvi30fWD3veECayit/gLFPFRzWC+fsqfNfTIvMGG1hUtzIGpPn4I6/W0
	UHHehJlKuD+r5YLj76vwZM3NVxPBAAOmgUeKVIuI0mqzdw8FOSmsTQxuztReCFMBz97DCWuMCduCT
	mASW7GjJD5DcqbKGZaSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pi92C-0067zL-2t;
	Fri, 31 Mar 2023 07:18:52 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pi929-0067yC-2j
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 07:18:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680247129; x=1711783129;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=admgRHBqiFlgszn7eKUdyOKDiJrJarBBjh/92wZzpo8=;
  b=sWZcJE37xyxX46Ztk8WOM6NL/t0IWebvkSOVPGcu9btdXekiqJG73a0R
   cWWGOKupJfX/QkvcEm8GGOXZTJhGvrWaaIhIefpcvvOAlHr6oa9SHQYAQ
   Z9UoVkNZNNpjkzoRw7EnrGtIIOzdgyE+nEyzC9cTGHyIeAKYT7LjvIaJL
   0fe6MmT7Evcm1b+aCxKbGu9RmMmO/RKCMydXTsAUhP6WnRuFc7sauJeEO
   K66cekKSNaYEljYbGmuJQ2wXcbkFGWycHjZyaXIFi4xPD1vuB3xFwc3T/
   ijJsOKSPpQt2dhxtTdYI6g6JGvu4PqxKATZ1nma7EH2/NKP7NqXoQ+8AX
   Q==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="scan'208";a="218823289"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 00:18:44 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 00:18:43 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 00:18:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <linux-fpga@vger.kernel.org>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Moritz Fischer
	<mdf@kernel.org>, Wu Hao <hao.wu@intel.com>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, <linux-riscv@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/7] PolarFire SoC Auto Update Support
Date: Fri, 31 Mar 2023 08:18:16 +0100
Message-ID: <20230331071823.956087-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3495; i=conor.dooley@microchip.com; h=from:subject; bh=admgRHBqiFlgszn7eKUdyOKDiJrJarBBjh/92wZzpo8=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClqnZYe/vKO79U8tFX0/79wTjwUZ/yYac9WjcvSdTOU9MJi Tut0lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCIvnRkZdtwQ/D43rPTb81dP3qfL+2 8t2fLweeW0h6qzRCSVtu6LkmD4HxcklPTpHs/SG+fntUe46vg9/Ftrc6zHZ9orJx77lWcLuQA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_001849_939205_B0222600 
X-CRM114-Status: GOOD (  18.53  )
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

This patchset adds support for the "Auto Update" feature on PolarFire
SoC that allows for writing an FPGA bistream to the SPI flash connected
to the system controller.
On powercycle (or reboot depending on how the firmware implements the
openSBI SRST extension) "Auto Update" will take place, and program the
FPGA with the contents of the SPI flash - provided that that image is
valid and an actual upgrade from that already programmed!

Unfortunately, this series is not really testable yet - the Engineering
Sample silicon on most dev boards has a bug in the QSPI controller
connected to the system controller's flash and cannot access it.
Pre-production and later silicon has this bug fixed.

I previously posted an RFC about my approach in this driver, since as a
flash-based FPGA we are somewhat different to the existing
self-reprogramming drivers here. That RFC is here:
https://lore.kernel.org/linux-fpga/20221121225748.124900-1-conor@kernel.org/

This series depends on the following fixes:
https://lore.kernel.org/all/d7c3ec51-8493-444a-bdec-2a30b0a15bdc@spud/

The patch adding the driver depends on the soc patches earlier in the
series, so taking both through the same tree makes sense. Depending on
sequencing with the dependencies, me taking it through the soc tree
(with Acks etc of course) may make the most sense.

Cheers,
Conor.

Changes in v2:
- per Russ' suggestion, the driver has been switched to using the
  firmware-upload API rather than the fpga one
- as a result of that change, the structure of the driver has changed
  significantly, although most of that is reshuffling existing code
  around
- check if the upgrade is possible in probe and fail if it isn't
- only write the image index if it is not already set
- delete the now unneeded debugfs bits

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Moritz Fischer <mdf@kernel.org>
CC: Wu Hao <hao.wu@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>
CC; Russ Weight <russell.h.weight@intel.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fpga@vger.kernel.org

Conor Dooley (7):
  soc: microchip: mpfs: add a prefix to rx_callback()
  dt-bindings: soc: microchip: add a property for system controller
    flash
  soc: microchip: mpfs: enable access to the system controller's flash
  soc: microchip: mpfs: print service status in warning message
  soc: microchip: mpfs: add auto-update subdev to system controller
  fpga: add PolarFire SoC Auto Update support
  riscv: dts: microchip: add the mpfs' system controller qspi &
    associated flash

 .../microchip,mpfs-sys-controller.yaml        |  10 +
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  24 +-
 drivers/fpga/Kconfig                          |  11 +
 drivers/fpga/Makefile                         |   3 +-
 drivers/fpga/microchip-auto-update.c          | 494 ++++++++++++++++++
 drivers/soc/microchip/Kconfig                 |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c   |  37 +-
 include/soc/microchip/mpfs.h                  |   2 +
 9 files changed, 591 insertions(+), 12 deletions(-)
 create mode 100644 drivers/fpga/microchip-auto-update.c

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
