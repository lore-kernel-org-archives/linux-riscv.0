Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EE7DC6FA83
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Sep 2022 18:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fArfTGPNZGH5UaNbH64ANQfDuTnyLA31DSqsRM2vGxY=; b=RtMwmYc29gTu6H
	IAKHh52NMSWDyiokcSYIB6Nz/ocqILsn0xhJPbbW5UfVJaC5RJEzT37NGyWUfZxpUSEJ8aPucYCiT
	py0byKrYIrYZV03qQ+v9OzdIC1pRrK5UWVyZ+AUBojPsTr4VM30yW7MKRo2W8IkViSgP0z0z+4gmm
	LBFaMSSbmGdltZ+gsOeE5xOIMciVKrzbL08K6FMlSCoe4YKen2bGPohWQ/rxD5v5W4nYvpSI1h+By
	bhWYRc0HVE5zo+6Y11Rqj586bUmbFL70wdtvre6mpCarlsd1s7gfGi0gylX5KhaYrCEYjL5OlRH9l
	EwJqNO5k5e/JUOUWLJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrQ-005QJx-EP; Fri, 23 Sep 2022 18:57:16 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1obnrN-005QIz-15
	for linux-riscv@lists.infradead.org; Fri, 23 Sep 2022 18:57:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id AB44DB822B9;
	Fri, 23 Sep 2022 18:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE34BC433D6;
	Fri, 23 Sep 2022 18:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663959430;
	bh=FKYZa8jZM6zw7Dzd1nodjMmp1qxOOzY7+GqKVfBDXHQ=;
	h=From:To:Cc:Subject:Date:From;
	b=gpnHuWC5Z22mCN7RVa/SL5kUMi4AWRSVZ40Hj8HUtZ32vuFW++kwCfy77RFrlkzpG
	 eHMagmTFAKphMYJ4luEobRZR3hDp5uW75FDJhmH9Ds7+6lczJa9yZwZQA6OAzk7R/h
	 U6bFPnqVK31XKmXuyUm4ihXCg1M5e7A0yQpCdmJWGEnQuj8YQhRGl+4zweVPSkis25
	 XX4HvPT3ZRKirVYXpFLQuiypwPMiRyja0LzDqLYtJRQRLrP26gAjgW4WJnCYtLMi4x
	 5Z+K2AprOMNClhMXTx9O+Iee1oqKenhchhEHpudBWm+fOdBOXsXNIyzDMQXi6GPa2n
	 VLPD4KmmZ4rPQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: palmer@dabbelt.com,
	damien.lemoal@opensource.wdc.com,
	geert@linux-mk68.org,
	heiko@sntech.de,
	kernel@esmil.dk,
	arnd@arndb.de,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [RFC 00/27] RISC-V: Convert SOC_FOO symbols to ARCH_FOO
Date: Fri, 23 Sep 2022 19:55:39 +0100
Message-Id: <20220923185605.1900083-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220923_115713_390206_93AC6E4C 
X-CRM114-Status: GOOD (  16.78  )
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

Following on from LPC, here's the start of my efforts to clean up
Kconfig.socs.

My preference would be to take the whole thing through the RISC-V tree
for v6.2 to make things a bit less fiddly, but I am sending this as an
RFC in the hopes of getting some opinions on how the series should be
split up & merged. I guess it would always be possible to create a few
immutable branches for the individual subsystems that are being modified
& take the series through the riscv tree unless we hit a conflict in
-next. Obiviously for that route, maintainer acks will be needed.

The only SoCs I have, at the moment ;), are the jh7100, mpfs, fu540 and
the k210 so I've given those a whirl to make sure I didn't break
something.

I have also yet to deal with ARCH_VIRT, but just throwing this out for
some opinions on how to apply/split up the set before finalising a v1.

I've CCed a few people that may have an opinion here, but anyone that
has an opinion here - please shout!

One other point, is it worth adding something to the patch acceptance
policy to say "do your kconfig xyz way" or is that not something that's
worth doing since it is easy to push people in the right direction
during review?

The series is currently on top of:
https://lore.kernel.org/all/20220908142914.359777-1-cristian.ciocaltea@collabora.com/

Thanks,
Conor.

Conor Dooley (27):
  clk: microchip: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
  i2c: microchip-corei2c: replace SOC_MICROCHIP_POLARFIRE with
    ARCH_MICROCHIP
  mailbox: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
  usb: musb: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
  rtc: mpfs: replace SOC_MICROCHIP_POLARFIRE with ARCH_MICROCHIP
  riscv: stop selecting the PolarFire SoC clock driver
  riscv: replace SOC_STARFIVE with ARCH_STARFIVE
  clk: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
  pinctrl: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
  reset: starfive: replace SOC_STARFIVE with ARCH_STARFIVE
  riscv: replace SOC_SIFIVE with ARCH_SIFIVE
  soc: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
  clk: sifive: convert SOC_SIFIVE to ARCH_SIFIVE
  clk: sifive: select by default if ARCH_SIFIVE
  serial: sifive: select by default if ARCH_SIFIVE
  PCI: dwc: fu740: convert SOC_SIFIVE to ARCH_SIFIVE
  riscv: stop selecting SiFive clock and serial drivers directly
  riscv: convert SOC_VIRT to ARCH_VIRT
  kunit: tool: rename SOC_VIRT to ARCH_VIRT in riscv's QEMU config
  wireguard: selftests: swap SOC_VIRT for ARCH_VIRT on riscv
  riscv: convert SOC_CANAAN to ARCH_CANAAN
  clk: k210: convert SOC_CANAAN to ARCH_CANAAN
  pinctrl: k210: convert SOC_CANAAN to ARCH_CANAAN
  soc: k210: convert SOC_CANAAN to ARCH_CANAAN
  reset: k210: convert SOC_CANAAN to ARCH_CANAAN
  serial: sifive: select by default if ARCH_CANAAN
  riscv: stop directly selecting drivers for ARCH_CANAAN

 arch/riscv/Kconfig.socs                       | 30 +++++++------------
 arch/riscv/Makefile                           |  2 +-
 arch/riscv/boot/dts/Makefile                  |  2 +-
 arch/riscv/boot/dts/canaan/Makefile           | 14 ++++-----
 arch/riscv/boot/dts/sifive/Makefile           |  2 +-
 arch/riscv/boot/dts/starfive/Makefile         |  2 +-
 arch/riscv/configs/defconfig                  |  6 ++--
 arch/riscv/configs/nommu_k210_defconfig       |  2 +-
 .../riscv/configs/nommu_k210_sdcard_defconfig |  2 +-
 arch/riscv/configs/nommu_virt_defconfig       |  2 +-
 arch/riscv/configs/rv32_defconfig             |  4 +--
 drivers/clk/Kconfig                           |  4 +--
 drivers/clk/Makefile                          |  2 +-
 drivers/clk/microchip/Kconfig                 |  3 +-
 drivers/clk/sifive/Kconfig                    |  4 ++-
 drivers/clk/starfive/Kconfig                  |  6 ++--
 drivers/i2c/busses/Kconfig                    |  2 +-
 drivers/mailbox/Kconfig                       |  2 +-
 drivers/pci/controller/dwc/Kconfig            |  2 +-
 drivers/pinctrl/Kconfig                       |  8 ++---
 drivers/reset/Kconfig                         |  8 ++---
 drivers/rtc/Kconfig                           |  2 +-
 drivers/soc/Makefile                          |  4 +--
 drivers/soc/canaan/Kconfig                    |  4 +--
 drivers/soc/sifive/Kconfig                    |  2 +-
 drivers/tty/serial/Kconfig                    |  2 ++
 drivers/usb/musb/Kconfig                      |  2 +-
 tools/testing/kunit/qemu_configs/riscv.py     |  2 +-
 .../wireguard/qemu/arch/riscv32.config        |  2 +-
 .../wireguard/qemu/arch/riscv64.config        |  2 +-
 30 files changed, 64 insertions(+), 67 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
