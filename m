Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53BA8C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Apr 2025 17:25:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MucGTOfPAiNiwYthksgnOVEzRFELXzf5iYtHGRNRLxQ=; b=yOlLTWOkJbGQ/G
	7Aeds4No+WhPyVmbulyxfBbHrctyTacSv/WceOU/EDurVHqTXRDu315v75mJwvtAk5MT/0UE+Kf1n
	0k59i50gz4M42S+daDsv3FhhBWAkx/DcuhRRkhLlbC3kcdCe4vYKiHEXwMfk/5N3O+UYtUHsMWJ0W
	XqO50r+NTlP+ZmBAxJ73SkBfJVbntNofRw4wWqEjS7ih6xC2sSSHmQ98F2sbIhJ/UUVFxOt1qbi0m
	88zOh8/CjngVgC2e3RiYHi6X5KTc/pIYQx32bRfiB+ywB6t7lq6DWsfKt3OPU+3Yc8/dUDuRnGFqP
	WU4rcajUdn8SU9cs/elw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfMO-000000040IR-2Owx;
	Tue, 01 Apr 2025 17:25:12 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzfML-000000040Fw-3FTc
	for linux-riscv@lists.infradead.org;
	Tue, 01 Apr 2025 17:25:11 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 3D4FBEC59FF;
	Tue, 01 Apr 2025 10:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528309; bh=UEi+X0opYSOBwIaTJ9L7fBGwSzYPjuB8SAkUHzqDMpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DUeTCDdfAVv1Y7xtcJVYWxH34aLy509JtCmh6yrDvBHT+mpfzaBeEIffW4X2X1tZg
	 maTJlPm+Yxh7tl1ZGpmPeB3DoUvt1mqWwlxpbAgchxJ2RxxaWY17AxKpWmk6aeDv7k
	 xOi+0dRb/SgQI/EoxP2PB1Zhs2sTBhViDdnwzYi37bLRpZXRU4vUHglUBOlaLkpA9Q
	 9dwFaQ4xfAJ357GWbF2G4GbJ6E+Pml1scpsqKzKBf4vW1CipityUpBAh6gPeSm8vbt
	 VlL8Enokfj2f7dlvcBO2DV1vI2czp0bSSAVLIdv3LDdsMaRiZPhMMhJvn1o7YwD2N8
	 /4i3xNI8Y2a8A==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I-7M24s2H3k1; Tue,  1 Apr 2025 10:25:08 -0700 (PDT)
Received: from localhost.localdomain (unknown [183.217.81.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 405D7EC59F9;
	Tue, 01 Apr 2025 10:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1743528307; bh=UEi+X0opYSOBwIaTJ9L7fBGwSzYPjuB8SAkUHzqDMpY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=I5V0Kwfu19eg10Kz2m6Tghi4JitDOo3WUhjJ76ob2uAqQcY3KUQgURnUrzSo5HaKC
	 ultpXw+gQZYvVDKEQ6yKHJUBb3Vby3JE+WikS1NgA847n9BNrLcFQaSwcJoO8CfyFQ
	 9j2XrOx/Eq564WeSIocrqJuazxlqCBlUm0wdRJaH+SURyaK2WIfIyU/JrLiABbTYl6
	 +x27Q8IjeQG0y1Hwl9ZslB1uz06TzY+EjCUZMiE/c54o4oz+OpJsqCfNsBuS7S9gSQ
	 g221j1EblU7E6RgnzEnh4grINQrUk65xYDfiDRA40i+b1ils155ocIaHRrMgx+Qc5e
	 bCWO7iHjUtw/g==
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
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v6 4/6] clk: spacemit: k1: Add TWSI8 bus and function clocks
Date: Tue,  1 Apr 2025 17:24:32 +0000
Message-ID: <20250401172434.6774-5-heylenay@4d2.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250401172434.6774-1-heylenay@4d2.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_102509_839653_27E59CC0 
X-CRM114-Status: GOOD (  11.76  )
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
---
 drivers/clk/spacemit/ccu-k1.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cd95c4f9c127..5804c2f85407 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -397,6 +397,8 @@ CCU_MUX_GATE_DEFINE(twsi6_clk, twsi_parents, APBC_TWSI6_CLK_RST, 4, 3, BIT(1),
 		    0);
 CCU_MUX_GATE_DEFINE(twsi7_clk, twsi_parents, APBC_TWSI7_CLK_RST, 4, 3, BIT(1),
 		    0);
+CCU_GATE_DEFINE(twsi8_clk, CCU_PARENT_HW(pll1_d78_31p5), APBC_TWSI8_CLK_RST,
+		BIT(1) | BIT(0), 0);
 
 static const struct clk_parent_data timer_parents[] = {
 	CCU_PARENT_HW(pll1_d192_12p8),
@@ -528,6 +530,7 @@ CCU_GATE_DEFINE(twsi6_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI6_CLK_RST,
 		BIT(0), 0);
 CCU_GATE_DEFINE(twsi7_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TWSI7_CLK_RST,
 		BIT(0), 0);
+CCU_FACTOR_DEFINE(twsi8_bus_clk, CCU_PARENT_HW(apb_clk), 1, 1);
 
 CCU_GATE_DEFINE(timers1_bus_clk, CCU_PARENT_HW(apb_clk), APBC_TIMERS1_CLK_RST,
 		BIT(0), 0);
@@ -1059,6 +1062,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 	[CLK_TWSI5]		= &twsi5_clk.common.hw,
 	[CLK_TWSI6]		= &twsi6_clk.common.hw,
 	[CLK_TWSI7]		= &twsi7_clk.common.hw,
+	[CLK_TWSI8]		= &twsi8_clk.common.hw,
 	[CLK_TIMERS1]		= &timers1_clk.common.hw,
 	[CLK_TIMERS2]		= &timers2_clk.common.hw,
 	[CLK_AIB]		= &aib_clk.common.hw,
@@ -1110,6 +1114,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
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
