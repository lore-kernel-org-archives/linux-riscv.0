Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EFFAC4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 01:07:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=05TlOHy08/3hWFGhB6xlJ9agsgPgwLXr3/3+vdDipME=; b=vahy7k78f1GpgO
	eenf2dHdH3bXN6IDwNUHH2oj2YYXQSLdCj5MIpZ30yL+TV+0rbGO9YdjUsZp/MARkTJKtxeGrnBXA
	0+mKe6Vum0wwk2yDAxtEgGL+ovAWamVGsgi5Ogm7SATQSSGcjoX35OIX5synT9McXboknnWUSzW3K
	zqu7i0STaDpbIq+U0w7AOZhyeAYu4yFAvAF5GrDp3Q9DR73SZeVD49pZqonbZuX6fsw3RsL1O27bB
	TQKddPNeK3SnAsW+YjD5oeiCkRxZVhK7bc6jrlX2fVCo9xf3JZaXGg3yMB5RFizI/zm1fdnI1RxmV
	DUht5ugvDGBXb9cVi6DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQb-00Cxpz-2w;
	Mon, 13 Nov 2023 01:07:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2LQW-00CxmV-2H
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 01:07:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 10FCDCE0FDA;
	Mon, 13 Nov 2023 01:07:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95996C433CC;
	Mon, 13 Nov 2023 01:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699837658;
	bh=ytHfU7p/l8yTC1DRGaIhHXhYJOUHNecTRODoCvWVCbg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=T2ujH9Nf9K0O6y6t0TvBjTkOQrqUTOcw+oSVWtmflT4R6Yf1nfHbRgvuSMKt9woxV
	 ZtEzkWP9sXbzNiljmyleWSsO4+Jis9umphWZCLTLgRbKy/ufJFB9wpPwN60jSLhtlE
	 WK9BRPEIX8Pc8h63mY9JP/ncinldTpLpx/IR+IQsWl274EjyJAdQ7h5lrCL8BLGIHc
	 0C92Kl18OKu0nH5jmIhBZAkQAw+E4iy5TAjIVNO19IYbPwXyJJTCxvpamXOWvom5XI
	 R5b+VNh1rOyraFprRjtekyQ/ZjWB7iGMPEqOMaWswyNgf0D/7RfiWyJ4PpDliaKmdJ
	 Xws60KmLzdCKA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/4] reset: Add reset controller support for Sophgo CV1800B SoC
Date: Mon, 13 Nov 2023 08:55:01 +0800
Message-Id: <20231113005503.2423-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231113005503.2423-1-jszhang@kernel.org>
References: <20231113005503.2423-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231112_170744_918266_6829B258 
X-CRM114-Status: GOOD (  12.19  )
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

Add reset controller support for Sophgo CV1800B SoC reusing the
reset-simple driver.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 drivers/reset/Kconfig        | 3 ++-
 drivers/reset/reset-simple.c | 2 ++
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index ccd59ddd7610..2034f69d5953 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -213,7 +213,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST || EXPERT
-	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
+	default ARCH_ASPEED || ARCH_BCMBCA || ARCH_BITMAIN || ARCH_REALTEK || ARCH_SOPHGO || ARCH_STM32 || (ARCH_INTEL_SOCFPGA && ARM64) || ARCH_SUNXI || ARC
 	depends on HAS_IOMEM
 	help
 	  This enables a simple reset controller driver for reset lines that
@@ -228,6 +228,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - SiFive FU740 SoCs
+	   - Sophgo SoCs
 
 config RESET_SOCFPGA
 	bool "SoCFPGA Reset Driver" if COMPILE_TEST && (!ARM || !ARCH_INTEL_SOCFPGA)
diff --git a/drivers/reset/reset-simple.c b/drivers/reset/reset-simple.c
index 7ea5adbf2097..573753ae3e08 100644
--- a/drivers/reset/reset-simple.c
+++ b/drivers/reset/reset-simple.c
@@ -151,6 +151,8 @@ static const struct of_device_id reset_simple_dt_ids[] = {
 	{ .compatible = "snps,dw-high-reset" },
 	{ .compatible = "snps,dw-low-reset",
 		.data = &reset_simple_active_low },
+	{ .compatible = "sophgo,cv1800b-reset",
+		.data = &reset_simple_active_low },
 	{ /* sentinel */ },
 };
 
-- 
2.42.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
