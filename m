Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7E4CF6A88
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M2jvMw6hqz2W8muVSGzPZnWE4Jum4SB/21SK1ME7X60=; b=E7ZtalmfAa1G0o
	DcfHmXQSfA8jGySPaKr2pZokPISWXDOR4gxnTPyrCThRo6TjlBLJpq2OaAuGrcJ2w3gjkXtHLjzve
	6hvJ/4wme+jhjjKk0tNgnPeawYLEzVpr3uSctgZn6YGjezrz0df1FGBDQdpiYBfQ8qyaa4JHpuOXk
	33sJKrztu+HPQaR6iClWai82RcBBonnj08aZQRTJUfIHCL58adjCbx5gkEJ00dsL2cO+IP0OampoG
	vErKtk+PCrReIJOjnsCl+LmvTgL5ZstxsxaeaPENGZyHbvonSOLXHlWkrALoDVcXZBkYoCZMdyP7m
	GM+reDtuauBtTlLNZZrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqu-0000000GMxJ-3XZc;
	Thu, 08 Jan 2026 08:58:44 +0000
Received: from mail-dy1-x132e.google.com ([2607:f8b0:4864:20::132e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqs-0000000GMw0-0LB5
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:58:43 +0000
Received: by mail-dy1-x132e.google.com with SMTP id 5a478bee46e88-2b04a410f42so2219423eec.0
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 00:58:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767862721; x=1768467521; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+qYO/gxPTzZ1gsudLMySBCma6iHYfPz33KQqAWsXtts=;
        b=VXCKNK701U88MtElN6JD4ze8V1iY1Tayk8DJ80E9ddHeZ+ldC/uMRBHGZepzSweGZF
         jaqtZjzLNpW2/76bUoaDznD8MU9mBfLtyefUV7dU+zmEi8EOmcOHHAUun1vvKAlc6xGa
         rUDmEOg/46rSUU9o7kPAnLGkC8s7YvGZEy3gArdw/iJ0uihgKV/7OmGP2YeVoMgJfO9o
         Br2HHFqD/y69nWF8PRFRgOVb/RKs1sbzxHaU80tq6WYqckkK7CKWnvpL93GzGz+awk+U
         Drx3hmAC4VtpGX8A5Yb4VScEek1Xo0ShwoOh5OnA7GGmCvRXIkPvB5+pH09/W7bvrzNy
         apag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862721; x=1768467521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+qYO/gxPTzZ1gsudLMySBCma6iHYfPz33KQqAWsXtts=;
        b=bNaLESs5E72OZ2Hr0aPjK9WAbYLK27dB4xZqE3+hz/E5GBYwwdLFN0+ifE08rxhJRW
         yuZC0n9ejTT6KaOOfwpES+ZrGdZ9wxYHWMap3mt8wOKKTUmdI7uXZUXn9F6jdO6ckLOq
         LMTUSn4vqVTEVbtlCuJNyvyqMAy6oyJpEfwRkWco+RWCaBH3LsyvOuENNcKxmkB39VHr
         soKfN/xncqbOo/1zv/CU5R8ANVjtJF+3YgvVNs/7aammzBdy1/qeuzeeU54L/2d9NRb/
         hly8mqqnHxhEdvlQzVlXcJewuZMWEhGGs8hZBlAx549AIQqia9+ZxqhgbscdApD9d+3N
         DxBA==
X-Forwarded-Encrypted: i=1; AJvYcCVjFo8yYgsV6k760P4qI33s9Q7fQDXVbXwUnB9qpiz6wGTyFnsbF4Pt9J+hJMt2uyFrNT2Vn5Ytp3u6ew==@lists.infradead.org
X-Gm-Message-State: AOJu0YwDFXMYiVQXdfITplcKhUHm4npnZDuvUbq7i+RISvPOyUSzj9nf
	qUVQQpPwWuSQflX9i1CxDe/9ZFWEW6jIQDvBsEcxz1BWICkxRgLZwlNmJmdf+WcQQZdio2ykcfn
	+wCDo2ss4gA==
X-Gm-Gg: AY/fxX7LI+DGhPNXm5NTKKJy14oa/dq+1x49AFHAIAzvH8pwHn143eFITc4ULcZyo4b
	wtMVOBk/gksZFCQhItA9pruf0HXOLpW31beOzvJ6EbEsZ50vXKfZf5cCcfTG8cIoSOl4K/Z6cIy
	d1ClJUks25xhqTW1BVUFKA6dkexEB2kDw9jnV5aZ1J6UFv3/va60+JtYrtlkZJFRaosplIRIMl1
	s6xL5Zhon2Q6Q8DCI+AfX+zlLfqHxDRER4jtlIAFJQ2fiCKWMdreRKkQ8ZmrQyhCHnZlJtsMAAH
	Sn2Ad+LS9rtWCh8jEUgI5orY9vhDyXBuqaOcGAs1Vn7yV69oF4MQicot1c0g9x2eNpkNqMfnslh
	N18d7LnhsbieJ/lnD8DCmkYLSLAp4IKA8v4ECLbGF+ZqWglZ/nuOq31pk7BkgncyDgVBkptSnQe
	AEHlyxHHl8YK13Ynf6iPuFabk=
X-Google-Smtp-Source: AGHT+IE1ZYycZa8LfJgM/0T5ClhaC/Ln6YDrHSVxn+Bb2E0ZQUAhY5IK4YTUt16wFaSjFCweu0L/Dw==
X-Received: by 2002:a05:693c:40db:b0:2ae:55f1:8201 with SMTP id 5a478bee46e88-2b17d23964bmr4070425eec.1.1767862721007;
        Thu, 08 Jan 2026 00:58:41 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm8833634eec.2.2026.01.08.00.58.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:40 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 08 Jan 2026 00:58:26 -0800
Subject: [PATCH v4 3/3] cpuidle: Add SiFive power provider driver
MIME-Version: 1.0
Message-Id: <20260108-sifive-pd-drivers-v4-3-2a523d7d51a0@sifive.com>
References: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
In-Reply-To: <20260108-sifive-pd-drivers-v4-0-2a523d7d51a0@sifive.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Anup Patel <anup@brainfault.org>, 
 Samuel Holland <samuel.holland@sifive.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Cyan Yang <cyan.yang@sifive.com>, 
 Nick Hu <nick.hu@sifive.com>
Cc: linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_005842_155495_3162D29B 
X-CRM114-Status: GOOD (  23.29  )
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

The SiFive DMC is the power provider of the devices that inside the
SiFive CPU power domains, which include Tile, Cluster and Core Complex
power domains. Before the cpu entering the firmware-based idle state,
each devices that inside the corresponding domain should be suspended
properly. this driver will create the power provider and set the correct
domain idle state.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/Kconfig.riscv               |  12 +++
 drivers/cpuidle/Makefile                    |   1 +
 drivers/cpuidle/cpuidle-sifive-dmc-domain.c | 124 ++++++++++++++++++++++++++++
 3 files changed, 137 insertions(+)

diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
index b813018ce401..2fe0912f8027 100644
--- a/drivers/cpuidle/Kconfig.riscv
+++ b/drivers/cpuidle/Kconfig.riscv
@@ -22,3 +22,15 @@ config RISCV_SBI_CPUIDLE_DOMAIN
 	  Select this option to enable RISC-V SBI firmware based CPU idle
 	  driver to use PM domains, which is needed to support the hierarchical
 	  DT based layout of the idle state.
+
+config SIFIVE_DMC_CPUIDLE_DOMAIN
+	bool "SiFive DMC CPU idle Domain"
+	depends on ARCH_SIFIVE
+	depends on RISCV_SBI_CPUIDLE
+	depends on PM_GENERIC_DOMAINS_OF
+	select DT_IDLE_GENPD
+	default y
+	help
+	  Select this option to enable RISC-V SBI firmware based CPU idle
+	  driver to use PM domains on SiFive Platforms, which is needed to
+	  support the hierarchical DT based layout of the idle state.
diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
index 82595849b75d..eead4c049414 100644
--- a/drivers/cpuidle/Makefile
+++ b/drivers/cpuidle/Makefile
@@ -43,3 +43,4 @@ obj-$(CONFIG_POWERNV_CPUIDLE)		+= cpuidle-powernv.o
 # RISC-V drivers
 obj-$(CONFIG_RISCV_SBI_CPUIDLE)		+= cpuidle-riscv-sbi.o
 obj-$(CONFIG_RISCV_SBI_CPUIDLE_DOMAIN)	+= cpuidle-riscv-sbi-domain.o
+obj-$(CONFIG_SIFIVE_DMC_CPUIDLE_DOMAIN)	+= cpuidle-sifive-dmc-domain.o
diff --git a/drivers/cpuidle/cpuidle-sifive-dmc-domain.c b/drivers/cpuidle/cpuidle-sifive-dmc-domain.c
new file mode 100644
index 000000000000..5174bc525a13
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-sifive-dmc-domain.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * SiFive CPUIDLE DMC driver
+ */
+
+#define pr_fmt(fmt) "sifive_dmc_cpuidle_domain: " fmt
+
+#include <linux/of_device.h>
+#include <linux/platform_device.h>
+#include <linux/pm_domain.h>
+#include <linux/pm_runtime.h>
+
+#include "cpuidle-riscv-sbi.h"
+#include "dt_idle_genpd.h"
+
+static bool use_osi = true;
+
+static int sifive_cpuidle_dmc_power_off(struct generic_pm_domain *pd)
+{
+	struct genpd_power_state *state = &pd->states[pd->state_idx];
+	u32 *pd_state;
+
+	if (!state->data)
+		return 0;
+
+	/* OSI mode is enabled, set the corresponding domain state. */
+	pd_state = state->data;
+	sbi_set_domain_state(*pd_state);
+
+	return 0;
+}
+
+static int sifive_dmc_probe(struct platform_device *pdev)
+{
+	struct device_node *np = pdev->dev.of_node;
+	struct of_phandle_args child, parent;
+	struct device *dev = &pdev->dev;
+	struct generic_pm_domain *pd;
+	int ret = -ENOMEM;
+
+	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
+	if (!pd)
+		goto out;
+
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+	if (use_osi)
+		pd->power_off = sifive_cpuidle_dmc_power_off;
+	else
+		pd->flags |= GENPD_FLAG_ALWAYS_ON;
+
+	ret = pm_genpd_init(pd, &pm_domain_cpu_gov, false);
+	if (ret)
+		goto free_pd;
+
+	ret = of_genpd_add_provider_simple(np, pd);
+	if (ret)
+		goto remove_pd;
+
+	if (!of_parse_phandle_with_args(np, "power-domains", "#power-domain-cells", 0, &parent)) {
+		child.np = np;
+		child.args_count = 0;
+
+		ret = of_genpd_add_subdomain(&parent, &child);
+		of_node_put(parent.np);
+		if (ret) {
+			pr_err("%pOF failed to add subdomain: %pOF\n", parent.np, child.np);
+			goto remove_pd;
+		}
+	}
+
+	pm_runtime_enable(dev);
+	pr_info("init PM domain %s\n", dev_name(dev));
+	return 0;
+
+remove_pd:
+	pm_genpd_remove(pd);
+free_pd:
+	dt_idle_pd_free(pd);
+out:
+	pr_err("failed to init PM domain ret=%d %pOF\n", ret, np);
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
+	.driver = {
+		.name = "sifive_dmc",
+		.of_match_table = sifive_dmc_of_match,
+		.suppress_bind_attrs = true,
+	},
+};
+
+static int __init sifive_dmc_domain_init(void)
+{
+	int cpu;
+
+	/* Detect OSI support based on CPU DT nodes */
+	for_each_possible_cpu(cpu) {
+		struct device_node *np __free(device_node) = of_cpu_device_node_get(cpu);
+		if (np &&
+		    of_property_present(np, "power-domains") &&
+		    of_property_present(np, "power-domain-names")) {
+			continue;
+		} else {
+			use_osi = false;
+			break;
+		}
+	}
+
+	sbi_set_osi_mode(use_osi);
+
+	/* Only probe the DMCs when OSI supported */
+	return platform_driver_register(&sifive_dmc_driver);
+}
+core_initcall(sifive_dmc_domain_init);

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
