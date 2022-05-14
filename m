Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C644DC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 15:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4ddauxx1lX32KpTjoqcp1c7sDByodsuUFvbaDcl1CPw=; b=3MXWc7H7L52sKg
	mIQTIaCbVwUZsqxCzB1W3jKqpczHuxo5PbWbLuQfqELJW+eWOgpGe+hW/VjTOYAyv/GjDanaFL+VD
	cKuT3MF5jKnN/IiwxxFIDFCgbZk04+6zmp5jJVXeroqDkP3JXdqlgzwlWKD9eCI5MrgNuTXPch1PJ
	bxdw69MFfWXWN2YMqHnhfgDv0FhJNMDWESdz8KdtPsEUxZrgP0z+GsJFkExioDCZVTyT6+20syeez
	i8RdVyKbcbbpM9QXSLHNsU37Fcop+zWIcSI1O/0tJwahSISosAgbsQpdNGhTaEVQOnFgVq4cWLjyX
	wqZ5s95Sy1UB6dygy6hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nptZf-001itP-2H; Sat, 14 May 2022 15:20:55 +0000
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nptZT-001iqu-Qd
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 15:20:45 +0000
Received: by mail-lf1-x12a.google.com with SMTP id i10so19066825lfg.13
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 08:20:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgEQZGj7XdPzKpml1xZjmFHRxmKWGvcEYL2lJUBaVsU=;
 b=m4skFe/fjMkgPeZRXHRT7lmXSxKYhwE0VfUTRb6cHXLVXCDTZt5kYDzRQN4cIad6Nx
 +FrVOkwHES6FDU42vMw/5rykZLePnGTUoeBjEXJhQVZj9Qayk2t1n9YpZg96DuECzAME
 RWTlrtbZOW5GSCumUcHWt8Vgpok46Zj7DOMqdhszEG96AbuK+JjKEn44NbI9ZV/v8eMJ
 oHVzLswLqY3uTDBt8WWlevlNynqtJwst1Utjvj5kO8EQz115KPb2lymke80pTSum56iq
 yTXeFxnJ4UcTJsWXwiHotDVDytOGWrJsF4W8vUSNznvd98uO07FIN8XePxzJBGDYh7Ng
 ZSTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=vgEQZGj7XdPzKpml1xZjmFHRxmKWGvcEYL2lJUBaVsU=;
 b=mtE8ebHlZU3lVlbfF5SffXetBDbADPliI1A4z6GkEDNGAwsN0XS32kY/kL3Roydbmr
 Da8fcWh1wVHe+K98x7mXfCuVlmHJpEfd/FqfWTPHuafeQV/HI67IVeaXhSLuI+Crubz7
 UThogU06zY2YwZfxHK8TVZKdG11xxoteCak9LPLchBcecQf1N+WkgZqyvmuTMXmf8a2V
 Pv+O+AyZKnXV2zYCEOEQYirJj1U0PJRLsf6m1v1Ly+IP8LYxX4kRNmwdB2WuDGLHmDJf
 1UGBBQPrrNOYBNhARPDiM3FpZleHKJ/lxcmAJjS8jBF01oFYYaD+oUEV7DH/DeDtusXH
 ZFVA==
X-Gm-Message-State: AOAM531rZMKU16kYo5SkP4rKOLj49Y7Dn4kNoEQwwSAnMNyGJNSlJQry
 plJa8oRZUkBoE7HFVPV6jjzeRw==
X-Google-Smtp-Source: ABdhPJzzPOWb8YcOcXdI0jUpKc7cMAmRKte6m/hGPjpztOpdV6al6mOvoJFC7cx2XnwypmlVC4xSzg==
X-Received: by 2002:a05:6512:553:b0:472:205b:97ba with SMTP id
 h19-20020a056512055300b00472205b97bamr7001418lfl.314.1652541640290; 
 Sat, 14 May 2022 08:20:40 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-181-154.NA.cust.bahnhof.se.
 [98.128.181.154]) by smtp.gmail.com with ESMTPSA id
 q18-20020a2e9152000000b0024f3d1daee5sm830413ljg.109.2022.05.14.08.20.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:20:39 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, Anup Patel <anup@brainfault.org>,
 linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <Lorenzo.Pieralisi@arm.com>,
 Maulik Shah <quic_mkshah@quicinc.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Atish Patra <atishp@rivosinc.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] cpuidle: psci: Fix regression leading to no genpd governor
Date: Sat, 14 May 2022 17:20:32 +0200
Message-Id: <20220514152032.758738-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_082043_890277_725E51C9 
X-CRM114-Status: GOOD (  11.96  )
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

While factoring out the PM domain related code from PSCI domain driver into
a set of library functions, a regression when initializing the genpds got
introduced. More precisely, we fail to assign a genpd governor, so let's
fix this.

Fixes: 9d976d6721df ("cpuidle: Factor-out power domain related code from PSCI domain driver")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 755bbdfc5b82..3db4fca1172b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -52,7 +52,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 	struct generic_pm_domain *pd;
 	struct psci_pd_provider *pd_provider;
 	struct dev_power_governor *pd_gov;
-	int ret = -ENOMEM, state_count = 0;
+	int ret = -ENOMEM;
 
 	pd = dt_idle_pd_alloc(np, psci_dt_parse_state_node);
 	if (!pd)
@@ -71,7 +71,7 @@ static int psci_pd_init(struct device_node *np, bool use_osi)
 		pd->flags |= GENPD_FLAG_ALWAYS_ON;
 
 	/* Use governor for CPU PM domains if it has some states to manage. */
-	pd_gov = state_count > 0 ? &pm_domain_cpu_gov : NULL;
+	pd_gov = pd->states ? &pm_domain_cpu_gov : NULL;
 
 	ret = pm_genpd_init(pd, pd_gov, false);
 	if (ret)
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
