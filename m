Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73471E7717F
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Dec 2024 08:36:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oMR1l29bUln0A3OmG9b/QLCp30+Ki+LHYxcMg5SaHRU=; b=47njP3jBpD3Ceq
	nySasXZnbJcvInDBXbYder3vzZXQ2u4IrwqWC3bvbIqUkVOA2SIBWfpix105qgZxaBXGJJyfT6rQL
	kad3e4vU5/Bdd0bPpBgQLG0x/YBOOsqeCdZ7qugGtxoT/4YegVpNe2ZckUJ9aYd3oPCy/Id7SYGGG
	cKpOgTn6lwNCbyHHR29KCKqONznX2R9qhA/q9youMZEn7s4q/wSfBFw20TAAFepFzoAAwPAvET/50
	EcVpB1tP8uSxsZX2XAERxTmFuaXju6u2WHHoJohXdgJ1IIslGfXAn/3ImA81FvXgQSE9pA8/5ArBB
	9xF9XdK7SAKEKeZVlBnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvij-0000000AjL6-3GAp;
	Tue, 10 Dec 2024 08:35:53 +0000
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKvdu-0000000AiR1-20gg
	for linux-riscv@lists.infradead.org;
	Tue, 10 Dec 2024 08:30:56 +0000
Received: by mail-lf1-x130.google.com with SMTP id 2adb3069b0e04-540201cfedbso1562326e87.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Dec 2024 00:30:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733819452; x=1734424252; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=90ZkUIqsBdVLrJBG0q75ZwBWmjhC0C/y0EueSUVYRDg=;
        b=NUXqUqmonx4wRaiB4Lwekkw63WAYc1yhyYVOI+ChoVlZLwpjcctup2VYZqjcBV7QQe
         UnrPeXuCN/aZJmyj9XKsJHctat9MVFjBUtCUzVW1wH9Ewi2bN1ESF9IdO/5kyEn/Ho3G
         pSNgaH9cipuWbt9Y/a8l0v/9XWi9t8AgfpV2k7GXE35UTtlF75Hkc1Isxu60saQ7jPEV
         y/RK3PEAH6g1LGBVvWhURMajT+cbn0ZdunGGQVuYzPmeKej2oy5quSOZBeJbJrEbkE2u
         MHXPNAXM/S8wke/QQ8PR3D2Dg3DcsfBI/JkG6jAfMMga7wAHGq+OwQhc+/6AQyYSQ6zl
         wenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733819452; x=1734424252;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=90ZkUIqsBdVLrJBG0q75ZwBWmjhC0C/y0EueSUVYRDg=;
        b=ayiZkKjgLGxNWNl5fUOLxxwQ60AuS52Gdl/uhOXlnOs78GLiV+Y7xuDAj5pTOfAM+y
         4CyzPOk4KWXlXPAYV/1EldRku4fuP80fNt+3VNOCWQcZ6aZCwBO8PCIgVylhDfs2wl1m
         xO2qwdGRes8gWahWAFrogs4deZb1CYdWSK5P9m3x8xhBoC3b1WZIG45HsMJw6zC2Bn1x
         jDD2oOxTg8GCOobQhd0yE50XvQMovKn1UoysGg48j89lN+p1AH81WfAOqDJwG7sDOSVw
         ZfVLwrTzNxuS4/J0evJ2r3beRPjFotAkvQyi8NtpT56c77tRC5RZtXCU+DbP9+dxX2Da
         5kiA==
X-Forwarded-Encrypted: i=1; AJvYcCXLCb7JFIdV5PLrXXHUBd0IIkglkXgo4ohK15dps2WZGX4Mr/OdWHG1IOOKCQ2acA3GA031rkf/juTDfQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy8l6nOZjrc5Cansn7Ii8FeMOy0GY89Bx7FhvBS/qN+taSa7qT/
	foviJB6YjzRNEE8L82Qv6VA2CoAQyJFG4JLBPZ50TzHAXsSVIo9Y
X-Gm-Gg: ASbGncsNfDwJQ7yHQppSZByrNdXAk04/RS6iNPz1Y43djTAI7kCRre4HoZd7BDYCaba
	uopKEJqp/0tyf/nL9Cvy9fNVD7sRo3GxYyeqlsDgVoji3w+PDNXTWvnlnlfUKaHeQGoxpqxCniZ
	N8e/yHhE0IeVKLT9T2eO+L9v/hS5k8RDMu3k+NhDOmjZdmVeIEle+jfvnX5X6kcTKfORNd4n2lz
	M6bw5yHoORMGWg1UhqNNxHATY5/+HbOej8D4vKeFKSPGQKqBPTVczOAERccetSG/cF2lxf6eeIu
	rLiqFCsQwxMWqg==
X-Google-Smtp-Source: AGHT+IE5OZMXD5wGIi+gQNBFtFm/8ORVBm/3TlKPK1kt/NeR8RusvkrggIMTg8CDMExbsnpqReNNxg==
X-Received: by 2002:a05:6512:3c91:b0:53e:39c2:f021 with SMTP id 2adb3069b0e04-540240c0e6amr1174314e87.15.1733819451569;
        Tue, 10 Dec 2024 00:30:51 -0800 (PST)
Received: from wpc.yadro.com (host-95-152-63-227.dsl.sura.ru. [95.152.63.227])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e3745b0bbsm1216804e87.185.2024.12.10.00.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 00:30:50 -0800 (PST)
From: bigunclemax@gmail.com
To: 
Cc: bigunclemax@gmail.com,
	Drew Fustini <drew@pdp7.com>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yangtao Li <frank.li@vivo.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] clk: thead: Fix TH1520 emmc and shdci clock rate
Date: Tue, 10 Dec 2024 11:30:27 +0300
Message-ID: <20241210083029.92620-1-bigunclemax@gmail.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_003054_535212_D0D5ED25 
X-CRM114-Status: GOOD (  12.47  )
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

From: Maksim Kiselev <bigunclemax@gmail.com>

In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
is 198Mhz which is got through frequency division of source clock
VIDEO PLL by 4 [1].

But now the AP_SUBSYS driver sets the CLK EMMC SDIO to the same
frequency as the VIDEO PLL, equal to 792 MHz. This causes emmc/sdhci
to work 4 times slower.

Let's fix this issue by adding fixed factor clock that divides
VIDEO PLL by 4 for emmc/sdhci.

Link: https://github.com/revyos/thead-kernel/blob/7563179071a314f41cdcdbfd8cf6e101e73707f3/drivers/clk/thead/clk-light-fm.c#L454

Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS clocks")
Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 17e32ae08720..1015fab95251 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -779,6 +779,13 @@ static struct ccu_div dpu1_clk = {
 	},
 };
 
+static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
+			   &video_pll_clk.common.hw, 4, 1, 0);
+
+static const struct clk_parent_data emmc_sdio_ref_clk_pd[] = {
+	{ .hw = &emmc_sdio_ref_clk.hw },
+};
+
 static CCU_GATE(CLK_BROM, brom_clk, "brom", ahb2_cpusys_hclk_pd, 0x100, BIT(4), 0);
 static CCU_GATE(CLK_BMU, bmu_clk, "bmu", axi4_cpusys2_aclk_pd, 0x100, BIT(5), 0);
 static CCU_GATE(CLK_AON2CPU_A2X, aon2cpu_a2x_clk, "aon2cpu-a2x", axi4_cpusys2_aclk_pd,
@@ -798,7 +805,7 @@ static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", p
 		0x150, BIT(12), 0);
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, BIT(5), 0);
 static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, BIT(13), 0);
-static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", video_pll_clk_pd, 0x204, BIT(30), 0);
+static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, BIT(30), 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, BIT(26), 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, BIT(24), 0);
 static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, BIT(23), 0);
@@ -1059,6 +1066,10 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		return ret;
 	priv->hws[CLK_PLL_GMAC_100M] = &gmac_pll_clk_100m.hw;
 
+	ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
+	if (ret)
+		return ret;
+
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
 	if (ret)
 		return ret;
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
