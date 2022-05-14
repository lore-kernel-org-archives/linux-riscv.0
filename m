Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5A0CC433F5
	for <linux-riscv@archiver.kernel.org>; Sat, 14 May 2022 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=segXeEGMrcKSKmAH9Ntibyz2/zOGJlLdslZJw6ivZL4=; b=S60eDGk6SSAO+O
	RdV2w/Vzl6UHUttgDkjX0pF7egLbxGR1vIN1f0VRCsHN077MZ7xITCpNWdHLrX24uE5kMAdFmkOmk
	du7svkzX+Yo0xM+M2sFRb1tbNntasXrayyRu2k5Yjn+nMJcU/bbZX9lft59cy4QdT61cRYvI20N4M
	6hqNciHad3H5oSGL9dD629S37eGh3wLZuW9mcCXXS0qJFgvPNyp31xf3wLVtc3faFwYTda3P8Bng3
	FVR1ex2ex8ETcQGkjgT9J0LsairzoAi35RR1gXl7b/+vsWj/n/9RA9tBvTGIR6U3buXKGeR+sdeAX
	VpfkbLTT25qovtuT/j2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nptZg-001itu-IH; Sat, 14 May 2022 15:20:56 +0000
Received: from mail-lj1-x22e.google.com ([2a00:1450:4864:20::22e])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nptZb-001isF-9o
 for linux-riscv@lists.infradead.org; Sat, 14 May 2022 15:20:52 +0000
Received: by mail-lj1-x22e.google.com with SMTP id b32so13478627ljf.1
 for <linux-riscv@lists.infradead.org>; Sat, 14 May 2022 08:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jN8Cl5mMVbr+UVzRRSRn5vcrJAUsBCcLDo+azLgnVmQ=;
 b=ZGnFOk9hnpw6WfZAAwaIom/4T/t0E3RIw3N5rrztcNKF1+cnTHgUXQ5eAksdWhd8F8
 LL0Hp6hlh1rBhZ8SpqPVGfvIw1MIfkwUwzEuLT4zYmqW6XfwWdjbxmugBH1rWe5FqKDc
 /qih7U8rfz8MXQKbPbRmdkUNl+VZR0fZnSe8Q4oWjwleOFkxqjHQ/eJrOdyGQDvcczNR
 uGhzOiBs06Bu55Kp2793VRtPn+Ke5pCYovkRcYRg8YBg0l1vBMPZuK4oTnnzOcVgfDBl
 fNQiOTkxaUGgmBGs3YjN5kH6dZHJKibKoPXPqoxNpBYmiG4gQRpsZF3hN6DD9NrCN8f0
 YkDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=jN8Cl5mMVbr+UVzRRSRn5vcrJAUsBCcLDo+azLgnVmQ=;
 b=TL9YOKyMGZg2+Vfe6uS6T1bqv/wZDwrcNfUJBE0YTeoAD1h4PBmL/L88L7vvsqU4Aa
 jwhz/8O9FUa7za+TM8mQTxb9FOC7kO6a+5MWkt/76Fhh12RnTTDS4z6do2+80Op7owjr
 3slQSOXeSNuibuJri6XIMKpRz4A8t+5I0lFieM0NAF23WEFk+wsNubF9H2Lqkj01L0ts
 sInRaAHEAn5uEkf5hrUgSeWC4bRu9yw7al4IbYFPxsNuEWhElTAyN/UE3Ryz0v8v2zPJ
 oY//kuA7s12h21+vU2DIDgerktsvcGFpc/SxtLjaSwtUAsWwQ7fgX30e9bzCON/cDj5M
 7bNw==
X-Gm-Message-State: AOAM530nejgWwqllZPWC/EA7KRYEJHq2Koc9jKBv5/NMNe9KlEN5ZT5r
 lxbaECtMeodLO/dr1Ix48N58bg==
X-Google-Smtp-Source: ABdhPJyo0RugdTImkXnKS+tdrl2IGYQ36+s5tAYiGXLQWyQLsPLFwsaWHeGOeGJoSr0CzPerDZPL/g==
X-Received: by 2002:a2e:84c7:0:b0:24b:6842:1923 with SMTP id
 q7-20020a2e84c7000000b0024b68421923mr6306348ljh.166.1652541648677; 
 Sat, 14 May 2022 08:20:48 -0700 (PDT)
Received: from localhost.localdomain (h-98-128-181-154.NA.cust.bahnhof.se.
 [98.128.181.154]) by smtp.gmail.com with ESMTPSA id
 j18-20020ac24552000000b0047255d211d4sm734170lfm.259.2022.05.14.08.20.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 May 2022 08:20:47 -0700 (PDT)
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
Subject: [PATCH 2/2] cpuidle: riscv-sbi: Fix code to allow a genpd governor to
 be used
Date: Sat, 14 May 2022 17:20:44 +0200
Message-Id: <20220514152044.758802-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220514_082051_402209_64EEA01C 
X-CRM114-Status: GOOD (  13.90  )
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

The intent is to use a genpd governor when there are some states that needs
to be managed. Although, the current code ends up to never assign a
governor, let's fix this.

Fixes: 6abf32f1d9c50 ("cpuidle: Add RISC-V SBI CPU idle driver")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---
 drivers/cpuidle/cpuidle-riscv-sbi.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index b459eda2cd37..478970fa3b0c 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -413,7 +413,7 @@ static int sbi_pd_init(struct device_node *np)
 	struct generic_pm_domain *pd;
 	struct sbi_pd_provider *pd_provider;
 	struct dev_power_governor *pd_gov;
-	int ret = -ENOMEM, state_count = 0;
+	int ret = -ENOMEM;
 
 	pd = dt_idle_pd_alloc(np, sbi_dt_parse_state_node);
 	if (!pd)
@@ -432,7 +432,7 @@ static int sbi_pd_init(struct device_node *np)
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
