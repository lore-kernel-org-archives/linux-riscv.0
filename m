Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E5658CD379F
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 08:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=dPeIc0iOddPdzCPLeAya+WVeARIlqgsOM4SDmRwVlPc=; b=EOZ0sB5NK+OHQj
	8JiU8LcyD1m6f1jDN/D6HjXbHb0WGfWKGR8wBpkPLDp0JUPGQVBIAO9Nvmi53Z1LjqPG6gAmZb/b3
	PsXiT6f6atJ2st2le7CJUMtN4YU2VKvLOrOrJY8jvlGSRYzgYubeXLZrEN/h7Al5hYMwRSws6xlNc
	QFlEAMEwMnd1xCuxY2xOZShe3R+hZsL35nUTllzekrqronKGBMsUywdYVgM3EycViLtt233BJCX/t
	dq/NlnCQXMjewNFQ4UmUpVxELkq+6XnmHj7bLa42GKDwZJKZAu7hOu/jBiCr5HhzYI1xm9mlHqCIk
	wjPhSKilNvqN85ni1xXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtvu-000000037zz-0EM5;
	Thu, 07 May 2026 08:18:10 +0000
Received: from smtp81.cstnet.cn ([159.226.251.81] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKtvp-000000037xR-3Q2i;
	Thu, 07 May 2026 08:18:08 +0000
Received: from edelgard.fodlan.icenowy.me (unknown [112.94.100.82])
	by APP-03 (Coremail) with SMTP id rQCowAC3m+KLSvxpI_pNEA--.42168S2;
	Thu, 07 May 2026 16:17:16 +0800 (CST)
From: Icenowy Zheng <zhengxingda@iscas.ac.cn>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Jisheng Zhang <jszhang@kernel.org>
Subject: [PATCH 00/12] Add TH1520 USB support
Date: Thu,  7 May 2026 16:16:58 +0800
Message-ID: <20260507081710.4090814-1-zhengxingda@iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: rQCowAC3m+KLSvxpI_pNEA--.42168S2
X-Coremail-Antispam: 1UD129KBjvJXoWxAr45Xw17JF4kCw4fGF1xZrb_yoW5GrWkpa
	9xGF4SyF1qqFnIgr4fJw1UCryFqa18Zrn8Kw13Ga4UZw1a9rW3Xa9IgasrZrWDK3Wxur42
	kFn8WF17C3WYyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVWrJVCq3wAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4U
	JVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gc
	CE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_GFv_Wryl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjTRM6wCDUUUU
X-Originating-IP: [112.94.100.82]
X-CM-SenderInfo: x2kh0wp0lqwv3d6l2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_011806_234140_C7B8698F 
X-CRM114-Status: GOOD (  13.23  )
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
Cc: devicetree@vger.kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Philipp Zabel <p.zabel@pengutronix.de>, Han Gao <rabenda.cn@gmail.com>, linux-phy@lists.infradead.org, linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, Yao Zi <ziyao@disroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

This patchset adds support for T-Head TH1520's USB functionality, and
enabled it on the Lichee Pi 4A board.

The first 3 patches add support for the MISC subsystem clock
contrtoller, which contains some USB clocks.

The next 2 patches add support for the USB PHY of T-Head TH1520, which
is a wrapped Synopsys USB3.0 FemtoPHY with a little integration quirk;
the controller itself is a properly configured DWC3 controller with sane
default register values set.

Then one patch adds the USB PHY and controller nodes to the TH1520 DTSI
file.

The remaining half of this patchset dedicates to enablement of USB on
TH1520, because of the onboard hub of that board -- its USB2 signals are
behind a switch that needs to be toggled on, and Vbus supplies for both
the hub itself and downstream ports are managed via I2C-expanded GPIOs
(because the SoC does not have enough GPIO pins).

Emil Renner Berthing (1):
  riscv: dts: thead: Add Lichee Pi 4A IO expansions

Icenowy Zheng (10):
  dt-bindings: clock: thead: add TH1520 MISC subsys clock controller
  clk: thead: th1520-ap: add support for MISC subsys clocks
  riscv: dts: thead: add device tree node for MISC clock controller
  dt-bindings: phy: add binding for T-Head TH1520 USB PHY
  phy: add a driver for T-Head TH1520 USB PHY
  riscv: dts: thead: add device nodes for USB
  dt-bindings: gpio: dwapb: allow GPIO hogs
  dt-bindings: usb: vialab,vl817: allow ports property
  riscv: dts: thead: lpi4a: sort nodes
  riscv: dts: thead: enable USB3 ports on Lichee Pi 4A

Thomas Bonnefille (1):
  riscv: dts: thead: Add TH1520 I2C nodes

 .../bindings/clock/thead,th1520-clk-ap.yaml   |   5 +-
 .../bindings/gpio/snps,dw-apb-gpio.yaml       |   6 +
 .../bindings/phy/thead,th1520-usb-phy.yaml    |  74 ++++
 .../devicetree/bindings/usb/vialab,vl817.yaml |   4 +-
 .../dts/thead/th1520-lichee-module-4a.dtsi    |  15 +
 .../boot/dts/thead/th1520-lichee-pi-4a.dts    | 362 +++++++++++++++++-
 arch/riscv/boot/dts/thead/th1520.dtsi         | 106 ++++-
 drivers/clk/thead/clk-th1520-ap.c             |  64 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/thead/Kconfig                     |  12 +
 drivers/phy/thead/Makefile                    |   2 +
 drivers/phy/thead/phy-th1520-usb.c            | 197 ++++++++++
 .../dt-bindings/clock/thead,th1520-clk-ap.h   |  10 +
 14 files changed, 840 insertions(+), 19 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/phy/thead,th1520-usb-phy.yaml
 create mode 100644 drivers/phy/thead/Kconfig
 create mode 100644 drivers/phy/thead/Makefile
 create mode 100644 drivers/phy/thead/phy-th1520-usb.c

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
