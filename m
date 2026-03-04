Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 014BBEF8FE7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:08:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FzCpzp0k0QKWVsVe4piJ+xze2WRpsED/7BaE4+Fuq3g=; b=ox2medPwuNGCh0
	sPQ/xeO0UhxuTk1aub+qvltTxaX8sx/uHzN/g7wDKk/+37+OKHuyqxs8MgNjHVeV0f6GYJ2H9L933
	oCQVLkhMbsVIf0dn+tnzR4GqecnNtvi56IqdIptJyqCqex+XVX/oDKtle5yaa6fc7MUAH3cs3J8b9
	D1WIbkgEoTWRpLuYVrExBCy1N1Of6TyHIRKLPbTdw/ZmYtz9lMkOKbX40+8X1U4AWnDv31pqiTW/K
	LezUkr2o8O8sjdED+U20ZRMlyN4GHJXKJCf/KV2TlOJB3OiHtPeoW3z5cLEiqOcR6wFCioiQ4nzJ9
	h3kr/VLg7y2hv1B91wZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmu1-0000000HKmz-0BhE;
	Wed, 04 Mar 2026 14:08:41 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmty-0000000HKkr-0KZg
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:08:39 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-c7059b9df33so2587262a12.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:08:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633317; x=1773238117; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=MxbW9MrR8xfbt4ojkJONRG2Euov6GMteiNUZaC98H0LufM6Z5dtpYaLjGd9kt3x2PW
         5WqD/CTpxxuE1c/71wXYGbcVKzgJcOVk1QU+gt2qT2kHVEMe66WbqKOwwx/ouMYmp5bd
         3BoQ9mHeTD/x9COU27nEYmT+2tNOYC+drIdXY0Ur5+7jsRiDmFnnV6g9Y16eqrqvO11s
         qKCDAc4gSH1ug1JUJmiF4qCVoppzWgTccbX8ksxWgRCyKk1Kfg12GL+PtXA6aAJj9CSV
         dXu3h4BSRuelQdanEsM6eDjKxlX09phfM1RLDrcWotWkfcHArQ1wVS+4GVP+NDOzc8ib
         IJYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633317; x=1773238117;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6zjKUEALhh3sKzrRVkbw1XSt9/jPsMcJZY5h9AuldV0=;
        b=S/fjWokdJV5sqrVZgYvyHh/yMbRVCJsDSMnvWs97aMCyrQ+QTUrpOgGPmFHiVbsOoN
         kYZCs9RZs2DlMos4hWbhQU86jwykqRr2W4yG1Aq6zawUCBsRlWE0j6xb620hceIIN2af
         NSqQTJ6o2cObS4tHh6i0yphzjqbFrlldTcVy+u02Dxdw275gvl0AQteSAgX/IOtg595s
         K6TDv+ODuLYEDIgmk1IJSU1ewQx0xplOFkBE0oSKe1/6JibgjllvMPxsTASOPuKuM5Oi
         oyAVN7+Tvnzlot1zb0vLRX2ztcRleW/h0m0SO7pX6EiZEcekUO48qTMnuHdtldPdKdiH
         VIIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsGjBnC0Tfg7M8lga8Q09VX7AUqPbsd8kQ3kj0owp5/gAh0zyNfMHeL3Nb+TkPUxn+VPewgvM8lQo4NA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPsf93ytkD0j/LrQpbepZw0aBKK/duKaBpwrrcTT4VaE14cECK
	won5MBeKUPQRY++aojuAFdBeQXjWVWbciYjFY4Vf+qypykvilEMnTDRG
X-Gm-Gg: ATEYQzwKlUTChNCqZJ6W5PboyBNjCTtUPz2BQJzs0vDPgZx+Au04xxd3Bgv/p07Mjmb
	8Tqv7BgbqZXJBhpqrHrgoVrlmKsfpKn0iTqSf+8uz3+I+XjtGHYVULc1g3HnbUR1S6XZNhHgK4g
	g2OdEYbBd4EC06Pg/mYES/AXmIS1Kvz2cac+4BlN/ONJBQpv+bN3jmXo9wASzKUfPxjSawCxSH7
	dfHbed78/igfxHb07x9ozQsy0UcBHZmLr8o5QTHF+X0wcJX2PRNiKyWqjNs9IDQjmYAUlcvUZ9d
	2s7Bwko4vdvxwJzvCx15ghwepGhA89HuNzE0yiZ3Pg7zqJPRNVgW2eXPK56OwynSpLJODX6mbkO
	eRxzr+3DKAOlL/W0AT8u2WCdwjy7pB9KJXRFzx4O4U/TTfY3OEbiFq3TDWJSPcRSPHN+E9of2yr
	aTiZaV3+lQfwaTN3gQaMtE
X-Received: by 2002:a17:90b:2d8f:b0:359:8df1:8553 with SMTP id 98e67ed59e1d1-359a6d8521amr1962255a91.9.1772633317107;
        Wed, 04 Mar 2026 06:08:37 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.08.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:08:35 -0800 (PST)
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
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
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
Subject: [RFC v1 06/18] PCI: dra7xx: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:49 +0530
Message-ID: <20260304140329.7089-7-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060838_119062_2EB7ECA2 
X-CRM114-Status: GOOD (  10.91  )
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
 drivers/pci/controller/dwc/pci-dra7xx.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-dra7xx.c b/drivers/pci/controller/dwc/pci-dra7xx.c
index d5d26229063f..be470d54b2ee 100644
--- a/drivers/pci/controller/dwc/pci-dra7xx.c
+++ b/drivers/pci/controller/dwc/pci-dra7xx.c
@@ -951,6 +951,7 @@ static struct platform_driver dra7xx_pcie_driver = {
 		.of_match_table = of_dra7xx_pcie_match,
 		.suppress_bind_attrs = true,
 		.pm	= &dra7xx_pcie_pm_ops,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 	.shutdown = dra7xx_pcie_shutdown,
 };
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
