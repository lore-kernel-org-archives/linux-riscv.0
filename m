Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E245C369A1
	for <linux-riscv@archiver.kernel.org>; Sat, 12 Apr 2025 07:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dUZEqMefwp+ERz0MbEcuJsLYmdqE+FPy29Ak6NiIzms=; b=EYzGid5FytBqZk
	GgPKELApJAv0FwGm/4Qz6YDkx4wxA+keY1d6HXxEiXL0vgwzvtloGEh0/F65ARka6Qm06r4ygvUw6
	JpEONaUwYRWh1QKSdZeYdnYyJnpPYeNftJyWX9FObic2+ae40QMhUOJd5bRzDiHS5Z6mJ86f+0Txa
	2KeLkF30kg4cYNXRGcbYGGjHxgEtUkLNUBgV94rv1voe5hPJt5tKgO3f4Qfc3z63i1rvGMdaJKfAS
	i6ckLAIZzmv/gox0u0B5IOqfbH3pkEAx8vxQP5uoWIK9Yu9OPRs1eHWYET+kCwjh6uGAnPYNLU2yw
	wVm/3e5zIww1dhpjOFgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VYJ-0000000FbQF-00ex;
	Sat, 12 Apr 2025 07:45:23 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u3VYH-0000000FbOn-1GA7
	for linux-riscv@lists.infradead.org;
	Sat, 12 Apr 2025 07:45:22 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id BD95B12FB450;
	Sat, 12 Apr 2025 00:45:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443920; bh=60ew7crDr8DvV2j6gmGZeej6P//qDQH+L46dS2BUgmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dC8m1qqT7UVpOmLkup2Ywo35JzIS4SbN5cj4bu8LS1CWNYuBQufyl8OJEPilZ5EG2
	 8yOQ0OBNKKqV53dvNWMyCEi7z8St8XXC2fOymfH47IiCuTNtuvIM7Y6pTW5PSF8PJx
	 zCWzqmbl+W8ErHsb/8oZl/7PZ/1Woa3nZKdjRxjCj/yKPHejEls5Lio3ZPuE+B6U9R
	 9hmzbxovHBbmww1fRaKA+KLK90LFQ/x5fFEWDA1QRzDqBU/x+iRoN06AVTkI7y39es
	 vojCcrATuD3T1iTEGb6Ktv8tq9x8rEJG7d6l0AsGdM4uzeQ2MuFFC6O0nNh2u4VCDG
	 qmJq0bPZDCnhg==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 59IF3k1xpjyu; Sat, 12 Apr 2025 00:45:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.239])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 81D8C12FB41C;
	Sat, 12 Apr 2025 00:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1744443919; bh=60ew7crDr8DvV2j6gmGZeej6P//qDQH+L46dS2BUgmI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=StfcRxYXqtYyZ/vyTaR1HXpAeFk6qfvkVKSH4luc5ajtwq2OOscjIXRXq63fmSTvd
	 E1c6pBENOWlI+EX5+XMTrwywhZQbaJZpnNyk2iFqdSTltVtKuezQokN70tQUvO52Qc
	 XGVpMEbDJQreGnsk60DSUtNsufM2OI7ejSya8J8Tc6AlvR7NkLGhQS1dp8G8bOcN80
	 TT3g8dUZ89hVT7Te+bXUAPMa4NrHpkd7H6KtVlHYunb0+qbNu4ULJUnImdAn62a8Cg
	 F3Hsq9KmUF+GD/RRuD959NHy0NFgBa+fo6SoISKXP5aXSkhqqgsnEPWe4mcUo1bbnp
	 eZ89gHpHoCIbQ==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>
Subject: [PATCH v7 4/6] clk: spacemit: k1: Add TWSI8 bus and function clocks
Date: Sat, 12 Apr 2025 07:44:22 +0000
Message-ID: <20250412074423.38517-6-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250412074423.38517-2-heylenay@4d2.org>
References: <20250412074423.38517-2-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250412_004521_381779_F8368995 
X-CRM114-Status: GOOD (  11.95  )
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

The control register for TWSI8 clocks, APBC_TWSI8_CLK_RST, contains mux
selection bits, reset assertion bit and enable bits for function and bus
clocks. It has a quirk that reading always results in zero.

As a workaround, let's hardcode the mux value as zero to select
pll1_d78_31p5 as parent and treat twsi8_clk as a gate, whose enable mask
is combined from the real bus and function clocks to avoid the
write-only register being shared between two clk_hws, in which case
updates of one clk_hw zero the other's bits.

With a 1:1 factor serving as placeholder for the bus clock, the I2C-8
controller could be brought up, which is essential for boards attaching
power-management chips to it.

Signed-off-by: Haylen Chu <heylenay@4d2.org>
Reviewed-by: Alex Elder <elder@riscstar.com>
---
 drivers/clk/spacemit/ccu-k1.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index f1ed9ae08939..a55957806db3 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -328,6 +328,12 @@ CCU_MUX_GATE_DEFINE(twsi4_clk, twsi_parents, APBC_TWSI4_CLK_RST, 4, 3, BIT(1), 0
 CCU_MUX_GATE_DEFINE(twsi5_clk, twsi_parents, APBC_TWSI5_CLK_RST, 4, 3, BIT(1), 0);
 CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1), 0);
 CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1), 0);
+/*
+ * APBC_TWSI8_CLK_RST has a quirk that reading always results in zero.
+ * Combine functional and bus bits together as a gate to avoid sharing the
+ * write-only register between different clock hardwares.
+ */
+CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST, BIT(1) | BIT(0), 0);
 
 static const struct clk_parent_data timer_parents[] = {
 	CCU_PARENT_HW(pll1_d192_12p8),
@@ -412,6 +418,8 @@ CCU_GATE_DEFINE(twsi4_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI4_CLK_RST, BIT(0
 CCU_GATE_DEFINE(twsi5_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI5_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST, BIT(0), 0);
+/* Placeholder to workaround quirk of the register */
+CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
 
 CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST, BIT(0), 0);
 CCU_GATE_DEFINE(timers2_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS2_CLK_RST, BIT(0), 0);
@@ -896,6 +904,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TWSI5]		= &twsi5_clk.common.hw,
 	[CLK_TWSI6]		= &twsi6_clk.common.hw,
 	[CLK_TWSI7]		= &twsi7_clk.common.hw,
+	[CLK_TWSI8]		= &twsi8_clk.common.hw,
 	[CLK_TIMERS1]		= &timers1_clk.common.hw,
 	[CLK_TIMERS2]		= &timers2_clk.common.hw,
 	[CLK_AIB]		= &aib_clk.common.hw,
@@ -947,6 +956,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TWSI5_BUS]		= &twsi5_bus_clk.common.hw,
 	[CLK_TWSI6_BUS]		= &twsi6_bus_clk.common.hw,
 	[CLK_TWSI7_BUS]		= &twsi7_bus_clk.common.hw,
+	[CLK_TWSI8_BUS]		= &twsi8_bus_clk.common.hw,
 	[CLK_TIMERS1_BUS]	= &timers1_bus_clk.common.hw,
 	[CLK_TIMERS2_BUS]	= &timers2_bus_clk.common.hw,
 	[CLK_AIB_BUS]		= &aib_bus_clk.common.hw,
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
