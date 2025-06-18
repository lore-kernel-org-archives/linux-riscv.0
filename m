Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04228C7115F
	for <linux-riscv@archiver.kernel.org>; Wed, 18 Jun 2025 12:04:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ouAcsX3O7CXCoykjAM9TDqOZdDpTi5FpDR8LoZfJAqg=; b=CTt7qM3lVLjepQ
	t4zfTNwvZZ8nnORgkDu2vNi7DvSt67D8FIbl1kHb2HslUv+geh/10poU8MXTRzPyZ4LNEYzfUKfEV
	ZGHYAz1LGP1/p6V6ctM747QYR0gx5l3vXYOHe1MjqmiufO5xEedkKEuLRMuOO4A5mmXPyubfu0giL
	IMAROOP+YNDj9zGwO0dkyugdIojhpPHcItGn4/waxNnR1ldI/QqA163kfMs11GucXmLmwFmSflh8Y
	nr14Y+h4jXzJjgF1ga9l4LbifQbcLT5gzcz6DuJ1YNP9P3OipcRbqT1yrQ6cUSizmZRLxch4UZz8T
	p+KQrSM+rIls0/0tohNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrWP-0000000A3HR-3nHT;
	Wed, 18 Jun 2025 12:04:05 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRpwA-00000009lPE-3uq2
	for linux-riscv@lists.infradead.org;
	Wed, 18 Jun 2025 10:22:38 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250618102233euoutp01d0e5e4d4ae7d2347ea6d077059dfa705~KG-czbMhX1751217512euoutp01f
	for <linux-riscv@lists.infradead.org>; Wed, 18 Jun 2025 10:22:33 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250618102233euoutp01d0e5e4d4ae7d2347ea6d077059dfa705~KG-czbMhX1751217512euoutp01f
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750242153;
	bh=nmPS0sPAt4qb3c3Er5l8jv2713zfbZ8xRAVya1nW258=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Of61iESOhOos5QzheH28TL/TstjgtE3zZrx5CyUYTTAcpD50W2zWmCUB6/esEwGau
	 kFwbscRoFTb8VyIQnWhk1e3nIBjJWOGaiaqFeLkL2z+ow6Kii4xDfQGsVfj1zzM4vj
	 vNMGzpqnTktwtn639b3K1d7vS2ofmoVJKXmX4TQI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea~KG-cJzWOs2901029010eucas1p2a;
	Wed, 18 Jun 2025 10:22:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250618102231eusmtip19437912ce6303d292ed0cfee0bb4b2e8~KG-bKfN4o0930209302eusmtip1V;
	Wed, 18 Jun 2025 10:22:31 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Wed, 18 Jun 2025 12:22:13 +0200
Subject: [PATCH v5 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
MIME-Version: 1.0
Message-Id: <20250618-apr_14_for_sending-v5-7-27ed33ea5c6f@samsung.com>
In-Reply-To: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea
X-Msg-Generator: CA
X-RootMTR: 20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea
X-EPHeader: CA
X-CMS-RootMailID: 20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea
References: <20250618-apr_14_for_sending-v5-0-27ed33ea5c6f@samsung.com>
	<CGME20250618102233eucas1p228b24f58e4cb3d15b0f273530b582cea@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_032235_265063_9D397E48 
X-CRM114-Status: GOOD (  13.01  )
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

Add a device tree node for the IMG BXM-4-64 GPU present in the T-HEAD
TH1520 SoC used by the Lichee Pi 4A board. This node enables support for
the GPU using the drm/imagination driver.

By adding this node, the kernel can recognize and initialize the GPU,
providing graphics acceleration capabilities on the Lichee Pi 4A and
other boards based on the TH1520 SoC.

Add fixed clock gpu_mem_clk, as the MEM clock on the T-HEAD SoC can't be
controlled programatically.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index f3f5db0201ab8c0306d4d63072a1573431e51893..c8447eef36c3a6e92d768658b6b19dfeb59a47c4 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -225,6 +225,13 @@ aonsys_clk: clock-73728000 {
 		#clock-cells = <0>;
 	};
 
+	gpu_mem_clk: mem-clk {
+		compatible = "fixed-clock";
+		clock-frequency = <0>;
+		clock-output-names = "gpu_mem_clk";
+		#clock-cells = <0>;
+	};
+
 	stmmac_axi_config: stmmac-axi-config {
 		snps,wr_osr_lmt = <15>;
 		snps,rd_osr_lmt = <15>;
@@ -500,6 +507,21 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@ffef400000 {
+			compatible = "thead,th1520-gpu", "img,img-bxm-4-64",
+				     "img,img-rogue";
+			reg = <0xff 0xef400000 0x0 0x100000>;
+			interrupt-parent = <&plic>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_vo CLK_GPU_CORE>,
+				 <&gpu_mem_clk>,
+				 <&clk_vo CLK_GPU_CFG_ACLK>;
+			clock-names = "core", "mem", "sys";
+			power-domains = <&aon TH1520_GPU_PD>;
+			power-domain-names = "a";
+			resets = <&rst TH1520_RESET_ID_GPU>;
+		};
+
 		rst: reset-controller@ffef528000 {
 			compatible = "thead,th1520-reset";
 			reg = <0xff 0xef528000 0x0 0x4f>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
