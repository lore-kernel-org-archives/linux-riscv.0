Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E09BC3DA4A
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Aug 2024 15:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kk006x1lSGgPVkf1N7wD/490C6uhzyHz0WF4+fDguIk=; b=mNbgf1wO4rgiAi
	8nZHeGgSoZNqQZliut9UgKWsu4qqT+q85O07COovp+GD7sSjdqNdFCyBHP1VYCps6nrLoHK/h62to
	5CJxZ1LxP8WwVQAWk1+t5CcNhxAXJGDicDXjNwPHemFgvWAjMUlqvkl1ir9C+uZqzrXYmM+zjJVEK
	e6/tFwy5Ii7u6Dwp0AFct4mAjXMA1K7YlOmBLkNO5M/pm4m7dzQ5xVvuaVL0TSiwV404RZOVTrY5W
	m240zhNgVKF6bax1pAEHnsXGFEL7YpdMcnH+YDATqaIgAO8fsaJq1Z5jep8kTvhuCgSyfkoCVFGRb
	2kvy3aesHA4xn9cQU57Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seyb7-0000000DKN2-3R2A;
	Fri, 16 Aug 2024 15:10:37 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seya9-0000000DK5d-2K8t
	for linux-riscv@lists.infradead.org;
	Fri, 16 Aug 2024 15:09:38 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-429c4a4c6a8so15556555e9.0
        for <linux-riscv@lists.infradead.org>; Fri, 16 Aug 2024 08:09:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1723820975; x=1724425775; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=q0sK0ufc7qEbd/mn2fdq4hcobz3MRQ2PN+HK1BuFHRw=;
        b=HwgTQNFTjjprQHEdW+d7wIFDTOP2IkgXFE6kvf5rk2JAbPulL9GaS858kmmfFS6k1A
         0/C5sGC2wujv3H9qVpta5SrymbDckXXmQ0FVxMparxad1DgsdIyasJGmvLZlH4wFzzzV
         9AYyy9bCELWmZvB7uAH3Cl02h0xuhc2tkwGIkKKBuBEBU459lbcCGcG6JEJqW1Iet5ne
         rjl0KoTk26FdqZU+JegTP/P7Nzmu2PlZbVAR5mymjirMVwxL1LYmfQj0FdghPuS7SjaT
         dBotEQIh0e1wnufmrXbAVtH0RPvBvdj+PSfiNQVgbSeuQkeHnroY6aoGedNHFHY6ukpA
         yLzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1723820975; x=1724425775;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0sK0ufc7qEbd/mn2fdq4hcobz3MRQ2PN+HK1BuFHRw=;
        b=BU+1A01wxTbEiFoMDpHzjbMro6hFqv1DQ6B7Z2UTjDdSVrn9m9yGK6+UMuPPgeid+k
         hZsjURIQ2+SvPfaQ8MP4WDJJoFveintuGc1u/q3kR3BnGTcqYORpjBOC5uBaW29HlL+D
         6uAxpqSjTioPRu133DkGzGc7atcHpFxE73JZoHXdGEvEjIT0Z/N45ByDjBel9YanJyyw
         rd6ffVdqCMyhFrklgRP9HWBtCrhJbtUNkCNZ6Kxm0UUMkSGMvYP4tzEfU5LhqqrFeWp3
         dOF11R+sayWUKRQdF17vs75TprICFxuO+S+gcsJCOR07df76SSAr9KFvDoRF+QjVlt78
         hsGA==
X-Forwarded-Encrypted: i=1; AJvYcCVNjtIef+kO/jGCmNk+64VxNZdAalNINHAjMCwgsfG1RoN/nIHDsDVdt/YJw0L6gGTbV6jtXI1BVMY+igNbNncn4cLUANpW+dWh/Dd7aFT3
X-Gm-Message-State: AOJu0YzboDDK7rOHwvFT3bVqhYkgxfV2MMdZBY9SDPag3bFEbMAIjYwG
	JjHfV4eQCNk8KSrqgNr2rpNSyWFumxhNsHsmSDNB65CwYAuOd9iAyShGdWXQBvw=
X-Google-Smtp-Source: AGHT+IFhP/NIsW9PWfnEcWLqi7chpg87KWhwfD8tKVYrnOj6sJddsAiBh6dq11WCBuqo717hp+HeUw==
X-Received: by 2002:a05:600c:444b:b0:426:6320:7ddf with SMTP id 5b1f17b1804b1-429ed7f944bmr19485875e9.35.1723820975298;
        Fri, 16 Aug 2024 08:09:35 -0700 (PDT)
Received: from krzk-bin.. ([178.197.215.209])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3718984993fsm3808758f8f.31.2024.08.16.08.09.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Aug 2024 08:09:34 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Ulf Hansson <ulf.hansson@linaro.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Anup Patel <anup@brainfault.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-pm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH 1/4] cpuidle: psci: Simplify with scoped for each OF child loop
Date: Fri, 16 Aug 2024 17:09:28 +0200
Message-ID: <20240816150931.142208-1-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240816_080937_598547_302DCBC6 
X-CRM114-Status: GOOD (  12.78  )
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

Use scoped for_each_child_of_node_scoped() when iterating over device
nodes to make code a bit simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index ea28b73ef3fb..146f97068022 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -142,7 +142,6 @@ static const struct of_device_id psci_of_match[] = {
 static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
-	struct device_node *node;
 	bool use_osi = psci_has_osi_support();
 	int ret = 0, pd_count = 0;
 
@@ -153,15 +152,13 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	 * Parse child nodes for the "#power-domain-cells" property and
 	 * initialize a genpd/genpd-of-provider pair when it's found.
 	 */
-	for_each_child_of_node(np, node) {
+	for_each_child_of_node_scoped(np, node) {
 		if (!of_property_present(node, "#power-domain-cells"))
 			continue;
 
 		ret = psci_pd_init(node, use_osi);
-		if (ret) {
-			of_node_put(node);
+		if (ret)
 			goto exit;
-		}
 
 		pd_count++;
 	}
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
