Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607BCCCFA03
	for <linux-riscv@archiver.kernel.org>; Thu, 30 Oct 2025 22:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IFJt1n6TAqnLSy1uJgFOaClGN6waGHl5AYGFK5l3U/Y=; b=j7XZwByn2Z+BKX
	zf/VP5Egd9S+dPYZ7DHGvZgwZgJUu2W0nZfeeYm+TXsghY1xU4wOkRBA7FNGFGl5ZMIEk29pal77E
	XsCn6r4sx+c/KUFQ1D1Q6SxzYsjdUZiTNn230QfEUZLv3TcF5Ealu75bbR4+oGo0XR10miTi1Brk6
	YeP1MCtNJ214xb0lK7I4u+cKfVAUDvFRRMCbKMUV89vgISbZJfpNPZ6R7ow03Z/cjF5CkhqztQJmv
	bdQSN/iIbnygW8uL6evU7POS+Ma5/J9dVcHol+OEQu/hMOCzbxFG9xeCl+C0VPVNwaF0rTGMpYf9F
	OFOaEh7bk5sx4GuByKBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajw-000000051JW-3deA;
	Thu, 30 Oct 2025 22:03:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEajj-000000051F5-41by
	for linux-riscv@bombadil.infradead.org;
	Thu, 30 Oct 2025 22:03:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=Phq3DSvAibN+39Xx+hszp3gQ0pcRpusIMooyNw/JXGg=; b=C1HypaQI51d7hf9Dh/M8Gl7i50
	XtuUlufH/14wmcAG6VhcDAk8cMIFzIdVY1pZEv7Mzb3uaYlmR7EibAoVsNk1ml8amWJb935TQuIO0
	z7+JD3limXdtDaCd6tu1x5GGbO5UbTb6g/kCpLXCCQz9+J7KIsOW9b1cHp+2rBz5e0dtNQ3+5xLjz
	CRd2iTdmrTFN20HeVobyUgRhd2UKi7oOpZnzgSolQpABun4LYHKcbijoZwKl5ei93VNneFI7NlCC2
	KrxTKzlyGLfPg7yELVgjBYF1oDUjGgoPT9CHbhLXXQkn9tf17MkAAx4HVxyBCGD5s80Jn7P5vT4aa
	MPcn5vJA==;
Received: from mail-io1-xd41.google.com ([2607:f8b0:4864:20::d41])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEZru-0000000A5fT-26O5
	for linux-riscv@lists.infradead.org;
	Thu, 30 Oct 2025 21:07:42 +0000
Received: by mail-io1-xd41.google.com with SMTP id ca18e2360f4ac-93e2d42d9b4so70027739f.2
        for <linux-riscv@lists.infradead.org>; Thu, 30 Oct 2025 15:03:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1761861785; x=1762466585; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Phq3DSvAibN+39Xx+hszp3gQ0pcRpusIMooyNw/JXGg=;
        b=UssoPW73+SSl3fGPG6toRArNF0htEQXEpX4QGTXr3hIciXOnTf2OeRGfmwH7aFgs1v
         Nhqk9RnsvTqdl9YvGG1PVCF+Pk9m4pQ2TwZaXmKqJX50OTeNR1XsxFwVB3kR84pJWT9F
         d8q5QFnfMu2/hY7ufMGsYjn2FFE37YK0Bl9GYXhA89JHvLlk32xEetSMrmXyAyEO6Jba
         yZvibCUgvDNbp80Pqdq6gK9Q2WJH7JKDW8scTuZ1MPUnE1AeMIKtClavGq/bGoDPt/OB
         We+dzZyhI2vEJonJ9FGVbxBV2t3s89Od6soaegtG8fSPEPgFqqIFmo+i109XVUUE7iNF
         TuUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761861785; x=1762466585;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Phq3DSvAibN+39Xx+hszp3gQ0pcRpusIMooyNw/JXGg=;
        b=bm6X08bk0ezO4jrZUNV4n/hX3Hwuq/7Ge3gKpSwfHOq28BMq+rrdgGQCuYcLtY7Oa6
         VzNqZrMsR3NyUXfCGODip1lI33uVP4gFjitZ/cRHSxgRHyiN5qMfSpqlAv80liPnt3Jy
         IsHfBrcZGYNblygBkOa/U0lyBsSZKh1mhv+LAFJ/G5IgzjfG6rcx1AC1YaZGt7bwKKOw
         yIJM/lQ36ul+y+D5ZCWGCcm1+Y1Fk2Do2rb4p8dppgy+VshcyexcLXUZEvQfeZJc5fAu
         pbL6vo6hbpkuNwsg+gcisnaSj7nDszpNrcmAQjKVjg6wmf9fPy972Q8RBM6BHGJzzE9c
         xQEg==
X-Forwarded-Encrypted: i=1; AJvYcCV7TaOFWb8HmW5X8o9hemWGEZYdP+3SeacUbfVcy012nqFcAU4p19W9LHw7dd7A1GGoJw+TlVgTZncEYg==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywjt0pu4f1qjVGjUVioID47OKCftDophukhPqGGEbPKEfFyVE2s
	SEpQDH5LGsQu4sBcFR0n462lNydJdonXn84vSJcZ9JPZq3FOlyL6Ja6DnhReMQqtUHM=
X-Gm-Gg: ASbGnct+mztrZwPhDVTp8eahsnFm1CatuLPFYPzfTtyC27McMxMWbNxLjT8PPLeuxrT
	QMeUXwxMak9apC42WQ+QLwKsqqIZymCm23DzqgWbQVuuGHDVWjWmmEcWkx1yiJ6UmORN16alKfm
	XU+rptoOU/kfDoWLqwwNnEwWL3U0np8gKinMLidx4VP09odyJNWLPUjChYjFLYX6/c3nbfEUGUz
	D8poxiFefq0wQ1/6fueliSTK1NMUAJ7MzdZAXXIpK9t6jLd4TBSAsnBHH71YjFpPkI3Tt9ckIE4
	5F06Y3wLX4GPaOW2T7zWDKh+gQJegxRK1HD/5Jy+kPamEKhYfsAhA96U0lNZlbjsZMCMkf5PJ4Q
	4H8J6vKYWl6XvqacQQ75Iv+DIPZg+bDIR/areTf5+yZ8X+yFahau2+2W+rTHIu4zv1h3tXw6Dy7
	OEv4SsR8KmfVMibdxzt0hyXCfxd8P0F2UCQXmEhdx1cf15gCup/xc1fw==
X-Google-Smtp-Source: AGHT+IHIfi5HvcZFQEMsBLWU40iLrdbD6dtXflle6FkJVnDeQEPilinICeuX7JKqnLgG58PEKCRkEQ==
X-Received: by 2002:a05:6602:1606:b0:944:f050:65d6 with SMTP id ca18e2360f4ac-948229ca479mr236508039f.10.1761861784511;
        Thu, 30 Oct 2025 15:03:04 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-94359efe149sm604118039f.13.2025.10.30.15.03.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Oct 2025 15:03:03 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: dlan@gentoo.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	vkoul@kernel.org,
	kishon@kernel.org,
	bhelgaas@google.com,
	lpieralisi@kernel.org,
	kwilczynski@kernel.org,
	mani@kernel.org
Cc: ziyao@disroot.org,
	aurelien@aurel32.net,
	johannes@erdfelt.com,
	mayank.rana@oss.qualcomm.com,
	qiang.yu@oss.qualcomm.com,
	shradha.t@samsung.com,
	inochiama@gmail.com,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	christian.bruel@foss.st.com,
	thippeswamy.havalige@amd.com,
	krishna.chundru@oss.qualcomm.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-phy@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/7] Introduce SpacemiT K1 PCIe phy and host controller
Date: Thu, 30 Oct 2025 17:02:51 -0500
Message-ID: <20251030220259.1063792-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_210739_114633_B3FEDB01 
X-CRM114-Status: GOOD (  20.31  )
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

Version 3 of this series incorporates suggestions made during the
review of version 2, and based on some error reports from Aurelien
Jarno and Johannes Erdfelt, disabled ASPM L1.  Specific highlights
are detailed below.

					-Alex

This series is available here:
  https://github.com/riscstar/linux/tree/outgoing/pcie-v4

Between version 3 and version 4:
  - In the DT binding for the PCIe host controlloller, add a new
    sub-node representing the root port
  - Move the phys and supply properties out of the PCIe host controller
    and into the root port node
  - Define the spacemit,apmu property later in the binding and DTS files
  - Define the device_type property first in the binding examples and
    DTS files
  - Add root port sub-nodes in the examples and the DTS files
  - Select the PCI_PWRCTRL_SLOT config option when PCIE_SPACEMIT_K1 is
    enabled
  - Parse the root port node in the driver, and get the PHY
  - Leverage the PCI pwrctrl slot driver to get and enable the regulator
  - Don't set num_vectors to 256; just use the default (32)
  - Cleaned up some comments, white space, and symbol names based on
    feedback from Mani
  - Add some runtime PM calls to ensure it works propertly
  - Add a new post_init callback, which disables ASPM L1 for the link

Here is version 3 of this series:
  https://lore.kernel.org/lkml/20251017190740.306780-1-elder@riscstar.com/

Between version 2 and version 3:
  - Reviewed-by from Rob added to the first two patches
  - The "num-viewport" property has been removed
  - The "phy" reset is listed first in the combo PHY binding
  - The PHY now requires a resets property to specify the "phy" reset
  - The PCIe driver no longer requires a "phy" reset
  - The PHY driver now gets and deasserts the reset for all PHYs
  - Error handling and "put" of clocks in the PHY driver has been
    corrected (for clk_bulk_get() rather than clk_bulk_get_all())

Here is version 2 of this series:
  https://lore.kernel.org/lkml/20251013153526.2276556-1-elder@riscstar.com/

Full details of changes made for version 2 are available there.


Alex Elder (7):
  dt-bindings: phy: spacemit: add SpacemiT PCIe/combo PHY
  dt-bindings: phy: spacemit: introduce PCIe PHY
  dt-bindings: pci: spacemit: introduce PCIe host controller
  phy: spacemit: introduce PCIe/combo PHY
  PCI: spacemit: introduce SpacemiT PCIe host driver
  riscv: dts: spacemit: add a PCIe regulator
  riscv: dts: spacemit: PCIe and PHY-related updates

 .../bindings/pci/spacemit,k1-pcie-host.yaml   | 157 ++++
 .../bindings/phy/spacemit,k1-combo-phy.yaml   | 114 +++
 .../bindings/phy/spacemit,k1-pcie-phy.yaml    |  71 ++
 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  44 ++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  |  33 +
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 176 +++++
 drivers/pci/controller/dwc/Kconfig            |  11 +
 drivers/pci/controller/dwc/Makefile           |   1 +
 drivers/pci/controller/dwc/pcie-spacemit-k1.c | 349 +++++++++
 drivers/phy/Kconfig                           |  11 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/phy-spacemit-k1-pcie.c            | 670 ++++++++++++++++++
 12 files changed, 1638 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/spacemit,k1-pcie-host.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-combo-phy.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/spacemit,k1-pcie-phy.yaml
 create mode 100644 drivers/pci/controller/dwc/pcie-spacemit-k1.c
 create mode 100644 drivers/phy/phy-spacemit-k1-pcie.c


base-commit: 131f3d9446a6075192cdd91f197989d98302faa6
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
