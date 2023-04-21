Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05F0AC7618E
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 03:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dKwWuRbYEjJeZBJdJMGcyoYXlg+sYIEutwmV00CfcbE=; b=P74oFiNXIIhCa9
	qluQqfPAHD0nVJxeCcTuY/UPAiptL/wVOpsdVpxRWyIj20Vv/6Gqe/GapjbVy9TvF9CAcSdghv/L2
	Lk1zxcUNrxeaEmF0u3HGmzASEY7n2Q6ioaS8w/+PdAqeQwRmOWmcmVa5R5K6fATHz+tHy0mcjWvMh
	M+XNvJr1oP/wfhdCE/RkWiuNNw6PHkYCwZVDdmbujocvQ8Cn/0ir6URcrzoR6698Bb6Couc2TH+wM
	ue9VsH8+vqfvG+a4Br/LPZtvCcx7qIfx51wtiPldwjBp9chTGGEMrr4dvIfVrGbvgg/Qwt0O7ZUmP
	E1CVwGuVFx6TROepLtFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEp-009W5P-13;
	Fri, 21 Apr 2023 03:15:07 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEg-009W25-2X
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 03:15:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id BD01A24E11A;
	Fri, 21 Apr 2023 11:14:34 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:34 +0800
Received: from localhost.localdomain (113.72.144.253) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:33 +0800
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
Subject: [PATCH v3 2/3] cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
Date: Fri, 21 Apr 2023 11:14:30 +0800
Message-ID: <20230421031431.23010-3-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230421031431.23010-1-mason.huo@starfivetech.com>
References: <20230421031431.23010-1-mason.huo@starfivetech.com>
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_201458_959962_01CC28CC 
X-CRM114-Status: GOOD (  10.07  )
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
index e85703651098..79537d0ed7cf 100644
--- a/drivers/cpufreq/cpufreq-dt-platdev.c
+++ b/drivers/cpufreq/cpufreq-dt-platdev.c
@@ -86,6 +86,8 @@ static const struct of_device_id allowlist[] __initconst = {
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
