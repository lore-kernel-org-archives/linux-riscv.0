Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA49AC79F89
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Sep 2026 11:26:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tAS4ItTx6YBQZgAG+PZm1skq1/axAAXip2QebqhrVgo=; b=fb4IIsGb9Zcret
	35pB0AlBu2VkTx28V807HoiJkAvKUtVex3ESHfAy7Z0uFN/zy47VrNLXeCfsl70V0cc5lMLAzH1QO
	ueLRJFWnE5cMtb1PvJo790oZWy/0przMi48W6jHBGZmidlGPTM/jrRAFLJ0OChHcte7zs6J+y8ALK
	MoS2+RDqJ1o3XDfxtu+/f41RET4tU9HKmDjz8er0XF6mK4F66hV3goVbho/6GFareGAA+5N4sHFsr
	zpTkHBed2Gm65WQ9wcCkj58Rf5/Mg6wLbXFWxc5Y8HvBO7MGn3GnYpVuDTKc87+y5wcZGVnTwIsYI
	NtU9oiZl94wxU5/5ASjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUm-00000006e5t-3x51;
	Mon, 07 Sep 2026 11:26:40 +0000
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3XUk-00000006e5J-0pFZ
	for linux-riscv@lists.infradead.org;
	Mon, 07 Sep 2026 11:26:39 +0000
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-381b831d535so5644590a91.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Sep 2026 04:26:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788780397; x=1789385197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=mNm3q4hwsjtXo1WrWXgcrch3fHIp1I7pJe3K/+Wrjwjr5AHVghGYJSuYurf53Lza9h
         7g+oZ3F+NdrWVqX0MXdzZsOHrTyeona8P690xh9+lAmpnB5/U4ZhZbp0yoQpjc9gXedo
         NwoVZPFdNC/aqsJX4XlF2dfNFtzhTPdgxlc6DZaJqZGIgAnDenfzID0YVnMIphdKRuOb
         kmIFKS1WcZUOwL+Lj0lV4vUxIM4fwKstOxSW6dMq1/HvsznRgyRaTAReFL237B7Gudwe
         qGsmDADjNU8Rj2diPYGC6myottdue9triKe6+pIBAgZ1Xvsao3e7dqWjUbCbasIdkpR1
         93RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788780397; x=1789385197;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oCIRpQj2OSAEKhN68oM/fFJ8TP8Qm5gHiN+49vtxncM=;
        b=tGRYSoh7dE0gWQTHNyWg48EtGLHB19inRsZYKsogMYzMuROhHHfc8/AQqNI80m/PFq
         5HUvLtsljpcSS9kUOpYAZX5bbOhF2LEU9rLjTBggcRyMHjyxSUJDF+QjpoCIxpZd6xU4
         yMVTKzf3kqx2nPPIsYnM0MCYl2P2NE78H+MkzCIEF+vzlguacnldoHxSX0yytBMqTlF4
         Z9wmxw1/nB6bCWVHCKuoojh5EjFv3ZlXnoMxOZ1/kFJE0HZ9rQlCZYdsPWkADR2cwmgb
         /lGyxO0kSHArzhJVnebXTUgCfaDjZlFK9ZAzoZjITfgI+WGIsKAaaoEHtOjJyM8PXjYU
         aHKg==
X-Forwarded-Encrypted: i=1; AKwUvBwC+pjb2fiSBvJOY404jXuiyizPf2pmNOi8tW9jIOUD/eVCaykZ3/ZPDj4UOSiLxaLk+bTio8axVSjz4A==@lists.infradead.org
X-Gm-Message-State: AFuF++nKJel1UnFD0NXaF5UF2CeBZpaa3YdfBm6C7a8kCuKsxPmUEjZo
	bFBP/ys5pEmy5FdQzXg1RRqi4uM23+Nf6B/bx4ghVZCckNwcXXHSAG+w
X-Gm-Gg: AYBFou2+SynsxHlUmX+OYzDN1XXukGFIzVXXNOnGWPmiZS1pBFG242cke9ARXvsqPJ6
	UZ1Ypyu2SWc+u4Fon5N/um3NJ5abqP92SqwL+3VGEZU3MnGI53wUzf6Rh7truaWvXXLxuN0TDHC
	AykhqP6YI2qFM8hCmx54W+js8xuIu/87ZPnvjFpJ0i98xfnnIqgjJuTcC7KCJytibrr/765XKqn
	x6DOPapDZ404fRBd7iJgiFNvOjffBqO2Vu+28667L/kUtaUHIBkUvbkGaodIRlZWVIEoqXnLD9U
	utJdV0cNtb7Ae5Oa1D49CbneJzPFC1RA0JUvLT899R3jP3/GbgcL19CCd1e5ELLkVfsuMNeoM//
	QCmO2eIXWjs/M8RQnwoyLlClAv0CDjrahY9QoMeVab0pDZ06aqdE4kAnssNWcLi570RiPE2YT5g
	z8oj+YhSMCDLshEt0vJCx3gaAyzQZz9GxaR5RQ
X-Received: by 2002:a17:90b:544b:b0:38a:c3f:3b87 with SMTP id 98e67ed59e1d1-39b261e3b72mr33475243a91.12.1788780396594;
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08ce4221sm31225121a91.14.2026.09.07.04.26.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 04:26:36 -0700 (PDT)
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
	Niklas Cassel <cassel@kernel.org>,
	Sherry Sun <sherry.sun@nxp.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Senchuan Zhang <zhangsenchuan@eswincomputing.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alex Elder <elder@riscstar.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Danilo Krummrich <dakr@kernel.org>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>,
	Pengpeng Hou <pengpeng@iscas.ac.cn>,
	Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v5 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Mon,  7 Sep 2026 19:25:59 +0800
Message-ID: <20260907112606.465778-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_042638_242371_159AD4B6 
X-CRM114-Status: GOOD (  10.93  )
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 ++++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 210 ++++++++++++++++--
 4 files changed, 244 insertions(+), 27 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
