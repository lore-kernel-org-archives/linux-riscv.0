Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0124C5B552
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Jun 2025 20:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=syjG82hlb2uv1AoM+PCAnuMP/02tZs17yYTcQkJzByM=; b=UE1sZw1nk3HEQC
	NT4s7U7qehI6cq7TaspTcm2S70c5sAJnRbPNL+tTK5iCfgLjsZrfNMSOAXqAuPFVaD/XfQIbac8tc
	og0roVaAaPJhBchowNHs9SLmf53PZQzQ+yDxO0gvAU3d9kUxPk+YlkdxL/n2Dx0l7xA0V4DV2mhnV
	9n12pNMCGK0xkY8auIzaIQqilh+Ek2PdnIPg4zI7zDlbIWGKh39qyhDUsKTdu4cR4jAWY2MpOt4Xd
	wi87MWIZWkyfMIlHcBC1rlYSdGlwkJT0O+nNCGWb+QsWZGY2fYOdgCHLsZatal0+BA9ymRMcD8YJH
	+lvgEVziSEh0rAnf8LhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOipM-000000058C0-064x;
	Mon, 09 Jun 2025 20:10:40 +0000
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOinD-000000057s2-1Sdp
	for linux-riscv@lists.infradead.org;
	Mon, 09 Jun 2025 20:08:28 +0000
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-7d0976776dcso446345385a.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Jun 2025 13:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1749499705; x=1750104505; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=GF4KIadQnCb99mpDueA4XCnTjOk81vOGJdgqAUW/1vbFxWJiexhcQufa9upQqaOfhD
         dgDsZVu7unPWOnBzHJK53buolTdbmwx9HZh8271/Cd1vAv12rEYT03dmHMbfEbupzKCE
         TJNPK0yoevEbpMJNqJOFPUgweDAx56w2e7hRT9MuHC3Xg2yPyOWpmTLeZUFkcGhKSymT
         AGsK/yDwt60wQH1J9kfzUfdYb+LXDz4+PhtfVNmeECq5jZ3YqBZ5obggrDsPSInbm/OV
         s/2pywrRX3OH64ze0ExvaT1tHnXnCE1gKB8AMymAlrsFKl7P7pXurN/I3hGcUuKGfWfO
         IfCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749499706; x=1750104506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hXZOtes7v+x/7Gb9DsK5r+A9Wyuu/k4Jt+Vsyyna0xw=;
        b=KDMIqTQEPDY7gNSL5YD+exWTb3pQ7rKsyd8KtXtakGwRskgUjlNacicbUCdiy6DOlE
         4Z9rr8cLjDwtsSJGLQ+X0x7x7MRyywrbCmFG+G7solFkx4Iy+KU/uLpyjHipQxJhYQ9h
         CfrfX4uLUeIh8UOia0e1kdMajyaKeUc4FrQSmV6Huqyu6tImqXO6OvS1WttGy2sqBySs
         eqMYH/Ut5OG9yWtscVfuUn5MVR5Om5QckQcOiMWnjfpFWngyAMr1UkC+R7drh+N5X2Nb
         fP3ohE98LWBOE4NhRDPourQ5Lhhrw7Zp1uSlS2R+RKp0mwJ+4AXaTYtG/vCBrwKR5PVv
         pxIA==
X-Forwarded-Encrypted: i=1; AJvYcCXCXWsHNHxcXheQLbVc/29u0OZ8gNbhzY0kvSrX9UBJSKjfFKtRY9NWdzw77aF5sX6d37OS3G3c0QD86w==@lists.infradead.org
X-Gm-Message-State: AOJu0YyrfYADFtBR4l1e6vvxvYoQvbE1yNwlHP08fzrijIXwDLmS8/1u
	1jGjdagbqIkZZuyfZOyAqePaYz+t2cPL9IZ+E7U0Z30pKcQi7OBganJMOWHBO0fcxt0=
X-Gm-Gg: ASbGnctq9zIJl1xLJWxaIsYXNH3VHOg0Lr3UzRZ68/co9Kc8UznGzV2yTKa7Q+h14fY
	zHGhZkou7r5k0C6bbGHFYhJXhQz21+jqQkCtFfk+0Ij6Xbea/9oTOgnHftJixGOKzcGmqjhGF42
	gaHFobI6ddMho5miugvX8oUz10gr0si5aQbcdfC7DT979DOIhN/BckmyC4OFL1IA/E7KuD0v/I5
	Qa8a+jqh8yT9IJPB05ZxUf1Jb9m3Sy+AEX0tFgd0/F4jvu4EeWsbUPL40GgxHokKTE+5qyoKJ5O
	M/TxVQDqKwwyfm0NwfkSX083PjkgaYlzBMsMN18k0969MAbXwmIXX2ImT9eaDb0dL5jaDbSvZYc
	siV/2NxVJ0aBpheqS//Uj
X-Google-Smtp-Source: AGHT+IGQOWA/DdgNdcF0vOFp4bfRniwjEhSufXRdrgu6ZhEZb9CO/nMVcj463R4KXqdEUZZrqIYgZw==
X-Received: by 2002:a05:620a:28d0:b0:7c3:d7ef:f7f5 with SMTP id af79cd13be357-7d2298b164fmr2068749685a.18.1749499705469;
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
Received: from presto.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb09b2a021sm55869336d6.83.2025.06.09.13.08.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 13:08:25 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: mturquette@baylibre.com,
	sboyd@kernel.org
Cc: dlan@gentoo.org,
	heylenay@4d2.org,
	inochiama@outlook.com,
	elder@riscstar.com,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH] clk: spacemit: mark K1 pll1_d8 as critical
Date: Mon,  9 Jun 2025 15:08:21 -0500
Message-ID: <20250609200822.468482-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_130827_621508_99EF733A 
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

The pll1_d8 clock is enabled by the boot loader, and is ultimately a
parent for numerous clocks, including those used by APB and AXI buses.
Guodong Xu discovered that this clock got disabled while responding to
getting -EPROBE_DEFER when requesting a reset controller.

The needed clock (CLK_DMA, along with its parents) had already been
enabled.  To respond to the probe deferral return, the CLK_DMA clock
was disabled, and this led to parent clocks also reducing their enable
count.  When the enable count for pll1_d8 was decremented it became 0,
which caused it to be disabled.  This led to a system hang.

Marking that clock critical resolves this by preventing it from being
disabled.

Define a new macro CCU_FACTOR_GATE_DEFINE() to allow clock flags to
be supplied for a CCU_FACTOR_GATE clock.

Fixes: 1b72c59db0add ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Alex Elder <elder@riscstar.com>
Tested-by: Guodong Xu <guodong@riscstar.com>
---
v2: Reworded the description to provide better detail

 drivers/clk/spacemit/ccu-k1.c  |  3 ++-
 drivers/clk/spacemit/ccu_mix.h | 21 +++++++++++++--------
 2 files changed, 15 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index cdde37a052353..df65009a07bb1 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -170,7 +170,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(3), 4,
 CCU_FACTOR_GATE_DEFINE(pll1_d5, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(4), 5, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d6, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(5), 6, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d7, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(6), 7, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_d8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(7), 8, 1,
+		CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(15), 11, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR2, BIT(20), 23, 1);
diff --git a/drivers/clk/spacemit/ccu_mix.h b/drivers/clk/spacemit/ccu_mix.h
index 51d19f5d6aacb..668c8139339e1 100644
--- a/drivers/clk/spacemit/ccu_mix.h
+++ b/drivers/clk/spacemit/ccu_mix.h
@@ -101,16 +101,21 @@ static struct ccu_mix _name = {							\
 	}									\
 }
 
+#define CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, _flags)					\
+struct ccu_mix _name = {							\
+	.gate	= CCU_GATE_INIT(_mask_gate),					\
+	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
+	.common = {								\
+		.reg_ctrl	= _reg_ctrl,					\
+		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, _flags)	\
+	}									\
+}
+
 #define CCU_FACTOR_GATE_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
 			       _mul)						\
-static struct ccu_mix _name = {							\
-	.gate	= CCU_GATE_INIT(_mask_gate),					\
-	.factor	= CCU_FACTOR_INIT(_div, _mul),					\
-	.common = {								\
-		.reg_ctrl	= _reg_ctrl,					\
-		CCU_MIX_INITHW(_name, _parent, spacemit_ccu_factor_gate_ops, 0)	\
-	}									\
-}
+	CCU_FACTOR_GATE_FLAGS_DEFINE(_name, _parent, _reg_ctrl, _mask_gate, _div,	\
+			       _mul, 0)
 
 #define CCU_MUX_GATE_DEFINE(_name, _parents, _reg_ctrl, _shift, _width,		\
 			    _mask_gate, _flags)					\

base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
