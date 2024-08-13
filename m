Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B51C52D7B
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Aug 2024 08:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hAKYzKo0BlTWRJK+8rxIfNamfeBCicdY8EWgezw4E0o=; b=p1Cv5h+AAD/pNz
	LxM0h6BAf+AfI0RC/tik6kJGzzXKHKTIP+7adM25tttATvaBfBORKq2KzWgfAc4Vn3lAheSJwTpiP
	hKxoSm6bY5ygQLE6pIrAvnb9O59pC9P8gkX9yHQ/LvMOtB9X5r1Dfz0gkgKf7ntRpJk2Jzzq9EmUu
	RQ5N+ypK9FaxRaE8hthU3xmrXHHq6qPlmCFX9ljoE71QxChWn0cjucoFU5DSWdvOLcbZW2B/LtOpu
	24cMIubF5yfszuJoQvlOsBhW6R8263Ky9nm0JymAJtDKeOjRZFTGu5C6SiPpFeq+F7U3tH71+7Eg9
	KywCUvRsbypOJetUrT9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmf0-00000002qmF-0llc;
	Tue, 13 Aug 2024 08:13:42 +0000
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sdmep-00000002qke-17MO
	for linux-riscv@lists.infradead.org;
	Tue, 13 Aug 2024 08:13:32 +0000
Received: by mail-pg1-x536.google.com with SMTP id 41be03b00d2f7-7a0b2924e52so2557996a12.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 01:13:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723536810; x=1724141610; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MPwCQlZV6XnO0rlNbX/WsNAZ1kHHhsOKatz4Qfacl5c=;
        b=Ms+JdZ0aIcomdg0s5F/xY62B2dE7jCTyMgtgKL1MvkdLBJDUjVwoWpuj+myWA7xw5w
         +x+iO02OFZMJdxQ9oCNAHZiTjDfGXB9CJDCwOCopN06tskI1eSNBiEMbnvbgA5U+qx4I
         rkExWEzH3W6sa65BUdtZ1jY3bbAqh12JbowIFFzP2+fI1KHWZl31xMVXXt3r+0zO2EnL
         F1lRGKH10hCr11f1PiWZkJ1wFhF2rhSmahmipV2/m4ZI/4wpXyh/EUH19MkwQpYxC8QV
         /njQ3sDhh38jtgqBVQz2tEnBl8QNrkVLMMmdL4wsTm5bkk8s1PAAM9ATL3+SpPK5MZzl
         CB9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723536810; x=1724141610;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MPwCQlZV6XnO0rlNbX/WsNAZ1kHHhsOKatz4Qfacl5c=;
        b=CovxaOSqzNmbpxtTmOnTOIr0UydIwxD0aRIRq6j29zNp1evr+GKFWjsLYQvS6W9fuq
         0AhTX4/9oUllTRWOqVwIxSPHqub9o67Rleoyf9VjPo9AMw+vL1Jbkp2R/XJzdVW11FaS
         1ycnVyIUcOMTi0DYNS+YV+FHJcS9Tj3XzB9qz1ImmVbXT8Zc51lYzmmBHr/pcOELKDoq
         E9XqtyQNKu0fmAWyi18RxXqEjXd4N9Mamp+2r4ATW+lDNtcdyouSXiEgGDEdJyu08lR1
         9FVtQzB9NK2lP7OjzfhY/kWE7KRQTXy8Bva82679mDYp29EIjZmT6BYRqxlLHST6wLhR
         vVsA==
X-Forwarded-Encrypted: i=1; AJvYcCWnLFUebooqE5JmSuBAed8QEa0O+DZoU0/euJsD6QjuB91j2uS6ARSme6HbecTjlvqPADCoEIRRrCUpvv11jovPYnOKz3soPXtenH8Xn+yR
X-Gm-Message-State: AOJu0YxG0JvqWWABYt8Rs8G4padJqEJSFHNy2AM4PMro5PtoTakQ9Dl3
	Li2qtLHcpAHb5AhpJwlB4jqAZoW8Gw2QaUqSyKt/rgYMGfWh0Aq1bS1QyZBKbOw=
X-Google-Smtp-Source: AGHT+IFGyOzsELsbEN5dq5CT9Zf/5PMWDUy7RodzkZu3Mk7cSMnkmo/3cHgdPDhbNHigLjznXjqnXw==
X-Received: by 2002:a17:902:d487:b0:1ff:39d7:a1b0 with SMTP id d9443c01a7336-201ca1ca41bmr30756345ad.50.1723536809857;
        Tue, 13 Aug 2024 01:13:29 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1e29afsm8289885ad.309.2024.08.13.01.13.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 01:13:29 -0700 (PDT)
From: Nick Hu <nick.hu@sifive.com>
To: anup@brainfault.org,
	rafael@kernel.org,
	daniel.lezcano@linaro.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	greentime.hu@sifive.com,
	zong.li@sifive.com
Cc: Nick Hu <nick.hu@sifive.com>,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH] cpuidle: riscv-sbi: Allow cpuidle pd used by other devices
Date: Tue, 13 Aug 2024 16:13:24 +0800
Message-Id: <20240813081324.3205944-1-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_011331_345897_FE09EC16 
X-CRM114-Status: GOOD (  16.81  )
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

To prevent the probe of consumer devices being deferred, create the
platform devices for each pd node under '/cpus/power-domains' and move the
driver initailization to the arch_initcall.
The consumer devices that inside the cpu/cluster power domain may register
the genpd notifier where their power domains are point to the pd nodes
under '/cpus/power-domains'. If the cpuidle.off==1, the genpd notifier
will fail due to sbi_cpuidle_pd_allow_domain_state is not set. We also
need the sbi_cpuidle_cpuhp_up/down to invoke the callbacks. Therefore,
add a cpuidle_disabled() check before registering the cpuidle driver to
address the issue.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
Link: https://lore.kernel.org/lkml/20240226065113.1690534-1-nick.hu@sifive.com/
Suggested-by: Anup Patel <apatel@ventanamicro.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index a6e123dfe394..d6b01fc64f94 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -16,6 +16,7 @@
 #include <linux/kernel.h>
 #include <linux/module.h>
 #include <linux/of.h>
+#include <linux/of_platform.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
@@ -25,6 +26,7 @@
 #include <asm/smp.h>
 #include <asm/suspend.h>
 
+#include "cpuidle.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -336,6 +338,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 		return ret;
 	}
 
+	if (cpuidle_disabled())
+		return 0;
+
 	ret = cpuidle_register(drv, NULL);
 	if (ret)
 		goto deinit;
@@ -380,20 +385,26 @@ static int sbi_cpuidle_pd_power_off(struct generic_pm_domain *pd)
 struct sbi_pd_provider {
 	struct list_head link;
 	struct device_node *node;
+	struct platform_device *pdev;
 };
 
 static LIST_HEAD(sbi_pd_providers);
 
 static int sbi_pd_init(struct device_node *np)
 {
+	struct platform_device *pdev;
 	struct generic_pm_domain *pd;
 	struct sbi_pd_provider *pd_provider;
 	struct dev_power_governor *pd_gov;
 	int ret = -ENOMEM;
 
+	pdev = of_platform_device_create(np, np->name, NULL);
+	if (!pdev)
+		goto out;
+
 	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
 	if (!pd)
-		goto out;
+		goto free_pdev;
 
 	pd_provider = kzalloc(sizeof(*pd_provider), GFP_KERNEL);
 	if (!pd_provider)
@@ -419,6 +430,7 @@ static int sbi_pd_init(struct device_node *np)
 		goto remove_pd;
 
 	pd_provider->node = of_node_get(np);
+	pd_provider->pdev = pdev;
 	list_add(&pd_provider->link, &sbi_pd_providers);
 
 	pr_debug("init PM domain %s\n", pd->name);
@@ -430,6 +442,8 @@ static int sbi_pd_init(struct device_node *np)
 	kfree(pd_provider);
 free_pd:
 	dt_idle_pd_free(pd);
+free_pdev:
+	of_platform_device_destroy(&pdev->dev, NULL);
 out:
 	pr_err("failed to init PM domain ret=%d %pOF\n", ret, np);
 	return ret;
@@ -447,6 +461,7 @@ static void sbi_pd_remove(void)
 		if (!IS_ERR(genpd))
 			kfree(genpd);
 
+		of_platform_device_destroy(&pd_provider->pdev->dev, NULL);
 		of_node_put(pd_provider->node);
 		list_del(&pd_provider->link);
 		kfree(pd_provider);
@@ -548,7 +563,10 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	/* Setup CPU hotplut notifiers */
 	sbi_idle_init_cpuhp();
 
-	pr_info("idle driver registered for all CPUs\n");
+	if (cpuidle_disabled())
+		pr_info("cpuidle is disabled\n");
+	else
+		pr_info("idle driver registered for all CPUs\n");
 
 	return 0;
 
@@ -592,4 +610,4 @@ static int __init sbi_cpuidle_init(void)
 
 	return 0;
 }
-device_initcall(sbi_cpuidle_init);
+arch_initcall(sbi_cpuidle_init);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
