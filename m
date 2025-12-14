Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71873D5B16E
	for <linux-riscv@archiver.kernel.org>; Sun, 14 Dec 2025 23:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tX2vThOsY6PN23/+/ZNSX+lh84Uvag7qiENMRfY3BpA=; b=ZhWyBm+xiQhtH0
	iCxQeGG20OxzVmcWTRF5RS8jcs001R3F2TXp1XZClVMxTQ9Kvt0UwKh1Uf2k+l39Uh/4m7wsEIXX3
	mrRYe/AkJuDBTa9Na2giruk0aM+mtbAtruJ0zug2CaRpD3pJMWytUR2nt3xf1ZLPfq9AgR1iRflYA
	uJAV8XumoXPCi2foyfjlQANBbUUCD7rBW7eP21ESPkm9e/jkjX9y6iWqKLkILPGv9PQ433yRdDapd
	3g94xOc568a+rWi3S3HvXAcyf5d+kGwwITY/eIBk00iRHEGY/kVKViUO5NLxnnsfXgeDOktxQ40sY
	pt774RAoigLDHwpuos2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUvY9-00000002ppl-3kQ1;
	Sun, 14 Dec 2025 23:30:50 +0000
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUvY1-00000002ppM-3MMC
	for linux-riscv@lists.infradead.org;
	Sun, 14 Dec 2025 23:30:48 +0000
Received: by mail-pg1-x530.google.com with SMTP id 41be03b00d2f7-bc4b952cc9dso2454744a12.3
        for <linux-riscv@lists.infradead.org>; Sun, 14 Dec 2025 15:30:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765755041; x=1766359841; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=Qe43jxh2+MvAQr+4YH5tp5J4md6sa8FTD3eh/CJhrKVhQVMbdqYpDKlltwHNdnX1uO
         tvvNSjhA+8bktiQ9BQVtvt8Mxaan9xchvdWynS/KlcnInCmTF0/yyIA+R1zJVYNk1UyI
         ibGeuekdcq+lmd5/29J8Qh1WNxQM/O5UDVmX9Mzj6z88/6Qv2pd3ykT4Chd1H8rJlO0F
         EDGHVgFSu7jGmBzRrhRigLy8igXVkQrt6NwMEwfSZr2C/z+scJAanQO38aik+Wpz56BQ
         A6oVBB+v7dP0L+1yUDS63CF5qlGBr3ScCHznn7/zBKrpke0UepUsKs9GqZJoZKAJ0/w1
         pQgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765755041; x=1766359841;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eYzoYAiPmzzivK8Ki6QV16iwe5G/a6yZeTp3lLRhlMY=;
        b=i9pTgk2erIVrhEtK3Ejv5H3Vilal95W6aAwP7TuuxqQA992PxQezj8vuVG4v5/DmZz
         oNkGvufQhk3TEhgOxdWB8fLK/jwFP4+Xxn/anJQp68cLhxrhR2Z3tVj1l0zv1C8oW7Bf
         ZrLGjyzjH8rgsSLlW7MBS2pa5q0fe0ssXOB/Ri6U8pkkv0CoJJXbqHxWh3ZahD5Rzutr
         WwVPhOqaGg95PiUso6b4og1Ub/xQL0L6+uWt0GfmqIjjivJv/IJ3VDBMtifT+YuXu+hH
         QskEABpQBT7AtPg/en6TA7EwOCJIpIup6KKS+qbCQienePRRDdU5pW8n0O6Q4v69xKK0
         SjIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnW+yavsCern1pIY1mcJEDA02fzJHnDB+/3nmoJep4JoC6wdKV1aQsfQRQykie9rVUVZxFfqEXnxqZlQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxUC/33NbJFNDuJjl6AadZjww1nUMiFhWuhz8+5NqHWSjY7Royp
	BPWwHEQYA7SgwLA3soH54sZS/HuM/eDC7k/lV2XEtTmNOU/QhlUVR8G5
X-Gm-Gg: AY/fxX5btC0AFppIhjZziI750xvIsWwBFtwW6jZGgKaAfbz/Rv6uI4wnPDBASBRZnV8
	O+9IvsTgG7CrBQQjEEaqiPuC79wXlDAtAFetrqBkU3GLjEU1K4zBIKGRKiKPNTIN8eEdBh5G66K
	cZBSypR2iosk7cFHhtbVNjGu8T3NIs0HpqY+XI2vHCKhmt2z3UKU+Ehe5AfIRyO3oBS8xeJ+cQg
	oCqfQOKl8Dib5az7q4QUfF4QJwmmZ5xORqtZGliKrHdllRti4gyov+xiqjYEguUJbP0fnGeQNRW
	kjfqO+PcUCq3oLK9djeaERw0qQmgdD8OzSt2OvRlHi+1qZynvdNg0PRQgiFxr9eE4TOl6Xs7A8o
	SyFmxgJPyfTNvqF4a+EXWGaNNAswdeq0wKYxXwH1QJiIEA8sbQGtMm64d9i0fxiYNia6IDExHGL
	rKMaYET6Xz7Q==
X-Google-Smtp-Source: AGHT+IGQk884QPSGZiuAKUTjJrQTSdk3vzJE7zDrugsr9qRUB8OVSda5q4I3tfPa/ntnYHcQi10gGw==
X-Received: by 2002:a05:7301:e0cc:b0:2ac:21bf:e937 with SMTP id 5a478bee46e88-2ac2f29b7f6mr4392207eec.0.1765755040555;
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ac3c13d60bsm13553377eec.0.2025.12.14.15.30.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Dec 2025 15:30:40 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	Brian Masney <bmasney@redhat.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH] clk: spacemit: Fix module build for spacemit common ccu driver
Date: Mon, 15 Dec 2025 07:29:37 +0800
Message-ID: <20251214232938.668293-1-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251214_153043_383434_52530F9D 
X-CRM114-Status: UNSURE (   9.00  )
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

For build spacemit common clock driver as a module, the build
process require MODULE_LICENSE()/MODULE_DESCRIPTION() globally
and EXPORT_SYMBOL() for every exposed symbol. Otherwise, the
build will fail.

Add these missing hints, so the driver can be built as a module.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/ccu_ddn.c | 1 +
 drivers/clk/spacemit/ccu_mix.c | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c | 5 +++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/clk/spacemit/ccu_ddn.c b/drivers/clk/spacemit/ccu_ddn.c
index 5b16e273bee5..9b6dc6910284 100644
--- a/drivers/clk/spacemit/ccu_ddn.c
+++ b/drivers/clk/spacemit/ccu_ddn.c
@@ -84,3 +84,4 @@ const struct clk_ops spacemit_ccu_ddn_ops = {
 	.determine_rate = ccu_ddn_determine_rate,
 	.set_rate	= ccu_ddn_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_ddn_ops);
diff --git a/drivers/clk/spacemit/ccu_mix.c b/drivers/clk/spacemit/ccu_mix.c
index 7b7990875372..09f377a6a4f5 100644
--- a/drivers/clk/spacemit/ccu_mix.c
+++ b/drivers/clk/spacemit/ccu_mix.c
@@ -198,24 +198,28 @@ const struct clk_ops spacemit_ccu_gate_ops = {
 	.enable		= ccu_gate_enable,
 	.is_enabled	= ccu_gate_is_enabled,
 };
+EXPORT_SYMBOL(spacemit_ccu_gate_ops);
 
 const struct clk_ops spacemit_ccu_factor_ops = {
 	.determine_rate = ccu_factor_determine_rate,
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_ops);
 
 const struct clk_ops spacemit_ccu_mux_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_ops);
 
 const struct clk_ops spacemit_ccu_div_ops = {
 	.determine_rate = ccu_mix_determine_rate,
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_ops);
 
 const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -226,6 +230,7 @@ const struct clk_ops spacemit_ccu_factor_gate_ops = {
 	.recalc_rate	= ccu_factor_recalc_rate,
 	.set_rate	= ccu_factor_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_factor_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -236,6 +241,7 @@ const struct clk_ops spacemit_ccu_mux_gate_ops = {
 	.get_parent	= ccu_mux_get_parent,
 	.set_parent	= ccu_mux_set_parent,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_gate_ops);
 
 const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -246,6 +252,7 @@ const struct clk_ops spacemit_ccu_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.disable	= ccu_gate_disable,
@@ -259,6 +266,7 @@ const struct clk_ops spacemit_ccu_mux_div_gate_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_gate_ops);
 
 const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.get_parent	= ccu_mux_get_parent,
@@ -268,3 +276,4 @@ const struct clk_ops spacemit_ccu_mux_div_ops = {
 	.recalc_rate	= ccu_div_recalc_rate,
 	.set_rate	= ccu_mix_set_rate,
 };
+EXPORT_SYMBOL(spacemit_ccu_mux_div_ops);
diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d92f0dae65a4..f8fc53887189 100644
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
+EXPORT_SYMBOL(spacemit_ccu_pll_ops);
+
+MODULE_DESCRIPTION("SpacemiT CCU PLL/MIX/DDN common driver");
+MODULE_LICENSE("GPL");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
