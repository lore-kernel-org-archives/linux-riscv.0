Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4012C3DA4A
	for <linux-riscv@archiver.kernel.org>; Wed, 14 Aug 2024 05:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=K60IIjJJTrNjHDziV0pIAtqAcywNLgBMGHeZHY41gRM=; b=BIEKs98qcgw/I9
	J6KZTw+WM6RezLgyyYX9jV0J1bFNyheTGWqYsBW8S3SlaXVoNn3iA57DfCv/lnbTRe8uk9m583TEF
	Yl59ZLql8VyxLEq/MYgo1lvhxpEGirjTuOiLtKZJ9sS7FbvLbwZvxCPCmqranRQD/sQlaSoMmMHgv
	gUXZOC0jzFMA7efwIslJ+pGClvJmw7BRh1+5m7iU7npmoEP0Ic+Pk/F/28knfvgvQQjWksPP+01Et
	4RwInuB+2b79EikpryICbMeBpCTdtYkEgB6OEsjHZjPBh7O5lEoNkN3P9AXm7mCkXqPa+46F1+bcE
	4PUMfzgA32XrJz1JcYng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oW-00000005ppd-0uxX;
	Wed, 14 Aug 2024 05:44:52 +0000
Received: from mail-pg1-x52f.google.com ([2607:f8b0:4864:20::52f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1se6oT-00000005poj-1tZX
	for linux-riscv@lists.infradead.org;
	Wed, 14 Aug 2024 05:44:50 +0000
Received: by mail-pg1-x52f.google.com with SMTP id 41be03b00d2f7-7a263f6439eso3939429a12.3
        for <linux-riscv@lists.infradead.org>; Tue, 13 Aug 2024 22:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1723614288; x=1724219088; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ALi80qQywvgRdU6+eXIGrdG4mei/lQM5/cjgvbw3p6w=;
        b=W4Al6qUlPZDmMY420nmcAI+miYxO7ysYNpAeBgPX0L+51Lx2lHTpauASQ+WgLZnHnk
         zF/luoDgskdQg00QJreS5OH8rS5uuOH6fQ80Dmz5n2/+fGcm3G1yvsu/x6EfUA1F3uNm
         +Cr/dcuY/4H39aV5UdCSjwTbJGZoewrvps7HlFEG03nA2NnuxVRkc2DOLxjqCkHO39PZ
         Orx2z6qGDtGyyBqn72BrSkOPDxyuFqxvw9/GoD5SA0xE9c0V7yPxrx0MNDuxbmIBCi4U
         gg0K7WpUVKVm+SlYi+PzqgtfNtKpyYCEbiFvSrEu3d0YayVZw7bd92zX2kDoSBwg5Jed
         5k0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723614288; x=1724219088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALi80qQywvgRdU6+eXIGrdG4mei/lQM5/cjgvbw3p6w=;
        b=Majy/aH+oS5C1osFxACwqqtwqutr3VgmZeJEL+P1PHGrJST9+Uxg7Qhu2G5XWJwTFp
         UiEYXt7s/EbNbv5Z39ApP7PvrvvQJ/wFXOb/JCUXXZgTyFhQSsqHfrOfnPiW5pu+LseD
         vjM23bmyvMwDsfOnT13YyhwW/5E/i+xVC9Asw5AL79vP1ta86D+McRL2y511pibNzSjj
         ifA0BUEozrzxWcHi3o2IkX+HswjmIPlqKm528T/zLksl2/D6yql/Tmdj3xFExi362yLn
         S5bdadarl23GBzVzG7qESE0hbCZdXXDgi0ffkHdp9c/uP07t4bTq/w2LT0ugLaGEyfuf
         v5Sw==
X-Forwarded-Encrypted: i=1; AJvYcCXq+5j3xLeFqa/xU8DFmXhd7ohLMcbWeDmWgKSLnHO6gdb9WCD69dYaEDSwD0x1PHNF0I6ByGyWGeKB2h5JDvm6BIL4GKuDsPYqVdl8YlM7
X-Gm-Message-State: AOJu0YxUcWUJXZ9bzRbY0DDiBVdh/IRpGKmwgB98HIIhjCEJHljoHZgP
	7EdFKvuZm/qYG6oZN+PT71xU1fYi259wR63go48QE4TZIkhxweOmJHy81k5b3rw=
X-Google-Smtp-Source: AGHT+IGdGbklP55z7Stx4FlDdzAVCAAfA6mUFaLw7+5KDYOKNc1xThXBt1NMzPRtP1UnIPwA1wPDcg==
X-Received: by 2002:a05:6a21:398:b0:1c2:94ad:1c67 with SMTP id adf61e73a8af0-1c8eaed5ed2mr2299929637.30.1723614288396;
        Tue, 13 Aug 2024 22:44:48 -0700 (PDT)
Received: from hsinchu35-syssw01.internal.sifive.com (59-124-168-89.hinet-ip.hinet.net. [59.124.168.89])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-201cd1ab486sm22062085ad.150.2024.08.13.22.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Aug 2024 22:44:48 -0700 (PDT)
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
Cc: Nick Hu <nick.hu@sifive.com>
Subject: [PATCH v2 2/2] cpuidle: riscv-sbi: Add cpuidle_disabled() check
Date: Wed, 14 Aug 2024 13:44:34 +0800
Message-Id: <20240814054434.3563453-3-nick.hu@sifive.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240814054434.3563453-1-nick.hu@sifive.com>
References: <20240814054434.3563453-1-nick.hu@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240813_224449_514292_C8E6979E 
X-CRM114-Status: GOOD (  13.25  )
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

The consumer devices that inside the cpu/cluster power domain may register
the genpd notifier where their power domains point to the pd nodes under
'/cpus/power-domains'. If the cpuidle.off==1, the genpd notifier will fail
due to sbi_cpuidle_pd_allow_domain_state is not set. We also need the
sbi_cpuidle_cpuhp_up/down to invoke the callbacks. Therefore adding a
cpuidle_disabled() check before cpuidle_register() to address the issue.

Signed-off-by: Nick Hu <nick.hu@sifive.com>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index 98e7751dbfe8..3c8a509288f3 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -25,6 +25,7 @@
 #include <asm/smp.h>
 #include <asm/suspend.h>
 
+#include "cpuidle.h"
 #include "dt_idle_states.h"
 #include "dt_idle_genpd.h"
 
@@ -336,6 +337,9 @@ static int sbi_cpuidle_init_cpu(struct device *dev, int cpu)
 		return ret;
 	}
 
+	if (cpuidle_disabled())
+		return 0;
+
 	ret = cpuidle_register(drv, NULL);
 	if (ret)
 		goto deinit;
@@ -548,7 +552,10 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	/* Setup CPU hotplut notifiers */
 	sbi_idle_init_cpuhp();
 
-	pr_info("idle driver registered for all CPUs\n");
+	if (cpuidle_disabled())
+		pr_info("cpuidle is disabled\n");
+	else
+		pr_info("idle driver registered for all CPUs\n");
 
 	return 0;
 
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
