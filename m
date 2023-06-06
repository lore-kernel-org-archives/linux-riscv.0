Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F32C7EE2F
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Jun 2023 10:57:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4RudLTh3ohtCoQ9/Dc2rYPH36JnZ8fmgsy4gYOYY53g=; b=o+/FmJdj3ARUZY
	J5cmXRjKUTeEDWkoyEETgS0FXkvLce8vVyBsWLGmBeOWYVH+qhJY1OLbFN4MZ7+rM6qjCGpkg02Qg
	p4EppBghr0qdhWZt63ea9fEaUxgMOS/JeZOeOENis3KN+ECDzN+iWtjul4vwwIO2/b/0pzphoe9UO
	faLgJMt3y7NorL0fdMmTXodHYeoxk/7GRZFkugFtDuNQEYB45eBmXtYV2NdWy2FHhycauNB6Qx5Wi
	hVBXdqDgE+RE4dzI+6Q30QF9RVtDTAA0zwMlCD0Io2Gerno4cbXAoVPuABI+aP6zEFNqCi48eoy03
	oDApmzE6tYlYDvbK39zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNe-001Mlk-1W;
	Tue, 06 Jun 2023 10:57:38 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6UNa-001Mf8-0D
	for linux-riscv@lists.infradead.org;
	Tue, 06 Jun 2023 10:57:37 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id DCC6B80B6;
	Tue,  6 Jun 2023 18:56:57 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 18:56:58 +0800
Received: from localhost.localdomain (183.27.98.75) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 6 Jun
 2023 18:56:56 +0800
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
Subject: [PATCH v4 0/3] Add JH7110 cpufreq support
Date: Tue, 6 Jun 2023 18:56:53 +0800
Message-ID: <20230606105656.124355-1-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [183.27.98.75]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230606_035734_252123_8875D7D8 
X-CRM114-Status: GOOD (  11.30  )
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

---
This patchset is based on v6.4-rc4 with these patches applied:
[1] ("regulator: Add X-Powers AXP15060/AXP313a PMIC support")
    https://lore.kernel.org/lkml/20230524000012.15028-1-andre.przywara@arm.com/

Changes since v3:
- Fix the dtb_check issues for axp15060 pmic dts configuration.

Changes since v2:
- Fix the new blank line at EOF issue in dtsi.

Changes since v1:
- Fix dts node naming issues.
- Move clock properties of cpu node from <board>.dtsi to <soc>.dtsi.
- Follow the alphabetical order to place the cpufreq dt allowlist.

Mason Huo (3):
  riscv: dts: starfive: Enable axp15060 pmic for cpufreq
  cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
  riscv: dts: starfive: Add cpu scaling for JH7110 SoC

 .../jh7110-starfive-visionfive-2.dtsi         | 33 +++++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c          |  2 ++
 3 files changed, 68 insertions(+)

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
