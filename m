Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C826EC77B7A
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=EKyIY2QKqstNfvBYLyCQ0dAsxyNIkJb10fAhBc7YNZA=; b=ZCiQE+EPN3rpvu
	LnmEdpyo9wOPkfSY6PYJU9wdFUlbpxMFwSQDsaxAjCtPy9exys6N+icSvqXq8DN4NF3Sybd2Bi9GQ
	xvOVknERFWWElhKK/ngROjAcCUfZu8VQwva5WtVhg+6fSIQU0kkUuVpOeb22gzT3v8xuz60qpxVSa
	ewPVDdzolSSQn3gX2Lj6Ng8wSGnQQNVKnI02lyz74CBqBhm5LEP+1ukWXRRGpYDsHjIVxdMDOCRu3
	xOHlaspefF59gOkhoB3i9OtVGcdsutVT7IiLGk+GW/lvOaeBsr0lBUNgHRCqgmX5GCmj4/aItjH0l
	u7TrWwfbDrZ2fXnAf/2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNh-001MnC-0U;
	Tue, 06 Jun 2023 10:57:41 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNd-001Meb-2J
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 10:57:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 77B8C24E28F;
	Tue,  6 Jun 2023 18:56:59 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 18:56:59 +0800
Received: from localhost.localdomain (183.27.98.75) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 18:56:58 +0800
From: Mason Huo <mason.huo@starfivetech.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar
	<viresh.kumar@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Paul
 Walmsley" <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
CC: Shengyu Qu <wiagn233@outlook.com>, <linux-pm@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Mason Huo <mason.huo@starfivetech.com>
Subject: [PATCH v4 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
Date: Tue, 6 Jun 2023 18:56:55 +0800
Message-ID: <20230606105656.124355-3-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230606105656.124355-1-mason.huo@starfivetech.com>
References: <20230606105656.124355-1-mason.huo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [183.27.98.75]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_035737_898718_D5106BAC 
X-CRM114-Status: GOOD (  10.23  )
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

Add the compatible strings for supporting the generic
cpufreq driver on the StarFive JH7110 SoC.

Signed-off-by: Mason Huo <mason.huo@starfivetech.com>
---
 drivers/cpufreq/cpufreq-dt-platdev.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/cpufreq/cpufreq-dt-platdev.c b/drivers/cpufreq/cpufreq-dt-platdev.c
index 338cf6cc6596..14aa8281c7f4 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -85,6 +85,8 @@ static const struct of_device_id allowlist[] __initconst = {
 	{ .compatible = "st-ericsson,u9500", },
 	{ .compatible = "st-ericsson,u9540", },
 
+	{ .compatible = "starfive,jh7110", },
+
 	{ .compatible = "ti,omap2", },
 	{ .compatible = "ti,omap4", },
 	{ .compatible = "ti,omap5", },
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
