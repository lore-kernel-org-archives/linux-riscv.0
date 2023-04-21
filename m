Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 216D4C77B76
	for <linux-riscv@archiver.kernel.org>; Fri, 21 Apr 2023 03:15:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L3coD3oZRvrtSUHZjWKH1dw6/ez24Fm+pXHNvIqm4cY=; b=TOUHHvQ2C+i1Df
	aLoROkT6/SQgQuq2fvrAj/UciyKk8iPyZTzo1SktRpI2ggIyJs7JstSb0BL8so1I7+RiobgcpoGGk
	WWWlKGNlZnxGebDV2TDMJIx6c8qG1IwP/hS3WSKUBhXQiyo3de73MpO4D7LVxOA98VSy9Qyfi6TZk
	snAdVEWwOcDyk38Lj+7aQ3hxorU9r2vCZkhDbhzG+jVwVq6OKF8SXAMKO4etPzDg1rrepPiMcWwvo
	y+MRSBGp6Xh8fcLDwf6DCs6iwRYevwYi1Zw7imJvt68a4lChK9cMIpRU37KXZdNMsrLPEVOJtRlLe
	0vNKFzZ98PbJyOem7UMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEm-009W4p-1v;
	Fri, 21 Apr 2023 03:15:04 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pphEg-009W23-0d
	for linux-riscv@lists.infradead.org;
	Fri, 21 Apr 2023 03:15:00 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4D38824E1B7;
	Fri, 21 Apr 2023 11:14:33 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:33 +0800
Received: from localhost.localdomain (113.72.144.253) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 21 Apr
 2023 11:14:32 +0800
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
Subject: [PATCH v3 0/3] Add JH7110 cpufreq support
Date: Fri, 21 Apr 2023 11:14:28 +0800
Message-ID: <20230421031431.23010-1-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [113.72.144.253]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230420_201458_554841_2C124BA7 
X-CRM114-Status: GOOD (  11.32  )
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

The StarFive JH7110 SoC has four RISC-V cores,
and it supports up to 4 cpu frequency loads.

This patchset adds the compatible strings into the allowlist
for supporting the generic cpufreq driver on JH7110 SoC.
Also, it enables the axp15060 pmic for the cpu power source.

The series has been tested on the VisionFive 2 boards which
are equipped with JH7110 SoC and axp15060 pmic.


This patchset is based on v6.3-rc4 with these patches applied:
[1] ("Basic clock, reset & device tree support for StarFive JH7110 RISC-V SoC")
    https://lore.kernel.org/all/20230401111934.130844-1-hal.feng@starfivetech.com/
[2] ("Add X-Powers AXP15060 PMIC support")
    https://lore.kernel.org/all/TY3P286MB2611A814E580C96DC6F187B798969@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM/

Changes since v2:
- Fix the new blank line at EOF issue in dtsi.

Changes since v1:
- Fix dts node naming issues.
- Move clock properties of cpu node from <board>.dtsi to <soc>.dtsi.
- Follow the alphabetical order to place the cpufreq dt allowlist.

---
v1: https://lore.kernel.org/all/20230411083257.16155-1-mason.huo@starfivetech.com/
v2: https://lore.kernel.org/lkml/20230417063942.3141-1-mason.huo@starfivetech.com/

Mason Huo (3):
  riscv: dts: starfive: Enable axp15060 pmic for cpufreq
  cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
  riscv: dts: starfive: Add cpu scaling for JH7110 SoC

 .../jh7110-starfive-visionfive-2.dtsi         | 30 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c          |  2 ++
 3 files changed, 65 insertions(+)

base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
