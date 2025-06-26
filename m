Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E054C7EE33
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Jun 2025 09:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtAR2hewNkmh4LUq4u5HpS43dmNBxl69d/NR8saJwxc=; b=k/kjNZX5Fx0b9g
	4tDFwa0jwYR4BAQDGoqtCx/awXmSn/hj6la2S1NKACW69M2SIDj2ovE9BUPTCjHB3bMwxMTfoR9NX
	MzMx3OpOQTeWUgVY/1Wm5WZg35QKeats9zhkC8wC/qgnuXkIAcOzH4OpTBRoc82hZTF393Dt1oOGD
	QiiUXqHmkhm/gI1d75BI+VeiioYt9nMnQtvj8AaKUnv3V5zP6rzD2zzP+Pj6KshCjRa8JgP0byO39
	vaMpagaLJavokl9uayfAOV3RWyzUKtuzuDubA+2GazsZJWpOmBiZ+gVM2rREvK7nEAzsqeoyWLJQc
	9+mP9GKVovDSfTgJSW6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjGH-0000000BCW6-0Mt9;
	Thu, 26 Jun 2025 09:51:17 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUizb-0000000B9Qj-01We
	for linux-riscv@lists.infradead.org;
	Thu, 26 Jun 2025 09:34:06 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250626093401euoutp018078df827006f6ecb4df002447999ca2~MjfWiaekz1973819738euoutp01L
	for <linux-riscv@lists.infradead.org>; Thu, 26 Jun 2025 09:34:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250626093401euoutp018078df827006f6ecb4df002447999ca2~MjfWiaekz1973819738euoutp01L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750930441;
	bh=1Qz2frHOGMzOwJqjCCNuU7DhR4H94Eb4H08fEn5LTWI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=Eu6MjwBS5/Mv5wHRx8VUNZpxvviu7Dvpe0PYvn7HvQHqiSYZGq9CX8v6svOsJUlcp
	 oq4N2Hc2qDDaTL2bJHZD2c82BQF2jf0EQvJl6R9YcVYQdVzwWaJK+axI2MBhcT5V5j
	 Iat4VvItKWWiZgG293DMF4xAlYsBtNiX/VNT/PX4=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250626093400eucas1p1b50fe1f64ac3f8c2d033740ef8f22424~MjfV8xhuF0084700847eucas1p1S;
	Thu, 26 Jun 2025 09:34:00 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250626093359eusmtip2e3e0225fb2b239ab68d3b189291b2043~MjfU1Cvxv0843508435eusmtip2q;
	Thu, 26 Jun 2025 09:33:59 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Thu, 26 Jun 2025 11:33:49 +0200
Subject: [PATCH v7 4/5] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
MIME-Version: 1.0
Message-Id: <20250626-apr_14_for_sending-v7-4-6593722e0217@samsung.com>
In-Reply-To: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
To: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,  Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,  Conor Dooley
	<conor+dt@kernel.org>,  Michal Wilczynski <m.wilczynski@samsung.com>, 
	Bartosz Golaszewski <brgl@bgdev.pl>, Philipp Zabel <p.zabel@pengutronix.de>,
	Frank Binns <frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>, 
	Drew Fustini <fustini@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250626093400eucas1p1b50fe1f64ac3f8c2d033740ef8f22424
X-Msg-Generator: CA
X-RootMTR: 20250626093400eucas1p1b50fe1f64ac3f8c2d033740ef8f22424
X-EPHeader: CA
X-CMS-RootMailID: 20250626093400eucas1p1b50fe1f64ac3f8c2d033740ef8f22424
References: <20250626-apr_14_for_sending-v7-0-6593722e0217@samsung.com>
	<CGME20250626093400eucas1p1b50fe1f64ac3f8c2d033740ef8f22424@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_023403_316388_7850FF61 
X-CRM114-Status: GOOD (  12.44  )
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
Reviewed-by: Drew Fustini <drew@pdp7.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
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
