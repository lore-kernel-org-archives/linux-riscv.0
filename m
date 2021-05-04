Return-Path: <SRS0=FKry=J7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4631DC43461
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6F8BB61026
	for <linux-riscv@archiver.kernel.org>; Tue,  4 May 2021 11:00:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6F8BB61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=nUsIMfp1f6j6ed1+CBvnyBOys92zv19j+sRtQUVdQ5Y=; b=XBA4xMKGVlFtLiVbevmiFhSxl
	4IBbNjqt/J0pbh7pwrbJv7AuFXpGHeMKloYYwhxWewCyWNwZHOtWNSlKyhNci7uphPF1YVbFJIlNh
	nRmQ7PEZ2zan9X32BkoXDmzgsL/OLi0cHpj+BImmn4/+9LjIvMacnxpQ8wBsws8SZVyK8xqca+wIl
	egZThEQlmT1z5vcKnd03ifJXyS8/nyo4zpwfaDi51VZ9UPeGqwzFsL6Yri/mnTdqGHHLdkP7+Gf9J
	RMGSWWoKipl0L9EwnUeCFF1JIkwKYvxhoE1+U00Sk3Zd4JLyQc7J2frSPaEcBMhI8Srs5nNjivmmc
	C3bsKCwSg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ldsn5-00G218-Hi; Tue, 04 May 2021 11:00:35 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmx-00G1z5-Dt
 for linux-riscv@desiato.infradead.org; Tue, 04 May 2021 11:00:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:Sender:
 Reply-To:Cc:Content-Type:Content-ID:Content-Description;
 bh=ddtby8u0R33cOntLLPoDYh0e5Ss2FvGJIP/FJDn2Hhw=; b=J8Ig157WYoGj6LR7yU7vBLwCWc
 CDTlCxSuY8jK+CYuz676U2XNkx5RLqIkYH3YSfwEPAZeuh2CMj1mZ9Em8tf3lkRZiyKRYsf/uucAX
 kenZPLo2BU6XzSwFSg/ijffSECkdzW/kgjYPszSEjDj6yv4TzllS0y3CKyFbEu1KH9SkDV1pw7YmV
 SluoGBGmi0A2eA2JX5Z8sLQQbANCPuUQb8sd/MrcGAJnqe/C3NS5n8heXzxfwok64lEkgI6vhfSpU
 wvXWtzmPCls5wIHQrVg+meFOkIuR8wiY0/oPeO+AA8SZQzykx0+wdH1cABBy3U7JaqLDVhUoZw5x5
 KpfqeYug==;
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ldsmu-003ut0-Q7
 for linux-riscv@lists.infradead.org; Tue, 04 May 2021 11:00:26 +0000
Received: by mail-pf1-x435.google.com with SMTP id i190so7017324pfc.12
 for <linux-riscv@lists.infradead.org>; Tue, 04 May 2021 04:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ddtby8u0R33cOntLLPoDYh0e5Ss2FvGJIP/FJDn2Hhw=;
 b=nK5+3Wxx25GLN15WqSNbNa5E54rLfzDmxI0Zyx+4kxtndBZjOqgHRKxtXL3xzmFwaZ
 Phwr9DqBdn5N7mGOmyv5OVMBDiycI3bwe4kmUT5N8tKLOL7bgc5jidxVdlwNJqwMST4f
 5kmFSaa5emm/cbP02gIoypUR2fqhWCiBXj/inYl9Bly2gCUaZqnLwNIwb1dLY4g1TkD7
 DSwJBHHniJ1KdhlV+ruBUzWylUsCtf0/B9DydDYuEifaBV6bQqHHjIcqFFXgxtyrfjNo
 jv+J6BXLmSqBSaHPUuinLISxMkYQAX7fvQ9umKbFBwmn/yQOvdwIyRZ3P/FbZk9dCBLY
 8UNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ddtby8u0R33cOntLLPoDYh0e5Ss2FvGJIP/FJDn2Hhw=;
 b=t5RnvmvWK7vGODaXrElovD7GvVycAg/j06k3jO4gjPhYo1Fm6Qj69KzvKLbxEke/Kz
 IWCm7ULB6B9+hUNisrQScHFSqy6pglcBBrgU5ltwB38RLImSnEHW3gg7CgxSjXvLsOe/
 XOl/qm9lcvhx2/3vyxl8h3J8DYugbjJGIjRJ+9ixcpPknd4Uh2p77TmgM+eZcS6EhfiS
 JJPRwDbDjOS9d40VWrK9B27hmQZYmcKAGwiNu/MJMRXJmMRwhEYdij12AVtbM7h8KvTK
 rqA2KgTMJuqY88JMVq8pbKhX8VTVTJE9lF2DBJNx/3sgTy8l9l1C8YA/tHs4Ed1fn3hD
 TfbQ==
X-Gm-Message-State: AOAM533b5SldficdZy9YD49epOo+54VJ0+bKQ9JRESBAZsF9yVKWbXyj
 wIGq62ME+OhmpMH+t8GJdlkZEQ==
X-Google-Smtp-Source: ABdhPJymWl5vUOYmViNUkZVNeRXaMKCprW0D+gm1Enp4gVbzlNWrhrkUq2lBvFxo/96g4Yx2hNgPHw==
X-Received: by 2002:a17:90a:e64e:: with SMTP id
 ep14mr26936300pjb.103.1620126021903; 
 Tue, 04 May 2021 04:00:21 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id k17sm11762529pfa.68.2021.05.04.04.00.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 May 2021 04:00:21 -0700 (PDT)
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
Subject: [PATCH v6 2/6] clk: sifive: Use reset-simple in prci driver for PCIe
 driver
Date: Tue,  4 May 2021 18:59:36 +0800
Message-Id: <20210504105940.100004-3-greentime.hu@sifive.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504105940.100004-1-greentime.hu@sifive.com>
References: <20210504105940.100004-1-greentime.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210504_040024_868353_08B4E171 
X-CRM114-Status: GOOD (  14.32  )
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
index 9997a3fa4a38..0d79ba31a793 100644
--- a/drivers/clk/sifive/sifive-prci.c
+++ b/drivers/clk/sifive/sifive-prci.c
@@ -588,6 +588,19 @@ static int sifive_prci_probe(struct platform_device *pdev)
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
index 4171c6f76385..0f40dadf5705 100644
--- a/drivers/reset/Kconfig
+++ b/drivers/reset/Kconfig
@@ -197,6 +197,7 @@ config RESET_SIMPLE
 	   - RCC reset controller in STM32 MCUs
 	   - Allwinner SoCs
 	   - ZTE's zx2967 family
+	   - SiFive FU740 SoCs
 
 config RESET_STM32MP157
 	bool "STM32MP157 Reset Driver" if COMPILE_TEST
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
