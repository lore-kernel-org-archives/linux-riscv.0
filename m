Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E84B1C021B8
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Feb 2025 14:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:MIME-Version:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1oUYSlTOaT6QdrJJuVj0CG0+yAC+J5wAIHggLkzHO8A=; b=LAkR6scoKkdZtJ
	4xDfD7q6V5KqiEhk2p1WG3LnZSuSHI38HgD9x0hEprmXINvCkh2Uatd4LcgyU3WYNlNpqgfu/MQvO
	8ESKcxlu+upeJSyqbFtUjpgU3adgt+doAml0diQK4zETeEHyy1+rl0vnqZLzOjrB/FnbAUviKQqVo
	esnS4+LTPh8fyvtKYPIET4ARMDaN9K4MLIE9wmWoucXasRq0rGqrhjYt1t3tn0KfQzFQrHAmMpPrU
	K6Bdf+BITaP1xYDfWuB1W3buuazIqK1EoKc1MWRIKtOlRw5xh18D6m8YtP1Gqw1mVwwvdeB062NMR
	MyUZT91FzxqvH+KQ3A4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkhZ-0000000D9t3-1Ms1;
	Wed, 19 Feb 2025 14:05:25 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkkfG-0000000D8l7-1MQZ
	for linux-riscv@lists.infradead.org;
	Wed, 19 Feb 2025 14:03:03 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250219140301euoutp022b3e400e1883e8fbff67084a7dfc304c~loO9mHGyP0195001950euoutp02B
	for <linux-riscv@lists.infradead.org>; Wed, 19 Feb 2025 14:03:01 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250219140301euoutp022b3e400e1883e8fbff67084a7dfc304c~loO9mHGyP0195001950euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1739973781;
	bh=VhIBCc+eKDxBLZw1Fq8aGXRrjbktqWvu0yroBIpoWCg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QtqvtnFYwyEjWCpB/aTTEFqRukQHZ1wbAgp4qwshb81rAQeWZlRTMlgCTLuDiJwTe
	 gtJD2bqpCltpX486FBlSVPTai7Gtvj3SEqlzeEIlKLtkdjfE2hny9yec20/vK5xnDv
	 N1SC1Wh43dkRjc0grO2OwNnYj5VLZOfxZR7xjKVg=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTP id
	20250219140300eucas1p10673706f31abf0063f75ac8bec96ceee~loO9PTq4s1048910489eucas1p1D;
	Wed, 19 Feb 2025 14:03:00 +0000 (GMT)
Received: from eucas1p2.samsung.com ( [182.198.249.207]) by
	eusmges2new.samsung.com (EUCPMTA) with SMTP id 88.01.20409.494E5B76; Wed, 19
	Feb 2025 14:03:00 +0000 (GMT)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140300eucas1p2d776e747555020fd868cf04e55cd70e1~loO80IMaq2656926569eucas1p2i;
	Wed, 19 Feb 2025 14:03:00 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
	eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
	20250219140300eusmtrp215d846debea0e10fa293350e96f7d1bd~loO8zRJaS2432224322eusmtrp2s;
	Wed, 19 Feb 2025 14:03:00 +0000 (GMT)
X-AuditID: cbfec7f4-5f9ce24000004fb9-09-67b5e494de70
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
	eusmgms2.samsung.com (EUCPMTA) with SMTP id D5.52.19654.494E5B76; Wed, 19
	Feb 2025 14:03:00 +0000 (GMT)
Received: from AMDC4942.home (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250219140258eusmtip20b7b6f2d7823b1bc2d6da0c2539abae2~loO7fks-02874228742eusmtip2U;
	Wed, 19 Feb 2025 14:02:58 +0000 (GMT)
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
Subject: [PATCH v5 08/21] clk: thead: Add support for custom ops in
 CCU_GATE_CLK_OPS macro
Date: Wed, 19 Feb 2025 15:02:26 +0100
Message-Id: <20250219140239.1378758-9-m.wilczynski@samsung.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250219140239.1378758-1-m.wilczynski@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA02SfUxTZxTG9957e++lUnapbrxjbsw652YUlBnzJuLGhpobTczmxpwGNxu5
	KwQorIUx9yEySgesOGpYDAWsIJOCQwTaDojAqEjBj1ootLBINQIRGNgVcB9MZZSLm/895znP
	eX/nJC+Ni38mg+l4eSqnkEsTJaSQMHf+fWND4YhJtrHk0quoy1WOIdM/Ogr91GLDkL7DJkDu
	XiOG+u57SHR+1E6hsZZMAjkNpRTK6qwl0bjOTSKvxi1AjuYSEs3kdwBknlGRqKZjiEK19/UY
	KvOaCFTR2AyQOvesAPVc2YGG3F0EGndocKTWPY3mLzZS6JGzjkDF99ooZJzUCpC1Zh9StRUS
	kS+ynoFsip0cHyfYSzmzFNvyx2mCbdINUaym6Rpg66tzSfam8yLJnup+l731nRVjGyoyWFVN
	J8Z+/3Aj62ntJ9njxmrA9ma5qHfEB4QRsVxi/GecIuyNQ8K49mvn8BTDM5+fdZYTx0BtYB7w
	oyGzGerOd4E8IKTFjAFA71Q5xhezAPZmVuB8MQOgWa/FH49Yvh0m+EYlgO0FgyRfTAL4V9YZ
	ypcimXB4u1Iv8DVWMNkEzL6cuUjBmbsLb42UkL7UciYGthSfEPg0wayBD0o7Fxki5k2o0cwS
	PC8EtrVfX/Bp2o+JhK09wXwkEHYXjSxG8IVIlql4cVfI1Ahha0mOgJ/dDvuqbEt6OZywGile
	r4TzTXqM18nwtml66bavYJPGuqS3wpu2OdLHxZnXYG1zGG+/BfsLVZTPhkwAHJgK5FcIgCfM
	J3HeFsEctZhPvwJ/0OT/B7UZzEtQFk7bZ0ABWKV74hjdE8fo/ueeBng1COLSlEkyThku59JD
	ldIkZZpcFno4OakeLPztq4+ss42gcsIbagEYDSwA0rhkhUidYZSJRbHSI19wiuSPFWmJnNIC
	nqcJSZCovC1bJmZk0lQugeNSOMXjLkb7BR/Dtv2y8pzKP6p2T9KvyoPzr8MYuomNJprFL6e4
	PNvlBOY+Om2fWy9yumIDUmTH2+uetZ254d3vqBrw7i4WvvR72eE7e2PVu4rcssjLWMP+qGWl
	Bd096FPWo3WxE/FHlY5N69Jz66+uNtjVU2tvBSXYD/oHYWkfBT+Mjtnz9ftHDuSL74Q/8EoD
	hgfnVIaIZek7T2nT6xyOntX6LfOHtE+N3k19TzC8LxPFjXWGvdDnGYyS926I/2DrljHOFR0x
	GRI3bln1YULRbw2jxcyP5t3X+6/s3UFsu5D1tvxCf0jqTrEt916ENS/Zv7ynak2e67mRwoFP
	/lzbJUnLiF6/mSub/KbsSwmhjJNuWocrlNJ/Aa/eXvlKBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrKKsWRmVeSWpSXmKPExsVy+t/xe7pTnmxNN/i5jNPixPVFTBZbf89i
	t1iz9xyTxfwj51gt7l3awmRx5et7Not1Ty+wW7zY28hicW3FXHaL5mPr2SxezrrHZvGx5x6r
	xeVdc9gsPvceYbTY9rmFzWLtkbvsFuu/zmeyWPhxK4vFkh27GC3aOpexWlw85Wpx994JFouX
	l3uYLdpm8Vv837OD3eLftY0sFrPf7We32PJmIqvF8bXhFi37p7A4yHm8v9HK7vHm5UsWj8Md
	X9g99n5bwOKxc9Zddo+enWcYPTat6mTzuHNtD5vHvJOBHve7jzN5bF5S79Gy9hiTR/9fA4/3
	+66yefRtWcXocan5OnuAUJSeTVF+aUmqQkZ+cYmtUrShhZGeoaWFnpGJpZ6hsXmslZGpkr6d
	TUpqTmZZapG+XYJexsEzq5kLVohWLLu2iKWBcb1gFyMnh4SAicSh9scsXYxcHEICSxklHu14
	zwSRkJG41v2SBcIWlvhzrYsNougVo8S0vxfAitgEjCQeLJ/PCmKLCCxmkdi7rxKkiFngLaPE
	9ZkbwbqFBaIkGt59YwSxWQRUJf7MPcYMYvMK2Ev09HyB2iAvsf/gWaA4BwengIPEvotSIGEh
	oJJzffdZIcoFJU7OfAJWzgxU3rx1NvMERoFZSFKzkKQWMDKtYhRJLS3OTc8tNtIrTswtLs1L
	10vOz93ECEwv24793LKDceWrj3qHGJk4GA8xSnAwK4nwttVvSRfiTUmsrEotyo8vKs1JLT7E
	aAp09kRmKdHkfGCCyyuJNzQzMDU0MbM0MLU0M1YS52W7cj5NSCA9sSQ1OzW1ILUIpo+Jg1Oq
	gWktt+52j0Nuk3RETWtzJtwTNzohnOHu8POyArMb4yl+sTdWh1oLa1dcnLK89OGKposPNvGm
	3Pu3PCB4VW+b/9zdX877b1ympXvtc9Myk+W6krG5CbOtNY30dmf2nkkuPf30AOf6gF/nn/75
	XCHQmSl8PDPaWHLn9CdOR4+dCVp2abrYejkZFcuynunu25t6V+7oW7Kq/nX3ynSrhZn1R9oi
	eAtia2yON+u/kNUKLr20r+b5oa2JC2ZJ3OTi2Jr5KMU+LbLfwepH3BnbPZf369i6/p3vtLNg
	gz4j50eFKUli3nqquq93/m3fu/i07Ot7Lf7O0uazFyY4z7xYqPDA0mf/NBPW4KysmKDonh3p
	1kosxRmJhlrMRcWJACbtxqC4AwAA
X-CMS-MailID: 20250219140300eucas1p2d776e747555020fd868cf04e55cd70e1
X-Msg-Generator: CA
X-RootMTR: 20250219140300eucas1p2d776e747555020fd868cf04e55cd70e1
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20250219140300eucas1p2d776e747555020fd868cf04e55cd70e1
References: <20250219140239.1378758-1-m.wilczynski@samsung.com>
	<CGME20250219140300eucas1p2d776e747555020fd868cf04e55cd70e1@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250219_060302_643770_B0605C2A 
X-CRM114-Status: GOOD (  15.01  )
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

The IMG Rogue GPU requires three clocks: core, sys, and mem [1]. On the
T-HEAD TH1520 SoC, the mem clock gate is marked as "Reserved" in the
hardware manual (section 4.4.2.6.1) [2] and cannot be configured.

Add a new CCU_GATE_CLK_OPS macro that allows specifying custom clock
operations. This enables us to use nop operations for the mem clock,
preventing the driver from attempting to enable/disable this reserved
clock gate.

Link: https://lore.kernel.org/all/2fe3d93f-62ac-4439-ac17-d81137f6410a@imgtec.com [1]
Link: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf [2]

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/clk/thead/clk-th1520-ap.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 57972589f120..ea96d007aecd 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -89,6 +89,21 @@ struct ccu_pll {
 		}							\
 	}
 
+#define CCU_GATE_CLK_OPS(_clkid, _struct, _name, _parent, _reg, _gate, _flags,	\
+			 _clk_ops)						\
+	struct ccu_gate _struct = {						\
+		.enable	= _gate,						\
+		.common	= {							\
+			.clkid		= _clkid,				\
+			.cfg0		= _reg,					\
+			.hw.init	= CLK_HW_INIT_PARENTS_DATA(		\
+						_name,				\
+						_parent,			\
+						&_clk_ops,			\
+						_flags),			\
+		}								\
+	}
+
 static inline struct ccu_common *hw_to_ccu_common(struct clk_hw *hw)
 {
 	return container_of(hw, struct ccu_common, hw);
@@ -847,6 +862,11 @@ static CCU_GATE(CLK_SRAM1, sram1_clk, "sram1", axi_aclk_pd, 0x20c, BIT(3), 0);
 static CCU_GATE(CLK_SRAM2, sram2_clk, "sram2", axi_aclk_pd, 0x20c, BIT(2), 0);
 static CCU_GATE(CLK_SRAM3, sram3_clk, "sram3", axi_aclk_pd, 0x20c, BIT(1), 0);
 
+static const struct clk_ops clk_nop_ops = {};
+
+static CCU_GATE_CLK_OPS(CLK_GPU_MEM, gpu_mem_clk, "gpu-mem-clk",
+			video_pll_clk_pd, 0x0, BIT(2), 0, clk_nop_ops);
+
 static CCU_GATE(CLK_AXI4_VO_ACLK, axi4_vo_aclk, "axi4-vo-aclk",
 		video_pll_clk_pd, 0x0, BIT(0), 0);
 static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
@@ -1205,6 +1225,12 @@ static int th1520_clk_probe(struct platform_device *pdev)
 		ret = devm_clk_hw_register(dev, &emmc_sdio_ref_clk.hw);
 		if (ret)
 			return ret;
+	} else if (plat_data == &th1520_vo_platdata) {
+		ret = devm_clk_hw_register(dev, &gpu_mem_clk.common.hw);
+		if (ret)
+			return ret;
+		gpu_mem_clk.common.map = map;
+		priv->hws[CLK_GPU_MEM] = &gpu_mem_clk.common.hw;
 	}
 
 	ret = devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get, priv);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
