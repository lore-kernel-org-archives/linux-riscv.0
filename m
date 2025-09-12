Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3685CAC58E
	for <linux-riscv@archiver.kernel.org>; Fri, 12 Sep 2025 02:35:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=cyhrYaxUhOJblX9dVRD/WLb/qeJQSs8ZXacUsbCCVZY=; b=oA3UYDamj9LLnu
	/8yiBEnROM0UYU7WBNc/MaXN9O4eUU0g1S7l5/XNaZiRavc9QjipUvrmMWgoAveZs+4EXA0Rre2Fu
	6tjmPF6QYyb/thvMOTHKj4XA9TT63RyMmgxo3iTJAnbbA5T5E192YyFM0cpeCfvRlZJEcA9BR6D0u
	j62bEFnHOgmtsyzKhdNotLUlwZ0QfZqjrNA3kEdWnAPyXkOp1S0BsQ5zF09ck5Po+dBnCxTXi5jj1
	XIrSRLMk5Fb2rzzBHiKO+MUe529oWofxNPCKZAoxy5VQ+PT0Dm0ClZlrrUeUHMGWjGWWYsEqgwMLg
	VmaAxoh4N5Hetg01rQSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtdF-00000006XFd-14Of;
	Fri, 12 Sep 2025 02:35:25 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwtdC-00000006XDb-17j3
	for linux-riscv@lists.infradead.org;
	Fri, 12 Sep 2025 02:35:23 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-439fa5a0672so61268b6e.0
        for <linux-riscv@lists.infradead.org>; Thu, 11 Sep 2025 19:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757644521; x=1758249321; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=adSqTL8NuaakTvHTADgBkkDWAaGQjbxG9j1BynMCSQU=;
        b=MzwapyrgqNWE4dNKiMsCfWMeY+cBrQhopLKh6Psk0rObjNoOhFQI0DG9ffCK2V0JPk
         BUEAs1hQ46IiR54C8Z/dv/gjVIkuMk3lN5suo0yvhJXI9Nr9opkl3cOvoxr3aAIFbAIs
         xNCxUH4DunhUakesRlUkSVBpdxt5yncP5hmxbm64MnoNTc1qJiW12D2gT9OChbDY73z8
         kdvhxiPO/BEDLptKcMZbzBX0VUvUQouqV1BhdI0TF12Sj2BK2F4omZEZDXbZtQDEDPsm
         SQd+j7NJNZ+QWaJ+Zto5Oy00uWq4mMawhV/sWzwTazVhPGmNOb5ao9xilmQEc3qvO2OK
         oZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757644521; x=1758249321;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=adSqTL8NuaakTvHTADgBkkDWAaGQjbxG9j1BynMCSQU=;
        b=NCXpcsaOQmv5cxI2mTC9yk4dx6vMZc2BoBK8ZMJnMm4xGCt3Rem4zZpBt53GjOcYiS
         SURK1MpoIlQnZS8ZqCrOEALucbZ7QyDRE+Okk5hqfLFwiQVG+R0tE7kgFGlxicwPiVzk
         na2CLoVMoDndGJ25Ah/FFmbbH+OFb1/ecpFDbs2sRFm8g59DEbxsCSYo8mRQn9GVGnQI
         P444WMLKsjlTiqv0QvDL1OEFXkJqg2OawB4XvrOKl5bdj1Mc2kiyX2cP9a5vk9CWsQrh
         zOXpQ7ROBxDJMk0E1pvjKUncoKIt0dzG3uT9JQ8LlXdklVN+boYKHZneZ1I/cWa7fiks
         n7Ww==
X-Forwarded-Encrypted: i=1; AJvYcCWkp9/gUgpSWdvKk1ZqAiDVKg6hoPtu1WC3g4YeLmAv2V1S1Z91cneSzNvb/jqePlUJV8HOyOTAZaepLA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyTiSUAZW1q0KCowMgDTS9nGuh8RxYBds7HIjoXQhS1xcN3MWpp
	S7+zCQS5/6nj+9ogVfiJcojv72NmGQj3svOrKJXiGeHwo0NNvug/qvse
X-Gm-Gg: ASbGncsjIWxoxaye8FSmvgBrYm4YuI9Y5CEvZUGs39P/V7mADJ2KBT3I89EAPvxlxSR
	Wswyl4FX7lLM3fU3VmZTEzclEZEOt+Eg2vGJrryx/0pJcGodo+as7vXbuyiw9wVgdIV111BHRHS
	XDQ1wmhhgjPPm8ppUoFNg+vMBNOnIKGOZRa9QTkwzh5WLZdVWuNkqnv1qSeA8qnChSxvJg9F/9l
	teH0zbbHr31zVR5NTh8XTgNyxElW4qBamlwI0SxyxkkCz2TT+VpuM3ZvHAAO90ea6cR/OggQwxq
	HwNqRfWFsQgUqoy8eCd5BNbG1p7IluBcA/HaV3hrm7CrPKUPbNKPIxqYWAhrPY6YFRI1Lr6X0zs
	7S2s1pk1dsJWuuj8BbAs69PQUcJOM8TeH
X-Google-Smtp-Source: AGHT+IGWQK39i39FWL4qHMCK2JcI2v7l2UTe5cu2Hfp1wmFQwUNAPDH21RFBHh1BoHV6V+GM7HwRsg==
X-Received: by 2002:a05:6808:1244:b0:437:eb1d:cdde with SMTP id 5614622812f47-43b8da33f47mr464232b6e.33.1757644520618;
        Thu, 11 Sep 2025 19:35:20 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-43b82aa7b97sm559913b6e.24.2025.09.11.19.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Sep 2025 19:35:19 -0700 (PDT)
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
	fengchun.li@sophgo.com,
	jeffbai@aosc.io
Subject: [PATCH v3 0/7] Add PCIe support to Sophgo SG2042 SoC
Date: Fri, 12 Sep 2025 10:35:10 +0800
Message-Id: <cover.1757643388.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_193522_320659_AB0C7430 
X-CRM114-Status: GOOD (  21.87  )
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

Changes in v3:

  This patchset is based on v6.17-rc1.

  Fixed following issues for driver code based on feedbacks from Bjorn Helgaas,
  Mingcong Bai, thanks.

  - Fixed the issue when building the driver as a module. Define own pm_ops
    inside driver, don't use the ops defined in other built-in drivers.
  - Improve .remove() function to properly disable the host.

Changes in v2:

  This patchset is based on v6.17-rc1. You can simply review or test the
  patches at the link [2].

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
Link: https://lore.kernel.org/linux-riscv/cover.1757467895.git.unicorn_wang@outlook.com/ [2]

---

Chen Wang (7):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: cadence: Check pcie-ops before using it
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  riscv: sophgo: dts: add PCIe controllers for SG2042
  riscv: sophgo: dts: enable PCIe for PioneerBox
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V1.X
  riscv: sophgo: dts: enable PCIe for SG2042_EVB_V2.0

 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  64 ++++++++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v1.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042-evb-v2.dts  |  12 ++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 ++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  88 +++++++++++
 drivers/pci/controller/cadence/Kconfig        |  10 ++
 drivers/pci/controller/cadence/Makefile       |   1 +
 .../controller/cadence/pcie-cadence-host.c    |   2 +-
 drivers/pci/controller/cadence/pcie-cadence.c |   4 +-
 drivers/pci/controller/cadence/pcie-cadence.h |   6 +-
 drivers/pci/controller/cadence/pcie-sg2042.c  | 138 ++++++++++++++++++
 11 files changed, 343 insertions(+), 6 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
