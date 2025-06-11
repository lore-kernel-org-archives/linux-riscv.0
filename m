Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92EC8C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 04:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xXildis027Oh8ZUoaZmksnGWGYz/NEXLN+is3dhUwaM=; b=tuDmvH2n1zC6sx
	hEnRGUf3zUFYnnITLjNXcIfFxiDBHDsYA21+Jr8h4w2rvbdU/OUDan5Q2JMhxu/CGgMTAaLB9KYiZ
	w2FlpbCAY2c3b2lnBtCEd+ttMHIef7cna9fIwae8t1r5CvjdJpzUrAuBwM35aAhaoSG5J5uG9uFoX
	7v+MIOlQA5ppgNnWDyU8qB3F1lt7869Kn8iPS5qBljfmxyNt/G08Z+VrG3xx9T6gBiGV8AWPby6f9
	/ROySnoJ1OAF87iJi8dj9J0tP1M+XTHn8SfGHR6SFgNYqqu5bnalXkjByS96srcm6i9r7hj092L8V
	gZfGo9e9coqB7TQJrQzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPD0M-00000008p4t-1ew4;
	Wed, 11 Jun 2025 04:24:02 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrX-00000008ieo-0uvn
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 03:10:52 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-234f17910d8so59734325ad.3
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 20:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611450; x=1750216250; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKliCGksR6+ULOCTOHx3A9pUuY8LclRcFBEc4eLZfck=;
        b=Xryf7d9+bJsWcDCd4yDo9n/+rBHGcne5th4+ziwO/dWEh7k6Q1736yY/0v6hZd3uX/
         kUnGVvp9kpRIggXEswkSNOSCryavZdoHZKTzg0gl80723pVEtKTsSSV5OgvVGJ06Si5a
         uSwVPnwcp/aIm636DSJgoZudkM/Xk5IBpUfRG9aITJdDa+EyOkvZYkHZ/d4bxNconUYx
         gXh80JpshKOA1T88+B1W065llIJ4Nn8teRQNpTXC9C4CgOV894MXd897hChvg9au/j7h
         mo0KetNnpS4wrhTSglTj2W48qonRVi3hkBo7JfdbtYSUEm67kcfg2U64HEnn7IiDODIb
         csFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611450; x=1750216250;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKliCGksR6+ULOCTOHx3A9pUuY8LclRcFBEc4eLZfck=;
        b=kJuCY4RfVJcB4HJwhOrwEfOjcMrVqbFLtpATyVr5KNeTTw76aT6s4iobKwu075hNxP
         WIJV1RfREYeiyBo6PQWAF0dONvX/S9dgl2bV4JKZ/SNYTKwSb5TIfvclsbCBdLdcfycf
         z2lCAGJOTAkeP3kyuWQU2kwE12buZeoLoZuXJuikWyPZfzMbATFR6G8M8dA5hx6EMbst
         TIl/uvh4Zr8kTN5xWlQFsy6VmM6URIRBG6R+fbxfLfdvKHu92qP2b4Ym8rNQc5GWHmoS
         xuEF1YPwZLu+4eSoBVvaSE3MlLx3XRF/4r/lPw97kHr0OCkAbY4e2MNrWZJUu47GYpNd
         tp3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXC10MArve/N6MPsBwsfiVcMZ4m7u2KgOwCuvmpqMd8qZqUsXi3REeU0/k+7rj2DK5io8R+ovjU5LhVQQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyqFYnf3HmXn2upkRGeokzNIoLxXjmetm2GGArH3JChmBbDZPt
	qtKg9CPfHsehK1ZGHhzRvAIwOAO1UfNmfoBZlg3RkXX7oujwg3geviujna3Qo/VAkxQ=
X-Gm-Gg: ASbGnct8bP483gmlU/pbiMzRiCMVfQ5SXypSlr3kk6hBet/5N7uanLvGnP4AtKtB98p
	5QEbrWbAI46GIw5G3pV6SpnP+ZzboMNvX5S8LBpax83p9yOyK21m+fTBSwVnMsXrKDwzChSpiMD
	pat/aNKa2T9JtV7zKOyO196/DauSjwxqLnRTf6ym3z52u3d7qetVNNJTS9cNJf2Pl8Awg0dUPVp
	L4ecKUyeiuCZyGun8CWc8s53f8tqs8yYxRHMIckIOJGUQ2sKVRpZZlb1kBvwHs+COuoKdd6fOqf
	G09C5gqYtcQD6oPbt0SnEsa2jLNyZijuof1EaGTCAIrHpc+91x4RnZTAF9HeNaBERi/lRGQex/4
	A6tjw5sKU
X-Google-Smtp-Source: AGHT+IFPno+Zu2I5qZ202mkGD/8XfyJVIJyg5/3MgZXAw5pnr/jUfcVT8Ys4xo+b9DSKEUYG3e62jw==
X-Received: by 2002:a17:902:dacf:b0:234:986c:66f9 with SMTP id d9443c01a7336-23642621cf9mr18955565ad.22.1749611450426;
        Tue, 10 Jun 2025 20:10:50 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:50 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 3/3] cpuidle: Add SiFive power provider
Date: Wed, 11 Jun 2025 11:10:22 +0800
Message-Id: <20250611031023.28769-4-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250611031023.28769-1-nick.hu@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_201051_262176_F059343C 
X-CRM114-Status: GOOD (  20.62  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The SiFive DMC is the power provider of the devices that inside the
SiFive CPU power domains, which include Tile, Cluster and Core Complex
power domains. Before the cpu entering the firmware-based idle state,
each devices that inside the corresponding domain should be suspended
properly. So this driver will create the power provider and set the
correct idle state.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/Kconfig.riscv           |  11 +++
 drivers/cpuidle/Makefile                |   1 +
 drivers/cpuidle/cpuidle-sifive-dmc-pd.c | 102 ++++++++++++++++++++++++
 3 files changed, 114 insertions(+)
 create mode 100644 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
index 78518c26af74..af802afefa21 100644
--- a/drivers/cpuidle/Kconfig.riscv
+++ b/drivers/cpuidle/Kconfig.riscv
@@ -13,3 +13,14 @@ config RISCV_SBI_CPUIDLE
 	  Select this option to enable RISC-V SBI firmware based CPU idle
 	  driver for RISC-V systems. This drivers also supports hierarchical
 	  DT based layout of the idle state.
+
+config SIFIVE_DMC_PD_CPUIDLE
+	bool "SiFive DMC SBI PD Provider Driver"
+	depends on ARCH_SIFIVE
+	select PM_GENERIC_DOMAINS_OF
+	select RISCV_SBI_CPUIDLE
+	default y
+	help
+	  Select this option to enable SiFive DMC SBI PD Provider driver.
+	  This driver will create the genpd provider and work with the
+	  RISC-V SBI firmware based CPU idle driver.
diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
index 1de9e92c5b0f..1f8e01b415e8 100644
--- a/drivers/cpuidle/Makefile
+++ b/drivers/cpuidle/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_POWERNV_CPUIDLE)		+= cpuidle-powernv.o
 ###############################################################################
 # RISC-V drivers
 obj-$(CONFIG_RISCV_SBI_CPUIDLE)		+= cpuidle-riscv-sbi.o
+obj-$(CONFIG_SIFIVE_DMC_PD_CPUIDLE)	+= cpuidle-sifive-dmc-pd.o
diff --git a/drivers/cpuidle/cpuidle-sifive-dmc-pd.c b/drivers/cpuidle/cpuidle-sifive-dmc-pd.c
new file mode 100644
index 000000000000..1c6b2131e573
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-sifive-dmc-pd.c
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SiFive CPUIDLE SBI PD driver
+ */
+
+#define pr_fmt(fmt) "sifive_cpuidle_sbi_pd: " fmt
+
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "cpuidle-riscv-sbi.h"
+#include "dt_idle_genpd.h"
+
+static void sifive_dmc_remove(struct platform_device *pdev)
+{
+	struct generic_pm_domain *pd = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	pm_runtime_disable(dev);
+	of_genpd_del_provider(dev->of_node);
+	pm_genpd_remove(pd);
+	dt_idle_pd_free(pd);
+}
+
+static int sifive_dmc_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct device_node *np = dev->of_node;
+	struct generic_pm_domain *pd;
+	struct of_phandle_args child, parent;
+	int ret = -ENOMEM;
+
+	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
+	if (!pd)
+		goto fail;
+
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	pd->power_off = sbi_cpuidle_pd_power_off;
+
+	ret = pm_genpd_init(pd, &pm_domain_cpu_gov, false);
+	if (ret)
+		goto free_pd;
+
+	ret = of_genpd_add_provider_simple(np, pd);
+	if (ret)
+		goto remove_pd;
+
+	if (of_parse_phandle_with_args(np, "power-domains",
+				       "#power-domain-cells", 0,
+				       &parent) == 0) {
+		child.np = np;
+		child.args_count = 0;
+
+		if (of_genpd_add_subdomain(&parent, &child))
+			pr_warn("%pOF failed to add subdomain: %pOF\n",
+				parent.np, child.np);
+		else
+			pr_debug("%pOF has a child subdomain: %pOF.\n",
+				 parent.np, child.np);
+	}
+
+	platform_set_drvdata(pdev, pd);
+	pm_runtime_enable(dev);
+	pr_info("%s create success\n", pd->name);
+	return 0;
+
+remove_pd:
+	pm_genpd_remove(pd);
+free_pd:
+	dt_idle_pd_free(pd);
+fail:
+	pr_info("%s create fail\n", pd->name);
+
+	return ret;
+}
+
+static const struct of_device_id sifive_dmc_of_match[] = {
+	{ .compatible = "sifive,tmc1", },
+	{ .compatible = "sifive,tmc0", },
+	{ .compatible = "sifive,smc1", },
+	{ .compatible = "sifive,smc0", },
+	{ .compatible = "sifive,cmc2", },
+	{}
+};
+
+static struct platform_driver sifive_dmc_driver = {
+	.probe = sifive_dmc_probe,
+	.remove = sifive_dmc_remove,
+	.driver = {
+		.name = "sifive_dmc",
+		.of_match_table = sifive_dmc_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init sifive_dmc_init(void)
+{
+	return platform_driver_register(&sifive_dmc_driver);
+}
+arch_initcall(sifive_dmc_init);
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
