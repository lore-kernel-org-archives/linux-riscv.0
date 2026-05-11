Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DE0CCD37AC
	for <linux-riscv@archiver.kernel.org>; Mon, 11 May 2026 08:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1BVCosEeztJrfNqUCe0MyGfa0I6PcLjbF8q8sLC2UaI=; b=AeVARBKEzHsnCi
	WudjZlebcUewSWqz/X9THkxgJayI/98dSV/25jTkSMzXyNsknMbCBR/TbYCgEvodZ7Px9eLMV3Tdp
	4M5cWRHhfWFVtxrTPupmrYpfR+oWt1z1kMi/xBRcHdiMY9SujzF2czCYEa5PlV/o6EjvoEE2MS8/C
	JqLSAyy/l4jFMfR39jO0jdCB/gUVSA9dUC5HqIWlAruVwntEEgYcBob+6daDnlLqkVEBswvKaJA7K
	51cMwkTh7TbhLFg1vvPHY6dUTOh3HsBh32nZYwYvlvWtkANCSJRrgepM9bX0kl33DPn8lIueb26Hq
	IGXSHPJH/uXX9zJxCL0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPM-0000000Co3p-34WT;
	Mon, 11 May 2026 08:54:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMMPK-0000000Co13-03xZ
	for linux-riscv@lists.infradead.org;
	Mon, 11 May 2026 08:54:35 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-44dd5cb0f81so3204718f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 11 May 2026 01:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778489672; x=1779094472; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qQW1TmR9evC/67fcZb5WXGa69DfOLAbqQ0G8sRDSbLM=;
        b=Rhrttd9oz6xK1JXpvGC9aLM69+miE5SHhC8ALL4HPeXQGVqWYWUOkovdi8llvfIRQ1
         kX3NXVkG/OvZ/M2kc52PXSZ3TMuT+XTO1YRkV+Ny0XU3kRWZn8xQ8Ie0STjA8jbwV+4L
         GfIYhJiZeKEJnjQGBPUxnz4ZTh3CzsOJgauTT0/HwBKMVi4CpeKJDsCsS2MuzbtcEf9P
         t9xanihMYUaJqPTYQWR5syFn/WG4F1v7T+EbHzs01hK+CX4AA4sLgXc9DTrikJJkRfmP
         GKOr1txM6XZ6qvXvcyPGD0/z5RmJXzNMPmZylPdR4ems4p8Zi2iyP93bP4zIzD5tdsVE
         RxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778489672; x=1779094472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qQW1TmR9evC/67fcZb5WXGa69DfOLAbqQ0G8sRDSbLM=;
        b=X/sZdNWB1xYm1h4OzGZhttWYj12SS2PI+VIln1QXKmjYvyXkEJ/PQceGYG2voX1twM
         64uPaO036C/ELuu9KpZLIW9Vq0+3DYkluic4rZBQ6lACatEodOdbIVn9O7oh0z1U1lKY
         un1D71nWMCkNn5XE+esCM/hCGZYPF/RMZrAXWx6/RKImi+c74VPKNpTfy6krGv7s/g3P
         qOm3VYXjJq2Sk/ahQwUD6d+LBd6rucSIGUpaF+0I3DidFliAdZEi6cT0o9yF6prpcmQL
         WALYEcxL6t/rqntOuF0Y+cJIDjiU5tB1YC9mhWPelkaDhvkzQJ7DIfPsGwWLW6NFFQh3
         K4wQ==
X-Forwarded-Encrypted: i=1; AFNElJ8rTod6GyS39BUosybl8B4X/socV/Jzj12qK/pvfgU+ZhTdYsKZKRusZDDHMeav6EfALhb2t/dm99L7Lg==@lists.infradead.org
X-Gm-Message-State: AOJu0YyepV97GLAwPiQzohBQdir4h2eBRHrsnQA9/jWNfSH6SoIG7rvj
	DaIDe2eJbad1fomdxM+KSY8Exrp6EqI70xczdtpt4OagVAaN5EohkuVK
X-Gm-Gg: Acq92OEZYlZ96s+jCEHpZmsgaSYdOXIYFnU1xLXdNnsQXXJyVNEyjycS+snsHGabXre
	d3EocD5r8z3Veh67iW0FeDcuE2IuPa2yW17rxyJwSAv5XoOtsbsJlHfzClzRwFmOKZEdwxIQoWl
	94bAu9syM1SpFZLjYBpxqZtFQQPKYzXnDtl/XkCvpQlgKb4HowMtqz3U+TtuqK61jdcSnb+44cU
	q3fvPWXUX8AlVh2yoz2Hu/e5y26wgindqZRXCk16lzkdSOlcaU9NV0WQlGe9VOFQmnOIQaUs4vN
	gW7TbsUz6q8HcKElTcTsBvb/q74SfgRW8bISQoXsvrso0Bv9KGELJllI+5RYbszXt1HNiv7FM4S
	tx7UVEhGcwZrfoMHbeZAN9Uj7YqJtMdoX4XpE3pwn23BcDtb6I8qduptKET52ThyqQm4ijgRzpz
	NQiO4dgOd0GxzckGqxoap6a7aA/tSKjRlubBnhbHtrXKNsNZf94BqI3EnYAAkzJdbzaQ==
X-Received: by 2002:a05:6000:609:b0:452:bc74:b129 with SMTP id ffacd0b85a97d-452e9ca06b1mr28253152f8f.16.1778489672083;
        Mon, 11 May 2026 01:54:32 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.237.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45491ca2fd6sm24944189f8f.30.2026.05.11.01.54.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 01:54:31 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 11 May 2026 10:53:58 +0200
Subject: [PATCH v9 3/8] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260511-orangepi-sd-card-uhs-v9-3-ae48c0b2b2cf@gmail.com>
References: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
In-Reply-To: <20260511-orangepi-sd-card-uhs-v9-0-ae48c0b2b2cf@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_015434_187370_852454BC 
X-CRM114-Status: GOOD (  14.73  )
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
Cc: Trevor Gamblin <tgamblin@baylibre.com>, devicetree@vger.kernel.org, Michael Opdenacker <michael.opdenacker@rootcommit.com>, Troy Mitchell <troy.mitchell@linux.dev>, linux-mmc@vger.kernel.org, Javier Martinez Canillas <javierm@redhat.com>, linux-kernel@vger.kernel.org, Vincent Legoll <legoll@online.fr>, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, Iker Pedrosa <ikerpedrosam@gmail.com>
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
