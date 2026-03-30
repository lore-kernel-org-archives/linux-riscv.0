Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6AABF3D61E
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Mar 2026 08:38:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bVlaIeueLiwLyZU5Qj4iyqZk6H94RDhCcjruO9lE2C0=; b=LmFOZAuONY96yA
	XaN2K0QLd6OIpXmG4qnsFQ4tWIF5sJimaoy5RC0CuK28vtRv79sF7AxFZ5TNovNCW83UYVwDJ0S9q
	N5KT+BQ1waKijX7W+lYM54FiOqoIEe54uTS0CC93OjDWpDlo+GSHLp5fpkzSzJ4OfZG7tROD/CIWY
	0aUGYPrLifb6GGoabmz4XgriQZ+jio9B4drQgCjIxI67Nlt1K16Iz8tUAEogQoLNjhhyYlMjRdgW3
	Rvs+L1OzPIzAA1sHxo75BndTDIsK8+zMz2QV5YyFuC/wmy7nfxO4JsqKeq34/tdVRdDAtJd6OtvA6
	83jmHvZAXxUST95jGXfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788o-0000000Asuy-47YR;
	Mon, 30 Mar 2026 08:38:35 +0000
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w788k-0000000Ast4-0nwI
	for linux-riscv@lists.infradead.org;
	Mon, 30 Mar 2026 08:38:31 +0000
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-486fd5360d4so55855415e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 30 Mar 2026 01:38:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774859908; x=1775464708; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RM2PI1Utklboaim1+XGDH9DAYZ4UPq5dLeIx/PUc2kA=;
        b=JWQi/f0K7ORdL9QN85J+xSRuE2FM+Z/y+xlZsD78v7SRKfA9RHwzOXj40m2CF2zeEx
         +RwGQfwP4WUM1xh/+2hYAg52gjJ6pBy0uRJE3OTYtCjqIyLPnZkgwvTZvoCSwPrYqRo9
         U0ryM0Nhm4DikpVRDqfFPq2dQd4T5ckqOq/Efhq3CggdJMrQLrepp9iE5r1p6T1ixmWd
         0MSUw6egKekGKQNEiLHHUg2Pi5bIsFrAN+C1eWIZml4a2rEK8y8tw+kY+GvATcnXmc+E
         on/J+9/o7OPwGw2G34M+jojR6MWFUNmAJBLCCCOV3VeC7NFWxCZCLjQJqR1ePyNZnkvX
         pe0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774859908; x=1775464708;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RM2PI1Utklboaim1+XGDH9DAYZ4UPq5dLeIx/PUc2kA=;
        b=oiT2d5rmUqVuXSQU/Yx1pxoNGy0gj6Q0JUX6zOdHLjwCucHknS7y3SMnoXSwxwknW+
         Km2Nj2Tn6QgnJ3SD6t7361x4+msbUfqoRSe0fs+lSqoHxGeCfCVXjJcjkmRoJI82pxbT
         G21SY39OmNG6d7fhOc3Dg95EsBfzy9HP+TEeWlt5yqX9uJPVDAUkxhZlLoIhFvRiu1As
         m9QYdd14HLAZGAY9TdZR53UNpJhLspI1ln/GuZA/Dote4IFyiDlVNjfUhydHP4acAL6V
         ub4FJCIExBLFhlWvqrgbz3wJ8WylLHjvDHdgpM3xCvZoO7sgiRCt++RUeaZwquTBt2Jy
         n7dg==
X-Forwarded-Encrypted: i=1; AJvYcCWb5exMnnTeJrittSE/iYSloGRElddlQcmbidOb3lnwnyJke2lm43ILdlYD+oi+PdIIG/7CIXsthbQDMA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYhYYrn+ZjLBhyIK6cDzx6W1cdo7zxWFkFz6xuKOBy5rFNBw/A
	Az1rNGn6O0hiKFsqKB9e1QAoLVgwGhcISGJK/E1oYyLwO9221sT+dGrP
X-Gm-Gg: ATEYQzxSGGkeUdoluuYWjfBErtiJ8rAiDb9eF2nrFIszl5v1+s5/TBefpTgPw6HdbI0
	ADo7/KHHNPnMkgPAwuOTthx6uG7BVQkM0zI9oFKP3KDMOuWOw05m7aA67pir0SZwKUpBUKx8Ek4
	dWlBhJB1QAiO50ItNDGzgT9ZQM9di0PEG/B2FWX3Qk9pZYojvPI6DQZriQha3sHIzuHam7Slwl/
	CDSY1UKKMyzT/4knjR2aV8qqJ+aQrBQGyiwbIpr9oZfAoDhuN9o8/hNC15f2w8RrfpSdpvdHCHK
	RnYEjGTvXH8U0d4HGQUiA8SXgbO2hFqkgs9/DsfkacLcwDKZ6ATDqkhzdRM76WArZ98shul1p9/
	GCSOq0QDdS+ew/20ZDbYPyxT8Gvm1NAD7wsnnQjyOO001ttZ6+K1g5tqL0eWShKVbXJGDpv1mMh
	Q7htj14BTGvSgAJaQXo+/2UILPoGmOFrRvOuzVg4bQSomlMzVtcSOFiVEd0bPXxcJY
X-Received: by 2002:a05:600c:83c4:b0:485:46fd:7887 with SMTP id 5b1f17b1804b1-48727d8816amr191754305e9.13.1774859908252;
        Mon, 30 Mar 2026 01:38:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4872712c236sm74063315e9.14.2026.03.30.01.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 01:38:27 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 30 Mar 2026 10:38:04 +0200
Subject: [PATCH v5 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260330-orangepi-sd-card-uhs-v5-3-bd853604322d@gmail.com>
References: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
In-Reply-To: <20260330-orangepi-sd-card-uhs-v5-0-bd853604322d@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_013830_286162_727B91F2 
X-CRM114-Status: GOOD (  15.39  )
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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..234e258af25996e7bbcd0b70366c7480bf62bee7 100644
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
+	sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
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
