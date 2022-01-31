Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49B4BC43219
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:45:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=SVQp+lFzLN4J92XaBK3soYNIOZe5B/+zKymXycioMcE=; b=zrpr/MlJMyR7cg
	yx3lOrJ8WLfEO+W8rgvBlZiNai0ZPA9UWG566gGWqniSsGnnJDFsLLQpZZsdcHJbjC0uITRDwZJA9
	QGF/Gwmaa5pe/Hz4L869SRz805a7FBXq7nYC7ZK+0KiM9Nu2QMgnNj8C+a9zr+Uf7qjjKL3ROQb4+
	ao7dkXf/NYKkmaUJbiKbzw9LUSIgGBq3EXfk+5dFEP5XbrDjVrDRbFlesCyj4aOqq+XluEfRHQvVv
	vzE3pvJ1aoysgzalTukva4UiuJ+Cq4UWJyoVmtkgp7vwuA1rSVT6fh6M/RlcxUNrASInPFkmlKgJ5
	6VgCUmTRGuT5P8RIkH8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV7p-009BVp-NB; Mon, 31 Jan 2022 11:45:37 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV7m-009BUO-0o
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:45:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629533; x=1675165533;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=qaDyYutC4DMWlORMqJ4RRry+JwfuVOx8TPg8xTh5c6g=;
 b=xrLdeHh0yNPqUezdWnKXUOfbyEgaAESKk6AApgwL4+bdGEislqwfvDzX
 7qZOoQybuwp48YjCgtxXCs5FWHO7wH8yqXPcI5B1Eh/LZENZBj/S6rsr4
 M9QcqtVuLhFipOUfhmdU/o/FLKe7huSN9NfUyDKzO7T9FI/r7LciZ4Ygb
 XPQoz0pOXC7F5btyiqi8nKm0Te+BER0lx/Vs6BzSvMK9ZleIN5LcAt19f
 vPT9CK6PNdWSUKwteBpITD90mRTrqKP+b/DcYaicggXNMQ75vH7D4y+7Z
 sjYWraNYHZBzHPjIHV3LkBeiS6g6g/Q2mNWS24dZtQ682YsKclDCMAesc A==;
IronPort-SDR: 6AbAz63xhdKutO6wmjfyWT5TCdnTeZSXwqiEawG4GhgdT7JhGKaHo2bWof7F3zZO+nMuLbpMz+
 iAUi7IWPvEf9nEjAKFsdX72SoSlJpDNbvb6O0pEqF+xYlJ6oGVwtrhGb23tkDiezWrpvdyUvLr
 ij+j1BHJDXwxieNEyZkb3nPrbacktK4X5fcp60/q1VVhA5EMXvoa4CSNNku6RCpG6Hk8DIc9fz
 NJ+phcmwBqgtMcIKssiM6s7K2AFyztlhvLYep5g7FPCsHRjr8As6J/EXyw8BkoTdKZ6c79fkdd
 5hqj8ybUtWXfpebQMQT4pnAy
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="160544943"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:45:31 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:45:31 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:45:26 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v5 00/12] Update the Icicle Kit device tree
Date: Mon, 31 Jan 2022 11:47:15 +0000
Message-ID: <20220131114726.973690-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034534_158237_258E71CD 
X-CRM114-Status: GOOD (  13.71  )
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

This series updates the Microchip Icicle Kit device tree by adding a
host of peripherals, and some updates to the memory map. In addition,
the device tree has been split into a third part, which contains "soft"
peripherals that are in the fpga fabric.

Several of the entries are for peripherals that have not get had their
drivers upstreamed, so in those cases the dt bindings are included where
appropriate in order to avoid the many "DT compatible string <x> appears
un-documented" errors.

Depends on mpfs clock driver binding (on clk/next) to provide 
dt-bindings/clock/microchip,mpfs-clock.h
and on the other changes to the icicle/mpfs device tree from geert
that are already in linux/riscv/for-next.

Additionally, the interrupt-extended warnings on the plic/clint are 
cleared by [1] & [2].

[1] https://lore.kernel.org/linux-riscv/cover.1639744468.git.geert@linux-m68k.org/
[2] https://lore.kernel.org/linux-riscv/cover.1639744106.git.geert@linux-m68k.org/

Changes from v4:
- dont include icicle_kit_defconfig, accidentally added in v3
- drop prescaler from mpfs-rtc & calculate the value instead
- use corei2c as a fallback device for mpfs-i2c
- drop spi dt-binding (on spi-next)
  commit 2da187304e556ac59cf2dacb323cc78ded988169
- drop usb dt-binding (on usb-next)

Changes from v3:
- drop "mailbox: change mailbox-mpfs compatible string", already upstream:
  commit f10b1fc0161cd99e ("mailbox: change mailbox-mpfs compatible string")
- fix copy paste error in microchip,mpfs-mailbox dt-binding
- remove whitespace in syscontroller dt entry

Changes from v2:
- dropped plic int header & corresponding defines in dts{,i}
- use $ref to drmode in mpfs-musb binding
- split changes to dts{,i} again: functional changes to existing
  elements now are in a new patch
- drop num-cs property in mpfs-spi binding
- dont make the system controller a simple-mfd
- move the separate bindings for rng/generic system services into the 
  system controller binding
- added an instance corei2c as i2c2 in the fabric dtsi
- add version numbering to corepwm and corei2c compat string (-rtl-vN)

Conor Dooley (12):
  dt-bindings: soc/microchip: update syscontroller compatibles
  dt-bindings: soc/microchip: add services as children of sys ctrlr
  dt-bindings: i2c: add bindings for microchip mpfs i2c
  dt-bindings: rtc: add bindings for microchip mpfs rtc
  dt-bindings: gpio: add bindings for microchip mpfs gpio
  dt-bindings: pwm: add microchip corepwm binding
  riscv: dts: microchip: use clk defines for icicle kit
  riscv: dts: microchip: add fpga fabric section to icicle kit
  riscv: dts: microchip: refactor icicle kit device tree
  riscv: dts: microchip: update peripherals in icicle kit device tree
  riscv: dts: microchip: add new peripherals to icicle kit device tree
  MAINTAINERS: update riscv/microchip entry

 .../bindings/gpio/microchip,mpfs-gpio.yaml    |  80 ++++++
 .../bindings/i2c/microchip,mpfs-i2c.yaml      |  57 ++++
 ...ilbox.yaml => microchip,mpfs-mailbox.yaml} |   6 +-
 .../bindings/pwm/microchip,corepwm.yaml       |  75 +++++
 .../bindings/rtc/microchip,mfps-rtc.yaml      |  58 ++++
 .../microchip,mpfs-sys-controller.yaml        |  72 +++++
 ...icrochip,polarfire-soc-sys-controller.yaml |  35 ---
 MAINTAINERS                                   |   2 +
 .../dts/microchip/microchip-mpfs-fabric.dtsi  |  25 ++
 .../microchip/microchip-mpfs-icicle-kit.dts   | 115 ++++++--
 .../boot/dts/microchip/microchip-mpfs.dtsi    | 262 +++++++++++++++---
 11 files changed, 683 insertions(+), 104 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/gpio/microchip,mpfs-gpio.yaml
 create mode 100644 Documentation/devicetree/bindings/i2c/microchip,mpfs-i2c.yaml
 rename Documentation/devicetree/bindings/mailbox/{microchip,polarfire-soc-mailbox.yaml => microchip,mpfs-mailbox.yaml} (82%)
 create mode 100644 Documentation/devicetree/bindings/pwm/microchip,corepwm.yaml
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,mpfs-sys-controller.yaml
 delete mode 100644 Documentation/devicetree/bindings/soc/microchip/microchip,polarfire-soc-sys-controller.yaml
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
