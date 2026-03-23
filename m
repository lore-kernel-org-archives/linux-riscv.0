Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A599EC01C1
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=itExCRygk3T757xQjRn1tevcEN/ySO/LDM4pUp8W9MI=; b=4b1WSOg4NM2ewd
	wHqFxa7J9BlT/wx7pL7aJ2PB23ioQqHpzHehu4V3jyIJtDrF/Hm9vpgsOLWNf4D/jl7tF++tZ8SRu
	ng4DhWrcHkCQjlLX9WvZ7fpsYNrpFSmDYOsvvp2RxSuNh5cpeHLCfXKcWQ+k1wlo2ZsFdrvNri/D9
	3ZDR81raD/UvMcXxo84nUXh4jWDZBUeJzI5mn6g98kze7luID/apAWZZvkuSvMPUbMZ7iEgHwz9w4
	fd9OGM0NGdhlXJu/Hs6GwaTR6gadygxh1vrP7GPTdJOIEgMl0VJgxXXy253KypslyZEGe4LW/B4EP
	R7UAvZfXho1tsCnh9wMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNl-0000000GU2A-1pTS;
	Mon, 23 Mar 2026 10:19:37 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNi-0000000GU0h-2MU9
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:35 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-487035181a7so12456135e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261172; x=1774865972; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2BsT6JJye2hc6dEStRqlQwTUPLoIQwEfV/djOfhm19A=;
        b=XCQBViCxqeZC4spbF8xju+2RawKXhseU5RRP1rNsJkSNVnOaEaNhyPM6PiW2P9QZKB
         aW6q/edcermcWKQJGco2NOWprUKIUl9Ow/Qxb+xNNJrieBFHlcwPRvQfCUpUrvp6ayn7
         qWn1aPnvLbTS7OkHnIaclkiQ/s9eWyPj3pIU1Da+GnyeTfy9+rOzAph/D/qGNIX6/tQT
         5p0gq8WM96Gysr/j6rzayJiFXJw3AKuyN8d/9D54qnWzrw/sQZq7b/dDRzA/NYbF+Hgo
         JkQhF1W6zaynKkHo1Ri3sxpJ5eVu/wkslRf/qlgP5unLhVUdy9mevnd4o5dj5D4KsESv
         DIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261172; x=1774865972;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=2BsT6JJye2hc6dEStRqlQwTUPLoIQwEfV/djOfhm19A=;
        b=Z/TSk936pVo+ybLrnVkz9iWuPh0nVQqoxei5Dbv5EY/UgGjpZpF2OL1oBrgMT1Jd4D
         QC5lUK2/A87EuBk8OxrEaT+1UQwOQ/sHTH63Wx55JqIWX8OSvCMEor2srWxmEhFjlbgU
         gKbhGWfX65MAh0T7lV1ddv2IadXkpHIbPpviX72j050ExgDwmz3m02sf9MzaWQaSnPmf
         9dA0UxiWf9pJkO/46FFdJffxT5kc1Z4owjv3u3eG50/bphLi5yZoTAl3jcImOlBfaDmy
         vvF/GmBjpT85RhHoyJq5UhwKLTZohY8a1JdK836ZDvzLhHmr4IejpA7W7R9PLDXSwRij
         Drew==
X-Forwarded-Encrypted: i=1; AJvYcCV6aNH5BopOpzGV+mB4CvFvHA4fO0AXNYUKP1ZAQ9YhdyTTmrqUq4nOBwxKdvSqN60utcqB2MCED8g5jw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yzgs4v5le1p8FL0ppmOKgqNTSDbaHezGSfsMQ8C1lqfTLw0OB+G
	D/KtE1ziYSdezKly3z/qII/iW14imYDEkhM3ofsRP91tCyTKA1gnVx44
X-Gm-Gg: ATEYQzwgtTjRIvhmbN3zPtkcc6v6ZfzZ1EmQ6Jn7YSiWfjMismevnDm+RFZkD1XnE8u
	0lI4TuKu+tPZeOm7a70viKhjIw4qsRWA7gqBDAIo13BQhFyO2F66JDOQxpWNBDEZ2EFn7S0buyT
	1XQffFUUZh587sxPi69JzCwGmi2ERkGnEREttcyiQ0XONmynQvUAULihFnX/HBcOLlLD05ZyKa1
	q0fR6lstj/nMVApwI2wAx5PheSY0ifaDgh746vIfCyzIqG8d/ulrZQow8ZvHjhuJAf09Tswx0kx
	i7y37QLfuvV8I8ABL87bCma4Q3F75gHRztq7vGPG3RFPljPVDmFmKqSIOe7Rw7o+UeDYc7hFzCp
	lNT/3f2x7h56kS/MUIYHh8NRFydzpaBf4o1svt0+8Du24OuuzTCuomdgrvAHKYfCTWsAKHHsbM0
	t4H4C3t+eF/Ms/6RXTX+ZbksQbW/jpkOFn8PzeZ03ZAdES7L8Tf8VYJLxUGy5WYQBM
X-Received: by 2002:a05:600c:45c5:b0:485:3b34:2f51 with SMTP id 5b1f17b1804b1-486febbc66bmr166065695e9.4.1774261172487;
        Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:32 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:05 +0100
Subject: [PATCH v4 2/8] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-2-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
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
X-CRM114-CacheID: sfid-20260323_031934_806421_0F89FC83 
X-CRM114-Status: GOOD (  15.35  )
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
