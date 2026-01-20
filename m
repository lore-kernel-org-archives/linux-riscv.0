Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 472A8D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 14:33:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=pbjRG6wRqEHFUuaPzp/P153xiH6Kk3lPcgc6ZihEvJw=; b=Eg9MnYJNsYG9yS
	4u/J0KCts4miW3GLQp0Lpk5wQN4IhQOD7+ZwNqVQqYHar7K44UOVyK6VWmF9WicC3Z6YztMymhNor
	KRTyoxQBvkdKFzZFZ4WN5Onzpo6qyYzro4t4rNuqMsKAYsKXEZHtSoo2iWv8LKaNrU8km7GuHkCF/
	+EQardUsXS/medTJalJ6JzHagp441f6eFKYLHQk5qq4Jk2ONOixKA8RRdXO/nDchc4mNYvKuXQbI3
	MJOPMuvSGZByimxUov/OuO8TIVkCdDGqjwXMRQet+NV4GL09O0qqXmPtzZ4c0m1dTtQIBr5LVv0DL
	g/3kDGD++IJR3Q6KXKng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCnD-00000003zC7-0xvU;
	Tue, 20 Jan 2026 14:33:15 +0000
Received: from smtp84.cstnet.cn ([159.226.251.84] helo=cstnet.cn)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viCn5-00000003z7x-3CMm;
	Tue, 20 Jan 2026 14:33:11 +0000
Received: from duge-virtual-machine (unknown [183.192.221.134])
	by APP-05 (Coremail) with SMTP id zQCowACn_hESkm9p+zDJBQ--.5466S2;
	Tue, 20 Jan 2026 22:32:51 +0800 (CST)
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
Subject: [PATCH v4 0/4] Add USB support for Canaan K230
Date: Tue, 20 Jan 2026 22:32:39 +0800
Message-ID: <20260120143243.71937-1-jiayu.riscv@isrc.iscas.ac.cn>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: zQCowACn_hESkm9p+zDJBQ--.5466S2
X-Coremail-Antispam: 1UD129KBjvJXoW7uF1UZryxGw18Jr1xJFyrZwb_yoW8ZFWxpa
	y7CFWakFsrtFWaqa1ftw4rWFy3JFn5Jry3Wryaq3sxXF48CFyUAwn3urW5ZF1UGFsrZryj
	vFs0kFyxGFWUAaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUU9014x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
	rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
	1l84ACjcxK6xIIjxv20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j
	6F4UM28EF7xvwVC2z280aVAFwI0_Jr0_Gr1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4j6r
	4UJwAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VC0
	I7IYx2IY67AKxVWUGVWUXwAv7VC2z280aVAFwI0_Jr0_Gr1lOx8S6xCaFVCjc4AY6r1j6r
	4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IErcIFxwACI402YVCY1x02628v
	n2kIc2xKxwCY1x0262kKe7AKxVWUtVW8ZwCF04k20xvY0x0EwIxGrwCFx2IqxVCFs4IE7x
	kEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r106r1rMI8E
	67AF67kF1VAFwI0_GFv_WrylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AKxVWUJVWUCw
	CI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7xG6r1j6r1x
	MIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIda
	VFxhVjvjDU0xZFpf9x0JUZYFZUUUUU=
X-Originating-IP: [183.192.221.134]
X-CM-SenderInfo: 5mld534oul2uny6l223fol2u1dvotugofq/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_063308_165737_26D88BE3 
X-CRM114-Status: GOOD (  13.05  )
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

Changes in v4:
- Shrink reg length to match the address/size-cells in k230-usb-phy yaml.
- Move all PHY instance creation and initialization from xlate to probe.
- Modify xlate function to only perform index lookup for PHY instances.
- Define all register base offsets macros at the top of file instead of
  hard-coding magic numbers directly in probe.
- Link to v2: https://lore.kernel.org/all/20260115064223.21926-1-jiayu.riscv@isrc.iscas.ac.cn/

Changes in v3:
- Please ignore v3.

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
 drivers/phy/canaan/phy-k230-usb.c             | 283 ++++++++++++++++++
 9 files changed, 391 insertions(+)
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
