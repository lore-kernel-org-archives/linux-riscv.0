Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C321C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Feb 2023 16:41:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oGFFWBPy5vb+zpd49uEGk302Lh/U9+8raYsoVxDGZS8=; b=NFgWX3Dw9w+/iA
	wmLCSDthORJbFcRflS1IBBkI3dciCgKbCgqXXNQ8bPkjrpgMJ+MspTr/VgAgEHq8ZS8p5r3Ke96no
	quW8OSXzTe2/Yc7wfcvw4b+wRXCX8uEsU9IRky/Vz/aXshHonia+EeEWVHx/dwb8was+IQRfFa+Au
	DEF7/1pQOhwgwHxT6SNQ9/nxerjM5IjjzPq2g6HcZ7HlUqc2KYJ7Mn8cmnYCLWtZXOKRH98jxC2sS
	sJatVy3aiHCHXwrGcV2gohkC6VTl8HbeTEP7LKCodrcXQoAX/TPfEY2nrSkzP4huoJF7tAkpu4mIS
	AHPvn5XqFqYgGNVJskaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3n4-00F7HQ-45; Fri, 17 Feb 2023 16:40:54 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pT3mt-00F7DR-Rk
	for linux-riscv@lists.infradead.org; Fri, 17 Feb 2023 16:40:47 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 69D10B82B42;
	Fri, 17 Feb 2023 16:40:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9402FC433EF;
	Fri, 17 Feb 2023 16:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1676652041;
	bh=rmWBKZ+kPA2hUTIl4dipdQ5MuLzgCCO85eiyabtlaR8=;
	h=From:To:Cc:Subject:Date:From;
	b=JISBcVvwSVhwD8ydNdtR8fNanFcFSbKOUTVPD7OoLoYSVd7+MGaIVHUnLcfXZ86HP
	 +x6yWRs17/2GhQbKYDJukflhfB+kd9ry0jIA6HsQwa3zvCmoNbcKDvUkMR8rGpUHo3
	 l19sEacxYW2QGYNU7UnlGFx4tc2gjXMx72cy029iMg9upRVWlDpMdLzibWxIZ3dyhK
	 iYkA6efl9/I3bUbdZ2FIV+pvWYch7CDKHj2i+z2KdDTDPFP8GAcAS2CQ+vkRCJPcH4
	 L4v3yoNKdUyEjLyUP8IQvwkHgIm8+zfSF277MVDk3xSHsqDSODwfo7X+1LKyMcdMG0
	 YMuQEV9Xn5RLg==
From: Conor Dooley <conor@kernel.org>
To: Xu Yilun <yilun.xu@intel.com>,
	conor@kernel.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Moritz Fischer <mdf@kernel.org>,
	Wu Hao <hao.wu@intel.com>,
	Tom Rix <trix@redhat.com>,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-fpga@vger.kernel.org
Subject: [PATCH v1 0/6] PolarFire SoC Auto Update Support
Date: Fri, 17 Feb 2023 16:40:17 +0000
Message-Id: <20230217164023.14255-1-conor@kernel.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067; i=conor.dooley@microchip.com; h=from:subject; bh=mkXk5MOQJ1YMEavNc6St4EA6j9TWtSU8tsLYKbnhkSA=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnv1761brJ98f31FJ/aQ0nTvlyob26oY+x517rPdMFZjn/P tjP97yhlYRDjYJAVU2RJvN3XIrX+j8sO5563MHNYmUCGMHBxCsBEllsy/HedUn3owZq/U7pvunt8bq qXu5N1n/Wg61VfzwbRO+dV1jcwMvyfosnnI8255dlW9/SosHczw47cFHQMqnLl4NS7eWCxDj8A
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230217_084044_230115_86FACFCD 
X-CRM114-Status: GOOD (  18.82  )
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

From: Conor Dooley <conor.dooley@microchip.com>

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
https://patchwork.kernel.org/project/linux-riscv/list/?series=714160

The patch adding the driver depends on the soc patches earlier in the
series, so taking both through the same tree makes sense. Depending on
sequencing with the dependencies, me taking it through the soc tree
(with Acks etc of course) may make the most sense.

The other caveat here I guess is that this uses debugfs to trigger the
write, as we do not yet have a userspace for this yet!

Cheers,
Conor.

CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Rob Herring <robh+dt@kernel.org>
CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
CC: Moritz Fischer <mdf@kernel.org>
CC: Wu Hao <hao.wu@intel.com>
CC: Xu Yilun <yilun.xu@intel.com>
CC: Tom Rix <trix@redhat.com>
CC: linux-riscv@lists.infradead.org
CC: devicetree@vger.kernel.org
CC: linux-kernel@vger.kernel.org
CC: linux-fpga@vger.kernel.org

Conor Dooley (6):
  soc: microchip: mpfs: add a prefix to rx_callback()
  dt-bindings: soc: microchip: add a property for system controller
    flash
  soc: microchip: mpfs: enable access to the system controller's flash
  soc: microchip: mpfs: add auto-update subdev to system controller
  fpga: add PolarFire SoC Auto Update support
  riscv: dts: microchip: add the mpfs' system controller qspi &
    associated flash

 .../microchip,mpfs-sys-controller.yaml        |  10 +
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |  21 +
 arch/riscv/boot/dts/microchip/mpfs.dtsi       |  24 +-
 drivers/fpga/Kconfig                          |   9 +
 drivers/fpga/Makefile                         |   1 +
 drivers/fpga/microchip-auto-update.c          | 495 ++++++++++++++++++
 drivers/soc/microchip/Kconfig                 |   1 +
 drivers/soc/microchip/mpfs-sys-controller.c   |  33 +-
 include/soc/microchip/mpfs.h                  |   2 +
 9 files changed, 586 insertions(+), 10 deletions(-)
 create mode 100644 drivers/fpga/microchip-auto-update.c

-- 
2.39.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
