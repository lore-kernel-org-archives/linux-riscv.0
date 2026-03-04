Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E5B3EF8FEA
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Mar 2026 14:06:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tUtkXqKapsCozk0VsNvL0uYZaK0Mhxj5pTNKo4l19UM=; b=lGndLdbCljDfkg
	kDmLtBh62JghpodMpusafuPh90FDDXh9GGAbuIiDAGs8jABKBN4Mv5loyLNTJBBtGhof4/nsgmk+5
	alpSqRNGa2IwkLItCQxOyspYtQTHv8CNbQ10X6UhpaePwXHTU1Q6eSEC0nWp/8UcQLgVRa5LUx5wC
	odzQdegUgu8qWpR7XeqodqbX4vafvJORIpJseuqi1J7SPfyTd3qYdU6PDwfOf7F8Bln73qmyf3vlM
	URCLy42l14XbrzZASAy38nDVjBiooN78KwnN0jZFHXj8sMQ8DpqVbOvTnLN6cTajbmXJxMhAZLS8N
	/8W1A80Gq1ckvN+nrcNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmre-0000000HJlj-13tM;
	Wed, 04 Mar 2026 14:06:14 +0000
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxmrb-0000000HJio-46lM
	for linux-riscv@lists.infradead.org;
	Wed, 04 Mar 2026 14:06:13 +0000
Received: by mail-pj1-x1031.google.com with SMTP id 98e67ed59e1d1-358e3cc5e7eso3049137a91.0
        for <linux-riscv@lists.infradead.org>; Wed, 04 Mar 2026 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772633171; x=1773237971; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=T2BftpHl1DnMezEWSGDUSis4u2l6seoLgNGPk53VENugZXlbTRUdrF1OntXoRGAapZ
         DfNcp0I5Pf5Ewp+/RPJaMRO5yYlDZllP6KMDoGTMMKqs9Va5lboHXg54nQjMF6Nx3Wls
         bNrOh3S1jDeWYrNwpuRL0HSfC/MwsQM9XNyfyOiHuOTRB/kv7ZXkWvfCFABiswGiws4K
         iXM9Twl3GpWBUwQjMhb/Xm771GQa1p+0m6FGIcFJrEabe9vrMuHV+8Yh7MWdwO+dwSFt
         Igld5JIG65+h+kX12EDhgDPQTjdVxJG2Owt5vQc45RsMnlu6FdlZkhHPKSG7YH1DW9Qw
         4SeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633171; x=1773237971;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Z0IbpkKbOUqAD3sb0v/7e7VSuY+QqYVSN65hjbLO7Ig=;
        b=ihAQKlqixHkqhM03BhlRRIZXJUiwM0z9PNMvEEU/G9J3rgvBSnRaDbGx9js/xLgeDe
         USFHEgLQ6S/vlkaLGSegUPVf00QmPxEFrbC358lgNrIynD4coMJqM8pfHo9rp6viharY
         jbb6fx9n4BmKfLf0gZz6LeBI9f29EK237aCIcDCK2+PfhifVo0GoMParDIcFkbncg+bp
         YZ2XnM9Tq7lImbF8N4V5tP5YOAn/gt/mhQdGkeG/9G2HjODVmMJSHrTS8Y2pYuhbbtXp
         aqFUGckwk3cLULFXpfq7Gt3EYu4l6nah6VzkmEhhiPTq2Fayu1nMaHTaMW/kdNV3qUzg
         EvBA==
X-Forwarded-Encrypted: i=1; AJvYcCV0GIlZmRmQ6g2gwfgCoRPuB+N/HarriiQdS6mY3ZC/152R82QrLUe07Nmjd/7WlrnJ3I1eG6D1CP/3Aw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyB+zbRuEz+clUSooJFlilsMAYz4iTAS/QphTJNRUSqprpmmNyz
	jfkwLiJjkwNCL00Vbx9y1FFXhgMaKvfF29p0IYp8MfDdH5/sN5blvxrB
X-Gm-Gg: ATEYQzxFAudLt77T6rI8+l03QOBrOdhbaUSTQ9MDwUrdbONoDPPLPQQR5EZaFGx+Phi
	JzvjMNM+BmovR06/j3UBUw722mcvxR8fQJ/CmXUdzsYpPvTKE90tR8ql/sXRFMApzz6n6vwSSBy
	gS7qdKNgs2zZqmH8o/MT0pqbNvZZayDrLO27l7447VN3bW5tocrERSTzI6yzaoAf8nN/aRc0BC9
	BpJhE8ax0mKL9yYbYwvtZKiQa6jst4/BQpTj9l4p+zUF81Subt0OcWQao8iI+Ldd6LghBTH28Fl
	C5x70EHInB5zzu5D/A67Ne/qxHxCSQpK4+XjzG95vxuaTGFqcdOutbznSs2tssvXB2F55Kdp4Zr
	ZrwAMsd45fxtQ/R2RYut/ENGT0WGG3T4ooQXuNOGtKBRnlxp0BqqbHAJIp+EDpPIbKSHiTeyG+T
	Ax8tZ8iBezeWHRmhwADINYBgqyplS5RlI=
X-Received: by 2002:a17:90b:2888:b0:359:7906:d996 with SMTP id 98e67ed59e1d1-359a6a66a94mr2076415a91.23.1772633171145;
        Wed, 04 Mar 2026 06:06:11 -0800 (PST)
Received: from rockpi-5b ([45.112.0.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3599c4c0f80sm6826545a91.16.2026.03.04.06.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:06:09 -0800 (PST)
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
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Thippeswamy Havalige <thippeswamy.havalige@amd.com>,
	Sai Krishna Musham <sai.krishna.musham@amd.com>,
	Koichiro Den <den@valinux.co.jp>,
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
Subject: [RFC v1 03/18] PCI: armada8x: Allow asynchronous probing for background link training
Date: Wed,  4 Mar 2026 19:21:46 +0530
Message-ID: <20260304140329.7089-4-linux.amoon@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260304140329.7089-1-linux.amoon@gmail.com>
References: <20260304140329.7089-1-linux.amoon@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260304_060612_023959_21A28D48 
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
 drivers/pci/controller/dwc/pcie-armada8k.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pci/controller/dwc/pcie-armada8k.c b/drivers/pci/controller/dwc/pcie-armada8k.c
index c2650fd0d458..ffb5554a2a8d 100644
--- a/drivers/pci/controller/dwc/pcie-armada8k.c
+++ b/drivers/pci/controller/dwc/pcie-armada8k.c
@@ -344,6 +344,7 @@ static struct platform_driver armada8k_pcie_driver = {
 		.name	= "armada8k-pcie",
 		.of_match_table = armada8k_pcie_of_match,
 		.suppress_bind_attrs = true,
+		.probe_type = PROBE_PREFER_ASYNCHRONOUS,
 	},
 };
 builtin_platform_driver(armada8k_pcie_driver);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
