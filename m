Return-Path: <SRS0=fjc5=JD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2BD6C43460
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:01 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 831B5613C4
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Apr 2021 09:27:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 831B5613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MudJCCpsqqUvBFSMl3rDYM1Zeq3NnfGxqI9N7UfMypA=; b=oCCvHs5eQi2Vhe
	nUcfSWffVQNx4gLHa/cCmpXttP8Xa/7Wh6zrp9eqC7PqbGVnHRMMpuYyeH/3TuFt55//8Cr6h+MLR
	dzMJlNW19/Ajox6ihZ7BKFNSrwzGwyDmQ4+AcIEfYVRlQf2zB6b0iqMo6kPte5G2rzPsXVp5vBPIv
	SjpWrarrJLeb5erBVNK9/sx1/0dRAE8oU2RSsTQXGAXq2FnxaM7AkUPR1HY9vh1YRTwN99OPgBUiJ
	BYDffYbMRKJWXcXyYQ+3bZkz9FDaJ19GSzJZ7Pl9eyYujnIJAIpSLMvF9s4bVUfc4O9AQkhiBc37R
	wifsIgUPwAgEFgkpPsyA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lThyy-0020nP-JR; Tue, 06 Apr 2021 09:26:48 +0000
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lThyt-0020mY-KR
 for linux-riscv@lists.infradead.org; Tue, 06 Apr 2021 09:26:46 +0000
Received: by mail-pj1-x1030.google.com with SMTP id bg21so4538772pjb.0
 for <linux-riscv@lists.infradead.org>; Tue, 06 Apr 2021 02:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9aauEj0ZznO9LzKslz62xYfWSRsY7rwUuiLDdRfB74=;
 b=fjWJDRbldFVlvO4zkZJQyJKIRAAbm80Vl9BjmTAzp94b2Gbj1V4ZMJvd+h2myJySEu
 Bn0hrzUlDR+MSaUMVED0H1qEVOgQCB2J5ofzTRRSdAXp/Uj1qUqkWtBIqaycypvIdVoD
 lGp4ouOgXnx9DWlnOOaMxWGjFbmQQ/J1XjPassnAs5RFWj5axewls+T+BBCl7cXIrOgy
 jJdbwez6Q/9ZLHZFNatV+BfDJeLiAyJn3AqIJB+wx4Tefk+d/OV2JijgfHF8dDkWuPcZ
 sfaaBvGxMDZpEWa3a59lxCPV7n/M28thc6yGsfjD/pWM04Dxeslmf7R9LJ4IwdNm+IR3
 srOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=L9aauEj0ZznO9LzKslz62xYfWSRsY7rwUuiLDdRfB74=;
 b=OSRbMd2FGu8orZ2wWH/KBgbwFDktBAT0J3Rl+RmIUdovWEGUDjkBag67a1aBpmv4/H
 59nWj+pBoGYo8qE6TipkLDMLNPpA27D63gPGY+/7r3rLCDHTvsGd/zjNc6GjLkjFUbU/
 gVEk75ZRTu2LHp7PeQPDlMN2mkfbu0gfdv/8iBstJYMzjnnANMEWeYwm4Ay/UI9Edc5t
 F/VTeyjq/021w8pyX/zA5j3CzraC1Su3XaCCv7XJrVe9L4+NfAlejpFu7ylqAH74SrVw
 sJHovWV0PsxGaY3BeKx7XG7i5w480E/9cW9aPv5065EMu/sjhgycD/VQz83pFisFWvuL
 rk7w==
X-Gm-Message-State: AOAM531ptFwIwbVkQhPUH5QZAw9G5/XhSDnwNrMFbhsAP06YoveEDYNF
 oTQ5u7jas4elSA4dIzR+Su5t5A==
X-Google-Smtp-Source: ABdhPJwg9APLF5QDj3ZWbb0zY8K+pD55HInxwlo7zs4IjEZ+8gAm316DirXcyzUK4NPF9AlzQvnsiA==
X-Received: by 2002:a17:90a:1d08:: with SMTP id
 c8mr3675584pjd.139.1617701201659; 
 Tue, 06 Apr 2021 02:26:41 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id w7sm13685589pff.208.2021.04.06.02.26.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Apr 2021 02:26:41 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v5 0/6] Add SiFive FU740 PCIe host controller driver support
Date: Tue,  6 Apr 2021 17:26:28 +0800
Message-Id: <20210406092634.50465-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210406_102643_801004_AAA2D51B 
X-CRM114-Status: GOOD (  12.98  )
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

Changes in v5:
 - Fix typo in comments
 - Keep comments style consistent
 - Refine some error handling codes
 - Remove unneeded header file including
 - Merge fu740_pcie_ltssm_enable implementation to fu740_pcie_start_link

Changes in v4:
 - Fix Wunused-but-set-variable warning in prci driver

Changes in v3:
 - Remove items that has been defined
 - Refine format of sifive,fu740-pcie.yaml
 - Replace perstn-gpios with the common one
 - Change DBI mapping space to 2GB from 4GB
 - Refine drivers/reset/Kconfig

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

 .../bindings/pci/sifive,fu740-pcie.yaml       | 113 +++++++
 MAINTAINERS                                   |   8 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  33 ++
 drivers/clk/sifive/Kconfig                    |   2 +
 drivers/clk/sifive/fu740-prci.c               |  11 +
 drivers/clk/sifive/fu740-prci.h               |   2 +-
 drivers/clk/sifive/sifive-prci.c              |  54 +++
 drivers/clk/sifive/sifive-prci.h              |  13 +
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 308 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 555 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
