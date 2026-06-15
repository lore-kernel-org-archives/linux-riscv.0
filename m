Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EED1ECD98DA
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jun 2026 12:04:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4QIKKjwKTLcNZQFrTyEqf6QkfFI3O44a8thMoy8iFcQ=; b=if0cLNj/EEoDrD
	F/MxZcESt8NG7DsQ1zG8fORVioXy65HQ3tNF9Og+qny1MaMMH9i4MPQOYbZwRFeXlrslcXRXNBI71
	SEI8ikSKUhQj99SQFUNcz8koBQoGLWrb531yqS2t314Jj3vI/aXWNvGCI0nmyhqCsDEUNPg5+UWqH
	kYBK2NpkJ/yd5MKtyLd6vG3azui0vMfxbMw610xeqbdTwLqnw1YxoE5v2RCBI6tIQJ/ZTDNU6B4D5
	r/QidKd/QkIghalZRudDDGfrnbly9z71JXlLIK653VxYNiZGZNVcc3vDUw7ouMBZddmI5bMGTWv6a
	KaL3eva2tZQBdXqoKZPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ62s-0000000E8ep-3pAk;
	Mon, 15 Jun 2026 12:04:02 +0000
Received: from mail-qt1-x82b.google.com ([2607:f8b0:4864:20::82b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ62p-0000000E8eF-3QJG
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jun 2026 12:04:01 +0000
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-517b1f2c668so36622751cf.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jun 2026 05:03:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781525038; x=1782129838; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=jLYphxU0s+OBE/fYIkHAH9A3JQeDKfCb4FnWiSAO61cIkE6pxb1JTWdpCFe2KivK3Z
         AUTIiHRAOQD56FZL1BMAXekPEXFcB8jmL5bWlItZlHAyk39HccA4/+TE00k5+dv5Glvk
         Nw2eoWyZH/u/MuJKTfltzbnESzY+i6Lt44Xm8FCnr14tprzJ6abnE/q4FX3FX7Hz7mbS
         UMDc0Y7BzLnqq0MGWPPP/8eXHbkdFNdbgPpRe2o/iX4EKQks3EMvb2LEH//ejUoV3pz5
         1ECUH9bKmzCxmloVBaP/E6WEr2EX0oQW2I9T7a8viZr/tqC2QPMOdYH+sEaZQahcM2A6
         wIFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781525038; x=1782129838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HVy9GUueUnFuoBBRJmJSO6EMQLHH087G7ntPfjHp8FQ=;
        b=MchC+9fyedgUssPboTqWUOx58fZC9hwijJvR3dIz7fV5gdOS5azEDyiDZ4jHux8MD6
         s3B7n7tDwYcszoqeejGzcF4WAhsq4QQHVRD82FDIc4memJNcyQ9RgfCKRynad6+D3c/5
         u8SeMEWGE5mb6JAnXZVUPxSHYsLsOfDA2Doo5/gcjjC0nl9xCVrcJD8/eBrXN7y56jRX
         8kPbuWQi5v9RffSvaBGptXYXgs0taFHNFyv59x9Dc8R+u8NAW3BNgPmoyHaRcY7R0ZSA
         FY7inuBRbMIbfNsFs0ADRDOMmNi1SO2Zjlblu1VAbHbmhsCzOartdh1WyVDVn3ixi725
         brUA==
X-Forwarded-Encrypted: i=1; AFNElJ915vKcrpWTAxWQO6o4baSC1jUBGWkaY/TxrIHgWMupu7FNoZxFaE2xB1auB4qTiESs5suYgE1PnT7Mtg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzTV5HQtq80KhJ69ny84yl2DdYSopZPas1UqcdaGmvYAU6pBVen
	9CkfW7VIYs5yWsGbzsKgF2SHbRFXP10d2kQQ82opnlffqsLp/4NsttBA
X-Gm-Gg: Acq92OFgRB1f65t1BSk6ZB0Hg2ZzwJkTmLcwrCmhMFAaxcLbdFNsHR2GBTo4Zn18G3G
	+Kwyiag+kq8nZC33QGX512p/WskCf/kmVIB6yNGnzRFw8bfExWF05k9QcyeXxB2AlIo/R3q7rgB
	yWiD7BawLMmENt7iBJQ7VEnnSpPtglTO4LqA5Os/Xeu8vrhr26TMo9B2/F02CHjc9VOmMXQuB0g
	EUbfFC8b3zb7FUG9rSSvRcCRoNMo8vwhczA2ttaD1Ff8cE98if+VL1doeoIoHpwpLZMuvxc3XzT
	aruQLdziNablX889+wlo7zk7aRTx5XMplbCzmGECaU0YM9WidUrpmBijgr4Oc7jxYGNMdRgTM0E
	UoDVCLs5dxgsowuRVfNqJfTIA0tUUY7/meuh7BeovocDYHS9LMbJyJg8PmhlTforphnc3gu4igw
	VxLZTjYbJtxVNgFd7YOYsOqEnwllXaszK66kSS+75aWwhuvLPF5Cwj5RuH
X-Received: by 2002:a05:622a:e14e:20b0:517:71d2:37d2 with SMTP id d75a77b69052e-518e47232a5mr108016231cf.0.1781525037993;
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51975955956sm25184311cf.17.2026.06.15.05.03.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jun 2026 05:03:57 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	pjw@kernel.org,
	chen.wang@linux.dev,
	inochiama@gmail.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	liujingqi@lanxincomputing.com,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	hanguidong02@gmail.com
Cc: josh.milas@gmail.com,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	michael.opdenacker@rootcommit.com
Subject: [PATCH v6 0/3] Add initial Milk-V Duo S board support
Date: Mon, 15 Jun 2026 08:03:21 -0400
Message-ID: <20260615120324.1527881-1-josh.milas@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260615_050359_863148_A8A4C4B7 
X-CRM114-Status: GOOD (  14.22  )
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

This adds an initial device tree for the Milk-V Duo S board
with support for reading from the SD card and network over
Ethernet. This is continued work from Michael Opdenacker's
v6 series [1] on the ARM64 and RISCV side. It has been tested
with ARM64 and RISCV64 to boot from an SD card, have networking
from ethernet, enumerate the wifi chip, have bluetooth, and can 
read a I2C slave device over i2c4.

---

v6
- Patches 1,3 from v5 were applied
- Rebased to latest sophgo/for-next 
- Added mmc1, mmc2, serial4 aliases
- Removed spi3 alias and node as it was conflicting with sdhci1/wifi
- Added wifi_pwrseq node for wifi chip
- Added pinctrl configs for enabled devices
- Reordered &sdhci0 properties
- Updated &sdhci1 node properties for wifi chip
- Added uart4 for bluetooth
- Changed memory from 256 MB to 512 MB on riscv side

v5: https://lore.kernel.org/sophgo/20260403111516.379795-1-josh.milas@gmail.com/
- Fixes spaces at beginning of line in &usb node of DTS

v4: https://lore.kernel.org/sophgo/20260328173450.219664-2-josh.milas@gmail.com/
- Rebased to latest sophogo/for-next
- Added usb node to arm64 and riscv DTS
- Removed sg200x link in commit messages
- Added missing change to v3 and removed link from v2

v3: https://lore.kernel.org/sophgo/20251029001052.36774-1-josh.milas@gmail.com/
- Added sg2000 interrupt controller and timer to documentation
- Added sg2000.dtsi for RISCV and moved DTS over to use it
- remove devices from DTS's to match what is available in the
  default pinmux config. spi0-2, i2c0-3, uart1-4
- Added i2c4 and spi3 aliases
- Removed milkv,duo-s from sophgo,cv1812h in documentation

v2: https://lore.kernel.org/sophgo/20251011014811.28521-1-josh.milas@gmail.com/
- Made new entry in docs to avoid DTC error
- "Milk-V DuoS" -> "Milk-V Duo S"
- Sorting of aliases
- Added uart*, emmc, mdio, gmac0, i2c*, spi*, dmac, saradc
  to device tree matching what is available on the pinout
- Removal of 'no-mmc' and 'no-sdio' for sdhci0 as it works without
- Added riscv device tree

v1: https://lore.kernel.org/sophgo/20250927173619.89768-1-josh.milas@gmail.com/

Link: https://lore.kernel.org/linux-riscv/20240421055710.143617-1-michael.opdenacker@bootlin.com/ [1]

Joshua Milas (3):
  arm64: dts: sophgo: add initial Milk-V Duo S board support
  riscv64: dts: sophgo: add SG2000 dtsi
  riscv64: dts: sophgo: add initial Milk-V Duo S board support

 arch/arm64/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 245 ++++++++++++++++++
 arch/riscv/boot/dts/sophgo/sg2000.dtsi        |  53 ++++
 5 files changed, 545 insertions(+)
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000-milkv-duo-s.dts
 create mode 100644 arch/riscv/boot/dts/sophgo/sg2000.dtsi


base-commit: f7337210bede62fc7c6230ef58013dddf7e0a921
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
