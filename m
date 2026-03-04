Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5753EF8FE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Ae/y/rduw19NewpXv67OpPabLdCgNgiAzRc8idDCda8=; b=T1UUqDOWbJdSQ2
	oVx2zvEkea0ZK/srripKnAwBida81XmuX8pJxMBDGFSURPRsqfPpsKkr8LU3/JEiZMxp5oD0zpQdT
	435pgKiP1ShuMWBRhpPh+ctdxi0JDAm13kSywpYBIRu7R9cfJu1szWlIWYiVYHsbyZvIy48y93Hg8
	FkGiTBTcd3NDztnKjoDUgKLMN96N0k/sO0IbF9EdN0/tuDJ+nURv0fKyE3N/5AvIq8J1fZDHbtwwO
	m7erNfiA0QjEw3APwqk7EBCwCuOrJDZTw87Qc3BlOxonoUxng7JBuxqra9vT2q+yjWW6PZ5XjbTuN
	bDBuCQjsdAWCpbQGMIYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmpL-0000000HIOE-3QfK;
	Wed, 04 Mar 2026 14:03:51 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmpH-0000000HIN3-3f79
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:03:49 +0000
Received: by mail-pj1-x1032.google.com with SMTP id 98e67ed59e1d1-3567e2b4159so3665558a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633026; x=1773237826; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wMG/35vxQWRecO7x0lChQ2qa5zQ+cEwiNdTCEbyqm04=;
        b=fQN/bx3lQFpwy9HvM/BZFk5qAqgPLA6ynhZNUJ6p6V2Mc73+Y6d2lhMo/Y0REjCsb+
         Hw+Xq7cTP4MSnqV5xBDrPhICnHJOFrx1025xnENnbnqhBtj6I4L7Vx0pZNG6wV6K24Vi
         9CWYA/7QaFo4uZ0D6fBBrqPJhN8PLYmyOGardG6IfF52rAY/IHW+OSTj5XwcRkGGB9Ha
         MYIZdsR2j2HY0b2XYKLDFeSvTkKX9GS2HopFUzv5JIP/noKeDQUH6sgPR/XunlELrBvM
         eRclD1e91MvVQ1wRuFMLTtt+xONBTkCQIWPL/6S4TavHPlRyLgemwKxlGXAvVHtRfphS
         UAzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633026; x=1773237826;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wMG/35vxQWRecO7x0lChQ2qa5zQ+cEwiNdTCEbyqm04=;
        b=n06pR2RNt1N/Hfx9X2Qt2nxHMeXVRi7GQisK7XhuxQGnnoaGgpQEgnebKbIwq1ovH4
         T9xo9c+XMqDEJ1wUU5dfQ+hOor0DgQLCnpqJ1hNvbbTTtoeBjIUzkS5MdWMTA43tHUz6
         t6rt9mes/Xuzj2sT9Hfza4I+OUjeQiRMFnCbeOULtYgDi5MolZc+/Ny19Ar6k0/gs6S9
         j5rAcI8gD/J5DDxr6rrLD5LGuIXDLq76oBJ3PwCXIXwpsWxvkp7IIvkp5+RJ//bl+0Ok
         pDFiLvspx3h6Fnin2NPlLTJb86YG0XSzmwdhpkMznlHVGSt4Bhy34c7L8KYs1vjoHOUv
         0V9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVhbA3XgfLOx81n7HN5g2kkIvEaqH9cM2W0K2OuEJHcj7Xq9tWGXvkRFrHLmqySa0M3QtjyQXbvYSjGdg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzjinXWcNY5ezmCfB1v51ocQ5+zwwIf/qMPgJT/kQPUXkkLzxLJ
	7YePc1Cm6yDvs/OlPylk7X+IWMUF2Jk5tVjxOxQwJhmZTBq2MrCip18U
X-Gm-Gg: ATEYQzyj2aMRSp9+tcExw66yqqnR30m4CQbFsS7UBCmOADJ2at99ZfWLUnhcZGY6Nnc
	jcsVxYy6QxzGxTdoWVHloKvBeaCxIG+W74htUasgxDVn/6cuHpihSmZQUOfMTErsENRIFx+aux3
	qTq7Rv6OiFvPh8TZ5eJBqjFewO2t3sfJX4PWPppBnEmgewmiB+9hIONRiWAOrTarJPs+ytjpaEb
	z+i9tbvgX8vQV8oSUL2Wu+1V+UlvroiPfInKKpeJdJZZKZjdb8nJ/1r9pE2yamXOWnXBf59FAoy
	r6FyN36OIYaJE3Fmu9FXnmgl8Dx99Lrrz8z/nv46GZPonISC60fwxRafY52kaMNTUbHqkucRmGs
	8y8SHU0RM0YMjejv4T7RjvzkITps9NSvqJ7G/eTgAXOi5O5BJShYfIQS5StuH+2M16Dys6PldWg
	d6m5Ln7IynAuOLQdFM5Jfs9vDWtYYSZCA=
X-Received: by 2002:a17:90b:3d50:b0:356:2fc5:30f5 with SMTP id 98e67ed59e1d1-359a69cad3amr2158954a91.13.1772633026479;
        Wed, 04 Mar 2026 06:03:46 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:03:45 -0800 (PST)
From: Anand Moon <linux.amoon@gmail.com>
To: Vignesh Raghavendra <vigneshr@ti.com>,
	Siddharth Vadapalli <s-vadapalli@ti.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Minghuan Lian <minghuan.Lian@nxp.com>,
	Mingkai Hu <mingkai.hu@nxp.com>,
	Roy Zang <roy.zang@nxp.com>,
	Yue Wang <yue.wang@Amlogic.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Jonathan Chocron <jonnyc@amazon.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	Jesper Nilsson <jesper.nilsson@axis.com>,
	Paul Walmsley <pjw@kernel.org>,
	Greentime Hu <greentime.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Chuanhua Lei <lchuanhua@maxlinear.com>,
	Srikanth Thokala <srikanth.thokala@intel.com>,
	Xiaowei Song <songxiaowei@hisilicon.com>,
	Binghui Wang <wangbinghui@hisilicon.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Nobuhiro Iwamatsu <nobuhiro.iwamatsu.x90@mail.toshiba>,
	Niklas Cassel <cassel@kernel.org>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	linux-omap@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-pci@vger.kernel.org (open list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-arm-kernel@lists.infradead.org (moderated list:PCI DRIVER FOR TI DRA7XX/J721E),
	linux-kernel@vger.kernel.org (open list),
	linux-samsung-soc@vger.kernel.org (open list:PCI DRIVER FOR SAMSUNG EXYNOS),
	linuxppc-dev@lists.ozlabs.org (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	imx@lists.linux.dev (open list:PCI DRIVER FOR FREESCALE LAYERSCAPE),
	linux-amlogic@lists.infradead.org (open list:PCIE DRIVER FOR AMLOGIC MESON),
	linux-arm-kernel@axis.com (open list:PCIE DRIVER FOR AXIS ARTPEC),
	sophgo@lists.linux.dev (open list:SOPHGO DEVICETREES and DRIVERS),
	linux-tegra@vger.kernel.org (open list:TEGRA ARCHITECTURE SUPPORT),
	linux-riscv@lists.infradead.org (open list:SIFIVE DRIVERS:Keyword:fu[57]40)
Cc: Anand Moon <linux.amoon@gmail.com>
Subject: [RFC v1 00/18] PCI: Enable async probe by default
Date: Wed,  4 Mar 2026 19:21:43 +0530
Message-ID: <20260304140329.7089-1-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060347_918845_8739C640 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
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

Following recent asynchronous probing updates to the Rockchip PCIe
controller, this change enables default async probe functionality for
all DesignWare Core (DWC) based controllers to optimize boot times [0]. 

[0] https://lore.kernel.org/all/20260226101032.1042-1-linux.amoon@gmail.com/

This PROBE_PREFER_ASYNCHRONOUS flag help to parallelize device initialization.

Thanks
-Anand

Anand Moon (18):
  PCI: al: Allow asynchronous probing for background link training
  PCI: amd-mdb: Allow asynchronous probing for background link training
  PCI: armada8x: Allow asynchronous probing for background link training
  PCI: artpec6: Allow asynchronous probing for background link training
  PCI: bt1: Allow asynchronous probing for background link training
  PCI: dra7xx: Allow asynchronous probing for background link training
  PCI: exynos: Allow asynchronous probing for background link training
  PCI: fu740: Allow asynchronous probing for background link training
  PCI: intel-gw: Allow asynchronous probing for background link training
  PCI: keystone: Allow asynchronous probing for background link training
  PCI: keembay: Allow asynchronous probing for background link training
  PCI: kirin: Allow asynchronous probing for background link training
  PCI: layerscape: Allow asynchronous probing for background link
    training
  PCI: meson: Allow asynchronous probing for background link training
  PCI: sophgo: Allow asynchronous probing for background link training
  PCI: tegra194: Allow asynchronous probing for background link training
  PCI: uniphier: Allow asynchronous probing for background link training
  PCI: visconti: Allow asynchronous probing for background link training

 drivers/pci/controller/dwc/pci-dra7xx.c     | 1 +
 drivers/pci/controller/dwc/pci-exynos.c     | 1 +
 drivers/pci/controller/dwc/pci-keystone.c   | 1 +
 drivers/pci/controller/dwc/pci-layerscape.c | 1 +
 drivers/pci/controller/dwc/pci-meson.c      | 1 +
 drivers/pci/controller/dwc/pcie-al.c        | 1 +
 drivers/pci/controller/dwc/pcie-amd-mdb.c   | 1 +
 drivers/pci/controller/dwc/pcie-armada8k.c  | 1 +
 drivers/pci/controller/dwc/pcie-artpec6.c   | 1 +
 drivers/pci/controller/dwc/pcie-bt1.c       | 1 +
 drivers/pci/controller/dwc/pcie-fu740.c     | 7 ++++---
 drivers/pci/controller/dwc/pcie-intel-gw.c  | 1 +
 drivers/pci/controller/dwc/pcie-keembay.c   | 1 +
 drivers/pci/controller/dwc/pcie-kirin.c     | 1 +
 drivers/pci/controller/dwc/pcie-sophgo.c    | 1 +
 drivers/pci/controller/dwc/pcie-tegra194.c  | 1 +
 drivers/pci/controller/dwc/pcie-uniphier.c  | 1 +
 drivers/pci/controller/dwc/pcie-visconti.c  | 1 +
 18 files changed, 21 insertions(+), 3 deletions(-)


base-commit: 0031c06807cfa8aa51a759ff8aa09e1aa48149af
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
