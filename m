Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52079EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:17:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zFrgvfslHANeOi+130mrCLpFH9p2xmLF+8TnVMBmDwY=; b=fci62AmBr4ufkV
	2/DqHtROuqLengKhO8Ol/uzy+yy9oXDB36tWAelJ/B9U6NdxEO3yK9ECNF3rtgdd6EFXBduJ3PgsZ
	lkjTrZhGVWna0IBYJ1VtTNteEVm67/4BkwNmkcfs2zavcQ1XSSkBG5gEHocUNws//P+Yi6kI9OmOP
	Yyk6MBQHZ7uEuL/7n4D4UJuDULlfpXQmB6EKnAXJ1r31Pyh079Fw57Fx4DwxDSRj4mWdV7VGQNgtq
	hcYyDb1lUL4J8hUmoITx/gGbXquTkgHuks02d525+pm4xrmY1mBM7hMso8M2htaI2TF5pqop9xayb
	1NSYLdArqyZ4FrCqtkHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn2c-0000000HN6T-49M1;
	Wed, 04 Mar 2026 14:17:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn2b-0000000HN5Z-22Dv
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=; b=ZQrLWk9FJdlzPEPISCRaaXs9oX
	MzztdkPdZeIv02KYQ5nOpNklzzrsLWMh4V2mGrN856XrVFIemnFpQDVjBrQmr8hhdG+ZbqjcFfeq1
	ccsUezPj3ifAwNcm5sdEMAwxDxHbQE8pHW1rqELbwDYzRcg1KRb4sO9wl4Q1SL8xfjubKyNiQkjZl
	Q3mQC54ectbmCbrTlCgwE+MXt37VoUiuyKXa2NXLjZA6Pm+GAk8FHBgVXwdinwSSb0L6jBNZ6iOv5
	n0+5WXZ9W/lqiZSADc1fZS9WMxCDQo7am64wdJ6DlbyNgxgXYZ4rrpQjARRp6iOpe2Tjo1cDzX2sl
	XsYTBsTA==;
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn2Y-00000004jr0-2pbS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:17:32 +0000
Received: by mail-pj1-x1034.google.com with SMTP id 98e67ed59e1d1-359894e17b8so2391908a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633849; x=1773238649; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=lwsSh4X5E2ZxIPSSwMPEl5oTlPE4fuEHxI5ArimuXkUwaHUCC2zJ4Fc9PluD0TGc7k
         YwueEocjDu2ek/pO+WzJj2LrZYyxTFzaMEmX7DeaNOnmwZBz2j8gXUBWmFX41Mbcr/Ef
         4TLt/YjqYXHl11ehKMTuqcR4pyEoVfN9LSWQCJevDKzHqr33KoltkU2bvdYSs8XHInSS
         R3gN63qB0kvXqfwB9t9jDT51kzDwmqukpw0ScnaaIvgM4YIwH6FqI2eqTGfXcsMGh6un
         XJt4Fk4PxHKpMdqajQjZE3i90jQo0Ga5+XKW1whu2K7V/Y+HDFX2UmejzV/Ge+fQotm0
         tJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633849; x=1773238649;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=srUiyLQpcPURMgpIQ/orm3Jjpyz5IeQj0sKin7gLX5c=;
        b=kbK2Opilfp5V6AMcZJpXaab7mLBcd2vlTfw6QR4qtfssn4B1ToCYEGt2ANnlJQtz2s
         TwkyTOVps7Mx4ymttrFKOJvK7lDpT12hdshFVm/fn++M5f4X50EBaV5ZU13C4sSb+2dB
         ng0wKGxJic1L+teMZgPkVRsS5bzi+x4J3vYZ7kj5aPERvAzIr14EuYhqqpVcijOCAS9O
         7O30zqrgRpAnnzjpMw1aLM+3kZ7Y+UY3I200DAx+9BKno+G5kgQo21DyZQ4Ut0enWKj1
         X3y0rajNWnJItm/CA3GQi8YA1Z+v8nNCnjsA4L4vJyK0FKZimp+TDAT4aq9A5H7SMkil
         Kx0A==
X-Forwarded-Encrypted: i=1; AJvYcCVEV2oT3G4OwgRcmqm8dI+4gfmOVpdF5rub1gj9mOvrcmWSd51TT+CbKYzhS7vhhsbqVWqKoqCCgq5gDg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw8CcxHlq/1Fcem66qp7ZW11yRfkAxxB03AhSufkc90O2Ra8x+L
	K3T9F26NuvfzU77/TczMR+CNePGDEXHizU80kM5QJA05bLlhYSoYqm/x
X-Gm-Gg: ATEYQzy32GWTwFZx4QfKMeKH6MGOC6LOfyehou87xOjFI+3TSabOfBzPwFBj+Xi3AjV
	7wwxT1Sn9BfHMCQfHvhp25BV+rgILgeilzu3yvZG+J3lO2oDFjKmqCd7J4+2UjC9UwFe4S3Zf8Y
	a3eqsv1grX3RuMyGBqbmgIkA1piGY0FDPyn266BB2awkYTrzp0tOvA803i7EFAFdrje80VzU9P9
	EM8K8v+OacDEi0lp1YiEGDX7WgLz1wVZtXs1T1dyXt0Wjnld0P9ZwvEkZK0tE/BwywUBEkN8dH/
	vSJY3HDbQSDNZ5jy8hZ71JEAp+I9bXE2564fEbl1j6xAa4EJ8U3u5mMIAVsIltuScoIfgkb3vL8
	CketR1jqYav/+VK6S6up5Byk9i9SiQXPhUmv1mnKtsHubppSq34TBYO9l3xZirBLN3qcNJxp+N9
	rIAvhKKNu8+8GEsracIGja
X-Received: by 2002:a17:90a:d2ce:b0:359:849a:7357 with SMTP id 98e67ed59e1d1-359a6a3bc3cmr1764561a91.20.1772633849089;
        Wed, 04 Mar 2026 06:17:29 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.17.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:17:28 -0800 (PST)
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
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Koichiro Den <den@valinux.co.jp>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Hans Zhang <18255117159@163.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Frank Li <Frank.Li@nxp.com>,
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
Subject: [RFC v1 17/18] PCI: uniphier: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:22:00 +0530
Message-ID: <20260304140329.7089-18-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141730_827909_C85FA202 
X-CRM114-Status: GOOD (  11.21  )
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
 drivers/pci/controller/dwc/pcie-uniphier.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-uniphier.c b/drivers/pci/controller/dwc/pcie-uniphier.c
index 297e7a3d9b36..53f3bc9f5ba7 100644
--- a/drivers/pci/controller/dwc/pcie-uniphier.c
+++ b/drivers/pci/controller/dwc/pcie-uniphier.c
@@ -404,6 +404,7 @@ static struct platform_driver uniphier_pcie_driver = {
 	.driver = {
 		.name = "uniphier-pcie",
 		.of_match_table = uniphier_pcie_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(uniphier_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
