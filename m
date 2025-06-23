Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6F70C83000
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EtAR2hewNkmh4LUq4u5HpS43dmNBxl69d/NR8saJwxc=; b=RxCa0NwQxPp3kg
	w5hTR3DATWj4JjEeh52Ylyz5YKkd9lszGpa9CLYjf0bg7MYwfuSKxkuytBEqh7SUI+P1HFWew7lV3
	G1huJELilatFhB2G9yUZb22hm+9aLLlYeCl/UIhzS7A13Dh0wEBieKfv2dUfkX1qjYGE2z3S9avHi
	E/Bx+Tk+5NMkkiG1W3RzWMzsv3hpFeezsryHeqnApkQhjRp0jxI+iiEaRxDoZ+WJAZArT2e1HAKmG
	uNJOLsifmk0dx8M/h26PIlxeieK58AHL8V34QT5uTrEpipT243mUpln870qroZg8Jwt0BYNCUcG9z
	eYEamu1j0NDeAWTm/70Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh33-00000002qIn-23nd;
	Mon, 23 Jun 2025 13:17:21 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbO-00000002XUN-3FGY
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 11:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=1Qz2frHOGMzOwJqjCCNuU7DhR4H94Eb4H08fEn5LTWI=; b=VKJsw9TRX0EXV8qI0r6+WL1LCp
	c8eVvyAbPIDb4LaqfWZie3UmqmovEMnyRiVuX/f5JFYCeJS4Lu8QSE1a7t00WJWDRugWG2CMjqN9a
	2sh7LrLmpIOzjZAqH2fxl570TfUe27iep+KwU7qKrbRQIwBPFDPmcfkRjHWHPwXQnS9HQcowWBUit
	4Ztw3vBluUuTtuEr5XfIYakCDx8S9UKecK+bCjFBkqCx0NGzi5WNNiQpHpDOrpeDuX1gTSHELHr54
	a0t19v/LssCAl8dwMZC+kzLG838dpUBlNClWjYou18cpteqnfaaehIWQUGZQMHgx26b2N+z7ZAIdK
	vC2ep/1A==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbM-00000005CeV-0oiA
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 11:44:41 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250623114439euoutp02b15a4fb10b84e0bb6ee1f4d3e015fc70~LqVjhHatm1537015370euoutp02T
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 11:44:39 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250623114439euoutp02b15a4fb10b84e0bb6ee1f4d3e015fc70~LqVjhHatm1537015370euoutp02T
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750679079;
	bh=1Qz2frHOGMzOwJqjCCNuU7DhR4H94Eb4H08fEn5LTWI=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=E8Ka+ibXzi1Js264oy2eWQ6NNKewyJ7JW29UQjCovW7q2S/u5VpG8ndTmvgPGOkpi
	 ZSwFfgrB9zRKpUIh+9SXSxvtGXHE4bb5FoB0Q/O24ZWV4gZsbsGeomCWqJ7JRffXJ7
	 mfmHBl79RTmbCeNY7Im78QuZFGJ4N9ZzL62v9TOM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250623114438eucas1p2fbb66bfe21ec19a0459eccc8cfe47849~LqVi1wRGv2907629076eucas1p2m;
	Mon, 23 Jun 2025 11:44:38 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114437eusmtip11c14bfa1a673d341b8bcddad4c7aa9ec~LqVhycMO81631916319eusmtip1O;
	Mon, 23 Jun 2025 11:44:37 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 13:42:45 +0200
Subject: [PATCH v6 7/8] riscv: dts: thead: th1520: Add IMG BXM-4-64 GPU node
MIME-Version: 1.0
Message-Id: <20250623-apr_14_for_sending-v6-7-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
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
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114438eucas1p2fbb66bfe21ec19a0459eccc8cfe47849
X-Msg-Generator: CA
X-RootMTR: 20250623114438eucas1p2fbb66bfe21ec19a0459eccc8cfe47849
X-EPHeader: CA
X-CMS-RootMailID: 20250623114438eucas1p2fbb66bfe21ec19a0459eccc8cfe47849
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114438eucas1p2fbb66bfe21ec19a0459eccc8cfe47849@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124440_490454_05E8F07B 
X-CRM114-Status: GOOD (  12.97  )
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
