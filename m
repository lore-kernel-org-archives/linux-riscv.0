Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F943EF8FE5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:16:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jcnmHqTo6OFF60gfltFtcfJPrQ/JXj6/qZCif8Qoufo=; b=MIfoI14X0xtI0u
	EBzm6m6HFqxLbM0MJW9fdjjLuSx4ogZFnvo6IOuJjgs7+L0+E/s41i/W8ohxVczUtYQ1C44da4ICa
	vYoys/9bPHRoEyL07Aaz4mIAV8Ur0XJrNJV9yVCAg5TR/CSz0yGufuiS5zt/v+uwgDGBWdv4QUy2s
	TF3fr1Jjh5UAdifayCSa42RfioQ659tTwvL7qyXAubDA7OuIojJa5YBsV+8qm2AZXkl6sjBqmBQPi
	a8tZma0JM71ELbiB1ewMr5rfMSe3moiINwSxrYcgfbuBWFJPL1SNRyLEys9TSekJ4Xt+0Oa6ZlMAL
	Lj/jes6I1UOsfSyXxd0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1r-0000000HMtM-3tid;
	Wed, 04 Mar 2026 14:16:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1p-0000000HMsL-3mVU
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=; b=K0yPx6W7ehEnTv8Q5ipPRTyPU7
	uUBiwAm2VRZt9uy3QXueJOIXwVH5AYhXDRHLfQemqS0o38qmvP9E/agyxFws4JyyHVlk6uDhkjEEd
	61RAMUzKg6b6mYZff6A5+EQefyKN/lsd5Xr9RR7g1jxqOPFstj9FlK/LDccgYYFuAcAqMunJhwLbi
	78JkcXAAo+eALkjzUojqNb037tOkkjumkmqFpPWtbXwfBV2+KaJ1uPAaWIJJnJ4qYjwVcMTsdyIXx
	jKs3NU2OCsKJigqu/9AYi+PYeFwfYhkDQ+2zYTyv505gnGbRew/jz3QuNB50qKr1tNnGWp3g088jG
	s6qMMYOw==;
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn1n-00000004jlC-0GLS
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:16:44 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-356337f058aso3452502a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633801; x=1773238601; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=Yc/ONNVhmoXk+nKvkfPO1oNuKB+QZOgCvznjOKZTLbI2YO9QjRMXtd0D2Mmybshg57
         jQbXMGY5heYD5jWZnjpkujKOaD6Ezw8Bz3mI4fSCHe6eWgi7ATqyylnVUw5B56OzXddu
         JgKg93kalIgWNKEDz5ILdM6JVeSoBQDbDUc7yLrKkWs7w7c0Rrq+sRsz0oQop6wyXM0d
         JqLb0wKglTzYVGbitJsLW38HwVrMpe5Aggcwtc+ZgYW26wcYiyswVINrmwUzqJ++1Frg
         rO+MeomvZ+KEu+Fane/9H9mD+V0DpLp6RA1Ocz6k8XEPxZN1CRR96XBd4u5pzYibvcEh
         2mwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633801; x=1773238601;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KDjBy/zS51mD1PxaQ7mIKoDOiKAIHa799oQhdGW8t+4=;
        b=e3bmyXe+bpYRxVH2/WJe3+mWt7AAlDxkfsfLdAj3UpGF65yjYs/I4VFOUeIyxBZf57
         T2IAwUXhLpnlKpOYVNW8i0y1ZSpJ0IPiwbYmKbwUcwUkf1xIRQ4O7ZnOjxYEFWXZ3rOP
         KDNcytcVSKR7IaTyYsIY62gB1wOHpThjFlBCXU/ly9mZMVATl7nyBk29xdI8QYgY6Pgi
         +ovgs5+i/HadUxM/lYlSACLzRy4irQJqVP2KyLqEFhlYltRV42wOwEFFWXHoY/58lxwk
         peGW8FxBGFJqPTegM6xMMO+tuLUvPqGc0BpOU77lotGT98x4tq/C/lAUCLa6uKrIpA7u
         FQtA==
X-Forwarded-Encrypted: i=1; AJvYcCWkKL6MRuYvukPI+593TVsX+So/z2MtC6W/9nr3QCyRolTtYRFkAricK4lPtM4m7XoK8neDzWNCvz43LA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy7F3QkqOKhhsblRMJjjWgfqEgZmaAmZBQbqzrGPQWME4/80eOs
	9CV4bE09DW4J9VIgB/pkjBel305rxqb3EROKtMhaeywjyR9sr2xSVnX3
X-Gm-Gg: ATEYQzwyDevMZLEeiIvV4oz8jwCuGgkpBIA6gI6XBis8c7SLO2YbJSjn6Z3/l9rgK94
	Rcvy6lSmYzeod48e6mOccyBjSmZOcXk8ugNi52d3COZmPwiwEnR3++yBl9D9tZ+m3acJbrckdF3
	0mqcNVQggaH+klk3SpURAS2c1BMKmTJ/wMOFuosLb05pqDJ6/M9R8wZ0PAW7e/oNHLxZLddvrCv
	v6Clco/PoLbhjkg0DYNFSdQmGMfiiVyt24pzPXR/EFbOF8XNc6rcr/oukg7nXqtm1yHj6Ca+Twd
	JQGMMQ0XjSNVFud8VsBZJzWTEiR27gTyN71+ZRFRh/75eRLfWMoEgWIgCLXLt8fexPe3Nh9lrSU
	O7xcPH+kM9arp0IS1V8R7PDJMC34cA9a5sKzoy8N7ZbnAbyADJSTI9c7xRyminDDa4l8/xOndOr
	ioBwiPk+jJHiN1xwvI07wb
X-Received: by 2002:a17:90b:1d4e:b0:359:8f84:ad8a with SMTP id 98e67ed59e1d1-359a6a88709mr2213203a91.33.1772633800980;
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.16.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:16:40 -0800 (PST)
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
	Hans Zhang <18255117159@163.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
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
Subject: [RFC v1 16/18] PCI: tegra194: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:59 +0530
Message-ID: <20260304140329.7089-17-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141643_257232_9BD54A0A 
X-CRM114-Status: GOOD (  11.12  )
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
 drivers/pci/controller/dwc/pcie-tegra194.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-tegra194.c b/drivers/pci/controller/dwc/pcie-tegra194.c
index 06571d806ab3..7381d0019d24 100644
--- a/drivers/pci/controller/dwc/pcie-tegra194.c
+++ b/drivers/pci/controller/dwc/pcie-tegra194.c
@@ -2493,6 +2493,7 @@ static struct platform_driver tegra_pcie_dw_driver = {
 		.name	= "tegra194-pcie",
 		.pm = &tegra_pcie_dw_pm_ops,
 		.of_match_table = tegra_pcie_dw_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 module_platform_driver(tegra_pcie_dw_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
