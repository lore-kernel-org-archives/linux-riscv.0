Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29F53C43219
	for <linux-riscv@archiver.kernel.org>; Thu, 27 Jan 2022 15:17:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=znIafXsDXbV5ldaCNgod33VTirtFcMc7lkbNzbe3zEg=; b=McSYIfXFM8o/Q0
	os4hJ6s3Rana0EogIOwZp2NC9L3QdbmQHhR2+qNpBngNhxkG6OkWSMDZi17w0MQOFqHs37oVnzX04
	jfi5tYosK7A7luYV9rpfuDScvmFyHiBZ4VqyWeqtqo5fMXam3t/fvJvpqcQV/383OuF0A7wZWrTHu
	x770dZyqDOyeag7s6WrYHGVRAahjAmuDJtBCUASx7Ny5Y/6KZ3NwLT3iEYbdaiq+lqrmTqh2/Fr7u
	7Dh+yk//uvbeTRd+AsWNMb0KV3n6lp9sz1jGj77wYKAJ4Hu/6KfuuUsLYnzbGCFgM1sehJ9Nma98g
	sxfgQAtD45xpx86Gc5LQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nD6WH-00GBzd-9r; Thu, 27 Jan 2022 15:17:05 +0000
Received: from out28-76.mail.aliyun.com ([115.124.28.76])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nD6WC-00GBwQ-AK
 for linux-riscv@lists.infradead.org; Thu, 27 Jan 2022 15:17:02 +0000
X-Alimail-AntiSpam: AC=CONTINUE; BC=0.4309704|-1; CH=green; DM=|CONTINUE|false|;
 DS=CONTINUE|ham_system_inform|0.0724481-0.000318653-0.927233;
 FP=0|0|0|0|0|-1|-1|-1; HT=ay29a033018047190; MF=icenowy@nucleisys.com; NM=1;
 PH=DS; RN=10; RT=10; SR=0; TI=SMTPD_---.Mj85OyW_1643296608; 
Received: from ice-e5v2.lan(mailfrom:icenowy@nucleisys.com
 fp:SMTPD_---.Mj85OyW_1643296608)
 by smtp.aliyun-inc.com(33.45.46.134); Thu, 27 Jan 2022 23:16:53 +0800
From: Icenowy Zheng <icenowy@nucleisys.com>
To: Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-serial@vger.kernel.org,
 linux-spi@vger.kernel.org, Icenowy Zheng <icenowy@nucleisys.com>
Subject: [PATCH 00/12] Initial support for Nuclei DemoSoC w/ UX600
Date: Thu, 27 Jan 2022 23:16:35 +0800
Message-Id: <20220127151647.2375449-1-icenowy@nucleisys.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220127_071700_624259_19F6828B 
X-CRM114-Status: UNSURE (   8.68  )
X-CRM114-Notice: Please train this message.
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

This patchset adds support for Nuclei DemoSoC (which is an evaluation
platform made with Nuclei CPU cores and mainly peripherals in original
Hummingbird E203 project, running on FPGA) with UX600 CPU cores.

Most patches are for DT bindings, the remaining ones are adding a
Kconfig option and some DTS/DTSI files. The last one is a workaround for
a severe bug in currently released versions of UX600, which is found
in 5.17 kernel, in which Sv48 support is added to Linux.

Two non-technical patches are in this patchset too, for MAINTAINERS
and .mailmap items.

Icenowy Zheng (12):
  dt-bindings: vendor-prefixes: add Nuclei
  RISC-V: add Nuclei SoC Kconfig option
  dt-bindings: riscv: add compatible strings for Nuclei UX600 series
  dt-bindings: timer: add compatible for Nuclei UX600 CLINT-compat timer
  dt-bindings: interrupt-controller: add compatible string for UX600
    PLIC
  dt-bindings: serial: add compatible string for Nuclei DemoSoC UART
  dt-bindings: spi: add compatible string for Nuclei DemoSoC SPI
  dt-bindings: riscv: add binding for Nuclei platform boards
  riscv: dts: add device tree for Nuclei DemoSoC w/ UX600 on DDR200T
  RISC-V: workaround Nuclei UX600 cores with broken SATP CSR
  MAINTAINERS: add myself as Nuclei SoCs/CPUs supporter
  mailmap: add Icenowy Zheng's Nuclei mail addresses

 .mailmap                                      |  1 +
 .../sifive,plic-1.0.0.yaml                    |  1 +
 .../devicetree/bindings/riscv/cpus.yaml       |  7 ++
 .../devicetree/bindings/riscv/nuclei.yaml     | 27 ++++++++
 .../bindings/serial/sifive-serial.yaml        |  1 +
 .../devicetree/bindings/spi/spi-sifive.yaml   |  1 +
 .../bindings/timer/sifive,clint.yaml          |  1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  7 ++
 arch/riscv/Kconfig.socs                       |  6 ++
 arch/riscv/boot/dts/Makefile                  |  1 +
 arch/riscv/boot/dts/nuclei/Makefile           |  2 +
 .../dts/nuclei/nuclei-demosoc-ddr200t.dtsi    | 41 ++++++++++++
 .../nuclei/nuclei-demosoc-ux600-ddr200t.dts   | 13 ++++
 .../boot/dts/nuclei/nuclei-demosoc-ux600.dtsi | 49 ++++++++++++++
 .../riscv/boot/dts/nuclei/nuclei-demosoc.dtsi | 67 +++++++++++++++++++
 arch/riscv/include/asm/vendorid_list.h        |  1 +
 arch/riscv/mm/init.c                          | 17 +++++
 18 files changed, 245 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/nuclei.yaml
 create mode 100644 arch/riscv/boot/dts/nuclei/Makefile
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ddr200t.dtsi
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600-ddr200t.dts
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc-ux600.dtsi
 create mode 100644 arch/riscv/boot/dts/nuclei/nuclei-demosoc.dtsi

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
