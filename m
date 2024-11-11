Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD93ED12D71
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Nov 2024 05:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/NCEh/dqoBtR9WzWt7hjq5FTJk/iE0RiUmWN2wNkEnA=; b=07G6YtnrJhWeUd
	5tD77PabS+g72kN5r0P6SA0AzYKQZPlfIZzXnPzO/BjZI4BR8dAOUFNNbDiKVXAR6nm0SGYHsNfVy
	P5zCuPlqC28X9PtUGMdFD3MmP4TuhesEzNEtmSb9Dd/u6A3nqHnuOmz52fRsjGITq3UW5RrQ+EyPr
	FWNPe+P16qfYY3RjA+fD06dCSC+AX0xMkgVyv0PxzDv4IqKILCp4kx+38mT9qiBGDF2LN6nykrXVQ
	767HRTjBbtOgvtDhI0fNeUOWC+j6/vxf85IfX1NTN/bhnMxaHSQ/bK+ZB6RbUEvZhjuAk6RtIspCp
	XB0nKNI9kCmiI++1zMlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tANSV-0000000GQrj-1dgg;
	Mon, 11 Nov 2024 05:59:31 +0000
Received: from mail-ot1-x330.google.com ([2607:f8b0:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tANSS-0000000GQrJ-3kR1
	for linux-riscv@lists.infradead.org;
	Mon, 11 Nov 2024 05:59:30 +0000
Received: by mail-ot1-x330.google.com with SMTP id 46e09a7af769-71811707775so2232865a34.3
        for <linux-riscv@lists.infradead.org>; Sun, 10 Nov 2024 21:59:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1731304768; x=1731909568; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hSEc6Dywfy2yzj6E+ULeDFzZ//XDuzEbifzyz4badc4=;
        b=J5qApBBP2Fai47OeQMZCnJ5CpWIUwJU6nyhQrZznnvoKLFnCYpKlcySdc1dgUST1GS
         WoWeTEiNuKILG0YqEnCz9UeMo3pHZ2wv/ZI2hw3kCdqVkKrK1sn0llr8qgJzyAZ8ayRt
         mKeoH1KDHkTBUJM2YxXy+Lnm0GYw7aPh+m6krx9lY5WLSTLVWzN9aCbj10ADvQiEe0oT
         CCn3za2/2jBcH/2CTpzGFcEaNVlT4RzjFYruqq44UR07UVPzZw/eHDH5OMQXdTEjksqc
         td6l4R+e2BdtEprfLclsfVZlnSykpiFBw9gjU1nWnL0m0kyluEQ9jbnhjwmnI7bRlNfN
         PfjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731304768; x=1731909568;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hSEc6Dywfy2yzj6E+ULeDFzZ//XDuzEbifzyz4badc4=;
        b=G0QK3BN7uz+UrzKPAIBN17sVscKKEczzn1d1RIT4L4Hs0Qr2zFo2B72rPQfutwdC5x
         yaQ6jyKH73vO4j+Ngf9kjxnK9TD7+7cyvw7Jq1EJt3PtGRix45QOGvu8dbdpAVNpOa7Q
         81Es/m+qVqcV/d5nhMNJ+vVUOpI1HynAzNLICB4e/paRxEBlYMZc4vzdbwWDeJdxCM7y
         r58SeNItenP8B5oRe6Y5uZiPfKoLMXq49k6gpkFt5G2BbQHQdfkxk05bmIJaPt6lB7Px
         2NA65crICIJBoRfXXHW/RC455B3lu5sEvmCBpCVa8BevnLO/LeTzXECcLn2lXRRiR8Gc
         Ci1w==
X-Forwarded-Encrypted: i=1; AJvYcCWYywzcPj1pEoGc1fyJo4ABTjT+r3N4rlPrnkJZpFbz4nCwEFctF5jr9reWMCgU0xgVCMoR1tGrcqdThg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxNsVwkuqtYbM3Az04ROoJvGxUSQJIo0OoTm3IG30h7qLMxMe9C
	uNRfvc9EmUKxlHHTquLUqxZBTu/dd0VGrmyYPIgozvwUZlE4CUqQ
X-Google-Smtp-Source: AGHT+IF4wa34kPK0D2j4YiwZgM0PWB0bX/gx1QEPBQEvPCwAAOOwKKwE2xLSY6u7rz/iBj7/3S5myQ==
X-Received: by 2002:a05:6830:6c10:b0:710:f3cb:5b9d with SMTP id 46e09a7af769-71a1c298638mr9014021a34.24.1731304767775;
        Sun, 10 Nov 2024 21:59:27 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71a107ebea1sm2125534a34.14.2024.11.10.21.59.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 10 Nov 2024 21:59:26 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: kw@linux.com,
	u.kleine-koenig@baylibre.com,
	aou@eecs.berkeley.edu,
	arnd@arndb.de,
	bhelgaas@google.com,
	unicorn_wang@outlook.com,
	conor+dt@kernel.org,
	guoren@kernel.org,
	inochiama@outlook.com,
	krzk+dt@kernel.org,
	lee@kernel.org,
	lpieralisi@kernel.org,
	manivannan.sadhasivam@linaro.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	pbrobinson@gmail.com,
	robh@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	chao.wei@sophgo.com,
	xiaoguang.xing@sophgo.com,
	fengchun.li@sophgo.com
Subject: [PATCH 0/5] Add PCIe support to Sophgo SG2042 SoC
Date: Mon, 11 Nov 2024 13:59:17 +0800
Message-Id: <cover.1731303328.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_215928_960958_7F9B31C7 
X-CRM114-Status: GOOD (  11.83  )
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

SG2042 PCIe controller supports two ways to report MSI:

Method A, the PICe controller implements an MSI interrupt controller
inside, and connect to PLIC upward through one interrupt line. Provides
memory-mapped msi address, and by programming the upper 32 bits of the
address to zero, it can be compatible with old pcie devices that only
support 32-bit msi address.

Method B, the PICe controller connects to PLIC upward through an
independent MSI controller "sophgo,sg2042-msi" on the SOC. The MSI
controller provides multiple(up to 32) interrupt sources to PLIC.
Compared with the first method, the advantage is that the interrupt
source is expanded, but because for SG2042, the msi address provided
by the MSI controller is fixed and only supports 64-bit address(> 2^32),
it is not compatible with old pcie devices that only support 32-bit
msi address.

This patchset depends on another patchset for the SG2042 MSI controller[msi].
If you need to test the DTS part, you need to apply the corresponding
patchset.

Link: https://lore.kernel.org/linux-riscv/cover.1731296803.git.unicorn_wang@outlook.com/ [msi]

Thanks,
Chen

Chen Wang (5):
  dt-bindings: pci: Add Sophgo SG2042 PCIe host
  PCI: sg2042: Add Sophgo SG2042 PCIe driver
  dt-bindings: mfd: syscon: Add sg2042 pcie ctrl compatible
  riscv: sophgo: dts: add pcie controllers for SG2042
  riscv: sophgo: dts: enable pcie for PioneerBox

 .../devicetree/bindings/mfd/syscon.yaml       |   2 +
 .../bindings/pci/sophgo,sg2042-pcie-host.yaml |  88 +++
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  12 +
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        |  82 +++
 drivers/pci/controller/cadence/Kconfig        |  11 +
 drivers/pci/controller/cadence/Makefile       |   1 +
 drivers/pci/controller/cadence/pcie-sg2042.c  | 611 ++++++++++++++++++
 7 files changed, 807 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pci/sophgo,sg2042-pcie-host.yaml
 create mode 100644 drivers/pci/controller/cadence/pcie-sg2042.c


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
