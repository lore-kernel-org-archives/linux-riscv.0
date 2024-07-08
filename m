Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41113C3271E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jul 2024 12:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rdJhtZr+yXoiZoJE7hunqxu/3oDyXomlv1qjhaDFsSY=; b=S50zMG4kteZm70
	EKGJWsaFiJvBxbu8wdw8oqMKXtcJZKkQuLRBxu60c+g2bjI5lfMuHQtdDj4ktepePGbuTssquxgf6
	Bo9A8fQUPhikr6ppZaE9gR/rdRyQ07ZhKmbB6hyUnLvJZnmZ3qxhfQ/h+EgbONyR7196uAPor21Hv
	fIiWOJaZKV/Gfcd3kUnEcsmgyIiN+LGs7249ijYSvfBhuUJ9r1l0SIZk9pzwOlMSRZa2j+ee+BkFM
	whgLpthB8qIWpoo+rjO2vEGssNDU2e5QBfiTfQ83dWFUSuvamce+FLKSnEcjtNrKiSqpD0Dn7CgTf
	LmhQrZZUsZtX2QeCf5uA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnBg-00000003iZS-13Fw;
	Mon, 08 Jul 2024 12:09:44 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sQnBd-00000003iW2-0rZm;
	Mon, 08 Jul 2024 12:09:42 +0000
Received: from localhost (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 8E9E041AAD;
	Mon,  8 Jul 2024 14:09:32 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
	by localhost (disroot.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZZdBFLd7Gx_I; Mon,  8 Jul 2024 14:09:31 +0200 (CEST)
From: Yao Zi <ziyao@disroot.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1720440571; bh=LixmteUS5gYgJ/PPXczu+PsnnDVZsOkJdxUiZfHsntw=;
	h=From:To:Cc:Subject:Date;
	b=D8q1AFg9z24hBB18YM8MJt044NefpABngXoUt0Z3FlzL2tkFswv3SlkdPaNOZqPuP
	 LHCQaSX3n7Vxr6EhXUWfJfoX4IerSx0AJ8uN21Um97G1YY86q5mUNcidnKw1HGPbWz
	 M6fNSRQIJh00FAHGk8su6FiL4udi2E1aaQbsYG4yU3Av0VDaJkWXYgzm/+cTok5jGz
	 X0BqirpWpzZ7SroB6ZWUpQhpoff9inRjovijWA52o2KBm6P5kCb9ZH7ZA+/+QEXiEh
	 MQpev+aQ/v4xG/3+44KTuTN0Ouvd4FhuruqxH+61RNWhPZA+WSIXNESeO/nIN3sGrs
	 ZH6rPB8wrQxBw==
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Yao Zi <ziyao@disroot.org>
Subject: [PATCH 0/3] Add USB support for Sophgo CV1800/SG200x SoCs
Date: Mon,  8 Jul 2024 12:08:27 +0000
Message-ID: <20240708120830.5785-1-ziyao@disroot.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_050941_677597_83587A18 
X-CRM114-Status: UNSURE (   9.19  )
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

Sophgo CV1800/SG200x SoCs integrate a USB 2.0 phy and a USB 2.0
controller based on dwc2 IP. This series implements a basic driver
for the USB phy and add USB-related device tree nodes.

Yao Zi (3):
  dt-bindings: phy: add YAML schema for cv1800-usb-phy driver bindings
  riscv: dts: sophgo: add nodes for USB phy and controller
  phy: sophgo: add usb phy driver for Sophgo CV1800 SoCs

 .../bindings/phy/sophgo,cv1800-usb-phy.yaml   |  67 ++++++
 arch/riscv/boot/dts/sophgo/cv18xx.dtsi        |  23 ++
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/sophgo/Kconfig                    |  10 +
 drivers/phy/sophgo/Makefile                   |   2 +
 drivers/phy/sophgo/phy-cv1800-usb.c           | 213 ++++++++++++++++++
 7 files changed, 317 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/sophgo,cv1800-usb-phy.yaml
 create mode 100644 drivers/phy/sophgo/Kconfig
 create mode 100644 drivers/phy/sophgo/Makefile
 create mode 100644 drivers/phy/sophgo/phy-cv1800-usb.c

-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
