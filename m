Return-Path: <SRS0=olfB=IB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB64EC433E0
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 17:19:20 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53C7864ED9
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Mar 2021 17:19:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 53C7864ED9
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=X0uXcZc2Pnkm72a2H3q87NZ91g94b1R23RuqeoGRCEE=; b=DotUZTGMhP08TW8bKVc3Qqaxs
	DNrjjdmmB+MGz/27d34K+9JWctPvBjrQv4Qj/yT5U7wBrwmTA/oN/ePzceYSihFPv+FD1HJd0V9Sh
	YtY012tTXDRLIQXOP+V2foxueR/2v53zP15GL34kFtBdScf8ObvflKRHq4D6PitsOf7OD0EbrOYIg
	iTGFOsivNHRRp9j+o9lI76FNC/BhAX2esuXqXTZJ1OmPH1ZPfJsUmRhfRaelWKKHBN+vinEf/I+Lb
	yymI7kZkPKuWlrpvD3NS/7GivF6XHWl+Cu4L1Y41AeoLdA1EJHWsIp6QMTX+LZ9AA9JImzvYm+o/7
	6FMxLRa0w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lHV9P-005lsi-6J; Wed, 03 Mar 2021 17:19:07 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lHStr-005F7R-C2
 for linux-riscv@desiato.infradead.org; Wed, 03 Mar 2021 14:54:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:Reply-To:Cc:
 Content-Type:Content-ID:Content-Description;
 bh=u6t/37IyVxin5Ht2dpG96JWylVJHChqoPdK9b3/r2Tk=; b=J2Bx0Q5qUdRGZwEJVzxj79ZnPc
 agMK90LtUstWl7Ej5cUTMY0IL6G9RUN2pK8xtrYSXyAfbFFjBUx/PTShxyl40663CA4t3U/Snpygo
 U1crhTcovl1FfVxZWCBz/sEbEGi9g/jFRSIsfr725SSPwGpYv0SoNOjsHNz+riGSgSUC/FnQw2C/U
 y0BgDFq4ugSfCWL8gap1FL1PeCh+9YaIzikl8aPAsx2LGK5ttaMxeU9gIOVE95IvTtPtZ80Wxyf2h
 gKYx8UlIEJ0S6OAkg2Q+lm+rzXjAE6fMX6S9WhKOZfw7npD8zxBnLWcF+V3EpxAAa9qXhgpYOZ4qZ
 EOEHNoLQ==;
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
 by casper.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lH2lb-00Gygs-EO
 for linux-riscv@lists.infradead.org; Tue, 02 Mar 2021 11:00:40 +0000
Received: by mail-pf1-x429.google.com with SMTP id d12so11040591pfo.7
 for <linux-riscv@lists.infradead.org>; Tue, 02 Mar 2021 03:00:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=u6t/37IyVxin5Ht2dpG96JWylVJHChqoPdK9b3/r2Tk=;
 b=dmHcDAYFKLLqTOsvf5p41tbZfMnkTkQbBAs8K9RFyRZ1BWqaviEUrW6MltF8u402OJ
 qr9t7qF/MVuoxGJnduTffQKjYx8nbsFN6oaHDJuWZ3NOHX6NAkVsw3o4tKkX87+vLtVe
 0TEQdBi7us9IB1SCjzNKuV1/CKNUv7q+xMwcqYYK4w9kr/Czggj89AE2v0Tve2wtnKZp
 GlwZ9G6kBho4Ct0PUXMYzQ1JyYOBFLDAst2+fEIzQNwU+wpsadnfNYKVi0WQ8zjd5I1S
 Kktrg+quS/UItfCItat+2Z65rMVvVrbVC11DhVqfjoaiWMYoPDZS1aXBjsTi4R2ymFjX
 RnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u6t/37IyVxin5Ht2dpG96JWylVJHChqoPdK9b3/r2Tk=;
 b=Zh3MmdPI0kLTaONkgdUJWhIegyvkFkvTgOmxA7QMgm8M/354aLsSKK5sb4oQJ+iNQB
 KO2/MRvcNkz+OJQnJk0qrzMc1PyQI8PdsgMWRBXtBTM8hmJJAOxSkIzXPjEnldI34DS7
 fA695e5GbjalMyuGr+kJZC8Ji9zhFK4GEKBtsvxjSjMLHxOvlCTdRtyz5N7cyYK4GVVi
 xkj58VLf5ymuEXnkve+9jtjQS1j6m4HkNNRk9MHI8RWA0ZYsty3/TWHBSXMyy/u3w4Au
 +G605M0yaF0QHYcQu3EzxFxmdrgR8SF2k9mlsKGlvpkq4ZkUphFJqhqHlfHziC6Vy2R8
 BVGw==
X-Gm-Message-State: AOAM533PsXMQ/3E8/UWL5bbR0JHcL0ujUwW4e9sC4NC+TbKXERhoRb5X
 LeC28GW+R/V1cEUf3LXE3uqcNw==
X-Google-Smtp-Source: ABdhPJylvXar14N05xZmEcvHjUe6bk4TRJdURaXGBevBG2TJaWqrMkEom3Rr1QxWW0n0TwD/tl5mKA==
X-Received: by 2002:a63:d451:: with SMTP id i17mr2445904pgj.391.1614682775713; 
 Tue, 02 Mar 2021 02:59:35 -0800 (PST)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id t26sm19500451pfq.208.2021.03.02.02.59.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Mar 2021 02:59:35 -0800 (PST)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, lorenzo.pieralisi@arm.com,
 p.zabel@pengutronix.de, alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
Subject: [RFC PATCH 2/6] clk: sifive: Use reset-simple in prci driver for PCIe
 driver
Date: Tue,  2 Mar 2021 18:59:13 +0800
Message-Id: <e2bd7db9db3c196b9b0399f0655a56939a0f3d62.1614681831.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <cover.1614681831.git.greentime.hu@sifive.com>
References: <cover.1614681831.git.greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210302_110040_866740_280F6AF5 
X-CRM114-Status: GOOD (  13.60  )
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

We use reset-simple in this patch so that pcie driver can use
devm_reset_control_get() to get this reset data structure and use
reset_control_deassert() to deassert pcie_power_up_rst_n.

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 drivers/clk/sifive/Kconfig       |  2 ++
 drivers/clk/sifive/sifive-prci.c | 14 ++++++++++++++
 drivers/clk/sifive/sifive-prci.h |  4 ++++
 drivers/reset/Kconfig            |  3 ++-
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/sifive/Kconfig b/drivers/clk/sifive/Kconfig
index 1c14eb20c066..9132c3c4aa86 100644
--- a/drivers/clk/sifive/Kconfig
+++ b/drivers/clk/sifive/Kconfig
@@ -10,6 +10,8 @@ if CLK_SIFIVE
 
 config CLK_SIFIVE_PRCI
 	bool "PRCI driver for SiFive SoCs"
+	select RESET_CONTROLLER
+	select RESET_SIMPLE
 	select CLK_ANALOGBITS_WRPLL_CLN28HPC
 	help
 	  Supports the Power Reset Clock interface (PRCI) IP block found in
diff --git a/drivers/clk/sifive/sifive-prci.c b/drivers/clk/sifive/sifive-prci.c
index baf7313dac92..925affc6de55 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -583,7 +583,21 @@ static int sifive_prci_probe(struct platform_device *pdev)
 	if (IS_ERR(pd->va))
 		return PTR_ERR(pd->va);
 
+	pd->reset.rcdev.owner = THIS_MODULE;
+	pd->reset.rcdev.nr_resets = PRCI_RST_NR;
+	pd->reset.rcdev.ops = &reset_simple_ops;
+	pd->reset.rcdev.of_node = pdev->dev.of_node;
+	pd->reset.active_low = true;
+	pd->reset.membase = pd->va + PRCI_DEVICESRESETREG_OFFSET;
+	spin_lock_init(&pd->reset.lock);
+
+	r = devm_reset_controller_register(&pdev->dev, &pd->reset.rcdev);
+	if (r) {
+		dev_err(dev, "could not register reset controller: %d\n", r);
+		return r;
+	}
 	r = __prci_register_clocks(dev, pd, desc);
+
 	if (r) {
 		dev_err(dev, "could not register clocks: %d\n", r);
 		return r;
diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
index 022c67cf053c..91658a88af4e 100644
--- a/drivers/clk/sifive/sifive-prci.h
+++ b/drivers/clk/sifive/sifive-prci.h
@@ -11,6 +11,7 @@
 
 #include <linux/clk/analogbits-wrpll-cln28hpc.h>
 #include <linux/clk-provider.h>
+#include <linux/reset/reset-simple.h>
 #include <linux/platform_device.h>
 
 /*
@@ -121,6 +122,8 @@
 #define PRCI_DEVICESRESETREG_CHIPLINK_RST_N_MASK			\
 		(0x1 << PRCI_DEVICESRESETREG_CHIPLINK_RST_N_SHIFT)
 
+#define PRCI_RST_NR						7
+
 /* CLKMUXSTATUSREG */
 #define PRCI_CLKMUXSTATUSREG_OFFSET				0x2c
 #define PRCI_CLKMUXSTATUSREG_TLCLKSEL_STATUS_SHIFT		1
@@ -221,6 +224,7 @@
  */
 struct __prci_data {
 	void __iomem *va;
+	struct reset_simple_data reset;
 	struct clk_hw_onecell_data hw_clks;
 };
 
diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
index 71ab75a46491..f094df93d911 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -173,7 +173,7 @@ config RESET_SCMI
 
 config RESET_SIMPLE
 	bool "Simple Reset Controller Driver" if COMPILE_TEST
-	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC
+	default ARCH_AGILEX || ARCH_ASPEED || ARCH_BITMAIN || ARCH_REALTEK || ARCH_STM32 || ARCH_STRATIX10 || ARCH_SUNXI || ARCH_ZX || ARC || RISCV
 	help
 	  This enables a simple reset controller driver for reset lines that
 	  that can be asserted and deasserted by toggling bits in a contiguous,
@@ -187,6 +187,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - ZTE's zx2967 family
+	   - SiFive FU740 SoCs
 
 config RESET_STM32MP157
 	bool "STM32MP157 Reset Driver" if COMPILE_TEST
-- 
2.30.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
