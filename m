Return-Path: <SRS0=bkE6=I6=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08D61C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A2A4061001
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Apr 2021 06:01:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A2A4061001
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=P192ppIXF/qA09gHcCFl2NwcNbS+LBDQehKJLO5dYx8=; b=Q+vKgmdfv2Ug7Q6ijpRTj5bfz
	b6yKt6rHYFBg2/xINeEGZsyj5eIqxA55Csw5gOgWuFSSspn/tUsWY+N/PjXOr+WvvBHhtmp7usWSu
	tUXX4vUuCZX+UbsfGe0VGDXUW9pl+Bz/KNfGIJMiMVeFgWw21wi5Ww160DqMZRMudYeYsRsqoKfuB
	kD+og9G1Z+XY/Net+elz2UoTMV60DJryHMYGniCJulU2+O/VNRQ4gEEn19JCunXpTE7RBQ79H9i7I
	oTIboGia1DHifGCKjf2XkXTn2BjUEewf3kbItZzCvj5dejvDIDGJ0r6Z9r7G2oV+T2Lv/zOd1ecQ5
	8Gy7abaAA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lRqOK-008dN0-06; Thu, 01 Apr 2021 06:01:16 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lRqOE-008dLz-FL
 for linux-riscv@lists.infradead.org; Thu, 01 Apr 2021 06:01:12 +0000
Received: by mail-pl1-x634.google.com with SMTP id l1so458362plg.12
 for <linux-riscv@lists.infradead.org>; Wed, 31 Mar 2021 23:01:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=N3Ofv7Rek7cgGq9uaGjBnpEgWWaqpn6QcKrofIPEUwg=;
 b=khgPA2tQj0XBl2pjmoT1nQKH2acgI+DuwZDuMbLf2uyMrCQKpwXFRC2bkp5RSvE4bR
 dpj/jj1FSTaErZYHck9AuCc7U9cjMBG0NCw4eJrFCQGkDoIx6ApYpcsY8wG6iuq5KKF4
 arNMGBm/Kc412mQ8pwCeZ3dJ6uJO0a7FiVG7ZLKpEsubvuwA560wW6Vsl6LbV/3nav0k
 /37SBRMn8mdwx7h46HewEDJOdO0Wx5ENT1UW2PI2VMihHUpecdzQvMU4MF2h4F6T00vR
 V5DRlHfr2hcROXKGeVqExb6aASusihjhKxlKnJNTycdj6UO2FzMt28303zUN4d+A84vf
 HNZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=N3Ofv7Rek7cgGq9uaGjBnpEgWWaqpn6QcKrofIPEUwg=;
 b=MKpc8nuWgrVHwaDyQL9F+fnnYPTD45Z7sR9tMWhIBqa0SOMiVoUWZj7jvoo/Jr5xvL
 7njucPTDzWGyvC5N3Sus78oKld07o7NnwT4O8RA8TlQU7h3fAjRAkToLFMeMRWpppA36
 r9ZTMKMXZUbRKRqS0DTLW1PZyFiggp0pXAoRDi/fjQuY90sVdXfJgZFAb1egSVarNqyU
 KuF9evw7JKXGCiCtIJupvRN6zoy9geQU4Gne0P2RVvFq6xw7RuUUf8BmMmZEzKjcR/n4
 D2IFVjS40SQePunXLEJs9vDP05XcHFncpJFHxMwokn0fHsJntHlqkoVrfomupNqiPFus
 ovow==
X-Gm-Message-State: AOAM532pcN4bdk43xvI1EPlt0CzIwUQzS9gtV8y/Mbnrmi9I8dqtogXc
 35ux+3P1FPMA6ndl9371M14ByQ==
X-Google-Smtp-Source: ABdhPJwHZ+BcpY81xjQ/CI0AKookTPicx5Fd19k1RijF0z5miZkInR3ttYqjRggO0gvUVrY6JGCAWA==
X-Received: by 2002:a17:90a:2e0d:: with SMTP id
 q13mr7467523pjd.225.1617256869026; 
 Wed, 31 Mar 2021 23:01:09 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id a6sm4037328pfc.61.2021.03.31.23.01.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 23:01:08 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, paul.walmsley@sifive.com, hes@sifive.com,
 erik.danie@sifive.com, zong.li@sifive.com, bhelgaas@google.com,
 robh+dt@kernel.org, aou@eecs.berkeley.edu, mturquette@baylibre.com,
 sboyd@kernel.org, lorenzo.pieralisi@arm.com, p.zabel@pengutronix.de,
 alex.dewar90@gmail.com, khilman@baylibre.com,
 hayashi.kunihiko@socionext.com, vidyas@nvidia.com, jh80.chung@samsung.com,
 linux-pci@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org, helgaas@kernel.org
Subject: [PATCH v4 2/6] clk: sifive: Use reset-simple in prci driver for PCIe
 driver
Date: Thu,  1 Apr 2021 14:00:50 +0800
Message-Id: <20210401060054.40788-3-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210401060054.40788-1-greentime.hu@sifive.com>
References: <20210401060054.40788-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210401_070111_061770_D9840B99 
X-CRM114-Status: GOOD (  13.53  )
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
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
Acked-by: Stephen Boyd <sboyd@kernel.org>
---
 drivers/clk/sifive/Kconfig       |  2 ++
 drivers/clk/sifive/sifive-prci.c | 13 +++++++++++++
 drivers/clk/sifive/sifive-prci.h |  4 ++++
 drivers/reset/Kconfig            |  1 +
 4 files changed, 20 insertions(+)

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
index 8fdba5da2902..0704fddba6b9 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -583,6 +583,19 @@ static int sifive_prci_probe(struct platform_device *pdev)
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
 	if (r) {
 		dev_err(dev, "could not register clocks: %d\n", r);
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
index 71ab75a46491..d0f5d0afc240 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -187,6 +187,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - ZTE's zx2967 family
+	   - SiFive FU740 SoCs
 
 config RESET_STM32MP157
 	bool "STM32MP157 Reset Driver" if COMPILE_TEST
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
