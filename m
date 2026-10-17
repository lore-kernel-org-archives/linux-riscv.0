Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96A59CCF2C1
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Oct 2026 18:02:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Vubl4UD7B1dJLolAuyGndCiO5JtRTppnf0Rg1dQirqQ=; b=vgRp5q8I7vfT/D
	gu+2hIB3G24qLxKMCKRrSCdANinbVW5FBYCPLHrcUH+gJ8ECIyVQXY2kwAwRaqcrW5nKGr2Wz8LRP
	9B473ZQial5bRE9zb7dCqLnwqYou4GCQ+Xtx+pSnchwssCJ7ZLudvu0YHQqoOnQoPv2no2cvXv50Y
	pamhvdXIr6dp57uH4J2ZF5sPtKJsh7O26bsWH/kAg0GNBqjlRgThLFCJGqa0SnOmIaNW4oqHOi3ZL
	J4f1Yc02JyxVbkT69QuVXSQF2mwlJ3BzFL3PCv3rnBZim9sd3YYJEDlv7ujQ2ZoaqndNVw9FE4cWJ
	yrn6ZQuzysTWpyiy9tbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8j8-000000052lz-3as6;
	Sat, 17 Oct 2026 18:01:50 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xI8j5-000000052lb-42Ve
	for linux-riscv@lists.infradead.org;
	Sat, 17 Oct 2026 18:01:49 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-2e812e2b31bso4453675ad.3
        for <linux-riscv@lists.infradead.org>; Sat, 17 Oct 2026 11:01:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792260107; x=1792864907; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=NqDrApbwyPH2M57wCcKQn+OwRQO9OxC5oTAva+X/BS4DY7EtT9b2uhDRbpiPv+yX/i
         mWWSEEIqsytJ0n+oEXgqVFisJ8lGwlwpof9ERtX86F5GlxlgWbWlaM/AyPOBri2wyl6+
         HPX6ezCJmcEsboCFx74y/sMTOF0P4VYr0MqW3AZopvRnU/wr26GxMz7Zpx3VkxWP0NR9
         +ewyHwvdgbu5oYLYyOTaQNriKj3C/5mYQiUCD5knUPpleJ7GdIdsc+sg/cO3SxRe9QfD
         OHhXo/RjT75lj7yaW2HrlT0JTLyeOLNNkwUBSI38FsMTFYiKHP+GmP97wXd63q96UslW
         Ms/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792260107; x=1792864907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Tpd5O0R9+duoKDmKNVdsMKIxn7WvXRY/NssiY4nj4tc=;
        b=UcStBJNOtM9WtwpP1dCciHsP+g9esFedqwz7ueqRrSIDVWL++PXuzSXLlOiR3D4Dot
         DtIqmpkgJA36DQqu6rsnnmh1aXPu7IeizbdPusCSULXdAmddnv1mOKzSyUyAcl1N5sem
         KYg/lBqivU6bg40+q/suIXVR33kju94LaO9rMyBMQqtNXFGtNFuYLaNTzobx010JWo7n
         /p3MIyS5S15/1HuAhnuKPxwXbxXWNdIZHUQ5AvvQ8FA4NBzvOxbPmWA6FPJdl40DQ2Uy
         jKYbs7n+vLAS3c3VCt28AEIG3eACK6iU9/9ZtbSVGmymSbBCpBti9b0AlQjRNBU88lYt
         a3xw==
X-Forwarded-Encrypted: i=1; AKwUvBzpS0mNb22kV9KYpSAg8Uf4SWBoJPhRgTmUGqG9trJsHiIvBPQ+NslMR+QauD5y/cjf/EuqpoMzGmDO5w==@lists.infradead.org
X-Gm-Message-State: AFq9FYIk5hnrUpYTPb3B+bkG9HE/r2P5+uHz9JzCNGA/UdB45G5DDAvA
	G9z2dzcNKLXvkuWGgx7wJ9F4JwGWIuF9vY0ZaY5eEKdrVJbIGyIw0U9V4m+xGfyd
X-Gm-Gg: AYBFou2XNsTHEiGGl9qFTPKSZPfSUovxy0o4TyldBf31bZAIrLxII4NSrTheXOXyLaN
	oiBahcd23KvcHJzb6syAKRF3UKuzwKi7Bne++rOIujoYXGdQXKPJtjnQm9a2PqreZKw5OREv0WW
	13CJrI8Exml9/x7baHCmJrz9FW1X8+4HSGW/9+jmt5JoVnhtRkj0r8LpVVwUmU2Ragm7vdDpaqw
	YSdzyAYiEnOUDCZ/n1+W4i0w0RYIfHFT02fEr/9rEnoIUdh8HtDn7w15Gp67pK5+WIQRWtRQshR
	m5VzUeKEy6dVELbd9NDXAmVuGPC+9h2tM+0jESot3he22CRV7/yitDlANQsy4E3iW+kV43DZlTQ
	pId5f97sRJG0DG4dMmTwtIO7YVnOBzKb4p9o/8Vfx+1MR3+XVXvkygQUgdXf/pfNB+ChTu+QNyl
	TWHSgxvQozjeyFjNMSijtY1OVyktRNlXuarW9LjJLQfsY/b1NZ0NY0EJzosCGz11O5OqEHhjeeS
	vTvr/RUdgXGp871uMLw/4KOlM2000aVudl/xWcuR/ScUXO+xGR5HXGrQrAM30BxHTpaGqKjCuwx
	TXDmDPOb5bEqOuj78x43JMeaI4D9SwghtL81nVqz552bdOLv6gFk/g==
X-Received: by 2002:a17:903:a90:b0:2e9:40ef:e44a with SMTP id d9443c01a7336-2e9a6833906mr30171515ad.3.1792260106924;
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
Received: from alanhc-14700.tailb22ec2.ts.net (180-177-138-120.dynamic.kbronet.com.tw. [180.177.138.120])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e97e5d98d9sm23030035ad.2.2026.10.17.11.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Oct 2026 11:01:46 -0700 (PDT)
From: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
To: Yixun Lan <dlan@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/2] riscv: dts: spacemit: mark K1 boot nodes bootph-pre-ram
Date: Sun, 18 Oct 2026 02:01:39 +0800
Message-ID: <20261017180141.3477743-1-alan.tseng.cs@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261017_110148_568301_35D67BD5 
X-CRM114-Status: GOOD (  13.43  )
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

A bootloader SPL on the SpacemiT K1 runs from SRAM and needs a handful
of nodes before DRAM is up: the root clocks and clock controllers, the
console UART, the boot media (SD, eMMC, QSPI NOR), the board EEPROM
used to identify the board, and the PMIC rails it programs before DRAM
training. Today mainline U-Boot carries the bootph-pre-ram tags for
these in per-board -u-boot.dtsi files.

When I sent a U-Boot patch adding another such file for the Milk-V
Jupiter, E Shattow asked for the tags to go upstream first, so every
K1 board gets them and the U-Boot overlays can shrink [1]. Earlier
there was no working mainline SPL for K1 to justify them; there is now.

Patch 1 tags the SoC nodes in k1.dtsi, including i2c8, which every K1
board uses for the PMIC. Patch 2 tags the board-specific EEPROM and its
bus, the PMIC rails and the SPI NOR on the boards that have them. The
set of nodes matches what the mainline U-Boot SPL tags for the BPI-F3
and MusePi Pro. Pin control and regulator supplies are left untagged:
the K1 SPL does not enable SPL_PINCTRL, and neither the P1 PMIC driver
nor the SPI NOR and EEPROM drivers look up supplies there.

Testing: all K1 DTBs build, and dtbs_check is clean for them with and
without this series. I have not run an SPL built from these trees on
hardware. On a Milk-V Jupiter running Linux I checked that the EEPROM,
PMIC and SPI NOR answer at the addresses described.

Changes in v2:
- Tag i2c8 in k1.dtsi instead of in every board file (Yixun)
- Rebase onto the spacemit dt-for-next branch, where buck1 now carries
  the buck1_0v9 label on musepi-pro and the OrangePi boards
- Link to v1: https://lore.kernel.org/all/20261012235624.77993-1-alan.tseng.cs@gmail.com/

[1] https://lore.kernel.org/u-boot/5d323a11-da4e-4071-bdeb-ab5c03e8f85e@freeshell.de/

Hung-Chun Tseng (2):
  riscv: dts: spacemit: k1: mark boot-critical SoC nodes bootph-pre-ram
  riscv: dts: spacemit: mark K1 board boot devices bootph-pre-ram

 arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   |  6 ++++++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  |  4 ++++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  |  5 +++++
 arch/riscv/boot/dts/spacemit/k1.dtsi              | 13 +++++++++++++
 7 files changed, 48 insertions(+)


base-commit: d05c6236496071916e19012cda7149465f15e66e
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
