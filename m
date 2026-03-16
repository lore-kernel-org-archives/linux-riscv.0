Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 072ECF506D9
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3hOqvLNXDwTdaRZCtr7SLyPZyt/M+CGk1r4thkxyTVM=; b=Csg9mlceM99Yj0
	jSgd8c73qHYnYmzFudItRTIfr2QGISXkvEXzQB4Q7xkx/UBWGqV64R6OpCTzIrsGcmKQsM599hxvr
	LuQX5Vdr2dQEO1VeKGeOHC/nVcj9D+9v1CPJg+P+WNgTd0FeTgwbPmaRAWaO6PiUzcmH9xh1xMZ36
	ERH4v6qwd7AGZhC32zzZ5CiyGJZ1m6DEOv8DR0utfCUVxmkZXnOwJLDvvSRtf9xPcJYKZzf8an7fB
	8eak0Wp7+EiGa2A5Tq/hcPGGYlAeFwTl0aW+1Xm3oGIQ3Sdsk6MFoIuinKfrYzhoXZr+sb/cPceOo
	HV4me8M9haUw6TN78P3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28md-00000004A1h-2LNp;
	Mon, 16 Mar 2026 14:19:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28mc-00000004A1A-2Zi2
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=IatXzbXfYasV7clQDZ74AZFa+ggBYqSvKjib0f90qgA=; b=BvUnRbd++Vyud8kMcZnxkkfZKZ
	wyqRpKu6AyS5mftBbbk2+cGbr2XFdySOeGudnCl+EtvwMJLP34wyg/ZmmODfn+HVIb/HQT2v38I4f
	J/JyVrdSlL4L/NaabSnxyHaK4iCqC5SH9fjhbUKyLFUSiwvrQTrPjQWpmO37vRYNAO4Kkt8mPmBPv
	4iNLdbqXgoqywsTv9/Fi5AeaKJ7tPP/6917hyp0BnKBtJUyVivH0U5FIGOFpuo752yFV0ZPQkNunW
	iurf5pA7ca5oR+DOF30P4B6475Or8xvP8zODPIhfHc9h9i3E1koI2i+DIddG3wX7tUBvZ2U7EZZ4U
	Gv/tPNow==;
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28YY-00000006tdN-01cB
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:31 +0000
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-439bcec8613so3505611f8f.3
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669868; x=1774274668; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IatXzbXfYasV7clQDZ74AZFa+ggBYqSvKjib0f90qgA=;
        b=N/lJHVxUQ61FLUOymuHJXgPKOBETX9s85t0cb24JCqedDPRpY5Aed7b/C8r0P+zfwT
         Ks2zESjgxVXnFjg4+Lw2HzQCEMHn3bSi142/BLmw1Hg1uvpyKP/TqtjM1GDsTyTpsEy9
         5LXEBehNqLBrsVEl1F4Gq4NQvfJE2zESrNJLykGtNU6jSuDISu7nbmRFnW8jVstf36X4
         ednV35CMeo9j/RsRH+B/gZSzcKqBkOHMSzPSaYm0LIeqotl9+9d/yjmGjrlWEfRsgN+4
         Ic2PnCVnJ4Ysn189//IlCLAAmNJUzioJcAM9pgIOTDg7GEF0cR6uiVcORFh0qoRlAjJ7
         TVcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669868; x=1774274668;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IatXzbXfYasV7clQDZ74AZFa+ggBYqSvKjib0f90qgA=;
        b=Jfvz3KZipJSdg4f7NQnXpcppXB/ObDztKZq+AJjJA+Q+8b8cyXA+j5uE7Xk+9sIAHR
         aEDpVCMWVGJrNLHgcHHWYKN1pF2LYRNGON7IXDPJrahq36W6EufCmlzudO/iXeAXw7Ri
         8K3e8rxt3wR7MhgW+EzXcD0AMuSFvwiVFJWauWIaUoG1WT0tsgKpJ4Vj8iExa5RcJTZ8
         lS7LcbUc3saYBywWi8fa+RAyRCbVjzhQMN6PweL6z/nCyFvkkEzwcKsytndHKEYYwrqx
         4fQ/1YwTKo8T6nTowDh4oquPZ99ETRsymOP+ss0TsDPPtCj7VLUgGdJIRkG5eHL0JViF
         Iw+w==
X-Forwarded-Encrypted: i=1; AJvYcCWmuehCHErC3vJaf4sOT2dOQnFQoJJVFKzR/XOTXZaSqbOJzxZH8ZaDAh2OZ6pjXlRMhI+rSvi3ggQIsw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yz7oWWHUTjV1Kvz8VdQHSDK78G/IwtTDlWhyragrwjriLQJ2P8Q
	4PSrpXzga4enicNNftmLaQnuD6ZAM9d8Ncq/nqtR0aexyrC3oNi8mGNV
X-Gm-Gg: ATEYQzzbLK7o0X6vxO6Ox1Lf9GtZhFaJge0U4Hn+AzIlb/0eNyNp9bvwWCyksfUKqCR
	BqI5AI0v8WJf+GfRrKapeDkDvl0wduaxP1VAyP02STHNG87kkxAgNZ3w08U2p+8YJg5ebVmKxLf
	p37oIiBkxR1873dZRdJzq1tHNhb6/Lp4x4t58HAIfsRvd/eaQ7qKr/rwcwwTLkzR6y5IAt8ADtw
	WPhf0KfjCqgAiJrs30US2NjBq5QrCHlUIRm2E6F8i3yi85l+koG9Cw66M+9TZnekNNR3IX/2jyG
	fvcO/vgM3gC2wxS8TlM8bm2mNHwQWdc0UasAqJq2d+BJEmZWwF3x6PyUI8XMNchWtg5L2VQq+6n
	z5Iy8n6xTMDclU7vz39g0/EUJ/MaydKESVAls5jeDidLqoyAhPBer7gKomwjErPTwImEZzT3FsW
	763WMOCmyRWCSfOI02SEAPw4NCIc4P856jhlfN1GBiqjvVl2EHacS843VrR9Tz0Bw3YIKT+BXQw
	G4=
X-Received: by 2002:a05:6000:4313:b0:43b:3e40:2223 with SMTP id ffacd0b85a97d-43b3e4024dcmr9315126f8f.19.1773669868020;
        Mon, 16 Mar 2026 07:04:28 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:26 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:30 +0100
Subject: [PATCH v3 2/7] mmc: sdhci-of-k1: add regulator and pinctrl voltage
 switching support
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-2-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140430_167339_1662316E 
X-CRM114-Status: GOOD (  14.83  )
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
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 drivers/mmc/host/sdhci-of-k1.c | 58 ++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 58 insertions(+)

diff --git a/drivers/mmc/host/sdhci-of-k1.c b/drivers/mmc/host/sdhci-of-k1.c
index 0dd06fc19b8574ae1b00f7e5d09b7d4c87d06770..01afdadcf70796704b272ee5a31543afd5e01188 100644
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
@@ -219,6 +223,33 @@ static void spacemit_sdhci_pre_hs400_to_hs200(struct mmc_host *mmc)
 			       SPACEMIT_SDHC_PHY_CTRL_REG);
 }
 
+static void spacemit_sdhci_voltage_switch(struct sdhci_host *host)
+{
+	struct sdhci_pltfm_host *pltfm_host = sdhci_priv(host);
+	struct spacemit_sdhci_host *sdhst = sdhci_pltfm_priv(pltfm_host);
+	struct mmc_ios *ios = &host->mmc->ios;
+	int ret;
+
+	if (!sdhst->pinctrl)
+		return;
+
+	if (ios->signal_voltage != MMC_SIGNAL_VOLTAGE_180) {
+		dev_warn(mmc_dev(host->mmc), "unsupported voltage %d\n",
+			 ios->signal_voltage);
+		return;
+	}
+
+	if (sdhst->pinctrl_uhs) {
+		ret = pinctrl_select_state(sdhst->pinctrl, sdhst->pinctrl_uhs);
+		if (ret) {
+			dev_warn(mmc_dev(host->mmc),
+				 "failed to select UHS pinctrl state: %d\n", ret);
+			return;
+		}
+		dev_dbg(mmc_dev(host->mmc), "switched to UHS pinctrl state\n");
+	}
+}
+
 static inline int spacemit_sdhci_get_clocks(struct device *dev,
 					    struct sdhci_pltfm_host *pltfm_host)
 {
@@ -252,12 +283,37 @@ static inline int spacemit_sdhci_get_resets(struct device *dev)
 	return 0;
 }
 
+static inline void spacemit_sdhci_get_pins(struct device *dev,
+					    struct sdhci_pltfm_host *pltfm_host)
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
 	.set_bus_width		= sdhci_set_bus_width,
 	.set_clock		= spacemit_sdhci_set_clock,
 	.set_uhs_signaling	= spacemit_sdhci_set_uhs_signaling,
+	.voltage_switch         = spacemit_sdhci_voltage_switch,
 };
 
 static const struct sdhci_pltfm_data spacemit_sdhci_k1_pdata = {
@@ -324,6 +380,8 @@ static int spacemit_sdhci_probe(struct platform_device *pdev)
 
 	host->mmc->caps |= MMC_CAP_NEED_RSP_BUSY;
 
+	spacemit_sdhci_get_pins(dev, pltfm_host);
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
