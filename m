Return-Path: <SRS0=oC46=FM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF072C433FE
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:15:05 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E68123A6C
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Dec 2020 07:15:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3E68123A6C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=2TGZHWUsCDOHIxX0Kia/Bm8eYkIL/7RaRwc0AFot1EU=; b=Ju4Galo9W/F+x3mgCQL+9N4NW
	/OmFKJWmbLpONhOzv20CjS22Y5f4Nl2ahtFkQgUJhKRS1PMVmHFknWe+A9+qzE0dSx58wwnoDErVI
	pxqViJSmhYbVPhXQ/8PxKKorpS6AzncXhU7gLISf9OfUx0swicWpQKjESeruGOQLmBeKouyyPHcJc
	r8OVENqDOfJYwysS1B7r2OMhg8xT5XLEPKehQf0r/29vDwDh21FB2HAMGamcsw/RQlaQQeEgid8Qn
	Lv0407bu/ARVvgnvJ0NO+/TmIwNafMJscaSJBVBvoUpmBQBQ6hLfigUoMQ/C/ixXTP6n8p9CNaji2
	YayCp+Maw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kmXD8-0004ia-6X; Tue, 08 Dec 2020 07:14:58 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kmXD5-0004gA-Jh
 for linux-riscv@lists.infradead.org; Tue, 08 Dec 2020 07:14:56 +0000
Received: by mail-pl1-x643.google.com with SMTP id bj5so6528392plb.4
 for <linux-riscv@lists.infradead.org>; Mon, 07 Dec 2020 23:14:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IPh0U3g/jkVOR5mbuAZ/kzwYhbv/Sy7jDuin+8rMgks=;
 b=mdTrqK+hMk6NPCs8NZJ9RZN5/rs1xdgq8NQqyKJlFomPeIZu2ku4m3EOrxMP2HJO7W
 H2qfdC0ZJTlgnIHGDsc1tmr9Np+vGNB0UQNCBkQ6Tp/g3hdAV8xxMzDctza7wd78TAl5
 6IhjLTfYyZ86/Hf8ytt4l2pwCEVQo9AP4gUjKtdYJjWV+16RV/uEY/LZzkKUN1TRUsf/
 uuU9VhnCjyB9Y6h4zWUJk0Ju3q3OmfFkH9TRoSzVQst/U+Rs1lfxSiqp08Gipjx71VzX
 MrS5ZfMnXPc/f85TuOMeMK/0KRCcLHdz98wIansja6z8bDWmaQPg7kYcfzYzsrlAWVK+
 AI5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IPh0U3g/jkVOR5mbuAZ/kzwYhbv/Sy7jDuin+8rMgks=;
 b=Xj+/fjqEmSWBwFB/46pEUnoBu1HalZ2LYX2SQIKcFWdGKNC9IjG7La+q9Bmq+toPOs
 KAUEQxi4eY5sa8cOeQT/h1ue0tWte6Pv/clC6PWZDnpDuJL16CQdW98SU210MmrCwd+d
 ToanvUgqpjVUxjByKvpAWFDtnPvRLLsfbdPurwyCiOUHWjFITBxIY35v6KJ6oU1V0BzU
 NvMS/ehkxwWvj8NuwZI88d2g0cD4vlfceQ99j2bLnQj807eiGQ0VlqNbRtO/6xquTcZc
 LYYgbysHeB4c23bUXd7RvoV8j/5jfVx7JaoKBg1jMhYteFdiWQtKbseJ2jkoY/jRKj1l
 KVMg==
X-Gm-Message-State: AOAM531tw16Zj7Mj5hRuRV6BM26P+JjkOkil2X9vDtNmZRttYnIURXO9
 84OYBmnBQALfpXU2qsJL3SNmsQ==
X-Google-Smtp-Source: ABdhPJyVvlNuDFzFVI8ZmPfVF5u0Qj0uL1yw7s6z1fGwY17o1+VZOpSphU/XYXsTI+mKFLhtJvVQRA==
X-Received: by 2002:a17:902:9894:b029:da:5698:7f7b with SMTP id
 s20-20020a1709029894b02900da56987f7bmr20366271plp.78.1607411693156; 
 Mon, 07 Dec 2020 23:14:53 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id gp17sm1801318pjb.0.2020.12.07.23.14.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Dec 2020 23:14:52 -0800 (PST)
From: Zong Li <zong.li@sifive.com>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, sboyd@kernel.org,
 schwab@linux-m68k.org, pragnesh.patel@openfive.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, yash.shah@sifive.com,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v6 5/5] clk: sifive: Add clock enable and disable ops
Date: Tue,  8 Dec 2020 15:14:32 +0800
Message-Id: <20201208071432.55583-6-zong.li@sifive.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201208071432.55583-1-zong.li@sifive.com>
References: <20201208071432.55583-1-zong.li@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201208_021455_700143_2FDF157A 
X-CRM114-Status: GOOD (  18.75  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Zong Li <zong.li@sifive.com>, Pragnesh Patel <pragnesh.patel@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Pragnesh Patel <pragnesh.patel@sifive.com>

Add new functions "sifive_prci_clock_enable(), sifive_prci_clock_disable()
and sifive_clk_is_enabled()" to enable or disable the PRCI clock

Signed-off-by: Pragnesh Patel <pragnesh.patel@sifive.com>
Tested-by: Zong Li <zong.li@sifive.com>
---
 drivers/clk/sifive/fu540-prci.c  |  6 +++
 drivers/clk/sifive/fu740-prci.c  |  9 ++++
 drivers/clk/sifive/sifive-prci.c | 77 ++++++++++++++++++++++++++++----
 drivers/clk/sifive/sifive-prci.h | 10 +++++
 4 files changed, 93 insertions(+), 9 deletions(-)

diff --git a/drivers/clk/sifive/fu540-prci.c b/drivers/clk/sifive/fu540-prci.c
index 34dc4ea6a3af..3fbee1da9701 100644
--- a/drivers/clk/sifive/fu540-prci.c
+++ b/drivers/clk/sifive/fu540-prci.c
@@ -33,16 +33,19 @@
 
 static struct __prci_wrpll_data __prci_corepll_data = {
 	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
 	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
 	.disable_bypass = sifive_prci_coreclksel_use_corepll,
 };
 
 static struct __prci_wrpll_data __prci_ddrpll_data = {
 	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
 };
 
 static struct __prci_wrpll_data __prci_gemgxlpll_data = {
 	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
 };
 
 /* Linux clock framework integration */
@@ -51,6 +54,9 @@ static const struct clk_ops sifive_fu540_prci_wrpll_clk_ops = {
 	.set_rate = sifive_prci_wrpll_set_rate,
 	.round_rate = sifive_prci_wrpll_round_rate,
 	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+	.enable = sifive_prci_clock_enable,
+	.disable = sifive_prci_clock_disable,
+	.is_enabled = sifive_clk_is_enabled,
 };
 
 static const struct clk_ops sifive_fu540_prci_wrpll_ro_clk_ops = {
diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 41ddd4431497..db8300223745 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -12,32 +12,38 @@
 
 static struct __prci_wrpll_data __prci_corepll_data = {
 	.cfg0_offs = PRCI_COREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_COREPLLCFG1_OFFSET,
 	.enable_bypass = sifive_prci_coreclksel_use_hfclk,
 	.disable_bypass = sifive_prci_coreclksel_use_final_corepll,
 };
 
 static struct __prci_wrpll_data __prci_ddrpll_data = {
 	.cfg0_offs = PRCI_DDRPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DDRPLLCFG1_OFFSET,
 };
 
 static struct __prci_wrpll_data __prci_gemgxlpll_data = {
 	.cfg0_offs = PRCI_GEMGXLPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_GEMGXLPLLCFG1_OFFSET,
 };
 
 static struct __prci_wrpll_data __prci_dvfscorepll_data = {
 	.cfg0_offs = PRCI_DVFSCOREPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_DVFSCOREPLLCFG1_OFFSET,
 	.enable_bypass = sifive_prci_corepllsel_use_corepll,
 	.disable_bypass = sifive_prci_corepllsel_use_dvfscorepll,
 };
 
 static struct __prci_wrpll_data __prci_hfpclkpll_data = {
 	.cfg0_offs = PRCI_HFPCLKPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_HFPCLKPLLCFG1_OFFSET,
 	.enable_bypass = sifive_prci_hfpclkpllsel_use_hfclk,
 	.disable_bypass = sifive_prci_hfpclkpllsel_use_hfpclkpll,
 };
 
 static struct __prci_wrpll_data __prci_cltxpll_data = {
 	.cfg0_offs = PRCI_CLTXPLLCFG0_OFFSET,
+	.cfg1_offs = PRCI_CLTXPLLCFG1_OFFSET,
 };
 
 /* Linux clock framework integration */
@@ -46,6 +52,9 @@ static const struct clk_ops sifive_fu740_prci_wrpll_clk_ops = {
 	.set_rate = sifive_prci_wrpll_set_rate,
 	.round_rate = sifive_prci_wrpll_round_rate,
 	.recalc_rate = sifive_prci_wrpll_recalc_rate,
+	.enable = sifive_prci_clock_enable,
+	.disable = sifive_prci_clock_disable,
+	.is_enabled = sifive_clk_is_enabled,
 };
 
 static const struct clk_ops sifive_fu740_prci_wrpll_ro_clk_ops = {
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index f4bab45509b3..4698dba0ac86 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -113,7 +113,7 @@ static u32 __prci_wrpll_pack(const struct wrpll_cfg *c)
 }
 
 /**
- * __prci_wrpll_read_cfg() - read the WRPLL configuration from the PRCI
+ * __prci_wrpll_read_cfg0() - read the WRPLL configuration from the PRCI
  * @pd: PRCI context
  * @pwd: PRCI WRPLL metadata
  *
@@ -124,14 +124,14 @@ static u32 __prci_wrpll_pack(const struct wrpll_cfg *c)
  * Context: Any context.  Caller must prevent the records pointed to by
  *          @pd and @pwd from changing during execution.
  */
-static void __prci_wrpll_read_cfg(struct __prci_data *pd,
-				  struct __prci_wrpll_data *pwd)
+static void __prci_wrpll_read_cfg0(struct __prci_data *pd,
+				   struct __prci_wrpll_data *pwd)
 {
 	__prci_wrpll_unpack(&pwd->c, __prci_readl(pd, pwd->cfg0_offs));
 }
 
 /**
- * __prci_wrpll_write_cfg() - write WRPLL configuration into the PRCI
+ * __prci_wrpll_write_cfg0() - write WRPLL configuration into the PRCI
  * @pd: PRCI context
  * @pwd: PRCI WRPLL metadata
  * @c: WRPLL configuration record to write
@@ -144,15 +144,29 @@ static void __prci_wrpll_read_cfg(struct __prci_data *pd,
  * Context: Any context.  Caller must prevent the records pointed to by
  *          @pd and @pwd from changing during execution.
  */
-static void __prci_wrpll_write_cfg(struct __prci_data *pd,
-				   struct __prci_wrpll_data *pwd,
-				   struct wrpll_cfg *c)
+static void __prci_wrpll_write_cfg0(struct __prci_data *pd,
+				    struct __prci_wrpll_data *pwd,
+				    struct wrpll_cfg *c)
 {
 	__prci_writel(__prci_wrpll_pack(c), pwd->cfg0_offs, pd);
 
 	memcpy(&pwd->c, c, sizeof(*c));
 }
 
+/**
+ * __prci_wrpll_write_cfg1() - write Clock enable/disable configuration
+ * into the PRCI
+ * @pd: PRCI context
+ * @pwd: PRCI WRPLL metadata
+ * @enable: Clock enable or disable value
+ */
+static void __prci_wrpll_write_cfg1(struct __prci_data *pd,
+				    struct __prci_wrpll_data *pwd,
+				    u32 enable)
+{
+	__prci_writel(enable, pwd->cfg1_offs, pd);
+}
+
 /*
  * Linux clock framework integration
  *
@@ -199,16 +213,61 @@ int sifive_prci_wrpll_set_rate(struct clk_hw *hw,
 	if (pwd->enable_bypass)
 		pwd->enable_bypass(pd);
 
-	__prci_wrpll_write_cfg(pd, pwd, &pwd->c);
+	__prci_wrpll_write_cfg0(pd, pwd, &pwd->c);
 
 	udelay(wrpll_calc_max_lock_us(&pwd->c));
 
+	return 0;
+}
+
+int sifive_clk_is_enabled(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_wrpll_data *pwd = pc->pwd;
+	struct __prci_data *pd = pc->pd;
+	u32 r;
+
+	r = __prci_readl(pd, pwd->cfg1_offs);
+
+	if (r & PRCI_COREPLLCFG1_CKE_MASK)
+		return 1;
+	else
+		return 0;
+}
+
+int sifive_prci_clock_enable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_wrpll_data *pwd = pc->pwd;
+	struct __prci_data *pd = pc->pd;
+
+	if (sifive_clk_is_enabled(hw))
+		return 0;
+
+	__prci_wrpll_write_cfg1(pd, pwd, PRCI_COREPLLCFG1_CKE_MASK);
+
 	if (pwd->disable_bypass)
 		pwd->disable_bypass(pd);
 
 	return 0;
 }
 
+void sifive_prci_clock_disable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_wrpll_data *pwd = pc->pwd;
+	struct __prci_data *pd = pc->pd;
+	u32 r;
+
+	if (pwd->enable_bypass)
+		pwd->enable_bypass(pd);
+
+	r = __prci_readl(pd, pwd->cfg1_offs);
+	r &= ~PRCI_COREPLLCFG1_CKE_MASK;
+
+	__prci_wrpll_write_cfg1(pd, pwd, r);
+}
+
 /* TLCLKSEL clock integration */
 
 unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
@@ -425,7 +484,7 @@ static int __prci_register_clocks(struct device *dev, struct __prci_data *pd,
 		pic->pd = pd;
 
 		if (pic->pwd)
-			__prci_wrpll_read_cfg(pd, pic->pwd);
+			__prci_wrpll_read_cfg0(pd, pic->pwd);
 
 		r = devm_clk_hw_register(dev, &pic->hw);
 		if (r) {
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index da7be9103d4d..0aee60552e19 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -40,6 +40,11 @@
 #define PRCI_COREPLLCFG0_LOCK_SHIFT	31
 #define PRCI_COREPLLCFG0_LOCK_MASK	(0x1 << PRCI_COREPLLCFG0_LOCK_SHIFT)
 
+/* COREPLLCFG1 */
+#define PRCI_COREPLLCFG1_OFFSET		0x8
+#define PRCI_COREPLLCFG1_CKE_SHIFT	31
+#define PRCI_COREPLLCFG1_CKE_MASK	(0x1 << PRCI_COREPLLCFG1_CKE_SHIFT)
+
 /* DDRPLLCFG0 */
 #define PRCI_DDRPLLCFG0_OFFSET		0xc
 #define PRCI_DDRPLLCFG0_DIVR_SHIFT	0
@@ -220,6 +225,7 @@ struct __prci_data {
  * @enable_bypass: fn ptr to code to bypass the WRPLL (if applicable; else NULL)
  * @disable_bypass: fn ptr to code to not bypass the WRPLL (or NULL)
  * @cfg0_offs: WRPLL CFG0 register offset (in bytes) from the PRCI base address
+ * @cfg1_offs: WRPLL CFG1 register offset (in bytes) from the PRCI base address
  *
  * @enable_bypass and @disable_bypass are used for WRPLL instances
  * that contain a separate external glitchless clock mux downstream
@@ -230,6 +236,7 @@ struct __prci_wrpll_data {
 	void (*enable_bypass)(struct __prci_data *pd);
 	void (*disable_bypass)(struct __prci_data *pd);
 	u8 cfg0_offs;
+	u8 cfg1_offs;
 };
 
 /**
@@ -279,6 +286,9 @@ long sifive_prci_wrpll_round_rate(struct clk_hw *hw, unsigned long rate,
 				  unsigned long *parent_rate);
 int sifive_prci_wrpll_set_rate(struct clk_hw *hw, unsigned long rate,
 			       unsigned long parent_rate);
+int sifive_clk_is_enabled(struct clk_hw *hw);
+int sifive_prci_clock_enable(struct clk_hw *hw);
+void sifive_prci_clock_disable(struct clk_hw *hw);
 unsigned long sifive_prci_wrpll_recalc_rate(struct clk_hw *hw,
 					    unsigned long parent_rate);
 unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
