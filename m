Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37809C433DB
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 15:07:16 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6FB6360240
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 15:07:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6FB6360240
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=rsZzE+CzUCi7/xjTAh/NffkS4h1avQbUuIZdfGYUMxg=; b=L8okpQ+YHmR6qf
	SkSX4nQW/NSvJAaQ6Dq6UXwl9ZUecP323518pxfAtrSItW0rXeleE+ZGJnpjStm+Dd+MRZj1jE7em
	T1mPS/4TNWJkcK8avmWtHaqk/6QOwBEadJN7G9bj1vlvbkeUIZPwarFKEFgVKrBe/8MoY0i2g0aDB
	zP0FjKGZ7K4+PXlLrZsVveS+JJMPSyVkamalOtBrvKBF8/JjZaCPW6m2OI3f/rPws94P455UXoGsn
	OHDhu3Fk2MOuME9+rxjB7n/rpZEJT6JvVFKah7UhOiGTABCZBR2nKF1iP8TdFAY6Ndo9jMhynoXTz
	sfN/RE3CVt6/pf5L/Zbw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHT5Y-005Ilq-37; Wed, 03 Mar 2021 15:07:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHSBu-0054ZC-PN
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 14:09:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Type:Content-ID:
 Content-Description:In-Reply-To:References;
 bh=bxei/8aDMCYKqmTkktTk9ZHLkhHxr5aG3PN4M0TW8C4=; b=hUMstgn6WpcUwZ2QRDjBAhv9BH
 YwyZeCq92PWviTKC3s0QTVMz5fNhupGp/tndFSK8VW0rVouoMHDg8lTb4wKrKTKI4ZEq3SeuHrGvr
 jfdko5NQuVVCmVOwBQwTirOVaGaJmmaLOWvFBRYnNuu/0uwf6SPIv165wCNuFo0le3/teq3eWWgxI
 6w17lcN8i3weCShzTGaa8fA9wZ1qJZP95UKtOjkKUh10IzSy3j+SLSnh7LSh88hRG/Ow5f7Ymq77G
 XLaXXN1FwkXK0SqAdj3sJP+ugWe4poFuXUg3OdH5ozmy264c8nssCiGMTJL9r1gwIerOF445Rgdni
 CMe7ADnA==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lV-00GygJ-Pn
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:34 +0000
Received: by mail-pj1-x102c.google.com with SMTP id c19so1690408pjq.3
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bxei/8aDMCYKqmTkktTk9ZHLkhHxr5aG3PN4M0TW8C4=;
 b=O5WIbc61G3ZDHjgS4F7URCW/4/U7Isq2Mu3Wvdscu+y5vjL7ou79cWwbkvEnMvSgxq
 1hzCTP07F89/w9x4GCJYWoM72kALz0iJfAWEJmmpHI0lFed1eRkp2DDe9YzHvtaTIZOl
 vOuYG5dMQg0TLfE7crXbgi98xIBLaAl2GJmy+UMx5vYLZ4Yz4T1h7SzQoa+RNw3iqJ1U
 ssCHXncGsytBp7FBr2Py8/qa53OWNBYf5gFCJ1LdXz6IkNZBloB4hKeCMspdquSxmZxc
 0Zp6zzcH9fJwVtBv1DoVoVh6h+AmcHOMV/EoCxHt4CgJuGoF+r2+VN0EhKGaRyOBJSu9
 yyDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=bxei/8aDMCYKqmTkktTk9ZHLkhHxr5aG3PN4M0TW8C4=;
 b=MFKEfgvvsynCu8KgTxwbnCDu0v6DGECvA38oVVZfPVuJoF0eloKjGpz679QKk9EFj7
 5OUcpv/s1IKIh8LgDAxqA0/Lgcysy2kj+VpTq8/qsMGw6H4lVxxe7xJd96QZcJbF/5Bs
 4JPdJPa8VUYk6RuZ2Lu7fDf1TtxcnJKtrERzTaGvaJdair1IJxjUcw7EhodxILwu1fEE
 TZVz1B1X4Y3GcXEyLG2Vx9iLu9pAy4yiSlczRfzZdArRok/iFR2lFzCkegZgpdo8vNBX
 WsHw5tLOwhAD6PMhdcwgPneEVSavQ8QGmTvRAkHbOgAlK0gnS2K5QjRvOiZROioWH1mv
 3DCQ==
X-Gm-Message-State: AOAM533VKaMaW9gQguiHCyp5Z2KzqyM5ihFWqVu4RjD/oqxx9XtevZ9b
 PZhxWeqyRcltLmb/U37d389qBA==
X-Google-Smtp-Source: ABdhPJwIhIDCZFAmjDINOMpTIcq157qIxL63LYhmKeq117MzPFuyqWv2PhA0oDZBd4g793JCy1+/lQ==
X-Received: by 2002:a17:90a:5d09:: with SMTP id
 s9mr3715808pji.172.1614682767885; 
 Tue, 02 Mar 2021 02:59:27 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:27 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 0/6] Add SiFive FU740 PCIe host controller driver support
Date: Tue,  2 Mar 2021 18:59:11 +0800
Message-Id: <cover.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110034_424157_54C8B57D 
X-CRM114-Status: GOOD (  10.45  )
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

This is tested with e1000e: Intel(R) PRO/1000 Network Card and SP M.2 PCIe
Gen 3 SSD in SiFive Unmatched.

Greentime Hu (5):
  clk: sifive: Add pcie_aux clock in prci driver for PCIe driver
  clk: sifive: Use reset-simple in prci driver for PCIe driver
  MAINTAINERS: Add maintainers for SiFive FU740 PCIe driver
  dt-bindings: PCI: Add SiFive FU740 PCIe host controller
  riscv: dts: Add PCIe support for the SiFive FU740-C000 SoC

Paul Walmsley (1):
  PCI: designware: Add SiFive FU740 PCIe host controller driver

 .../bindings/pci/sifive,fu740-pcie.yaml       | 119 +++++
 MAINTAINERS                                   |   8 +
 arch/riscv/boot/dts/sifive/fu740-c000.dtsi    |  34 ++
 drivers/clk/sifive/Kconfig                    |   2 +
 drivers/clk/sifive/fu740-prci.c               |  11 +
 drivers/clk/sifive/fu740-prci.h               |   2 +-
 drivers/clk/sifive/sifive-prci.c              |  55 +++
 drivers/clk/sifive/sifive-prci.h              |  13 +
 drivers/pci/controller/dwc/Kconfig            |   9 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-fu740.c       | 455 ++++++++++++++++++
 drivers/reset/Kconfig                         |   3 +-
 include/dt-bindings/clock/sifive-fu740-prci.h |   1 +
 13 files changed, 711 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sifive,fu740-pcie.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-fu740.c

-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
