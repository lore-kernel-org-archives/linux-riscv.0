Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9AE4C7EE30
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 09:34:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ekj4LlR20Npgp2UP+tnX5zDcDZp/E/oxcfS6gdg8rAk=; b=DF9jiuqf4q0x5m
	q5sEV9nHLROVNPiIo9eB8jsdUB5XlvL0bywxtLft71OipTfKFyVUapawg8Kgf2fAPrrMu9wmFTV+n
	IhazM9jSmVkkISASkfGxU25coaK3q3c6DUOc5sKMAqEWM/oR7rg022yL8ZFOjpCHPCOe8t7OpWsN5
	msA8j+jWwTVS/tn9BuVPjWR62FEd8zTMu8AIK8UTQrjrAFbO2EqB6J095X87eapfQHbkDY3nikFA9
	MU+nlfor7t5kshsw3MP0vHlIS77ukDNcspzcuhgkIeCdJFujGAipury0wk3OxM4EFudz7eGhprRB3
	JGPykqzAsdFsNJwIz0cg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtqg-00000007mNA-0Iz7;
	Wed, 02 Jul 2025 09:33:50 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtWk-00000007ir5-1GyG
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 09:13:15 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-6fb01566184so55515036d6.1
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 02:13:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447593; x=1752052393; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=vo6FBHptvz4zRCJelPx9LjfFz/JvRA8JCJ880HRAykw=;
        b=bksjpQED0yvvQNSEkgO1u6sBwMg/czfCSrlCNLB5QJWwfO6F92cNGCXkvj1DtNkZiW
         sBf6aWqBuBJ1jNMmKc7z9nBe+Mrk2r+cRRJCSFeosQU7BfBwi5QZ0GuouqYAN3FckGq/
         wH9V/Lm2BvfF8A930U9FOWUSgNGgWIi71qlLbluA/VE9WU0gSserqbHgi8cqM4+wwL3W
         nzhTAHzhkn7MW9na5TBrhAH46uHz9vTaheMRd1atqmHXICW/6SQJWi7hzNJqGWs+9g+J
         XLfybnPYpRWzugELJB1adaSVX/FF6jDNbzW5rbGZiyfNl32rH84z/YP/kMn+n8LWLVXN
         9PeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447593; x=1752052393;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vo6FBHptvz4zRCJelPx9LjfFz/JvRA8JCJ880HRAykw=;
        b=uxJgFzyxXzDFxCb9KdV9honvyNR7KmUrlRPV6pl6DLwcMzfS/L7VmDpOieBrBNDYRg
         WCZ6SSWNh+mPCE49r3/dSj4bWgRK/w5sKmIp30ZXLkS5vdVyvO5ZQPtxYQXbc7bfAGmO
         SouZdZ4TcXlIwIj8sTDwsWzwd+RPZeUdwISjQk62zJmC9vwSMeEBqBW2X8MLaveU/h+o
         LDn5lCcznAoSHMSkkFgH7JCghgon/LJwgIQ3V65ltbwOkoTdo0Kg7oNd61q+Ho9WwehM
         Ssw5HyNBusU0Et9V+hrO9PSj5xKt8PhZDrmJ28T2rE6/Swv3M69PdfvKC5jcorasDMy2
         mWZg==
X-Forwarded-Encrypted: i=1; AJvYcCW1vR8kUQZVXqF6q94G8uV4I+/7mtz33YEDq7eoLexpcwvu4LEOIxmXvwWo29HdjXSdH2ieUNarOYCF6Q==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywib20skw7ONb//Up07MLt/SRLLJAYg1ONd9fXPUngMTzs4+eDu
	KBasOTECg1M9AgP43ea5yBwP744PUZg1MXwETdT+2tI6NZ7fuu9i0r8xuDJpvw3KgPk=
X-Gm-Gg: ASbGnculoR0bzPqykbf8KtPIPIXKngWErIQ+8FYLYpGMDTV+U6iuqcxPyqyrFzbLIei
	jy+5lxAxnajjnmLxRQgb227+AkpSsZ+Vdz4kF6toagOPrcGJPuQaHMc4ZEVo/17wot+ZU5KylEd
	V0wTRPQCE7uH7Gn0UKV5XRgxLBWPC19yQ5F/Q0Qt8BRQDWQgRiMCj8O9FVm+16XwAmJ/v05yRWb
	4mPKX/sDwrnWqw2gOwckfdXTtY9jgMCfmU1n98xOa1wJsbo70Xi2oOdHThAEYitKmUONtrAhUoL
	4ym6FLdW57Dj8vlo0eufDaNGLZ4hT4prW/2eypeVBFgffq/8dwJl0K1mGrQch9hru5nbUtSgZBl
	lO5ntod87
X-Google-Smtp-Source: AGHT+IFzmLCmLoGxxKwpjhHax+Cuhcc0opHmznf13C5TLU2uQvyPNUYZotNsu3vuaVV6k6gxhSCFeA==
X-Received: by 2002:a05:6214:20cf:b0:6fd:7604:d90a with SMTP id 6a1803df08f44-702b1aae28fmr19229146d6.6.1751447593097;
        Wed, 02 Jul 2025 02:13:13 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:13:12 -0700 (PDT)
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
Subject: [PATCH v3 3/3] cpuidle: Add SiFive power provider
Date: Wed,  2 Jul 2025 17:12:36 +0800
Message-Id: <20250702091236.5281-4-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702091236.5281-1-nick.hu@sifive.com>
References: <20250702091236.5281-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021314_344040_9842562F 
X-CRM114-Status: GOOD (  22.09  )
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
 drivers/cpuidle/Kconfig.riscv           |  12 +++
 drivers/cpuidle/Makefile                |   1 +
 drivers/cpuidle/cpuidle-sifive-dmc-pd.c | 102 ++++++++++++++++++++++++
 3 files changed, 115 insertions(+)
 create mode 100644 drivers/cpuidle/cpuidle-sifive-dmc-pd.c

diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
index 78518c26af74..f461d09e0bdc 100644
--- a/drivers/cpuidle/Kconfig.riscv
+++ b/drivers/cpuidle/Kconfig.riscv
@@ -13,3 +13,15 @@ config RISCV_SBI_CPUIDLE
 	  Select this option to enable RISC-V SBI firmware based CPU idle
 	  driver for RISC-V systems. This drivers also supports hierarchical
 	  DT based layout of the idle state.
+
+config SIFIVE_DMC_PD_CPUIDLE
+	bool "SiFive DMC SBI PD Provider Driver"
+	depends on ARCH_SIFIVE && RISCV_SBI && PM && OF
+	select PM_GENERIC_DOMAINS
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
