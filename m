Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F053CA5FA5
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Sep 2026 08:38:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ejtzu0FoUZYQqpoZ+PWMRFl1n+RL0cEr01CwOsa8mVQ=; b=a56JkIO+VSTF4Z
	1NovRLTcVvM9LPCawo3UqcUuHBhJ5mbs9NkRzi63+FvpJPE3MZXfrlpNvMhr1JdTnnEiqRqeYgrPm
	EJjxZdUcA64cz3PWs28Uqfpj4WHolVN3fiDg1JwsjyX3oriY6dVnaLr5OYok4wt92STLBq4mrKzXs
	5OEb/Lrf1OrqMJKkbVhNgGX5dimhylN5x/vmXz5Jq3006zQih+U6GoYRm3ZL3oUNQ0l1c6ozvNmmD
	LbvRZn7AWTXgJfl5wXDkVGE1CkShVAVWd+tzOLxZwVtvLi2JsY6V01Yq4tndaM/EpfC11NeKyWsSx
	PvzvW8gQvkZFsXS9Voqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLn-00000002o7Z-37M5;
	Tue, 29 Sep 2026 08:38:11 +0000
Received: from mail-pj2-x0c.google.com ([2607:f8b0:4864:39::c])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTLk-00000002o6f-31mD
	for linux-riscv@lists.infradead.org;
	Tue, 29 Sep 2026 08:38:10 +0000
Received: by mail-pj2-x0c.google.com with SMTP id d9443c01a7336-2e2a68e185cso12031575ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 29 Sep 2026 01:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790671087; x=1791275887; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bVr9gxAZxb8ElKLswGJsmoMufAJERtFn02OY/z6PAKM=;
        b=DCRVD7I2XFadIl5NkKwGXHgncqJwHgCRWtsKbZwg2gkduO5le8Yqi4Al2Q06jVxD8o
         qVz/kil+WfxUaVKWz69RKigEAWr1FG8zrk0V4FO7agorH/84eyTBOKeV5tQWW9qW1W4x
         WpFcnkaxmKizfBzEqupfbPpbs+KyiJJmKD2IQlkMQW0x1m1wdgLgunZhwbcYTPKoOeOD
         eWLiondodmqpjElGPzsXw+yc96xDK8nfAyocuIwg4V3doRKZv+ZcrjLNOC6N8DRLECzr
         r2HLbF59s4maJINsb76+c2zYb+MpVW1flQNxtuoghPzgUKOJTi472qw+2isKYLBC3W5X
         NX+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790671087; x=1791275887;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bVr9gxAZxb8ElKLswGJsmoMufAJERtFn02OY/z6PAKM=;
        b=W2je5xrr1goMZJ2ccPGqO5Kdw4YcRezKrpMp1ddBQlPlWQIrJLJj5M+WX2eana1CbB
         z2luJczcSfOzBBdSgxVPkJuDq1zJcm5hWWJkvgtjBgleMK6IDQKgvGeBMRXM74xE2ofG
         nk0+S4s3ze7xR9oNHoh2UX9+sNFfIKRvidOAfMa64SFDiAB3BxtEbvPAdgkESM89CDX6
         PJtE5E4CoKhAYzl01docjE2HEM9FMYMXP7jFc9kuKNjv51FUgwIcg0FWwUESTde7q1Zk
         DN1WtK3lhuxbXHyEryBaUHokRGtBydDgJ1ePhdMZEb94vx7IF2mXiBenxPVNu4DbGETu
         HLOQ==
X-Forwarded-Encrypted: i=1; AKwUvBz9JVmk3gJuKiBbrCQBPbhOT12Hsjxs7DbdmfN4NM4zJEvwdbUjGwhRdJHZuvf8+gUrCTc1uXVv8zGe2Q==@lists.infradead.org
X-Gm-Message-State: AFq9FYLOO1NBeC5OR73sAOxxK8Dktmz75NhrVJZjScWf8XiSyBorIMGS
	x2KaI2v1oqMu7IjrlAKT2LZpkcZBDC8m0AgA4JU0z7mXHS7JumZfBakv
X-Gm-Gg: AYBFou2QfvdW9Rl3ARcvONGTxEfD87ao/TxrlfPN3e8aWaUOIRLOGZeBEpnpf0Ui7zx
	pGinnnndxx/1k0pj5p50p9OMUL5m65Lf6v2f+1y7vOgQP5rcQoFMZTOP+02ERhy/zz7PqOEAwAP
	fVG+RE7vPVQf3TgKp0fGIEOYv9dJTLlkE8oeSFUdPTtnXaNzeeGBORWfZz2HU8/cqSk3TyOJXXh
	PDOMe+YTiG9UBDcCDKdAqfcGR1axkJm/5ng4M9xdo+xE9uUSfqe/WPvJBEHHo2hRFYrw3XwYhqT
	IFqT7/DFOIU14EaT4P1oaI8wZrMUm1ngwo5G6ocnoxaXvHXA+CPWV69P0WumPWkpUsKkF5u3ocP
	sPDwOeMFBzonUhEq6Q+YQxP2o1LNxwHSjmHkVNM5eModSMB2GjLDnDfvQBlYnFp2W626nKUNRwa
	FP494Wl7GQa0Z/hamoCnB7p9pHTjO9wYW3HKVE7+Hutytu3SpefIeR/p6akNr6qo9/LVv1
X-Received: by 2002:a17:902:d550:b0:2df:9a4d:650a with SMTP id d9443c01a7336-2e2c0b3b7f9mr20035895ad.29.1790671087430;
        Tue, 29 Sep 2026 01:38:07 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df90fbcaa1sm53065915ad.4.2026.09.29.01.38.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 01:38:06 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Frank Li <Frank.Li@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Niklas Cassel <cassel@kernel.org>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Randolph Lin <randolph@andestech.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v7 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Tue, 29 Sep 2026 16:37:46 +0800
Message-ID: <20260929083755.458238-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_013808_767664_F406D439 
X-CRM114-Status: GOOD (  12.03  )
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

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

Since v5, multiple vendor fix are included in this series, you can find
in [1]. And this version required [2] for phy bulk data support.

[1] https://github.com/spacemit-com/linux-6.18/commits/k3-br-v1.0.y/drivers/pci/controller/dwc/pcie-spacemit-k1.c
[2] https://lore.kernel.org/linux-phy/20260904083709.425893-1-inochiama@gmail.com/

Changed from v6:
- https://lore.kernel.org/linux-pci/20260923015016.64069-1-inochiama@gmail.com/
patch 6:
1. Keep PERST# when init failed like the deinit.

Changed from v5:
- https://lore.kernel.org/linux-pci/20260907112606.465778-1-inochiama@gmail.com/
patch 1:
1. Return ENODATA for no device data found.
patch 2:
1. Add power_on/power_off suggested in [2].
2. Add zero phy check in the driver.
patch 5:
1. Add K3 device description.
patch 6:
1. Update comments.

Changed from v4:
- https://lore.kernel.org/linux-pci/20260709040027.958400-1-inochiama@gmail.com/
patch 1:
1. fix comments
patch 2:
1. Use phy bulk data to simplify the code
patch 3:
1. Rebased to latest master
patch 6:
1. Apply several fix from the vendor code
2. Use separated init/deinit function for K3.
3. Add some error handle for K3 init function

Changed from v3:
- https://lore.kernel.org/linux-pci/20260703020003.485436-1-inochiama@gmail.com/
patch 5:
1. Add missing interrupt/interrupt-names check for K1

Changed from v2:
- https://lore.kernel.org/linux-pci/20260517014841.254085-1-inochiama@gmail.com/
patch 2:
1. Use unify PCIe phy get/enable/exit function for both K1 and K3.
patch 3:
1. New patch for updating device id for both K1/K3
patch 5:
1. Reuse binding for spacemit,k1-pcie-host
patch 6:
1. Multiple cleanup for the logic already generalized in the previous
   patches.
2. Use generic description for the Kconfig entry.

Changed from v1:
patch 1:
1. Remove post_init callback.
patch 2:
1. Fix devm_kmalloc_array arguments order and error check.
patch 3:
1. Apply Rob's tag.
2. Change check from oneOf to anyOf.
3. Fix spelling mistakes in commit message.
patch 4:
1. Add comment about PHY handle.
2. Remove interrupt "app".
3. Fix spelling mistakes in commit message.
patch 5:
1. Remove all logic related to link up interrupt.
2. Clean up all unused macros.
3. Fix devm_kmalloc_array arguments order and error check.
4. Remove unnecessary start_link logic.
5. Make all magic number as a macro.
6. Fix spelling mistakes in code and commit message.

Inochi Amaoto (6):
  PCI: spacemit-k1: Add device data support
  PCI: spacemit-k1: Add multiple PHY handles support
  PCI: spacemit-k1: Add device id update helper
  dt-bindings: PCI: snps,dw-pcie: Add msi-parent for MSI handle check
  dt-bindings: PCI: spacemit: Introduce Spacemit K3 PCIe host controller
  PCI: spacemit-k1: Add Spacemit K3 PCIe host controller support

 .../devicetree/bindings/pci/snps,dw-pcie.yaml |   7 +-
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  55 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 270 insertions(+), 33 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
