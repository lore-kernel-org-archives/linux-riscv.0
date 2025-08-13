Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8137CA0EE4
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Aug 2025 19:44:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vf2ipUz6V6Jx4UO0gG4iQSbm0f3roojRrfTqzRP1zeU=; b=NzaH5ZsF3cTWmV
	8BDNoDmXosJTWMPMDDcT4l1RbO7fg1DG5CuOGrvNd92u6JksguRyfO0jRuZUxYrGORAe8vUk5ASui
	adlLUc5EEEV7GkjNoOxJlj9PCReKgA6RgCqIhvVwIcYIACALiY0Yy3OdUvIpa2hQTCM2MIFNcUsl0
	dpcvvZ0dctMVQwrlqjAR9QdLhsUm5VLtF2hh8QBxTCugHociV5E5+ak2tCpYTV7c/5UHfpUiL+o2g
	qwGolceDD+N475pCfTZNrkVNfw1rOVJvOiRbKUDqoJIhWLRW2ERiqZXtzg6jHaqESGRD2biMcUaF1
	7fV+6FWtjEgz0Ro8r7Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umHOz-0000000EptK-3Jpr;
	Wed, 13 Aug 2025 19:44:49 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umF1E-0000000EYOC-48fF
	for linux-riscv@lists.infradead.org;
	Wed, 13 Aug 2025 17:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755105123; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X74hhdnBJMAtasZ6RnolPQcFaxE7Qj7hEqUs5Sndo7Dyjs+bBQPvi6CHau51knFzlPrb9zKJ1ICjPuNdBw48d21h34KZzE/52liJReh6N3JQ7b8iHwxkLeLCI/pbZMyJAvzprf+Gsc28wm6m50JhXW3axNE22aLxXeHxCvRKitY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755105123; h=Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=AH26u+CRfsSyZs8D6QdA2w4FMIPclZcydL3ktbsJNXY=; 
	b=RyjvCwFy2si5Z9Vi7gDR6eJat3gBpIIDLNREz4+EtzAiQ9CZPJIucgO6uZ30L3/tJBOvlC1HTUHJz2QMiaJAfwwcML5xh7mUWmcqZV0FNb5cZOr3J9oEIB8r3xfNkzg4Es/Mom8hl1D5HegBVJg615VmNd1ZpfkRv3UofGZZI1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755105123;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=AH26u+CRfsSyZs8D6QdA2w4FMIPclZcydL3ktbsJNXY=;
	b=fsJES7vxoUPtH68zK3KoG9hjar1y61p8w7je1P/N8KBhkdKuxsVGebeknwfZBPcf
	/4N0xH3ig0xIMwyMWmNtamVE4ZNBsropBdk720NSS6bLS5v8p+rkAMvlgSx+xJ6I6lB
	oFMLTaQXCcw7sHxNuZykWASLzI1P5KwAJ2elWV6HIOCdeKHKAFCmplM3fRRa4/hUTTS
	KE0eUtIDXUAayZQa6sfzyuHQ+L9QL0WEUI8H9I8qwW8pDz62QYCZDyKNj5XMPiK8OSh
	acSVYCHxknQz85ttCwmVY8z5+pROIvbr305dSVovcu/8gL8eo0lXSGdbo7ipUhdTUHS
	IaBILJO+Tg==
Received: by mx.zohomail.com with SMTPS id 1755105121243515.2930883745289;
	Wed, 13 Aug 2025 10:12:01 -0700 (PDT)
From: Icenowy Zheng <uwu@icenowy.me>
To: Drew Fustini <fustini@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Michal Wilczynski <m.wilczynski@samsung.com>,
	Yao Zi <ziyao@disroot.org>,
	Han Gao <rabenda.cn@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Icenowy Zheng <uwu@icenowy.me>
Subject: [PATCH 2/2] clk: thead: th1520-ap: fix parent of padctrl0 clock
Date: Thu, 14 Aug 2025 01:11:36 +0800
Message-ID: <20250813171136.2213309-3-uwu@icenowy.me>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813171136.2213309-1-uwu@icenowy.me>
References: <20250813171136.2213309-1-uwu@icenowy.me>
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250813_101209_083624_A8CDD6FC 
X-CRM114-Status: UNSURE (   8.97  )
X-CRM114-Notice: Please train this message.
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

The padctrl0 clock seems to be a child of the perisys_apb4_hclk clock,
gating the later makes padctrl0 registers stuck too.

Fix this relationship.

Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
---
 drivers/clk/thead/clk-th1520-ap.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
index d08e7fb387e50..f6f3d63d53353 100644
--- a/drivers/clk/thead/clk-th1520-ap.c
+++ b/drivers/clk/thead/clk-th1520-ap.c
@@ -888,13 +888,16 @@ static CCU_GATE(CLK_PERISYS_APB3_HCLK, perisys_apb3_hclk, "perisys-apb3-hclk", p
 		0x150, 11, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_PERISYS_APB4_HCLK, perisys_apb4_hclk, "perisys-apb4-hclk", perisys_ahb_hclk_pd,
 		0x150, 12, 0);
+static const struct clk_parent_data perisys_apb4_hclk_pd[] = {
+	{ .hw = &perisys_apb4_hclk.gate.hw },
+};
 static CCU_GATE(CLK_NPU_AXI, npu_axi_clk, "npu-axi", axi_aclk_pd, 0x1c8, 5, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_CPU2VP, cpu2vp_clk, "cpu2vp", axi_aclk_pd, 0x1e0, 13, CLK_IS_CRITICAL);
 static CCU_GATE(CLK_EMMC_SDIO, emmc_sdio_clk, "emmc-sdio", emmc_sdio_ref_clk_pd, 0x204, 30, 0);
 static CCU_GATE(CLK_GMAC1, gmac1_clk, "gmac1", gmac_pll_clk_pd, 0x204, 26, 0);
 static CCU_GATE(CLK_PADCTRL1, padctrl1_clk, "padctrl1", perisys_apb_pclk_pd, 0x204, 24, 0);
 static CCU_GATE(CLK_DSMART, dsmart_clk, "dsmart", perisys_apb_pclk_pd, 0x204, 23, 0);
-static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb_pclk_pd, 0x204, 22, 0);
+static CCU_GATE(CLK_PADCTRL0, padctrl0_clk, "padctrl0", perisys_apb4_hclk_pd, 0x204, 22, 0);
 static CCU_GATE(CLK_GMAC_AXI, gmac_axi_clk, "gmac-axi", axi4_cpusys2_aclk_pd, 0x204, 21, 0);
 static CCU_GATE(CLK_GPIO3, gpio3_clk, "gpio3-clk", peri2sys_apb_pclk_pd, 0x204, 20, 0);
 static CCU_GATE(CLK_GMAC0, gmac0_clk, "gmac0", gmac_pll_clk_pd, 0x204, 19, 0);
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
