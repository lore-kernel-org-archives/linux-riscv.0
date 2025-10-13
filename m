Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BF4BCCD183
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Oct 2025 15:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=QY2FskvWcP37Vy4lA8ZSn5+MQqkIGa521x9gyyJsi6Y=; b=W1/1n7eEbd/XuM
	b4fvn0GQeq5a9skEWEF9ucCtOUezvOikREA74Joi5BS1EuvbX/1AaYzzIwAxH5XpH27YHRYuyr12/
	6OXZl/WCBOS53pE8V05oaizGKBTQxAFxC0Ks3whmCMvr8betuOGLiMu9tB6mo9frNCCDSfJnrzMuN
	ZPVgz8ImZlQ5YyqlboGI7e5q4dYX5cd6za4/6i9uPJp2WvXTVHC6koyJmyFeHozWJjQpp1Ms4daLC
	rPCm1d/OL4mz0AO+UMX69SOQ06o9SdQOM7Fkjx//J5oisjTZV1EPp6urvezGyKLedCZbh0p6HTvjQ
	q0NAjAYOC0ghrKLFA8DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaE-0000000Di2T-0l75;
	Mon, 13 Oct 2025 15:35:34 +0000
Received: from mail-il1-x144.google.com ([2607:f8b0:4864:20::144])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8KaB-0000000DhzJ-2uKd
	for linux-riscv@lists.infradead.org;
	Mon, 13 Oct 2025 15:35:33 +0000
Received: by mail-il1-x144.google.com with SMTP id e9e14a558f8ab-4242bb22132so43658045ab.3
        for <linux-riscv@lists.infradead.org>; Mon, 13 Oct 2025 08:35:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1760369731; x=1760974531; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nbeq8htIVJsgPcvnZy6FQgEdm/DTZPuXtXg2N0Ndwqo=;
        b=1rw/BDVb1dSzyg03tqzARqKwDwIMXElDvsL0JVZffH9R4RlruKWQvgEAvTbGLFbZcK
         XWrfxqng7rpA/NB0UXeQLUbO2WXmBn+1mBPlwUicE/o7KycPfy+HDXEfkVUtJ+Dsvzww
         J9Fks8kkvGThSJF9aL/VUKxAUuKfrrGX4DV9SbSE3a7F/PzvNVvy1mzZNCLYMC6iRBG6
         PICTd+40sf00xUisGWGA4PeGe20OdPhbYetIO39dGQ+itDfA6nYZTTuvU7eC7K2mY42y
         uQTAHhxk5GiJppDQdi2umUiHFGaW4BB3Kv8mTtpqtcMT+tVleF2o2/79eC2S3Pv4UyAc
         k/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760369731; x=1760974531;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nbeq8htIVJsgPcvnZy6FQgEdm/DTZPuXtXg2N0Ndwqo=;
        b=CxE+xXnrmQfoh7AQEXD/IIh2D9K+Z4luzgtJV/4eZncPnXTaxoi5LeFvqowTOUIN+4
         6RYViC+05K9Ix896O7jo8tk/UkRewQy+DtLtZkB6QtyI1kbDiS9oxFNrV6lQSXjpEF6M
         Xc1eVl3qFu3PrYLbZt5Sudz7KJO3W6gsyQ9ev6tbdkMbRq3jTYQETiysc9S+zfK8DuPX
         PixkfdHtHv7WuS6R2s89MtIVti135JtSawnoqcO7LMOy+lwyr+32aCVGH7fyFNrVWjTB
         jjEqPMTfGDGOOQhL3z2rEook40QWNslonmXZicB2B6Ec75S3RatDmr5NJ/urUY5zI6+R
         buJQ==
X-Forwarded-Encrypted: i=1; AJvYcCUY2vsgpkHmD8PrjPrOO6uhLEk2KJPDQr2b/pXom5uxLvLh6YYKpHyY2BkQzkgWXMuptAtVPMC5xFZkLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaNKSWC1DczKwISY5YhYqVex/8S62FaROWpcm1rPjZVput3jcw
	hji0zfpKpR9/XTSnsCQ9t8FIn6TTcZIG7bEwQ52np4tWK3LxtMjLY3CdHxAR1Zhqsko=
X-Gm-Gg: ASbGncsnUaX6gJUlEhwlxazhfe9l1oPsWQCAIQ3q8pUmupx7HXMa0zl8gyDz4aXzuqk
	Q4ZiG52cr7n1Htx0yxExe75AIAaGJhKVFLm/kWwlDDgiti0ojmeworkFCus3CtTLMpO0IeC4mda
	9FeksA/UupSse/qpr17eDdLa5R72EcBi8Kzdb31DP6V9QepWSQ1yt7aabgdTw3B7TUmqHEPlgtf
	PV1o4vUIsH7k7CJTY/5xnNt5KalsFqMtw+HN6jcpnlQNhXQ9CmZtvEkm1kxpm4OW9YCAKVNtmc3
	+eTXfxRsxUqVg1Aqzd8smxIj9Y+VVZLVIrPVQ1nnZ6j/S7bpqeveKD6jn9foSqrd1z38St53j/L
	M1fYsocY3n3h1FsrOaKDN7fI3z0eCHvNPKDCSaAwIVG7OzRMKi8hW3kz99wN6+ctJnVrBd1Il/j
	s6VZkMKpLq
X-Google-Smtp-Source: AGHT+IGwhDgY1adEE+rYfro+kFlaDS5/FvDMA4RAEoQjxWvr5pWNWNsa0mX7bl3S4p/in4/RNtqUig==
X-Received: by 2002:a05:6e02:1608:b0:42e:7a5d:d7d6 with SMTP id e9e14a558f8ab-42f87346ffcmr235225235ab.2.1760369730674;
        Mon, 13 Oct 2025 08:35:30 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-58f6c49b522sm3910266173.1.2025.10.13.08.35.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 08:35:30 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org
Cc: dlan@gentoo.org,
	guodong@riscstar.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	shradha.t@samsung.com,
	krishna.chundru@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	namcao@linutronix.de,
	thippeswamy.havalige@amd.com,
	inochiama@gmail.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Mon, 13 Oct 2025 10:35:17 -0500
Message-ID: <20251013153526.2276556-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251013_083531_843911_82ED9DD8 
X-CRM114-Status: GOOD (  20.55  )
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

This series introduces a PHY driver and a PCIe driver to support PCIe
on the SpacemiT K1 SoC.  The PCIe implementation is derived from a
Synopsys DesignWare PCIe IP.  The PHY driver supports one combination
PCIe/USB PHY as well as two PCIe-only PHYs.  The combo PHY port uses
one PCIe lane, and the other two ports each have two lanes.  All PCIe
ports operate at 5 GT/second.

The PCIe PHYs must be configured using a value that can only be
determined using the combo PHY, operating in PCIe mode.  To allow
that PHY to be used for USB, the calibration step is performed by
the PHY driver automatically at probe time.  Once this step is done,
the PHY can be used for either PCIe or USB.

Version 2 of this series incorporates suggestions made during the
review of version 1.  Specific highlights are detailed below.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v2

Between version 1 and version 2:
  - General
    - VENDOR ID 0x201f is now registered with PCI SIG: "SpacemiT
      (Hangzhou) Technology Co. Ltd"
        https://pcisig.com/membership/member-companies?combine=201f
    - The PCIe host compatible string is now "spacemit,k1-pcie"
    - Reimplemented the PHY PLL as a clock registered with the
      common clock framework, driven by an external oscillator
    - Added the external oscillator clock to the PHY binding
    - Renamed the PCIe driver source file "pcie-spacemit-k1.c"
  - Kconfig
    - Renamed the PCIe driver Kconfig option PCIE_SPACEMIT_K1
    - The PCIe driver is now defined as tristate, not Boolean
    - Updated the PCIe host Kconfig based on Bjorn H's feedback
  - DT Bindings
    - Corrected PCIe node ranges properties
    - Replaced "interrupts-extended" property with just "interrupts"
      in the PCIe host binding
    - Named the single PCIe interrupt "msi" to clarify its purpose
    - Added a new vpcie3v3-supply property for PCIe ports
    - Renamed a syscon property to align with other SpacemiT bindings
    - Removed labels and status properties in DT binding examples
    - Added a '>' to DT binding descriptions to preserve formatting
    - Consistently ended DT binding descriptions with no period
    - Dropped ".yaml" from the PCIe host compatible string
    - Dropped unneeded max-link-speed property from PCIe binding,
      relying on the hardware default value instead
    - No longer require the bus-ranges PCIe property; if not
      provided, the default value used is exactly what's desired
  - Code
    - Renamed the symbols representing the PCI vendor and device IDs
      to align with <linux/pci_ids.h>
    - Use PCIE_T_PVPERL_MS rather than 100 to represent a standard
      delay period.
    - Use platform (not dev) driver-data access functions; assignment
      is done only after the private structure is initialized
    - Deleted some unneeded includes in the PCIe driver.
    - Dropped error checking when operating on MMIO-backed regmaps
    - Added a regmap_read() call in two places, to ensure a specified
      delay occurs *after* the a MMIO write has reached its target.
    - Used ARRAY_SIZE() (not a local variable value) in a few spots
    - Now use readl_relaxed()/writel_relaxed() when operating on
      the "link" I/O memory space in the PCIe driver
    - Updated a few error messages for consistency
    - No longer specify suppress_bind_attrs in the PCIe driver
    - Now specify PCIe driver probe type as PROBE_PREFER_ASYNCHRONOUS
  - Miscellany
    - Subject on the PCIe host binding includes "pci", not "phy"
    - Clarified that the DesignWare built-in MSI controller is used
    - Use "PCIe gen2" terminology (rather than "PCIe v2")
    - No longer use (void) cast to indicate ignored return values

Here is version 1 of this series:
  https://lore.kernel.org/lkml/20250813184701.2444372-1-elder@riscstar.com/


Alex Elder (7):
  dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: introduce PCIe PHY
  dt-bindings: pci: spacemit: introduce PCIe host controller
  phy: spacemit: introduce PCIe/combo PHY
  PCI: spacemit: introduce SpacemiT PCIe host driver
  riscv: dts: spacemit: add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 156 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  59 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  38 +
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 151 ++++
 drivers/pci/controller/dwc/Kconfig            |  10 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 319 +++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 672 ++++++++++++++++++
 12 files changed, 1565 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 3a8660878839faadb4f1a6dd72c3179c1df56787
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
