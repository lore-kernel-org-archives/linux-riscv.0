Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CBDDCCF2D0
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 09:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zG6Mh3mroX/7tYQcZaPUdpi+EpkBPuhR8HuaS1FQAkU=; b=VYByM4EQ+ODTbM
	6QOH9zDCOFic7EA9TPFyRwzEUfNgToBO9Kb/aEOTGhJqLtPVVMlyygeva5glgVcEwX2GKFGchaCtP
	Y/NG3yGWqr42OlZ7vQEkqENeosRT0JglDvN86GPT2ufSXOFhF3Wtcca6rX2jgLeO3aa14n1pHPMg4
	Glgi61YQItHShUD1ia1f8zknHUUJXnj30ZQO1neD0Dt/K5oQgyjnqxrY5eHA6eAMOr0SYLSdE9TtA
	DmTG0kz+IPfMiXAyn6M/ch42CIzjYPMbSVlYISsjuFBeWrUSlmGSkK5cczvvzLLcg1PLzoFfM53/C
	LB/q0eyI5lN5FPyI1wFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlPJ-00000001c7A-3yLG;
	Mon, 19 Jan 2026 09:18:45 +0000
Received: from smtp21.cstnet.cn ([159.226.251.21] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhlPD-00000001c6C-2uA4;
	Mon, 19 Jan 2026 09:18:44 +0000
Received: from duge-virtual-machine (unknown [223.160.206.18])
	by APP-01 (Coremail) with SMTP id qwCowADXf2vI9m1pXbZKBQ--.4971S2;
	Mon, 19 Jan 2026 17:18:02 +0800 (CST)
From: Jiayu Du <jiayu.riscv@isrc.iscas.ac.cn>
To: vkoul@kernel.org,
	gregkh@linuxfoundation.org,
	conor@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	jiayu.riscv@isrc.iscas.ac.cn,
	linux-phy@lists.infradead.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/4] Add USB support for Canaan K230
Date: Mon, 19 Jan 2026 17:17:49 +0800
Message-ID: <20260119091753.294073-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: qwCowADXf2vI9m1pXbZKBQ--.4971S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1UZryxGw18Jr1xJFyrZwb_yoW8ZF1fpa
	y7CFWakFsrtFWaqF4ftw4rCFy3JFn5Jry3Gryag3sxXF48CFyUZwn3urW5ZF1UGFsruryj
	qFs0kFyxGFWUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9Y14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Gr0_Cr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJV
	WxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E
	2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJV
	W8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v4I1lFIxGxcIEc7CjxVA2
	Y2ka0xkIwI1lc7CjxVAaw2AFwI0_Jw0_GFyl42xK82IYc2Ij64vIr41l4I8I3I0E4IkC6x
	0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2
	zVAF1VAY17CE14v26r4a6rW5MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF
	4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWU
	CwCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCT
	nIWIevJa73UjIFyTuYvjfUonmRUUUUU
X-Originating-IP: [223.160.206.18]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_011841_545628_B4600C2C 
X-CRM114-Status: GOOD (  13.04  )
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

Link: https://lore.kernel.org/all/20260115060801.16819-1-jiayu.riscv@isrc.iscas.ac.cn/ [1]

Changes in v3:
- Shrink reg length to match the address/size-cells in k230-usb-phy yaml.
- Move all PHY instance creation and initialization from xlate to probe.
- Modify xlate function to only perform index lookup for PHY instances.
- Define all register base offsets macros at the top of file instead of
  hard-coding magic numbers directly in probe.
- Link to v2: https://lore.kernel.org/all/20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn/

Changes in v2:
- Fold the child into the parent in dtsi.
- Define one usbphy with phy-cells=1.
- Delete the clock of the usbphy as it is not needed.
- Link to v1: https://lore.kernel.org/all/20251230023725.15966-1-jiayu.riscv@isrc.iscas.ac.cn/

Jiayu Du (4):
  dt-bindings: phy: Add Canaan K230 USB PHY
  dt-bindings: usb: dwc2: Add support for Canaan K230 SoC
  phy: usb: Add driver for Canaan K230 USB 2.0 PHY
  riscv: dts: canaan: Add syscon and USB nodes for K230

 .../bindings/phy/canaan,k230-usb-phy.yaml     |  35 +++
 .../devicetree/bindings/usb/dwc2.yaml         |   3 +
 .../boot/dts/canaan/k230-canmv-dshanpi.dts    |  17 ++
 arch/riscv/boot/dts/canaan/k230.dtsi          |  35 +++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/canaan/Kconfig                    |  14 +
 drivers/phy/canaan/Makefile                   |   2 +
 drivers/phy/canaan/phy-k230-usb.c             | 271 ++++++++++++++++++
 9 files changed, 379 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/canaan,k230-usb-phy.yaml
 create mode 100644 drivers/phy/canaan/Kconfig
 create mode 100644 drivers/phy/canaan/Makefile
 create mode 100644 drivers/phy/canaan/phy-k230-usb.c

-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
