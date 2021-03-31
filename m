Return-Path: <SRS0=kAis=I5=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BDD3C433C1
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:26:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 21CC0601FF
	for <linux-riscv@archiver.kernel.org>; Wed, 31 Mar 2021 09:26:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21CC0601FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4YKcXuzYI1tYDcpy+vIGzRUg1iJezvZ60TONGIEGa1U=; b=Teq4mEs7IwtzHy
	3MgHaOpES3ain3h8n5SrBJ3hHCRAVCd+TzttscxEvlvnG4dWRgr+C66/LbviuqMOsziUgGzVTIB8u
	mhQyhk8NvdtMxpCfNi45xhM3Y5RnaFhBf80ODIiLCWfxeZxIgvWNg0EgiIEOEz2ZNbNWJnfQAa2A0
	cxTPPyHJuIIvGHTqKTmLayXjdhJcNNW1D0fnfpSh7aId3mitajVIFqix1Ua8+YrknstjJJqnOZfCm
	H9miOZdABS6OwW5uJI9SQiEzEMRuF8yEcI996XKlp4gTyPcSAgp6o5pfy946MNlkBq4NF8T/OvmEv
	C9guVZb0JgflH+h5Cahg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRX7P-0067rw-D5; Wed, 31 Mar 2021 09:26:31 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRX7D-0067p3-5l
 for linux-riscv@lists.infradead.org; Wed, 31 Mar 2021 09:26:28 +0000
Received: by mail-pj1-x1031.google.com with SMTP id bt4so9179711pjb.5
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 02:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptAj4yv/V2YXF5TVjwqAvjZ15acpk75vmMod83zctB4=;
 b=HQlqMib2bg7AIt68guokCMcx0XMKUJiIOKWHOgQH8UJTwGJBDFDPpVMysvWj6AEMo2
 7jekLfcHYDhiOBDMvr2ZE6n0hFwDEM235djLQ3+DbxnW3shM8RAZ/9TbkKOe1AF62cAX
 Y4Mom0nLwfn1UCptK1wz1RDrTiw+WVnUZjTDYNA1uAXgE57jgvdoM2t0s/qxeCO1od1c
 ImeDG7ME+JGqw3sqAG8Fqe/WYsZxsIWTATya28k2x03YqXN4YZEy0La2NHLeUzenMx+8
 +GMLuZBh0MD+UzTllV4HlY890/ZUXG6XaWzcStTtwudtZSmciThjP7k5Kq1inYAtKuGn
 1stg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ptAj4yv/V2YXF5TVjwqAvjZ15acpk75vmMod83zctB4=;
 b=bBIGKzvb53m7gEjsz7kxVbGJPVBMS8GSsCdrbjnHumR4xzd51Pd6e+8JVferYIv4BN
 2CmmfkJY/5JtPqG8VHrmwpeCZuVgW3griBA8+FeuO75ez+RNojPmw0bdLYyjAyzsmrqS
 EYKw5HMPZnj5SofcmJh/kM1Csp1A+VAu6Ep3KYx5VGPzxx8orhxdl86fQ+5bOVmx2qHD
 uYBUaFrcy5CfXrvckaPfz3RQtxnOlDJdE1z81gefWIcjCI7F+8F7247vyPkVwGCPdkOl
 4lcwrYMtnr9FikFzYeGUYus6EoPHfjogUxadfCFlZ34UTnLkrsN0oEIh/bkyMvNiax4E
 sF+w==
X-Gm-Message-State: AOAM532Yz5e7Q1f6YoDQwtkSWdII4u2TA3H7B9cEVlGCrW+4XQM3cITk
 Ga0wq62qFJs246hVi0JaTAWEtA==
X-Google-Smtp-Source: ABdhPJyU6iv5HYECCCvfUvDFEX7gJ9XfaG9BZebwyBes+Az9+1iCyEo1gUauWR+aWZMul3kAfgkngg==
X-Received: by 2002:a17:90a:c249:: with SMTP id
 d9mr2655658pjx.104.1617182776459; 
 Wed, 31 Mar 2021 02:26:16 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id 143sm1726505pfx.144.2021.03.31.02.26.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 02:26:15 -0700 (PDT)
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
Subject: [PATCH v3 0/6] Add SiFive FU740 PCIe host controller driver support
Date: Wed, 31 Mar 2021 17:25:59 +0800
Message-Id: <20210331092605.105909-1-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210331_102619_534018_8783E4FF 
X-CRM114-Status: GOOD (  12.45  )
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

 .../bindings/pci/sifive,fu740-pcie.yaml       | 109 ++++++
 MAINTAINERS                                   |   8 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  33 ++
 drivers/clk/sifive/Kconfig                    |   2 +
 drivers/clk/sifive/fu740-prci.c               |  11 +
 drivers/clk/sifive/fu740-prci.h               |   2 +-
 drivers/clk/sifive/sifive-prci.c              |  54 +++
 drivers/clk/sifive/sifive-prci.h              |  13 +
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 324 ++++++++++++++++++
 drivers/reset/Kconfig                         |   1 +
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 567 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
