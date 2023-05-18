Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1CEBC7EE23
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 15:34:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+sOoMTZ/Gij3GaWQhrIlVj+K//3zExOdeEC95fJiphw=; b=iNsM3sS9xULCnY
	zwmm5/FJ2TjIyDbQxNk+5lrzHwq06JcMnuroIem/zRpy/r2BhkHa1Qsix2m6c8QyyxX+QYVXHBd1h
	bOLNDGg79CW9cnvBWCXw+zbRrEv4iwX3YNZn26fE3xOd9AV2ImVBmdPZ5L0K/yyIM+Lh6iR1KzyRm
	89DVar4ddtT3DxAtujUHEOgIJL+cr1+VUEvXrLqqeJRy8luV5HUVCJ1qAPfA8ScsBOD93SYmrmhe4
	STc06KEATAZpcWNPScDYYEhTfBchhvqEd2gYPqNRBWkLTfkPcOTzYOQDt2JRHzMw6y+Re4ep4u30L
	mNl2IRDxjcLMMb3CjM3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdg-00DJoO-1n;
	Thu, 18 May 2023 15:34:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzfdd-00DJnq-1S
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 15:33:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 5D30365028;
	Thu, 18 May 2023 15:33:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AB67BC433D2;
	Thu, 18 May 2023 15:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684424035;
	bh=Idwi7pRttqveLxo342VgrsknBdG/Au/cKRfftR8uEfI=;
	h=From:To:Cc:Subject:Date:From;
	b=NIF7wQwjVOQEUO5xrDWJvv67MCL86sfKCsUrui3Tb0RW0bGUc7fXDF9W0AOwLaNV8
	 YeFFPfbhYUIHnZH/T/gY7jeug1/bCL1hryRXp9HdiWtYD6mWxkJVT0vrexNjYo1H8z
	 Hz2O2lFWfjlW9RRIcHBIExnwnV6gW/DC+kEKzVCrXDyw9MpIr6J+Y2DQELB1OJEF0N
	 FbcQyKTY/+mXNqyCnmRSCiRx8Sl3JRbm/CHRicQ2L0Fu/a65uQBZSWSKAnHdLhbfc+
	 voKTAOWOhPAeCNEKuafI4+en8us7bKh/TGXKArKdWv4KppBmDvLMmbcos1DXESE2eT
	 UqQNBfpVbar2Q==
From: Jisheng Zhang <jszhang@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v4 00/10] riscv: add Bouffalolab bl808 support
Date: Thu, 18 May 2023 23:22:34 +0800
Message-Id: <20230518152244.2178-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_083357_582234_ED23AE2E 
X-CRM114-Status: GOOD (  13.63  )
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

This series adds Bouffalolab uart driver and basic devicetrees for
Bouffalolab bl808 SoC and Sipeed M1s dock board.

Since v3:
  - fix build error reported by lkp@intel.com
  - fix earlycon compatible string
  - fix dtbs_check
  - collect Reviewed-by tag

Since v2:
  - fix dt_binding_check and dtbs_check warnings
  - use uart_port_tx_limited() helper in uart driver
  - collect Acked-by/Reviewed-by tag
  - uart0 -> uart3
  - update "riscv,ndev" property
  - mv vendor prefix binding as the first patch
  - add compatible string for bouffalolab bl808 plic

Since v1:
  - use FIELD_PREP and FIELD_GET macro
  - rewrite bflb_uart_tx_chars()
  - add vendor prefix for bouffalolab
  - add dt binding for bl808 compatibles
  - enable SOC_BOUFFALOLAB in defconfig
  - collect Reviewed-by tag
  - modify commit-msg as suggested


Jisheng Zhang (10):
  dt-bindings: vendor-prefixes: add bouffalolab
  dt-bindings: interrupt-controller: Add bouffalolab bl808 plic
  dt-bindings: serial: add documentation for Bouffalolab UART Driver
  serial: bflb_uart: add Bouffalolab UART Driver
  riscv: add the Bouffalolab SoC family Kconfig option
  dt-bindings: riscv: Add bouffalolab bl808 board compatibles
  riscv: dts: bouffalolab: add the bl808 SoC base device tree
  riscv: dts: bouffalolab: add Sipeed M1s SoM and Dock devicetree
  MAINTAINERS: riscv: add entry for Bouffalolab SoC
  riscv: defconfig: enable BOUFFALOLAB SoC

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../bindings/riscv/bouffalolab.yaml           |  29 +
 .../serial/bouffalolab,bl808-uart.yaml        |  47 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |   7 +
 arch/riscv/Kconfig.socs                       |   5 +
 arch/riscv/boot/dts/Makefile                  |   1 +
 arch/riscv/boot/dts/bouffalolab/Makefile      |   2 +
 .../dts/bouffalolab/bl808-sipeed-m1s-dock.dts |  25 +
 .../dts/bouffalolab/bl808-sipeed-m1s.dtsi     |  21 +
 arch/riscv/boot/dts/bouffalolab/bl808.dtsi    |  73 +++
 arch/riscv/configs/defconfig                  |   1 +
 drivers/tty/serial/Kconfig                    |  18 +
 drivers/tty/serial/Makefile                   |   1 +
 drivers/tty/serial/bflb_uart.c                | 586 ++++++++++++++++++
 include/uapi/linux/serial_core.h              |   3 +
 16 files changed, 822 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/bouffalolab.yaml
 create mode 100644 Documentation/devicetree/bindings/serial/bouffalolab,bl808-uart.yaml
 create mode 100644 arch/riscv/boot/dts/bouffalolab/Makefile
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s-dock.dts
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808-sipeed-m1s.dtsi
 create mode 100644 arch/riscv/boot/dts/bouffalolab/bl808.dtsi
 create mode 100644 drivers/tty/serial/bflb_uart.c

-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
