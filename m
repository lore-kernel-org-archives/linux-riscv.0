Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36A02EDB7CF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=igWk8fPbzJuXty64t/vPP5tiSFK0L6qkMyWPIXbuh00=; b=3M1jBqzsCEW97T
	zHb71cJt9WO4RdaPzYTty4WFVp9536WGFLeO19QfOlVgFV45shSjSFrb57S9LTn4J7NsWhMOjQlZM
	42QF3B50IBc3GKRCYOu1qnOGH/AB5tVYfxT8iQk4gK0aQdo17WzQ64MFZu65gM5koh/C4R6WqkDa6
	/p6Pjn5CJzKDQYGJTA8dXlHm4wiyTZB798rwUT4yYLZ3N0x2000N8hSzJr2B20Zy0XbU3hMjeiBUQ
	2vJib1djH4zqgYIk6YYuVgeUrJfCN1xqI37fs6u3jo9PWPuwrIOxTpCFSIl9ZS7/rumCZi4/TkRso
	efNiWiMxIyUqAK+Osy6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lE-000000068h8-2CLL;
	Tue, 07 Apr 2026 08:26:12 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lC-000000068fi-1sdc
	for linux-riscv@bombadil.infradead.org;
	Tue, 07 Apr 2026 08:26:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=U+Em78pG4MczTisQO9YIrYNt9KPWDr1XLJMXM4SwDxc=; b=MuJ/MSjbqRnfjpbH13pSc9PvFr
	UaDcvKxRya+hnf9yOLD+M1SEHULAbGxVfn3dQ50xj97Mju+ovw0EA6nmnZcybt7Y/FDL3aOM6CGWp
	r8jUdeRs3/klHa82LNa1szvvE0f0+Dq5e7AKQ55tQ1p976CS/pBrj90kB2NNyj9Bprwowflw5IOQn
	bkjF7FGNKgwAjtv7JKNfqLJD/Y9hG3aAuTwyCIZ0xuQsGK+0cTbchgL1zpkNUvRC3NwGZlIRjfrFE
	5fefqO0bHojubWkfKaZQaLwvrDn8Wl4EhTcbOqe+vhufVz72nqZ83V13cb1sTwb5s2gp/2IJF/btr
	2Kcx8d/g==;
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1l9-00000007pfB-20P6
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:09 +0000
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-43cfd832155so2901732f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550366; x=1776155166; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U+Em78pG4MczTisQO9YIrYNt9KPWDr1XLJMXM4SwDxc=;
        b=pw2BprNqoojL5qgmiDZawJ02GFQMpYOZ4FrQ2X5GPodGKy3ObqNzp3MB6Ge32XgYyT
         2d9G1uGUB1PDCRdS1ysJ4KVo4wYE+zWXn8GLBwosSMov8EdhRpsvTY5+p5zqAMwrA63D
         OZ0j/84hKI09atXU1o9qnLZ0djhgJ/jLVb5zTMW6NyahTFlmCV2FhS1W7GZO41q5W2yV
         M+yKLiBojkr23wtt8lfmRaclncMuhLMFYkjpv6lZOuwqzUdDC7rxBjfXHdssoTez/wyT
         dzsQ3W3UGVHhQkGJUUwM1cQiMW/3dML3PwfwvESbd9ylZbjlKQG0Z1Ui/imNfr8m3vmI
         z4jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550366; x=1776155166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U+Em78pG4MczTisQO9YIrYNt9KPWDr1XLJMXM4SwDxc=;
        b=pUi+/BU4qPW4jGWF9I5OwKVagfzAc8wLKKwwGLrZNZ+mTQYbvzttrOBxP9hoh0jNt2
         6wjKSxJFi+9Kgjz/GwwUXuqCDebxHmVVc+7DLoICTNYcI6/BkEX4Phh9xSDP0D+hripg
         l98hZqjVZs2If3ycJFQ9wlXGSAmXzUWP24tnTlM7xJoDfpsm2Ttm2wCOAijYAp26E8uy
         d5imqoopfR4XTY8y2dVKOWPalxUKFIviR6heef4syPcrpmYefCZ7nzuHVQsWsN6tEEBl
         fH+uMbP5mcGJ2bDQph2ZjOMz9eR4WyX4jWnW2GY1EODYZ3HnQq4ZbM4Fy1fHyRVUNuGz
         EjAw==
X-Forwarded-Encrypted: i=1; AJvYcCUEMUkFd8EGHpXyrvL4/qCS5IzF8cLJTImzmKzyTkoaH1akB+7DRfpJxS98kgVkx4KunfRYrSTG3im74Q==@lists.infradead.org
X-Gm-Message-State: AOJu0YyYWQGcd1nP1dpUGmoTZ+FaddPml6+ysklNxLklvVwgeDi4Ioz9
	6bKwyw1DwVsE/NxyrvUbr+tF7BkrgYg4zwAIGZ3vM3xGHoDH+zg26eu6
X-Gm-Gg: AeBDievekxYVPVcyIl80EFW9tidmfwYAHezVzi4uLFHKDInCXtj1PWqvwEhawYhU1Aq
	CMdCXaocj0szaV7YoxXtrHHuCFIteUINum37qm5ZeKyiIk99moP+YQe1guEIYgovKnHjCfVPQda
	0m4hTo8cZIMj6b7JoQj9lkO4ccBuldrwLjFzRgHDgnWge5loAr0MvH7fAiF84okei2XtC2/ZjVk
	iULw+mTV74ni9DqrZv95dOZ9Ml5dzMCWLEJeWdRw+8MYlhs1fw0R11ab0T8yZsMPdGH5AQ99+KP
	C9QHHD4trf31Eo9MQcH/Tg3Jug2lKOKcsviYM/dp8caQ8NNtihkt5HAuMk3mDwGKcn9AvR8f9h0
	/fOrHE/PFJKbE/tQXmO7bJVltDoPAZ8fZcgIBeMIPirfbQ2rtDKmT//qEdxkVQ8M9UYilS+i6EY
	gDVsB21XT3vgzijfek0kx9bhdJJMNgpLVHu3vGugRYk/sS5Wpuyom6E3jYo3clB5KR
X-Received: by 2002:a5d:664e:0:b0:43d:4883:192b with SMTP id ffacd0b85a97d-43d48831945mr2963140f8f.41.1775550365599;
        Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:05 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:23 +0200
Subject: [PATCH v6 3/9] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-3-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
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
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_092607_692716_012BE5A2 
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
Acked-by: Adrian Hunter <adrian.hunter@intel.com>
Reviewed-by: Troy Mitchell <troy.mitchell@linux.dev>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 72 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 72 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..d9144537032a51a12d7480885f247f4c66583e59 100644
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
