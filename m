Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D026FC6FA99
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 16:03:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qgTvURhQsQW/Qb0dsCPCwgL1PptC4iDRwlFyyJCY11g=; b=d4yDP+CPFn7Md9
	j0KIK9uigLbVgI815jo4YneRaFWp+yR233fv7TuxWZsPcD4TtL5iSZTnfkwDM78OqGsReTfKJ60x5
	fxaRX5XKxM92Ss5FfrVvWIoIpTmHesePTKM6DMJ2SVnGNpmpzaablNbim+P45F17VUlPVuKpNmciY
	FL58NyM6cZ4Gv0RM8KTD+nRlo7dYsU3Z+6Sy9ub224ctnfMv1luYoXJHqCYymKyy5pwDFRR4HmeQK
	xrVWAtsMLzk9QkFHht7voTMyA0tQFqqGLm0RM9xgm7NCH/ikERxITozchjcNmpkTmeH918AW+f2oA
	1EM50QRXB5Sh0vjGfE9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pafCx-00FAqZ-R7; Fri, 10 Mar 2023 16:03:03 +0000
Received: from mail-oa1-f43.google.com ([209.85.160.43])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pae22-00Emay-Ia; Fri, 10 Mar 2023 14:47:43 +0000
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-17671fb717cso6050541fac.8;
        Fri, 10 Mar 2023 06:47:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678459662;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2woDhUU8segjfXUK8bCKWWkxeooki4Tiioxihb29omI=;
        b=xa87aMAWK0QVM+016h8Vnm1qweSS8Of2WF9W5d3A2Jau21DzzC4o6al2vZLYGQKqI3
         KxeIKsar+nnQa/j7vEoZ3+hrLh3dIytyXzEPgHU472PlDXdvynXJfKLaLxm+a3j/uTrY
         +qcjW2x0eFuOdlM62BA8CZ6hQTy/0+sHnUCWX0JekNbh0YK5ZF/NZ+IZDnOLvCAMCI44
         pAWz07PBENAIbe47dZ2CYJHO1fcOjtkMPYudVQYakzwGBBs1pav0v5WpNSQCZdGptOI8
         LVYB6OFBvGMw9Hiq+NzEVl57W2R1sn7NkRYGNT/+fDGYvbT3/4fD8Cts8zJvtwKG+KgH
         DT0w==
X-Gm-Message-State: AO0yUKVUagbauWtFBZIfNs5PZ5OXM4zGjf5ZxDss7Ib1c1SRIqba8YAq
	iqKuRNOnp/mC9Hev1ZR1/w==
X-Google-Smtp-Source: AK7set8U4wjqUrryELYfSJxMuPVOOd0KXhYQxIgamWtZOI+6GdKcXJrh5sheP103x03+JPriAbk29w==
X-Received: by 2002:a05:6870:b14d:b0:172:80f9:a545 with SMTP id a13-20020a056870b14d00b0017280f9a545mr4220778oal.25.1678459662131;
        Fri, 10 Mar 2023 06:47:42 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id y20-20020a056870429400b00172428894e0sm95296oah.28.2023.03.10.06.47.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Mar 2023 06:47:41 -0800 (PST)
Received: (nullmailer pid 1541915 invoked by uid 1000);
	Fri, 10 Mar 2023 14:47:03 -0000
From: Rob Herring <robh@kernel.org>
To: Ulf Hansson <ulf.hansson@linaro.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@linaro.org>, Anup Patel <anup@brainfault.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org, linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH] cpuidle: Use of_property_present() for testing DT property presence
Date: Fri, 10 Mar 2023 08:47:03 -0600
Message-Id: <20230310144703.1541888-1-robh@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_064742_672853_19502F9F 
X-CRM114-Status: GOOD (  13.09  )
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

It is preferred to use typed property access functions (i.e.
of_property_read_<type> functions) rather than low-level
of_get_property/of_find_property functions for reading properties. As
part of this, convert of_get_property/of_find_property calls to the
recently added of_property_present() helper when we just want to test
for presence of a property and nothing more.

Signed-off-by: Rob Herring <robh@kernel.org>
---
 drivers/cpuidle/cpuidle-psci-domain.c | 2 +-
 drivers/cpuidle/cpuidle-riscv-sbi.c   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/cpuidle/cpuidle-psci-domain.c b/drivers/cpuidle/cpuidle-psci-domain.c
index 6ad2954948a5..e875ddadc51b 100644
--- a/drivers/cpuidle/cpuidle-psci-domain.c
+++ b/drivers/cpuidle/cpuidle-psci-domain.c
@@ -165,7 +165,7 @@ static int psci_cpuidle_domain_probe(struct platform_device *pdev)
 	 * initialize a genpd/genpd-of-provider pair when it's found.
 	 */
 	for_each_child_of_node(np, node) {
-		if (!of_find_property(node, "#power-domain-cells", NULL))
+		if (!of_property_present(node, "#power-domain-cells"))
 			continue;
 
 		ret = psci_pd_init(node, use_osi);
diff --git a/drivers/cpuidle/cpuidle-riscv-sbi.c b/drivers/cpuidle/cpuidle-riscv-sbi.c
index be383f4b6855..1fab1abc6eb6 100644
--- a/drivers/cpuidle/cpuidle-riscv-sbi.c
+++ b/drivers/cpuidle/cpuidle-riscv-sbi.c
@@ -497,7 +497,7 @@ static int sbi_genpd_probe(struct device_node *np)
 	 * initialize a genpd/genpd-of-provider pair when it's found.
 	 */
 	for_each_child_of_node(np, node) {
-		if (!of_find_property(node, "#power-domain-cells", NULL))
+		if (!of_property_present(node, "#power-domain-cells"))
 			continue;
 
 		ret = sbi_pd_init(node);
@@ -548,8 +548,8 @@ static int sbi_cpuidle_probe(struct platform_device *pdev)
 	for_each_possible_cpu(cpu) {
 		np = of_cpu_device_node_get(cpu);
 		if (np &&
-		    of_find_property(np, "power-domains", NULL) &&
-		    of_find_property(np, "power-domain-names", NULL)) {
+		    of_property_present(np, "power-domains") &&
+		    of_property_present(np, "power-domain-names")) {
 			continue;
 		} else {
 			sbi_cpuidle_use_osi = false;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
