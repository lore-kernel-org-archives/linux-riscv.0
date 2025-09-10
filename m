Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43D37CAC582
	for <linux-riscv@archiver.kernel.org>; Wed, 10 Sep 2025 02:07:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=OjdaAAjUJa4n3VelcJlYxwAToCx2cEbqxuZowU5/6c0=; b=STXpwoMI76qfyi
	4S4ZWdl9K4kV3/2bQbCc9MdWQ1sxlzpjcT8gN4xeypzBkbKpY5gnuEUgFDh0k9ITra2LXHb+LF3fm
	ts5tZ28EkEa9S0eUFwJK0qSrmRaUdx6/kNFc/akEinG4FpUfSosFTKMYl0GdpmnyP/d17xMre3rqc
	tTaObV8W0wtzmIGQa9+87mV7qHl20gJ90HwFP1RVN/IWdqvrJOPBbi725hUEaYZ6tp6xv2HlYUdMd
	pQGiXX+SP0CK4KO+htSxB7wjdqpdxqgEYN4e8ew84ZsKB3jlCTC5vXc6jiEwY+87eqrMahJeSQFsm
	3qf6oCXH6Y0FKEyjTKEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAF6-0000000Basz-0kvh;
	Wed, 10 Sep 2025 02:07:28 +0000
Received: from mail-qt1-x831.google.com ([2607:f8b0:4864:20::831])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwAF4-0000000Baru-0jAp
	for linux-riscv@lists.infradead.org;
	Wed, 10 Sep 2025 02:07:27 +0000
Received: by mail-qt1-x831.google.com with SMTP id d75a77b69052e-4b61161c30fso17970611cf.3
        for <linux-riscv@lists.infradead.org>; Tue, 09 Sep 2025 19:07:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757470044; x=1758074844; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=JupvMSKgb1rw1zIHQW+fGueHkoJ8uYm/8I5zPauDxTU=;
        b=YZ8oeHzNKpuTkRB6DrAZvKyj6cnnaXV/wzY0zibcIk7jr2I5Pr/wKfOJdEve0oaips
         f7OSkVHkjQur0MlacVD/ixgBhZPIpdO0Rrekr8I8QkdVWIdSxAddSNuduEv+r08ravvr
         PCXXzAVYIQ7TmQ+YuG0G2EDsL8YRYB3d/NHE4RFIlLoM7C+HtPQ13JFoUgHRqzg1HcLA
         2GaKU21Dqhzu0XDkWdRy35wx2p8lZHJutVZCKpHkhDgB6Hk10IvcebGXI5h5c2WryUik
         fDMtSB4BaNmtpsJeFoesPnMkVj6GNLJdq3jpPLzM9x97B+NmfmtoH69l39iCFYw5HUpo
         mdkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757470044; x=1758074844;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JupvMSKgb1rw1zIHQW+fGueHkoJ8uYm/8I5zPauDxTU=;
        b=cgAxYbGgMKY/TjliigqnZhtmSLuOXO7c7IUiGbOshoeWeOAfg81sWwoCf2VDeMC0oF
         8GuHJ+tKoUfW9Fj+JD6v+ww7dAobNrZ224It3uWVEAZLY1DamPYJBjBrgW8Oppfw6iLo
         fCm7O80CP6gT1hiJhLgMHG0d4FiaRQM2rJDJlu8kqMIl6zG08xvCWss/lx3fiRP1DzyD
         BrAUJEt88qeeiDXD91yeAezpWpw4b+NBctoLyzhw2OGduSFQljUnFKEkXmXRJdnbCVcX
         GwizafsapLhmIQqwDmuib+12XEqzQFbnhu7ra8O+51qB7FKk0Nxl5Uz/1TWkKl78tQx1
         z01g==
X-Forwarded-Encrypted: i=1; AJvYcCXN2Ciyk0cxK5P+E8UyHPQtJ50xymp8SGEE+SWXRHWHL+Yl37bKnKCalmR01mBYWVggk09NfAARLP/TvA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw7CUTjiaEJeNv+HwVe1jSt9CyAgjLhk0XR9hVXEzd0dpQQwlzg
	Gg9BI24/Ct5hK65vT4sOoq6fxsISdnVn/nbDamuoZraHVYnBuB9MPxK3
X-Gm-Gg: ASbGnctEplYdMMp0nEsReCb6IDYhhL1cfJpdL73LEU8M/N/H+8w5KbPGcFQkqOm2f7w
	rzQmjromYe8wgmC7+nMIRk3liOkBpbaz4pa9EfimcVjBe3GRvzoJtXF1Tj+fuPCrIWXARU4rFvD
	QNGwXM2HZJaRFL180/iKg6/MNJluTKEzIiHYOwYZl1UluHLLdMQg166Wmdw75Iqn6a4AEUjsHLJ
	Y8HqSPmTymK1hojCCs6rzANEKS8TLC8UaEVJvtx8xQfBrDTJjhG11IVhL6PweWMnmyiAKZ5KbLP
	26irexNOJwlhuyoY/lHJQYUFf5wTSGkkqDvS2OA8Bf/XinnTdCc3wV3hmWBD9+bl/S+i9EIcDfF
	7+2+2jYMB6UogJlZxVMH7vXOkPy/kfJRR
X-Google-Smtp-Source: AGHT+IEjRNv9cyUm69QgMJCJnQnyhEp01tNG6SttjuPNziAGSPXCkaLL31LMoOKqtBh6Pvi3fZ7WJQ==
X-Received: by 2002:ac8:578d:0:b0:4b0:80c7:ba32 with SMTP id d75a77b69052e-4b5f843c29amr155667861cf.38.1757470044192;
        Tue, 09 Sep 2025 19:07:24 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b5ec7d5d1sm212773085a.48.2025.09.09.19.07.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Sep 2025 19:07:23 -0700 (PDT)
From: Chen Wang <unicornxw@gmail.com>
To: kwilczynski@kernel.org,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	arnd@arndb.de,
	bwawrzyn@cisco.com,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	18255117159@163.com,
	inochiama@gmail.com,
	kishon@kernel.org,
	krzk+dt@kernel.org,
	lpieralisi@kernel.org,
	mani@kernel.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	robh@kernel.org,
	s-vadapalli@ti.com,
	tglx@linutronix.de,
	thomas.richard@bootlin.com,
	sycamoremoon376@gmail.com,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	rabenda.cn@gmail.com,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH v2 0/7] Add PCIe support to Sophgo SG2042 SoC
Date: Wed, 10 Sep 2025 10:07:11 +0800
Message-Id: <cover.1757467895.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_190726_230835_542F574F 
X-CRM114-Status: GOOD (  20.26  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Sophgo's SG2042 SoC uses Cadence PCIe core to implement RC mode.

This is a completely rewritten PCIe driver for SG2042. It inherits
some previously submitted patch codes (not merged into the upstream
mainline), but the biggest difference is that the support for
compatibility with old 32-bit PCIe devices has been removed in this
new version. This is because after discussing with community users,
we felt that there was not much demand for support for old devices,
so we made a new design based on the simplified design and practical
needs. If someone really needs to play with old devices, we can provide
them with some necessary hack patches in the downstream repository.

Since the new design is quite different from the old code, I will
release it as a new patch series. The old patch series can be found in
here [old-series].

Note, regarding [2/7] of this patchset, this fix is introduced because
the pcie->ops pointer is not filled in SG2042 PCIe driver. This is not
a must-have parameter, if we use it w/o checking will cause a null
pointer access error during runtime.

Link: https://lore.kernel.org/linux-riscv/cover.1736923025.git.unicorn_wang@outlook.com/ [old-series]

Thanks,
Chen

---

Changes in v2:

  This patchset is based on v6.17-rc1.

  Fixed following issues based on feedbacks from Rob Herring, Manivannan Sadhasivam,
  Bjorn Helgaas, ALOK TIWARI, thanks.

  - Driver binding:
    - Removed vendor-id/device-id from "required" property.
  - Improve drivers code:
    - Have separated pci_ops for the root bus and child buses.
    - Make the driver tristate and as a module.
    - Change the configuration name from PCIE_SG2042 to PCIE_SG2042_HOST.
    - Removed "Fixes" tag from commit [2/7], since this is not for an existing bug fix.
    - Other code cleanups and optimizations
  - DT:
    - Add PCIe support for SG2042 EVB boards.    

Changes in v1:

  The patch series is based on v6.17-rc1. You can simply review or test the
  patches at the link [1].

Link: https://lore.kernel.org/linux-riscv/cover.1756344464.git.unicorn_wang@outlook.com/ [1]

---

Chen Wang (7):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Check pcie-ops before using it.
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  64 +++++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  |  12 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  88 +++++++++++++++
 drivers/pci/controller/cadence/Kconfig        |  10 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 104 ++++++++++++++++++
 11 files changed, 309 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
