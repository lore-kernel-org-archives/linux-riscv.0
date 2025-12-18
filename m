Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 767E4D6D22E
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 15:13:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=DLecEVf9es5vVKe2XHNxffw8XHEKPmKK/CT6c+Oc8M8=; b=L/Fv+SRFDf8Lyq
	RgrWD5CUSlkH5DCLa+MNhbK5sF3Wz3D7CV0pEezSrLAJQCp5r3DN8Mysehm8qIVtJwp54xzbXJFbu
	bD78uwijGSMufkv9ahUwSdW5sldauqQqRouBh25E/tOqN+qs2cuN4HMKJBsWDwQDX7BjysZWtmiCN
	z672Pq6Kh8pwZDFSmfHeJHQTf238Yan1OI2QKyPxeXP3ABDzgEWaHxBL2FhUSofNeLukR7K8cHPi8
	5KR1Va2mtfgdk1vlovEdLHkxwW14Dz2jhvICk4l1YYK+mOKqj6k6nN6pNr5QQsff1G8+757VXopDH
	FhHXjSDPdu5gJ72KjM7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgK-00000008fBW-1mDx;
	Thu, 18 Dec 2025 15:12:44 +0000
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWFgH-00000008f9W-3BIO
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 15:12:42 +0000
Received: by mail-qk1-x72b.google.com with SMTP id af79cd13be357-8bb6a27d407so68966185a.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 07:12:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1766070760; x=1766675560; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4hIaGiL80zj7kXcIMdv66SIiq2tbAwa49JkVUuORHZU=;
        b=bYleZdwwPT/KvjXoHotwjKanK/8edGHGoNfbzdh+eC4Ukq4HQbMYEuTc3jvEKoJ3Fh
         LtXlbE6WvBC6k7e9FMqnrhNtzhwryZ1YBjl2Ea1iO8bH4l5Jn+3XjN2tHe4ZmPRoclr5
         Q2LttdbP4YbGdfBIGbCueRUKSaCjecVH4jVhYZfxTbCejVwJs2dnLFD03yvqJLONDk0x
         Sd+f1e+o9ToTehQMrt7FKiknA+f0fcsdicq8F1h5fVW5KO0jT4r/KMEzfpTw95t95DoR
         mrKVwYXcF0joTQGGgMPvt7Ae8u2+di0WalIDclVpAoHJbFaTxNYQYJpQc5fXLpzr4LVD
         WVZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766070760; x=1766675560;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4hIaGiL80zj7kXcIMdv66SIiq2tbAwa49JkVUuORHZU=;
        b=iiJDYndj22stQOaPYTcOoyPY/QzBuvUEcQ4x7XbPbG07cxhCYNxkaYZJ3i+YmgDZxg
         8gzZmqgQ32/U41N2JCzEO+9t34EyQxoVQKyeIS2irZq+iXfPYhempEx+ugJt6NL1g9zY
         EEv00UWv3JONSxAa3/N1wXBTIJox7DrCBH7eeD/vMl4eVBdOTwjl5qzaaRzCqVtzQeNo
         Ti7sQt5r5vCZc9cb86M4i13FJ7GW3jlpPw3uJJAPM2FzMoawXtkqpi3bfTgorpAMjaQ5
         Y6s+pS8L2eue07mjLd6Yccj6TVtbPLxq6qvyT/GoCAC91vuFSTsiEzSBEocSfVBaz3P0
         /shA==
X-Forwarded-Encrypted: i=1; AJvYcCWwWu3VpnqlkAUpbarLZhfoQFly22C6dZ+kCOYpNDAEVgP24hqokdOpgU4/kk9r+ydnlpUloE779Q+xsg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzqWO+s64VdTLhqDOLndiDT1fHP+/HbjX8m1Ww4B7fW6mmR//SX
	fWKImOs6siZEPNbIdWxKq6GhDJ19o9Dn93KXbd7m6brQ3F1t0tlQWc2/9AYX8noSHrY=
X-Gm-Gg: AY/fxX6nPdeJKkPeiuOgVq2UTonoJzMwuG8YbJm6Mmd2l2FOBY7Kmb0S+OGIZfj1m0c
	MEkwEW4qh/vC6CP36hu1hT+25cm5GlF/6pbFlM357IM1KzZnkxgmB5mgSrI1KIaIyUX3e+je3F7
	ev7iBXGBj+8PUI0JR/Svstyq/ifA8d5i1H/SZLGfF6frRlTSZfLbgdAzV9GKfWlJTgM9IM3ICev
	QfPUVlL/mZYNCVeZiY1c3tcCgxC3Fv4SMs6zx8735RGmzoH/Wkp9qX3AMZcH0GDPLt/q6L7bGXO
	4fXUL1oFsPxtfchcHbbmE80mfXx/8EyJxZs3W9Q16rqQjj/lC2pK8cQ/fSjjenfzMz/6/5U9bHo
	108ME9WAEtO9+AG8dZ04VnivTzx8+mTGO5FGVyYns18+1j8LdOkNbTqTy9fdxVva5mNNRekXFn3
	1Hbtx5wrwx3kaIizhG0Q+NCFfjv3J6IRuMuHkmD5oLTxY1JouaFAVBSA==
X-Google-Smtp-Source: AGHT+IHmVmM+H9+67oq6BOeGEFhlTWftMxnr3gXZbeufLi7tT0T4NovnVfrEP3C8OYAsipwfxkDfaw==
X-Received: by 2002:a05:620a:1a26:b0:8ba:5255:107 with SMTP id af79cd13be357-8bb397db52bmr3259102085a.18.1766070760006;
        Thu, 18 Dec 2025 07:12:40 -0800 (PST)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeb5d6952sm186866985a.3.2025.12.18.07.12.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 07:12:39 -0800 (PST)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: ziyao@disroot.org,
	aurelien@aurel32.net,
	johannes@erdfelt.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 0/5] Introduce SpacemiT K1 PCIe phy support
Date: Thu, 18 Dec 2025 09:12:26 -0600
Message-ID: <20251218151235.454997-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_071241_833404_0352C614 
X-CRM114-Status: GOOD (  14.28  )
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

This series introduces a PHY driver to support PCIe on the SpacemiT K1
SoC.  The PCIe controller implementation is derived from a Synopsys
DesignWare PCIe IP.  The PHY driver supports one combination PCIe/USB
PHY as well as two PCIe-only PHYs.  The combo PHY port uses one PCIe
lane, and the other two ports each have two lanes.  All PCIe ports
operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the needed calibration step is performed
by the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

The PCIe controller driver that was included in earlier versions of
this series has already been accepted upstream:
  a812b09a6b599 ("dt-bindings: pci: spacemit: Introduce PCIe host
		  controller")
  ff64e078e45fa ("PCI: spacemit: Add SpacemiT PCIe host driver")
However this series still includes devicetree patches to enable the
PCIe controller (along with the PHYs).

The patches that remain in version 7 of this series are unchanged;
they are simply rebased on top of Linux v6.19-rc1.  The first two
patches are the DT bindings for the PCIe and combo PCIe/USB PHY.
The third is the PHY driver, and the last two are devicetree updates
to enable the PCIe controller and PHYs.

					-Alex

Alex Elder (5):
  dt-bindings: phy: spacemit: Add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: Introduce PCIe PHY
  phy: spacemit: Introduce PCIe/combo PHY
  riscv: dts: spacemit: Add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 8 files changed, 1120 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
