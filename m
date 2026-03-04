Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FDE7EF8FE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Smqtswbmo4lhIZhPfQn4CITdUX+vPgRRXaxjp1WAgNM=; b=RLloe3PJPAz43h
	HxET5obB/0JAsFWVkDmernQeKLiXTE/9x8hecz609e/CVV7xqZlxeKlyBb+TPfsX899NQKlb8cOz2
	KChMQysn1RSO2SuhJFEw8XiFY5eTp2RUgbOjTVqFqCMAPBssLCKkjKHlHwOFVqUigK3lrG5dmwdCG
	y4Id/LqcyYy45Gd6T1YwA06tBUVAGdP8QCEcwG7y8HRoTOxgP3ZVYpCb1UIm9NJJ6GHTW6Af1QayE
	7kJySl24FRJXEXLaQPZsUpeMUJ3FvV52oq7G5ltOX83JFzjdYBN0bF/a67uzo92u3UivMxJkFkI2i
	ui5FP/mT0QsgKzulyMzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwL-0000000HLRI-3kdr;
	Wed, 04 Mar 2026 14:11:05 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmwJ-0000000HLQ7-3sJn
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:11:05 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ae527552acso12192165ad.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633463; x=1773238263; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=Qxpo2daJ+wwckDJPQvXbxBjMotdHPlhcv7ajaMGW+jY9pE4H9yOt/J3C+mSOd+e/7I
         SOQi9EpSKJyzYkn0BEDNc7RaSxeI9Z364SPq+/SGfWOSkb5m1oAXEtuNE4RaSN/AE/F2
         YyYnd3BHlFqnbPFVYCim8Jc4Z+b1q1QD6SlEQnOPsGNod6hFzhpu1NvKveInI2E7mB/F
         xVsOrvIzDIcYYXUm3n9leuiawUXdBKlvjat+QwFaJiUAqy8im4jgkMs/dfcM3XmgZHP4
         PDMcrKEOMuuweZ8Nz5yOzggS1yNKgpbkCaC0KEv2DbxAAlhpuha5zxPNyouvb7GcNQ8w
         MC5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633463; x=1773238263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eksk2NaSU09NJtKXet9GHYtfaMBPJpP6oyy4wD9BvXA=;
        b=ftQmRB9h3n5GcjQEnCehN5nJYir+4g2S5ZPDyxrUTs2GbMac5O0mSkoLcS3XKFwVPX
         9vbZwo8bXNh9Y1ayFA0hDv+ObBstCRuHv7Ij+5X92eZthP4bUbisb5aiXaKVIvpoklwo
         TLGh98e+sGL7NPhTEzKPNVHrvyfUqrBnfN4Ersl2ER1/HDVCAurRxv4eQnU2KLK46plt
         r/hcIRvJ8eRKQ9rfdmxas6RFbqyiBRs/ZaQ9kuJFxJJE9+wKUzPXH+HLdRSaENUKwxPa
         a1tv2q3j5d96cvgM6XEJYZWG9hb46QgYxT9ZqbOdyTdlT/QJMY6MnNIzapMsdd2fHn8d
         Zrmg==
X-Forwarded-Encrypted: i=1; AJvYcCVv6jtiPhkUTwxLlhj9hGV/K9CeDKb6JOBEBsVAh+pQ3JmwxuOaHQGBtnxHS694B6F23JJ4wr/xSXXrkQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwxslltxkPAjJWQ91wPAq9U7GGmJvXdw5+Fl8XS+w9PikDE3EVZ
	Kj891+KCdPQ0leNkL9gMvcJ9qPX8AnXtwuE9DtV1/zTxuHdW9nZxUXOd
X-Gm-Gg: ATEYQzxlYViXqfaUhTUvrtWDQisA5cU2rQgy88Zvmr1FUTO50z+FADn+UWDne9zDkxO
	GwMfLYaa4uGHXeTR8+WoNeIhzRLrjbhut12G8VLN+4VYjs602hZo58QrsAlj4a3lNuGAuWuJzua
	e+vNQ1Q7XPhbdlww09kLrREUXvrBgwe6n2p7414zXiGjHaDjhLIp/IyhywcFjgf2PMfp7mBrLdT
	2tRbjyEDANMM7d4fJeRRAcdbI1c1SIk0v88G6F40OfC6eG8N0plawGM6FbKAihipue70iZvCcAH
	6QhwbqbZZMY0mWR/wtv5g+jsZdD1h0BKOc3ghwOTzGVK020h3VRVp4p7fjoxIoYynly9vFL264J
	A+biJy2cBR9zvzSIY1jKxvVZByiegp5rklxrlG+JKZIWUdxqh8IFKTaQJn7gXRN8dfkaRxaDHA+
	utfPJKcPF795fHJBbGxO2s1NUrT5b4C+0=
X-Received: by 2002:a17:90b:510d:b0:359:8c63:8ff2 with SMTP id 98e67ed59e1d1-359a6a4f880mr1548752a91.22.1772633463114;
        Wed, 04 Mar 2026 06:11:03 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:11:02 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Vidya Sagar <vidyas@nvidia.com>,
	Nagarjuna Kristam <nkristam@nvidia.com>,
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
Subject: [RFC v1 09/18] PCI: intel-gw: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:52 +0530
Message-ID: <20260304140329.7089-10-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_061103_964610_88DA1E07 
X-CRM114-Status: GOOD (  11.25  )
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
 drivers/pci/controller/dwc/pcie-intel-gw.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-intel-gw.c b/drivers/pci/controller/dwc/pcie-intel-gw.c
index c21906eced61..bc5d96dc12bf 100644
--- a/drivers/pci/controller/dwc/pcie-intel-gw.c
+++ b/drivers/pci/controller/dwc/pcie-intel-gw.c
@@ -442,6 +442,7 @@ static struct platform_driver intel_pcie_driver = {
 		.name = "intel-gw-pcie",
 		.of_match_table = of_intel_pcie_match,
 		.pm = &intel_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(intel_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
