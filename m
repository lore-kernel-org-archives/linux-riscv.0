Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1481DC83038
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 09:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5Lhj6FeLgvu9XqgXfjJxu7RBq/88wB8DVZH+d09AVeg=; b=hmYTxbq9k6HDUF
	4B9u/QOXd128IxdE2wtlYxeZ3pISmjGdmzbO/pDgKZjOPVYu3L281Auz/cGUgSUrjimoX18Crm/a8
	ljaiuRqPGm4zrmTlqiZVaiUxmIkZmd6Wreua1L7GSBY484SmQIMZ6t2qUylP+AKjUdB6GRVfcpP0G
	d578VeKDZ3IUJli8SP37p/n3lGWxPndqs9pe9YOgH2LB7Ck7ONQWXeoxs9Sl6+9NepK09M12ZCZEE
	WculPy6O4xutK+1f/8CwAXMU1pSwL4g9LIn+zCSVwr1n11/+ShuEFXcqmvLmvJVlgCx0ygjNRVb3f
	Y1IV8M+9cVHaj3kuzTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtqf-00000007mN1-1ypU;
	Wed, 02 Jul 2025 09:33:49 +0000
Received: from mail-qk1-x72c.google.com ([2607:f8b0:4864:20::72c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWtWe-00000007ipm-3YqP
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 09:13:09 +0000
Received: by mail-qk1-x72c.google.com with SMTP id af79cd13be357-7d402c901cbso602503385a.3
        for <linux-riscv@lists.infradead.org>; Wed, 02 Jul 2025 02:13:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1751447588; x=1752052388; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=KHzlGdMwQxoYI42j0/Tje1yOd002VzLUSjXq3Zpp2lQ=;
        b=ZvF0G2tMBycufxMRNFH0dI+8lZIH2KUqdHvjB0XExSAqtqT/lw11CQYBjlEd9KCSJv
         L08qNM8yie4HJTt7FgrwUHzq8G+5kePyjtnO+lpMlQDFO1jok/ym4JwkSKKoFmwduV2B
         9tIrIpY1YwDEvyqrQMtD3bJmbo7zhbXWWYgG59MTPrAZPbzewuNvOGDaxgJrYqjPWrzK
         //XVCnceYumV98FoQmu0zyamFEGmVEjzYMcraUtgTQCSI34XiIiteMNKYJ0AyHrOAAou
         JOhFd1PLk7zg2DaUMHlVrAugzWJpiDfWERKitp6P7X4Daj9HMPgVCKDZpuJLCfREBIY3
         MBNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751447588; x=1752052388;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KHzlGdMwQxoYI42j0/Tje1yOd002VzLUSjXq3Zpp2lQ=;
        b=BWjk4SAAbfVlMq0EqQpsPuu1IC2AoR6nu2YTQAE4nydqAkThlmP5rkTmkBLVeVUxKr
         9QqHIW08i3l68DzBBegeKRFGJXlIenSS8nK2N6TjOinAp+yLSKuqalvJJOXwBau25XbV
         /M9YGrjjMhw6+8l5yM6NQ4LQHBJJFeGQ6tZTZOl+jQOAiWJ1sWCbqgAJ61KSlDEaB5Rw
         tJUne/WDDi249MbE7GdU1roO3aXr+M1FxetHBtUOauqzCs1BHb/zSrMaM7bWhnqxcG3b
         U/+jGQB4qNJmSIaH+G7ENW7lI3Ib++9BNQY3VfbqAaYoYYhKt3s4Wfi4ESiUL0pffOXU
         LSPA==
X-Forwarded-Encrypted: i=1; AJvYcCUQItr0MbTiAYkj90Bxo6AByW0UO2CkBWrngWmZ/hg6uQba2QCJpRckUTb2GS4MdJ2mldGvQZzFg2zJYA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3KPOtRX7UkrNNAVTaFVM9yNHSwup40Jd3u8ZMsN3zwly5wDnV
	AQlXESOnUYx4wLXLKd/XCERmyR+u5/WWzyxPwQJoJeaCWnLNhroeyYbKC/doClZ87ME=
X-Gm-Gg: ASbGncuT7SFcaxw7g2u0lqghFCaRpUFmWORU30yXnkVDAeig+OL8GYr+vu8/XMdIaL7
	WsPGwkhLejlJiiwtcT4XB25Cooh5lv7QRj6bAwtGfCi172Ujxw3y7cmy6+0wlKCeMXMe4x2OUgU
	P1MS+KiAH06HtHg5oKCDLY0zFaa63VKj8WQnip5ZKl8QxzdiCDDKBWt5HdCwKhuftS+pA5qAPej
	A85aq83PfSBT4RDKRoXvSBJo48KL9ZwPyGicZKdRzeSW1gi1CxVFCYNMB80vZQ47ODjLjVnGXdU
	dH1D1vmr3oaPmQZi3+/Ghq/t+KP53pomnuAKJq9xrCGkfNRyQ1xk4n/ygls/jiv3gESXPyC+Hkt
	Oe0nFrc8u
X-Google-Smtp-Source: AGHT+IH35dTpRZYzuojWxWpu+46mPK8pBpHMUsqRqtbAP72WybmXXi1h3qyzhULS+BwBb0Rk/+L3YA==
X-Received: by 2002:a05:620a:27d6:b0:7d4:587e:c322 with SMTP id af79cd13be357-7d5c46a6254mr312983285a.22.1751447587687;
        Wed, 02 Jul 2025 02:13:07 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7d4431344f7sm911736285a.2.2025.07.02.02.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 02:13:07 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: conor+dt@kernel.org,
	krzk+dt@kernel.org,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Nick Hu <nick.hu@sifive.com>,
	Samuel Holland <samuel.holland@sifive.com>,
	Anup Patel <anup@brainfault.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Subject: [PATCH v3 2/3] cpuidle: riscv-sbi: Work with the external pmdomain driver
Date: Wed,  2 Jul 2025 17:12:35 +0800
Message-Id: <20250702091236.5281-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250702091236.5281-1-nick.hu@sifive.com>
References: <20250702091236.5281-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_021308_887973_B9D3BA2C 
X-CRM114-Status: GOOD (  23.28  )
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

To work with the external pmdomain driver, exposing the
`sbi_cpuidle_pd_power_off` and `sbi_dt_parse_state_node` so the external
pmdomain driver can parse the riscv idle state data and set the domain
idle state where powering off. In addition, separate the genpd init and
the idle driver init. The genpd remains functional even when the idle
state is absent.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 46 ++++++++++++++++++-----------
 drivers/cpuidle/cpuidle-riscv-sbi.h | 20 +++++++++++++
 2 files changed, 48 insertions(+), 18 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..be3949971eed 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -27,6 +27,7 @@
 #include <asm/suspend.h>
 
 #include "cpuidle.h"
+#include "cpuidle-riscv-sbi.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -43,7 +44,6 @@ struct sbi_domain_state {
 static DEFINE_PER_CPU_READ_MOSTLY(struct sbi_cpuidle_data, sbi_cpuidle_data);
 static DEFINE_PER_CPU(struct sbi_domain_state, domain_state);
 static bool sbi_cpuidle_use_osi;
-static bool sbi_cpuidle_use_cpuhp;
 static bool sbi_cpuidle_pd_allow_domain_state;
 
 static inline void sbi_set_domain_state(u32 state)
@@ -171,9 +171,6 @@ static void sbi_idle_init_cpuhp(void)
 {
 	int err;
 
-	if (!sbi_cpuidle_use_cpuhp)
-		return;
-
 	err = cpuhp_setup_state_nocalls(CPUHP_AP_CPU_PM_STARTING,
 					"cpuidle/sbi:online",
 					sbi_cpuidle_cpuhp_up,
@@ -188,7 +185,7 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
 
@@ -213,10 +210,6 @@ static int sbi_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	if (!sbi_cpuidle_use_osi)
 		return 0;
 
-	data->dev = dt_idle_attach_cpu(cpu, "sbi");
-	if (IS_ERR_OR_NULL(data->dev))
-		return PTR_ERR_OR_ZERO(data->dev);
-
 	/*
 	 * Using the deepest state for the CPU to trigger a potential selection
 	 * of a shared state for the domain, assumes the domain states are all
@@ -226,7 +219,6 @@ static int sbi_dt_cpu_init_topology(struct cpuidle_driver *drv,
 	drv->states[state_count - 1].enter = sbi_enter_domain_idle_state;
 	drv->states[state_count - 1].enter_s2idle =
 					sbi_enter_s2idle_domain_idle_state;
-	sbi_cpuidle_use_cpuhp = true;
 
 	return 0;
 }
@@ -282,7 +274,6 @@ static void sbi_cpuidle_deinit_cpu(int cpu)
 	struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
 
 	dt_idle_detach_cpu(data->dev);
-	sbi_cpuidle_use_cpuhp = false;
 }
 
 static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
@@ -325,8 +316,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 	/* Initialize idle states from DT. */
 	ret = sbi_cpuidle_dt_init_states(dev, drv, cpu, state_count);
 	if (ret) {
-		pr_err("HART%ld: failed to init idle states\n",
-		       cpuid_to_hartid_map(cpu));
+		if (ret != -EPROBE_DEFER)
+			pr_err("HART%ld: failed to init idle states\n",
+			       cpuid_to_hartid_map(cpu));
 		return ret;
 	}
 
@@ -356,7 +348,7 @@ static void sbi_cpuidle_domain_sync_state(struct device *dev)
 
 #ifdef CONFIG_DT_IDLE_GENPD
 
-static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 {
 	struct genpd_power_state *state = &pd->states[pd->state_idx];
 	u32 *pd_state;
@@ -529,6 +521,27 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 			return ret;
 	}
 
+	/* Attaching the cpu to the corresponding power domain */
+	if (sbi_cpuidle_use_osi) {
+		for_each_present_cpu(cpu) {
+			struct sbi_cpuidle_data *data = per_cpu_ptr(&sbi_cpuidle_data, cpu);
+
+			data->dev = dt_idle_attach_cpu(cpu, "sbi");
+			if (IS_ERR_OR_NULL(data->dev)) {
+				ret = PTR_ERR_OR_ZERO(data->dev);
+				if (ret != -EPROBE_DEFER)
+					pr_debug("Hart%ld: fail to attach the power domain\n",
+						 cpuid_to_hartid_map(cpu));
+
+				while (--cpu >= 0)
+					dt_idle_detach_cpu(data->dev);
+				return ret;
+			}
+		}
+		/* Setup CPU hotplut notifiers */
+		sbi_idle_init_cpuhp();
+	}
+
 	/* Initialize CPU idle driver for each present CPU */
 	for_each_present_cpu(cpu) {
 		ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
@@ -539,9 +552,6 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 		}
 	}
 
-	/* Setup CPU hotplut notifiers */
-	sbi_idle_init_cpuhp();
-
 	if (cpuidle_disabled())
 		pr_info("cpuidle is disabled\n");
 	else
@@ -556,7 +566,7 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 		cpuidle_unregister(drv);
 		sbi_cpuidle_deinit_cpu(cpu);
 	}
-
+out:
 	return ret;
 }
 
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.h b/drivers/cpuidle/cpuidle-riscv-sbi.h
new file mode 100644
index 000000000000..f39186b65a10
--- /dev/null
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.h
@@ -0,0 +1,20 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef __CPUIDLE_RISCV_SBI
+#define __CPUIDLE_RISCV_SBI
+
+#ifdef CONFIG_DT_IDLE_GENPD
+
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd);
+
+#else
+
+static inline int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+{
+	return 0;
+}
+
+#endif
+
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state);
+
+#endif
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
