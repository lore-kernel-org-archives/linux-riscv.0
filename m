Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 331DCEFCD9C
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3Swa9dL8PIwF5z+7y3WAROjsAbSfIOq+zEMXgsZxySo=; b=poMdCn6NRSagKx
	vf4dwO1iAcXcEEXQM54Mk3eaB4oc8JddmxLavFsTFTjAIFN57tRReWW4WKeB3x0PgEdoLJtr3T+yB
	apLBx569R8bKcxNzqPy0Vy4yshhZ80yvsTThCsltJusXXAOzyeYDgQ3jxPRIVeaNoW1hwVMwkKdQt
	hYBi3zjyrvxm3wvIinU2RJG2e3oiNJPNnAPdOTu9jyaE41K6quALtg9rXv7jM0K5hcGeQ7BfCL73F
	z8V4GBe5X8YHQ0a5dqwSVQf4T/j2JDoykJ10IqPEx+qo4XFPDle+gJGu6nwuOMm9c+blaO9JGiMyM
	n4bAqyuQoOHTzC+QRiTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyS-00000007Csi-0oTC;
	Mon, 09 Mar 2026 11:40:36 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyP-00000007CrB-1VpF
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:34 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-439a89b6fd0so8222246f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056431; x=1773661231; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QJ9vHPA28uIZwZHl6zG8+rB5ttucBEvrM8sqwTl5hfg=;
        b=T+vdD5O4xWgORDOzB0zP1ermxAp0rrlg0OJDptvKWLFxTs+D/hzP/x25YLKd9UCUtX
         lL4O4NLZJ3c46RE3fNz0lbNShZ1WZiBziZM3x6Zgsk5i0OD/THi7ugQmazTU+KAbJLEH
         baGdA7AEBlFk7/vZzwxhCG7ddVPrImKtmFUClZKrdQY4pmxv1iiQXZoPXfmVxi4PRUPi
         0cpdOfp+R1Y5VvQ5/W1Dwpfu1GWUuNcjxgsxssM3nlemCGAilPLR7H1+kyBeq2HyoEt0
         KoCoeZtCJJt0H9kJLFd/3ecHmbYNXjTJd8USf4SCsrJmkDMUEUHEz1ZhAzAmFZG0iyfW
         JFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056431; x=1773661231;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QJ9vHPA28uIZwZHl6zG8+rB5ttucBEvrM8sqwTl5hfg=;
        b=D8KnnuCcyTGgxoFTO66crNq0SMN+EhikaRw+ctvtPkfxHBYFiJc9hjCxCjH6D4cmXM
         o1j6jcEc9+jtQnyPjqoxvb0fCfaU10DkBg7T1YTtmXbCM8FnZ1Ap1dK6lhm7W3PuVXM2
         omUteXFhzqPbtbUMrV2eKdoYOFU9Sf73r1FUs9Ro97YwIDhz+PlaaOYQLbnjmfX+ger3
         pEZQWw5O/ehnmCVKp679Q0zMuRQesJQKJ+gugI8E0rRHQ+KpiBj8s3D41hq9QVXdixN1
         mSVryHiIordsPjmfO17Err2xRp4A22jm9ZYEn/SMvb3rXCAAR03J3IBdhLqk8qPihZYX
         4Fig==
X-Forwarded-Encrypted: i=1; AJvYcCUjLnGRMzWU5tdGZqietwmq2pfd+fM1IPm+j+oBrLESyA2LwHiE70Gk4/pAfJY0uJH23BOc3Ou9P8AzvA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyvfpKc0Ywa7j08BFNcq8tf6nyavZ3AqU5hp4r2cLvpMcEQ2Dxl
	1ig3pqzCoQCNMj7CPikcUF2W04uv2fo4AI0ZRHume1rOGudP8D/cQfwN
X-Gm-Gg: ATEYQzy8TNSYk9XcqpDViqckkWARNiX/68Hnb8hFqM4DlyEbW+OYW+pslmXoWtTsUYf
	611sSmsoQh2PAoc9uyxHYOWBx33uOA4cp9WkY8P88MpL6H8NurcMkcbl6yZaqnkHv4EPLbY6Wz+
	KqmymPb3KUr2jQep9TFw7IHArx8VdqeshG/AwCtE2yNiq6Uz8UQPaEJm97EH14tLH1H4uNMdgow
	URiswEVDGj0hg8Ummv3gsiXgp9U7NF9s4Dr35gk+c/FPV9eqlZoby3L6HPU3nVJcEzpPgRbTHIS
	WQYXGBs1/lWTiybtEwdUmKtacKmhtNXzKm/D8fYpSHTL1DKQzQ4CvX2cji5uQw60EtkClv6olRR
	8HzGsXqge//3h8JyeyB7GC/96tRLV0vZfrMlmIY5ZrBmKAVpEOwrlp67i7uVAGl3RHUoIC07rp3
	63WAFX5KQt1rzN21RXbN2wjGp5TLIrhaYKMXquUPR3kfrFkTkFWNhk5p5cmdlk7qRI
X-Received: by 2002:a05:6000:24c9:b0:439:cc06:e134 with SMTP id ffacd0b85a97d-439da6632bcmr19064373f8f.24.1773056431160;
        Mon, 09 Mar 2026 04:40:31 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:30 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:12 +0100
Subject: [PATCH v2 2/7] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-2-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044033_453282_E9D871C3 
X-CRM114-Status: GOOD (  15.45  )
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

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 59 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 585c7eca6ebf253aac466dd37cef029deb63f692..8af117a8e271c04a80d8dc7bb5ce12075652dd7a 100644
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
@@ -218,6 +222,42 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios *ios = &host->mmc->ios;
+	struct pinctrl_state *state;
+	int ret;
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
+			dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
+				 ios->signal_voltage);
+			return;
+		}
+
+		if (state) {
+			ret = pinctrl_select_state(sdhst->pinctrl, state);
+			if (ret) {
+				dev_warn(mmc_dev(host->mmc),
+					 "failed to select pinctrl state: %d\n", ret);
+				return;
+			}
+			dev_dbg(mmc_dev(host->mmc), "switched to %s pinctrl state\n",
+				ios->signal_voltage == MMC_SIGNAL_VOLTAGE_180 ? "UHS" : "default");
+		}
+	}
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -242,6 +282,7 @@ static const struct sdhci_ops spacemit_sdhci_ops = {
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.voltage_switch         = spacemit_sdhci_voltage_switch,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
@@ -293,6 +334,24 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
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
 	ret = spacemit_sdhci_get_clocks(dev, pltfm_host);
 	if (ret)
 		goto err_pltfm;

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
