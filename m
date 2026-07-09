Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 911A0C44503
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jul 2026 04:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MCL43jNbIqf/CM17mQdRaAgItqZGjA1fi99kd81ei4U=; b=WlOnNcjBeTNZRx
	MiiMuZtKI44VJGDhnc7nmIRHgjAcg7BL2VcqG8FjHU7Sqw4tUxlXR6TO/MnnvYpBn8cXPa6vjvFsH
	jjfkFLi2cIUOgsIA5rYCFbSziFkYruMvHo1mTtjT752vru9knwtepZliF3A7CZCHXtSoJNXeUova7
	8aDUkjrPLr7AFTuYSxac3pQHFwvqgHd1120OfXzQ//tChy0Yd6ru0LTQGCaHtY7h3uIa4Vym7sa0k
	3d4CtLIwHmKKlwM8+U1eG9q5cRdztyEOmZAj8qLeBqfsHhqPlbxKKH75fWfhGiVWpvWy1xbT+P6B8
	PPYykmxdL4q1R84e9P7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfwy-00000000xAy-2rUG;
	Thu, 09 Jul 2026 04:01:24 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whfww-00000000xAK-1fA4
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jul 2026 04:01:23 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-848479c9bd5so1016755b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Jul 2026 21:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783569680; x=1784174480; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=q/08qtEORRJIOK1IVhy6wJNjo/1VxsqWzS2DKtEHhu7W1/R/aGrokCjV+4EShilnar
         yjP6DN/i2XMD8v3Fqlw9AfCSmUhVWkzStFnpC+1MYoEui67DSZ3cLPd0u4MMRVQqnL/F
         bEbX6BOtvHPe0QkgN7jkJ+tWNQltg7yN0Pe3qJBkhpp07XkKBjimWoEdFo5Zf7PIn6Xq
         g1R2YodHtSTVklqYFnD6hBtgZn24o9U6hyvAYpyd5LY3atSyOljGrsbu2mfsLwjc5Cmi
         vub+GjGMzkV5HPjKvfoO4tSiKFBPmVeZA1BZotf44YPUCbtz5n282Xm3ttdSfnKkhtVE
         Alig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783569680; x=1784174480;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cvLv9XK6KjcJ7sFC5wHJkjs3i5/edN/xpBE+mpYwY4k=;
        b=T3OflgW/ih5ReRDfxZvw2ylx6wacmj4QGVUWgQw37gUdTDLXdA19enB9FyFD2HQHh3
         cJoEQBMoFc5I3cIzr0YO3ajrJ0CMj9MfxXb+mgsELu3Tom2uud66rXzAYtG/UedpIOLY
         4iG8bFsiW+6zNBIRxjh/fdx4wfGoqh0+m1WIq2/zMMLjMUNVTSCn+iEtYMWISTE0oNGs
         09J1pj4D1P2PRmkIF2SNyA8UxtSwNtPhDCHl09EALei5D4HREMnhprGtIEGJr1YpD4zt
         rSrvdGL619gCnWaFE+vyg2P+kneMQGxYrL9Zh1lxyNp1fj8lG5zO6GCaHSdRLZncFGey
         b+kw==
X-Forwarded-Encrypted: i=1; AHgh+RpLZhgy+a4AGdPx47SQvGl/Qyx1hb4NWSdLeDUoj+N9xpISZ2qtEfW/lKon0MpbPKPbzMXo6qMZE7q89A==@lists.infradead.org
X-Gm-Message-State: AOJu0YzSZu7PJFA6O7hEIOqv142D9XVIiUS+I54JflM/OdlqNyU6QEB5
	Meye2muB+Wlh5pK49NYM9Q2qAKkm9nQdvgIGDDABhfXTZeg4YpJBsv24
X-Gm-Gg: AfdE7cmdFRx9qfNBBIgcNsWiANC42C73m8n6hIvFoPVW6f6AreSrVzmaEBcVMrWcnMH
	usgS2vePttx7LXxorrHdMN7+e/AKm8dyG+NL536kpqfXW/zIvA9hh9c5MNl0tEiZYrJFZEVXfP/
	fFtVmr1ajOT3oGP+kO02/hk78WeOKkHmqqSb2nUSq/lnKxxc0UljIZTnhLvnFMnVScGXjX8GIsQ
	x4I94kfElLldCpq2MN6PLFcn6GJdI5dw9S+rEBr7Nzwk5G08tpWO+8OpUC216WXaF7bOYuNGywm
	7JPHNyOHKD7bGELXvH2IxtkfxdA1L7xKqDZqDZ7AsugCwUj3iPUpVNILxhdl/4hHzhouHYWeLWP
	Jw4gOZJQO6cfjXIXUpRFHaW0rsl0FB7UP6c360k4LIp7LNFOx43dYoSCCiy6drlVg
X-Received: by 2002:a05:6a00:4405:b0:848:2f74:d8d9 with SMTP id d2e1a72fcca58-84843004857mr5364669b3a.74.1783569680457;
        Wed, 08 Jul 2026 21:01:20 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6b9a832sm7919258b3a.18.2026.07.08.21.01.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 21:01:19 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Jingoo Han <jingoohan1@gmail.com>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Yixun Lan <dlan@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Christian Bruel <christian.bruel@foss.st.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Nam Cao <namcao@linutronix.de>,
	Qiang Yu <qiang.yu@oss.qualcomm.com>,
	Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Thu,  9 Jul 2026 12:00:20 +0800
Message-ID: <20260709040027.958400-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_210122_437020_22F47D97 
X-CRM114-Status: UNSURE (   9.03  )
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

The PCIe controller on Spacemit K3 is almost a standard Synopsys
Designware PCIe IP with extra control and external MSI controller
(IMSIC).

Add binding and driver support for PCIe RC controller support on K3.

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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  50 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 271 insertions(+), 27 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
