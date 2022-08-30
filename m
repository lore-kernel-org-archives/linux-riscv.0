Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B36E4ECAAD4
	for <linux-riscv@archiver.kernel.org>; Tue, 30 Aug 2022 12:53:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+IXJijHM1jypRhhPZJYwjKhqRoKrEEqR+nO6ubGRQAc=; b=iuQQRYF8eSFxx6
	QpX+O5lbcBoyZKsrl3DhwfkmGosIALrtbsufMxbaX2USLACtGnqcD+BBvFZs9BigiWKk996d3f5IJ
	VqqMOhmmmXlUTuhJ8NLGjy6JM2V11u5R5REU39NxTRAY/IVP0bwTWoL8dFBf3z1DWQyx1y/lwnteT
	2cQXwHaqwvDsXWqd59YN9XUqKIJc35Qb13LlKrUx7mrprG+4jJ7ywYOFgbUmfUVAHBX9HcX5Iw17f
	KJ8LQqRj4DKHd/woutZa0mEt2dU51J4fg/JgU0zn1AUzWBmhiZkZBTM9C+REuv3f/8uUrRvlsgVkV
	WSRZrlFYWwnQZXGKstfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0kB-00H1Zl-Ga; Tue, 30 Aug 2022 12:53:27 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oT0k3-00H1VK-IY
	for linux-riscv@lists.infradead.org; Tue, 30 Aug 2022 12:53:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1661864000; x=1693400000;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Na5ymG3WsoWgpmp/AyB5cJm9j+CWRAHLF47sr1rq6nk=;
  b=MjQ4Vw2PCSu1UGHaeaY3iBf5QdxupFRfzn9WUpq+eO/4jHEAR35J9yXQ
   Y0M2wXxPLasn06qWeumCriHVQTsV/TPTj8iNmZm+XeuwjX9Yvk5OALEhk
   bsKHNxatXAPciTuoeDJLKKAVCRkqzTNXEgM3miMrp04bEqaxeZMf5sFwG
   txdEpWIVxyCT7cSmS5EWm6oG6Wy6ZWw0U5SpUX4199XmLNr5SrKPS8Rye
   66HXpTs7nBAAxfqiXH9MAUkkbQQ6TA4VZORewmFTOqHqW2mf4uCW2pWsr
   m2ms3KaPhpfLZl+hK0QTxnCSd/3EHnRCJkITioP9dff1XyxtyBvG5xv7t
   Q==;
X-IronPort-AV: E=Sophos;i="5.93,275,1654585200"; 
   d="scan'208";a="178301544"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 30 Aug 2022 05:53:19 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Tue, 30 Aug 2022 05:53:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.12 via Frontend
 Transport; Tue, 30 Aug 2022 05:53:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor.dooley@microchip.com>, Daire McNamara
	<daire.mcnamara@microchip.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Claudiu Beznea <claudiu.beznea@microchip.com>,
	<linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, "Nathan
 Chancellor" <nathan@kernel.org>
Subject: [PATCH v4 01/13] clk: microchip: mpfs: fix clk_cfg array bounds violation
Date: Tue, 30 Aug 2022 13:52:38 +0100
Message-ID: <20220830125249.2373416-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220830125110.2372514-1-conor.dooley@microchip.com>
References: <20220830125110.2372514-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220830_055323_819797_F7104F91 
X-CRM114-Status: GOOD (  14.53  )
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

Unnoticed in current code, there is an array bounds violation present
during clock registration. This seems to fail gracefully in v6.0-rc1,
and life carrys on. While converting the driver to use standard clock
structs/ops, kernel panics were seen during boot when built with clang:

[    0.581754] Unable to handle kernel NULL pointer dereference at virtual address 00000000000000b1
[    0.591520] Oops [#1]
[    0.594045] Modules linked in:
[    0.597435] CPU: 0 PID: 1 Comm: swapper/0 Not tainted 6.0.0-rc1-00011-g8e1459cf4eca #1
[    0.606188] Hardware name: Microchip PolarFire-SoC Icicle Kit (DT)
[    0.613012] epc : __clk_register+0x4a6/0x85c
[    0.617759]  ra : __clk_register+0x49e/0x85c
[    0.622489] epc : ffffffff803faf7c ra : ffffffff803faf74 sp : ffffffc80400b720
[    0.630466]  gp : ffffffff810e93f8 tp : ffffffe77fe60000 t0 : ffffffe77ffb3800
[    0.638443]  t1 : 000000000000000a t2 : ffffffffffffffff s0 : ffffffc80400b7c0
[    0.646420]  s1 : 0000000000000001 a0 : 0000000000000001 a1 : 0000000000000000
[    0.654396]  a2 : 0000000000000001 a3 : 0000000000000000 a4 : 0000000000000000
[    0.662373]  a5 : ffffffff803a5810 a6 : 0000000200000022 a7 : 0000000000000006
[    0.670350]  s2 : ffffffff81099d48 s3 : ffffffff80d6e28e s4 : 0000000000000028
[    0.678327]  s5 : ffffffff810ed3c8 s6 : ffffffff810ed3d0 s7 : ffffffe77ffbc100
[    0.686304]  s8 : ffffffe77ffb1540 s9 : ffffffe77ffb1540 s10: 0000000000000008
[    0.694281]  s11: 0000000000000000 t3 : 00000000000000c6 t4 : 0000000000000007
[    0.702258]  t5 : ffffffff810c78c0 t6 : ffffffe77ff88cd0
[    0.708125] status: 0000000200000120 badaddr: 00000000000000b1 cause: 000000000000000d
[    0.716869] [<ffffffff803fb892>] devm_clk_hw_register+0x62/0xaa
[    0.723420] [<ffffffff80403412>] mpfs_clk_probe+0x1e0/0x244

It fails on "clk_periph_timer" - which uses a different parent, that it
tries to find using the macro:
\#define PARENT_CLK(PARENT) (&mpfs_cfg_clks[CLK_##PARENT].cfg.hw)

If parent is RTCREF, so the macro becomes: &mpfs_cfg_clks[33].cfg.hw
which is well beyond the end of the array. Amazingly, builds with GCC
11.1 see no problem here, booting correctly and hooking the parent up
etc. Builds with clang-15 do not, with the above panic.

Drop the macro for the RTCREF and use the array directly to avoid the
panic, using a newly added define that brings the index into the valid
range.

Fixes: 1c6a7ea32b8c ("clk: microchip: mpfs: add RTCREF clock control")
CC: Nathan Chancellor <nathan@kernel.org>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/clk/microchip/clk-mpfs.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/microchip/clk-mpfs.c b/drivers/clk/microchip/clk-mpfs.c
index 070c3b896559..9e41f07b3fa6 100644
--- a/drivers/clk/microchip/clk-mpfs.c
+++ b/drivers/clk/microchip/clk-mpfs.c
@@ -27,6 +27,8 @@
 #define MSSPLL_POSTDIV_WIDTH	0x07u
 #define MSSPLL_FIXED_DIV	4u
 
+#define RTCREF_OFFSET		(CLK_RTCREF - CLK_ENVM)
+
 struct mpfs_clock_data {
 	void __iomem *base;
 	void __iomem *msspll_base;
@@ -381,7 +383,8 @@ static struct mpfs_periph_hw_clock mpfs_periph_clks[] = {
 	CLK_PERIPH(CLK_MAC0, "clk_periph_mac0", PARENT_CLK(AHB), 1, 0),
 	CLK_PERIPH(CLK_MAC1, "clk_periph_mac1", PARENT_CLK(AHB), 2, 0),
 	CLK_PERIPH(CLK_MMC, "clk_periph_mmc", PARENT_CLK(AHB), 3, 0),
-	CLK_PERIPH(CLK_TIMER, "clk_periph_timer", PARENT_CLK(RTCREF), 4, 0),
+	CLK_PERIPH(CLK_TIMER, "clk_periph_timer",
+		   &mpfs_cfg_clks[CLK_RTCREF - RTCREF_OFFSET].hw, 4, 0),
 	CLK_PERIPH(CLK_MMUART0, "clk_periph_mmuart0", PARENT_CLK(AHB), 5, CLK_IS_CRITICAL),
 	CLK_PERIPH(CLK_MMUART1, "clk_periph_mmuart1", PARENT_CLK(AHB), 6, 0),
 	CLK_PERIPH(CLK_MMUART2, "clk_periph_mmuart2", PARENT_CLK(AHB), 7, 0),
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
