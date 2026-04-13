Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD1E8EBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9aeH5MMbRmw95oe01T/buNHm6hGCwmTzcI6KThSUckk=; b=0iFK6ra5sVyNEX
	ooGyv3e0vQ3GQawyBL37nUjJ4d41c9pgeWHnzJBK38ja3P8DHfwSMKGOoRG/fJNPS2Su4rwoSRXqM
	B+I5rjDYL+E4CUY3g4+MSV0yUyNMs1UKVcd+h4WnEGmjeFC+DmLUdeHx8qLOJGY2kU3IJ0uoLO2j7
	uRAjLM4pv0O7FbS/PsnKy5XQeG7dWq4DDFWyl4/R5GRNa8ciGPM/ZzP0PgI8G+KBjIxndF6HbULfW
	U8ZzQxVL1FyKkpV3PrykPaf+Oi2H3inQ7UUdfJeZjkGTefZvJZEu/4j+ul6oY7uYjoWtG4BFMEitO
	gg0u1exZjF17W/JljmkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFp-0000000FDAu-45Lh;
	Mon, 13 Apr 2026 08:02:45 +0000
Received: from mail-ej1-x633.google.com ([2a00:1450:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFn-0000000FD8f-3FGH
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:44 +0000
Received: by mail-ej1-x633.google.com with SMTP id a640c23a62f3a-b9910707d82so492526366b.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067362; x=1776672162; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=ClQeYS1qwkufdsQZrFGfdGmU4zig4GEuqSVCQkZuadmcUXGf9n/2xvhF+MTMCTs2XE
         bjh2uEbvGg8EoFApJSHoBl0frwCPpVcwAOX8i3AIissn2AP4yoFh+nA+tc1xS10MoJYh
         YRKPGbNX4NnuIeqzglZBXFa+GkWr5exse5KyRYK19nt0OWlMxU2PT91yTtdsFionyIoY
         4UQ2W7FuQ5s+YNORJ8qvlxSkqHSK5sM09IalUVIA5t8V+R09k5Kf53Z1/nn0QWUPuHwr
         JLBokKH6axgNFNgTCQ6KICHb+cER/WJ8pRygcDiNuyGey0gyDOd9ww9C4exMqV2y+U3Q
         HXdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067362; x=1776672162;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/k4mLTIsc5RI8xaNMKymA8VHdibedwqV8+ItxZpomdA=;
        b=YmVB/zqiZVy9TdHLp4xPnGG1o0oLLRqKkvHzpgVaER3Mw+WUdwK8TJ9L7LwPI6ipqo
         dHonX8b6c/3NPtMueE5EXOC26rFZfP6g2lcqJWc7JbJmvNL1nqEUpVj/vJfYSGjTZuCm
         wSXmUTCuF2dY92kFGloS+eyCv47VJLJHKT9zZkJO5u5yV49fsOA1YTEhJYyLmcm7BXer
         3DUYcU63fpmDfJdt8BRsnUCtGq48os1dzEvg528QJ//mhy8UBRSpHVopiwQnlrhe9g7S
         TLzzNJRox+46IhzvnoNRinGCHISn0Hnr8IbtRwAfSVfRn14uKXuOgtMQjwcAcrK2+19T
         pwMQ==
X-Forwarded-Encrypted: i=1; AFNElJ9IIslQBh+UNesov/cKAJ5pPedh5AFOo4wZToD3rbq5WcvwKm38rcuxLfnYGAUkMCJElCf6SQfPneIqGA==@lists.infradead.org
X-Gm-Message-State: AOJu0YycxoYNCusIsq16mNREO9fC3RhmjRPoiJUn+PfD3zPwEkynVcpX
	azUyehXKm/WUvAbjhR/G6jlYhf2B9doaLO3a45++akm+uhSYulh/lOBh
X-Gm-Gg: AeBDiesJ575CFuRHoOshSw8/QePf4lYRVsPqns175chJVnCV8MhiWLGs89UK4xjDd1N
	ujTGtRT1C+O4LzJJ4bio1Yhm72i2qoidgBsg+MB2ijJiROzUQ48eORG5K306ZmS0f7uBz245pvd
	qCj/eu7r4Yfdg30KKaBrTdnkb+Awlraf5KgyuUJlR5Frkuso/EX3MR+jRU9a4FdqjHWsc03DDEu
	0hWUEu4wI1QsesmF4PrpZRA+jQ+OdOfcQHex3NiCBKVdw0pU9IeyV3IiiIM48OZfh0peyed28Jt
	LAQS7Vpn81BFlQCYy/vY27KeFrcydYoA+OEufbiwYrJZ5jyixUkTAGD62W0DkellsLNHPxufqYf
	oqDxat6wNBwSxbN5AOxXYLhQHGtw97H958wfBlieJPrw9loJD8r9Ec2J1SSm3bNsmBsSAkf3Zl0
	qjUtP4G+qpN/nZAmn57eELdlQBvRzFJ/M2gtm2syfyHKyxjJ8XdMM4VG3mkMnYK75F
X-Received: by 2002:a17:907:6b8e:b0:b9c:c40d:bd2d with SMTP id a640c23a62f3a-b9d7277c7ddmr642261866b.10.1776067359772;
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:39 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:12 +0200
Subject: [PATCH v8 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-3-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010243_852218_955FD09B 
X-CRM114-Status: GOOD (  15.12  )
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
