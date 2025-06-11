Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D68C677C4
	for <linux-riscv@archiver.kernel.org>; Wed, 11 Jun 2025 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Bpbup5Q1L7udyBw/FsWb5l2+kxRLWq4x6sn+MXNU/C8=; b=Akh75/GlZm1Y9T
	myfaPG0NCpI+GjK3HP817zHxxG6a2cOJC6KvT9Zbj60yQQ1Hw/y/GHyQaN0MumUxIdPHulGju6QoG
	c6VpLswWxni7eOcmOwzn4G3s1W00z+BZufXUgVBX1pc7ObcxjjAuoYTpC8sKHTU3Y5BbIOrWPH5U/
	zXN7uU2DKE+gDye9LHfqhZV/nRo3Ed7gmhj4Y58aJyJ9RmagFUSb0CzGnjXZ9eSMHzzrmcjhQjpaZ
	6B0q2RwKi0B7RulKVBkea5rK45Oei/N7IZ+VNdgkxxwD+v2XcjDd25XKYPv1uklIGQ5z2Dn5KK+pm
	JjBJTNfSH+uVN6WKrqow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrV-00000008ie5-108w;
	Wed, 11 Jun 2025 03:10:49 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPBrT-00000008idG-0yTt
	for linux-riscv@lists.infradead.org;
	Wed, 11 Jun 2025 03:10:48 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-234d366e5f2so70039665ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 10 Jun 2025 20:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1749611446; x=1750216246; darn=lists.infradead.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=d1JqEGYxVH+Ie0t+M4xdy6Q//NYQPkO37iVKF4LgSqk=;
        b=Lnsu4PW5khBGAgd3Bp1JEq46m+gyKp51U3sJkSs1tp/+wyO7IEO+AemRX4LTkXzT6a
         /h8S3h/T5J+2porNyWee702lPYVNEfqTPi/IJ+t76ohNqEeSlPIE8TNuX3bOJybZy63g
         fuGzj+THW3o595Y6ow5iwKYtBfWqkmMVerpsmgGVAH0cA/s6HKLwAFvOlSe18fSjvTav
         cB6ORNvS1wXoOiwbXoViyRxfAA7pFvnqhwCISBPNk4OWxImqx/QnXzena7sBXGODqDq9
         d/tz5n6SyPYDoP3Ed2BV9P6TVG4wP+6q6uk35ZqVsG0sXQdzf0RSaPkKJh/YJnkyNoAG
         5nrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749611446; x=1750216246;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=d1JqEGYxVH+Ie0t+M4xdy6Q//NYQPkO37iVKF4LgSqk=;
        b=UyAQ/HWlF4sa1zmbasYYhmdfYjlRG3s2pgeoWc7l64nVty++R1/d+uHb0Xa76Kc++7
         NVuEqmWmm1keBj5/lGUw8RG8u2ij0ZbP2Go6Po9qgFZK6G03tNIfW6ADuJVP8vGoBCrz
         RE6TjpWXG+SjLYLMf/JqpRU+YBaKc1+0xm76itIFrRBvdN0giWYuSaa+MU910gOAXkTk
         Af5f2QhD36Cu3dddZiTiDmLfV2Di6E1Qzaqu1+a069j7A7gBzFAdgO6V4U+Lql6rjx/F
         x6AJyOssaAqpvGaQiHtOc18v6w6pIgWLXTcQN1Bm0U6FHk71SX9Aq43EUmLYmcDsK7yo
         eDjA==
X-Forwarded-Encrypted: i=1; AJvYcCXUm8/X0QusJLn7LN27rG6bfW+nabcrNRG2x6ffaWrP2XNL++z6UgIDtdJIH0422UJ2jBNTz7R/QlSxpw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyF06yGR33U3GhnRJwhV9Xz0cFqkb953JQghgqTr7SKK6wbFWTM
	+LMe2lVTfhg3hWGaR6R93YU0TSoNqUGIibzNSt/1py2h7VXFLIDVUtV2C3/K8vup4L0=
X-Gm-Gg: ASbGncvYGivPpiwU9suzagLR3b8PIp1o5oLDkQRbXh9f15BCFJli5CahonyEMf0yPNs
	I3o7Aw12m3UUkU6K4DY6YGX7jLAsYybx8jqRS0fMi3zqzkOSbbB16zeqtO/DY2XMj55rff+kLfU
	D8jACQ2UpHCFB4LczPNfFs3vTyMeWcJR9A68mKLwQGYa87L8R5QLjk8qQSHt5lVvTrzBHCFs7Ul
	96n1YfUtmCjAuMmh9tKAIPSS09vvBV39UlvTd2EfZh4PvPYpTE1cJH2Qg11uquINH0NOjlNkeOa
	KV9ewZdBuxtgsvAKiguptXeHrSZGBmXNI7w1W6OGB3d/TlwW9iLq9aXqwMhb/5o8IsX1U7+MHYX
	9YkNEsa4Yo97+MoZLxpo=
X-Google-Smtp-Source: AGHT+IG0HUndhOWNBFfl4fKV1QgjHGpPPezok587Gqjk8idox7vCs0ZKIJPZwB64MsRnAjYqekYvnA==
X-Received: by 2002:a17:903:2390:b0:234:e7aa:5d9b with SMTP id d9443c01a7336-23641ab511amr21843485ad.23.1749611446469;
        Tue, 10 Jun 2025 20:10:46 -0700 (PDT)
Received: from hsinchu26.internal.sifive.com ([210.176.154.34])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-236030789c2sm77669035ad.29.2025.06.10.20.10.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:10:46 -0700 (PDT)
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
Subject: [PATCH v2 2/3] cpuidle: riscv-sbi: Work with the external pmdomain driver
Date: Wed, 11 Jun 2025 11:10:21 +0800
Message-Id: <20250611031023.28769-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20250611031023.28769-1-nick.hu@sifive.com>
References: <20250611031023.28769-1-nick.hu@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_201047_281018_39082E8A 
X-CRM114-Status: GOOD (  17.19  )
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
idle state where powering off. In addition, defer the driver without
error message when the parent domain is not ready.

Co-developed-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 17 +++++++++++------
 drivers/cpuidle/cpuidle-riscv-sbi.h | 20 ++++++++++++++++++++
 2 files changed, 31 insertions(+), 6 deletions(-)
 create mode 100644 drivers/cpuidle/cpuidle-riscv-sbi.h

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 0fe1ece9fbdc..d53254601522 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -27,6 +27,7 @@
 #include <asm/suspend.h>
 
 #include "cpuidle.h"
+#include "cpuidle-riscv-sbi.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -188,7 +189,7 @@ static const struct of_device_id sbi_cpuidle_state_match[] = {
 	{ },
 };
 
-static int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
+int sbi_dt_parse_state_node(struct device_node *np, u32 *state)
 {
 	int err = of_property_read_u32(np, "riscv,sbi-suspend-param", state);
 
@@ -325,8 +326,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
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
 
@@ -356,7 +358,7 @@ static void sbi_cpuidle_domain_sync_state(struct device *dev)
 
 #ifdef CONFIG_DT_IDLE_GENPD
 
-static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
+int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 {
 	struct genpd_power_state *state = &pd->states[pd->state_idx];
 	u32 *pd_state;
@@ -533,8 +535,11 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	for_each_present_cpu(cpu) {
 		ret = sbi_cpuidle_init_cpu(&pdev->dev, cpu);
 		if (ret) {
-			pr_debug("HART%ld: idle driver init failed\n",
-				 cpuid_to_hartid_map(cpu));
+			if (ret == -EPROBE_DEFER)
+				pr_debug("idle driver probe deferred\n");
+			else
+				pr_debug("HART%ld: idle driver init failed\n",
+					 cpuid_to_hartid_map(cpu));
 			goto out_fail;
 		}
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
