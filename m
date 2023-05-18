Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4515EC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 18:57:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kziEsP0XbjYexOR0802hljOAQKtqGrCT4MW11oEZMEQ=; b=tHsnrNyjsRt/tj
	+zwCHvMuNazqb3s0nXrlCGL70xbRyxc8n/Bau7iJ5GZ5d93na43UC5GSyOF6x5fFupTnxq2cFLTal
	SieSR0pmbrphexZql/YJcjOS6Fg3l5z5Hqzp+YPElAX07eZPV/sZ49KrnXclU2ESQyCzOag+ugjQU
	LF3CrKwfGf37pxZc1DwFbiR2a+Vkue6Gtvz7HcKxNVVGa6+5MsCFIRS/PoTzh32KiduYf+UQNYUJW
	5BZI4RZzCMMA+lz2hSPzCOxbxFfOO++zP9IGsQWlFaNNk5cwprwbtbKTXR6y8t6aB0X9tohwsW/iO
	dXcxPzvpsEx/w6LgQarg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio3-00DsrL-1Q;
	Thu, 18 May 2023 18:56:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzio0-00Dsqb-37
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 18:56:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 60DFF614CA;
	Thu, 18 May 2023 18:56:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00FA5C433D2;
	Thu, 18 May 2023 18:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684436211;
	bh=MdvnMPPrQ/vtDiMGVDWtOIyHdjO99rGYjST9u7UGOX0=;
	h=From:To:Cc:Subject:Date:From;
	b=PcXlB8MZgZ4xhZB32EeIs8927VsmYw+q0bfWMgLbrj6uSBAHsdfw6MoVaJWzn1A8o
	 ZOoB0DKH6M/e+KPgvbEMURCrSvm7CMaUlgnTNGkqstz+FtWH2LlrxVZDQmxMwFWoNy
	 s8s67LacTxXK+WkLvLSb6kA//lWr2wjdxT/H5ITARbhWtq3a5LWgNGV/asS/IL6Y7n
	 umcG0apV8J3wPxvQ5EKvmxurUj/CiGIllSJQNzvxZSU1NkiSKCKJokcoUoE1nuVjGM
	 BTi2xIqNZJx6tstME5f/2g992abZS9aHQ+xseKv425eaYPHH11vFnMbHN6apO2w7wN
	 +zA2zGa/xa+Ew==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Guo Ren <guoren@kernel.org>
Subject: [PATCH v2 0/9] Add Sipeed Lichee Pi 4A RISC-V board support
Date: Fri, 19 May 2023 02:45:32 +0800
Message-Id: <20230518184541.2627-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_115653_081332_21C99D82 
X-CRM114-Status: GOOD (  16.22  )
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
Cc: devicetree@vger.kernel.org, Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Wei Fu <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Sipeed's Lichee Pi 4A development board uses Lichee Module 4A core
module which is powered by T-HEAD's TH1520 SoC. Add minimal device
tree files for the core module and the development board.

Support basic uart/gpio/dmac drivers, so supports booting to a basic
shell.

FWICT, one issue I'm not sure is the cpu reset dt-binding: IIUC, the
secondary CPUs in T-HEAD SMP capable platforms need some special
handling. The first one is to write the warm reset entry to entry
register. The second one is write a SoC specific control value to
a SoC specific control reg. The last one is to clone some CSRs for
secondary CPUs to ensure these CSRs' values are the same as the
main boot CPU. This DT node is mainly used by opensbi firmware.
Any suggestion about this reset dt-binding is appreciated!

Thanks

Since v1:
  - add missing plic, clint, th1520 itself dt-bindings
  - use c900-plic
  - s/light/th1520
  - add dt-binding for T-HEAD CPU reset
  - enable ARCH_THEAD in defconfig
  - fix all dtbs_check error/warning except the CPU RESET, see above.

Jisheng Zhang (9):
  dt-bindings: interrupt-controller: Add T-HEAD's TH1520 PLIC
  dt-bindings: timer: Add T-HEAD TH1520 clint
  dt-bindings: riscv: Add T-HEAD TH1520 board compatibles
  dt-binding: riscv: add T-HEAD CPU reset
  riscv: Add the T-HEAD SoC family Kconfig option
  riscv: dts: add initial T-HEAD TH1520 SoC device tree
  riscv: dts: thead: add sipeed Lichee Pi 4A board device tree
  MAINTAINERS: add entry for T-HEAD RISC-V SoC
  riscv: defconfig: enable T-HEAD SoC

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../bindings/riscv/thead,cpu-reset.yaml       |  69 +++
 .../devicetree/bindings/riscv/thead.yaml      |  29 ++
 .../bindings/timer/sifive,clint.yaml          |   1 +
 MAINTAINERS                                   |   6 +
 arch/riscv/Kconfig.socs                       |   6 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/thead/Makefile            |   2 +
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  38 ++
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    |  32 ++
 arch/riscv/boot/dts/thead/th1520.dtsi         | 451 ++++++++++++++++++
 arch/riscv/configs/defconfig                  |   1 +
 12 files changed, 637 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/thead,cpu-reset.yaml
 create mode 100644 Documentation/devicetree/bindings/riscv/thead.yaml
 create mode 100644 arch/riscv/boot/dts/thead/Makefile
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
 create mode 100644 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
 create mode 100644 arch/riscv/boot/dts/thead/th1520.dtsi

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
