Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 253F5D68BCA
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Dec 2025 00:43:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=F94ZpitzwyIt8LsKolm0Pv6WWmVlvyLH4fyHNRDGgsU=; b=jE2RkmqLwgpuk2
	3af1IgzXbXEFCyqhGcpSkRuPsmNRpCPKnNHks1GT1+WSocBi7eIOXKkt7yDoc6cf5Zb/qnBSp5y0v
	5+M4cjYuCCIryv2bnfO0HGJSIPHBOmP5BN5jc30oOG89PnCv2QPSGz8ZUV6qX7kfvJ66s4LhGLRa6
	DXavj9xw2LCY/umWlVN9oU4sJsORvQYRJXXBf15TjJqsy2LfIGoCEY1c9V7Jb6PECe0YBdF040D4C
	8qVPZBKGaD2xae51XyN4bpUD5ftfsPPUhHaG4KNEM2IkyrgNsY2rvW9wpGAxwb85eoxiMXQrvSQgR
	mq8GXG6I8WC2KhkrkCNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW27H-00000007cM0-1fex;
	Thu, 18 Dec 2025 00:43:39 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vW27E-00000007cLb-2cEq
	for linux-riscv@lists.infradead.org;
	Thu, 18 Dec 2025 00:43:37 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2a07f8dd9cdso884555ad.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Dec 2025 16:43:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766018615; x=1766623415; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=UmaVCHSHHvIwXwKtKJ4+s23QAfyER5ERIOQ8jx1Me/mcmX94j5Eks2tkMdeLXWn2Ma
         xRwAS4tm52eYYkFrJSs6w5ZipDcT0SsReqdt+qMPmfnqb2RrPGDgp/CtzjiFP8wco51r
         bRw/qPWh3NCcwgK2BVtlOoOFCNqoMkwy3BxN03FaNxujjfWplVZt9n98migY1Ek+o9Hc
         4xssSMFDtvTxiSXxTihk7qHq2Y1XeRQ8cmmnLso6bWlPW1HedzyY1pj/YD+J20wY2KXu
         /L8WV5rECET2q7Hb1t8W5v9i9+L/Mo4LHQUZt34rCluq+aw90ciQjru90hc8LOFD7Abe
         vEXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766018615; x=1766623415;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lFBvL96SsBXFY1GOi9n3IufCfDj+mjJoC0nT1JtdTtw=;
        b=Kw47a9/+jeYXZgvq29rdDB+ULcdpKavSaVWUPvZL03yCyNpWJqcBbIOb4j2NxyNwbX
         18VxX8sIXVZ9dg7PrVzVK4hVeSuE5hl4bdZcj98eEB3snyew/FpqicqWipT8hzQd+AZn
         O/hRsAEhnJmhAyegIdEriVsppD6vzDLgdyNEk2l44RPh20lXmpEafwA39drAXGjgxuNb
         /ZMuxN1EM6X0Ay9cMBhYKzK+kl3zAYw97Xg2Z1B0Cy6zQI4GM9eU8dk5gr7J+09MHdtd
         trpbGrRUBnRnkD8jaEGNviTOYQ2Uyj12G58HGt/Ep/GFtvH+tdRY6KNhju5FEsB0DGUw
         ay+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWXBOYUtvL9Ft8Y736hif28vtbrXMCeQ4Tja6k/I+LRLDxamDNOQ/Q0z1Q86qOsDoKFwOGhKv6m4ALZIg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxZ/o/9Ww5XS7jnUor9VYujD1e1sRqfjhYwDObyIbHku+6nRCKP
	HoZ4YW/aaHDmDMd6M26al77xDWQTsbi1Ma5LZ1spot71e1SLGD5/RtFV
X-Gm-Gg: AY/fxX7ge9C3ZrkmTuqMlFKHxRB7t9uVLZmYUwoQG49zow1MUh+48RDpwzHV8jmN7tM
	Niv7Hfj+0E76Pg+p7Fk55mFGY5Go/rtvCH3h+jFgdqtB75l7mtEgjjXXdTvga10V6Y9qap2kYy5
	PV5B9vj9JuNUJ7/NEilw1c76J9fZ7BufjtUFkun7Fd/nbIdLwAaTMlaC40AiR+P3w11J69um5Vv
	BdXRzOfwoDLJ/f/2q0XTolKYU/g+jRYqUI9GecspVePswW+GV+SmhEXi3OSwkgJmlmHdbrtZZWO
	X9Lqo2uBQ97V3tTE4WGCRZ9OIHDwW7+SXQ+rEnWWHit0usVBiTQ42kbbCOQjj/HgoS9JfHEB1mY
	/FpL5YPtyyxUWczJyi7FvpQJk7keQv7apjwy9XC97BzjxVTI9B1VP4oFLyf3YQFSIui64vP90jw
	kYzb3Pzp8Oaw==
X-Google-Smtp-Source: AGHT+IHXPYnZ7E69bP2nqUc/pQLxn101I1QmHMYq1oQ+b98tg7iTEqKDi2M4pJ8wuRrwwolMhc/67g==
X-Received: by 2002:a05:701b:2218:b0:11a:72c6:22d6 with SMTP id a92af1059eb24-11f34c02a6fmr15633109c88.25.1766018615312;
        Wed, 17 Dec 2025 16:43:35 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12061fcfc66sm2825041c88.15.2025.12.17.16.43.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 16:43:34 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v3] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Thu, 18 Dec 2025 08:42:27 +0800
Message-ID: <20251218004227.221861-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_164336_671965_F3FF28E7 
X-CRM114-Status: GOOD (  10.05  )
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

For build spacemit common clock driver as a module, the build
process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
build will fail.

Add these missing hints, so the driver can be built as a module.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/ccu-k1.c  | 1 +
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 4 files changed, 16 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 4761bc1e3b6e..01d9485b615d 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -1204,6 +1204,7 @@ static struct platform_driver k1_ccu_driver = {
 };
 module_platform_driver(k1_ccu_driver);
 
+MODULE_IMPORT_NS("CLK_SPACEMIT");
 MODULE_DESCRIPTION("SpacemiT K1 CCU driver");
 MODULE_AUTHOR("Haylen Chu <heylenay@4d2.org>");
 MODULE_LICENSE("GPL");
diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..b5540e0781ff 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_ddn_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..67f8b12b4f5b 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_factor_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_gate_ops, "CLK_SPACEMIT");
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_mux_div_ops, "CLK_SPACEMIT");
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..7389202c4831 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -7,6 +7,7 @@
 #include <linux/clk-provider.h>
 #include <linux/math.h>
 #include <linux/regmap.h>
+#include <linux/module.h>
 
 #include "ccu_common.h"
 #include "ccu_pll.h"
@@ -157,3 +158,7 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
+
+MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
