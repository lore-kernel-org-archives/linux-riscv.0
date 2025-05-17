Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02B1DC3ABDA
	for <linux-riscv@archiver.kernel.org>; Sat, 17 May 2025 14:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:MIME-Version:Message-Id:Date:
	Subject:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OiXBN0qOwDmP+jYwHDVs+x5mJHGHTkW8UJ5aEDMxMb8=; b=467Evj1m6iMAu8
	Y/lf+n2ozwDvWIGV6dybsM0D37pKdXRye5KMpQ1lCiHcat6FCOO0suEPHhElHEFJ7TpbWENYvaNX9
	EtN4tQQ6tIp4o0NS6tvb0Rww3wFA9deq0lx4EEHh7cYbc1xp22Hc6mafPHOsNUWJ9iAbGUXvnwjaK
	Ez78E3pAZUl3OrL6meZVuk5zWapAAGKGCW5COKyDGcY23am6kpgQpUJCk1A1enTepkZFedcO2QpOS
	BbC5gHqq92qcfRMlWB0fghqCfbCFing1w1rsXlCjhsuq9/d5I4NtKSWyQ0kp292yIj1wPnuf2Cik2
	U50lDuHo7hexkXpLIu3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIUH-00000005pLX-2DA1;
	Sat, 17 May 2025 14:26:05 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGIUA-00000005pHB-2EpX;
	Sat, 17 May 2025 14:26:02 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [27.18.99.32])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1562e81de;
	Sat, 17 May 2025 22:25:39 +0800 (GMT+08:00)
From: Ze Huang <huangze@whut.edu.cn>
Subject: [PATCH v3 0/4] Add USB2.0 PHY and USB3.0 PHY support for SpacemiT
 K1
Date: Sat, 17 May 2025 22:25:13 +0800
Message-Id: <20250517-b4-k1-usb3-phy-v2-v3-0-e0655613a163@whut.edu.cn>
MIME-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAEmcKGgC/22OwQ6CMBBEf4Xs2SVtKQic/A/DgZZFGiNgC1VC+
 HcreDSZy5vMzuwKjqwhB2W0giVvnBn6AMkpAt3V/Y3QNIFBMJEyyc+oJN45zk4lOHYLeoGt4iR
 5LgsmCwh3o6XWvPfOa3WwpeccqqfDBFU7Qj08HmYqI5/FPEWrOXzDnXHTYJf9Hy/29G86/zMdx
 FBlBTHR1LkkdXl18xRTM8e6h2rbtg97ajfP4QAAAA==
X-Change-ID: 20250417-b4-k1-usb3-phy-v2-fb1e41849049
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Ze Huang <huangze@whut.edu.cn>, 
 Junzhong Pan <junzhong.pan@spacemit.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747491939; l=2251;
 i=huangze@whut.edu.cn; s=20250325; h=from:subject:message-id;
 bh=DmeY3YouFP9bsBkCPDQ4W/C56R8APGZdkd/YEZ5y3YE=;
 b=mljUl/w8vneZSD2Spg8DapkxZoOF9mHrm9hkoMqGjRtE8rycf+ijg1n8asB8Gb7obk2yDpygC
 P45MwU68o9aA6mJ3/36TWRC2c1D1rJ8ptMqaZsnvxlgJCJkn1bfXXH7
X-Developer-Key: i=huangze@whut.edu.cn; a=ed25519;
 pk=C3zfn/kH6oMJickaXBa8dxTZO68EBiD93F+tAenboRA=
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaGh9IVkJIQ0IfSEpDTh4dQ1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJTFVKQ1VCQlVISVlXWRYaDxIVHRRZQVlPS0hVSktJT09PS1VKS0tVS1kG
X-HM-Tid: 0a96dea2e5bd03a1kunm1562e81de
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NjY6Hio5DDEyPiooCi4IESsY
	ATwwFAlVSlVKTE9MT0JKQk9OSU9MVTMWGhIXVRMOGhUcAR47DBMOD1UeHw5VGBVFWVdZEgtZQVlJ
	TFVKQ1VCQlVISVlXWQgBWUFIQ05KNwY+
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250517_072558_813122_A2066BD8 
X-CRM114-Status: UNSURE (   7.90  )
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

This patch series introduces support for the USB2.0 PHY and PCIe/USB3.0
Combo PHY on the SpacemiT K1 SoC. The implementation has been tested on the
Milk-V Jupiter and BananaPi-f3.

K1 includes three USB ports as follows[1]:
- A USB2.0 OTG Port
- A USB2.0 Host Only Port
- A USB3.0 Port with a USB2.0 DRD interface

USB3.0 PHY for USB3.0 Port is shared with PCIe port A, meaning that only one of
these interfaces (PCIe or USB3.0) can be active at a given time.

Link: https://developer.spacemit.com/documentation?token=AjHDwrW78igAAEkiHracBI9HnTb#part5 [1]

Signed-off-by: Ze Huang <huangze@whut.edu.cn>
---
Changes in v3:
- improve commit message, provide more info about phy hardware
- drop superfluous local variable in `spacemit_combphy_wait_ready`
- replace devm_reset_control_get with devm_reset_control_get_exclusive
- Link to v2: https://lore.kernel.org/r/20250418-b4-k1-usb3-phy-v2-v2-0-b69e02da84eb@whut.edu.cn

Changes in v2:
- combphy dt-bindings:
  - fix reg-names
  - describe reg
  - describe #phy-cells argument
- drop stale ".owner" in driver struct
- add support for usb lfps_thres in combphy
- fix Kconfig depends on
- Link to v1: https://lore.kernel.org/all/20250407-b4-k1-usb3-v3-2-v1-0-bf0bcc41c9ba@whut.edu.cn

---
Ze Huang (4):
      dt-bindings: phy: spacemit: add K1 USB2 PHY
      dt-bindings: phy: spacemit: add K1 PCIe/USB3 combo PHY
      phy: spacemit: support K1 USB2.0 PHY controller
      phy: spacemit: add USB3 support for K1 PCIe/USB3 combo PHY

 .../bindings/phy/spacemit,k1-combphy.yaml          |  72 ++++++
 .../devicetree/bindings/phy/spacemit,usb2-phy.yaml |  40 ++++
 drivers/phy/Kconfig                                |   1 +
 drivers/phy/Makefile                               |   1 +
 drivers/phy/spacemit/Kconfig                       |  21 ++
 drivers/phy/spacemit/Makefile                      |   3 +
 drivers/phy/spacemit/phy-k1-combphy.c              | 248 +++++++++++++++++++++
 drivers/phy/spacemit/phy-k1-usb2.c                 | 131 +++++++++++
 8 files changed, 517 insertions(+)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20250417-b4-k1-usb3-phy-v2-fb1e41849049

Best regards,
-- 
Ze Huang <huangze@whut.edu.cn>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
