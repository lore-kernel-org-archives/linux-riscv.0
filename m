Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0031EBFD0A
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 07:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aeH5MMbRmw95oe01T/buNHm6hGCwmTzcI6KThSUckk=; b=338rAFrq7XSn44
	uP47hbJ24cgqRAyb+x/tbEGrEHUW+OjONu7Qd0lJDrdYfHylfsyLvTEcjaSRKfVZt6ZnS8j6/HPtj
	TQtGyk3zptBSt1BH6sgOMamDk3u5E7yqoHzvy40v0xdPegxTVWtelRg0v1w2cx/O98TRz3GBZPPwt
	Sbc6MkE7aKnvn/bIWw38buMa3PAH2WVFEq7mjpQ4ljSkODXOECiLefIKAAPZVJDXHb+FOYat+qjWR
	Fpkl3mnjx91fC92MahS2CaAdCSMUGuIqGrnCsl4If4ZW6QRPAoiV9mXogXWu+0Ebz4kw7r+GGdojk
	ERknBtR8ntUmdU/HI4vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgQ-0000000F8Uu-3GOC;
	Mon, 13 Apr 2026 07:26:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCBgO-0000000F8Tk-2tyv
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 07:26:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-488b8efed61so37774945e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 00:26:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776065167; x=1776669967; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=XWes9+3X4b+ww6EvVKrIoOLHmfNt7LvlRqUC29Oe+5xz1vdLGOJWmfdISRDNF2rN7o
         wjaL3qLpj+WiyFl+CaktkQyzlolzgigZvvE5LVXT15ImABD0lbBo6qPTmkr1aXACH50a
         8IYKivNTxHfpzyBxFu16x+hDS69lHiXGVHHiff+BRJ63eE0WqF7sa05nY40i07Z34TO8
         uQYepSYnphIZqdWjWbO2XJl32SLRUIIHHUOxdTNTbmmb4rUNKZNOc+U+S8FdYLCJsAw7
         0PrNjv6RGENllNeQB46FkIaXdgD8h07FiJ5ENXEBPLTOnjcG3Woi/7owVzwbDXb4uvJN
         xjGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776065167; x=1776669967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=GLr+fC+7li2oEXTVo3vJs1/FPV9wJ0r6trhvRx/dYDlPoOYtk7wDzfuKWWWcGdgP8l
         yUSgSZ3Hgmv/+H9r3FlMRqUenQsws1ziqCy/bu+EY2ZQsUWPbqcj7lGy7y9tOiv7nZuu
         RoncFRsEHE8yZU8oywNTw2IueVXdKorJeOS541GIN3w1079aD1nvPCeHkWOiboKgQKhP
         7powqzYVdbePrJbg+ffa5pFw7/NuniiDZHZftykHCL/K7S41d5V0MlMV6Eo90PZ4y65z
         DCosofjbeBEqPCSsMK4HC8/1y5UwCmUJ98e6CDrCn74tH00dx/C+XRMjXNgGCU4q9dA0
         DnZg==
X-Forwarded-Encrypted: i=1; AFNElJ9YKkoLLOmx2yu7qtTPPZqrDKyyhab13vaqjrVYrSSqaYRtmlIZ4L8ZUJ1PmCQP4EGiB9XcfpPwnU8ILA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg2upjYpEIZQCd1iVB7hAUhmYKtMfOLx1OlflNJKcKEu9Ecvq8
	Zx4kT8tTC0X7cC/YZplNRO35BFydSV+Xx+ko0CoZlWp95WQw+INDXhKi
X-Gm-Gg: AeBDies2hJ5AH7fTsMuJkvd3y5kvtg3ZlLAF5eCZhhe8exbH32Fw1vgFt827oWuoKsE
	ywVAmTOdcougL62W+frzaDXER/AXVbleVN9bzDzessnKSaqA+NJPspWwfFyRDEmDCAxlUnvaQeQ
	hHQDM9wTKyLaHGPiXoY0JOTZ94NBcgMvPywYKFsWQ+JX0lAK7Hm4JzUw9NKBOE1uKKgOQDVCZuF
	EXgAcAC0EP69j8Mczgtc7OUREGCC+BqPesbvNqUobEle2b+Il53vUTaVVFrs++yXMarJue95toN
	K+fig1go7xRvEV1HZZy8MJeGQgso3/jfCzIzN+gbdp0avyprYrlkwg/yOYquX4V5q67kmglcPA5
	BW3rdXHRdzU6bl3618RdwRHx3XYfpv0EHZbAvg9K2+N0DKjD9r002wOjPmIoACidqAuy4Il9T2M
	axX9OdiLR0UXlsZg6XEwcCvDRG1InK2FxOab+Ij1A9CyTMOoyKlooJbS7KyEJL+Q65nw2/WO/+F
	zI=
X-Received: by 2002:a05:600c:8717:b0:477:9890:9ab8 with SMTP id 5b1f17b1804b1-488d6816f5amr164955675e9.3.1776065166673;
        Mon, 13 Apr 2026 00:26:06 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488df2a1237sm322180555e9.6.2026.04.13.00.26.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:26:06 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Adrian Hunter <adrian.hunter@intel.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>
Cc: Iker Pedrosa <ikerpedrosam@gmail.com>,
	Troy Mitchell <troy.mitchell@linux.dev>,
	Michael Opdenacker <michael.opdenacker@rootcommit.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	linux-mmc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Anand Moon <linux.amoon@gmail.com>,
	Trevor Gamblin <tgamblin@baylibre.com>,
	Vincent Legoll <legoll@online.fr>
Subject: [PATCH v7 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage switching support
Date: Mon, 13 Apr 2026 09:24:45 +0200
Message-ID: <20260413-orangepi-sd-card-uhs-v7-3-16650f49c022@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v7-0-16650f49c022@gmail.com>
MIME-Version: 1.0
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_002608_781332_AB80EC7F 
X-CRM114-Status: GOOD (  15.30  )
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

Add voltage switching infrastructure for UHS-I modes by integrating both
regulator framework (for supply voltage control) and pinctrl state
switching (for pin drive strength optimization).

- Add regulator supply parsing and voltage switching callback
- Add optional pinctrl state switching between "default" (3.3V) and
  "state_uhs" (1.8V) configurations
- Enable coordinated voltage and pin configuration changes for UHS modes

This provides complete voltage switching support while maintaining
backward compatibility when pinctrl states are not defined.

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b85..d9144537032a 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -16,6 +16,7 @@
 #include <linux/of.h>
 #include <linux/of_device.h>
 #include <linux/reset.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -71,6 +72,9 @@
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_uhs;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -219,6 +223,46 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
+						      struct mmc_ios *ios)
+{
+	struct sdhci_host *host = mmc_priv(mmc);
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct pinctrl_state *state;
+	int ret;
+
+	ret = sdhci_start_signal_voltage_switch(mmc, ios);
+	if (ret)
+		return ret;
+
+	if (!sdhst->pinctrl)
+		return 0;
+
+	/* Select appropriate pinctrl state based on signal voltage */
+	switch (ios->signal_voltage) {
+	case MMC_SIGNAL_VOLTAGE_330:
+		state = sdhst->pinctrl_default;
+		break;
+	case MMC_SIGNAL_VOLTAGE_180:
+		state = sdhst->pinctrl_uhs;
+		break;
+	default:
+		dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage);
+		return 0;
+	}
+
+	ret = pinctrl_select_state(sdhst->pinctrl, state);
+	if (ret) {
+		dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
+		return 0;
+	}
+	dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
+		ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+
+	return 0;
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -252,6 +296,30 @@ static inline int spacemit_sdhci_get_resets(struct device *dev)
 	return 0;
 }
 
+static inline void spacemit_sdhci_get_pins(struct device *dev,
+					   struct sdhci_pltfm_host *pltfm_host)
+{
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+
+	sdhst->pinctrl = devm_pinctrl_get(dev);
+	if (IS_ERR(sdhst->pinctrl)) {
+		sdhst->pinctrl = NULL;
+		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
+		return;
+	}
+
+	sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
+	if (IS_ERR(sdhst->pinctrl_default))
+		sdhst->pinctrl_default = NULL;
+
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "uhs");
+	if (IS_ERR(sdhst->pinctrl_uhs))
+		sdhst->pinctrl_uhs = NULL;
+
+	dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
+		sdhst->pinctrl_default, sdhst->pinctrl_uhs);
+}
+
 static const struct sdhci_ops spacemit_sdhci_ops = {
 	.get_max_clock		= spacemit_sdhci_clk_get_max_clock,
 	.reset			= spacemit_sdhci_reset,
@@ -324,6 +392,10 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	spacemit_sdhci_get_pins(dev, pltfm_host);
+
+	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
+
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
