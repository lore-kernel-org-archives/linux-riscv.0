Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F439CA0FF2
	for <linux-riscv@archiver.kernel.org>; Sun, 31 Aug 2025 23:01:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TEyK8hP9SQJoglUIqVPp4S/hax16/4lGVc/lN5gFVYw=; b=w4MFcwT1qf3/8D
	Rr4t+ko3l2Nt7fqb2S060T9yAXpx6KkDPC5B9pzEcdG995Pys6whtjau+wmxjOqmshiIZqRauE61A
	pi1LjBTzqFXrOyEvs9FNOXQxzjtHhZdmPgDZwKuYRP6g8P7pHpd+g3D40G50OODYOBbTWELyVojI/
	HUx8g3PiDux5D/1GbwJa241eQSfDaC4VxVvsmSbT7ACAhzcR6+YIRaseB+lEDqD4bRdw/DAVB1tcx
	SmTBJpfu9pmibsBZ+HgQmhSBzjFhaEMLq5+R3fBAee9T8q3BmwI3sSKXtH+HIknoSPcNeX8Kg8JFN
	EgU9OYIBo3hpr5XV37TA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr33-0000000AmvA-2lee;
	Sun, 31 Aug 2025 23:01:21 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1usr2z-0000000Amuh-2t8w
	for linux-riscv@lists.infradead.org;
	Sun, 31 Aug 2025 23:01:19 +0000
Received: from hay.lan (unknown [IPv6:2605:59c0:2078:cf00:6ecf:39ff:fe00:8375])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id 89222B2200E7;
	Mon,  1 Sep 2025 01:01:12 +0200 (CEST)
From: E Shattow <e@freeshell.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	E Shattow <e@freeshell.de>
Subject: [PATCH v2 0/5] riscv: dts: starfive: Add Milk-V Mars CM (Lite) SoM
Date: Sun, 31 Aug 2025 15:59:25 -0700
Message-ID: <20250831225959.531393-1-e@freeshell.de>
X-Mailer: git-send-email 2.50.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250831_160117_877597_1E586B90 
X-CRM114-Status: UNSURE (   8.87  )
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

Milk-V Mars CM and Mars CM Lite System-on-Module both are based on the
StarFive JH7110 SoC and compatible with the Raspberry Pi CM4IO Classic IO
Board carrier. Mars CM Lite is Mars CM without the eMMC storage component
on mmc0 and the mmc0 interface configured instead for SD Card use. The
optional WiFi+BT chipset is connected via SDIO on the mmc1 interface that
would otherwise be connected to an SD Card slot on the StarFive
VisionFive2 reference design.

Add the related devicetree files for both Milk-V Mars CM and Milk-V Mars
CM Lite describing the currently supported features, namely PMIC, UART,
I2C, GPIO, eMMC or SD Card, WiFi+BT, QSPI Flash, and Ethernet.

Caveat with vendor AP6256 firmware files present the firmware loading is
successful but subsequently fails IRQ wake initialization. Common GPIO
conflicts for "WiFi" optioned boards having this module:

pwmdac_pins:
 - AP6256: WL_REG_ON>>WIFI_REG_ON_H_GPIO33
 - AP6256: WL_HOST_WAKE>>WIFI_WAKE_HOST_H_GPIO34

i2c2_pins:
 - AP6256: UART_CTS_N<<UART1_RTSn_GPIO2
 - AP6256: UART_RTS_N>>UART1_CTSn_GPIO3

i2c6_pins:
 - AP6256: UART_RXD<<UART_TX_GPIO16
 - AP6256: UART_TXD>>UART_RX_GPIO17

Tested successfully for basic mmc0 storage, USB, and network functionality on:
- Milk-V Mars CM 8GB
- Milk-V Mars CM Lite 4GB
- Milk-V Mars CM Lite WiFi 8GB

Changes since v1:
- create common board include jh7110-milkv-marscm.dtsi
- drop redundant include starfive,jh7110-pinctrl.h from jh7110-milkv-marscm.dtsi
- add wifi-host-wake-irq '-0' suffix to conform with dt-bindings
- PATCH 1/4 collect tags
- PATCH 2/4 use common board include jh7110-milkv-marscm.dtsi
- PATCH 2/4 correction of S-o-by email address
- PATCH 2/4 drop 'PWM DAC' from description of common supported features
- PATCH 3/4 collect tags
- PATCH 4/4 use common board include jh7110-milkv-marscm.dtsi

Link to v1:
https://lore.kernel.org/lkml/20250724094912.253723-1-e@freeshell.de/

E Shattow (5):
  riscv: dts: starfive: add common board dtsi for Milk-V Mars CM
    variants
  dt-bindings: riscv: starfive: add milkv,marscm-emmc
  riscv: dts: starfive: add Milk-V Mars CM system-on-module
  dt-bindings: riscv: starfive: add milkv,marscm-lite
  riscv: dts: starfive: add Milk-V Mars CM Lite system-on-module

 .../devicetree/bindings/riscv/starfive.yaml   |   2 +
 arch/riscv/boot/dts/starfive/Makefile         |   2 +
 .../dts/starfive/jh7110-milkv-marscm-emmc.dts |  13 ++
 .../dts/starfive/jh7110-milkv-marscm-lite.dts |  26 +++
 .../dts/starfive/jh7110-milkv-marscm.dtsi     | 159 ++++++++++++++++++
 5 files changed, 202 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-emmc.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm-lite.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-milkv-marscm.dtsi


base-commit: f66eb149b87677da3171a0ed51c77c3599ad55d6
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
