Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9DE1C5474A
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 08:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OhPDSpC4jSkXz5Ofe6r13DcSbw78Pipz4IajvrOr2Mg=; b=mZQecIYQLFsBjP
	VqjK6nU5GQa5eILMjvG6c0OxggBzcl3p1Z8Hdcfqvz15imsxCcQn2yLPHbrNKAOY+yYoi56C0brlp
	3WBGBqaaOLWqNC1iwUK3oaJ+KRCzICwX3uERVnRSOytBVhiIvB3nClr/58GXiQ7q7rcO5Gim4KcTt
	x6pZm+izTHeI4Bdi/M/M2U2TJQT0zwbRYk3nb17f+ytyOuz6xShN5xqCvHUcOc3+4Ep8cyh4duU8P
	/P/WStDwo4CVG6cCNgZr4GPAQ4D9AnMjGjORxRE9r1PX60WQU0T7WpGKmYnUU3Pfzfa6DcTat1LW7
	IvnU2i57NnvDQAquJnCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjDbj-0000000ERPk-3wS9;
	Wed, 28 Aug 2024 08:00:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCac-0000000EAAr-27hQ
	for linux-riscv@bombadil.infradead.org;
	Wed, 28 Aug 2024 06:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ADaFrHDK9ZOzAQCFKsnssz1RoZQI/sdKuq5QgfmMJBo=; b=nja579DsPrRyoCW7rSjMJNGu8u
	liJUifqx2UrwkH40lNXTBUciW0JX6n6tHmRiF0Bj3YnvmqpTnZFCb4wElHJBR6UG2wuC9zAV8OWDZ
	+ZcmjI91A/AjfkUKrEzK3YI7uFOdV1X0oIEc64KwFoG/TQWZAVVOfLnNRIqknBA/Svb8gjebxVg7k
	ghVnGwtyttfyx0BbTngCwMTYymsww+gmt7EPttZq4kWSusmPUSy7vIgztfa3MvHwgUI2NOVeJQ5xT
	+K0kcZZRF4a+++2i1ONA7kmeniVDzA7XrPD4GyE8jJxV2aHS8Naqh9grachb2HZO3W577bI6Hsnfl
	aiuv8ZDA==;
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjCaV-0000000B4hX-08J4
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 06:55:31 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1fee6435a34so43820445ad.0
        for <linux-riscv@lists.infradead.org>; Tue, 27 Aug 2024 23:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724828125; x=1725432925; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ADaFrHDK9ZOzAQCFKsnssz1RoZQI/sdKuq5QgfmMJBo=;
        b=Qx4/Hy6k8wwFVe7uthEr3MnFJIjR8XnKR6LPqpvmoDjp1vCKpXovSsCBgGXL/nA0UG
         vmqEof8uUGdLTue2Hpj7TAq2lMK/g1HjchqvNNRng8ASpFIATV+QtJWAdsTIx12/xHCO
         uegC/etWviCCmC8nznq/Za+KVCEHt2/JCP+jGe97SVlKNopIhixkDpN9SSGFdAmaGxi4
         h6tYyT2IVYbxjHzTPUpoowIZ5+lSpKNuuInyXKv6G0/8/oQdzqTgRrJaW2J+9Myz7YS1
         U8OumHb4U+a3dP0iVM+cfrv6Vepdp5gG/y2yNR9GrIO5FpjHOdT8tl/T8jppIyya+fJ1
         176g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724828125; x=1725432925;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ADaFrHDK9ZOzAQCFKsnssz1RoZQI/sdKuq5QgfmMJBo=;
        b=hjd62KULO49r0zqQQwhzosZA2MehtXaXSPDcBD3uBjDj6cmskluhT88z2tT3mUeTK/
         Nwp22LXLJ6UfEBFxKIC6id5vkJVswqr0Wf3VY0ddD1n8UsUx2W4MTd7GGJx92FwwP2Jh
         Ro20/3Jy0fy25j8xMVWAtSas6WOQ5sostDA1vwO/0+u1SqpYCONCccLL+eKpHeeU1Iyg
         weRDOW+bBaywf39q+i+37sXfjRSui2JpkFnCLG30yD2I42VVn6ZtCiv6geXVllb+3cKt
         XRd7oW1M2urI9zwKo0AoSx9qikXHe83dnz7UopblqWpSR2cIklSRv27J/cHiCss1PEwQ
         EepA==
X-Forwarded-Encrypted: i=1; AJvYcCWlLYg1vkaxctOwys3vot2tdJ+yuwPjDr24g+9bfMbkjHJ9WeNNzRBr4+BqXhrM0f+UED5KNndrtX3MgQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzFBgGznKtsu2IawmS6NVye+IjZ2yfdgfZKWccWT6ArpodYlNcd
	Wc9V6q97cuwjc88FoFGpfuhDZNiIy8MAYDU0SboVjgSXkH8wggDQ
X-Google-Smtp-Source: AGHT+IF4i+BjBUycmBUoKtnssqJR+p5OnuLE/Jpi6Rk+k1EXgavhtDmvGzw4sUvLwFCHusYKmK+ctg==
X-Received: by 2002:a17:902:c946:b0:202:4464:c5f3 with SMTP id d9443c01a7336-2039e4f6368mr146874035ad.52.1724828125157;
        Tue, 27 Aug 2024 23:55:25 -0700 (PDT)
Received: from m91p.airy.home ([172.92.174.232])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20385607f94sm92816005ad.182.2024.08.27.23.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 23:55:24 -0700 (PDT)
From: Bo Gan <ganboing@gmail.com>
To: zong.li@sifive.com,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Pragnesh.patel@sifive.com,
	aou@eecs.berkeley.edu,
	erik.danie@sifive.com,
	hes@sifive.com,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	palmerdabbelt@google.com,
	paul.walmsley@sifive.com,
	pragnesh.patel@openfive.com,
	sboyd@kernel.org,
	schwab@linux-m68k.org,
	yash.shah@sifive.com
Subject: [PATCH 3/3] clk: sifive: prci: Add release_reset hooks for gemgxlpll/cltxpll
Date: Tue, 27 Aug 2024 23:55:20 -0700
Message-Id: <e47b943c0f685cd028ebd477e97e1706f184a7b6.1724827635.git.ganboing@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1724827635.git.ganboing@gmail.com>
References: <cover.1724827635.git.ganboing@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_075529_015976_C37CF3DC 
X-CRM114-Status: GOOD (  24.21  )
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

This patch adds the release_reset hook interface to __prci_wrpll_data.
During clock enablement, the function (if present) will be called after PLL
registers are configured. It aligns the logic to the driver in u-boot. When
there's a previous bootloader stage, such as u-boot, it usually enables the
gemgxlpll clock when trying to PXE/network boot. The kernel boots fine, but
we should not depend on it being our previous stage, and the logic within:

 a. We (linux) can get directly invoked by firmware (OpenSBI).
 b. U-boot doesn't necessarily have to initialize ethernet and enable the
    clock (when not enabled in CONFIG).

When the kernel is the first to initialize gemgxlpll, it must also release
the corresponding reset. Otherwise the chip will just hang during macb
initialization, and even external JTAG debugger will lose control over the
risc-v debug module. (Observed with my Sifive Unmatched Rev.B board)

The patch took the dt-bindings and logics directly from u-boot with some
additional modifications:
 - Use __prci_writel after __prci_readl to have barrier semantic. U-boot
   has the strong version of readl/writel, but linux has the relaxed ones.
 - Use pd->reset.rcdev.ops to access the reset regs.
 - Split reset bindings for FU540/FU740 and use them directly, instead of
   looking it up through reset-names.

Signed-off-by: Bo Gan <ganboing@gmail.com>
---
 drivers/clk/sifive/fu540-prci.h  | 16 ++++++++++++++++
 drivers/clk/sifive/fu740-prci.h  | 31 +++++++++++++++++++++++++++++++
 drivers/clk/sifive/sifive-prci.c | 23 +++++++++++++++++++++++
 drivers/clk/sifive/sifive-prci.h |  8 ++++++++
 4 files changed, 78 insertions(+)

diff --git a/drivers/clk/sifive/fu540-prci.h b/drivers/clk/sifive/fu540-prci.h
index e0173324f3c5..9d2ca18f47a4 100644
--- a/drivers/clk/sifive/fu540-prci.h
+++ b/drivers/clk/sifive/fu540-prci.h
@@ -23,9 +23,24 @@
 #include <linux/module.h>
 
 #include <dt-bindings/clock/sifive-fu540-prci.h>
+#include <dt-bindings/reset/sifive-fu540-prci.h>
 
 #include "sifive-prci.h"
 
+/**
+ * sifive_fu540_prci_ethernet_release_reset() - Release ethernet reset
+ * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
+ *
+ */
+static void sifive_fu540_prci_ethernet_release_reset(struct __prci_data *pd)
+{
+	/* Release GEMGXL reset */
+	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU540_PRCI_RST_GEMGXL_N);
+
+	/* Procmon => core clock */
+	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
+}
+
 /* PRCI integration data for each WRPLL instance */
 
 static struct __prci_wrpll_data sifive_fu540_prci_corepll_data = {
@@ -43,6 +58,7 @@ static struct __prci_wrpll_data sifive_fu540_prci_ddrpll_data = {
 static struct __prci_wrpll_data sifive_fu540_prci_gemgxlpll_data = {
 	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
 	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
+	.release_reset = sifive_fu540_prci_ethernet_release_reset,
 };
 
 /* Linux clock framework integration */
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index f31cd30fc395..dd0f54277a99 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -10,9 +10,38 @@
 #include <linux/module.h>
 
 #include <dt-bindings/clock/sifive-fu740-prci.h>
+#include <dt-bindings/reset/sifive-fu740-prci.h>
 
 #include "sifive-prci.h"
 
+/**
+ * sifive_fu740_prci_ethernet_release_reset() - Release ethernet reset
+ * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
+ *
+ */
+static void sifive_fu740_prci_ethernet_release_reset(struct __prci_data *pd)
+{
+	/* Release GEMGXL reset */
+	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_GEMGXL_N);
+
+	/* Procmon => core clock */
+	sifive_prci_set_procmoncfg(pd, PRCI_PROCMONCFG_CORE_CLOCK_MASK);
+
+	/* Release Chiplink reset */
+	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
+}
+
+/**
+ * sifive_fu740_prci_cltx_release_reset() - Release cltx reset
+ * @pd: struct __prci_data * for the PRCI containing the Ethernet CLK mux reg
+ *
+ */
+static void sifive_fu740_prci_cltx_release_reset(struct __prci_data *pd)
+{
+	/* Release CLTX reset */
+	pd->reset.rcdev.ops->deassert(&pd->reset.rcdev, FU740_PRCI_RST_CLTX_N);
+}
+
 /* PRCI integration data for each WRPLL instance */
 
 static struct __prci_wrpll_data sifive_fu740_prci_corepll_data = {
@@ -30,6 +59,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_ddrpll_data = {
 static struct __prci_wrpll_data sifive_fu740_prci_gemgxlpll_data = {
 	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
 	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
+	.release_reset = sifive_fu740_prci_ethernet_release_reset,
 };
 
 static struct __prci_wrpll_data sifive_fu740_prci_dvfscorepll_data = {
@@ -49,6 +79,7 @@ static struct __prci_wrpll_data sifive_fu740_prci_hfpclkpll_data = {
 static struct __prci_wrpll_data sifive_fu740_prci_cltxpll_data = {
 	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
 	.cfg1_offs = PRCI_CLTXPLLCFG1_OFFSET,
+	.release_reset = sifive_fu740_prci_cltx_release_reset,
 };
 
 /* Linux clock framework integration */
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index caba0400f8a2..ae8055a84466 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -249,6 +249,9 @@ int sifive_prci_clock_enable(struct clk_hw *hw)
 	if (pwd->disable_bypass)
 		pwd->disable_bypass(pd);
 
+	if (pwd->release_reset)
+		pwd->release_reset(pd);
+
 	return 0;
 }
 
@@ -448,6 +451,26 @@ void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd)
 	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
 }
 
+/*
+ * PROCMONCFG
+ */
+
+/**
+ * sifive_prci_set_procmoncfg() - set PROCMONCFG
+ * @pd: struct __prci_data * PRCI context
+ * @val: u32 value to write to PROCMONCFG register
+ *
+ * Set the PROCMONCFG register to @val
+ *
+ * Context: Any context.  Caller must prevent concurrent changes to the
+ *          PROCMONCFG_OFFSET register.
+ */
+void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val)
+{
+	__prci_writel(val, PRCI_PROCMONCFG_OFFSET, pd);
+	__prci_readl(pd, PRCI_PROCMONCFG_OFFSET);	/* barrier */
+}
+
 /* PCIE AUX clock APIs for enable, disable. */
 int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
 {
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 91658a88af4e..825a0aef9fd5 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -210,6 +210,9 @@
 
 /* PROCMONCFG */
 #define PRCI_PROCMONCFG_OFFSET			0xf0
+#define PRCI_PROCMONCFG_CORE_CLOCK_SHIFT	24
+#define PRCI_PROCMONCFG_CORE_CLOCK_MASK					\
+		(0x1 << PRCI_PROCMONCFG_CORE_CLOCK_SHIFT)
 
 /*
  * Private structures
@@ -235,6 +238,7 @@ struct __prci_data {
  * @disable_bypass: fn ptr to code to not bypass the WRPLL (or NULL)
  * @cfg0_offs: WRPLL CFG0 register offset (in bytes) from the PRCI base address
  * @cfg1_offs: WRPLL CFG1 register offset (in bytes) from the PRCI base address
+ * @release_reset: fn ptr to code to release clock reset
  *
  * @enable_bypass and @disable_bypass are used for WRPLL instances
  * that contain a separate external glitchless clock mux downstream
@@ -246,6 +250,7 @@ struct __prci_wrpll_data {
 	void (*disable_bypass)(struct __prci_data *pd);
 	u8 cfg0_offs;
 	u8 cfg1_offs;
+	void (*release_reset)(struct __prci_data *pd);
 };
 
 /**
@@ -290,6 +295,9 @@ void sifive_prci_corepllsel_use_corepll(struct __prci_data *pd);
 void sifive_prci_hfpclkpllsel_use_hfclk(struct __prci_data *pd);
 void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd);
 
+/* PROCMONCFG */
+void sifive_prci_set_procmoncfg(struct __prci_data *pd, u32 val);
+
 /* Linux clock framework integration */
 long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long *parent_rate);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
