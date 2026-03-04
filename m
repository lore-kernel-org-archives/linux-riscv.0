Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 683F6EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:09:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W+rZO005PhGQ8g5wfZ6lRr+qo1zHltnHN9aUMWCwFUc=; b=YpSQgqMR1/S9mR
	bWtnnz5hlz2e1Tq79I0we/vNR8j6KyWmWjw4hD8n1odAJqvWea4SXF6SbtFWL4cad3hjyOUcLBExZ
	vQBHl1vGBYDEnzaiO0LJbCKJkdtlQ5kPR3GlokRD53WIeseOAP2Ha7OBtv90dkdNolSNPBs91lgFT
	Gfxz4tAcd9DgcLGu4312UYui6vgX1/GmG6yd8gqD5DaTwuEVRhVuafDAeiwsUI/8wI/nfJi6hQm7u
	C8ZUt39dXB2A2Py86LZgG6KNgWKJ0mua0edNT+jYC6D7NwDoBqUkV2/p7WgQIc+GtvZuVUA/PiwkE
	yDdwXpdDxxT+vFCHQSxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmuo-0000000HL33-3Q1N;
	Wed, 04 Mar 2026 14:09:30 +0000
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmul-0000000HL1C-1uPl
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:09:29 +0000
Received: by mail-pf1-x434.google.com with SMTP id d2e1a72fcca58-82976220e97so326350b3a.3
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:09:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633366; x=1773238166; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=SbHzSA4YRJyv5cz6qKEkIUzxzXCvXPXupbMkPOsP/hb60gmQlrl75qSpt+OMEzVkqi
         3FoU3yYThfoZ4u5JKSZd0HRlb7ZBdCR8OKwAeANxxTeCXu1tagVVc5isR5IKUIMtGtj9
         dI8YtgKJRcx/e2H2bjADq+RIdUhHhqDLV6UiJktCzSjmNKHdeUu6sMoKbtgXP6Q/GMh/
         dYNJBTgjZGeUtxtsn+VOcU+zqe5MZDP9B7MiqQ4wHTsUOyzkSo6Pyk4d5Vk1Nasqi/pb
         QOg/7M5TFcJL0rp8I9SUIF2LG8dDpG8t01j911QLCI9RMHf5VGcNAuxQ1NJDdqZNsAi+
         /qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633366; x=1773238166;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mrS7ZIa0rilgM/jlzfLJJeKLRZ0Q0OYSRBkIhGwwFqw=;
        b=ryaX4XeJjTnGv7Wb2yU5c0DgM8UEHsqCLoh1tDkDkzzIsuCOBx/vteaMGC0GD3OjG1
         xb6si6NQuZLCxu25ABjfSU7xU9j00pj2CQm/Cla1vcuMg+NGMpuuM07NyBPxQka2wSbb
         XTZTAKBiwNRghu+R93VE2bsCj7NVDZ+xcPGJeWdOla4xyrykyKYi3JGp4+ZerQN1ZezR
         iX0s/QtsXuCjUxlS8+Yw0CneEfIRodZSFJdq1CmtGlPXGj25Y+UZsnJ54Oxw+9/e0ild
         9fzhPnnY8ORFxe/oNknm3eoN5CD4WrgP8r5YUvF1FN+/PW/SWFRBypW4qnLmJYCHBERh
         iN9g==
X-Forwarded-Encrypted: i=1; AJvYcCV01LjzqnGhO/mJAIgXPqx91ISUez2rLxM6KsnsoJi/DIeD8S+htz18kHOVTxpzZ8irUSTG3RdBryDeoQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YyC4ZNRCR7Bvsn+6047kPw6FxNenBnsqoIb057syz2K3NkRkf1w
	Xo1mFvjSM4I86UWuGSWJjHQE3wddCDSi7PoFXYH+nFh8w5nrddst3i2P
X-Gm-Gg: ATEYQzzeU3CAua5Qucsm43dAHW7GnBkHi/3oA0pPYzY4dB9vwc0mJlQ3XLgugZxpztE
	4DOJuDhokIkcakoZ+EvV/tD6tACO83pXvNbuHpr7sXUzBKVOzLZScQNbl5M2q5J+49mblXHy/D/
	94AshT3IZjd4LgluUUroupF3Jz6zZo7iAz4WCKoGfnUEVn/h9/4ikcZhrbA3yRqJFYkQ1MVpu31
	9N+ahoMC+c+KNVXTMAFZPyesUD7vSQlOdUoR1dQJb7fWchKq2JH06SLHELh7/6S2vuqrtGd6hGm
	IlhDVkjEMcbcisb207n0K3bDYHyEj7oDL2Lz2XosWl9lQJlhkuirtuL5FQ6vFvPKtm8DLOS4Zkw
	b6bHt0u8ZdH0d+qVkPrQtdC387TSvDm+OvxkXZWyObaIWt1xvYLpF4A0uEIZ8T+nZuxlWWKiowF
	3c3ykJol1/obFWupHtC5Fv
X-Received: by 2002:a17:90a:d00b:b0:34c:9cec:dd83 with SMTP id 98e67ed59e1d1-359a6a7a0a3mr1687183a91.27.1772633366451;
        Wed, 04 Mar 2026 06:09:26 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.09.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:09:25 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	Koichiro Den <den@valinux.co.jp>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 07/18] PCI: exynos: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:50 +0530
Message-ID: <20260304140329.7089-8-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060927_499154_63078624 
X-CRM114-Status: GOOD (  11.17  )
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

Establishing a PCIe link can take a while, allow asynchronous probing so
that link establishment can happen in the background while other devices
are being probed.

Signed-off-by: Anand Moon <linux.amoon@gmail.com>
---
 drivers/pci/controller/dwc/pci-exynos.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-exynos.c b/drivers/pci/controller/dwc/pci-exynos.c
index 0bb7d4f5d784..ee2423e16b58 100644
--- a/drivers/pci/controller/dwc/pci-exynos.c
+++ b/drivers/pci/controller/dwc/pci-exynos.c
@@ -388,6 +388,7 @@ static struct platform_driver exynos_pcie_driver = {
 		.name	= "exynos-pcie",
 		.of_match_table = exynos_pcie_of_match,
 		.pm		= &exynos_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(exynos_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
