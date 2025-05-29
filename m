Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 625B1C5B555
	for <linux-riscv@archiver.kernel.org>; Thu, 29 May 2025 22:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GIGipPL4mjoqnFohJNK6pKHPv79Hm1epa71ZwDdoQ4Q=; b=rE5vKVPgU5jrrg
	bNXL159meRF3lsRdxHgMZVp52hbfLppOYAj7UujMEcKfPN1r5nHG9qqVLE/HGn7qlbdz0byweemX/
	4jqHMiR9SiHczDVmOuYpu63ILbZCdhzUKJ3H0dZ2vvNSJw2wxPxBExV7BIbHvv3zEn55QdyJH4dsH
	WFHTxNDb9K3sua8aRHs3zyewGR2JQvL9uoieDSbQsqDa5kbv53Id73PBxhSZkSGpfEqEHts4cURfz
	eyErsCgdaDLpDICUU7r5OO7mdYvRzeJI5ovqVK8gXSJB9fsFSVbpJH2KqphxJ3Cvx7qr2Voc6CThF
	d39wvTTJi+1uCzkJwwug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlfc-0000000GdXn-1OpW;
	Thu, 29 May 2025 22:24:16 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKlfX-0000000GdTz-1wuJ
	for linux-riscv@lists.infradead.org;
	Thu, 29 May 2025 22:24:13 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250529222410euoutp024648e363ece2500d5414f3cf599c463e~EH7ycbyLR2697926979euoutp02c
	for <linux-riscv@lists.infradead.org>; Thu, 29 May 2025 22:24:10 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250529222410euoutp024648e363ece2500d5414f3cf599c463e~EH7ycbyLR2697926979euoutp02c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1748557450;
	bh=iDKUS4/W4anCMc9efhu9LJv9bqq+RveQHjm6X16x1K4=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=dCo4LnRWzbECCNOWoukauv0ANlBhHJGWGXYMXYvikk5a8fbpA1qqD2GfAAXzBWOys
	 rsr1Zpl2JWu8UR1d44jOInxEDiWWpMxh+NJogCbgflXUJkfHDhKcGj7luBt/iHCwvY
	 VfsgcaTRGxvXbIj4WJKpF2+BzBGZc854MbzVF70Q=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333~EH7xQ4-m70456404564eucas1p2V;
	Thu, 29 May 2025 22:24:08 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250529222408eusmtip20e45fce43476667b7407ee8364f8de8a~EH7wV181P2867928679eusmtip2V;
	Thu, 29 May 2025 22:24:07 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 30 May 2025 00:23:53 +0200
Subject: [PATCH v3 6/8] riscv: dts: thead: Add GPU power sequencer node
MIME-Version: 1.0
Message-Id: <20250530-apr_14_for_sending-v3-6-83d5744d997c@samsung.com>
In-Reply-To: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
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
X-CMS-MailID: 20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333
X-Msg-Generator: CA
X-RootMTR: 20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333
X-EPHeader: CA
X-CMS-RootMailID: 20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333
References: <20250530-apr_14_for_sending-v3-0-83d5744d997c@samsung.com>
	<CGME20250529222408eucas1p20f62cea4c9c64bb5dda6db1fd38fb333@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250529_152411_773500_FB8E468D 
X-CRM114-Status: GOOD (  10.39  )
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

Add the device tree node for the T-HEAD TH1520 GPU power sequencer
(gpu_pwrseq) to the th1520.dtsi file.

This node instantiates the thead,th1520-gpu-pwrseq driver, which
is responsible for managing the GPU's power-on/off sequence. The node
specifies the gpu-clkgen reset, which is one of the resources
controlled by this sequencer.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index bdbb1b985b0b76cf669a9bf40c6ec37258329056..6170eec79e919b606a2046ac8f52db07e47ef441 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -238,6 +238,12 @@ aon: aon {
 		#power-domain-cells = <1>;
 	};
 
+	gpu_pwrseq: pwrseq {
+		compatible = "thead,th1520-gpu-pwrseq";
+		resets = <&rst TH1520_RESET_ID_GPU_CLKGEN>;
+		reset-names = "gpu-clkgen";
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
