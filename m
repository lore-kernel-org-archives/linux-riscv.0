Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8C10C77B72
	for <linux-riscv@archiver.kernel.org>; Mon, 17 Apr 2023 06:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=de5l7UcashuAdSldzynlN9GXhQWIWjYhnikTC0ut10o=; b=ajX5ey2/IlXUGn
	jJTRCz1WwON9fwCKlBr7N8lcK1OcFGsNJ1ay7pvF8UBE300EZwfzNH4Sh/ayxNJmXZN8wqStDQpUh
	sBDrVE6XK4qNgcK4o4Thkr5svUypoZQOejb+MKyI4bF40wx4MI0+B7lo+8q38JgcKsgpVc8O3aIxN
	C9dLShnADct6lnr9EbQNGeJLSVacP5EWsiengRGW9oV5bGpQ6tzepOSgP8b+bDjMMGxE0tH/adMtk
	6Ias8l1ce4TRSGeUmbYr2ZPBGSihNvz+orKoovITqJIIM0MgpRbUDh9XPVExdU2iq/LP1W1eukgCE
	joJqQ4e9ehdDLHTlGIEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIXa-00F4MN-1D;
	Mon, 17 Apr 2023 06:40:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1poIXX-00F4Fh-1V
	for linux-riscv@lists.infradead.org;
	Mon, 17 Apr 2023 06:40:41 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7344280D3;
	Mon, 17 Apr 2023 14:39:44 +0800 (CST)
Received: from EXMBX067.cuchost.com (172.16.6.67) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 14:39:44 +0800
Received: from localhost.localdomain (183.27.97.249) by EXMBX067.cuchost.com
 (172.16.6.67) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 17 Apr
 2023 14:39:43 +0800
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
Subject: [PATCH v2 0/3] Add JH7110 cpufreq support
Date: Mon, 17 Apr 2023 14:39:39 +0800
Message-ID: <20230417063942.3141-1-mason.huo@starfivetech.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Originating-IP: [183.27.97.249]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX067.cuchost.com
 (172.16.6.67)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230416_234039_809656_E104F48E 
X-CRM114-Status: GOOD (  10.60  )
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

Changes since v1:
- Fix dts node naming issues.
- Move clock properties of cpu node from <board>.dtsi to <soc>.dtsi.
- Follow the alphabetical order to place the cpufreq dt allowlist.

---
v1: https://lore.kernel.org/all/20230411083257.16155-1-mason.huo@starfivetech.com/

Mason Huo (3):
  riscv: dts: starfive: Enable axp15060 pmic for cpufreq
  cpufreq: dt-platdev: Add JH7110 SOC to the allowlist
  riscv: dts: starfive: Add cpu scaling for JH7110 SoC

 .../jh7110-starfive-visionfive-2.dtsi         | 31 +++++++++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 33 +++++++++++++++++++
 drivers/cpufreq/cpufreq-dt-platdev.c          |  2 ++
 3 files changed, 66 insertions(+)


base-commit: 197b6b60ae7bc51dd0814953c562833143b292aa
prerequisite-patch-id: 388b8adbb0fe2daf4d07a21eafd4f1bd50ce2403
prerequisite-patch-id: 1117ecaa40a353c667b71802ab34ecf9568d8bb2
prerequisite-patch-id: b00c6b21fbd0353d88b7c9b09093ba30b765f45b
prerequisite-patch-id: 08ec9027e8a5c6fdf201726833168c7464a9b94d
prerequisite-patch-id: fb5120248e48fe1faf053ae0b490c92507ec2b44
prerequisite-patch-id: 4b93d8d590b0a2abe7b4be5287232c494c35be4a
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: c09c4c68af017b8e5c97b515cb50b70c18a2e705
prerequisite-patch-id: 0df8ccb0e848c2df4c2da95026494bebecede92d
prerequisite-patch-id: 315303931e4b6499de7127a88113763f86e97e16
prerequisite-patch-id: 40cb8212ddb024c20593f73d8b87d9894877e172
prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
prerequisite-patch-id: d57cc467fb036241b9276320ff076c4a30d376d6
prerequisite-patch-id: 6e563d68bc5dbf951d4ced17897f9cc4d56169fe
prerequisite-patch-id: 61ec2caa21fd0fc60e57977f7d16d3f72b135745
prerequisite-patch-id: 1387a7e87b446329dfc21f3e575ceae7ebcf954c
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: 9007c8610fdcd387592475949864edde874c20a2
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 0a0ac5a8a90655b415f6b62e324f3db083cdaaee
prerequisite-patch-id: 4c285d814aa74358a697714eac4415f0bb32bdb3
prerequisite-patch-id: 62735ba4fc7ec7c4435b1b6c1e69abb2345cb0e8
prerequisite-patch-id: 7f653d6f4aebf56544aca906c2719f9d80cb1bb3
prerequisite-patch-id: 1936b8e48a4cb9b0fa4440f7ad25bf267beeeebf
prerequisite-patch-id: 5b39a469bff8f11ed582118ca4c456ba8ebcdcd9

-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
