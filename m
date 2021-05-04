Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ACD2C43470
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:45 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D545E613C4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D545E613C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WqjDsl7e+gEKm1SLzNNJgtgNNUzZKQuz4iwBIoNpveI=; b=MPTenoeHDKtyvQ
	Mi+HoN6F48hdq9bmBly56pCmqXOqsv6gYtAExGs8NaZYrIgX280abrArlMYEX/RfxRmdnsJIe/Mhw
	Q6oghx+866oSq5NdDW+kziSetRxAoV6u/EeWahneqnQC9b3LxfJcWN7wseIUgRm8xpfP4KYNcQGE9
	0+/G663+20BTFqklgeC27P83Rw49bu6H2tOeyvNTs+ixzeZTdAfKFQLkAG3DSczOPtEo7ROBkXcuu
	2xYotPRQsSROHc/6rOtedawNxAD0QaK+5VaA98pGlpyaIKOfB0Nvs+1gxgw73aTeLssstFseRsIVu
	VrmQokDX/cDpDEUSeCZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsn1-00G1zl-6w; Tue, 04 May 2021 11:00:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmp-00G1xB-DF
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=kJIjfEJRJ7Pr4p4QG/w4Mq8dVNNzEKWBtUNtLtPuDVY=; b=jKgCE4270t8wBBZZLZq+llsjXd
 KDhPQADmKE3Z9VJzN9aejpehNkAc1lqI9SvWIvdcU2UbAHGvtfFiF86tq7hQIYZ7GIazAwaxQ9yLy
 ZJY340oV6mXiVgr1KajhHeF/EUUz7hz33KCR2yjfGnSDDCn2ZSdyYG4aX67UB32MCrG3ZmS1Ksx5p
 nZn+bv90m7JLx7CvsQ3BM7Ks0ohA09TP3WAm8GgoBuTZpTZx+FcxZDTwrf4LxPfVGkJVCb7BXBJ50
 S1J8DYdtnVT+eyJE9unyDVRfLQCMP+mqzixDYO3CWaKm66sbN/Yfw9gz+0uU14kWZEdUnEnKA/gdT
 70ya14jA==;
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmm-003usJ-QY
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:18 +0000
Received: by mail-pf1-x430.google.com with SMTP id q2so7020372pfh.13
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJIjfEJRJ7Pr4p4QG/w4Mq8dVNNzEKWBtUNtLtPuDVY=;
 b=B2c0fA+WY+d4YSzIml/LTUKhzsTlkS1ULrQt0iy93gdLCTT/XapkzdZ6w+cwRJFWfd
 IQB9T/YmcJHkamNW8DznWDqVsfHhdAXAuOxzGaxYwtwO2D/w9XsmfWCiOnhuV7B23j9A
 Qejpj1XZUensXy+InEnvf91fz8If3aB2yYiRQC+9Apzfrfn4d1ApRIH8g7e42y+HHUX/
 12L+wHKYzr30nGVl8ShOfuwl8E3VpiuF1gzDmBO24m1Vpsy5GUzayamBVbKrdalVVM6b
 yKoLnZ8NToFdzsYvpcp441jUw700s+n3ySfHxjE32s3GhlDfh3TI5wySW/RrM5OF3VgB
 xmKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kJIjfEJRJ7Pr4p4QG/w4Mq8dVNNzEKWBtUNtLtPuDVY=;
 b=aAGFi5loNW55owRYvtYcffJdhuIpyUhBatIO8BL9PLXF1ULos7Jb4pA05CbLvwSTev
 NTSdz33QPwNtcsm8+91maF1q8LrD6XGb6ocksjpFIEYuMqyyjoKIuS85xc6r2WdetytD
 wH6D5YKBeoRggi9DX/Q/TlPIXytJOpwf1czBaSQJ7PpFw66qYP34N9GUO+PQ8XkqHev6
 notD8ucNZN+FrYzKPFxlczuGEEZbECFW+8QAWoIB1vJe0JoJtk/kRbUoxEoHz/htuDSO
 93ZqSWMGygScvCTEQaItntc6ns2xxTrDcMhZK5PzDdky6phVQO/RWdiCAw5wTj/lRHBt
 pnUA==
X-Gm-Message-State: AOAM533aWVshMIFETwA9kh59BlbAOeiOEZOYoDGJ8uGK8S6xbTvjCp+1
 j5wUGT7DqjrGeCN/eadmb383QQ==
X-Google-Smtp-Source: ABdhPJwlO973vBwZXAhgpxC+3mmoQWgrmYIE12W3oa3frr5nBO6fYbyhs92WeZVYoUrtaNbZnD8tyQ==
X-Received: by 2002:a17:90a:e615:: with SMTP id
 j21mr4340982pjy.43.1620126014199; 
 Tue, 04 May 2021 04:00:14 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:13 -0700 (PDT)
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
Subject: [PATCH v6 0/6] Add SiFive FU740 PCIe host controller driver support
Date: Tue,  4 May 2021 18:59:34 +0800
Message-Id: <20210504105940.100004-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040016_883140_68D45ADC 
X-CRM114-Status: GOOD (  13.88  )
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

Changes in v6:
 - Fix build error when CONFIG_GPIOLIB disabled

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
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 309 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 557 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
