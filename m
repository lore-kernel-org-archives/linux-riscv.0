Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92F7BCF6A89
	for <linux-riscv@archiver.kernel.org>; Thu,  8 Jan 2026 08:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+d5uIc9pyaPpyIn6K+mQdSdtp8tHBSfLkRGHxXKbVpU=; b=4Ok9gnapBUddSM
	AUa1CZKMCA/y48iSc0oD+fe+AI0+/4yWVbdlZ0jqdrR44aDDxFCvmye/FdbCBvlEAWygCpYsfe7XU
	HX0AqrjF1sabOgUug8ls5aW0mpaqVC0ovkuWrzHV2AEydAl8SqItJBwV+pDTrzEPDY11f107e3//3
	0X3G+Ext/OVbjpNvmuU+VtD1fqheSEZyJPRY2rJLiHh6r4OR3nvhTnyctf1XfXddveKRvr+1yFlQU
	HTmIUQHkikYGKr6WttXEgv0A5h7WuyAWFzhUDBLsCVsOaZriyefmZoO8IZ5tM2Mjom1tFChmFEfX0
	lJHYIN4klN6TbCtluHJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqu-0000000GMxB-2I4B;
	Thu, 08 Jan 2026 08:58:44 +0000
Received: from mail-dy1-x132c.google.com ([2607:f8b0:4864:20::132c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlqp-0000000GMuw-2iqC
	for linux-riscv@lists.infradead.org;
	Thu, 08 Jan 2026 08:58:43 +0000
Received: by mail-dy1-x132c.google.com with SMTP id 5a478bee46e88-2b04fb5c7a7so2440751eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 08 Jan 2026 00:58:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1767862719; x=1768467519; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YHgXYcn6j9hrIoVhqdjOMXkUH+ey28hNkJayufBoRxM=;
        b=lwDJ29fzz+3+41v77fjFX8K83BaHGzzQ5AzPtBP39RBE4N7HT47W0MSpiSDGMMzk9C
         6acT1AjNHxHmI0rS6pnsuU+f4dO8vbIASuqVQK/cXIUN0ZymkoR7nnmU1PhoYqWCITI8
         cpvT+rYpp3PXLRhvvabe/nvCCkq/0u/RJ5DwT4gykDq0lRYHcYVpPnTckvgtN2srjgIM
         kQ/uoeBvx/LPVIJOtulDy2eMwDQzbH2IFxLPtTDApCmzuchpAj2LLpvbxb1JOlOdd/bx
         AVHd9IZhUlPCbeON0IROhJp/VtwhE7SrPjX4REwEHcEKlIqiiGHfEXJ4oBlF6D05Aa/n
         F77Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767862719; x=1768467519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=YHgXYcn6j9hrIoVhqdjOMXkUH+ey28hNkJayufBoRxM=;
        b=ml7Ka2iQ/Y5eN+YGQ6iMBlj2cxVHPWUEL6IyGSv3H5ZIdzk4ytbEZIIOcXrPvkXaJG
         hDb5ev2ND2CAlToPl4fKpuakWOdnzHZuBNy+fyDZO/uzi8tI8Zz1otKefXE/ZKMWdtF7
         8tlFbwaOo+sFEZBvIjmOVR62i/avfToV8bdFiHNnKVrcEZMJ5UbxFCokddnyqHodYx2v
         zhkPrMXKqiPdMRzfVdrvx7RWt0mDZhTpMtDqvMsgUfvnHrBcaHF9c8ZeAbtYzxUVy/gt
         LNfJ7fJErNpsLFtkvEjjZbA5wiDJ+nVTT4M//4fTpv1/x5HSZ/Ezjcow5sIHx25troCd
         5qnw==
X-Forwarded-Encrypted: i=1; AJvYcCU/KQUI7cZqFaKOEk1jAOTyYbKP+jUUJVmiCv/jr1//C1tUUqjJPaWFdfO4DX6oJXGoflwjhQwNEwXDPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxK21hEsUg/pWkQ/PbIO/+wDof/vx+3CPzHLPXoxFdjWhmo5jGg
	OUoszLdeg8FZfcz0cqeG7hJEKVy04fFxmBXtpBYOMH6tml5OjC1afAZXzfn3SBEKNzc=
X-Gm-Gg: AY/fxX7xbLa3KI4vCJvGq95Am1gu/LDMN0fYlAW7EjeYJiz1f1bv8MmLVRt4pAjRGG6
	PVzfJ6zTnSacSiMBXWdCYeXRRsED95HGv4UMc/BzLgQDYqf0Nex+r86P+FnBexh7GRqMPyAm4vl
	8wexGmHjbRWbD5ILQ25dUag2LUzDqw1P7IWEBAyAqXDCmRXs0jB7U1alXmtZf1G71235OvUq6RU
	8VvmSa0FpebRgyhw0o4ugKWz+Bxd/BquczkEDOOG2efBAlBQxg410UVrJW01NqgcjuIT1dZDfcR
	AXnx1EVgOb3UlBGMvlDD4hv9RJkuauMI/DvblxZBn+HGI3NsvgtotgcI0iasJHx5d2itoF9aMbS
	E9jmRfCdwS4I8ZxagChgHYr4uZcWXwBrGJ/ovpkKZGyu5oArV7HtovWRBZJONH92blbrFM4Y88F
	/IswVOSlGriKv3jrr7diAxBOY=
X-Google-Smtp-Source: AGHT+IG+4Su03prYbt6n5qR1nTAfW+7RTrG8/tcfMCDl8OXrQiz833IsM6Hd3eTjjbNcqhMNkJD8+A==
X-Received: by 2002:a05:7300:8290:b0:2ae:598e:abe5 with SMTP id 5a478bee46e88-2b17d321a6dmr2554912eec.35.1767862718478;
        Thu, 08 Jan 2026 00:58:38 -0800 (PST)
Received: from sw07.internal.sifive.com ([4.53.31.132])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b170675076sm8833634eec.2.2026.01.08.00.58.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jan 2026 00:58:37 -0800 (PST)
From: Nick Hu <nick.hu@sifive.com>
Date: Thu, 08 Jan 2026 00:58:24 -0800
Subject: [PATCH v4 1/3] cpuidle: riscv-sbi: Split PM domain init out of the
 cpuidle driver
MIME-Version: 1.0
Message-Id: <20260108-sifive-pd-drivers-v4-1-2a523d7d51a0@sifive.com>
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
X-CRM114-CacheID: sfid-20260108_005841_166253_271DA9C2 
X-CRM114-Status: GOOD (  27.45  )
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

Move the PM domain initialization logic from the RISC-V SBI CPU idle
driver into a separate driver. This decouples the power domain setup
from cpuidle and allows the generic PM domain framework to be used
independently. This change also enables external power domain drivers to
operate with the RISC-V SBI CPU idle driver

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 MAINTAINERS                                |   2 +
 drivers/cpuidle/Kconfig.riscv              |  13 ++-
 drivers/cpuidle/Makefile                   |   1 +
 drivers/cpuidle/cpuidle-riscv-sbi-domain.c | 176 ++++++++++++++++++++++++++++
 drivers/cpuidle/cpuidle-riscv-sbi.c        | 178 ++---------------------------
 drivers/cpuidle/cpuidle-riscv-sbi.h        |  29 +++++
 6 files changed, 228 insertions(+), 171 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648..b52f11602271 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6632,7 +6632,9 @@ M:	Anup Patel <anup@brainfault.org>
 L:	linux-pm@vger.kernel.org
 L:	linux-riscv@lists.infradead.org
 S:	Maintained
+F:	drivers/cpuidle/cpuidle-riscv-sbi-domain.c
 F:	drivers/cpuidle/cpuidle-riscv-sbi.c
+F:	drivers/cpuidle/cpuidle-riscv-sbi.h
 
 CPUMASK API [RUST]
 M:	Viresh Kumar <viresh.kumar@linaro.org>
diff --git a/drivers/cpuidle/Kconfig.riscv b/drivers/cpuidle/Kconfig.riscv
index 78518c26af74..b813018ce401 100644
--- a/drivers/cpuidle/Kconfig.riscv
+++ b/drivers/cpuidle/Kconfig.riscv
@@ -8,8 +8,17 @@ config RISCV_SBI_CPUIDLE
 	depends on RISCV_SBI
 	select DT_IDLE_STATES
 	select CPU_IDLE_MULTIPLE_DRIVERS
-	select DT_IDLE_GENPD if PM_GENERIC_DOMAINS_OF
 	help
 	  Select this option to enable RISC-V SBI firmware based CPU idle
-	  driver for RISC-V systems. This drivers also supports hierarchical
+	  driver for RISC-V systems.
+
+config RISCV_SBI_CPUIDLE_DOMAIN
+	bool "RISC-V SBI CPU idle Domain"
+	depends on RISCV_SBI_CPUIDLE
+	depends on PM_GENERIC_DOMAINS_OF
+	select DT_IDLE_GENPD
+	default y
+	help
+	  Select this option to enable RISC-V SBI firmware based CPU idle
+	  driver to use PM domains, which is needed to support the hierarchical
 	  DT based layout of the idle state.
diff --git a/drivers/cpuidle/Makefile b/drivers/cpuidle/Makefile
index 1de9e92c5b0f..82595849b75d 100644
--- a/drivers/cpuidle/Makefile
+++ b/drivers/cpuidle/Makefile
@@ -42,3 +42,4 @@ obj-$(CONFIG_POWERNV_CPUIDLE)		+= cpuidle-powernv.o
 ###############################################################################
 # RISC-V drivers
 obj-$(CONFIG_RISCV_SBI_CPUIDLE)		+= cpuidle-riscv-sbi.o
+obj-$(CONFIG_RISCV_SBI_CPUIDLE_DOMAIN)	+= cpuidle-riscv-sbi-domain.o
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi-domain.c b/drivers/cpuidle/cpuidle-riscv-sbi-domain.c
new file mode 100644
index 000000000000..24cb70700c22
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-riscv-sbi-domain.c
@@ -0,0 +1,176 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * PM domains for CPUs via genpd - managed by cpuidle-riscv-sbi.
+ *
+ * Copyright (c) 2021 Western Digital Corporation or its affiliates.
+ * Copyright (c) 2022 Ventana Micro Systems Inc.
+ */
+
+#define pr_fmt(fmt) "cpuidle-riscv-sbi-domain: " fmt
+
+#include <linux/device.h>
+#include <linux/pm_domain.h>
+
+#include "cpuidle-riscv-sbi.h"
+#include "dt_idle_genpd.h"
+
+struct sbi_pd_provider {
+	struct list_head link;
+	struct device_node *node;
+};
+
+static LIST_HEAD(sbi_pd_providers);
+
+static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
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
+static int sbi_pd_init(struct device_node *np, bool use_osi)
+{
+	struct generic_pm_domain *pd;
+	struct sbi_pd_provider *pd_provider;
+	struct dev_power_governor *pd_gov;
+	int ret = -ENOMEM;
+
+	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
+	if (!pd)
+		goto out;
+
+	pd_provider = kzalloc(sizeof(*pd_provider), GFP_KERNEL);
+	if (!pd_provider)
+		goto free_pd;
+
+	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
+
+	/* Allow power off when OSI is available. */
+	if (use_osi)
+		pd->power_off = sbi_cpuidle_pd_power_off;
+	else
+		pd->flags |= GENPD_FLAG_ALWAYS_ON;
+
+	/* Use governor for CPU PM domains if it has some states to manage. */
+	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
+
+	ret = pm_genpd_init(pd, pd_gov, false);
+	if (ret)
+		goto free_pd_prov;
+
+	ret = of_genpd_add_provider_simple(np, pd);
+	if (ret)
+		goto remove_pd;
+
+	pd_provider->node = of_node_get(np);
+	list_add(&pd_provider->link, &sbi_pd_providers);
+
+	pr_debug("init PM domain %s\n", pd->name);
+	return 0;
+
+remove_pd:
+	pm_genpd_remove(pd);
+free_pd_prov:
+	kfree(pd_provider);
+free_pd:
+	dt_idle_pd_free(pd);
+out:
+	pr_err("failed to init PM domain ret=%d %pOF\n", ret, np);
+	return ret;
+}
+
+static void sbi_pd_remove(void)
+{
+	struct sbi_pd_provider *pd_provider, *it;
+	struct generic_pm_domain *genpd;
+
+	list_for_each_entry_safe(pd_provider, it, &sbi_pd_providers, link) {
+		of_genpd_del_provider(pd_provider->node);
+
+		genpd = of_genpd_remove_last(pd_provider->node);
+		if (!IS_ERR(genpd))
+			kfree(genpd);
+
+		of_node_put(pd_provider->node);
+		list_del(&pd_provider->link);
+		kfree(pd_provider);
+	}
+}
+
+static int sbi_genpd_probe(struct device_node *np, bool use_osi)
+{
+	int ret = 0, pd_count = 0;
+
+	if (!np)
+		return -ENODEV;
+
+	/*
+	 * Parse child nodes for the "#power-domain-cells" property and
+	 * initialize a genpd/genpd-of-provider pair when it's found.
+	 */
+	for_each_child_of_node_scoped(np, node) {
+		if (!of_property_present(node, "#power-domain-cells"))
+			continue;
+
+		ret = sbi_pd_init(node, use_osi);
+		if (ret)
+			goto remove_pd;
+
+		pd_count++;
+	}
+
+	/* Bail out if not using the hierarchical CPU topology. */
+	if (!pd_count)
+		goto no_pd;
+
+	/* Link genpd masters/subdomains to model the CPU topology. */
+	ret = dt_idle_pd_init_topology(np);
+	if (ret)
+		goto remove_pd;
+
+	return 0;
+
+remove_pd:
+	sbi_pd_remove();
+	pr_err("failed to create CPU PM domains ret=%d\n", ret);
+no_pd:
+	return ret;
+}
+
+static int __init riscv_sbi_idle_init_domains(void)
+{
+	bool use_osi = true;
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
+	/* Populate generic power domains from DT nodes */
+	struct device_node *pds_node __free(device_node) =
+			of_find_node_by_path("/cpus/power-domains");
+	if (!pds_node)
+		return 0;
+
+	return sbi_genpd_probe(pds_node, use_osi);
+}
+core_initcall(riscv_sbi_idle_init_domains);
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 19be6475d356..95a837a1ba31 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -28,6 +28,7 @@
 #include <asm/suspend.h>
 
 #include "cpuidle.h"
+#include "cpuidle-riscv-sbi.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -46,7 +47,12 @@ static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
 static bool sbi_cpuidle_use_cpuhp;
 
-static inline void sbi_set_domain_state(u32 state)
+void sbi_set_osi_mode(bool use_osi)
+{
+	sbi_cpuidle_use_osi = use_osi;
+}
+
+void sbi_set_domain_state(u32 state)
 {
 	struct sbi_domain_state *data = this_cpu_ptr(&domain_state);
 
@@ -188,7 +194,7 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
 
@@ -345,177 +351,11 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	return ret;
 }
 
-#ifdef CONFIG_DT_IDLE_GENPD
-
-static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
-{
-	struct genpd_power_state *state = &pd->states[pd->state_idx];
-	u32 *pd_state;
-
-	if (!state->data)
-		return 0;
-
-	/* OSI mode is enabled, set the corresponding domain state. */
-	pd_state = state->data;
-	sbi_set_domain_state(*pd_state);
-
-	return 0;
-}
-
-struct sbi_pd_provider {
-	struct list_head link;
-	struct device_node *node;
-};
-
-static LIST_HEAD(sbi_pd_providers);
-
-static int sbi_pd_init(struct device_node *np)
-{
-	struct generic_pm_domain *pd;
-	struct sbi_pd_provider *pd_provider;
-	struct dev_power_governor *pd_gov;
-	int ret = -ENOMEM;
-
-	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
-	if (!pd)
-		goto out;
-
-	pd_provider = kzalloc(sizeof(*pd_provider), GFP_KERNEL);
-	if (!pd_provider)
-		goto free_pd;
-
-	pd->flags |= GENPD_FLAG_IRQ_SAFE | GENPD_FLAG_CPU_DOMAIN;
-
-	/* Allow power off when OSI is available. */
-	if (sbi_cpuidle_use_osi)
-		pd->power_off = sbi_cpuidle_pd_power_off;
-	else
-		pd->flags |= GENPD_FLAG_ALWAYS_ON;
-
-	/* Use governor for CPU PM domains if it has some states to manage. */
-	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
-
-	ret = pm_genpd_init(pd, pd_gov, false);
-	if (ret)
-		goto free_pd_prov;
-
-	ret = of_genpd_add_provider_simple(np, pd);
-	if (ret)
-		goto remove_pd;
-
-	pd_provider->node = of_node_get(np);
-	list_add(&pd_provider->link, &sbi_pd_providers);
-
-	pr_debug("init PM domain %s\n", pd->name);
-	return 0;
-
-remove_pd:
-	pm_genpd_remove(pd);
-free_pd_prov:
-	kfree(pd_provider);
-free_pd:
-	dt_idle_pd_free(pd);
-out:
-	pr_err("failed to init PM domain ret=%d %pOF\n", ret, np);
-	return ret;
-}
-
-static void sbi_pd_remove(void)
-{
-	struct sbi_pd_provider *pd_provider, *it;
-	struct generic_pm_domain *genpd;
-
-	list_for_each_entry_safe(pd_provider, it, &sbi_pd_providers, link) {
-		of_genpd_del_provider(pd_provider->node);
-
-		genpd = of_genpd_remove_last(pd_provider->node);
-		if (!IS_ERR(genpd))
-			kfree(genpd);
-
-		of_node_put(pd_provider->node);
-		list_del(&pd_provider->link);
-		kfree(pd_provider);
-	}
-}
-
-static int sbi_genpd_probe(struct device_node *np)
-{
-	int ret = 0, pd_count = 0;
-
-	if (!np)
-		return -ENODEV;
-
-	/*
-	 * Parse child nodes for the "#power-domain-cells" property and
-	 * initialize a genpd/genpd-of-provider pair when it's found.
-	 */
-	for_each_child_of_node_scoped(np, node) {
-		if (!of_property_present(node, "#power-domain-cells"))
-			continue;
-
-		ret = sbi_pd_init(node);
-		if (ret)
-			goto remove_pd;
-
-		pd_count++;
-	}
-
-	/* Bail out if not using the hierarchical CPU topology. */
-	if (!pd_count)
-		goto no_pd;
-
-	/* Link genpd masters/subdomains to model the CPU topology. */
-	ret = dt_idle_pd_init_topology(np);
-	if (ret)
-		goto remove_pd;
-
-	return 0;
-
-remove_pd:
-	sbi_pd_remove();
-	pr_err("failed to create CPU PM domains ret=%d\n", ret);
-no_pd:
-	return ret;
-}
-
-#else
-
-static inline int sbi_genpd_probe(struct device_node *np)
-{
-	return 0;
-}
-
-#endif
-
 static int sbi_cpuidle_probe(struct platform_device *pdev)
 {
 	int cpu, ret;
 	struct cpuidle_driver *drv;
 	struct cpuidle_device *dev;
-	struct device_node *pds_node;
-
-	/* Detect OSI support based on CPU DT nodes */
-	sbi_cpuidle_use_osi = true;
-	for_each_possible_cpu(cpu) {
-		struct device_node *np __free(device_node) = of_cpu_device_node_get(cpu);
-		if (np &&
-		    of_property_present(np, "power-domains") &&
-		    of_property_present(np, "power-domain-names")) {
-			continue;
-		} else {
-			sbi_cpuidle_use_osi = false;
-			break;
-		}
-	}
-
-	/* Populate generic power domains from DT nodes */
-	pds_node = of_find_node_by_path("/cpus/power-domains");
-	if (pds_node) {
-		ret = sbi_genpd_probe(pds_node);
-		of_node_put(pds_node);
-		if (ret)
-			return ret;
-	}
 
 	/* Initialize CPU idle driver for each present CPU */
 	for_each_present_cpu(cpu) {
@@ -576,4 +416,4 @@ static int __init sbi_cpuidle_init(void)
 
 	return 0;
 }
-arch_initcall(sbi_cpuidle_init);
+device_initcall(sbi_cpuidle_init);
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.h b/drivers/cpuidle/cpuidle-riscv-sbi.h
new file mode 100644
index 000000000000..f9a0e81d1417
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.h
@@ -0,0 +1,29 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef __CPUIDLE_RISCV_SBI_H
+#define __CPUIDLE_RISCV_SBI_H
+
+#ifdef CONFIG_RISCV_SBI_CPUIDLE
+
+void sbi_set_osi_mode(bool use_osi);
+void sbi_set_domain_state(u32 state);
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state);
+
+#else
+
+static inline void sbi_set_osi_mode(bool use_osi)
+{
+}
+
+static inline void sbi_set_domain_state(u32 state)
+{
+}
+
+static inline int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+{
+	return 0;
+}
+
+#endif
+
+#endif /* __CPUIDLE_RISCV_SBI_H */

-- 
2.43.7


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
