Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FB2CD711D2
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Dec 2025 01:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KqyOdRA4+QT1xgMc7xWaGQnfHiLMKU/Hw4Q/65lQFZM=; b=WDIcZ2+qU9MwsW
	qQCG43+MbYUmhSbOU8ADO1pJi0kHl0ZIZuEdEH104LnZdstSknb7JjMi3nW5h78RlyaVMDsissQEk
	a7GkgBVpnGfSJQuKFJfqsy5E/274JjZIuCNiTKJgsatFdBX2GDm4v+EENbgv/Mr/EAxTZITwTs3zF
	BQkOWMvYe1ETC/fUEQaEb5b2+WJwn46a4qyArCrCH8hrIofIlpdZqgA446Mx1c4PAGWdt5J4zUZgX
	5DSM0fIbAAtyw4ke34otcCYyFkDqgmF4QcM/Vh+z4t++HQXaWhAUbW471kcQn2Hpll+9e4LQ0s8z0
	bgyUdnGisa0Jqaq+a1VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJD-00000009QsA-3Y36;
	Fri, 19 Dec 2025 01:29:31 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWPJB-00000009QrY-2ziN
	for linux-riscv@lists.infradead.org;
	Fri, 19 Dec 2025 01:29:30 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-2a0a95200e8so11775335ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 18 Dec 2025 17:29:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766107769; x=1766712569; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uWWh4FwGIgdhUsOi3EYtk/dhz8Z1t2Z6pki4bZVI0Bg=;
        b=mT9I8kIoeuhd+2Df5VJYakjuJDDnuYTU9Jh2/qsPeG7Z3M1kxblIIN2NPTXGLWpT+G
         XlAdMW2sHKSxud5Ae2u4uJSwYkKwpE4vgJtlrj2o1vmvsaTJy+FmrFhVHaPtWOMNYLvV
         6XYezoNePv7xOwO3Bo/olkcYAsw1OdT/EfK+TlRlTUpgnf7fDUh8+kM1v7SVFRgE59pE
         7ZcWuzNokd7D8w4+rYYW82hMjri5kAdp1tect4vT1xXe6Cgkhpq6OolrhS4FP1a275dc
         MkPvV4Zxwq36xfn8mUNuOIxBG2wS83mq8d7XnCX6apfad4xboS1ST+Ct+LYDcnUmkL71
         aIxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766107769; x=1766712569;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uWWh4FwGIgdhUsOi3EYtk/dhz8Z1t2Z6pki4bZVI0Bg=;
        b=UXtqfDMK7AmPE2+BPepuw4THBY9qdE9VmvLhLIJwNuTU4bd0i5Zma2AmCQANzVEzGj
         MgOTiDC2ToljFgSftkL/5rr11e+i3v0z409tTsauG6FQGt5o6fRwSAQtUtZ7cesy3y98
         OhXAX34svlXRKL6BnSeH+F3lFBMH6Y4NZtlqvM6WDXgzy0ex3JbKX5jAY6hiMxXZIN3S
         NoUDs20Gt1ciuCcMOIOoMEo821rWF+4dmVR61df+wrkEyZwhbX61XvTfX8htJiw8WWae
         jpJmSjK5taEE0Hgen63zEdo/qbk5mOfSBHMBC78b5jlRv0ARYyurXxU8PSyM4UyP2gL4
         sRKA==
X-Forwarded-Encrypted: i=1; AJvYcCWHKa3+f676ZLswVHVcjKvVwT9QSPHuixRv3WwlgCP3S4VWU94d5/TeNfmrWT/GTDaHCFywVjVd9/5NBw==@lists.infradead.org
X-Gm-Message-State: AOJu0YztlkajHEeCMv3ae2CeNUsoYH8eI9CA6rq48UCs66+WZcX/FmYl
	2i8Lp2O1psmKkC6cqCETZDfPzOQNusaC/mFiWsOTiLUfiPUZociexWYM
X-Gm-Gg: AY/fxX6TtfCtV5FKLctzE8xvkUkEAXyR+6R9zb4l1osw6fifCkx02MC0y6f6EGgh47E
	iBAbrNu1XoBZ4htUY0gOVFZHlh4lJBa9uZllcqCvKpoxJtH3sHCueXMExaf7wEo+icowW9rtS2k
	W0ewcN2wLdA5CgsgBlHtV5Ia+aH154YTj9UHNabhImm5crAvvr7OtkCsNqevKJsWtgEzBBxyMGZ
	IZzaolXJqf4RdvBqFbPdyhsDd/LqTLBa8yRD5OVfApyR3HB1+nfOF0DzC5nwbMj4pU3YTpRKZw1
	PB3DdwXIs5jMRLci+B8CbzlosBpbhURcXcp4M1DJVDR09nBJ1rI7Hi3hB7bW45MdDlRveIG7vk5
	0+g/DsztEqegOCO4er4Jb4Xh3t50QUlnoCUImTkCBn31MREekZuGCWA7z3mIyhXbMTwzraBZR02
	v5ABSnNcC8FyLlZhFAc/ua
X-Google-Smtp-Source: AGHT+IE7O1mGEpNS72Vw9iE/o2/iiXWpH+x3e4X6CYZynSGrcKdLgUt7hdbT3MImooLeHtQOOms8UA==
X-Received: by 2002:a05:7023:c087:b0:11d:f5d5:f699 with SMTP id a92af1059eb24-121722abe01mr1128444c88.20.1766107768634;
        Thu, 18 Dec 2025 17:29:28 -0800 (PST)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm3222028c88.17.2025.12.18.17.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 17:29:28 -0800 (PST)
From: Inochi Amaoto <inochiama@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@gentoo.org>,
	Haylen Chu <heylenay@4d2.org>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.spacemit.com>,
	Charles Mirabile <cmirabil@redhat.com>,
	Brian Masney <bmasney@redhat.com>,
	Akhilesh Patil <akhilesh@ee.iitb.ac.in>
Cc: linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	Longbin Li <looong.bin@gmail.com>
Subject: [PATCH v4 1/2] clk: spacemit: Respect Kconfig setting when building modules
Date: Fri, 19 Dec 2025 09:28:17 +0800
Message-ID: <20251219012819.440972-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251219012819.440972-1-inochiama@gmail.com>
References: <20251219012819.440972-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_172929_785192_0E30EA03 
X-CRM114-Status: GOOD (  16.60  )
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

Currently, the SPACEMIT_CCU entry is only a switch for enabling entry
SPACEMIT_K1_CCU. It does not guide the build for common clock codes
even if it is a tristate entry. This makes this entry useless.

Change the Makefile to add a separate build for common clock logic,
so the SPACEMIT_CCU entry takes effect, also add necessary
MODULE_LICENSE()/MODULE_DESCRIPTION()/EXPORT_SYMBOL() for the module
build.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 drivers/clk/spacemit/Makefile     | 9 +++++++--
 drivers/clk/spacemit/ccu-k1.c     | 1 +
 drivers/clk/spacemit/ccu_common.c | 6 ++++++
 drivers/clk/spacemit/ccu_ddn.c    | 1 +
 drivers/clk/spacemit/ccu_mix.c    | 9 +++++++++
 drivers/clk/spacemit/ccu_pll.c    | 1 +
 6 files changed, 25 insertions(+), 2 deletions(-)
 create mode 100644 drivers/clk/spacemit/ccu_common.c

diff --git a/drivers/clk/spacemit/Makefile b/drivers/clk/spacemit/Makefile
index 5ec6da61db98..ad2bf315109b 100644
--- a/drivers/clk/spacemit/Makefile
+++ b/drivers/clk/spacemit/Makefile
@@ -1,5 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 
-obj-$(CONFIG_SPACEMIT_K1_CCU)	= spacemit-ccu-k1.o
-spacemit-ccu-k1-y		= ccu_pll.o ccu_mix.o ccu_ddn.o
+obj-$(CONFIG_SPACEMIT_CCU)	+= spacemit-ccu.o
+spacemit-ccu-y			+= ccu_common.o
+spacemit-ccu-y			+= ccu_pll.o
+spacemit-ccu-y			+= ccu_mix.o
+spacemit-ccu-y			+= ccu_ddn.o
+
+obj-$(CONFIG_SPACEMIT_K1_CCU)	+= spacemit-ccu-k1.o
 spacemit-ccu-k1-y		+= ccu-k1.o
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
diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
new file mode 100644
index 000000000000..4412c4104dab
--- /dev/null
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/module.h>
+
+MODULE_DESCRIPTION("SpacemiT CCU common clock driver");
+MODULE_LICENSE("GPL");
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
index d92f0dae65a4..76d0244873d8 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -157,3 +157,4 @@ const struct clk_ops spacemit_ccu_pll_ops = {
 	.determine_rate = ccu_pll_determine_rate,
 	.is_enabled	= ccu_pll_is_enabled,
 };
+EXPORT_SYMBOL_NS_GPL(spacemit_ccu_pll_ops, "CLK_SPACEMIT");
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
