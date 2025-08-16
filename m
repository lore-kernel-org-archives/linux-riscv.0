Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47223CA0EE4
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Aug 2025 09:12:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WliiIy3q4AVqxlG/I61HPTYXnlE+oaqZrH1pyFHKAO0=; b=c8OfUY+YSX17K5
	84Dg3otyE4aYynhAe5VxsywFyOnBQ3TJ2mo6uXpqv3ShueAPS6gDJlaZa8iDIi0Cbnci8oeFunCsP
	8iUksSAxB75bOy/+Wc5OSTG2PSnhT0PSlOFfRvB63EtAuGIaGxVO1fqFF0m74Msx4INN7FUz1w0C1
	DBBOymFR711kb6qzaZY7umoPZ58ypyB5kQgiD3XuvaVt+RyjW7b4ASrpeEOwmCe0L0SUKVgzmK9pN
	hn8nKzVGcn+eQl+TwuvXgJAqhtouCkSmw3AnB9yjzffi4agweUIs/yH5bdOhqo3BXJEtpJbnWxPP/
	dyiFjlObY/3GSFH4gRSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCxO-00000004N1U-1ZCV;
	Sat, 16 Aug 2025 09:12:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCx7-00000004MzY-2PmA
	for linux-riscv@bombadil.infradead.org;
	Sat, 16 Aug 2025 09:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=fCVzUEHjBk9WIXhQ2mFElRGPPA6pTX38mHJTTDFKnsY=; b=Ao9DO8bHFKm7Jjpuwxqpb0jbE6
	2uwP2Qj/VR7VrxNWPtlBwjVW83YDFsmVIaLasQ0mEyTKSKDOmxMqjjFSYzSDXRL8mXRyO0uNu0s3G
	ShTD0mbYtYkuP7TrVUfXg4rqpH/6m+dmcKC6g09+CuaPFa6FECZKi5bysUfBsKj+W6gLgCb7U+Pwy
	IARoWlbi+D8u0JtMVZWy3aMR6LcmJ1iX71xYulatiGUuQq8dZ6hSOJ6s3wSV6tDaUF/YY0DlCAqwt
	3plduIl30d2kd3M6fWr3ZQ2UTn87fPVs6TuHefX9pmhX+Ec615421qfH6ZZFAtq+pWCSoRMyF091I
	MATFb8nA==;
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unCx3-0000000GwiS-2OCF
	for linux-riscv@lists.infradead.org;
	Sat, 16 Aug 2025 09:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755335499; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PVc6NoeTR6YKm0QNmvUEJqGNsofza7y17lApa9d1iXK1yzX5FGY4ZNPY3YtFFRnWFBiInwnTkFFAtReDzgNOK5PPN8T4dLhZ3MPUb4vyro4UVWrqHVOoRfQ1/ST50x8PLx0Y/3FNpZSKVk/qdL5Zy4p/ryiSVNC8RLrObVSxG24=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755335499; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fCVzUEHjBk9WIXhQ2mFElRGPPA6pTX38mHJTTDFKnsY=; 
	b=hKB3GaKCUFLy/e3dLOg7dBayC0GMg0U+MTIaH5G5JG0WHqCTEdvXAzG+Jzmd7VRk7aWLhoZCL8huET0z7vD+4d313jWv78NOaDtGoR2heskZvzlbPquNoh4YaOTX7/0wnrPKasmGvQ621O1qRZy4Mycc2+NZJrM5qC68jhWoiI8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755335499;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=fCVzUEHjBk9WIXhQ2mFElRGPPA6pTX38mHJTTDFKnsY=;
	b=ARPjtAaHoCheB7GM4nhAYyz0p0UMfVSgTSjwSUrpMamONbOnzQU8WJvuNul7tPKB
	b0yA6xBLsbzau7ryG47c4OWG4MUsStihQN/pt2ALtxGx8GtzSzk+KYcnub/zhIX++sa
	Q+8n5F+yr9aiO8Fuhj71JB1gdVLNz46dZeBpM875KIeXuXrTD22sJt6TQ7U7BdmyO07
	3VRg/Yvc0/TIPvubMpkh6rczdjwsA7b+cUZQr465CRwyBBegdFvhBm2gRtC2aJmWbp2
	kjsRgqJTU0vvUr+hPg3k36sHEgKs0lTtnuYsKypjP4GXcGGM6vrV32wy/5W2WF4z/zr
	3ZGqNXeKRg==
Received: by mx.zohomail.com with SMTPS id 1755335497092175.64907767078034;
	Sat, 16 Aug 2025 02:11:37 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	Yao Zi <ziyao@disroot.org>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH v3 1/4] clk: thead: Correct parent for DPU pixel clocks
Date: Sat, 16 Aug 2025 17:11:10 +0800
Message-ID: <20250816091113.2596048-2-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250816091113.2596048-1-uwu@icenowy.me>
References: <20250816091113.2596048-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250816_101150_186984_4DCBCA0C 
X-CRM114-Status: GOOD (  10.81  )
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

From: Michal Wilczynski <m.wilczynski@samsung.com>

The dpu0_pixelclk and dpu1_pixelclk gates were incorrectly parented to
the video_pll_clk.

According to the TH1520 TRM, the "dpu0_pixelclk" should be sourced from
"DPU0 PLL DIV CLK". In this driver, "DPU0 PLL DIV CLK" corresponds to
the `dpu0_clk` clock, which is a divider whose parent is the
`dpu0_pll_clk`.

This patch corrects the clock hierarchy by reparenting `dpu0_pixelclk`
to `dpu0_clk`. By symmetry, `dpu1_pixelclk` is also reparented to its
correct source, `dpu1_clk`.

Fixes: 50d4b157fa96 ("clk: thead: Add clock support for VO subsystem in T-HEAD TH1520 SoC")
Reported-by: Icenowy Zheng <uwu@icenowy.me>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
[Icenowy: add Drew's R-b and rebased atop ccu_gate refactor]
Reviewed-by: Drew Fustini <fustini@kernel.org>
Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
Pulled into this patchset in v3 because of rebasing.

 drivers/clk/thead/clk-th1520-ap.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index 8a5d699638379..ec52726fbea95 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -761,6 +761,10 @@ static struct ccu_div dpu0_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu0_clk_pd[] = {
+	{ .hw = &dpu0_clk.common.hw }
+};
+
 static struct ccu_div dpu1_clk = {
 	.div		= TH_CCU_DIV_FLAGS(0, 8, CLK_DIVIDER_ONE_BASED),
 	.common		= {
@@ -773,6 +777,10 @@ static struct ccu_div dpu1_clk = {
 	},
 };
 
+static const struct clk_parent_data dpu1_clk_pd[] = {
+	{ .hw = &dpu1_clk.common.hw }
+};
+
 static CLK_FIXED_FACTOR_HW(emmc_sdio_ref_clk, "emmc-sdio-ref",
 			   &video_pll_clk.common.hw, 4, 1, 0);
 
@@ -853,9 +861,9 @@ static CCU_GATE(CLK_GPU_CORE, gpu_core_clk, "gpu-core-clk", video_pll_clk_pd,
 static CCU_GATE(CLK_GPU_CFG_ACLK, gpu_cfg_aclk, "gpu-cfg-aclk",
 		video_pll_clk_pd, 0x0, 4, 0);
 static CCU_GATE(CLK_DPU_PIXELCLK0, dpu0_pixelclk, "dpu0-pixelclk",
-		video_pll_clk_pd, 0x0, 5, 0);
+		dpu0_clk_pd, 0x0, 5, 0);
 static CCU_GATE(CLK_DPU_PIXELCLK1, dpu1_pixelclk, "dpu1-pixelclk",
-		video_pll_clk_pd, 0x0, 6, 0);
+		dpu1_clk_pd, 0x0, 6, 0);
 static CCU_GATE(CLK_DPU_HCLK, dpu_hclk, "dpu-hclk", video_pll_clk_pd, 0x0,
 		7, 0);
 static CCU_GATE(CLK_DPU_ACLK, dpu_aclk, "dpu-aclk", video_pll_clk_pd, 0x0,
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
