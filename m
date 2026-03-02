Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85F4EEA4E21
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Mar 2026 15:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zh3qkZOnCfm8L4x7kENlWGE3Xdyc9JPyuQ81fxmMJtg=; b=uJ1HDN7GvkNnn5
	yv72OjJ3lSTqS+1dzpBB0UnL/CpSj4Y1whA5OKMkLwye/Ma0237j3p/w29I+0K74adT56Ea9Snezt
	d2edvRRzEkPKBQM4y96G6ck2ccwt6A0EdZwl5yp3UUrQ7cQvz42revlkW7jO1pwgu3FnRkHIxipZU
	e/nHclTJ60CCJFNEDJ9eMwtE/mJJbG7Muujq3o+i+xfG/YbAXT0BH9ellAZYHPZbrYgFFh/Gm1zjh
	11vw4ri48bwrfzDpgHE26lH7FtyuKkIdnRDOjUsDXCFwKUnncFqn0wJIZs+v11gZmxZI+0tjnbC23
	EUdb8k/KlwQpIHzPJQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y8-0000000DK4H-1ktk;
	Mon, 02 Mar 2026 15:14:00 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vx4y5-0000000DK1M-2Oez
	for linux-riscv@lists.infradead.org;
	Mon, 02 Mar 2026 15:13:58 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48371bb515eso70317935e9.1
        for <linux-riscv@lists.infradead.org>; Mon, 02 Mar 2026 07:13:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772464435; x=1773069235; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBh/BEMhIYd7yMIKn9wpAoeG/vOOsjbo+uR3/+VkGQw=;
        b=jzD2SKm0Apb9M0K36uQ2kJ3139oaDL5EceoWbvSTurmjMWfhSvZkFk+kUgbvjui4Yz
         2xDw30PgIrVaL1AYR9vcaFeqA6YD7CTNewM+IBJM965isDRp2KclmocWuEpXpZGtS3S/
         VxW+sBp7Kt/JVNkgXTFVlFcmbKDGGri3MaYOE5RcCBleLtcm8uECIcqE5pUNBQ8KZP4T
         MrDSXRRsIAsYtMwlXcvoAjm34pbywbQ2VzKaQtpqZ7fdQOZaj8YTqnRl/uOJo1KfdpvY
         zUMw3YCBsk0YcQzp96yOULeZ35+3Dky/Hm7TpiculXTOuRgKTspiGFZY9Ezfg8lBa/AA
         fMvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772464435; x=1773069235;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eBh/BEMhIYd7yMIKn9wpAoeG/vOOsjbo+uR3/+VkGQw=;
        b=bUW1zFe+upwPxJwk0sadk+0OP0+V5iAYDploBCqCFsUCSZhVOHA2RbjZaZZy0EOazX
         LoqG6BqZrUELLFEM+XnkvKuk4hJD/8Z2zIq3suwj5EaB2Di+HH6KlsqexiIC7aLCwlmT
         1uHJuiixCNctfHbVA/JbmZj6P12Ahz9fHuOGT4aT/rhOPtRZAVgIlZ8ICrYiH+o2Tosg
         uxN+e6rhslwCUb8SHrODfPQQICGuKwbSLSwssCKqfBiU+OvFznt1TzO7JNKAiZlXpGMB
         suFykq/8NH09M0PB8+9AGr1zPTddTCVuzqEXiG2l5lcf+HcRk/EmJ9YIMUsUUzN41rqc
         y5GA==
X-Forwarded-Encrypted: i=1; AJvYcCUPvQi+hsuFMBcXT25kdZtVEoEMR/OGx08p9osAhweQQjio7zSFHq6DhOAwQOCyTO+DjXVeIkIlbe0DdQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzwjH7Ql+JKh5pG4T+DwEKDrErfbApzN9gS94shenv3SWwx5dgr
	gQY+95vxtZW8AZhvs0erucIk4BnJkqnzKT0bV7KFpM0l8GQKhMgalCme
X-Gm-Gg: ATEYQzxBuXWesXlW7ewVqXYRUbP4HR6t6MRFqYAEDzU5+URUMnr84W3/Rf6OAwbsTBw
	TvF1TXFA9zjGU+7OGq3O27IcsYPcDBAFo+CedPHi2PwrgM0QzVDjqxqJPx/XVSTCy0UMGy3SqUY
	f+u6H32qj96dhLSifuEabWmromecxMyLn7EBQt4HbjQXJDv/OCZfqWGFc6S6T29gu8oSOZI4Hlk
	fnmkbmCJc692rPEyKmAw2K/+/j/kUUaCR88Q7C0sovRKzYOAc+FhwJAy9wqHmy8zmSHPuwFT52F
	USf8vV670oq3J+DhnRXY37zE0HvBgka8hkMe3pknYKq51P12/35tnevxIPmW+IBJhVcAiPqXzo8
	N8fvzCL2KpDNDpK7joC06pqrC2vBR7wQLskY4aATDodzqgnz0VHdaKzrO+/RYenApP3wF7R9SiK
	CoiQZtHatkeSmo64/smwYd+vM2IU4zUStOQqu+H4M4s50wyj4cEcKq0sAYrcJ8TvCcEA==
X-Received: by 2002:a05:600c:3b18:b0:483:b01c:9508 with SMTP id 5b1f17b1804b1-483c9bb7c0bmr236115405e9.2.1772464435275;
        Mon, 02 Mar 2026 07:13:55 -0800 (PST)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.131])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd70e692sm437240265e9.7.2026.03.02.07.13.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 07:13:54 -0800 (PST)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 02 Mar 2026 16:13:25 +0100
Subject: [PATCH 04/10] mmc: sdhci-of-k1: add pinctrl state switching for
 voltage changes
MIME-Version: 1.0
Message-Id: <20260302-orangepi-sd-card-uhs-v1-4-89c219973c0c@gmail.com>
References: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
In-Reply-To: <20260302-orangepi-sd-card-uhs-v1-0-89c219973c0c@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Adrian Hunter <adrian.hunter@intel.com>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_071357_640772_44EED353 
X-CRM114-Status: GOOD (  18.11  )
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

Add support for switching pinctrl states during voltage transitions to
ensure proper pin drive strength and configuration for different I/O
voltage domains (3.3V vs 1.8V).

Pinctrl states are optional and the driver degrades gracefully if they
are not defined in the device tree. This allows boards to enable proper
pin drive strength optimization for UHS-I modes without breaking
existing functionality.

The pinctrl setup uses:
- "default" state for 3.3V operation (higher drive strength)
- "state_uhs" state for 1.8V operation (lower drive strength)

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 59 +++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 58 insertions(+), 1 deletion(-)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index c260cb89704ae7a25bec0f07831d495553405bbd..2a982bca2a50ca96f43af7b4de5bc4fb4b5b195b 100644
--- a/drivers/mmc/host/sdhci-of-k1.c
+++ b/drivers/mmc/host/sdhci-of-k1.c
@@ -15,6 +15,7 @@
 #include <linux/module.h>
 #include <linux/of.h>
 #include <linux/of_device.h>
+#include <linux/pinctrl/consumer.h>
 #include <linux/platform_device.h>
 
 #include "sdhci.h"
@@ -70,6 +71,9 @@
 struct spacemit_sdhci_host {
 	struct clk *clk_core;
 	struct clk *clk_io;
+	struct pinctrl *pinctrl;
+	struct pinctrl_state *pinctrl_default;
+	struct pinctrl_state *pinctrl_uhs;
 };
 
 /* All helper functions will update clr/set while preserve rest bits */
@@ -219,7 +223,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 static int spacemit_sdhci_start_signal_voltage_switch(struct mmc_host *mmc,
 						      struct mmc_ios *ios)
 {
-	return sdhci_start_signal_voltage_switch(mmc, ios);
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
+	/* Select appropriate pinctrl state based on signal voltage */
+	if (sdhst->pinctrl) {
+		switch (ios->signal_voltage) {
+		case MMC_SIGNAL_VOLTAGE_330:
+			state = sdhst->pinctrl_default;
+			break;
+		case MMC_SIGNAL_VOLTAGE_180:
+			state = sdhst->pinctrl_uhs;
+			break;
+		default:
+			dev_warn(mmc_dev(mmc), "unsupported voltage %d\n", ios->signal_voltage);
+			return 0;
+		}
+
+		if (state) {
+			ret = pinctrl_select_state(sdhst->pinctrl, state);
+			if (ret) {
+				dev_warn(mmc_dev(mmc), "failed to select pinctrl state: %d\n", ret);
+				return 0;
+			}
+			dev_dbg(mmc_dev(mmc), "switched to %s pinctrl state\n",
+				ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+		}
+	}
+
+	return 0;
 }
 
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
@@ -301,6 +340,24 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 	if (ret)
 		dev_warn(dev, "Failed to get regulators: %d\n", ret);
 
+	sdhst = sdhci_pltfm_priv(pltfm_host);
+	sdhst->pinctrl = devm_pinctrl_get(dev);
+	if (!IS_ERR(sdhst->pinctrl)) {
+		sdhst->pinctrl_default = pinctrl_lookup_state(sdhst->pinctrl, "default");
+		if (IS_ERR(sdhst->pinctrl_default))
+			sdhst->pinctrl_default = NULL;
+
+		sdhst->pinctrl_uhs = pinctrl_lookup_state(sdhst->pinctrl, "state_uhs");
+		if (IS_ERR(sdhst->pinctrl_uhs))
+			sdhst->pinctrl_uhs = NULL;
+
+		dev_dbg(dev, "pinctrl setup: default=%p, uhs=%p\n",
+			sdhst->pinctrl_default, sdhst->pinctrl_uhs);
+	} else {
+		sdhst->pinctrl = NULL;
+		dev_dbg(dev, "pinctrl not available, voltage switching will work without it\n");
+	}
+
 	host->mmc_host_ops.start_signal_voltage_switch = spacemit_sdhci_start_signal_voltage_switch;
 
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
