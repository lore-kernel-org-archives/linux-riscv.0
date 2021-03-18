Return-Path: <SRS0=IhzG=IQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E624DC4332B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DD9264F10
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Mar 2021 06:09:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6DD9264F10
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=1Q5yjOJpVCpGOj08/k8BBTz4G4IfkaplPhZmY17jueg=; b=XY5lrU4hZk4lHY
	bj5S7VkzDabWynrwR2stPMH6DvARQpBQVBgIiHbFouO4JJYjAettwlr/Gzfgy4Lsv8ze0FxJgHZ/y
	g5iQTlu2hK+E3fkyu63zImmMXQnpWzYV3DHi2K5XGU6uqE5PrBnAYo+DXlSIiSFWOS6SeXYp6biFr
	egf+VDk93X9T2GHLSzACDjuD2qnHhck7Fr9J9u2UXeYHkxO7ZMA/Kp4oMZGV9c3OmQkYUNbcw8PvS
	w9It4QWc62M30SNSs9gZ65JTLYNFg5jcHr6zTAfrjj8bDSN6qW1rPaw78Wo4QMcmyQae3+u2SHND5
	3ND+XPa7NtKBJnjFpOZQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lMlpl-004aPQ-LK; Thu, 18 Mar 2021 06:08:37 +0000
Received: from mail-pj1-x102f.google.com ([2607:f8b0:4864:20::102f])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lMlpd-004aO3-GP
 for linux-riscv@lists.infradead.org; Thu, 18 Mar 2021 06:08:31 +0000
Received: by mail-pj1-x102f.google.com with SMTP id
 lr1-20020a17090b4b81b02900ea0a3f38c1so6382897pjb.0
 for <linux-riscv@lists.infradead.org>; Wed, 17 Mar 2021 23:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GhH4cTVoL0LfJc3UZUszeYbDpRmL5TWL1BjWP50Uz4=;
 b=mIubeFddqSR3EKaZVNy5rbrJaHNUXne4naiUVYafpvQO15fTp7eXRmAHopzbbbLyED
 RRQdw09/QKisZ6TGKn8it60oMIU4SxpAMmsjw9CKd0BLSU6GvXJLzGeLVnJFWYLQiLQP
 GfutHjdWILN8FfZlo9XkQiSNhHk2L/q4vVNXboDBpjTEt2cmXtlu3p3K9TiRkiLAaoWS
 W4TAguGoxlSfhHs8xhayrBYiSvoJW8KIAvhCoEmQDxU557DOlUmNLkYWRknx6mWQV73Y
 AYMXkgj5idW282tScN8YI0cUqykrpR0mUckheXXdUo6d9SThPgmR3RGpCrkIAzBLopRe
 lHZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8GhH4cTVoL0LfJc3UZUszeYbDpRmL5TWL1BjWP50Uz4=;
 b=L/HCzgd8bnyAcUv6/+ZYgVVaaPyZ7n2dt+xtmBSZ94RiwJw/dmMlMq/4AMLloVbfbl
 vZ1q9Wbkqq2DieJVeB2/E7tQOxbSwTc/TNZsJbvFAjSD1z2zCq/1+dPc03SM1FvZPu30
 TRljsYcrcopcCUrqcWC5xVjH4jVewyntMaV8l9kf3ZxWM0VzvVP8exMWmJadjzhYbTU0
 rLCAwShjxsWwjT5bzO4cnPEAePOhWIzPSP4VZHXu0Z2N0h31a4bbhXJcVD/ZJZF2Ig56
 DWNc+66cmgN4szMHQZSzZBixQpVMndUIB99+sZ0Ox0PnrKob70bDDrUx9Df9spk9KvtA
 hj4g==
X-Gm-Message-State: AOAM533W4LAHpKdlEy+oWoS3NR3rE2JItPkF4UTgrkg9pPJDJx++pEe5
 pEMdnbV6Aun7RhATye/4lodbgw==
X-Google-Smtp-Source: ABdhPJzeHTjGVcWo4WvxhySCrEqEcLBWg1WasA9ZJ0Y4RCv1bFsY+eYb1iAciVjVCp3+v6vNUtG1yQ==
X-Received: by 2002:a17:902:9304:b029:e6:8d24:b5ce with SMTP id
 bc4-20020a1709029304b02900e68d24b5cemr7821316plb.27.1616047707395; 
 Wed, 17 Mar 2021 23:08:27 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 68sm967353pfd.75.2021.03.17.23.08.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 23:08:26 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v2 0/6] Add SiFive FU740 PCIe host controller driver support
Date: Thu, 18 Mar 2021 14:08:07 +0800
Message-Id: <cover.1615954045.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210318_060829_831450_B5360FDF 
X-CRM114-Status: GOOD (  12.81  )
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

This patchset includes SiFive FU740 PCIe host controller driver. We also
add pcie_aux clock and pcie_power_on_reset controller to prci driver for
PCIe driver to use it.

This is tested with e1000e: Intel(R) PRO/1000 Network Card, AMD Radeon R5
230 graphics card and SP M.2 PCIe Gen 3 SSD in SiFive Unmatched based on
v5.11 Linux kernel.

Changes in v2:
 - Refine codes based on reviewers' feedback
 - Remove define and use the common one
 - Replace __raw_writel with writel_relaxed
 - Split fu740_phyregreadwrite to write function
 - Use readl_poll_timeout in stead of while loop checking
 - Use dwc common codes
 - Use gpio descriptors and the gpiod_* api.
 - Replace devm_ioremap_resource with devm_platform_ioremap_resource_byname
 - Replace devm_reset_control_get with devm_reset_control_get_exclusive
 - Add more comments for delay and sleep
 - Remove "phy ? x : y" expressions
 - Refine code logic to remove possible infinite loop
 - Replace magic number with meaningful define
 - Remove fu740_pcie_pm_ops
 - Use builtin_platform_driver

Greentime Hu (5):
  clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
  clk: sifive: Use reset-simple in prci driver for PCIe driver
  MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
  dt-bindings: PCI: Add SiFive FU740 PCIe host controller
  riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC

Paul Walmsley (1):
  PCI: fu740: Add SiFive FU740 PCIe host controller driver

 .../bindings/pci/sifive,fu740-pcie.yaml       | 119 +++++++
 MAINTAINERS                                   |   8 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  34 ++
 drivers/clk/sifive/Kconfig                    |   2 +
 drivers/clk/sifive/fu740-prci.c               |  11 +
 drivers/clk/sifive/fu740-prci.h               |   2 +-
 drivers/clk/sifive/sifive-prci.c              |  54 +++
 drivers/clk/sifive/sifive-prci.h              |  13 +
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 324 ++++++++++++++++++
 drivers/reset/Kconfig                         |   3 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 579 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
