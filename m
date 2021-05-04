Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8E8C2C43611
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:47 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E3FDF613B4
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E3FDF613B4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=QzhdGZn+4TOCK83wLTHH7AVx5hkGm3PZBX3oqTxgbqM=; b=nJzAeDvCNucZzQnHcKPqEZA3A
	cTHkp53rXhF12h2wMhRilmaXakLzQ7vdbRWnz6dapvjdYGuXw8s8r9Mk21+9LPnhx/iBHXFN1etHr
	sbQCIbsjjsm5AbJZk8R5sWxnWOz0vONung+2go3zio16qipsMJil8YCgBIpCWVaD9rPnkax4KBmlD
	GGo3hgETsHfa+BD3BztEqsOHBNxLNqnDDM+vYdK/G0thCvv3qX55C8VFKg2V4OiRMqNykHIsxqZQC
	MRUnrLUM4nuK49XF3WmqGNPAs+bxziB54nk6i5hrBwp86YGEREjs+qGVYil6jhF6XGy8bE3VV6uTj
	Ok1elWgKA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsn3-00G20H-Fz; Tue, 04 May 2021 11:00:33 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmu-00G1yF-5t
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=vEh7zwdmOqzz+rJcxXSAwcExQpnY0trAqavM2fyHl9I=; b=TmMHN1H5KbVds9f2h4QWkTD18U
 VpB+FBQtwnZQfnjnV3QL6hH0eg1KTcaIqsL6WkOAKQzBnme/01GHhPUs99sXvPrFQ71rhwDm1DFUX
 jBx5vCN42mcQSGln3IY0mngWVX3B23TBjTr9mkc/KjcBzqHuRBoNZaOCO/Zp1x80NkwuWipF4EMjG
 AtZN5SyTPmxSAuN9EA9h3JPrEr6S0veRHvvAjzGUwNPKT2A/IBSmaAxUnQ7UF2AD1BAs9Yu22Y3hO
 8k1HpbvzC7t0xNUdKhkF7jFM4uaGiY+gs35qr9br5dhN5ukmPRAOV0UTp+5zNjFFZokapS9gSacMX
 8sxS8dWw==;
Received: from mail-pg1-x52b.google.com ([2607:f8b0:4864:20::52b])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmr-003usk-FI
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:22 +0000
Received: by mail-pg1-x52b.google.com with SMTP id y30so6480499pgl.7
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vEh7zwdmOqzz+rJcxXSAwcExQpnY0trAqavM2fyHl9I=;
 b=kyg/bynLvk0jET8a+V5hi4Gvf86iFQo8DVyd0B15ckMGCf9xETbjcI2IBy11aPABOw
 buKcGfKotWyiKb3dWMlHj9J0RaQfH/b9UGO9b6lUYCIhSK8FFBnxzYYA+lT8IH1aId7F
 NtlMVBPTyIj7W/bP2WiZRYcQdCaEJMKhxPLeGfWSl5DpiTF75lCSwaJft6TMD4+bYdSj
 5tPYh+9ija08bz2mycQyKBIdLjJoS5LKXzE/wX5gaKNjBQVRAgnd21f436uhlcW2S9Tt
 UhAaK13x1mH2mlnjVPqCC8iPwNeTquaRQp/VF7k90FY79FKfkhHXosxZLrNZleIXSyEy
 ozDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vEh7zwdmOqzz+rJcxXSAwcExQpnY0trAqavM2fyHl9I=;
 b=JeF2hE2qOeBey4cc2qPx0KDV+xW3sEyWr6T7JrAVGjd6D/h850teSuh8ByHbf+6PUb
 uQhGK/fS9ROVQ5H2v3I/W4t+NiZrJGNA6tb5g0sRKZJoJ0xKtAIOFo+WpaaYYVFuuZUq
 +xpHst6ohuwIZYoPOvgfZkJSJAcxIGEMSMmbZGK32maI/31P5pzCJvIO0MpauIo29tHw
 RXjG8opErsKJo+FxcvStDxj301ZU41byBcy5POiEJ+oiaAqokfXu2v+mISo3Dukcr6T3
 8xtN0CkcDCgkNm0DiEcw/TklTcdcDvlq1wbQtQzkZSBrpFc8HY9LLOpfWQYnMnaXihG8
 zUUw==
X-Gm-Message-State: AOAM533uzrvyWdZG2ACdp3MPPaTRWhIoQXTSlpQUknf+xDfMEYdvm1IY
 ipLOnZpRATcqoYFtezbY3sUxvQ==
X-Google-Smtp-Source: ABdhPJxrORUPctm64X7uKK0XRL2WvytiVqXGSwUmzPYSv++RL5cDleKp7rWm0/bin5yug/JC9u1j+w==
X-Received: by 2002:a65:4485:: with SMTP id l5mr22501162pgq.209.1620126018073; 
 Tue, 04 May 2021 04:00:18 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:17 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v6 1/6] clk: sifive: Add pcie_aux clock in prci driver for
 PCIe driver
Date: Tue,  4 May 2021 18:59:35 +0800
Message-Id: <20210504105940.100004-2-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040021_532405_DCE9E5DE 
X-CRM114-Status: GOOD (  17.51  )
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

We add pcie_aux clock in this patch so that pcie driver can use
clk_prepare_enable() and clk_disable_unprepare() to enable and disable
pcie_aux clock.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sifive/fu740-prci.c               | 11 +++++
 drivers/clk/sifive/fu740-prci.h               |  2 +-
 drivers/clk/sifive/sifive-prci.c              | 41 +++++++++++++++++++
 drivers/clk/sifive/sifive-prci.h              |  9 ++++
 include/dt-bindings/clock/sifive-fu740-prci.h |  1 +
 5 files changed, 63 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/fu740-prci.c b/drivers/clk/sifive/fu740-prci.c
index 764d1097aa51..53f6e00a03b9 100644
--- a/drivers/clk/sifive/fu740-prci.c
+++ b/drivers/clk/sifive/fu740-prci.c
@@ -72,6 +72,12 @@ static const struct clk_ops sifive_fu740_prci_hfpclkplldiv_clk_ops = {
 	.recalc_rate = sifive_prci_hfpclkplldiv_recalc_rate,
 };
 
+static const struct clk_ops sifive_fu740_prci_pcie_aux_clk_ops = {
+	.enable = sifive_prci_pcie_aux_clock_enable,
+	.disable = sifive_prci_pcie_aux_clock_disable,
+	.is_enabled = sifive_prci_pcie_aux_clock_is_enabled,
+};
+
 /* List of clock controls provided by the PRCI */
 struct __prci_clock __prci_init_clocks_fu740[] = {
 	[PRCI_CLK_COREPLL] = {
@@ -120,4 +126,9 @@ struct __prci_clock __prci_init_clocks_fu740[] = {
 		.parent_name = "hfpclkpll",
 		.ops = &sifive_fu740_prci_hfpclkplldiv_clk_ops,
 	},
+	[PRCI_CLK_PCIE_AUX] = {
+		.name = "pcie_aux",
+		.parent_name = "hfclk",
+		.ops = &sifive_fu740_prci_pcie_aux_clk_ops,
+	},
 };
diff --git a/drivers/clk/sifive/fu740-prci.h b/drivers/clk/sifive/fu740-prci.h
index 13ef971f7764..511a0bf7ba2b 100644
--- a/drivers/clk/sifive/fu740-prci.h
+++ b/drivers/clk/sifive/fu740-prci.h
@@ -9,7 +9,7 @@
 
 #include "sifive-prci.h"
 
-#define NUM_CLOCK_FU740	8
+#define NUM_CLOCK_FU740	9
 
 extern struct __prci_clock __prci_init_clocks_fu740[NUM_CLOCK_FU740];
 
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index 1490b01ce629..9997a3fa4a38 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -453,6 +453,47 @@ void sifive_prci_hfpclkpllsel_use_hfpclkpll(struct __prci_data *pd)
 	r = __prci_readl(pd, PRCI_HFPCLKPLLSEL_OFFSET);	/* barrier */
 }
 
+/* PCIE AUX clock APIs for enable, disable. */
+int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r;
+
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);
+
+	if (r & PRCI_PCIE_AUX_EN_MASK)
+		return 1;
+	else
+		return 0;
+}
+
+int sifive_prci_pcie_aux_clock_enable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r __maybe_unused;
+
+	if (sifive_prci_pcie_aux_clock_is_enabled(hw))
+		return 0;
+
+	__prci_writel(1, PRCI_PCIE_AUX_OFFSET, pd);
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);	/* barrier */
+
+	return 0;
+}
+
+void sifive_prci_pcie_aux_clock_disable(struct clk_hw *hw)
+{
+	struct __prci_clock *pc = clk_hw_to_prci_clock(hw);
+	struct __prci_data *pd = pc->pd;
+	u32 r __maybe_unused;
+
+	__prci_writel(0, PRCI_PCIE_AUX_OFFSET, pd);
+	r = __prci_readl(pd, PRCI_PCIE_AUX_OFFSET);	/* barrier */
+
+}
+
 /**
  * __prci_register_clocks() - register clock controls in the PRCI
  * @dev: Linux struct device
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index dbdbd1722688..022c67cf053c 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -67,6 +67,11 @@
 #define PRCI_DDRPLLCFG1_CKE_SHIFT	31
 #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
 
+/* PCIEAUX */
+#define PRCI_PCIE_AUX_OFFSET		0x14
+#define PRCI_PCIE_AUX_EN_SHIFT		0
+#define PRCI_PCIE_AUX_EN_MASK		(0x1 << PRCI_PCIE_AUX_EN_SHIFT)
+
 /* GEMGXLPLLCFG0 */
 #define PRCI_GEMGXLPLLCFG0_OFFSET	0x1c
 #define PRCI_GEMGXLPLLCFG0_DIVR_SHIFT	0
@@ -296,4 +301,8 @@ unsigned long sifive_prci_tlclksel_recalc_rate(struct clk_hw *hw,
 unsigned long sifive_prci_hfpclkplldiv_recalc_rate(struct clk_hw *hw,
 						   unsigned long parent_rate);
 
+int sifive_prci_pcie_aux_clock_is_enabled(struct clk_hw *hw);
+int sifive_prci_pcie_aux_clock_enable(struct clk_hw *hw);
+void sifive_prci_pcie_aux_clock_disable(struct clk_hw *hw);
+
 #endif /* __SIFIVE_CLK_SIFIVE_PRCI_H */
diff --git a/include/dt-bindings/clock/sifive-fu740-prci.h b/include/dt-bindings/clock/sifive-fu740-prci.h
index cd7706ea5677..7899b7fee7db 100644
--- a/include/dt-bindings/clock/sifive-fu740-prci.h
+++ b/include/dt-bindings/clock/sifive-fu740-prci.h
@@ -19,5 +19,6 @@
 #define PRCI_CLK_CLTXPLL	       5
 #define PRCI_CLK_TLCLK		       6
 #define PRCI_CLK_PCLK		       7
+#define PRCI_CLK_PCIE_AUX	       8
 
 #endif	/* __DT_BINDINGS_CLOCK_SIFIVE_FU740_PRCI_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
