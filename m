Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CE6606A31C
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Nov 2026 07:14:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EMQ0axO1;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=pigmoral.tech header.i=@pigmoral.tech header.a=rsa-sha256 header.s=zmail header.b=FPlzk+1X
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uu2gD3o70uTgOsgc9JvCd0+yQw6yV1BGGUFg4VxACuk=; b=EMQ0axO1Ehbrzd/mXYRkNGJLG7
	+Ugdll19wFTSU/MfCZ0WQUN55cb2wjjI/FnVWGpOT5I81nJFlIJfGOd8C1C/VgpjUC9rdx0PV/JjR
	aYu2oUj73XpCqQ0ykvI5gmBtSk6CTDIxUdXDQ75oWtpuQkBxyzka6VtEEbGFPIa3RK3AY8SChngmt
	aGk6p/rg69uRTbdgFM5/Bn7D0lKvKCc/WX3XBmJ5eGfqW1jPmm+L+W2O/sW8m5Z+xLhvtOq88CyTA
	WaLZEbEiZf9Hopz4bd0jIg9bxCwj036qubrDuQrAU1LzZJHh3o9UKDej8O9+Z2H8Vv6o6YLeiHRlK
	E4JiL1og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP0l-00000008sWl-3Fzq;
	Thu, 12 Nov 2026 07:14:19 +0000
Received: from sender6-op-o15.zoho.com ([165.173.180.15])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRP0e-00000008sU7-1ETK;
	Thu, 12 Nov 2026 07:14:16 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1794467630; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=E8G0fyEVy6B2a4iKiSdG2Zq7esdsoiZ9TF6jDcln5xC1+yi8QXe3qF6Svj0RCmr/wz570EsJl8C1TiQMDNBvoi0V8HULcF5LkCwnGpSfqgay3HOJuz2c2GxTT8iYouMFZbgDgCyE0SK98jPHwQnQ+E1xK5t+o7V+qTzzM7dK65s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1794467630; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=PTmWYRjZfP9gtAisAbUYIagZROMvNeOJ1Og3GOSujJA=; 
	b=TgH1dse1V5oSf0qsms+01IKzXfhOMFbdI2P3Ol81L/lwjklj3j7O8IqEN+wJZazbW63ROtiTgwxWxRI1jhMS1j6JP3v84VfRwrDUcHN3bgHhtOeWBAnSlntoqfN9ijoRhiLWj3G7xHOTOm6Nw01ppPCBSCHNlrccDoCJ4jUU3ic=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: a=rsa-sha256; b=FPlzk+1XNykOTPpO72A4BTNwdPrPqLADgh6s5Oa6/2bd79LnAE2bTk5VUb7p3tkUaj85TOmDAfI5hnV2aYCvnlGXINCrOVDVhwdJ7X7Zor6dXtkaXNrhn8Hb38fmjlk08p21WohN5dWvC7ii8ESXgbtP1rDMjAaNsyIjbcmmq7k=; c=relaxed/relaxed; s=zmail; d=pigmoral.tech; v=1; bh=PTmWYRjZfP9gtAisAbUYIagZROMvNeOJ1Og3GOSujJA=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1794467628553119.12183427709397;
	Wed, 11 Nov 2026 23:13:48 -0800 (PST)
From: Junhui Liu <junhui.liu@pigmoral.tech>
Date: Thu, 12 Nov 2026 15:11:51 +0800
Subject: [PATCH v7 2/8] clk: sunxi-ng: sdm: Add dual patterns support
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261112-a733-clk-v7-2-db7c5451ffa2@pigmoral.tech>
References: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
In-Reply-To: <20261112-a733-clk-v7-0-db7c5451ffa2@pigmoral.tech>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Junhui Liu <junhui.liu@pigmoral.tech>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Richard Cochran <richardcochran@gmail.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>, 
 Enzo Adriano <enzo.adriano.code@gmail.com>, 
 Andre Przywara <andre.przywara@arm.com>, Norman Herms <dockseed@proton.me>, 
 Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6057;
 i=junhui.liu@pigmoral.tech; h=from:subject:message-id;
 bh=87fr1BLvgSvLwrEFU09cqp4EWYygEGrfj2+1OZ0tcqA=;
 b=owGbwMvMwCWWvDb1VEXc8j+Mp9WSGLK+pj26bTojXePRpNbzVyeIzlPX8RdXYuG+6rny3pGup
 b8+GBUJdZSyMIhxMciKKbJw+Yv/s9bh+XZEoPU+zBxWJpAhDFycAjCR3ZMYGTYf2nJlzoWScJ//
 TpnSr+bfsy3I+OTJzpyuIPfZTv2wsBQjwzQzKSPvw6HOOecFQx/fepl7KH9hjHpiVuC5Dc/L7c4
 s5QIA
X-Developer-Key: i=junhui.liu@pigmoral.tech; a=openpgp;
 fpr=15B30CC69C4BF0CC3C08F85A2A90CDC122DF37BF
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261111_231412_368867_59F067F1 
X-CRM114-Status: GOOD (  15.42  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On newer Allwinner platforms like the A733, the Sigma-Delta Modulation
(SDM) control logic is more complex. The SDM enable bit, which was
previously located in the PLL register, is now moved to a second
pattern register (PATTERN1).

To support this, rename the existing "tuning" members to "pattern0" to
align with the datasheet, and introduce the _SUNXI_CCU_SDM_DUAL_PAT
macro to provide pattern1 register support. Related operations are also
updated.

Tested-by: Jerome Brunet <jbrunet@baylibre.com>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Vinicius Pedrosa <vinicius.eduardo.pedrosa@gmail.com>
Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
---
 drivers/clk/sunxi-ng/ccu_sdm.c | 52 ++++++++++++++++++++++++++++++------------
 drivers/clk/sunxi-ng/ccu_sdm.h | 29 ++++++++++++++---------
 2 files changed, 55 insertions(+), 26 deletions(-)

diff --git a/drivers/clk/sunxi-ng/ccu_sdm.c b/drivers/clk/sunxi-ng/ccu_sdm.c
index c564e5f9e610..7e13ffd246d3 100644
--- a/drivers/clk/sunxi-ng/ccu_sdm.c
+++ b/drivers/clk/sunxi-ng/ccu_sdm.c
@@ -18,7 +18,11 @@ bool ccu_sdm_helper_is_enabled(struct ccu_common *common,
 	if (sdm->enable && !(readl(common->base + common->reg) & sdm->enable))
 		return false;
 
-	return !!(readl(common->base + sdm->tuning_reg) & sdm->tuning_enable);
+	if (sdm->pat1_enable &&
+	    (readl(common->base + sdm->pat1_reg) & sdm->pat1_enable) != sdm->pat1_enable)
+		return false;
+
+	return !!(readl(common->base + sdm->pat0_reg) & sdm->pat0_enable);
 }
 EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_is_enabled, "SUNXI_CCU");
 
@@ -37,18 +41,27 @@ void ccu_sdm_helper_enable(struct ccu_common *common,
 	for (i = 0; i < sdm->table_size; i++)
 		if (sdm->table[i].rate == rate)
 			writel(sdm->table[i].pattern,
-			       common->base + sdm->tuning_reg);
+			       common->base + sdm->pat0_reg);
 
 	/* Make sure SDM is enabled */
 	spin_lock_irqsave(common->lock, flags);
-	reg = readl(common->base + sdm->tuning_reg);
-	writel(reg | sdm->tuning_enable, common->base + sdm->tuning_reg);
+	reg = readl(common->base + sdm->pat0_reg);
+	writel(reg | sdm->pat0_enable, common->base + sdm->pat0_reg);
 	spin_unlock_irqrestore(common->lock, flags);
 
-	spin_lock_irqsave(common->lock, flags);
-	reg = readl(common->base + common->reg);
-	writel(reg | sdm->enable, common->base + common->reg);
-	spin_unlock_irqrestore(common->lock, flags);
+	if (sdm->enable) {
+		spin_lock_irqsave(common->lock, flags);
+		reg = readl(common->base + common->reg);
+		writel(reg | sdm->enable, common->base + common->reg);
+		spin_unlock_irqrestore(common->lock, flags);
+	}
+
+	if (sdm->pat1_enable) {
+		spin_lock_irqsave(common->lock, flags);
+		reg = readl(common->base + sdm->pat1_reg);
+		writel(reg | sdm->pat1_enable, common->base + sdm->pat1_reg);
+		spin_unlock_irqrestore(common->lock, flags);
+	}
 }
 EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_enable, "SUNXI_CCU");
 
@@ -61,14 +74,23 @@ void ccu_sdm_helper_disable(struct ccu_common *common,
 	if (!(common->features & CCU_FEATURE_SIGMA_DELTA_MOD))
 		return;
 
-	spin_lock_irqsave(common->lock, flags);
-	reg = readl(common->base + common->reg);
-	writel(reg & ~sdm->enable, common->base + common->reg);
-	spin_unlock_irqrestore(common->lock, flags);
+	if (sdm->enable) {
+		spin_lock_irqsave(common->lock, flags);
+		reg = readl(common->base + common->reg);
+		writel(reg & ~sdm->enable, common->base + common->reg);
+		spin_unlock_irqrestore(common->lock, flags);
+	}
+
+	if (sdm->pat1_enable) {
+		spin_lock_irqsave(common->lock, flags);
+		reg = readl(common->base + sdm->pat1_reg);
+		writel(reg & ~sdm->pat1_enable, common->base + sdm->pat1_reg);
+		spin_unlock_irqrestore(common->lock, flags);
+	}
 
 	spin_lock_irqsave(common->lock, flags);
-	reg = readl(common->base + sdm->tuning_reg);
-	writel(reg & ~sdm->tuning_enable, common->base + sdm->tuning_reg);
+	reg = readl(common->base + sdm->pat0_reg);
+	writel(reg & ~sdm->pat0_enable, common->base + sdm->pat0_reg);
 	spin_unlock_irqrestore(common->lock, flags);
 }
 EXPORT_SYMBOL_NS_GPL(ccu_sdm_helper_disable, "SUNXI_CCU");
@@ -123,7 +145,7 @@ unsigned long ccu_sdm_helper_read_rate(struct ccu_common *common,
 	pr_debug("%s: clock is sigma-delta modulated\n",
 		 clk_hw_get_name(&common->hw));
 
-	reg = readl(common->base + sdm->tuning_reg);
+	reg = readl(common->base + sdm->pat0_reg);
 
 	pr_debug("%s: pattern reg is 0x%x",
 		 clk_hw_get_name(&common->hw), reg);
diff --git a/drivers/clk/sunxi-ng/ccu_sdm.h b/drivers/clk/sunxi-ng/ccu_sdm.h
index c1a7159b89c3..e94cef141c7d 100644
--- a/drivers/clk/sunxi-ng/ccu_sdm.h
+++ b/drivers/clk/sunxi-ng/ccu_sdm.h
@@ -33,21 +33,28 @@ struct ccu_sdm_internal {
 	u32		table_size;
 	/* early SoCs don't have the SDM enable bit in the PLL register */
 	u32		enable;
-	/* second enable bit in tuning register */
-	u32		tuning_enable;
-	u16		tuning_reg;
+	/* second enable bit in pattern0 register */
+	u32		pat0_enable;
+	u16		pat0_reg;
+	/* on some platforms, the sdm enable bit in pattern1 register */
+	u32		pat1_enable;
+	u16		pat1_reg;
 };
 
-#define _SUNXI_CCU_SDM(_table, _enable,			\
-		       _reg, _reg_enable)		\
-	{						\
-		.table		= _table,		\
-		.table_size	= ARRAY_SIZE(_table),	\
-		.enable		= _enable,		\
-		.tuning_enable	= _reg_enable,		\
-		.tuning_reg	= _reg,			\
+#define _SUNXI_CCU_SDM_DUAL_PAT(_table, _enable, _pat0, _pat0_enable, _pat1, _pat1_enable) \
+	{								\
+		.table			= _table,			\
+		.table_size		= ARRAY_SIZE(_table),		\
+		.enable			= _enable,			\
+		.pat0_enable		= _pat0_enable,			\
+		.pat0_reg		= _pat0,			\
+		.pat1_enable		= _pat1_enable,			\
+		.pat1_reg		= _pat1,			\
 	}
 
+#define _SUNXI_CCU_SDM(_table, _enable, _pat0, _pat0_enable)	\
+	_SUNXI_CCU_SDM_DUAL_PAT(_table, _enable, _pat0, _pat0_enable, 0, 0)
+
 bool ccu_sdm_helper_is_enabled(struct ccu_common *common,
 			       struct ccu_sdm_internal *sdm);
 void ccu_sdm_helper_enable(struct ccu_common *common,

-- 
2.56.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
