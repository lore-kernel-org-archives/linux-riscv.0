Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88F8DC7EE22
	for <linux-riscv@archiver.kernel.org>; Sun, 14 May 2023 17:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jjyc6PvpKASbWTypBLMFTxade/D9Iv0DRWfhJ9nerbw=; b=FtIJqo+EjwAzYB
	2EANLpaoC0KV18sv0oPpmrC5BDNFnX5q/AWi18y3vVU8Yq0P/xs1apX9PT9YmzzTD92B3Txvsl6qo
	N2hRpj96ZqnkpiRYkMGXXplwp2q/aoBMOTtQL3P5yFSmWpp/PUp0+ZrSntk39vbMb0+YY4szLbdor
	aRlZ3MMCJwRkiQrfGE+S9zjS7frcQhiCeKfvG6gRa/KEl/Dh0i++QeZ/YZ88s/Xj2lqowuOrSKGyn
	0UJ6Wjrvc6ccwaARbR7j0u92AgfBX89YLV5aa3lesdm5BlPKBp3J9wRzFF6x2Ibd1EUK/g/0lSYFs
	AciD1gnAJ1qp7eBW+odg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCZ-00HYhn-2n;
	Sun, 14 May 2023 17:08:07 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pyFCW-00HYh6-39
	for linux-riscv@lists.infradead.org;
	Sun, 14 May 2023 17:08:06 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D71B8618A8;
	Sun, 14 May 2023 17:08:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 303B8C433D2;
	Sun, 14 May 2023 17:07:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1684084082;
	bh=srHAo0Y9b1qf2rL+g1G7GWSxmyN50IIlO+TTLU3U41E=;
	h=From:To:Cc:Subject:Date:From;
	b=hhX7qZTcONw+c5MKoJz/MFIzS2L9mGoGHUx01wCjDsf9VjRwGicpXV1a0c+XIoQ2k
	 StCZ2xLDojeV7i0RQTG3/yGXGc8kh+Tp0M2nyUfeFuCLbNlz8sd9LEFqPwzxX6DCZK
	 +qYQ1hgxhy1iRVJbwBCDwSimRsMHXj/cez1MV7k/ZZNX6RhCwmGVom614WnumvF+7n
	 IYbM7tXXu1kEFGVxPXmrxOwlOSjyZNLbKM2ueOB/trhKKEeDzKb1W0o6p9CXeXhk6A
	 FPIcQDTiumYo2Q2i0p5fB1K/mdIop5yHkpvunXwXg1fsEkni5uLSrlsbR8epSfdOQX
	 LcUE/gbPaNmKw==
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
Cc: Samuel Holland <samuel@sholland.org>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-serial@vger.kernel.org
Subject: [PATCH v3 00/10] riscv: add Bouffalolab bl808 support
Date: Mon, 15 May 2023 00:56:41 +0800
Message-Id: <20230514165651.2199-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230514_100805_116790_790F4B7D 
X-CRM114-Status: GOOD (  13.02  )
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
