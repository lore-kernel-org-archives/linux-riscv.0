Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D51BE7718D
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Dec 2024 14:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1ab3tJT9cn6G6tTM+j6fdiSc4FSru8Xywn8e5K0FGCs=; b=I7Bt0btFty8kOo
	81tD/9mq97d9rFalnBjwEuZ2eij/lJe7zmzgSm1y4GrBSHF2UfoCoIoG6HzcgnmKaINMJfi937g+L
	/2727aoKu5YqsUYeGVREE/NuGoJt9GzaEubrrSwE1YCVqPGahH0bJRdpeZNhIBTwD7Kg++MA4LqD2
	cBauq7I39FHm4RG8Sd68uKgCMm26dofvDPiMMGPRbFKhE4UuUsOz/ZwLhDZZfO+TFGchNTXiK0KqD
	Css2fN17NMYZqEpuXGHxlgoBjWlZ2BgaBClINJkqpoSFDAQgB5SDjH3HxmjW38EcrFU2nFzZLfmKk
	GgWBXl2ZBYUL9MD2d1Xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPj4a-0000000A7K4-2HkG;
	Mon, 23 Dec 2024 14:06:16 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPhz3-0000000A1Pn-13c1
	for linux-riscv@lists.infradead.org;
	Mon, 23 Dec 2024 12:56:30 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20241223125628euoutp02ceba5dd245ab9c5b42dfd5657766774d~Tz6TE245r1070510705euoutp02X
	for <linux-riscv@lists.infradead.org>; Mon, 23 Dec 2024 12:56:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20241223125628euoutp02ceba5dd245ab9c5b42dfd5657766774d~Tz6TE245r1070510705euoutp02X
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1734958588;
	bh=79TKUoIgn5bsQ0j4gX4SnusAyqeYKBaYJkTOM5ztHhw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Qy7qhplvvhy7XBQyZfmJDDK9BM60Euvr0eMOYDw6BVnRU1vpFu5p9xp3kHyyV1MuW
	 oA6PA6TCLFT6vb6jVmYae5DIp8Ws8CGk8bM7CKRU13JrcYItwVHk9Trt9JOVGDa7bw
	 KRgJl/p/MsvrmekPT4Na5ZNQhZCs5jXlxptcCtkI=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTP id
	20241223125627eucas1p262a100ead365c8854aaa8bab38b07e6c~Tz6SsSmLJ1252912529eucas1p2P;
	Mon, 23 Dec 2024 12:56:27 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id DE.1C.20409.BFD59676; Mon, 23
	Dec 2024 12:56:27 +0000 (GMT)
Received: from eusmtrp1.samsung.com (unknown [182.198.249.138]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20241223125626eucas1p137d01dbee3cb24c38c0d4aa46404c7d5~Tz6SEPV3B2314123141eucas1p1f;
	Mon, 23 Dec 2024 12:56:26 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
	eusmtrp1.samsung.com (KnoxPortal) with ESMTP id
	20241223125626eusmtrp1f31182f393cfee7c832a3275f530abe8~Tz6SDDCA72098220982eusmtrp1G;
	Mon, 23 Dec 2024 12:56:26 +0000 (GMT)
X-AuditID: cbfec7f4-c0df970000004fb9-0b-67695dfb6f83
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms1.samsung.com (EUCPMTA) with SMTP id FA.04.19920.AFD59676; Mon, 23
	Dec 2024 12:56:26 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20241223125625eusmtip2a5b953119c092d80f04961ad00fc292f~Tz6QszX0j2641026410eusmtip2o;
	Mon, 23 Dec 2024 12:56:25 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
To: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, drew@pdp7.com, guoren@kernel.org,
	wefu@redhat.com, jassisinghbrar@gmail.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, frank.binns@imgtec.com,
	matt.coster@imgtec.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	ulf.hansson@linaro.org, jszhang@kernel.org, p.zabel@pengutronix.de,
	m.szyprowski@samsung.com
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org, linux-pm@vger.kernel.org, Michal Wilczynski
	<m.wilczynski@samsung.com>
Subject: [RFC PATCH v2 19/19] riscv: dts: thead: Add GPU node to TH1520
 device tree
Date: Mon, 23 Dec 2024 13:55:53 +0100
Message-Id: <20241223125553.3527812-20-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223125553.3527812-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA01Sf1CTdRi/7/u+e9+X2ebr8PJ7mpIr7OwHIpV9u0rmCfXecRdEaV0cxa69
	ty35oZtkeVxKMG7AQEESGSAQxI8JkTAW7IAFEcOsmZhIBAM7iiCQ2ABBwcV4pfzv8/k8n+f5
	PM/dQ+OSb8jNtDr+KKeJl8dKSSFh6V50PHM3Wq0M/PtPKeq58QWGmu4aKVTb5sBQSZdDgJy9
	Zgz9MjdNoq/++JlCf7UlE6ivuphCKd31JBo3Okk0Y3AK0DVrEYncWV0AWdypJKrrGqJQ/VwJ
	hspmmghU0WwFKC29UoCu/hCKhpw9BBq/ZsBRmnE98rQ2U+he30UCFd6yUcg8mSNA9rq3Uaot
	j5BtY6f7dRQ7OT5OsN/pZym2bb6UYFuMQxRraPkRsA2mdJId7Gsl2fOX3mCHM+0Y21hxgk2t
	68bYU8uB7HT7dZLNNpsA25tyg4qQvCt8WcHFqj/iNLv2xghV+oYa8rBH+LFtYRQ7CZboDOBD
	Q+Y5WL5UJsgAQlrCVAM4PmAheTILYM2Um+KJG8CUcznkWku+ca1QBaDDdQXnySSArvZi3Osi
	mSA4UlWyOngjoyOg7vtk4CU4MwagZbRodZYvcwDaqvMpLyYYf5hdPLzaLWJkcObrsxif5wdt
	HT+t6j4rem1GP+A9G+ClglHCi/EVT0pT4eoakKkTQt1E6f3mENhi0wEe+8IJu5ni8SPw8hkD
	weMEONLkwnmcBFsM9vv4JTjouLOyKL0SsBPWW3fx8j444M6jvDJkxLB/agO/ghjmWvJxXhZB
	fZqEd++Anxuy/gt1VFsw3sLCjvMRp8F24wO3GB+4xfh/bCnATWATl6iNU3LaoHjuWIBWHqdN
	jFcGfJAQ1wBWfvvyPftsM6iamAnoBBgNOgGkcelGUadErZSIFPJPjnOahPc1ibGcthNsoQnp
	JpG/wo+TMEr5Ue4Qxx3mNGtVjPbZfBIzX4hsd1lHf9/yyrehN9veuz2j+E3cGCJWmzIXzn6Z
	XHvhQ1n0PEOFKawDvbvljSdeKEtPHjK59ohU4rFI4bO3VMJ3staFl4zkjAmeL4oVSLYJPl2K
	cciqqgdVN3utIQqXfjnpqufQZ7pCsmDrm7X0Dk9FQF5QlFh1p3Ii7VXnqXC/8JrWqfhBfc/p
	vRHSrWG+jz/2RFy73/7gA1nlx0ZiogKlT8msR6bt2HISWlzn7rn+cOXBMqJgPvKiK7hheN9B
	07nQNGXpkejbg6P+0tdH5j0RvwbXxTy907XfcuXRtxLxofXZ+iVxbtRrHXP/ZFYuHDdLhC/u
	aex+aDF1u6081xYbJiW0KvnuJ3GNVv4vFJVQf0oEAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrGKsWRmVeSWpSXmKPExsVy+t/xe7q/YjPTDTbOM7E4cX0Rk8XW37PY
	LdbsPcdkMf/IOVaLe5e2MFlc+fqezWLd0wvsFi/2NrJYXFsxl92i+dh6NouXs+6xWXzsucdq
	cXnXHDaLz71HGC22fW5hs1h75C67xfqv85ksFn7cymKxZMcuRou2zmWsFhdPuVrcvXeCxeLl
	5R5mi7ZZ/Bb/9+xgt/h3bSOLxex3+9kttryZyGpxfG24Rcv+KSwOch7vb7Sye7x5+ZLF43DH
	F3aPvd8WsHjsnHWX3aNn5xlGj02rOtk87lzbw+Yx72Sgx/3u40wem5fUe7SsPcbk0f/XwOP9
	vqtsHn1bVjF6XGq+zh4gFKVnU5RfWpKqkJFfXGKrFG1oYaRnaGmhZ2RiqWdobB5rZWSqpG9n
	k5Kak1mWWqRvl6CX0bFpJVvBf66K/T+eMDUw/uHoYuTkkBAwkZg+6zN7FyMXh5DAUkaJvV+v
	sUIkZCSudb9kgbCFJf5c62KDKHrFKNH5fgNYgk3ASOLB8vlgDSICi1kk9u6rBCliFnjLKHF9
	5kawImGBYInZZ36xg9gsAqoSfXPvM4PYvAIOEh83TGOC2CAvsf/gWbA4J1B8TdcNRhBbSMBe
	4t+pD2wQ9YISJ2c+AZvJDFTfvHU28wRGgVlIUrOQpBYwMq1iFEktLc5Nzy021CtOzC0uzUvX
	S87P3cQITDDbjv3cvINx3quPeocYmTgYDzFKcDArifAeEspMF+JNSaysSi3Kjy8qzUktPsRo
	CnT3RGYp0eR8YIrLK4k3NDMwNTQxszQwtTQzVhLndbt8Pk1IID2xJDU7NbUgtQimj4mDU6qB
	qe2GXUtiUrSczt1ZnGcv8i5ce2Tzi2cJTTEWdzsP8pV+3TZx5SeuFO225svvDpzmEZnz3emL
	XVfi6SWTA6aoyHTHTlm/Y2/1/69XZMUNYi97H5n8oFZlHfeqH9quv9wtTwcVy3huV+eO2D/j
	pcGLXJnqtzeOHeIo4jK48fH3z/x5p1YeV9T6xGl6S8lwWqD1ZtVvu2ZsU+zLXCi/vMWSM8Re
	v1RPR7H9AXeGzZqkMD5d2cZH+14Kykxa6lqx68WPbcz9ybYtQm98uOpzhf4Gsvqq7ly8oFdC
	ekNpfTWHJZtArcWV7nnPTyl9/Vpu9HNOm3blDOXcP+LJ7bU+H4/IzFm0x72St/vRt+0/vB7c
	VGIpzkg01GIuKk4EAO7N0Ve5AwAA
X-CMS-MailID: 20241223125626eucas1p137d01dbee3cb24c38c0d4aa46404c7d5
X-Msg-Generator: CA
X-RootMTR: 20241223125626eucas1p137d01dbee3cb24c38c0d4aa46404c7d5
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20241223125626eucas1p137d01dbee3cb24c38c0d4aa46404c7d5
References: <20241223125553.3527812-1-m.wilczynski@samsung.com>
	<CGME20241223125626eucas1p137d01dbee3cb24c38c0d4aa46404c7d5@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_045629_559887_F44F48BD 
X-CRM114-Status: GOOD (  12.42  )
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

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 arch/riscv/boot/dts/thead/th1520.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index c6fe2ea3197d..7e4b97f9e1b5 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -506,6 +506,19 @@ clk: clock-controller@ffef010000 {
 			#clock-cells = <1>;
 		};
 
+		gpu: gpu@ffef400000 {
+			compatible = "thead,th1520-gpu", "img,img-bxm";
+			reg = <0xff 0xef400000 0x0 0x100000>;
+			interrupt-parent = <&plic>;
+			interrupts = <102 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk CLK_GPU_CORE>,
+				 <&clk CLK_GPU_CFG_ACLK>;
+			clock-names = "core", "sys";
+			power-domains = <&pd TH1520_AON_GPU_PD>;
+			resets = <&rst TH1520_RESET_ID_GPU>;
+			reset-names = "gpu";
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
