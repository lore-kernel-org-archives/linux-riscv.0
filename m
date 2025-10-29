Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A353DCCF9F1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Oct 2025 16:34:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JQnWEnIJoONFmrqeMb5urj3vaOcyQ1dKuCT9J13qrF0=; b=1Oznl0070RZjre
	8IY5uoNI5yLzhrepRlxPhDnwCC7VZki0fDU5nxFM4sUp4BWrIOsb94mIHUcK9l1MPcX/7RFVtxwEW
	J/sUieNukQcFb2bTyw6TFEU44vL1Lfp6FVGwkFBP+MsCvm1EvgX57PKBfnZDIbeyTgELiVDGUUPX6
	InsAR5H7PrXIY0qAn7FhkNSZpEOUa7HrHiXmtJXmJzCKZEtx3QMy9m9GjFddqaxrAVEPgI8iK3bV9
	eOapoARxa5h+G2l3QIwuMMU17LL7PZACBobSzsDv08uaSmiw49+M2F0VG//TtUJFBXgclLiepkSKC
	B4ZuCgtt/kcUWJ0H1RRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97b-000000021bA-20AU;
	Wed, 29 Oct 2025 16:34:03 +0000
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE97U-000000021RH-05TT
	for linux-riscv@lists.infradead.org;
	Wed, 29 Oct 2025 16:33:57 +0000
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-b6d3340dc2aso27662866b.0
        for <linux-riscv@lists.infradead.org>; Wed, 29 Oct 2025 09:33:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761755634; x=1762360434; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=OVj6w+7WJed9COFABr0ZF0wFrGrswzVDHGrIS8PA8RpbS3ky+Mu+BckC1Ae3z9LzXb
         ANHZEtGXiUQD7RR4wHc533N2vyOrGDyS0DTu5FmwWmERzNR7uAl/crbRENsBUdfvJdd8
         mly/5zoCDYaCOr2jSxy2TgdTyH8baDdjlqzqcFI3gFtzk8XFLeFj31bivQfwTdVI2lLx
         eIoTEWiYTba/KtxvDbzCptQzP9m1lLOmvMsXBbMrZNOqRBBAHXI16bT+H2y54VNbsL62
         1/HYYeMcjPpebCH4yE5hbmKkBhGYhSRv0d3XY3Ra6KQxsomjg4XE6bk6jEaBYXpHp0dR
         mbSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761755634; x=1762360434;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D7niwucTDN3MnvT2f7z1+zCVDCBNmgQwG7r5182Kk6g=;
        b=uGKRF6kEkV/ns9jK1oBwN+zAx6OOT4oLfGB4369Zn0FNcHcxA7Nx9cNMVSF7L6DK8w
         PAo9aDFy3Gq1rl1kbkuWDCr9hnKEtQO7D5a1rIHvZ/dtlwKff70bNDVCU7kDlPzLjJui
         J+wiYKN7v82jLe1QVl97zRFPy7/trXNlxPrqhnz4GjXfCQbKkDDXWYUVroVJrOBvuwuG
         0NMtPc0CsdDqR/JC8Yt6Av9EZDFGWTDicf0yzooor60BpX1+zDAXhVJIqv6+fZVpS7t8
         6ELq+jbpov2Wx0Q18O8Eie87UABBUctzf2dTwfqlLsKYNfJtzpsNlrKJZVxCvqxdUUxm
         h3mA==
X-Forwarded-Encrypted: i=1; AJvYcCVp9bGC+2BXe6WJYsHYfzaPa8VTdQQV9+Mn+SoItB4D+da0vy1TQeRKgT2NRaFFKs97PnvQatqerqDLRA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxBsux3QDowqcHytnvD9mSOP0O34LOGmkP0/yK5UG0ai9tjIK81
	KQh6DddN8zXFGI9fbbSmJkDzXlOHUBQRINx333F0l3bBOOvd5p1KmHWRa9BGhQ==
X-Gm-Gg: ASbGnctDJKG3l7bZNe2HNzMe7qOs0iqU+2IMGd/bj2qUxD9idr9IOeBSV/hczfqHw4o
	p/zh4FaQrfY4F3leika623O+r2HFABfk5cwzPHhj5e0DfLiaQ0wj3A4LOu9ptTeHvAMGz4Iw7LF
	xc5OTXohCv0iKYZwQCvubOl4ASqaGuD7cGNG/rJCoyVn/BsT0LRWwodkSORIRPgebFr78EGbBN8
	P+yoqCOjNi6yjMkeSQpTt+Y2YDgpRQqzHjRilyi0qFarVZxVd7qjchgOjvs/r9AsJLslsz0+UnD
	2Ata3Vu04/+SkyWfHNsiyDp1e37VhKpfk/n2W8Gq9dnO9UYqJSYJHgVyahC2DtyC3Y45C31lmAg
	RmIWmcewIm9+6ShRdirnCuRdxP9LIJKuD0GoFtjtkxWpyDfOmmzji7KgV5Gz52oO9Kgt5ofINZA
	tQBaCdrh+X6O01KdU0HIQoFPXldux+9AdGHSAb0Zvo2fgS9yF1q/u+6r26FMCeTSD9h5Hh
X-Google-Smtp-Source: AGHT+IGxst0GGPbE3zlpzuYvmZD7MtT+fgNns/2gbspQBUcAcExwpAJ9gNyBIh9hmr+9IwgchPtgzg==
X-Received: by 2002:a17:906:6a21:b0:b3f:f6d:1d9e with SMTP id a640c23a62f3a-b7051f278acmr28890666b.6.1761755633985;
        Wed, 29 Oct 2025 09:33:53 -0700 (PDT)
Received: from localhost (p200300e41f274600f22f74fffe1f3a53.dip0.t-ipconnect.de. [2003:e4:1f27:4600:f22f:74ff:fe1f:3a53])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-b6d853696a3sm1468789266b.27.2025.10.29.09.33.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 09:33:52 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: x86@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-mips@vger.kernel.org,
	loongarch@lists.linux.dev,
	linuxppc-dev@lists.ozlabs.org,
	linux-sh@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 5/7] clk: mvebu: Use contextual data instead of global variable
Date: Wed, 29 Oct 2025 17:33:34 +0100
Message-ID: <20251029163336.2785270-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029163336.2785270-1-thierry.reding@gmail.com>
References: <20251029163336.2785270-1-thierry.reding@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_093356_082537_D1DAC148 
X-CRM114-Status: GOOD (  15.16  )
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

From: Thierry Reding <treding@nvidia.com>

Pass the driver-specific data via the syscore struct and use it in the
syscore ops.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
Changes in v3:
- adjust for API changes and update commit message

 drivers/clk/mvebu/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/drivers/clk/mvebu/common.c b/drivers/clk/mvebu/common.c
index 5adbbd91a6db..8797de93472c 100644
--- a/drivers/clk/mvebu/common.c
+++ b/drivers/clk/mvebu/common.c
@@ -189,6 +189,7 @@ void __init mvebu_coreclk_setup(struct device_node *np,
 DEFINE_SPINLOCK(ctrl_gating_lock);
 
 struct clk_gating_ctrl {
+	struct syscore syscore;
 	spinlock_t *lock;
 	struct clk **gates;
 	int num_gates;
@@ -196,11 +197,10 @@ struct clk_gating_ctrl {
 	u32 saved_reg;
 };
 
-static struct clk_gating_ctrl *ctrl;
-
 static struct clk *clk_gating_get_src(
 	struct of_phandle_args *clkspec, void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
 	int n;
 
 	if (clkspec->args_count < 1)
@@ -217,12 +217,16 @@ static struct clk *clk_gating_get_src(
 
 static int mvebu_clk_gating_suspend(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	ctrl->saved_reg = readl(ctrl->base);
 	return 0;
 }
 
 static void mvebu_clk_gating_resume(void *data)
 {
+	struct clk_gating_ctrl *ctrl = data;
+
 	writel(ctrl->saved_reg, ctrl->base);
 }
 
@@ -231,13 +235,10 @@ static const struct syscore_ops clk_gate_syscore_ops = {
 	.resume = mvebu_clk_gating_resume,
 };
 
-static struct syscore clk_gate_syscore = {
-	.ops = &clk_gate_syscore_ops,
-};
-
 void __init mvebu_clk_gating_setup(struct device_node *np,
 				   const struct clk_gating_soc_desc *desc)
 {
+	static struct clk_gating_ctrl *ctrl;
 	struct clk *clk;
 	void __iomem *base;
 	const char *default_parent = NULL;
@@ -288,7 +289,9 @@ void __init mvebu_clk_gating_setup(struct device_node *np,
 
 	of_clk_add_provider(np, clk_gating_get_src, ctrl);
 
-	register_syscore(&clk_gate_syscore);
+	ctrl->syscore.ops = &clk_gate_syscore_ops;
+	ctrl->syscore.data = ctrl;
+	register_syscore(&ctrl->syscore);
 
 	return;
 gates_out:
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
