Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE4CC43602
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Jul 2026 02:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=zXDPoopYAEd1/wHRC+SSohV++5OXvWDSKTy83bqA9+I=; b=YpD357eBf2xEQN
	Wu4FojQhcDsHRWPJg3dBn57zGJHjMdM8dy0a7ImQRcpROZIqP/Ij993NOm+VBq8ap298tXKn+5lRr
	ZaofCvELI892gb/hmlAW55kBH8fDdLIaw4cJH0T57Ik4f1mIhfIsqr9e24QfL6aN5GFdqCgU+8R6u
	Yo6AVlMf+lbGVo0nlzb44zOIWz2zAiAsJWXDJgDeqwPRoT8GMWn4Hvy2d1KP6H0srm3SbHHddqJBr
	OPxe2NDSvMl1oMu1AIDNrAukaMm0CVSiSJL0CsE73r8Cx/VYzat2QwEOrcf2dmhmMwNi3HtPqDF/8
	pnIQaTYe7P2Nx/kR0AKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCs-00000005qrQ-33eq;
	Fri, 03 Jul 2026 02:00:42 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wfTCq-00000005qqu-1XfB
	for linux-riscv@lists.infradead.org;
	Fri, 03 Jul 2026 02:00:41 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so51212a12.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783044039; x=1783648839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=g166oir0fQaTzMJvVKd6vB4RiXqaHlN+WkvATwaQn0US6amgyUVTTXy5Dgog9HXtTL
         jJOb0h8ejXg9DNDshLejxfLf1sfWZk9rHcJiNhLgnQNjsvRudUbjjqi70vruDBR/RRzq
         pPSDxm713e1T728/uaCmpt82fM9+vwdWrIHHFYQXm1Fs247YwKA5WNoTimO+Rn/GfR0/
         2GCA/ZmVaFK+zgbI9obKg6aMGgw12Pps2uirgYS1j0S/AEnN4kgsmo7rgZEUbJaVHlC+
         z3mIibCjGXxD06EZXtmdpHh/OabdokjF1ARzR4bJnObtejq3t6+Tb8sGiNMh0p08TuRl
         /fIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783044039; x=1783648839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ngIdo3QRj8SJ2wejaOldu+l1ZMsTWJa1beGhYYg+kyE=;
        b=lDhkNae+tT2etAffSuHqTtIN7RTZ8P2X0YTNBCeqFerzjChGBnLcaUkc2YctbeWt8X
         BCGnHVwlMiep1HBsIU7UEuRBLkWlR/Z4U87e+GTfV4y5CCNta8Jxxqe75EQLQuGWC6p3
         rxPQUyoZN2bYZvGo3NujdpHO6tv6yF8fdLzSf7mI26fy7J5207th/k86mt0Ev73aE/27
         Z48MEjcZKWJgCEJj7nXraJAsr7gly9frVMJyOKCQEn674wkZW6TWNYv/0bW1pEjUs34A
         oHQPKf9oYISyPmOkNWWB7aRB0JiayRNbRT3VFhWHscIVn9kV05sXqCDtIUuX6qeqXoM1
         Nhfw==
X-Forwarded-Encrypted: i=1; AFNElJ9Kf7hRJfwN2uJ+T2NsuWgBnK1G+4K0EqFtV7TIFrZBDAJIBn5cR+OXaR4OqMuj9V8c7BZlbnQEcKPGAg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzmzHxK2QM/+1wwm70T8DJHS3YOTkbJqF/5KvyA/3yYXxaP/oC1
	Hp889K8cPsL/FDp9R5WQ7mQtJqkvycjoA7oDkl72B3VysiFAB96Xj+Ps
X-Gm-Gg: AfdE7clyJdFR8AMefGvIROW8YzKQvoMQRJrFi7ExGLZfUP1fay4fXiC+2wJKLZlJVH3
	9Aq8Ck8v65c4AwopoAG9+HspauywHQcQundYal0F6oWroFIXhEpO+96VMuLKjTSh6WBBh1xJf8V
	nuItbkguo2oEDMFg4YumQzgZr+KAtO4AXBOGcxFpgiaJFNh1zaVsLbeRpcbrzeJKQsN+e6RP5Yc
	xTIScug0dJuiIFcmKl49euUq6HKzG1+If7Wswswd13Dp3ausRCtE227pwv3AchV02bfvrBFKMTy
	gZrnzRByesEmX1zsLHwt++DEQPMEHhrDm3ukxs4bJuXdj8ekTztUwzQhpH9JEbg5Rl1cy1Jk4Bh
	BA9eCTdJmRX7MndjwVvDFFwkmr0dB9f1a9AwLR/mr4gMGkNkeb8AJrjLKMPw9u/Ii4vgT0laFnj
	2Q5h85m9I0oQM=
X-Received: by 2002:a05:6a21:7a9b:b0:3b4:731e:6fad with SMTP id adf61e73a8af0-3c01c6d75c9mr2593383637.16.1783044039066;
        Thu, 02 Jul 2026 19:00:39 -0700 (PDT)
Received: from localhost ([2001:19f0:8000:3e6e:5400:6ff:fe38:3d01])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c9e8eb10638sm1905295a12.2.2026.07.02.19.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 19:00:38 -0700 (PDT)
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
	Neil Armstrong <neil.armstrong@linaro.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Xincheng Zhang <zhangxincheng@ultrarisc.com>,
	Alex Elder <elder@riscstar.com>,
	Randolph Lin <randolph@andestech.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Gustavo Pimentel <gustavo.pimentel@synopsys.com>
Cc: linux-pci@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3 0/6] riscv: spacemit: Add PCIe RC controller support for K3
Date: Fri,  3 Jul 2026 09:59:56 +0800
Message-ID: <20260703020003.485436-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260702_190040_422512_F04DC170 
X-CRM114-Status: UNSURE (   8.92  )
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
 .../bindings/pci/spacemit,k1-pcie-host.yaml   |  46 +++-
 drivers/pci/controller/dwc/Kconfig            |   4 +-
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 237 ++++++++++++++++--
 4 files changed, 267 insertions(+), 27 deletions(-)

--
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
