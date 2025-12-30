Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63E98E92FE3
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Dec 2025 02:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YV1Bt1kDfoIMo6e9gk7KQyTEpCHe6h7XuJwCdqhrkIQ=; b=C9Bi+dT6+7I9Ra
	agAyDYqrI0TeaJypixVdpAxZhyKCU4IoTHM//vlJ5dPxSeSZIBr51IEp428bUIr8Sy/HV8LOhGCS/
	7aFcFD33z97t5WR8E49Mtzk5aFT1NH6U8v5hXMSkLSZU3bDndg3rQHCh40yhJqnsQbEo9Cb33c6C+
	eyoD0kyMttJT/KBPmG7jVJPsUjt55jhTH/yRl3tnIWxv8etZai6Bg/NVCVDkqPbzFLtaykt7DpV6I
	eWOuw+7Ys/UlVSta+y+pHAyTRCtNQ0TnjU6a3FzyXHIQU9v2V27mhk6LRxDGgNyqMttCiw3BwBOKq
	PFhAB1ySxC5fM4pQe09g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcW-00000004Jml-1udw;
	Tue, 30 Dec 2025 02:38:00 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vaPcO-00000004Jhu-39xU;
	Tue, 30 Dec 2025 02:37:56 +0000
Received: from duge-virtual-machine (unknown [223.160.207.108])
	by APP-01 (Coremail) with SMTP id qwCowACXQW3oOlNpIqZOAg--.5334S2;
	Tue, 30 Dec 2025 10:37:31 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: conor@kernel.org
Cc: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	neil.armstrong@linaro.org,
	krzk+dt@kernel.org,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org
Subject: [PATCH 0/5] Add USB support for Canaan K230
Date: Tue, 30 Dec 2025 10:37:19 +0800
Message-ID: <20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowACXQW3oOlNpIqZOAg--.5334S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1UZryxGw18Jr1xJFyrZwb_yoW8XF4xpa
	y2kFZxGrnrtF4aqF4fJF48ury3Z3Z7Jry3Gryaq3srXF1UAFy5Ja93JFy3Zw17GF47Cry2
	vFsYkFy7GFyjyrJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWUuVWrJwAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUd-B_UUUUU=
X-Originating-IP: [223.160.207.108]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251229_183753_182236_1ACDF4F9 
X-CRM114-Status: UNSURE (   9.32  )
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

Add support for the USB PHY and DWC2 IP which is used by Canaan K230,
and made relevant changes to the DTS.

This series is based on the initial 100ask K230 DshanPi series [1] which
is based on the clock and pinctrl series. Check the details in the link.

Link: https://lore.kernel.org/all/20251229061318.16756-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Jiayu Du (5):
  dt-bindings: phy: Add Canaan K230 USB2.0 PHY DT schema
  dt-bindings: soc: canaan: Add top syscon for Canaan K230 SoC
  dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
  phy: usb: Add driver for Canaan K230 USB 2.0 PHY
  riscv: dts: canaan: Add syscon and USB nodes for K230

 .../bindings/phy/canaan,k230-usb-phy.yaml     |  36 +++
 .../soc/canaan/canaan,k230-hisys-cfg.yaml     |  68 +++++
 .../devicetree/bindings/usb/dwc2.yaml         |   3 +
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  21 ++
 arch/riscv/boot/dts/canaan/k230.dtsi          |  51 ++++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/canaan/Kconfig                    |  14 +
 drivers/phy/canaan/Makefile                   |   2 +
 drivers/phy/canaan/phy-k230-usb.c             | 272 ++++++++++++++++++
 10 files changed, 469 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/canaan/canaan,k230-hisys-cfg.yaml
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
