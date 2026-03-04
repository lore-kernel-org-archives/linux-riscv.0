Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6013EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fKb1RJnvTcH4PMak155oaPxGBAE4ZQRJQ8TiJmacLKM=; b=4bNk4MBkrJkTuU
	ptEyZaE9wTz3kNa19XvWHO6smY2Q5rcUd/fTMxQHkIAFcqUb9zV6qwGfYcQrtwbdNTh3JCo67V3d4
	tfxCauMWqEeLX7ye/o9gV1L7VS+VSghqX5/QA3P/DJkNDuRoaIjpJAWQaGuJG3XscGhDuKa2KU+xm
	Q6bhQDDdNijELwRmNs1m/hyziJVgqON5EBHq0f7UB5+oNazR7NZgrAJMnZQY5dsqTNGpRVwzdEP/v
	mQbEw1Lwdmb/ZQYQnatwo658koPZPqetbPzY2IPA4e1ZZJ76M7SoH3pmc5x7XoTJOB+uxwwmHu/NE
	Qfg2HvvrGm97/7ZrpQOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0I-0000000HMT4-42qf;
	Wed, 04 Mar 2026 14:15:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0H-0000000HMSZ-2tDA
	for linux-riscv@bombadil.infradead.org;
	Wed, 04 Mar 2026 14:15:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=; b=eL9rELbVblOyJfrEf6yeVzJasG
	zBz6fgME8PW2zInP/keNUhdSBxOl5T+cHUWMKCBqCqitup7tnSxDOpMWYstosLA9lUkXknP+C12bt
	Sk+pFg5TIO/mJqX+EwVpp89gnjVVU9Mm1YizsCkYvYPX+UAcJ/8iRmQuREKmvwbNPck86g0Hoq6Xk
	w8jO/PsIS9r6zJUktRfZPYaPXXumXgw8YQTMbJ+adTNYwYDg2fpgwCAOj5Pifa2lVbJk/FyLkOEc+
	b9eDAcDZoAWdXr6qtyr1Ic85zscaiHJnP1NxLFAYjB/JTD6kU264RhjTN5LA6G3Q8zcz9SbCdlP3D
	Jx8oEHDw==;
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxn0F-00000004jZ4-006V
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:15:08 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-356337f058aso3450580a91.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:15:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633705; x=1773238505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=TwWzYdtE4gN8wq67sLAQZLjKZ4AVr0AmOwYBVA1obVF3my+o9no4DbswYwbRaFuLUm
         1EH8lkfObg4W0UusjT86hF78nZcrIgkQWAx2am9wGAhuPZ7IGi0qzelK46Y+407AsmSP
         hjK7zHPDkMJV02pD9cyPRYfUWzjsuJOj4J7XDQyRyAZgvv7QuOSdQ2a+ypxMoGgrGtda
         6L65FoCaqhCZwIkYR0yMj30VGi4sVz+bnYGQ/AvUqK5ePXrc/RWYU7AdPN2EWgrao8e4
         zzPslmROMgRWOscREUClW5z2+sPDJXPn7gRgpWc69c8TedtcU+WN79iCrg5vb1r2atyl
         cpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633705; x=1773238505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9OBV1g9f6o6sz6h2YLW6cb0WqXaVph12Op+HL554xjY=;
        b=F1BibibQkHQ1Yy+WFDtd99SKV+T/xKmYHDAR1dMY5wQrSCegh6doRx7QSkXTxLh+An
         ZU3282Dm6boVMUTwomuKgUW7b9uFoKVJWeszPUHDzZdEBm202loERLbY2JnmCSPkrcpY
         CiF2tkNiOiWaZTY0sGBndHVk2gKk877GFvoJhnpFV2nf1Zqgw5CQJ2Uz74iClh4wl6Kf
         3OGxfbHbUMbxUhLisuu9XKJK7sFGGNrzo1fyIjkWFCBuXcLTAZ97NnR7wLFFf5NMZTvt
         g8+TqIOJl0Y6QK4VmIpt3SaSY2JDZUnjKbMQ0t3khgHxMBG1VrqJkuL3xPtfU/uEXgKX
         2AwA==
X-Forwarded-Encrypted: i=1; AJvYcCUvSkCGgKo8f6WYRL4e9ZyTXCh8Fjrvw5SMstCgu4IKkjAphUjFNZ2CaomBZ5EnlDw0yILsO72tacYTzA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzPPOgoPUayuER1i4r+kSD7K6FRQPreuGqrDAy+WNBeQmLiImj2
	30RD+KPf1teFA3K81AmyVdKlqMmd/2f2+57CDAJiiuySbp3xHyhGyf6A
X-Gm-Gg: ATEYQzwiijO+5zlZtdn+8OlKZG22QtDrjeAJWmBMNaNf3IVwovmTaXXFpm9G4Gtf4cS
	Jb8gcNLw9ZMErDF8AzsRrdc1Q1nDaFaZOY8+kSiJ81LTijl9h5UAlZyDvr2J48dRn0QYVbT3muh
	WriuRF3uSd+hI6mDuZuMzvJPK8kVUUvPGZbY9Eu2g41wgS8l0wuT7LBdPBNCT9a0hVC/sd1iXqp
	e6v2vwqfOfavCdmjKU4GY2dwlDzpxDStVT4r4AvjPpwt5HLeslyAkRpV4X0MwaeT1HKj4mAG8fr
	1kO0eDQF++Y8stQYKHRqoag90h9QcDCuEZ7Fly8MZarH2FZSs42uXg50oQM1zAvJDMPxDuqkv+E
	aqVo2YYr5w5Mb8kPbbwcEIqjGudAF+YoeTmwXUA3wbIKedxHbgc7/V7kXp4eyTHDl2f1qStA4NI
	XI265b4e+AgohzDR40FQRa
X-Received: by 2002:a17:90b:164d:b0:359:964f:491b with SMTP id 98e67ed59e1d1-359a69c8cb6mr1870621a91.9.1772633704630;
        Wed, 04 Mar 2026 06:15:04 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.14.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:15:03 -0800 (PST)
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
	Koichiro Den <den@valinux.co.jp>,
	Hans Zhang <18255117159@163.com>,
	Qianfeng Rong <rongqianfeng@vivo.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
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
Subject: [RFC v1 14/18] PCI: meson: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:57 +0530
Message-ID: <20260304140329.7089-15-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_141507_120859_276F3744 
X-CRM114-Status: GOOD (  11.22  )
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
 drivers/pci/controller/dwc/pci-meson.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pci-meson.c b/drivers/pci/controller/dwc/pci-meson.c
index 0694084f612b..280146f7b783 100644
--- a/drivers/pci/controller/dwc/pci-meson.c
+++ b/drivers/pci/controller/dwc/pci-meson.c
@@ -467,6 +467,7 @@ static struct platform_driver meson_pcie_driver = {
 	.driver = {
 		.name = "meson-pcie",
 		.of_match_table = meson_pcie_of_match,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
